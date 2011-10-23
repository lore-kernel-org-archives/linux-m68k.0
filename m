From: Finn Thain <fthain@telegraphics.com.au>
Subject: [PATCH 05/16] m68k/mac: cleanup mac_clear_irq
Date: Mon, 24 Oct 2011 01:11:13 +1100
Message-ID: <20111023141133.808777479@telegraphics.com.au>
References: <20111023141108.856998818@telegraphics.com.au>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from vm4.telegraphics.com.au ([98.124.60.149]:46002 "EHLO
	vps4.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755604Ab1JWOLi (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 23 Oct 2011 10:11:38 -0400
Content-Disposition: inline; filename=cleanup-mac_clear_irq
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org

mac_clear_irq() is dead code and has been dead for as long as I can recall. On certain Mac models, certain irqs can't be cleared this way. Outside of irq dispatch, this code appears be unusable without busy loops or worse, and for irq dispatch we duplicate the same logic. Remove mac_clear_irq() and supporting code.
 
Signed-off-by: Finn Thain <fthain@telegraphics.com.au>
 
Index: linux-m68k/arch/m68k/mac/baboon.c
===================================================================
--- linux-m68k.orig/arch/m68k/mac/baboon.c	2011-10-22 23:02:38.000000000 +1100
+++ linux-m68k/arch/m68k/mac/baboon.c	2011-10-23 00:51:09.000000000 +1100
@@ -124,13 +124,6 @@ void baboon_irq_disable(int irq)
 		mac_irq_disable(irq_get_irq_data(IRQ_NUBUS_C));
 }
 
-void baboon_irq_clear(int irq)
-{
-	int irq_idx = IRQ_IDX(irq);
-
-	baboon->mb_ifr &= ~(1 << irq_idx);
-}
-
 int baboon_irq_pending(int irq)
 {
 	int irq_idx = IRQ_IDX(irq);
Index: linux-m68k/arch/m68k/mac/macints.c
===================================================================
--- linux-m68k.orig/arch/m68k/mac/macints.c	2011-10-22 23:02:38.000000000 +1100
+++ linux-m68k/arch/m68k/mac/macints.c	2011-10-23 00:51:09.000000000 +1100
@@ -239,7 +239,6 @@ void __init mac_init_IRQ(void)
 /*
  *  mac_irq_enable - enable an interrupt source
  * mac_irq_disable - disable an interrupt source
- *   mac_clear_irq - clears a pending interrupt
  * mac_irq_pending - returns the pending status of an IRQ (nonzero = pending)
  *
  * These routines are just dispatchers to the VIA/OSS/PSC routines.
@@ -314,38 +313,6 @@ void mac_irq_disable(struct irq_data *da
 		break;
 	}
 }
-
-void mac_clear_irq(unsigned int irq)
-{
-	switch(IRQ_SRC(irq)) {
-	case 1:
-		via_irq_clear(irq);
-		break;
-	case 2:
-	case 7:
-		if (oss_present)
-			oss_irq_clear(irq);
-		else
-			via_irq_clear(irq);
-		break;
-	case 3:
-	case 5:
-	case 6:
-		if (psc_present)
-			psc_irq_clear(irq);
-		else if (oss_present)
-			oss_irq_clear(irq);
-		break;
-	case 4:
-		if (psc_present)
-			psc_irq_clear(irq);
-		break;
-	case 8:
-		if (baboon_present)
-			baboon_irq_clear(irq);
-		break;
-	}
-}
 
 int mac_irq_pending(unsigned int irq)
 {
Index: linux-m68k/arch/m68k/mac/oss.c
===================================================================
--- linux-m68k.orig/arch/m68k/mac/oss.c	2011-10-22 23:02:38.000000000 +1100
+++ linux-m68k/arch/m68k/mac/oss.c	2011-10-23 00:51:09.000000000 +1100
@@ -221,37 +221,6 @@ void oss_irq_disable(int irq) {
 }
 
 /*
- * Clear an OSS interrupt
- *
- * Not sure if this works or not but it's the only method I could
- * think of based on the contents of the mac_oss structure.
- */
-
-void oss_irq_clear(int irq) {
-	/* FIXME: how to do this on OSS? */
-	switch(irq) {
-		case IRQ_MAC_SCC:
-			oss->irq_pending &= ~OSS_IP_IOPSCC;
-			break;
-		case IRQ_MAC_ADB:
-			oss->irq_pending &= ~OSS_IP_IOPISM;
-			break;
-		case IRQ_MAC_SCSI:
-			oss->irq_pending &= ~OSS_IP_SCSI;
-			break;
-		case IRQ_NUBUS_9:
-		case IRQ_NUBUS_A:
-		case IRQ_NUBUS_B:
-		case IRQ_NUBUS_C:
-		case IRQ_NUBUS_D:
-		case IRQ_NUBUS_E:
-			irq -= NUBUS_SOURCE_BASE;
-			oss->irq_pending &= ~(1 << irq);
-			break;
-	}
-}
-
-/*
  * Check to see if a specific OSS interrupt is pending
  */
 
Index: linux-m68k/arch/m68k/mac/psc.c
===================================================================
--- linux-m68k.orig/arch/m68k/mac/psc.c	2011-10-22 23:02:38.000000000 +1100
+++ linux-m68k/arch/m68k/mac/psc.c	2011-10-23 00:51:09.000000000 +1100
@@ -181,14 +181,6 @@ void psc_irq_disable(int irq) {
 	psc_write_byte(pIER, 1 << irq_idx);
 }
 
-void psc_irq_clear(int irq) {
-	int irq_src	= IRQ_SRC(irq);
-	int irq_idx	= IRQ_IDX(irq);
-	int pIFR	= pIERbase + (irq_src << 4);
-
-	psc_write_byte(pIFR, 1 << irq_idx);
-}
-
 int psc_irq_pending(int irq)
 {
 	int irq_src	= IRQ_SRC(irq);
Index: linux-m68k/arch/m68k/mac/via.c
===================================================================
--- linux-m68k.orig/arch/m68k/mac/via.c	2011-10-22 23:02:38.000000000 +1100
+++ linux-m68k/arch/m68k/mac/via.c	2011-10-23 00:51:09.000000000 +1100
@@ -584,22 +584,6 @@ void via_irq_disable(int irq) {
 	}
 }
 
-void via_irq_clear(int irq) {
-	int irq_src	= IRQ_SRC(irq);
-	int irq_idx	= IRQ_IDX(irq);
-	int irq_bit	= 1 << irq_idx;
-
-	if (irq_src == 1) {
-		via1[vIFR] = irq_bit;
-	} else if (irq_src == 2) {
-		via2[gIFR] = irq_bit | rbv_clear;
-	} else if (irq_src == 7) {
-		/* FIXME: There is no way to clear an individual nubus slot
-		 * IRQ flag, other than getting the device to do it.
-		 */
-	}
-}
-
 /*
  * Returns nonzero if an interrupt is pending on the given
  * VIA/IRQ combination.
