From: Finn Thain <fthain@telegraphics.com.au>
Subject: [PATCH 09/16] m68k/mac: fix nubus slot irq disable and shutdown
Date: Mon, 24 Oct 2011 01:11:17 +1100
Message-ID: <20111023141152.548807273@telegraphics.com.au>
References: <20111023141108.856998818@telegraphics.com.au>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from vm4.telegraphics.com.au ([98.124.60.149]:46059 "EHLO
	vps4.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755587Ab1JWOL5 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 23 Oct 2011 10:11:57 -0400
Content-Disposition: inline; filename=fix-nubus-slot-irq
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org

Improve NuBus slot interrupt handling code and documentation. This patch fixes the NuBus NIC (mac8390) in my Quadra 700.

Signed-off-by: Finn Thain <fthain@telegraphics.com.au>

Index: linux-m68k/arch/m68k/mac/via.c
===================================================================
--- linux-m68k.orig/arch/m68k/mac/via.c	2011-10-22 23:02:38.000000000 +1100
+++ linux-m68k/arch/m68k/mac/via.c	2011-10-23 00:51:02.000000000 +1100
@@ -62,18 +62,47 @@ static int gIER,gIFR,gBufA,gBufB;
 #define MAC_CLOCK_LOW		(MAC_CLOCK_TICK&0xFF)
 #define MAC_CLOCK_HIGH		(MAC_CLOCK_TICK>>8)
 
-/* To disable a NuBus slot on Quadras we make that slot IRQ line an output set
- * high. On RBV we just use the slot interrupt enable register. On Macs with
- * genuine VIA chips we must use nubus_disabled to keep track of disabled slot
- * interrupts. When any slot IRQ is disabled we mask the (edge triggered) CA1
- * or "SLOTS" interrupt. When no slot is disabled, we unmask the CA1 interrupt.
- * So, on genuine VIAs, having more than one NuBus IRQ can mean trouble,
- * because closing one of those drivers can mask all of the NuBus interrupts.
- * Also, since we can't mask the unregistered slot IRQs on genuine VIAs, it's
- * possible to get interrupts from cards that MacOS or the ROM has configured
- * but we have not. FWIW, "Designing Cards and Drivers for Macintosh II and
- * Macintosh SE", page 9-8, says, a slot IRQ with no driver would crash MacOS.
+
+/*
+ * On Macs with a genuine VIA chip there is no way to mask an individual slot
+ * interrupt. This limitation also seems to apply to VIA clone logic cores in
+ * Quadra-like ASICs. (RBV and OSS machines don't have this limitation.)
+ *
+ * We used to fake it by configuring the relevent VIA pin as an output
+ * (to mask the interrupt) or input (to unmask). That scheme did not work on
+ * (at least) the Quadra 700. A NuBus card's /NMRQ signal is an open-collector
+ * circuit (see Designing Cards and Drivers for Macintosh II and Macintosh SE,
+ * p. 10-11 etc) but VIA outputs are not (see datasheet).
+ *
+ * Driving these outputs high must cause the VIA to source current and the
+ * card to sink current when it asserts /NMRQ. Current will flow but the pin
+ * voltage is uncertain and so the /NMRQ condition may still cause a transition
+ * at the VIA2 CA1 input (which explains the lost interrupts). A side effect
+ * is that a disabled slot IRQ can never be tested as pending or not.
+ *
+ * Driving these outputs low doesn't work either. All the slot /NMRQ lines are
+ * (active low) OR'd together to generate the CA1 (aka "SLOTS") interrupt (see
+ * The Guide To Macintosh Family Hardware, 2nd edition p. 167). If we drive a
+ * disabled /NMRQ line low, the falling edge immediately triggers a CA1
+ * interrupt and all slot interrupts after that will generate no transition
+ * and therefore no interrupt, even after being re-enabled.
+ *
+ * So we make the VIA port A I/O lines inputs and use nubus_disabled to keep
+ * track of their states. When any slot IRQ becomes disabled we mask the CA1
+ * umbrella interrupt. Only when all slot IRQs become enabled do we unmask
+ * the CA1 interrupt. It must remain enabled even when cards have no interrupt
+ * handler registered. Drivers must therefore disable a slot interrupt at the
+ * device before they call free_irq (like shared and autovector interrupts).
+ *
+ * There is also a related problem when MacOS is used to boot Linux. A network
+ * card brought up by a MacOS driver may raise an interrupt while Linux boots.
+ * This can be fatal since it can't be handled until the right driver loads
+ * (if such a driver exists at all). Apparently related to this hardware
+ * limitation, "Designing Cards and Drivers", p. 9-8, says that a slot
+ * interrupt with no driver would crash MacOS (the book was written before
+ * the appearance of Macs with RBV or OSS).
  */
+
 static u8 nubus_disabled;
 
 void via_debug_dump(void);
@@ -353,34 +382,55 @@ void __init via_nubus_init(void)
 		via2[gBufB] |= 0x02;
 	}
 
-	/* Disable all the slot interrupts (where possible). */
+	/*
+	 * Disable the slot interrupts. On some hardware that's not possible.
+	 * On some hardware it's unclear what all of these I/O lines do.
+	 */
 
 	switch (macintosh_config->via_type) {
 	case MAC_VIA_II:
-		/* Just make the port A lines inputs. */
-		switch(macintosh_config->ident) {
-		case MAC_MODEL_II:
-		case MAC_MODEL_IIX:
-		case MAC_MODEL_IICX:
-		case MAC_MODEL_SE30:
-			/* The top two bits are RAM size outputs. */
-			via2[vDirA] &= 0xC0;
-			break;
-		default:
-			via2[vDirA] &= 0x80;
-		}
+	case MAC_VIA_QUADRA:
+		pr_debug("VIA2 vDirA is 0x%02X\n", via2[vDirA]);
 		break;
 	case MAC_VIA_IIci:
 		/* RBV. Disable all the slot interrupts. SIER works like IER. */
 		via2[rSIER] = 0x7F;
 		break;
+	}
+}
+
+void via_nubus_irq_startup(int irq)
+{
+	int irq_idx = IRQ_IDX(irq);
+
+	switch (macintosh_config->via_type) {
+	case MAC_VIA_II:
 	case MAC_VIA_QUADRA:
-		/* Disable the inactive slot interrupts by making those lines outputs. */
-		if ((macintosh_config->adb_type != MAC_ADB_PB1) &&
-		    (macintosh_config->adb_type != MAC_ADB_PB2)) {
-			via2[vBufA] |= 0x7F;
-			via2[vDirA] |= 0x7F;
+		/* Make the port A line an input. Probably redundant. */
+		if (macintosh_config->via_type == MAC_VIA_II) {
+			/* The top two bits are RAM size outputs. */
+			via2[vDirA] &= 0xC0 | ~(1 << irq_idx);
+		} else {
+			/* Allow NuBus slots 9 through F. */
+			via2[vDirA] &= 0x80 | ~(1 << irq_idx);
 		}
+		/* fall through */
+	case MAC_VIA_IIci:
+		via_irq_enable(irq);
+		break;
+	}
+}
+
+void via_nubus_irq_shutdown(int irq)
+{
+	switch (macintosh_config->via_type) {
+	case MAC_VIA_II:
+	case MAC_VIA_QUADRA:
+		/* Ensure that the umbrella CA1 interrupt remains enabled. */
+		via_irq_enable(irq);
+		break;
+	case MAC_VIA_IIci:
+		via_irq_disable(irq);
 		break;
 	}
 }
@@ -506,6 +556,7 @@ void via_irq_enable(int irq) {
 	} else if (irq_src == 7) {
 		switch (macintosh_config->via_type) {
 		case MAC_VIA_II:
+		case MAC_VIA_QUADRA:
 			nubus_disabled &= ~(1 << irq_idx);
 			/* Enable the CA1 interrupt when no slot is disabled. */
 			if (!nubus_disabled)
@@ -517,14 +568,6 @@ void via_irq_enable(int irq) {
 			 */
 			via2[rSIER] = IER_SET_BIT(irq_idx);
 			break;
-		case MAC_VIA_QUADRA:
-			/* Make the port A line an input to enable the slot irq.
-			 * But not on PowerBooks, that's ADB.
-			 */
-			if ((macintosh_config->adb_type != MAC_ADB_PB1) &&
-			    (macintosh_config->adb_type != MAC_ADB_PB2))
-				via2[vDirA] &= ~(1 << irq_idx);
-			break;
 		}
 	}
 }
@@ -544,6 +587,7 @@ void via_irq_disable(int irq) {
 	} else if (irq_src == 7) {
 		switch (macintosh_config->via_type) {
 		case MAC_VIA_II:
+		case MAC_VIA_QUADRA:
 			nubus_disabled |= 1 << irq_idx;
 			if (nubus_disabled)
 				via2[gIER] = IER_CLR_BIT(1);
@@ -551,11 +595,6 @@ void via_irq_disable(int irq) {
 		case MAC_VIA_IIci:
 			via2[rSIER] = IER_CLR_BIT(irq_idx);
 			break;
-		case MAC_VIA_QUADRA:
-			if ((macintosh_config->adb_type != MAC_ADB_PB1) &&
-			    (macintosh_config->adb_type != MAC_ADB_PB2))
-				via2[vDirA] |= 1 << irq_idx;
-			break;
 		}
 	}
 }
Index: linux-m68k/arch/m68k/mac/macints.c
===================================================================
--- linux-m68k.orig/arch/m68k/mac/macints.c	2011-10-22 23:02:38.000000000 +1100
+++ linux-m68k/arch/m68k/mac/macints.c	2011-10-23 00:51:05.000000000 +1100
@@ -151,10 +151,15 @@ irqreturn_t mac_debug_handler(int, void
 
 /* #define DEBUG_MACINTS */
 
+static unsigned int mac_irq_startup(struct irq_data *);
+static void mac_irq_shutdown(struct irq_data *);
+
 static struct irq_chip mac_irq_chip = {
 	.name		= "mac",
 	.irq_enable	= mac_irq_enable,
 	.irq_disable	= mac_irq_disable,
+	.irq_startup	= mac_irq_startup,
+	.irq_shutdown	= mac_irq_shutdown,
 };
 
 void __init mac_init_IRQ(void)
@@ -274,6 +279,28 @@ void mac_irq_disable(struct irq_data *da
 	}
 }
 
+static unsigned int mac_irq_startup(struct irq_data *data)
+{
+	int irq = data->irq;
+
+	if (IRQ_SRC(irq) == 7 && !oss_present)
+		via_nubus_irq_startup(irq);
+	else
+		mac_irq_enable(data);
+
+	return 0;
+}
+
+static void mac_irq_shutdown(struct irq_data *data)
+{
+	int irq = data->irq;
+
+	if (IRQ_SRC(irq) == 7 && !oss_present)
+		via_nubus_irq_shutdown(irq);
+	else
+		mac_irq_disable(data);
+}
+
 static int num_debug[8];
 
 irqreturn_t mac_debug_handler(int irq, void *dev_id)
Index: linux-m68k/arch/m68k/include/asm/mac_via.h
===================================================================
--- linux-m68k.orig/arch/m68k/include/asm/mac_via.h	2011-10-22 23:02:38.000000000 +1100
+++ linux-m68k/arch/m68k/include/asm/mac_via.h	2011-10-22 23:02:39.000000000 +1100
@@ -257,6 +257,8 @@ extern int rbv_present,via_alt_mapping;
 extern void via_register_interrupts(void);
 extern void via_irq_enable(int);
 extern void via_irq_disable(int);
+extern void via_nubus_irq_startup(int irq);
+extern void via_nubus_irq_shutdown(int irq);
 extern void via1_irq(unsigned int irq, struct irq_desc *desc);
 extern void via1_set_head(int);
 extern int via2_scsi_drq_pending(void);
