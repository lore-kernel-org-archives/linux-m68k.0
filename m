From: <gerg@snapgear.com>
Subject: [PATCH 2/3] m68knommu: move some init code out of unmask routine for ColdFire intc-2
Date: Wed, 9 Mar 2011 10:51:35 +1000
Message-ID: <1299631896-31186-3-git-send-email-gerg@snapgear.com>
References: <1299631896-31186-1-git-send-email-gerg@snapgear.com>
 <1299631896-31186-2-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:42182 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756986Ab1CIAzK (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 8 Mar 2011 19:55:10 -0500
In-Reply-To: <1299631896-31186-2-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

Use a proper irq_startup() routine to intialize the interrupt priority
and level register in the ColdFire intc-2 controller code. We shouldn't
be checking if the priority/level has been set on every unmask operation.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68knommu/platform/coldfire/intc-2.c |   47 +++++++++++++++++++---------
 1 files changed, 32 insertions(+), 15 deletions(-)

diff --git a/arch/m68knommu/platform/coldfire/intc-2.c b/arch/m68knommu/platform/coldfire/intc-2.c
index 4d172a7..66d4e47 100644
--- a/arch/m68knommu/platform/coldfire/intc-2.c
+++ b/arch/m68knommu/platform/coldfire/intc-2.c
@@ -30,13 +30,6 @@
 #define MCFSIM_ICR_LEVEL(l)	((l)<<3)	/* Level l intr */
 #define MCFSIM_ICR_PRI(p)	(p)		/* Priority p intr */
 
-/*
- *	Each vector needs a unique priority and level associated with it.
- *	We don't really care so much what they are, we don't rely on the
- *	traditional priority interrupt scheme of the m68k/ColdFire.
- */
-static u8 intc_intpri = MCFSIM_ICR_LEVEL(6) | MCFSIM_ICR_PRI(6);
-
 #ifdef MCFICM_INTC1
 #define NR_VECS	128
 #else
@@ -64,25 +57,21 @@ static void intc_irq_mask(struct irq_data *d)
 static void intc_irq_unmask(struct irq_data *d)
 {
 	unsigned int irq = d->irq - MCFINT_VECBASE;
-	unsigned long intaddr, imraddr, icraddr;
+	unsigned long imraddr;
 	u32 val, imrbit;
 
 #ifdef MCFICM_INTC1
-	intaddr = (irq & 0x40) ? MCFICM_INTC1 : MCFICM_INTC0;
+	imraddr = (irq & 0x40) ? MCFICM_INTC1 : MCFICM_INTC0;
 #else
-	intaddr = MCFICM_INTC0;
+	imraddr = MCFICM_INTC0;
 #endif
-	imraddr = intaddr + ((irq & 0x20) ? MCFINTC_IMRH : MCFINTC_IMRL);
-	icraddr = intaddr + MCFINTC_ICR0 + (irq & 0x3f);
+	imraddr += ((irq & 0x20) ? MCFINTC_IMRH : MCFINTC_IMRL);
 	imrbit = 0x1 << (irq & 0x1f);
 
 	/* Don't set the "maskall" bit! */
 	if ((irq & 0x20) == 0)
 		imrbit |= 0x1;
 
-	if (__raw_readb(icraddr) == 0)
-		__raw_writeb(intc_intpri--, icraddr);
-
 	val = __raw_readl(imraddr);
 	__raw_writel(val & ~imrbit, imraddr);
 }
@@ -92,8 +81,36 @@ static int intc_irq_set_type(struct irq_data *d, unsigned int type)
 	return 0;
 }
 
+/*
+ *	Each vector needs a unique priority and level associated with it.
+ *	We don't really care so much what they are, we don't rely on the
+ *	traditional priority interrupt scheme of the m68k/ColdFire. This
+ *	only needs to be set once for an interrupt, and we will never change
+ *	these values once we have set them.
+ */
+static u8 intc_intpri = MCFSIM_ICR_LEVEL(6) | MCFSIM_ICR_PRI(6);
+
+static unsigned int intc_irq_startup(struct irq_data *d)
+{
+	unsigned int irq = d->irq - MCFINT_VECBASE;
+	unsigned long icraddr;
+
+#ifdef MCFICM_INTC1
+	icraddr = (irq & 0x40) ? MCFICM_INTC1 : MCFICM_INTC0;
+#else
+	icraddr = MCFICM_INTC0;
+#endif
+	icraddr += MCFINTC_ICR0 + (irq & 0x3f);
+	if (__raw_readb(icraddr) == 0)
+		__raw_writeb(intc_intpri--, icraddr);
+
+	intc_irq_unmask(d);
+	return 0;
+}
+
 static struct irq_chip intc_irq_chip = {
 	.name		= "CF-INTC",
+	.irq_startup	= intc_irq_startup,
 	.irq_mask	= intc_irq_mask,
 	.irq_unmask	= intc_irq_unmask,
 	.irq_set_type	= intc_irq_set_type,
-- 
1.7.0.4
