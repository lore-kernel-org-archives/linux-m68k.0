From: Michael Schmitz <schmitzmic@gmail.com>
Subject: [PATCH 6/8] ax88796: add interrupt status callback to platform data
Date: Tue, 17 Nov 2015 12:33:15 +1300
Message-ID: <1447716797-20906-7-git-send-email-schmitzmic@gmail.com>
References: <1447716797-20906-1-git-send-email-schmitzmic@gmail.com>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pa0-f67.google.com ([209.85.220.67]:35105 "EHLO
	mail-pa0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752488AbbKPXdo (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 16 Nov 2015 18:33:44 -0500
Received: by padhk6 with SMTP id hk6so26584915pad.2
        for <linux-m68k@vger.kernel.org>; Mon, 16 Nov 2015 15:33:44 -0800 (PST)
In-Reply-To: <1447716797-20906-1-git-send-email-schmitzmic@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org
Cc: geert@linux-m68k.org, debian-68k@lists.debian.org, kernel@mkarcher.dialup.fu-berlin.de, Michael Schmitz <schmitzmic@gmail.com>

To be able to tell the ax88796 driver whether it is sensible to enter
the 8390 interrupt handler, an "is this interrupt caused by the 88796"
callback has been added to the ax_plat_data structure (with NULL being
compatible to the previous behaviour).

Signed-off-by: Michael Karcher <kernel@mkarcher.dialup.fu-berlin.de>
Signed-off-by: Michael Schmitz <schmitzmic@gmail.com>
---
 drivers/net/ethernet/8390/ax88796.c |   23 +++++++++++++++++++++--
 include/net/ax88796.h               |    4 ++++
 2 files changed, 25 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/8390/ax88796.c b/drivers/net/ethernet/8390/ax88796.c
index d45c032..020bcf7 100644
--- a/drivers/net/ethernet/8390/ax88796.c
+++ b/drivers/net/ethernet/8390/ax88796.c
@@ -166,6 +166,21 @@ static void ax_reset_8390(struct net_device *dev)
 	ei_outb(ENISR_RESET, addr + EN0_ISR);	/* Ack intr. */
 }
 
+/*
+ * Wrapper for __ei_interrupt for platforms that have a platform-specific
+ * way to find out whether the interrupt request might be caused by
+ * the ax88796 chip.
+ */
+static irqreturn_t ax_ei_interrupt_filtered(int irq, void *dev_id)
+{
+	struct net_device *dev = dev_id;
+	struct ax_device *ax = to_ax_dev(dev);
+	struct platform_device *pdev = to_platform_device(dev->dev.parent);
+	if (!ax->plat->check_irq(pdev))
+		return IRQ_NONE;
+
+	return ax_ei_interrupt(irq, dev_id);
+}
 
 static void ax_get_8390_hdr(struct net_device *dev, struct e8390_pkt_hdr *hdr,
 			    int ring_page)
@@ -498,8 +513,12 @@ static int ax_open(struct net_device *dev)
 	if (ret)
 		goto failed_request_irq;
 
-	ret = request_irq(dev->irq, ax_ei_interrupt, ax->irqflags,
-			  dev->name, dev);
+	if (ax->plat->check_irq)
+		ret = request_irq(dev->irq, ax_ei_interrupt_filtered,
+		                  ax->irqflags, dev->name, dev);
+	else
+		ret = request_irq(dev->irq, ax_ei_interrupt, ax->irqflags,
+				  dev->name, dev);
 	if (ret)
 		goto failed_request_irq;
 
diff --git a/include/net/ax88796.h b/include/net/ax88796.h
index 28d6a93..d5b24be 100644
--- a/include/net/ax88796.h
+++ b/include/net/ax88796.h
@@ -12,6 +12,7 @@
 #define __NET_AX88796_PLAT_H
 
 struct net_device;
+struct platform_device;
 
 #define AXFLG_HAS_EEPROM		(1<<0)
 #define AXFLG_MAC_FROMDEV		(1<<1)	/* device already has MAC */
@@ -31,6 +32,9 @@ struct ax_plat_data {
         /* uses default ax88796 buffer if set to NULL */
 	void (*block_output)(struct net_device *, int, const unsigned char *, int);
 	void (*block_input)(struct net_device *, int, struct sk_buff *, int);
+	/* returns nonzero if a pending interrupt request might by caused by
+	   the ax88786. Handles all interrupts if set to NULL */
+	int (*check_irq)(struct platform_device *);
 };
 
 #endif /* __NET_AX88796_PLAT_H */
-- 
1.7.0.4
