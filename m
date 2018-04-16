From: Michael Schmitz <schmitzmic@gmail.com>
Subject: [PATCH 05/10] net: ax88796: add interrupt status callback to platform data
Date: Tue, 17 Apr 2018 10:04:40 +1200
Message-ID: <1523916285-6057-6-git-send-email-schmitzmic@gmail.com>
References: <1523916285-6057-1-git-send-email-schmitzmic@gmail.com>
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <1523916285-6057-1-git-send-email-schmitzmic@gmail.com>
Sender: netdev-owner@vger.kernel.org
To: netdev@vger.kernel.org
Cc: linux-m68k@vger.kernel.org, Michael.Karcher@fu-berlin.de, Michael Schmitz <schmitzmic@gmail.com>, Michael Karcher <kernel@mkarcher.dialup.fu-berlin.de>
List-Id: linux-m68k@vger.kernel.org

To be able to tell the ax88796 driver whether it is sensible to enter
the 8390 interrupt handler, an "is this interrupt caused by the 88796"
callback has been added to the ax_plat_data structure (with NULL being
compatible to the previous behaviour).

Signed-off-by: Michael Karcher <kernel@mkarcher.dialup.fu-berlin.de>
Signed-off-by: Michael Schmitz <schmitzmic@gmail.com>
---
 drivers/net/ethernet/8390/ax88796.c |   23 +++++++++++++++++++++--
 include/net/ax88796.h               |    5 +++++
 2 files changed, 26 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/8390/ax88796.c b/drivers/net/ethernet/8390/ax88796.c
index 9159235..b6d5bec 100644
--- a/drivers/net/ethernet/8390/ax88796.c
+++ b/drivers/net/ethernet/8390/ax88796.c
@@ -167,6 +167,21 @@ static void ax_reset_8390(struct net_device *dev)
 	ei_outb(ENISR_RESET, addr + EN0_ISR);	/* Ack intr. */
 }
 
+/* Wrapper for __ei_interrupt for platforms that have a platform-specific
+ * way to find out whether the interrupt request might be caused by
+ * the ax88796 chip.
+ */
+static irqreturn_t ax_ei_interrupt_filtered(int irq, void *dev_id)
+{
+	struct net_device *dev = dev_id;
+	struct ax_device *ax = to_ax_dev(dev);
+	struct platform_device *pdev = to_platform_device(dev->dev.parent);
+
+	if (!ax->plat->check_irq(pdev))
+		return IRQ_NONE;
+
+	return ax_ei_interrupt(irq, dev_id);
+}
 
 static void ax_get_8390_hdr(struct net_device *dev, struct e8390_pkt_hdr *hdr,
 			    int ring_page)
@@ -402,8 +417,12 @@ static int ax_open(struct net_device *dev)
 	if (ret)
 		goto failed_request_irq;
 
-	ret = request_irq(dev->irq, ax_ei_interrupt, ax->irqflags,
-			  dev->name, dev);
+	if (ax->plat->check_irq)
+		ret = request_irq(dev->irq, ax_ei_interrupt_filtered,
+				  ax->irqflags, dev->name, dev);
+	else
+		ret = request_irq(dev->irq, ax_ei_interrupt, ax->irqflags,
+				  dev->name, dev);
 	if (ret)
 		goto failed_request_irq;
 
diff --git a/include/net/ax88796.h b/include/net/ax88796.h
index 26cc459..26412cd 100644
--- a/include/net/ax88796.h
+++ b/include/net/ax88796.h
@@ -12,6 +12,7 @@
 #define __NET_AX88796_PLAT_H
 
 struct net_device;
+struct platform_device;
 
 #define AXFLG_HAS_EEPROM		(1<<0)
 #define AXFLG_MAC_FROMDEV		(1<<1)	/* device already has MAC */
@@ -33,6 +34,10 @@ struct ax_plat_data {
 			const unsigned char *buf, int star_page);
 	void (*block_input)(struct net_device *dev, int count,
 			struct sk_buff *skb, int ring_offset);
+	/* returns nonzero if a pending interrupt request might by caused by
+	 * the ax88786. Handles all interrupts if set to NULL
+	 */
+	int (*check_irq)(struct platform_device *pdev);
 };
 
 #endif /* __NET_AX88796_PLAT_H */
-- 
1.7.0.4
