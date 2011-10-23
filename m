From: Finn Thain <fthain@telegraphics.com.au>
Subject: [PATCH 10/16] m68k/mac: oss irq fixes
Date: Mon, 24 Oct 2011 01:11:18 +1100
Message-ID: <20111023141157.458769861@telegraphics.com.au>
References: <20111023141108.856998818@telegraphics.com.au>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from vm4.telegraphics.com.au ([98.124.60.149]:46061 "EHLO
	vps4.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755611Ab1JWOMC (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 23 Oct 2011 10:12:02 -0400
Content-Disposition: inline; filename=fix-oss-irqs
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org

The IOP driver calls into the OSS driver to enable its IRQ. This undesirable coupling between drivers only exists because the OSS driver doesn't correctly handle all of its machspec IRQs.

Fix OSS handling of enable/disable for VIA1 IRQs (8 thru 15) which includes MAC_IRQ_ADB.

Back when I implemented pmac_zilog support I redefined IRQ_MAC_SCC incorrectly. Change this to a machspec IRQ so that it works on OSS.

Clean up the unused OSS audio IRQ and OSS_IRQLEV_* cruft that only confuses things.

Fix the OSS description in macints.c and remove an obsolete comment.

Don't enable the VIA1 irq before registering the handler.

Signed-off-by: Finn Thain <fthain@telegraphics.com.au>

Index: linux-m68k/arch/m68k/mac/macints.c
===================================================================
--- linux-m68k.orig/arch/m68k/mac/macints.c	2011-10-22 23:02:39.000000000 +1100
+++ linux-m68k/arch/m68k/mac/macints.c	2011-10-23 00:50:51.000000000 +1100
@@ -26,10 +26,6 @@
  *		  - slot 6: timer 1 (not on IIci)
  *		  - slot 7: status of IRQ; signals 'any enabled int.'
  *
- *	2	- OSS (IIfx only?)
- *		  - slot 0: SCSI interrupt
- *		  - slot 1: Sound interrupt
- *
  * Levels 3-6 vary by machine type. For VIA or RBV Macintoshes:
  *
  *	3	- unused (?)
@@ -54,21 +50,18 @@
  *
  *	6	- VIA1
  *
- * For OSS Macintoshes (IIfx only at this point):
+ * For OSS Macintoshes (IIfx only), we apply an interrupt mapping similar to
+ * the Quadra (A/UX) mapping:
  *
- *	3	- Nubus interrupt
- *		  - slot 0: Slot $9
- *		  - slot 1: Slot $A
- *		  - slot 2: Slot $B
- *		  - slot 3: Slot $C
- *		  - slot 4: Slot $D
- *		  - slot 5: Slot $E
+ *	1	- ISM IOP (ADB)
  *
- *	4	- SCC IOP
+ *	2	- SCSI
  *
- *	5	- ISM IOP (ADB?)
+ *	3	- NuBus
  *
- *	6	- unused
+ *	4	- SCC IOP
+ *
+ *	6	- VIA1
  *
  * For PSC Macintoshes (660AV, 840AV):
  *
@@ -112,14 +105,6 @@
  *   case. They're hidden behind the Nubus slot $C interrupt thus adding a
  *   third layer of indirection. Why oh why did the Apple engineers do that?
  *
- * - We support "fast" and "slow" handlers, just like the Amiga port. The
- *   fast handlers are called first and with all interrupts disabled. They
- *   are expected to execute quickly (hence the name). The slow handlers are
- *   called last with interrupts enabled and the interrupt level restored.
- *   They must therefore be reentrant.
- *
- *   TODO:
- *
  */
 
 #include <linux/types.h>
@@ -216,8 +201,6 @@ void mac_irq_enable(struct irq_data *dat
 
 	switch(irq_src) {
 	case 1:
-		via_irq_enable(irq);
-		break;
 	case 2:
 	case 7:
 		if (oss_present)
@@ -226,6 +209,7 @@ void mac_irq_enable(struct irq_data *dat
 			via_irq_enable(irq);
 		break;
 	case 3:
+	case 4:
 	case 5:
 	case 6:
 		if (psc_present)
@@ -233,10 +217,6 @@ void mac_irq_enable(struct irq_data *dat
 		else if (oss_present)
 			oss_irq_enable(irq);
 		break;
-	case 4:
-		if (psc_present)
-			psc_irq_enable(irq);
-		break;
 	case 8:
 		if (baboon_present)
 			baboon_irq_enable(irq);
@@ -251,8 +231,6 @@ void mac_irq_disable(struct irq_data *da
 
 	switch(irq_src) {
 	case 1:
-		via_irq_disable(irq);
-		break;
 	case 2:
 	case 7:
 		if (oss_present)
@@ -261,6 +239,7 @@ void mac_irq_disable(struct irq_data *da
 			via_irq_disable(irq);
 		break;
 	case 3:
+	case 4:
 	case 5:
 	case 6:
 		if (psc_present)
@@ -268,10 +247,6 @@ void mac_irq_disable(struct irq_data *da
 		else if (oss_present)
 			oss_irq_disable(irq);
 		break;
-	case 4:
-		if (psc_present)
-			psc_irq_disable(irq);
-		break;
 	case 8:
 		if (baboon_present)
 			baboon_irq_disable(irq);
Index: linux-m68k/arch/m68k/mac/oss.c
===================================================================
--- linux-m68k.orig/arch/m68k/mac/oss.c	2011-10-22 23:02:38.000000000 +1100
+++ linux-m68k/arch/m68k/mac/oss.c	2011-10-22 23:02:39.000000000 +1100
@@ -1,5 +1,5 @@
 /*
- *	OSS handling
+ *	Operating System Services (OSS) chip handling
  *	Written by Joshua M. Thompson (funaho@jurai.org)
  *
  *
@@ -49,10 +49,8 @@ void __init oss_init(void)
 	/* do this by setting the source's interrupt level to zero. */
 
 	for (i = 0; i <= OSS_NUM_SOURCES; i++) {
-		oss->irq_level[i] = OSS_IRQLEV_DISABLED;
+		oss->irq_level[i] = 0;
 	}
-	/* If we disable VIA1 here, we never really handle it... */
-	oss->irq_level[OSS_VIA1] = OSS_IRQLEV_VIA1;
 }
 
 /*
@@ -64,17 +62,13 @@ void __init oss_nubus_init(void)
 }
 
 /*
- * Handle miscellaneous OSS interrupts. Right now that's just sound
- * and SCSI; everything else is routed to its own autovector IRQ.
+ * Handle miscellaneous OSS interrupts.
  */
 
 static void oss_irq(unsigned int irq, struct irq_desc *desc)
 {
-	int events;
-
-	events = oss->irq_pending & (OSS_IP_SOUND|OSS_IP_SCSI);
-	if (!events)
-		return;
+	int events = oss->irq_pending &
+	             (OSS_IP_IOPSCC | OSS_IP_SCSI | OSS_IP_IOPISM);
 
 #ifdef DEBUG_IRQS
 	if ((console_loglevel == 10) && !(events & OSS_IP_SCSI)) {
@@ -82,16 +76,20 @@ static void oss_irq(unsigned int irq, st
 			(int) oss->irq_pending);
 	}
 #endif
-	/* FIXME: how do you clear a pending IRQ?    */
 
-	if (events & OSS_IP_SOUND) {
-		oss->irq_pending &= ~OSS_IP_SOUND;
-		/* FIXME: call sound handler */
-	} else if (events & OSS_IP_SCSI) {
+	if (events & OSS_IP_IOPSCC) {
+		oss->irq_pending &= ~OSS_IP_IOPSCC;
+		generic_handle_irq(IRQ_MAC_SCC);
+	}
+
+	if (events & OSS_IP_SCSI) {
 		oss->irq_pending &= ~OSS_IP_SCSI;
 		generic_handle_irq(IRQ_MAC_SCSI);
-	} else {
-		/* FIXME: error check here? */
+	}
+
+	if (events & OSS_IP_IOPISM) {
+		oss->irq_pending &= ~OSS_IP_IOPISM;
+		generic_handle_irq(IRQ_MAC_ADB);
 	}
 }
 
@@ -130,14 +128,29 @@ static void oss_nubus_irq(unsigned int i
 
 /*
  * Register the OSS and NuBus interrupt dispatchers.
+ *
+ * This IRQ mapping is laid out with two things in mind: first, we try to keep
+ * things on their own levels to avoid having to do double-dispatches. Second,
+ * the levels match as closely as possible the alternate IRQ mapping mode (aka
+ * "A/UX mode") available on some VIA machines.
  */
 
+#define OSS_IRQLEV_IOPISM    IRQ_AUTO_1
+#define OSS_IRQLEV_SCSI      IRQ_AUTO_2
+#define OSS_IRQLEV_NUBUS     IRQ_AUTO_3
+#define OSS_IRQLEV_IOPSCC    IRQ_AUTO_4
+#define OSS_IRQLEV_VIA1      IRQ_AUTO_6
+
 void __init oss_register_interrupts(void)
 {
-	irq_set_chained_handler(OSS_IRQLEV_SCSI, oss_irq);
-	irq_set_chained_handler(OSS_IRQLEV_NUBUS, oss_nubus_irq);
-	irq_set_chained_handler(OSS_IRQLEV_SOUND, oss_irq);
-	irq_set_chained_handler(OSS_IRQLEV_VIA1, via1_irq);
+	irq_set_chained_handler(OSS_IRQLEV_IOPISM, oss_irq);
+	irq_set_chained_handler(OSS_IRQLEV_SCSI,   oss_irq);
+	irq_set_chained_handler(OSS_IRQLEV_NUBUS,  oss_nubus_irq);
+	irq_set_chained_handler(OSS_IRQLEV_IOPSCC, oss_irq);
+	irq_set_chained_handler(OSS_IRQLEV_VIA1,   via1_irq);
+
+	/* OSS_VIA1 gets enabled here because it has no machspec interrupt. */
+	oss->irq_level[OSS_VIA1] = IRQ_AUTO_6;
 }
 
 /*
@@ -156,13 +169,13 @@ void oss_irq_enable(int irq) {
 	switch(irq) {
 		case IRQ_MAC_SCC:
 			oss->irq_level[OSS_IOPSCC] = OSS_IRQLEV_IOPSCC;
-			break;
+			return;
 		case IRQ_MAC_ADB:
 			oss->irq_level[OSS_IOPISM] = OSS_IRQLEV_IOPISM;
-			break;
+			return;
 		case IRQ_MAC_SCSI:
 			oss->irq_level[OSS_SCSI] = OSS_IRQLEV_SCSI;
-			break;
+			return;
 		case IRQ_NUBUS_9:
 		case IRQ_NUBUS_A:
 		case IRQ_NUBUS_B:
@@ -171,13 +184,11 @@ void oss_irq_enable(int irq) {
 		case IRQ_NUBUS_E:
 			irq -= NUBUS_SOURCE_BASE;
 			oss->irq_level[irq] = OSS_IRQLEV_NUBUS;
-			break;
-#ifdef DEBUG_IRQUSE
-		default:
-			printk("%s unknown irq %d\n", __func__, irq);
-			break;
-#endif
+			return;
 	}
+
+	if (IRQ_SRC(irq) == 1)
+		via_irq_enable(irq);
 }
 
 /*
@@ -193,14 +204,14 @@ void oss_irq_disable(int irq) {
 #endif
 	switch(irq) {
 		case IRQ_MAC_SCC:
-			oss->irq_level[OSS_IOPSCC] = OSS_IRQLEV_DISABLED;
-			break;
+			oss->irq_level[OSS_IOPSCC] = 0;
+			return;
 		case IRQ_MAC_ADB:
-			oss->irq_level[OSS_IOPISM] = OSS_IRQLEV_DISABLED;
-			break;
+			oss->irq_level[OSS_IOPISM] = 0;
+			return;
 		case IRQ_MAC_SCSI:
-			oss->irq_level[OSS_SCSI] = OSS_IRQLEV_DISABLED;
-			break;
+			oss->irq_level[OSS_SCSI] = 0;
+			return;
 		case IRQ_NUBUS_9:
 		case IRQ_NUBUS_A:
 		case IRQ_NUBUS_B:
@@ -208,12 +219,10 @@ void oss_irq_disable(int irq) {
 		case IRQ_NUBUS_D:
 		case IRQ_NUBUS_E:
 			irq -= NUBUS_SOURCE_BASE;
-			oss->irq_level[irq] = OSS_IRQLEV_DISABLED;
-			break;
-#ifdef DEBUG_IRQUSE
-		default:
-			printk("%s unknown irq %d\n", __func__, irq);
-			break;
-#endif
+			oss->irq_level[irq] = 0;
+			return;
 	}
+
+	if (IRQ_SRC(irq) == 1)
+		via_irq_disable(irq);
 }
Index: linux-m68k/arch/m68k/mac/iop.c
===================================================================
--- linux-m68k.orig/arch/m68k/mac/iop.c	2011-10-22 23:02:38.000000000 +1100
+++ linux-m68k/arch/m68k/mac/iop.c	2011-10-22 23:02:39.000000000 +1100
@@ -115,7 +115,6 @@
 #include <asm/macintosh.h>
 #include <asm/macints.h>
 #include <asm/mac_iop.h>
-#include <asm/mac_oss.h>
 
 /*#define DEBUG_IOP*/
 
@@ -149,8 +148,6 @@ static struct listener iop_listeners[NUM
 
 irqreturn_t iop_ism_irq(int, void *);
 
-extern void oss_irq_enable(int);
-
 /*
  * Private access functions
  */
@@ -304,11 +301,10 @@ void __init iop_init(void)
 void __init iop_register_interrupts(void)
 {
 	if (iop_ism_present) {
-		if (oss_present) {
-			if (request_irq(OSS_IRQLEV_IOPISM, iop_ism_irq, 0,
+		if (macintosh_config->ident == MAC_MODEL_IIFX) {
+			if (request_irq(IRQ_MAC_ADB, iop_ism_irq, 0,
 					"ISM IOP", (void *)IOP_NUM_ISM))
 				pr_err("Couldn't register ISM IOP interrupt\n");
-			oss_irq_enable(IRQ_MAC_ADB);
 		} else {
 			if (request_irq(IRQ_VIA2_0, iop_ism_irq, 0, "ISM IOP",
 					(void *)IOP_NUM_ISM))
Index: linux-m68k/arch/m68k/include/asm/mac_oss.h
===================================================================
--- linux-m68k.orig/arch/m68k/include/asm/mac_oss.h	2011-10-22 23:02:38.000000000 +1100
+++ linux-m68k/arch/m68k/include/asm/mac_oss.h	2011-10-22 23:02:39.000000000 +1100
@@ -58,25 +58,6 @@
 
 #define OSS_POWEROFF	0x80
 
-/*
- * OSS Interrupt levels for various sub-systems
- *
- * This mapping is laid out with two things in mind: first, we try to keep
- * things on their own levels to avoid having to do double-dispatches. Second,
- * the levels match as closely as possible the alternate IRQ mapping mode (aka
- * "A/UX mode") available on some VIA machines.
- */
-
-#define OSS_IRQLEV_DISABLED	0
-#define OSS_IRQLEV_IOPISM	1	/* ADB? */
-#define OSS_IRQLEV_SCSI		IRQ_AUTO_2
-#define OSS_IRQLEV_NUBUS	IRQ_AUTO_3	/* keep this on its own level */
-#define OSS_IRQLEV_IOPSCC	IRQ_AUTO_4	/* matches VIA alternate mapping */
-#define OSS_IRQLEV_SOUND	IRQ_AUTO_5	/* matches VIA alternate mapping */
-#define OSS_IRQLEV_60HZ		6	/* matches VIA alternate mapping */
-#define OSS_IRQLEV_VIA1		IRQ_AUTO_6	/* matches VIA alternate mapping */
-#define OSS_IRQLEV_PARITY	7	/* matches VIA alternate mapping */
-
 #ifndef __ASSEMBLY__
 
 struct mac_oss {
Index: linux-m68k/arch/m68k/mac/config.c
===================================================================
--- linux-m68k.orig/arch/m68k/mac/config.c	2011-10-22 23:02:38.000000000 +1100
+++ linux-m68k/arch/m68k/mac/config.c	2011-10-23 00:51:03.000000000 +1100
@@ -893,8 +893,14 @@ static void __init mac_identify(void)
 		scc_b_rsrcs[1].start = scc_b_rsrcs[1].end = IRQ_MAC_SCC_B;
 		break;
 	default:
-		scc_a_rsrcs[1].start = scc_a_rsrcs[1].end = IRQ_MAC_SCC;
-		scc_b_rsrcs[1].start = scc_b_rsrcs[1].end = IRQ_MAC_SCC;
+		/* On non-PSC machines, the serial ports share an IRQ. */
+		if (macintosh_config->ident == MAC_MODEL_IIFX) {
+			scc_a_rsrcs[1].start = scc_a_rsrcs[1].end = IRQ_MAC_SCC;
+			scc_b_rsrcs[1].start = scc_b_rsrcs[1].end = IRQ_MAC_SCC;
+		} else {
+			scc_a_rsrcs[1].start = scc_a_rsrcs[1].end = IRQ_AUTO_4;
+			scc_b_rsrcs[1].start = scc_b_rsrcs[1].end = IRQ_AUTO_4;
+		}
 		break;
 	}
 
Index: linux-m68k/arch/m68k/include/asm/macints.h
===================================================================
--- linux-m68k.orig/arch/m68k/include/asm/macints.h	2011-10-22 23:02:22.000000000 +1100
+++ linux-m68k/arch/m68k/include/asm/macints.h	2011-10-22 23:02:39.000000000 +1100
@@ -104,6 +104,9 @@
 #define IRQ_PSC4_3	  (35)
 #define IRQ_MAC_MACE_DMA  IRQ_PSC4_3
 
+/* OSS Level 4 interrupts */
+#define IRQ_MAC_SCC	  (33)
+
 /* Level 5 (PSC, AV Macs only) interrupts */
 #define IRQ_PSC5_0	  (40)
 #define IRQ_PSC5_1	  (41)
@@ -131,9 +134,6 @@
 #define IRQ_BABOON_2	  (66)
 #define IRQ_BABOON_3	  (67)
 
-/* On non-PSC machines, the serial ports share an IRQ */
-#define IRQ_MAC_SCC	  IRQ_AUTO_4
-
 #define SLOT2IRQ(x)	  (x + 47)
 #define IRQ2SLOT(x)	  (x - 47)
 
