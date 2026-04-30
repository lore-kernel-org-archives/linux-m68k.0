Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E2072C2349
	for <linux-m68k@lists.linux-m68k.org>; Thu, 30 Apr 2026 05:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.105.4.254
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777526602; cv=none; b=TGfxTQ4VF8ctkMkkyAslrZSdkyLfM5D4EZrLR8wVHeZx0xsO+ZqDr1QgBXqsydM86fY2DqP9Uv8/oZX80bnA1bTNZeWmGSS/gw7td6k2wOE+YXET26PXHGkmcC2D1XEEN79rqLZyuPnIyplsXuHeVFjd/CwBqUj/RwLP07dxddw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777526602; c=relaxed/simple;
	bh=jaFBmpvVbtX7k5eGbPcokHJ9YFqxZ9+8nMA6LsHQqds=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p4GbLDHwKlcYWifgzq+WuL+Wic3K9JIjQx3PylCBBV51zCys4f5iIMFanUQYaRrDmJeSL7nP+fh3Gvd909fsOej5BOfZxIF3oiFoii2/U1CRWACxCfyKh6+g4l6SnKuJaN2lUmYQYl3kt3dmdWpqCjI+cqIvRYGw7XCnhuwsmQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=kernel.org; arc=none smtp.client-ip=172.105.4.254
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A973C61141;
	Thu, 30 Apr 2026 05:23:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 432F5C2BCB8;
	Thu, 30 Apr 2026 05:23:18 +0000 (UTC)
From: Greg Ungerer <gerg@linux-m68k.org>
To: linux-m68k@lists.linux-m68k.org
Cc: arnd@kernel.org,
	Greg Ungerer <gerg@kernel.org>,
	Greg Ungerer <gerg@linux-m68k.org>
Subject: [PATCH 3/7] m68k: coldfire: use ColdFire specifc IO access in interrupt code
Date: Thu, 30 Apr 2026 15:19:19 +1000
Message-ID: <20260430052047.1827575-4-gerg@linux-m68k.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260430052047.1827575-1-gerg@linux-m68k.org>
References: <20260430052047.1827575-1-gerg@linux-m68k.org>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Greg Ungerer <gerg@kernel.org>

Convert all coldfire specific interrupt setup code to only use the
newly created internal register access methods. This is replacing the
mixed and inconsistent use of readx/writex and __raw_readx/__raw_writex
for internal SoC registers.

Signed-off-by: Greg Ungerer <gerg@linux-m68k.org>
---
 arch/m68k/coldfire/intc-2.c    | 30 +++++++++++++--------------
 arch/m68k/coldfire/intc-5249.c | 10 ++++-----
 arch/m68k/coldfire/intc-525x.c | 12 +++++------
 arch/m68k/coldfire/intc-5272.c | 20 +++++++++---------
 arch/m68k/coldfire/intc-simr.c | 38 +++++++++++++++++-----------------
 arch/m68k/coldfire/intc.c      | 28 ++++++++++++-------------
 6 files changed, 69 insertions(+), 69 deletions(-)

diff --git a/arch/m68k/coldfire/intc-2.c b/arch/m68k/coldfire/intc-2.c
index f74f0e473119..c5e8e0ccded4 100644
--- a/arch/m68k/coldfire/intc-2.c
+++ b/arch/m68k/coldfire/intc-2.c
@@ -61,8 +61,8 @@ static void intc_irq_mask(struct irq_data *d)
 	imraddr += (irq & 0x20) ? MCFINTC_IMRH : MCFINTC_IMRL;
 	imrbit = 0x1 << (irq & 0x1f);
 
-	val = __raw_readl(imraddr);
-	__raw_writel(val | imrbit, imraddr);
+	val = mcf_read32(imraddr);
+	mcf_write32(val | imrbit, imraddr);
 }
 
 static void intc_irq_unmask(struct irq_data *d)
@@ -83,8 +83,8 @@ static void intc_irq_unmask(struct irq_data *d)
 	if ((irq & 0x20) == 0)
 		imrbit |= 0x1;
 
-	val = __raw_readl(imraddr);
-	__raw_writel(val & ~imrbit, imraddr);
+	val = mcf_read32(imraddr);
+	mcf_write32(val & ~imrbit, imraddr);
 }
 
 /*
@@ -97,7 +97,7 @@ static void intc_irq_ack(struct irq_data *d)
 {
 	unsigned int irq = d->irq;
 
-	__raw_writeb(0x1 << (irq - EINT0), MCFEPORT_EPFR);
+	mcf_write8(0x1 << (irq - EINT0), MCFEPORT_EPFR);
 }
 
 /*
@@ -120,8 +120,8 @@ static unsigned int intc_irq_startup(struct irq_data *d)
 	icraddr = MCFICM_INTC0;
 #endif
 	icraddr += MCFINTC_ICR0 + (irq & 0x3f);
-	if (__raw_readb(icraddr) == 0)
-		__raw_writeb(intc_intpri--, icraddr);
+	if (mcf_read8(icraddr) == 0)
+		mcf_write8(intc_intpri--, icraddr);
 
 	irq = d->irq;
 	if ((irq >= EINT1) && (irq <= EINT7)) {
@@ -130,12 +130,12 @@ static unsigned int intc_irq_startup(struct irq_data *d)
 		irq -= EINT0;
 
 		/* Set EPORT line as input */
-		v = __raw_readb(MCFEPORT_EPDDR);
-		__raw_writeb(v & ~(0x1 << irq), MCFEPORT_EPDDR);
+		v = mcf_read8(MCFEPORT_EPDDR);
+		mcf_write8(v & ~(0x1 << irq), MCFEPORT_EPDDR);
 
 		/* Set EPORT line as interrupt source */
-		v = __raw_readb(MCFEPORT_EPIER);
-		__raw_writeb(v | (0x1 << irq), MCFEPORT_EPIER);
+		v = mcf_read8(MCFEPORT_EPIER);
+		mcf_write8(v | (0x1 << irq), MCFEPORT_EPIER);
 	}
 
 	intc_irq_unmask(d);
@@ -167,9 +167,9 @@ static int intc_irq_set_type(struct irq_data *d, unsigned int type)
 		irq_set_handler(irq, handle_edge_irq);
 
 	irq -= EINT0;
-	pa = __raw_readw(MCFEPORT_EPPAR);
+	pa = mcf_read16(MCFEPORT_EPPAR);
 	pa = (pa & ~(0x3 << (irq * 2))) | (tb << (irq * 2));
-	__raw_writew(pa, MCFEPORT_EPPAR);
+	mcf_write16(pa, MCFEPORT_EPPAR);
 	
 	return 0;
 }
@@ -195,9 +195,9 @@ void __init init_IRQ(void)
 	int irq;
 
 	/* Mask all interrupt sources */
-	__raw_writel(0x1, MCFICM_INTC0 + MCFINTC_IMRL);
+	mcf_write32(0x1, MCFICM_INTC0 + MCFINTC_IMRL);
 #ifdef MCFICM_INTC1
-	__raw_writel(0x1, MCFICM_INTC1 + MCFINTC_IMRL);
+	mcf_write32(0x1, MCFICM_INTC1 + MCFINTC_IMRL);
 #endif
 
 	for (irq = MCFINT_VECBASE; (irq < MCFINT_VECBASE + NR_VECS); irq++) {
diff --git a/arch/m68k/coldfire/intc-5249.c b/arch/m68k/coldfire/intc-5249.c
index b0d1641053e4..f1636a9c96c8 100644
--- a/arch/m68k/coldfire/intc-5249.c
+++ b/arch/m68k/coldfire/intc-5249.c
@@ -20,22 +20,22 @@
 static void intc2_irq_gpio_mask(struct irq_data *d)
 {
 	u32 imr;
-	imr = readl(MCFSIM2_GPIOINTENABLE);
+	imr = mcf_read32(MCFSIM2_GPIOINTENABLE);
 	imr &= ~(0x1 << (d->irq - MCF_IRQ_GPIO0));
-	writel(imr, MCFSIM2_GPIOINTENABLE);
+	mcf_write32(imr, MCFSIM2_GPIOINTENABLE);
 }
 
 static void intc2_irq_gpio_unmask(struct irq_data *d)
 {
 	u32 imr;
-	imr = readl(MCFSIM2_GPIOINTENABLE);
+	imr = mcf_read32(MCFSIM2_GPIOINTENABLE);
 	imr |= (0x1 << (d->irq - MCF_IRQ_GPIO0));
-	writel(imr, MCFSIM2_GPIOINTENABLE);
+	mcf_write32(imr, MCFSIM2_GPIOINTENABLE);
 }
 
 static void intc2_irq_gpio_ack(struct irq_data *d)
 {
-	writel(0x1 << (d->irq - MCF_IRQ_GPIO0), MCFSIM2_GPIOINTCLEAR);
+	mcf_write32(0x1 << (d->irq - MCF_IRQ_GPIO0), MCFSIM2_GPIOINTCLEAR);
 }
 
 static struct irq_chip intc2_irq_gpio_chip = {
diff --git a/arch/m68k/coldfire/intc-525x.c b/arch/m68k/coldfire/intc-525x.c
index b23204d059ac..09a8752c96e7 100644
--- a/arch/m68k/coldfire/intc-525x.c
+++ b/arch/m68k/coldfire/intc-525x.c
@@ -20,7 +20,7 @@
 
 static void intc2_irq_gpio_mask(struct irq_data *d)
 {
-	u32 imr = readl(MCFSIM2_GPIOINTENABLE);
+	u32 imr = mcf_read32(MCFSIM2_GPIOINTENABLE);
 	u32 type = irqd_get_trigger_type(d);
 	int irq = d->irq - MCF_IRQ_GPIO0;
 
@@ -28,12 +28,12 @@ static void intc2_irq_gpio_mask(struct irq_data *d)
 		imr &= ~(0x001 << irq);
 	if (type & IRQ_TYPE_EDGE_FALLING)
 		imr &= ~(0x100 << irq);
-	writel(imr, MCFSIM2_GPIOINTENABLE);
+	mcf_write32(imr, MCFSIM2_GPIOINTENABLE);
 }
 
 static void intc2_irq_gpio_unmask(struct irq_data *d)
 {
-	u32 imr = readl(MCFSIM2_GPIOINTENABLE);
+	u32 imr = mcf_read32(MCFSIM2_GPIOINTENABLE);
 	u32 type = irqd_get_trigger_type(d);
 	int irq = d->irq - MCF_IRQ_GPIO0;
 
@@ -41,7 +41,7 @@ static void intc2_irq_gpio_unmask(struct irq_data *d)
 		imr |= (0x001 << irq);
 	if (type & IRQ_TYPE_EDGE_FALLING)
 		imr |= (0x100 << irq);
-	writel(imr, MCFSIM2_GPIOINTENABLE);
+	mcf_write32(imr, MCFSIM2_GPIOINTENABLE);
 }
 
 static void intc2_irq_gpio_ack(struct irq_data *d)
@@ -54,7 +54,7 @@ static void intc2_irq_gpio_ack(struct irq_data *d)
 		imr |= (0x001 << irq);
 	if (type & IRQ_TYPE_EDGE_FALLING)
 		imr |= (0x100 << irq);
-	writel(imr, MCFSIM2_GPIOINTCLEAR);
+	mcf_write32(imr, MCFSIM2_GPIOINTCLEAR);
 }
 
 static int intc2_irq_gpio_set_type(struct irq_data *d, unsigned int f)
@@ -77,7 +77,7 @@ static int __init mcf_intc2_init(void)
 	int irq;
 
 	/* set the interrupt base for the second interrupt controller */
-	writel(MCFINTC2_VECBASE, MCFINTC2_INTBASE);
+	mcf_write32(MCFINTC2_VECBASE, MCFINTC2_INTBASE);
 
 	/* GPIO interrupt sources */
 	for (irq = MCF_IRQ_GPIO0; (irq <= MCF_IRQ_GPIO6); irq++) {
diff --git a/arch/m68k/coldfire/intc-5272.c b/arch/m68k/coldfire/intc-5272.c
index b0a19e207a63..8d7e188cdb44 100644
--- a/arch/m68k/coldfire/intc-5272.c
+++ b/arch/m68k/coldfire/intc-5272.c
@@ -86,7 +86,7 @@ static void intc_irq_mask(struct irq_data *d)
 		u32 v;
 		irq -= MCFINT_VECBASE;
 		v = 0x8 << intc_irqmap[irq].index;
-		writel(v, intc_irqmap[irq].icr);
+		mcf_write32(v, intc_irqmap[irq].icr);
 	}
 }
 
@@ -98,7 +98,7 @@ static void intc_irq_unmask(struct irq_data *d)
 		u32 v;
 		irq -= MCFINT_VECBASE;
 		v = 0xd << intc_irqmap[irq].index;
-		writel(v, intc_irqmap[irq].icr);
+		mcf_write32(v, intc_irqmap[irq].icr);
 	}
 }
 
@@ -111,10 +111,10 @@ static void intc_irq_ack(struct irq_data *d)
 		irq -= MCFINT_VECBASE;
 		if (intc_irqmap[irq].ack) {
 			u32 v;
-			v = readl(intc_irqmap[irq].icr);
+			v = mcf_read32(intc_irqmap[irq].icr);
 			v &= (0x7 << intc_irqmap[irq].index);
 			v |= (0x8 << intc_irqmap[irq].index);
-			writel(v, intc_irqmap[irq].icr);
+			mcf_write32(v, intc_irqmap[irq].icr);
 		}
 	}
 }
@@ -127,12 +127,12 @@ static int intc_irq_set_type(struct irq_data *d, unsigned int type)
 		irq -= MCFINT_VECBASE;
 		if (intc_irqmap[irq].ack) {
 			u32 v;
-			v = readl(MCFSIM_PITR);
+			v = mcf_read32(MCFSIM_PITR);
 			if (type == IRQ_TYPE_EDGE_FALLING)
 				v &= ~(0x1 << (32 - irq));
 			else
 				v |= (0x1 << (32 - irq));
-			writel(v, MCFSIM_PITR);
+			mcf_write32(v, MCFSIM_PITR);
 		}
 	}
 	return 0;
@@ -163,10 +163,10 @@ void __init init_IRQ(void)
 	int irq, edge;
 
 	/* Mask all interrupt sources */
-	writel(0x88888888, MCFSIM_ICR1);
-	writel(0x88888888, MCFSIM_ICR2);
-	writel(0x88888888, MCFSIM_ICR3);
-	writel(0x88888888, MCFSIM_ICR4);
+	mcf_write32(0x88888888, MCFSIM_ICR1);
+	mcf_write32(0x88888888, MCFSIM_ICR2);
+	mcf_write32(0x88888888, MCFSIM_ICR3);
+	mcf_write32(0x88888888, MCFSIM_ICR4);
 
 	for (irq = 0; (irq < NR_IRQS); irq++) {
 		irq_set_chip(irq, &intc_irq_chip);
diff --git a/arch/m68k/coldfire/intc-simr.c b/arch/m68k/coldfire/intc-simr.c
index f7c2c41b3156..2cbda945f0e4 100644
--- a/arch/m68k/coldfire/intc-simr.c
+++ b/arch/m68k/coldfire/intc-simr.c
@@ -69,11 +69,11 @@ static void intc_irq_mask(struct irq_data *d)
 	unsigned int irq = d->irq - MCFINT_VECBASE;
 
 	if (MCFINTC2_SIMR && (irq > 127))
-		__raw_writeb(irq - 128, MCFINTC2_SIMR);
+		mcf_write8(irq - 128, MCFINTC2_SIMR);
 	else if (MCFINTC1_SIMR && (irq > 63))
-		__raw_writeb(irq - 64, MCFINTC1_SIMR);
+		mcf_write8(irq - 64, MCFINTC1_SIMR);
 	else
-		__raw_writeb(irq, MCFINTC0_SIMR);
+		mcf_write8(irq, MCFINTC0_SIMR);
 }
 
 static void intc_irq_unmask(struct irq_data *d)
@@ -81,18 +81,18 @@ static void intc_irq_unmask(struct irq_data *d)
 	unsigned int irq = d->irq - MCFINT_VECBASE;
 
 	if (MCFINTC2_CIMR && (irq > 127))
-		__raw_writeb(irq - 128, MCFINTC2_CIMR);
+		mcf_write8(irq - 128, MCFINTC2_CIMR);
 	else if (MCFINTC1_CIMR && (irq > 63))
-		__raw_writeb(irq - 64, MCFINTC1_CIMR);
+		mcf_write8(irq - 64, MCFINTC1_CIMR);
 	else
-		__raw_writeb(irq, MCFINTC0_CIMR);
+		mcf_write8(irq, MCFINTC0_CIMR);
 }
 
 static void intc_irq_ack(struct irq_data *d)
 {
 	unsigned int ebit = irq2ebit(d->irq);
 
-	__raw_writeb(0x1 << ebit, MCFEPORT_EPFR);
+	mcf_write8(0x1 << ebit, MCFEPORT_EPFR);
 }
 
 static unsigned int intc_irq_startup(struct irq_data *d)
@@ -105,22 +105,22 @@ static unsigned int intc_irq_startup(struct irq_data *d)
 
 #if defined(MCFEPORT_EPDDR)
 		/* Set EPORT line as input */
-		v = __raw_readb(MCFEPORT_EPDDR);
-		__raw_writeb(v & ~(0x1 << ebit), MCFEPORT_EPDDR);
+		v = mcf_read8(MCFEPORT_EPDDR);
+		mcf_write8(v & ~(0x1 << ebit), MCFEPORT_EPDDR);
 #endif
 
 		/* Set EPORT line as interrupt source */
-		v = __raw_readb(MCFEPORT_EPIER);
-		__raw_writeb(v | (0x1 << ebit), MCFEPORT_EPIER);
+		v = mcf_read8(MCFEPORT_EPIER);
+		mcf_write8(v | (0x1 << ebit), MCFEPORT_EPIER);
 	}
 
 	irq -= MCFINT_VECBASE;
 	if (MCFINTC2_ICR0 && (irq > 127))
-		__raw_writeb(5, MCFINTC2_ICR0 + irq - 128);
+		mcf_write8(5, MCFINTC2_ICR0 + irq - 128);
 	else if (MCFINTC1_ICR0 && (irq > 63))
-		__raw_writeb(5, MCFINTC1_ICR0 + irq - 64);
+		mcf_write8(5, MCFINTC1_ICR0 + irq - 64);
 	else
-		__raw_writeb(5, MCFINTC0_ICR0 + irq);
+		mcf_write8(5, MCFINTC0_ICR0 + irq);
 
 	intc_irq_unmask(d);
 	return 0;
@@ -151,9 +151,9 @@ static int intc_irq_set_type(struct irq_data *d, unsigned int type)
 		irq_set_handler(irq, handle_edge_irq);
 
 	ebit = irq2ebit(irq) * 2;
-	pa = __raw_readw(MCFEPORT_EPPAR);
+	pa = mcf_read16(MCFEPORT_EPPAR);
 	pa = (pa & ~(0x3 << ebit)) | (tb << ebit);
-	__raw_writew(pa, MCFEPORT_EPPAR);
+	mcf_write16(pa, MCFEPORT_EPPAR);
 	
 	return 0;
 }
@@ -179,11 +179,11 @@ void __init init_IRQ(void)
 	int irq, eirq;
 
 	/* Mask all interrupt sources */
-	__raw_writeb(0xff, MCFINTC0_SIMR);
+	mcf_write8(0xff, MCFINTC0_SIMR);
 	if (MCFINTC1_SIMR)
-		__raw_writeb(0xff, MCFINTC1_SIMR);
+		mcf_write8(0xff, MCFINTC1_SIMR);
 	if (MCFINTC2_SIMR)
-		__raw_writeb(0xff, MCFINTC2_SIMR);
+		mcf_write8(0xff, MCFINTC2_SIMR);
 
 	eirq = MCFINT_VECBASE + 64 + (MCFINTC1_ICR0 ? 64 : 0) +
 						(MCFINTC2_ICR0 ? 64 : 0);
diff --git a/arch/m68k/coldfire/intc.c b/arch/m68k/coldfire/intc.c
index b434371e2b99..f441ecf7c17c 100644
--- a/arch/m68k/coldfire/intc.c
+++ b/arch/m68k/coldfire/intc.c
@@ -45,23 +45,23 @@ unsigned char mcf_irq2imr[NR_IRQS];
 void mcf_setimr(int index)
 {
 	u16 imr;
-	imr = __raw_readw(MCFSIM_IMR);
-	__raw_writew(imr | (0x1 << index), MCFSIM_IMR);
+	imr = mcf_read16(MCFSIM_IMR);
+	mcf_write16(imr | (0x1 << index), MCFSIM_IMR);
 }
 
 void mcf_clrimr(int index)
 {
 	u16 imr;
-	imr = __raw_readw(MCFSIM_IMR);
-	__raw_writew(imr & ~(0x1 << index), MCFSIM_IMR);
+	imr = mcf_read16(MCFSIM_IMR);
+	mcf_write16(imr & ~(0x1 << index), MCFSIM_IMR);
 }
 
 static void mcf_maskimr(unsigned int mask)
 {
 	u16 imr;
-	imr = __raw_readw(MCFSIM_IMR);
+	imr = mcf_read16(MCFSIM_IMR);
 	imr |= mask;
-	__raw_writew(imr, MCFSIM_IMR);
+	mcf_write16(imr, MCFSIM_IMR);
 }
 
 #else
@@ -69,23 +69,23 @@ static void mcf_maskimr(unsigned int mask)
 void mcf_setimr(int index)
 {
 	u32 imr;
-	imr = __raw_readl(MCFSIM_IMR);
-	__raw_writel(imr | (0x1 << index), MCFSIM_IMR);
+	imr = mcf_read32(MCFSIM_IMR);
+	mcf_write32(imr | (0x1 << index), MCFSIM_IMR);
 }
 
 void mcf_clrimr(int index)
 {
 	u32 imr;
-	imr = __raw_readl(MCFSIM_IMR);
-	__raw_writel(imr & ~(0x1 << index), MCFSIM_IMR);
+	imr = mcf_read32(MCFSIM_IMR);
+	mcf_write32(imr & ~(0x1 << index), MCFSIM_IMR);
 }
 
 static void mcf_maskimr(unsigned int mask)
 {
 	u32 imr;
-	imr = __raw_readl(MCFSIM_IMR);
+	imr = mcf_read32(MCFSIM_IMR);
 	imr |= mask;
-	__raw_writel(imr, MCFSIM_IMR);
+	mcf_write32(imr, MCFSIM_IMR);
 }
 
 #endif
@@ -104,9 +104,9 @@ void mcf_autovector(int irq)
 #ifdef MCFSIM_AVR
 	if ((irq >= EIRQ1) && (irq <= EIRQ7)) {
 		u8 avec;
-		avec = __raw_readb(MCFSIM_AVR);
+		avec = mcf_read8(MCFSIM_AVR);
 		avec |= (0x1 << (irq - EIRQ1 + 1));
-		__raw_writeb(avec, MCFSIM_AVR);
+		mcf_write8(avec, MCFSIM_AVR);
 	}
 #endif
 }
-- 
2.54.0

