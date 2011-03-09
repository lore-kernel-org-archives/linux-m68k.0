From: <gerg@snapgear.com>
Subject: [PATCH 1/3] m68knommu: limit interrupts supported by ColdFire intc-2 driver
Date: Wed, 9 Mar 2011 10:51:34 +1000
Message-ID: <1299631896-31186-2-git-send-email-gerg@snapgear.com>
References: <1299631896-31186-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:31575 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756039Ab1CIAwC (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 8 Mar 2011 19:52:02 -0500
In-Reply-To: <1299631896-31186-1-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

The intc-2 interrupt controller on some ColdFire CPUs has a set range of
interrupts its supports (64 through 128 or 192 depending on model). We
shouldn't be setting this handler for every possible interrupt from 0 to
255. Set more appropriate limits, and this means we can drop the interrupt
number check in the mask and unmask routines.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68knommu/platform/coldfire/intc-2.c |   58 ++++++++++++----------------
 1 files changed, 25 insertions(+), 33 deletions(-)

diff --git a/arch/m68knommu/platform/coldfire/intc-2.c b/arch/m68knommu/platform/coldfire/intc-2.c
index ec869c8..4d172a7 100644
--- a/arch/m68knommu/platform/coldfire/intc-2.c
+++ b/arch/m68knommu/platform/coldfire/intc-2.c
@@ -45,54 +45,46 @@ static u8 intc_intpri = MCFSIM_ICR_LEVEL(6) | MCFSIM_ICR_PRI(6);
 
 static void intc_irq_mask(struct irq_data *d)
 {
-	unsigned int irq = d->irq;
+	unsigned int irq = d->irq - MCFINT_VECBASE;
+	unsigned long imraddr;
+	u32 val, imrbit;
 
-	if ((irq >= MCFINT_VECBASE) && (irq <= MCFINT_VECBASE + NR_VECS)) {
-		unsigned long imraddr;
-		u32 val, imrbit;
-
-		irq -= MCFINT_VECBASE;
 #ifdef MCFICM_INTC1
-		imraddr = (irq & 0x40) ? MCFICM_INTC1 : MCFICM_INTC0;
+	imraddr = (irq & 0x40) ? MCFICM_INTC1 : MCFICM_INTC0;
 #else
-		imraddr = MCFICM_INTC0;
+	imraddr = MCFICM_INTC0;
 #endif
-		imraddr += (irq & 0x20) ? MCFINTC_IMRH : MCFINTC_IMRL;
-		imrbit = 0x1 << (irq & 0x1f);
+	imraddr += (irq & 0x20) ? MCFINTC_IMRH : MCFINTC_IMRL;
+	imrbit = 0x1 << (irq & 0x1f);
 
-		val = __raw_readl(imraddr);
-		__raw_writel(val | imrbit, imraddr);
-	}
+	val = __raw_readl(imraddr);
+	__raw_writel(val | imrbit, imraddr);
 }
 
 static void intc_irq_unmask(struct irq_data *d)
 {
-	unsigned int irq = d->irq;
+	unsigned int irq = d->irq - MCFINT_VECBASE;
+	unsigned long intaddr, imraddr, icraddr;
+	u32 val, imrbit;
 
-	if ((irq >= MCFINT_VECBASE) && (irq <= MCFINT_VECBASE + NR_VECS)) {
-		unsigned long intaddr, imraddr, icraddr;
-		u32 val, imrbit;
-
-		irq -= MCFINT_VECBASE;
 #ifdef MCFICM_INTC1
-		intaddr = (irq & 0x40) ? MCFICM_INTC1 : MCFICM_INTC0;
+	intaddr = (irq & 0x40) ? MCFICM_INTC1 : MCFICM_INTC0;
 #else
-		intaddr = MCFICM_INTC0;
+	intaddr = MCFICM_INTC0;
 #endif
-		imraddr = intaddr + ((irq & 0x20) ? MCFINTC_IMRH : MCFINTC_IMRL);
-		icraddr = intaddr + MCFINTC_ICR0 + (irq & 0x3f);
-		imrbit = 0x1 << (irq & 0x1f);
+	imraddr = intaddr + ((irq & 0x20) ? MCFINTC_IMRH : MCFINTC_IMRL);
+	icraddr = intaddr + MCFINTC_ICR0 + (irq & 0x3f);
+	imrbit = 0x1 << (irq & 0x1f);
 
-		/* Don't set the "maskall" bit! */
-		if ((irq & 0x20) == 0)
-			imrbit |= 0x1;
+	/* Don't set the "maskall" bit! */
+	if ((irq & 0x20) == 0)
+		imrbit |= 0x1;
 
-		if (__raw_readb(icraddr) == 0)
-			__raw_writeb(intc_intpri--, icraddr);
+	if (__raw_readb(icraddr) == 0)
+		__raw_writeb(intc_intpri--, icraddr);
 
-		val = __raw_readl(imraddr);
-		__raw_writel(val & ~imrbit, imraddr);
-	}
+	val = __raw_readl(imraddr);
+	__raw_writel(val & ~imrbit, imraddr);
 }
 
 static int intc_irq_set_type(struct irq_data *d, unsigned int type)
@@ -119,7 +111,7 @@ void __init init_IRQ(void)
 	__raw_writel(0x1, MCFICM_INTC1 + MCFINTC_IMRL);
 #endif
 
-	for (irq = 0; (irq < NR_IRQS); irq++) {
+	for (irq = MCFINT_VECBASE; (irq < MCFINT_VECBASE + NR_VECS); irq++) {
 		set_irq_chip(irq, &intc_irq_chip);
 		set_irq_type(irq, IRQ_TYPE_LEVEL_HIGH);
 		set_irq_handler(irq, handle_level_irq);
-- 
1.7.0.4
