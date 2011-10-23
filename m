From: Finn Thain <fthain@telegraphics.com.au>
Subject: [PATCH 11/16] m68k/mac: fix baboon irq disable and shutdown
Date: Mon, 24 Oct 2011 01:11:19 +1100
Message-ID: <20111023141202.038766042@telegraphics.com.au>
References: <20111023141108.856998818@telegraphics.com.au>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from vm4.telegraphics.com.au ([98.124.60.149]:46064 "EHLO
	vps4.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755611Ab1JWOMG (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 23 Oct 2011 10:12:06 -0400
Content-Disposition: inline; filename=remove-baboon-irq-disabled
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org

The baboon_disabled hack is broken because it is missing an irq shutdown method. So releasing a Baboon irq kills the other Baboon irqs. But we don't really need this hack because we don't have media bay support and TREX uses a NuBus IRQ. Remove it.

Signed-off-by: Finn Thain <fthain@telegraphics.com.au>

Index: linux-m68k/arch/m68k/mac/baboon.c
===================================================================
--- linux-m68k.orig/arch/m68k/mac/baboon.c	2011-10-22 23:02:38.000000000 +1100
+++ linux-m68k/arch/m68k/mac/baboon.c	2011-10-22 23:02:39.000000000 +1100
@@ -18,7 +18,6 @@
 
 int baboon_present;
 static volatile struct baboon *baboon;
-static unsigned char baboon_disabled;
 
 #if 0
 extern int macide_ack_intr(struct ata_channel *);
@@ -84,37 +83,32 @@ static void baboon_irq(unsigned int irq,
 
 void __init baboon_register_interrupts(void)
 {
-	baboon_disabled = 0;
 	irq_set_chained_handler(IRQ_NUBUS_C, baboon_irq);
 }
 
 /*
- * The means for masking individual baboon interrupts remains a mystery, so
- * enable the umbrella interrupt only when no baboon interrupt is disabled.
+ * The means for masking individual Baboon interrupts remains a mystery.
+ * However, since we only use the IDE IRQ, we can just enable/disable all
+ * Baboon interrupts. If/when we handle more than one Baboon IRQ, we must
+ * either figure out how to mask them individually or else implement the
+ * same workaround that's used for NuBus slots (see nubus_disabled and
+ * via_nubus_irq_shutdown).
  */
 
 void baboon_irq_enable(int irq)
 {
-	int irq_idx = IRQ_IDX(irq);
-
 #ifdef DEBUG_IRQUSE
 	printk("baboon_irq_enable(%d)\n", irq);
 #endif
 
-	baboon_disabled &= ~(1 << irq_idx);
-	if (!baboon_disabled)
-		mac_irq_enable(irq_get_irq_data(IRQ_NUBUS_C));
+	mac_irq_enable(irq_get_irq_data(IRQ_NUBUS_C));
 }
 
 void baboon_irq_disable(int irq)
 {
-	int irq_idx = IRQ_IDX(irq);
-
 #ifdef DEBUG_IRQUSE
 	printk("baboon_irq_disable(%d)\n", irq);
 #endif
 
-	baboon_disabled |= 1 << irq_idx;
-	if (baboon_disabled)
-		mac_irq_disable(irq_get_irq_data(IRQ_NUBUS_C));
+	mac_irq_disable(irq_get_irq_data(IRQ_NUBUS_C));
 }
