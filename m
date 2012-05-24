From: Michael Schmitz <schmitz@zirkon.biophys.uni-duesseldorf.de>
Subject: [PATCH 11/11] Atari: enable/disable EtherNAT USB interrupt in
 isp116x-hcd
Date: Thu, 24 May 2012 02:55:17 +0200
Message-ID: <E1SXMKj-0002YC-7H@zirkon.biophys.uni-duesseldorf.de>
Content-Transfer-Encoding: 7BIT
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mailout-venus.uni-duesseldorf.de ([134.99.128.32]:36106 "EHLO
	mail.rz.uni-duesseldorf.de" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1751171Ab2EXAzS (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>);
	Wed, 23 May 2012 20:55:18 -0400
Received: from pmxchannel-daemon.mail.rz.uni-duesseldorf.de by
 mail.rz.uni-duesseldorf.de
 (Sun Java(tm) System Messaging Server 6.3-11.01 (built Feb 12 2010; 32bit))
 id <0M4I00D00585AP00@mail.rz.uni-duesseldorf.de> for
 linux-m68k@vger.kernel.org; Thu, 24 May 2012 02:55:17 +0200 (MEST)
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org
Cc: geert@linux-m68k.org

>From ca76d7b58f133bd3f4cf0519ad27fbddf37562a6 Mon Sep 17 00:00:00 2001
From: Michael Schmitz <schmitz@debian.org>
Date: Wed, 23 May 2012 13:52:14 +1200
Subject: [PATCH 11/11] [m68k] Atari: add ISP1160 interrupt enable/disable to isp116x-hcd driver

---
 drivers/usb/host/isp116x-hcd.c |   36 ++++++++++++++++++++++++++++++++++++
 1 files changed, 36 insertions(+), 0 deletions(-)

diff --git a/drivers/usb/host/isp116x-hcd.c b/drivers/usb/host/isp116x-hcd.c
index 9e65e30..7ce1546 100644
--- a/drivers/usb/host/isp116x-hcd.c
+++ b/drivers/usb/host/isp116x-hcd.c
@@ -82,6 +82,10 @@ MODULE_LICENSE("GPL");
 
 static const char hcd_name[] = "isp116x-hcd";
 
+#ifdef CONFIG_ATARI
+static unsigned long *enat_cr;		/* EtherNAT CPLD control register for USB interrupt enable */
+#endif
+
 /*-----------------------------------------------------------------*/
 
 /*
@@ -594,6 +598,10 @@ static irqreturn_t isp116x_irq(struct usb_hcd *hcd)
 	irqreturn_t ret = IRQ_NONE;
 
 	spin_lock(&isp116x->lock);
+#ifdef CONFIG_ATARI
+	/* Shut out all further interrupts */
+	*enat_cr = (*enat_cr) & 0xFB;
+#endif
 	isp116x_write_reg16(isp116x, HCuPINTENB, 0);
 	irqstat = isp116x_read_reg16(isp116x, HCuPINT);
 	isp116x_write_reg16(isp116x, HCuPINT, irqstat);
@@ -635,6 +643,10 @@ static irqreturn_t isp116x_irq(struct usb_hcd *hcd)
 
 	isp116x_write_reg16(isp116x, HCuPINTENB, isp116x->irqenb);
       done:
+#ifdef CONFIG_ATARI
+	/* Enable CPLD USB interrupts */
+	*enat_cr = (*enat_cr)  | 0x04;
+#endif
 	spin_unlock(&isp116x->lock);
 	return ret;
 }
@@ -1291,6 +1303,11 @@ static void isp116x_stop(struct usb_hcd *hcd)
 	u32 val;
 
 	spin_lock_irqsave(&isp116x->lock, flags);
+
+#ifdef CONFIG_ATARI
+	/* EtherNAT control register, disable interrupt for USB */
+	*enat_cr = (*enat_cr) & 0xFB;
+#endif
 	isp116x_write_reg16(isp116x, HCuPINTENB, 0);
 
 	/* Switch off ports' power, some devices don't come up
@@ -1394,6 +1411,9 @@ static int isp116x_start(struct usb_hcd *hcd)
 	isp116x_write_reg32(isp116x, HCRHPORT1, RH_PS_CCS);
 	isp116x_write_reg32(isp116x, HCRHPORT2, RH_PS_CCS);
 
+#ifdef CONFIG_ATARI
+        *enat_cr = (*enat_cr) | 0x04;		/* EtherNAT control register, enable interrupt for USB */
+#endif
 	isp116x_show_regs_log(isp116x);
 	spin_unlock_irqrestore(&isp116x->lock, flags);
 	return 0;
@@ -1567,6 +1587,9 @@ static int __devinit isp116x_probe(struct platform_device *pdev)
 	int irq;
 	int ret = 0;
 	unsigned long irqflags;
+#ifdef CONFIG_ATARI
+	unsigned long enat_cr_phys;
+#endif
 
 	if (usb_disabled())
 		return -ENODEV;
@@ -1594,6 +1617,19 @@ static int __devinit isp116x_probe(struct platform_device *pdev)
 		goto err1;
 	}
 
+#ifdef CONFIG_ATARI
+        /* map EtherNAT CPLD control register - at 0x23 off board base address */
+        enat_cr_phys = (data->start & 0xffffff00) + 0x23;
+	if (!request_mem_region(enat_cr_phys, 2, hcd_name)) {
+		ret = -EBUSY;
+		goto err1;
+	}
+	enat_cr = ioremap(addr->start, resource_size(addr));
+
+	/* Disable USB interrupt in the EtherNat board */
+	*enat_cr = (*enat_cr) & 0xFB;
+#endif
+
 	if (!request_mem_region(addr->start, 2, hcd_name)) {
 		ret = -EBUSY;
 		goto err1;
-- 
1.7.0.4
