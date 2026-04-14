Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34C633E6DE7
	for <linux-m68k@lists.linux-m68k.org>; Tue, 14 Apr 2026 13:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.234.252.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776173104; cv=none; b=MsK8rLdXV8bvKhH2iUDfJYY+lHJZjPZcPGz2shcWyU8vaoNd6wCHprVVfepcoMgyBe9YRuA2bTvZGJhic2Lls5fJZIJXsiNk+SsUSwyZRfPRm3nq3gtX+4ujAb4T6jHgD7mLE7sCbdFFVCOeMWUKbczuUUrKqzmPm1P/OJ8DtDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776173104; c=relaxed/simple;
	bh=WdHRcOX6xdASzry/7fK6qlf7+WFG+TllEYDFsebjsSg=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=T8PGIeQsoVniohF42lC0eInbYFoKKiiZFDIL09TfiM1gZOsrFjiNrca+LGxEZa2vXw8gcCt7M2/CBHuFqWoH/28rzzEaP+SY0rAD7qYkhGNmQynwAjQ0n8JJiiQFHIqwCW+kZu3K/YXFQ6jatmfGfUQq8sFimYvtrIK+YbrISFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KXvT4D4M; arc=none smtp.client-ip=172.234.252.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KXvT4D4M"
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E1F89409EE
	for <linux-m68k@lists.linux-m68k.org>; Tue, 14 Apr 2026 13:25:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94668C2BCB7
	for <linux-m68k@lists.linux-m68k.org>; Tue, 14 Apr 2026 13:25:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776173101;
	bh=WdHRcOX6xdASzry/7fK6qlf7+WFG+TllEYDFsebjsSg=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=KXvT4D4MqiYsSiowEy/enRSk+Iq03HsHBUrEDN5Ew16+fLORjdXs6hfu6xtKnsWCz
	 ddxgXxvNKASgSqNWmQO+oXQcJ1JT6WdxNbnMjSmU+RnrQicBZ+EH1SKj5ebt2eKc6S
	 1KBYEj11Ubtu8PNrwSGsw2C+reyAVtQcUy5Df/2TG+YPFyJL6qy3ug8SbmC8E6AuG7
	 DXKTA/cOB6BC5SGERwtK5qON0oeEn0t3hR+gTVYmOMFlhFo4dBn30xVGD0jVJaZjPv
	 uBI8H64vD7mXR2R5JrpYMaMAgKqRRY1YqzDEzwuvgKRkr5/PIQKbsThZzCw8ejALK+
	 g28kTv8L1C2bw==
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfauth.phl.internal (Postfix) with ESMTP id 6BAB2F40068;
	Tue, 14 Apr 2026 09:25:00 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Tue, 14 Apr 2026 09:25:00 -0400
X-ME-Sender: <xms:LEDeaa3dM0PkUrSe-6IxvmaoDWTM2mJseoAAniQvSVB695aXQSt6_g>
    <xme:LEDeaX6kSXNEf19CfHIruTswfuhk_Q0SSoZmkRedEesE-QbUEurs04t7D5lC5IX9H
    SOGmQ83-NIoF7OaZbzLw7_nBuaNQnyR0Vcr4nEaAqnjIY8cc4VG0RD0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdeguddviecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugeskhgvrhhnvghlrdhorhhgqeenucggtffrrghtth
    gvrhhnpeejjeffteetfeetkeeijedugeeuvdfgfeefiedtudeikeeggeefkefhudfhlefh
    veenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrh
    hnugdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidquddvkeehudejtddvgedq
    vdekjedttddvieegqdgrrhhnugeppehkvghrnhgvlhdrohhrghesrghrnhgusgdruggvpd
    hnsggprhgtphhtthhopeeipdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegurghn
    ihgvlhestdigtdhfrdgtohhmpdhrtghpthhtoheptghhrhhishhtohhphhdrphhlrghtth
    hnvghrsehgmhigrdgrthdprhgtphhtthhopehgvggvrhhtsehlihhnuhigqdhmieekkhdr
    ohhrghdprhgtphhtthhopehgvghrgheslhhinhhugidqmheikehkrdhorhhgpdhrtghpth
    htoheplhhinhhugidqmheikehksehlihhsthhsrdhlihhnuhigqdhmieekkhdrohhrghdp
    rhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:LEDeaXUVQaGy-MzJnbkhMEVsCLTkf42-O13D-CYTylFNeulgGmGQ5Q>
    <xmx:LEDeaahfCe__WTh2A3bsbqXLTBqVv9W4QYez6krSCU6JnbJmsgNwiA>
    <xmx:LEDeaSYh1x83JBEgpo4mQ5KNs8bA2eGa39M15YfUncJAwrFZrQujzw>
    <xmx:LEDeaXpFN1hb6_xv_elesOtxQgKFkxrDO3TNDGQOElswFSnr7AT0rQ>
    <xmx:LEDeafMMsPs_V9_KUrLcXoXATS0rV-JvV96Xr-TFQoUkA7_MJAeEsJlT>
Feedback-ID: i36794607:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 3F458700065; Tue, 14 Apr 2026 09:25:00 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AbTBWCF3eo87
Date: Tue, 14 Apr 2026 15:24:26 +0200
From: "Arnd Bergmann" <arnd@kernel.org>
To: "Daniel Palmer" <daniel@0x0f.com>, "Greg Ungerer" <gerg@linux-m68k.org>
Cc: "Geert Uytterhoeven" <geert@linux-m68k.org>, christoph.plattner@gmx.at,
 linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
Message-Id: <0ca82015-820d-4002-a65d-0888804db3cc@app.fastmail.com>
In-Reply-To: 
 <CAFr9PXnfh6p_ajGSGX-MnKgToEdAW-3rPgOLKgaDXziKXNGfFQ@mail.gmail.com>
References: <20260404024658.2496519-1-daniel@0x0f.com>
 <ec4945ec-84fd-4462-b35d-79a04673107d@linux-m68k.org>
 <CAFr9PXnfh6p_ajGSGX-MnKgToEdAW-3rPgOLKgaDXziKXNGfFQ@mail.gmail.com>
Subject: Re: [RFC PATCH] m68k: nommu: Fix behaviour of io macros on non-CF
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, Apr 14, 2026, at 14:55, Daniel Palmer wrote:
>
> On Tue, 14 Apr 2026 at 21:18, Greg Ungerer <gerg@linux-m68k.org> wrote:
>> This change, in this form at least, breaks most of the non-MMU ColdFire targets.
>> Try compiling any of m5208evb, m5249evb, m5272c3, m5275evb, m5307c3 or
>> m5407c3 defconfigs and you get build failures. Targets that do not have
>> a PCI bus and so do not define IOMEMBASE will fail, which is most of them.

Indeed, I had assumed that coldfire just uses the regular semantics
here since it has PCI support, but I see now that it actually relies
on both the big-endian access and on passing a physical address as
an integer instead of an '__iomem' pointer into writel(), which
is something we should probably fix.

> Oof, that's the second time I broke coldfire this week (I broke it
> trying to make virtio work for m68k in u-boot too).
> Your patch works for my mc68000 virt and dragonball builds. I will
> build/boot test nommu CF in QEMU.

Right, this is hopefully fine as a quick fix.

In order to have coldfire behave more like other targets
(now including 68000/68328), I would suggest removing the
custom readl/writel helpers for coldfire as well, and changing
the few callers to something else. A new set of helpers that
takes a phys_addr_t would work, or possibly just using
the existing __raw_readl()/__raw_writel() or
ioread32be()/iowrite32be() where appropriate, see the patch
below for the arch/m68k portion of that.

There are other coldfire specific drivers (fec, spi, ...)
that would need a similar change.

     Arnd

diff --git a/arch/m68k/coldfire/intc-5249.c b/arch/m68k/coldfire/intc-5249.c
index b0d1641053e4..f489c19966c2 100644
--- a/arch/m68k/coldfire/intc-5249.c
+++ b/arch/m68k/coldfire/intc-5249.c
@@ -20,22 +20,22 @@
 static void intc2_irq_gpio_mask(struct irq_data *d)
 {
 	u32 imr;
-	imr = readl(MCFSIM2_GPIOINTENABLE);
+	imr = __raw_readl(MCFSIM2_GPIOINTENABLE);
 	imr &= ~(0x1 << (d->irq - MCF_IRQ_GPIO0));
-	writel(imr, MCFSIM2_GPIOINTENABLE);
+	__raw_writel(imr, MCFSIM2_GPIOINTENABLE);
 }
 
 static void intc2_irq_gpio_unmask(struct irq_data *d)
 {
 	u32 imr;
-	imr = readl(MCFSIM2_GPIOINTENABLE);
+	imr = __raw_readl(MCFSIM2_GPIOINTENABLE);
 	imr |= (0x1 << (d->irq - MCF_IRQ_GPIO0));
-	writel(imr, MCFSIM2_GPIOINTENABLE);
+	__raw_writel(imr, MCFSIM2_GPIOINTENABLE);
 }
 
 static void intc2_irq_gpio_ack(struct irq_data *d)
 {
-	writel(0x1 << (d->irq - MCF_IRQ_GPIO0), MCFSIM2_GPIOINTCLEAR);
+	__raw_writel(0x1 << (d->irq - MCF_IRQ_GPIO0), MCFSIM2_GPIOINTCLEAR);
 }
 
 static struct irq_chip intc2_irq_gpio_chip = {
diff --git a/arch/m68k/coldfire/intc-525x.c b/arch/m68k/coldfire/intc-525x.c
index b23204d059ac..fd8da9fbc6b3 100644
--- a/arch/m68k/coldfire/intc-525x.c
+++ b/arch/m68k/coldfire/intc-525x.c
@@ -20,7 +20,7 @@
 
 static void intc2_irq_gpio_mask(struct irq_data *d)
 {
-	u32 imr = readl(MCFSIM2_GPIOINTENABLE);
+	u32 imr = __raw_readl(MCFSIM2_GPIOINTENABLE);
 	u32 type = irqd_get_trigger_type(d);
 	int irq = d->irq - MCF_IRQ_GPIO0;
 
@@ -28,12 +28,12 @@ static void intc2_irq_gpio_mask(struct irq_data *d)
 		imr &= ~(0x001 << irq);
 	if (type & IRQ_TYPE_EDGE_FALLING)
 		imr &= ~(0x100 << irq);
-	writel(imr, MCFSIM2_GPIOINTENABLE);
+	__raw_writel(imr, MCFSIM2_GPIOINTENABLE);
 }
 
 static void intc2_irq_gpio_unmask(struct irq_data *d)
 {
-	u32 imr = readl(MCFSIM2_GPIOINTENABLE);
+	u32 imr = __raw_readl(MCFSIM2_GPIOINTENABLE);
 	u32 type = irqd_get_trigger_type(d);
 	int irq = d->irq - MCF_IRQ_GPIO0;
 
@@ -41,7 +41,7 @@ static void intc2_irq_gpio_unmask(struct irq_data *d)
 		imr |= (0x001 << irq);
 	if (type & IRQ_TYPE_EDGE_FALLING)
 		imr |= (0x100 << irq);
-	writel(imr, MCFSIM2_GPIOINTENABLE);
+	__raw_writel(imr, MCFSIM2_GPIOINTENABLE);
 }
 
 static void intc2_irq_gpio_ack(struct irq_data *d)
@@ -54,7 +54,7 @@ static void intc2_irq_gpio_ack(struct irq_data *d)
 		imr |= (0x001 << irq);
 	if (type & IRQ_TYPE_EDGE_FALLING)
 		imr |= (0x100 << irq);
-	writel(imr, MCFSIM2_GPIOINTCLEAR);
+	__raw_writel(imr, MCFSIM2_GPIOINTCLEAR);
 }
 
 static int intc2_irq_gpio_set_type(struct irq_data *d, unsigned int f)
@@ -77,7 +77,7 @@ static int __init mcf_intc2_init(void)
 	int irq;
 
 	/* set the interrupt base for the second interrupt controller */
-	writel(MCFINTC2_VECBASE, MCFINTC2_INTBASE);
+	__raw_writel(MCFINTC2_VECBASE, MCFINTC2_INTBASE);
 
 	/* GPIO interrupt sources */
 	for (irq = MCF_IRQ_GPIO0; (irq <= MCF_IRQ_GPIO6); irq++) {
diff --git a/arch/m68k/coldfire/intc-5272.c b/arch/m68k/coldfire/intc-5272.c
index b0a19e207a63..2524ebb34367 100644
--- a/arch/m68k/coldfire/intc-5272.c
+++ b/arch/m68k/coldfire/intc-5272.c
@@ -86,7 +86,7 @@ static void intc_irq_mask(struct irq_data *d)
 		u32 v;
 		irq -= MCFINT_VECBASE;
 		v = 0x8 << intc_irqmap[irq].index;
-		writel(v, intc_irqmap[irq].icr);
+		__raw_writel(v, intc_irqmap[irq].icr);
 	}
 }
 
@@ -98,7 +98,7 @@ static void intc_irq_unmask(struct irq_data *d)
 		u32 v;
 		irq -= MCFINT_VECBASE;
 		v = 0xd << intc_irqmap[irq].index;
-		writel(v, intc_irqmap[irq].icr);
+		__raw_writel(v, intc_irqmap[irq].icr);
 	}
 }
 
@@ -111,10 +111,10 @@ static void intc_irq_ack(struct irq_data *d)
 		irq -= MCFINT_VECBASE;
 		if (intc_irqmap[irq].ack) {
 			u32 v;
-			v = readl(intc_irqmap[irq].icr);
+			v = __raw_readl(intc_irqmap[irq].icr);
 			v &= (0x7 << intc_irqmap[irq].index);
 			v |= (0x8 << intc_irqmap[irq].index);
-			writel(v, intc_irqmap[irq].icr);
+			__raw_writel(v, intc_irqmap[irq].icr);
 		}
 	}
 }
@@ -127,12 +127,12 @@ static int intc_irq_set_type(struct irq_data *d, unsigned int type)
 		irq -= MCFINT_VECBASE;
 		if (intc_irqmap[irq].ack) {
 			u32 v;
-			v = readl(MCFSIM_PITR);
+			v = __raw_readl(MCFSIM_PITR);
 			if (type == IRQ_TYPE_EDGE_FALLING)
 				v &= ~(0x1 << (32 - irq));
 			else
 				v |= (0x1 << (32 - irq));
-			writel(v, MCFSIM_PITR);
+			__raw_writel(v, MCFSIM_PITR);
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
+	__raw_writel(0x88888888, MCFSIM_ICR1);
+	__raw_writel(0x88888888, MCFSIM_ICR2);
+	__raw_writel(0x88888888, MCFSIM_ICR3);
+	__raw_writel(0x88888888, MCFSIM_ICR4);
 
 	for (irq = 0; (irq < NR_IRQS); irq++) {
 		irq_set_chip(irq, &intc_irq_chip);
diff --git a/arch/m68k/coldfire/m5249.c b/arch/m68k/coldfire/m5249.c
index 6d66972de214..4bf55aab9657 100644
--- a/arch/m68k/coldfire/m5249.c
+++ b/arch/m68k/coldfire/m5249.c
@@ -94,10 +94,10 @@ static void __init m5249_i2c_init(void)
 	mcf_mapirq2imr(MCF_IRQ_I2C0, MCFINTC_I2C);
 
 	/* second I2C controller is completely different */
-	r = readl(MCFINTC2_INTPRI_REG(MCF_IRQ_I2C1));
+	r = __raw_readl(MCFINTC2_INTPRI_REG(MCF_IRQ_I2C1));
 	r &= ~MCFINTC2_INTPRI_BITS(0xf, MCF_IRQ_I2C1);
 	r |= MCFINTC2_INTPRI_BITS(0x5, MCF_IRQ_I2C1);
-	writel(r, MCFINTC2_INTPRI_REG(MCF_IRQ_I2C1));
+	__raw_writel(r, MCFINTC2_INTPRI_REG(MCF_IRQ_I2C1));
 #endif /* CONFIG_I2C_IMX */
 }
 
@@ -110,11 +110,11 @@ static void __init m5249_smc91x_init(void)
 	u32  gpio;
 
 	/* Set the GPIO line as interrupt source for smc91x device */
-	gpio = readl(MCFSIM2_GPIOINTENABLE);
-	writel(gpio | 0x40, MCFSIM2_GPIOINTENABLE);
+	gpio = __raw_readl(MCFSIM2_GPIOINTENABLE);
+	__raw_writel(gpio | 0x40, MCFSIM2_GPIOINTENABLE);
 
-	gpio = readl(MCFINTC2_INTPRI5);
-	writel(gpio | 0x04000000, MCFINTC2_INTPRI5);
+	gpio = __raw_readl(MCFINTC2_INTPRI5);
+	__raw_writel(gpio | 0x04000000, MCFINTC2_INTPRI5);
 }
 
 #endif /* CONFIG_M5249C3 */
diff --git a/arch/m68k/coldfire/m525x.c b/arch/m68k/coldfire/m525x.c
index 485375112e28..82c0269744d4 100644
--- a/arch/m68k/coldfire/m525x.c
+++ b/arch/m68k/coldfire/m525x.c
@@ -44,9 +44,9 @@ static void __init m525x_qspi_init(void)
 #if IS_ENABLED(CONFIG_SPI_COLDFIRE_QSPI)
 	/* set the GPIO function for the qspi cs gpios */
 	/* FIXME: replace with pinmux/pinctl support */
-	u32 f = readl(MCFSIM2_GPIOFUNC);
+	u32 f = __raw_readl(MCFSIM2_GPIOFUNC);
 	f |= (1 << MCFQSPI_CS2) | (1 << MCFQSPI_CS1) | (1 << MCFQSPI_CS0);
-	writel(f, MCFSIM2_GPIOFUNC);
+	__raw_writel(f, MCFSIM2_GPIOFUNC);
 
 	/* QSPI irq setup */
 	writeb(MCFSIM_ICR_AUTOVEC | MCFSIM_ICR_LEVEL4 | MCFSIM_ICR_PRI0,
@@ -66,10 +66,10 @@ static void __init m525x_i2c_init(void)
 	mcf_mapirq2imr(MCF_IRQ_I2C0, MCFINTC_I2C);
 
 	/* second I2C controller is completely different */
-	r = readl(MCFINTC2_INTPRI_REG(MCF_IRQ_I2C1));
+	r = __raw_readl(MCFINTC2_INTPRI_REG(MCF_IRQ_I2C1));
 	r &= ~MCFINTC2_INTPRI_BITS(0xf, MCF_IRQ_I2C1);
 	r |= MCFINTC2_INTPRI_BITS(0x5, MCF_IRQ_I2C1);
-	writel(r, MCFINTC2_INTPRI_REG(MCF_IRQ_I2C1));
+	__raw_writel(r, MCFINTC2_INTPRI_REG(MCF_IRQ_I2C1));
 #endif /* IS_ENABLED(CONFIG_I2C_IMX) */
 }
 
diff --git a/arch/m68k/coldfire/m5272.c b/arch/m68k/coldfire/m5272.c
index 28b3ffa25ba0..daf5454babb8 100644
--- a/arch/m68k/coldfire/m5272.c
+++ b/arch/m68k/coldfire/m5272.c
@@ -55,13 +55,13 @@ static void __init m5272_uarts_init(void)
 	u32 v;
 
 	/* Enable the output lines for the serial ports */
-	v = readl(MCFSIM_PBCNT);
+	v = __raw_readl(MCFSIM_PBCNT);
 	v = (v & ~0x000000ff) | 0x00000055;
-	writel(v, MCFSIM_PBCNT);
+	__raw_writel(v, MCFSIM_PBCNT);
 
-	v = readl(MCFSIM_PDCNT);
+	v = __raw_readl(MCFSIM_PDCNT);
 	v = (v & ~0x000003fc) | 0x000002a8;
-	writel(v, MCFSIM_PDCNT);
+	__raw_writel(v, MCFSIM_PDCNT);
 }
 
 /***************************************************************************/
diff --git a/arch/m68k/coldfire/m53xx.c b/arch/m68k/coldfire/m53xx.c
index 17af5f673796..d4b1f9e10d84 100644
--- a/arch/m68k/coldfire/m53xx.c
+++ b/arch/m68k/coldfire/m53xx.c
@@ -314,19 +314,19 @@ void wtm_init(void)
 void scm_init(void)
 {
 	/* All masters are trusted */
-	writel(0x77777777, MCF_SCM_MPR);
+	__raw_writel(0x77777777, MCF_SCM_MPR);
     
 	/* Allow supervisor/user, read/write, and trusted/untrusted
 	   access to all slaves */
-	writel(0, MCF_SCM_PACRA);
-	writel(0, MCF_SCM_PACRB);
-	writel(0, MCF_SCM_PACRC);
-	writel(0, MCF_SCM_PACRD);
-	writel(0, MCF_SCM_PACRE);
-	writel(0, MCF_SCM_PACRF);
+	__raw_writel(0, MCF_SCM_PACRA);
+	__raw_writel(0, MCF_SCM_PACRB);
+	__raw_writel(0, MCF_SCM_PACRC);
+	__raw_writel(0, MCF_SCM_PACRD);
+	__raw_writel(0, MCF_SCM_PACRE);
+	__raw_writel(0, MCF_SCM_PACRF);
 
 	/* Enable bursts */
-	writel(MCF_SCM_BCR_GBR | MCF_SCM_BCR_GBW, MCF_SCM_BCR);
+	__raw_writel(MCF_SCM_BCR_GBR | MCF_SCM_BCR_GBW, MCF_SCM_BCR);
 }
 
 
@@ -335,32 +335,32 @@ void fbcs_init(void)
 	writeb(0x3E, MCFGPIO_PAR_CS);
 
 	/* Latch chip select */
-	writel(0x10080000, MCF_FBCS1_CSAR);
+	__raw_writel(0x10080000, MCF_FBCS1_CSAR);
 
-	writel(0x002A3780, MCF_FBCS1_CSCR);
-	writel(MCF_FBCS_CSMR_BAM_2M | MCF_FBCS_CSMR_V, MCF_FBCS1_CSMR);
+	__raw_writel(0x002A3780, MCF_FBCS1_CSCR);
+	__raw_writel(MCF_FBCS_CSMR_BAM_2M | MCF_FBCS_CSMR_V, MCF_FBCS1_CSMR);
 
 	/* Initialize latch to drive signals to inactive states */
 	writew(0xffff, 0x10080000);
 
 	/* External SRAM */
-	writel(EXT_SRAM_ADDRESS, MCF_FBCS1_CSAR);
-	writel(MCF_FBCS_CSCR_PS_16 |
+	__raw_writel(EXT_SRAM_ADDRESS, MCF_FBCS1_CSAR);
+	__raw_writel(MCF_FBCS_CSCR_PS_16 |
 		MCF_FBCS_CSCR_AA |
 		MCF_FBCS_CSCR_SBM |
 		MCF_FBCS_CSCR_WS(1),
 		MCF_FBCS1_CSCR);
-	writel(MCF_FBCS_CSMR_BAM_512K | MCF_FBCS_CSMR_V, MCF_FBCS1_CSMR);
+	__raw_writel(MCF_FBCS_CSMR_BAM_512K | MCF_FBCS_CSMR_V, MCF_FBCS1_CSMR);
 
 	/* Boot Flash connected to FBCS0 */
-	writel(FLASH_ADDRESS, MCF_FBCS0_CSAR);
-	writel(MCF_FBCS_CSCR_PS_16 |
+	__raw_writel(FLASH_ADDRESS, MCF_FBCS0_CSAR);
+	__raw_writel(MCF_FBCS_CSCR_PS_16 |
 		MCF_FBCS_CSCR_BEM |
 		MCF_FBCS_CSCR_AA |
 		MCF_FBCS_CSCR_SBM |
 		MCF_FBCS_CSCR_WS(7),
 		MCF_FBCS0_CSCR);
-	writel(MCF_FBCS_CSMR_BAM_32M | MCF_FBCS_CSMR_V, MCF_FBCS0_CSMR);
+	__raw_writel(MCF_FBCS_CSMR_BAM_32M | MCF_FBCS_CSMR_V, MCF_FBCS0_CSMR);
 }
 
 void sdramc_init(void)
@@ -369,18 +369,18 @@ void sdramc_init(void)
 	 * Check to see if the SDRAM has already been initialized
 	 * by a run control tool
 	 */
-	if (!(readl(MCF_SDRAMC_SDCR) & MCF_SDRAMC_SDCR_REF)) {
+	if (!(__raw_readl(MCF_SDRAMC_SDCR) & MCF_SDRAMC_SDCR_REF)) {
 		/* SDRAM chip select initialization */
 		
 		/* Initialize SDRAM chip select */
-		writel(MCF_SDRAMC_SDCS_BA(SDRAM_ADDRESS) |
+		__raw_writel(MCF_SDRAMC_SDCS_BA(SDRAM_ADDRESS) |
 			MCF_SDRAMC_SDCS_CSSZ(MCF_SDRAMC_SDCS_CSSZ_32MBYTE),
 			MCF_SDRAMC_SDCS0);
 
 	/*
 	 * Basic configuration and initialization
 	 */
-	writel(MCF_SDRAMC_SDCFG1_SRD2RW((int)((SDRAM_CASL + 2) + 0.5)) |
+	__raw_writel(MCF_SDRAMC_SDCFG1_SRD2RW((int)((SDRAM_CASL + 2) + 0.5)) |
 		MCF_SDRAMC_SDCFG1_SWT2RD(SDRAM_TWR + 1) |
 		MCF_SDRAMC_SDCFG1_RDLAT((int)((SDRAM_CASL * 2) + 2)) |
 		MCF_SDRAMC_SDCFG1_ACT2RW((int)(SDRAM_TRCD + 0.5)) |
@@ -388,7 +388,7 @@ void sdramc_init(void)
 		MCF_SDRAMC_SDCFG1_REF2ACT((int)(SDRAM_TRFC + 0.5)) |
 		MCF_SDRAMC_SDCFG1_WTLAT(3),
 		MCF_SDRAMC_SDCFG1);
-	writel(MCF_SDRAMC_SDCFG2_BRD2PRE(SDRAM_BL / 2 + 1) |
+	__raw_writel(MCF_SDRAMC_SDCFG2_BRD2PRE(SDRAM_BL / 2 + 1) |
 		MCF_SDRAMC_SDCFG2_BWT2RW(SDRAM_BL / 2 + SDRAM_TWR) |
 		MCF_SDRAMC_SDCFG2_BRD2WT((int)((SDRAM_CASL + SDRAM_BL / 2 - 1.0) + 0.5)) |
 		MCF_SDRAMC_SDCFG2_BL(SDRAM_BL - 1),
@@ -398,7 +398,7 @@ void sdramc_init(void)
 	/*
 	 * Precharge and enable write to SDMR
 	 */
-	writel(MCF_SDRAMC_SDCR_MODE_EN |
+	__raw_writel(MCF_SDRAMC_SDCR_MODE_EN |
 		MCF_SDRAMC_SDCR_CKE |
 		MCF_SDRAMC_SDCR_DDR |
 		MCF_SDRAMC_SDCR_MUX(1) |
@@ -410,7 +410,7 @@ void sdramc_init(void)
 	/*
 	 * Write extended mode register
 	 */
-	writel(MCF_SDRAMC_SDMR_BNKAD_LEMR |
+	__raw_writel(MCF_SDRAMC_SDMR_BNKAD_LEMR |
 		MCF_SDRAMC_SDMR_AD(0x0) |
 		MCF_SDRAMC_SDMR_CMD,
 		MCF_SDRAMC_SDMR);
@@ -418,7 +418,7 @@ void sdramc_init(void)
 	/*
 	 * Write mode register and reset DLL
 	 */
-	writel(MCF_SDRAMC_SDMR_BNKAD_LMR |
+	__raw_writel(MCF_SDRAMC_SDMR_BNKAD_LMR |
 		MCF_SDRAMC_SDMR_AD(0x163) |
 		MCF_SDRAMC_SDMR_CMD,
 		MCF_SDRAMC_SDMR);
@@ -426,18 +426,18 @@ void sdramc_init(void)
 	/*
 	 * Execute a PALL command
 	 */
-	writel(readl(MCF_SDRAMC_SDCR) | MCF_SDRAMC_SDCR_IPALL, MCF_SDRAMC_SDCR);
+	__raw_writel(__raw_readl(MCF_SDRAMC_SDCR) | MCF_SDRAMC_SDCR_IPALL, MCF_SDRAMC_SDCR);
 
 	/*
 	 * Perform two REF cycles
 	 */
-	writel(readl(MCF_SDRAMC_SDCR) | MCF_SDRAMC_SDCR_IREF, MCF_SDRAMC_SDCR);
-	writel(readl(MCF_SDRAMC_SDCR) | MCF_SDRAMC_SDCR_IREF, MCF_SDRAMC_SDCR);
+	__raw_writel(__raw_readl(MCF_SDRAMC_SDCR) | MCF_SDRAMC_SDCR_IREF, MCF_SDRAMC_SDCR);
+	__raw_writel(__raw_readl(MCF_SDRAMC_SDCR) | MCF_SDRAMC_SDCR_IREF, MCF_SDRAMC_SDCR);
 
 	/*
 	 * Write mode register and clear reset DLL
 	 */
-	writel(MCF_SDRAMC_SDMR_BNKAD_LMR |
+	__raw_writel(MCF_SDRAMC_SDMR_BNKAD_LMR |
 		MCF_SDRAMC_SDMR_AD(0x063) |
 		MCF_SDRAMC_SDMR_CMD,
 		MCF_SDRAMC_SDMR);
@@ -445,9 +445,9 @@ void sdramc_init(void)
 	/*
 	 * Enable auto refresh and lock SDMR
 	 */
-	writel(readl(MCF_SDRAMC_SDCR) & ~MCF_SDRAMC_SDCR_MODE_EN,
+	__raw_writel(__raw_readl(MCF_SDRAMC_SDCR) & ~MCF_SDRAMC_SDCR_MODE_EN,
 		MCF_SDRAMC_SDCR);
-	writel(MCF_SDRAMC_SDCR_REF | MCF_SDRAMC_SDCR_DQS_OE(0xC),
+	__raw_writel(MCF_SDRAMC_SDCR_REF | MCF_SDRAMC_SDCR_DQS_OE(0xC),
 		MCF_SDRAMC_SDCR);
 	}
 }
@@ -502,9 +502,9 @@ int clock_pll(int fsys, int flags)
 	 * If it has then the SDRAM needs to be put into self refresh
 	 * mode before reprogramming the PLL.
 	 */
-	if (readl(MCF_SDRAMC_SDCR) & MCF_SDRAMC_SDCR_REF)
+	if (__raw_readl(MCF_SDRAMC_SDCR) & MCF_SDRAMC_SDCR_REF)
 		/* Put SDRAM into self refresh mode */
-		writel(readl(MCF_SDRAMC_SDCR) & ~MCF_SDRAMC_SDCR_CKE,
+		__raw_writel(__raw_readl(MCF_SDRAMC_SDCR) & ~MCF_SDRAMC_SDCR_CKE,
 			MCF_SDRAMC_SDCR);
 
 	/*
@@ -527,13 +527,13 @@ int clock_pll(int fsys, int flags)
 	/*
 	 * Return the SDRAM to normal operation if it is in use.
 	 */
-	if (readl(MCF_SDRAMC_SDCR) & MCF_SDRAMC_SDCR_REF)
+	if (__raw_readl(MCF_SDRAMC_SDCR) & MCF_SDRAMC_SDCR_REF)
 		/* Exit self refresh mode */
-		writel(readl(MCF_SDRAMC_SDCR) | MCF_SDRAMC_SDCR_CKE,
+		__raw_writel(__raw_readl(MCF_SDRAMC_SDCR) | MCF_SDRAMC_SDCR_CKE,
 			MCF_SDRAMC_SDCR);
 
 	/* Errata - workaround for SDRAM operation after exiting LIMP mode */
-	writel(MCF_SDRAMC_REFRESH, MCF_SDRAMC_LIMP_FIX);
+	__raw_writel(MCF_SDRAMC_REFRESH, MCF_SDRAMC_LIMP_FIX);
 
 	/* wait for DQS logic to relock */
 	for (i = 0; i < 0x200; i++)
diff --git a/arch/m68k/coldfire/m54xx.c b/arch/m68k/coldfire/m54xx.c
index 8e3c8fee8327..83203f4ba37e 100644
--- a/arch/m68k/coldfire/m54xx.c
+++ b/arch/m68k/coldfire/m54xx.c
@@ -67,9 +67,9 @@ static void __init m54xx_i2c_init(void)
 	u32 r;
 
 	/* set the fec/i2c/irq pin assignment register for i2c */
-	r = readl(MCF_PAR_FECI2CIRQ);
+	r = __raw_readl(MCF_PAR_FECI2CIRQ);
 	r |= MCF_PAR_FECI2CIRQ_SDA | MCF_PAR_FECI2CIRQ_SCL;
-	writel(r, MCF_PAR_FECI2CIRQ);
+	__raw_writel(r, MCF_PAR_FECI2CIRQ);
 #endif /* IS_ENABLED(CONFIG_I2C_IMX) */
 }
 
diff --git a/arch/m68k/include/asm/io_no.h b/arch/m68k/include/asm/io_no.h
index 516371d5587a..73bdd47abdac 100644
--- a/arch/m68k/include/asm/io_no.h
+++ b/arch/m68k/include/asm/io_no.h
@@ -55,58 +55,6 @@ static int cf_internalio(const volatile void __iomem *addr)
 	return __cf_internalio((unsigned long) addr);
 }
 
-/*
- * We need to treat built-in peripherals and bus based address ranges
- * differently. Local built-in peripherals (and the ColdFire SoC parts
- * have quite a lot of them) are always native endian - which is big
- * endian on m68k/ColdFire. Bus based address ranges, like the PCI bus,
- * are accessed little endian - so we need to byte swap those.
- */
-#define readw readw
-static inline u16 readw(const volatile void __iomem *addr)
-{
-	if (cf_internalio(addr))
-		return __raw_readw(addr);
-	return swab16(__raw_readw(addr));
-}
-
-#define readl readl
-static inline u32 readl(const volatile void __iomem *addr)
-{
-	if (cf_internalio(addr))
-		return __raw_readl(addr);
-	return swab32(__raw_readl(addr));
-}
-
-#define writew writew
-static inline void writew(u16 value, volatile void __iomem *addr)
-{
-	if (cf_internalio(addr))
-		__raw_writew(value, addr);
-	else
-		__raw_writew(swab16(value), addr);
-}
-
-#define writel writel
-static inline void writel(u32 value, volatile void __iomem *addr)
-{
-	if (cf_internalio(addr))
-		__raw_writel(value, addr);
-	else
-		__raw_writel(swab32(value), addr);
-}
-
-#else
-
-#define readb __raw_readb
-#define readw __raw_readw
-#define readl __raw_readl
-#define writeb __raw_writeb
-#define writew __raw_writew
-#define writel __raw_writel
-
-#endif /* IOMEMBASE */
-
 #if defined(CONFIG_PCI)
 /*
  * Support for PCI bus access uses the asm-generic access functions.

