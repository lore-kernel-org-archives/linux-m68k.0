From: Michael Schmitz <schmitzmic@googlemail.com>
Subject: [PATCH 11/11 resend] Atari: enable/disable EtherNAT USB interrupt in isp116x-hcd
Date: Sun, 27 May 2012 14:57:59 +1200
Message-ID: <CAOmrzkJpDT1oeAaKtdDf2ODcZamijXN0B1ROKyxL-UGP9V7T7Q@mail.gmail.com>
References: <E1SXMKj-0002YC-7H@zirkon.biophys.uni-duesseldorf.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-ob0-f174.google.com ([209.85.214.174]:45513 "EHLO
	mail-ob0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752078Ab2E0C6A (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sat, 26 May 2012 22:58:00 -0400
Received: by obbtb18 with SMTP id tb18so3426097obb.19
        for <linux-m68k@vger.kernel.org>; Sat, 26 May 2012 19:58:00 -0700 (PDT)
In-Reply-To: <E1SXMKj-0002YC-7H@zirkon.biophys.uni-duesseldorf.de>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitz@zirkon.biophys.uni-duesseldorf.de>
Cc: linux-m68k@vger.kernel.org, geert@linux-m68k.org

Hi Geert,

the previous patch adding interrupt source enable/disable had a bug
preventing repeated module loading - please replace by this one.

Cheers,

  Michael


---
 drivers/usb/host/isp116x-hcd.c |   56 +++++++++++++++++++++++++++++++++++++++-
 1 files changed, 55 insertions(+), 1 deletions(-)

diff --git a/drivers/usb/host/isp116x-hcd.c b/drivers/usb/host/isp116x-hcd.c
index 9e65e30..0efd282 100644
--- a/drivers/usb/host/isp116x-hcd.c
+++ b/drivers/usb/host/isp116x-hcd.c
@@ -82,6 +82,10 @@ MODULE_LICENSE("GPL");

 static const char hcd_name[] = "isp116x-hcd";

+#ifdef CONFIG_ATARI
+static unsigned long *enat_cr;		/* EtherNAT CPLD control register for
USB interrupt enable */
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
+        *enat_cr = (*enat_cr) | 0x04;		/* EtherNAT control register,
enable interrupt for USB */
+#endif
 	isp116x_show_regs_log(isp116x);
 	spin_unlock_irqrestore(&isp116x->lock, flags);
 	return 0;
@@ -1539,6 +1559,9 @@ static int isp116x_remove(struct platform_device *pdev)
 	struct usb_hcd *hcd = platform_get_drvdata(pdev);
 	struct isp116x *isp116x;
 	struct resource *res;
+#ifdef CONFIG_ATARI
+	unsigned long enat_cr_phys;
+#endif

 	if (!hcd)
 		return 0;
@@ -1552,7 +1575,12 @@ static int isp116x_remove(struct platform_device *pdev)
 	iounmap(isp116x->addr_reg);
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	release_mem_region(res->start, 2);
-
+#ifdef CONFIG_ATARI
+	iounmap(enat_cr);
+        /* unmap & release EtherNAT CPLD control register - at 0x23
off board base address */
+        enat_cr_phys = (res->start & 0xffffff00) + 0x23;
+        release_mem_region(enat_cr_phys, 2);
+#endif
 	usb_put_hcd(hcd);
 	return 0;
 }
@@ -1567,6 +1595,9 @@ static int __devinit isp116x_probe(struct
platform_device *pdev)
 	int irq;
 	int ret = 0;
 	unsigned long irqflags;
+#ifdef CONFIG_ATARI
+	unsigned long enat_cr_phys;
+#endif

 	if (usb_disabled())
 		return -ENODEV;
@@ -1613,6 +1644,22 @@ static int __devinit isp116x_probe(struct
platform_device *pdev)
 		goto err4;
 	}

+#ifdef CONFIG_ATARI
+        /* map EtherNAT CPLD control register - at 0x23 off board
base address */
+        enat_cr_phys = (data->start & 0xffffff00) + 0x23;
+	if (!request_mem_region(enat_cr_phys, 2, hcd_name)) {
+		ret = -EBUSY;
+		goto err41;
+	}
+	enat_cr = ioremap(addr->start, resource_size(addr));
+	if (enat_cr == NULL) {
+		ret = -ENOMEM;
+		goto err42;
+        }
+	/* Disable USB interrupt in the EtherNat board */
+	*enat_cr = (*enat_cr) & 0xFB;
+#endif
+
 	/* allocate and initialize hcd */
 	hcd = usb_create_hcd(&isp116x_hc_driver, &pdev->dev, dev_name(&pdev->dev));
 	if (!hcd) {
@@ -1653,11 +1700,18 @@ static int __devinit isp116x_probe(struct
platform_device *pdev)

 	return 0;

+
       err7:
 	usb_remove_hcd(hcd);
       err6:
 	usb_put_hcd(hcd);
       err5:
+#ifdef CONFIG_ATARI
+	iounmap(enat_cr);
+      err42:
+	release_mem_region(enat_cr_phys, 2);
+      err41:
+#endif
 	iounmap(data_reg);
       err4:
 	release_mem_region(data->start, 2);
-- 
1.7.0.4
