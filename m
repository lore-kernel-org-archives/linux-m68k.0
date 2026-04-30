Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D5752C2349
	for <linux-m68k@lists.linux-m68k.org>; Thu, 30 Apr 2026 05:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.234.252.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777526608; cv=none; b=MyuO8vfV5CqQSqtlENjI5e+X4rofK3uQAqee/tFXMXECZWiGfEDm2QYZIhy/QyM4XPU7ci5UlmTJPrHKS98zhZsq4J2+lfAtYS8RSSU7v6slUqUCk8OLsodK781yCY8D329dmMNjzvS3C4czTfXIICWz8Uig23T8Xe4DOEN+HBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777526608; c=relaxed/simple;
	bh=OFF5fZ0JrXvimY2oSYOjH1YyrtCWemmuoL5WqVQa6b8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ezB2R846W6726hFY7l9xTCzgQYZQPCUpsbOJKmFpcANpIhOS8GQdVXT97zTTr0A2zuRGxz/J1a/BEpJzthqlWEwLQNt3TAGJIy7r8V9bH49zAAqC8kiHIVvhmHghi2LJua5EPsrrPbIXMRiR9D+wrlvX5M4O4xVJIKgjasdifs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=kernel.org; arc=none smtp.client-ip=172.234.252.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1AC8643FF2;
	Thu, 30 Apr 2026 05:23:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A17B9C2BCB8;
	Thu, 30 Apr 2026 05:23:24 +0000 (UTC)
From: Greg Ungerer <gerg@linux-m68k.org>
To: linux-m68k@lists.linux-m68k.org
Cc: arnd@kernel.org,
	Greg Ungerer <gerg@kernel.org>,
	Greg Ungerer <gerg@linux-m68k.org>
Subject: [PATCH 7/7] m68k: coldfire: use ColdFire specifc IO access in SoC code
Date: Thu, 30 Apr 2026 15:19:23 +1000
Message-ID: <20260430052047.1827575-8-gerg@linux-m68k.org>
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

Convert all coldfire specific SoC/board setup code to only use the
newly created internal register access methods. This is replacing the
mixed and inconsistent use of readx/writex and __raw_readx/__raw_writex
for internal SoC registers.

Signed-off-by: Greg Ungerer <gerg@linux-m68k.org>
---
 arch/m68k/coldfire/m5206.c   |   2 +-
 arch/m68k/coldfire/m520x.c   |  26 ++++----
 arch/m68k/coldfire/m523x.c   |  12 ++--
 arch/m68k/coldfire/m5249.c   |  16 ++---
 arch/m68k/coldfire/m525x.c   |  12 ++--
 arch/m68k/coldfire/m5272.c   |  16 ++---
 arch/m68k/coldfire/m527x.c   |  40 ++++++------
 arch/m68k/coldfire/m528x.c   |  28 ++++----
 arch/m68k/coldfire/m5307.c   |   2 +-
 arch/m68k/coldfire/m53xx.c   | 122 +++++++++++++++++------------------
 arch/m68k/coldfire/m5407.c   |   2 +-
 arch/m68k/coldfire/m5441x.c  |  12 ++--
 arch/m68k/coldfire/m54xx.c   |  18 +++---
 arch/m68k/coldfire/nettel.c  |  16 ++---
 arch/m68k/coldfire/stmark2.c |  12 ++--
 15 files changed, 168 insertions(+), 168 deletions(-)

diff --git a/arch/m68k/coldfire/m5206.c b/arch/m68k/coldfire/m5206.c
index 5e726e94b5ab..eff7d56bbb94 100644
--- a/arch/m68k/coldfire/m5206.c
+++ b/arch/m68k/coldfire/m5206.c
@@ -40,7 +40,7 @@ static struct clk_lookup m5206_clk_lookup[] = {
 static void __init m5206_i2c_init(void)
 {
 #if IS_ENABLED(CONFIG_I2C_IMX)
-	writeb(MCFSIM_ICR_AUTOVEC | MCFSIM_ICR_LEVEL5 | MCFSIM_ICR_PRI0,
+	mcf_write8(MCFSIM_ICR_AUTOVEC | MCFSIM_ICR_LEVEL5 | MCFSIM_ICR_PRI0,
 	       MCFSIM_I2CICR);
 	mcf_mapirq2imr(MCF_IRQ_I2C0, MCFINTC_I2C);
 #endif /* IS_ENABLED(CONFIG_I2C_IMX) */
diff --git a/arch/m68k/coldfire/m520x.c b/arch/m68k/coldfire/m520x.c
index d2f96b40aee1..08644be99837 100644
--- a/arch/m68k/coldfire/m520x.c
+++ b/arch/m68k/coldfire/m520x.c
@@ -125,11 +125,11 @@ static void __init m520x_qspi_init(void)
 #if IS_ENABLED(CONFIG_SPI_COLDFIRE_QSPI)
 	u16 par;
 	/* setup Port QS for QSPI with gpio CS control */
-	writeb(0x3f, MCF_GPIO_PAR_QSPI);
+	mcf_write8(0x3f, MCF_GPIO_PAR_QSPI);
 	/* make U1CTS and U2RTS gpio for cs_control */
-	par = readw(MCF_GPIO_PAR_UART);
+	par = mcf_read16(MCF_GPIO_PAR_UART);
 	par &= 0x00ff;
-	writew(par, MCF_GPIO_PAR_UART);
+	mcf_write16(par, MCF_GPIO_PAR_UART);
 #endif /* IS_ENABLED(CONFIG_SPI_COLDFIRE_QSPI) */
 }
 
@@ -142,9 +142,9 @@ static void __init m520x_i2c_init(void)
 
 	/* setup Port FECI2C Pin Assignment Register for I2C */
 	/*  set PAR_SCL to SCL and PAR_SDA to SDA */
-	par = readb(MCF_GPIO_PAR_FECI2C);
+	par = mcf_read8(MCF_GPIO_PAR_FECI2C);
 	par |= 0x0f;
-	writeb(par, MCF_GPIO_PAR_FECI2C);
+	mcf_write8(par, MCF_GPIO_PAR_FECI2C);
 #endif /* IS_ENABLED(CONFIG_I2C_IMX) */
 }
 
@@ -156,17 +156,17 @@ static void __init m520x_uarts_init(void)
 	u8 par2;
 
 	/* UART0 and UART1 GPIO pin setup */
-	par = readw(MCF_GPIO_PAR_UART);
+	par = mcf_read16(MCF_GPIO_PAR_UART);
 	par |= MCF_GPIO_PAR_UART_PAR_UTXD0 | MCF_GPIO_PAR_UART_PAR_URXD0;
 	par |= MCF_GPIO_PAR_UART_PAR_UTXD1 | MCF_GPIO_PAR_UART_PAR_URXD1;
-	writew(par, MCF_GPIO_PAR_UART);
+	mcf_write16(par, MCF_GPIO_PAR_UART);
 
 	/* UART1 GPIO pin setup */
-	par2 = readb(MCF_GPIO_PAR_FECI2C);
+	par2 = mcf_read8(MCF_GPIO_PAR_FECI2C);
 	par2 &= ~0x0F;
 	par2 |= MCF_GPIO_PAR_FECI2C_PAR_SCL_UTXD2 |
 		MCF_GPIO_PAR_FECI2C_PAR_SDA_URXD2;
-	writeb(par2, MCF_GPIO_PAR_FECI2C);
+	mcf_write8(par2, MCF_GPIO_PAR_FECI2C);
 }
 
 /***************************************************************************/
@@ -176,11 +176,11 @@ static void __init m520x_fec_init(void)
 	u8 v;
 
 	/* Set multi-function pins to ethernet mode */
-	v = readb(MCF_GPIO_PAR_FEC);
-	writeb(v | 0xf0, MCF_GPIO_PAR_FEC);
+	v = mcf_read8(MCF_GPIO_PAR_FEC);
+	mcf_write8(v | 0xf0, MCF_GPIO_PAR_FEC);
 
-	v = readb(MCF_GPIO_PAR_FECI2C);
-	writeb(v | 0x0f, MCF_GPIO_PAR_FECI2C);
+	v = mcf_read8(MCF_GPIO_PAR_FECI2C);
+	mcf_write8(v | 0x0f, MCF_GPIO_PAR_FECI2C);
 }
 
 /***************************************************************************/
diff --git a/arch/m68k/coldfire/m523x.c b/arch/m68k/coldfire/m523x.c
index 83a997313393..11d7423ef646 100644
--- a/arch/m68k/coldfire/m523x.c
+++ b/arch/m68k/coldfire/m523x.c
@@ -51,11 +51,11 @@ static void __init m523x_qspi_init(void)
 	u16 par;
 
 	/* setup QSPS pins for QSPI with gpio CS control */
-	writeb(0x1f, MCFGPIO_PAR_QSPI);
+	mcf_write8(0x1f, MCFGPIO_PAR_QSPI);
 	/* and CS2 & CS3 as gpio */
-	par = readw(MCFGPIO_PAR_TIMER);
+	par = mcf_read16(MCFGPIO_PAR_TIMER);
 	par &= 0x3f3f;
-	writew(par, MCFGPIO_PAR_TIMER);
+	mcf_write16(par, MCFGPIO_PAR_TIMER);
 #endif /* IS_ENABLED(CONFIG_SPI_COLDFIRE_QSPI) */
 }
 
@@ -68,9 +68,9 @@ static void __init m523x_i2c_init(void)
 
 	/* setup Port AS Pin Assignment Register for I2C */
 	/*  set PASPA0 to SCL and PASPA1 to SDA */
-	par = readb(MCFGPIO_PAR_FECI2C);
+	par = mcf_read8(MCFGPIO_PAR_FECI2C);
 	par |= 0x0f;
-	writeb(par, MCFGPIO_PAR_FECI2C);
+	mcf_write8(par, MCFGPIO_PAR_FECI2C);
 #endif /* IS_ENABLED(CONFIG_I2C_IMX) */
 }
 
@@ -79,7 +79,7 @@ static void __init m523x_i2c_init(void)
 static void __init m523x_fec_init(void)
 {
 	/* Set multi-function pins to ethernet use */
-	writeb(readb(MCFGPIO_PAR_FECI2C) | 0xf0, MCFGPIO_PAR_FECI2C);
+	mcf_write8(read8(MCFGPIO_PAR_FECI2C) | 0xf0, MCFGPIO_PAR_FECI2C);
 }
 
 /***************************************************************************/
diff --git a/arch/m68k/coldfire/m5249.c b/arch/m68k/coldfire/m5249.c
index 6d66972de214..5a0495a2b6fe 100644
--- a/arch/m68k/coldfire/m5249.c
+++ b/arch/m68k/coldfire/m5249.c
@@ -75,7 +75,7 @@ static void __init m5249_qspi_init(void)
 {
 #if IS_ENABLED(CONFIG_SPI_COLDFIRE_QSPI)
 	/* QSPI irq setup */
-	writeb(MCFSIM_ICR_AUTOVEC | MCFSIM_ICR_LEVEL4 | MCFSIM_ICR_PRI0,
+	mcf_write8(MCFSIM_ICR_AUTOVEC | MCFSIM_ICR_LEVEL4 | MCFSIM_ICR_PRI0,
 	       MCFSIM_QSPIICR);
 	mcf_mapirq2imr(MCF_IRQ_QSPI, MCFINTC_QSPI);
 #endif /* IS_ENABLED(CONFIG_SPI_COLDFIRE_QSPI) */
@@ -89,15 +89,15 @@ static void __init m5249_i2c_init(void)
 	u32 r;
 
 	/* first I2C controller uses regular irq setup */
-	writeb(MCFSIM_ICR_AUTOVEC | MCFSIM_ICR_LEVEL5 | MCFSIM_ICR_PRI0,
+	mcf_write8(MCFSIM_ICR_AUTOVEC | MCFSIM_ICR_LEVEL5 | MCFSIM_ICR_PRI0,
 	       MCFSIM_I2CICR);
 	mcf_mapirq2imr(MCF_IRQ_I2C0, MCFINTC_I2C);
 
 	/* second I2C controller is completely different */
-	r = readl(MCFINTC2_INTPRI_REG(MCF_IRQ_I2C1));
+	r = mcf_read32(MCFINTC2_INTPRI_REG(MCF_IRQ_I2C1));
 	r &= ~MCFINTC2_INTPRI_BITS(0xf, MCF_IRQ_I2C1);
 	r |= MCFINTC2_INTPRI_BITS(0x5, MCF_IRQ_I2C1);
-	writel(r, MCFINTC2_INTPRI_REG(MCF_IRQ_I2C1));
+	mcf_write32(r, MCFINTC2_INTPRI_REG(MCF_IRQ_I2C1));
 #endif /* CONFIG_I2C_IMX */
 }
 
@@ -110,11 +110,11 @@ static void __init m5249_smc91x_init(void)
 	u32  gpio;
 
 	/* Set the GPIO line as interrupt source for smc91x device */
-	gpio = readl(MCFSIM2_GPIOINTENABLE);
-	writel(gpio | 0x40, MCFSIM2_GPIOINTENABLE);
+	gpio = mcf_read32(MCFSIM2_GPIOINTENABLE);
+	mcf_write32(gpio | 0x40, MCFSIM2_GPIOINTENABLE);
 
-	gpio = readl(MCFINTC2_INTPRI5);
-	writel(gpio | 0x04000000, MCFINTC2_INTPRI5);
+	gpio = mcf_read32(MCFINTC2_INTPRI5);
+	mcf_write32(gpio | 0x04000000, MCFINTC2_INTPRI5);
 }
 
 #endif /* CONFIG_M5249C3 */
diff --git a/arch/m68k/coldfire/m525x.c b/arch/m68k/coldfire/m525x.c
index 485375112e28..8061ca7af99f 100644
--- a/arch/m68k/coldfire/m525x.c
+++ b/arch/m68k/coldfire/m525x.c
@@ -44,12 +44,12 @@ static void __init m525x_qspi_init(void)
 #if IS_ENABLED(CONFIG_SPI_COLDFIRE_QSPI)
 	/* set the GPIO function for the qspi cs gpios */
 	/* FIXME: replace with pinmux/pinctl support */
-	u32 f = readl(MCFSIM2_GPIOFUNC);
+	u32 f = mcf_read32(MCFSIM2_GPIOFUNC);
 	f |= (1 << MCFQSPI_CS2) | (1 << MCFQSPI_CS1) | (1 << MCFQSPI_CS0);
-	writel(f, MCFSIM2_GPIOFUNC);
+	mcf_write32(f, MCFSIM2_GPIOFUNC);
 
 	/* QSPI irq setup */
-	writeb(MCFSIM_ICR_AUTOVEC | MCFSIM_ICR_LEVEL4 | MCFSIM_ICR_PRI0,
+	mcf_write8(MCFSIM_ICR_AUTOVEC | MCFSIM_ICR_LEVEL4 | MCFSIM_ICR_PRI0,
 	       MCFSIM_QSPIICR);
 	mcf_mapirq2imr(MCF_IRQ_QSPI, MCFINTC_QSPI);
 #endif /* IS_ENABLED(CONFIG_SPI_COLDFIRE_QSPI) */
@@ -61,15 +61,15 @@ static void __init m525x_i2c_init(void)
 	u32 r;
 
 	/* first I2C controller uses regular irq setup */
-	writeb(MCFSIM_ICR_AUTOVEC | MCFSIM_ICR_LEVEL5 | MCFSIM_ICR_PRI0,
+	mcf_write8(MCFSIM_ICR_AUTOVEC | MCFSIM_ICR_LEVEL5 | MCFSIM_ICR_PRI0,
 	       MCFSIM_I2CICR);
 	mcf_mapirq2imr(MCF_IRQ_I2C0, MCFINTC_I2C);
 
 	/* second I2C controller is completely different */
-	r = readl(MCFINTC2_INTPRI_REG(MCF_IRQ_I2C1));
+	r = mcf_read32(MCFINTC2_INTPRI_REG(MCF_IRQ_I2C1));
 	r &= ~MCFINTC2_INTPRI_BITS(0xf, MCF_IRQ_I2C1);
 	r |= MCFINTC2_INTPRI_BITS(0x5, MCF_IRQ_I2C1);
-	writel(r, MCFINTC2_INTPRI_REG(MCF_IRQ_I2C1));
+	mcf_write32(r, MCFINTC2_INTPRI_REG(MCF_IRQ_I2C1));
 #endif /* IS_ENABLED(CONFIG_I2C_IMX) */
 }
 
diff --git a/arch/m68k/coldfire/m5272.c b/arch/m68k/coldfire/m5272.c
index 28b3ffa25ba0..bf38cf1a7357 100644
--- a/arch/m68k/coldfire/m5272.c
+++ b/arch/m68k/coldfire/m5272.c
@@ -55,13 +55,13 @@ static void __init m5272_uarts_init(void)
 	u32 v;
 
 	/* Enable the output lines for the serial ports */
-	v = readl(MCFSIM_PBCNT);
+	v = mcf_read32(MCFSIM_PBCNT);
 	v = (v & ~0x000000ff) | 0x00000055;
-	writel(v, MCFSIM_PBCNT);
+	mcf_write32(v, MCFSIM_PBCNT);
 
-	v = readl(MCFSIM_PDCNT);
+	v = mcf_read32(MCFSIM_PDCNT);
 	v = (v & ~0x000003fc) | 0x000002a8;
-	writel(v, MCFSIM_PDCNT);
+	mcf_write32(v, MCFSIM_PDCNT);
 }
 
 /***************************************************************************/
@@ -70,9 +70,9 @@ static void m5272_cpu_reset(void)
 {
 	local_irq_disable();
 	/* Set watchdog to reset, and enabled */
-	__raw_writew(0, MCFSIM_WIRR);
-	__raw_writew(1, MCFSIM_WRRR);
-	__raw_writew(0, MCFSIM_WCR);
+	mcf_write16(0, MCFSIM_WIRR);
+	mcf_write16(1, MCFSIM_WRRR);
+	mcf_write16(0, MCFSIM_WCR);
 	for (;;)
 		/* wait for watchdog to timeout */;
 }
@@ -83,7 +83,7 @@ void __init config_BSP(char *commandp, int size)
 {
 #if defined (CONFIG_MOD5272)
 	/* Set base of device vectors to be 64 */
-	writeb(0x40, MCFSIM_PIVR);
+	mcf_write8(0x40, MCFSIM_PIVR);
 #endif
 
 #if defined(CONFIG_NETtel) || defined(CONFIG_SCALES)
diff --git a/arch/m68k/coldfire/m527x.c b/arch/m68k/coldfire/m527x.c
index 037f3e520acc..648f4d3dd358 100644
--- a/arch/m68k/coldfire/m527x.c
+++ b/arch/m68k/coldfire/m527x.c
@@ -54,14 +54,14 @@ static void __init m527x_qspi_init(void)
 	u16 par;
 
 	/* setup QSPS pins for QSPI with gpio CS control */
-	writeb(0x1f, MCFGPIO_PAR_QSPI);
+	mcf_write8(0x1f, MCFGPIO_PAR_QSPI);
 	/* and CS2 & CS3 as gpio */
-	par = readw(MCFGPIO_PAR_TIMER);
+	par = mcf_read16(MCFGPIO_PAR_TIMER);
 	par &= 0x3f3f;
-	writew(par, MCFGPIO_PAR_TIMER);
+	mcf_write16(par, MCFGPIO_PAR_TIMER);
 #elif defined(CONFIG_M5275)
 	/* setup QSPS pins for QSPI with gpio CS control */
-	writew(0x003e, MCFGPIO_PAR_QSPI);
+	mcf_write16(0x003e, MCFGPIO_PAR_QSPI);
 #endif
 #endif /* IS_ENABLED(CONFIG_SPI_COLDFIRE_QSPI) */
 }
@@ -76,17 +76,17 @@ static void __init m527x_i2c_init(void)
 
 	/* setup Port FECI2C Pin Assignment Register for I2C */
 	/*  set PAR_SCL to SCL and PAR_SDA to SDA */
-	par = readb(MCFGPIO_PAR_FECI2C);
+	par = mcf_read8(MCFGPIO_PAR_FECI2C);
 	par |= 0x0f;
-	writeb(par, MCFGPIO_PAR_FECI2C);
+	mcf_write8(par, MCFGPIO_PAR_FECI2C);
 #elif defined(CONFIG_M5275)
 	u16 par;
 
 	/* setup Port FECI2C Pin Assignment Register for I2C */
 	/*  set PAR_SCL to SCL and PAR_SDA to SDA */
-	par = readw(MCFGPIO_PAR_FECI2C);
+	par = mcf_read16(MCFGPIO_PAR_FECI2C);
 	par |= 0x0f;
-	writew(par, MCFGPIO_PAR_FECI2C);
+	mcf_write16(par, MCFGPIO_PAR_FECI2C);
 #endif
 #endif /* IS_ENABLED(CONFIG_I2C_IMX) */
 }
@@ -100,9 +100,9 @@ static void __init m527x_uarts_init(void)
 	/*
 	 * External Pin Mask Setting & Enable External Pin for Interface
 	 */
-	sepmask = readw(MCFGPIO_PAR_UART);
+	sepmask = mcf_read16(MCFGPIO_PAR_UART);
 	sepmask |= UART0_ENABLE_MASK | UART1_ENABLE_MASK | UART2_ENABLE_MASK;
-	writew(sepmask, MCFGPIO_PAR_UART);
+	mcf_write16(sepmask, MCFGPIO_PAR_UART);
 }
 
 /***************************************************************************/
@@ -113,21 +113,21 @@ static void __init m527x_fec_init(void)
 
 	/* Set multi-function pins to ethernet mode for fec0 */
 #if defined(CONFIG_M5271)
-	v = readb(MCFGPIO_PAR_FECI2C);
-	writeb(v | 0xf0, MCFGPIO_PAR_FECI2C);
+	v = mcf_read8(MCFGPIO_PAR_FECI2C);
+	mcf_write8(v | 0xf0, MCFGPIO_PAR_FECI2C);
 #else
 	u16 par;
 
-	par = readw(MCFGPIO_PAR_FECI2C);
-	writew(par | 0xf00, MCFGPIO_PAR_FECI2C);
-	v = readb(MCFGPIO_PAR_FEC0HL);
-	writeb(v | 0xc0, MCFGPIO_PAR_FEC0HL);
+	par = mcf_read16(MCFGPIO_PAR_FECI2C);
+	mcf_write16(par | 0xf00, MCFGPIO_PAR_FECI2C);
+	v = mcf_read8(MCFGPIO_PAR_FEC0HL);
+	mcf_write8(v | 0xc0, MCFGPIO_PAR_FEC0HL);
 
 	/* Set multi-function pins to ethernet mode for fec1 */
-	par = readw(MCFGPIO_PAR_FECI2C);
-	writew(par | 0xa0, MCFGPIO_PAR_FECI2C);
-	v = readb(MCFGPIO_PAR_FEC1HL);
-	writeb(v | 0xc0, MCFGPIO_PAR_FEC1HL);
+	par = mcf_read16(MCFGPIO_PAR_FECI2C);
+	mcf_write16(par | 0xa0, MCFGPIO_PAR_FECI2C);
+	v = mcf_read8(MCFGPIO_PAR_FEC1HL);
+	mcf_write8(v | 0xc0, MCFGPIO_PAR_FEC1HL);
 #endif
 }
 
diff --git a/arch/m68k/coldfire/m528x.c b/arch/m68k/coldfire/m528x.c
index 51a6a6236e12..b244c9ba40a7 100644
--- a/arch/m68k/coldfire/m528x.c
+++ b/arch/m68k/coldfire/m528x.c
@@ -51,7 +51,7 @@ static void __init m528x_qspi_init(void)
 {
 #if IS_ENABLED(CONFIG_SPI_COLDFIRE_QSPI)
 	/* setup Port QS for QSPI with gpio CS control */
-	__raw_writeb(0x07, MCFGPIO_PQSPAR);
+	mcf_write8(0x07, MCFGPIO_PQSPAR);
 #endif /* IS_ENABLED(CONFIG_SPI_COLDFIRE_QSPI) */
 }
 
@@ -64,9 +64,9 @@ static void __init m528x_i2c_init(void)
 
 	/* setup Port AS Pin Assignment Register for I2C */
 	/*  set PASPA0 to SCL and PASPA1 to SDA */
-	paspar = readw(MCFGPIO_PASPAR);
+	paspar = mcf_read16(MCFGPIO_PASPAR);
 	paspar |= 0xF;
-	writew(paspar, MCFGPIO_PASPAR);
+	mcf_write16(paspar, MCFGPIO_PASPAR);
 #endif /* IS_ENABLED(CONFIG_I2C_IMX) */
 }
 
@@ -77,9 +77,9 @@ static void __init m528x_uarts_init(void)
 	u8 port;
 
 	/* make sure PUAPAR is set for UART0 and UART1 */
-	port = readb(MCFGPIO_PUAPAR);
+	port = mcf_read8(MCFGPIO_PUAPAR);
 	port |= 0x03 | (0x03 << 2);
-	writeb(port, MCFGPIO_PUAPAR);
+	mcf_write8(port, MCFGPIO_PUAPAR);
 }
 
 /***************************************************************************/
@@ -89,9 +89,9 @@ static void __init m528x_fec_init(void)
 	u16 v16;
 
 	/* Set multi-function pins to ethernet mode for fec0 */
-	v16 = readw(MCFGPIO_PASPAR);
-	writew(v16 | 0xf00, MCFGPIO_PASPAR);
-	writeb(0xc0, MCFGPIO_PEHLPAR);
+	v16 = mcf_read16(MCFGPIO_PASPAR);
+	mcf_write16(v16 | 0xf00, MCFGPIO_PASPAR);
+	mcf_write8(0xc0, MCFGPIO_PEHLPAR);
 }
 
 /***************************************************************************/
@@ -99,8 +99,8 @@ static void __init m528x_fec_init(void)
 #ifdef CONFIG_WILDFIRE
 void wildfire_halt(void)
 {
-	writeb(0, 0x30000007);
-	writeb(0x2, 0x30000007);
+	mcf_write8(0, 0x30000007);
+	mcf_write8(0x2, 0x30000007);
 }
 #endif
 
@@ -110,14 +110,14 @@ void wildfiremod_halt(void)
 	printk(KERN_INFO "WildFireMod hibernating...\n");
 
 	/* Set portE.5 to Digital IO */
-	writew(readw(MCFGPIO_PEPAR) & ~(1 << (5 * 2)), MCFGPIO_PEPAR);
+	mcf_write16(read16(MCFGPIO_PEPAR) & ~(1 << (5 * 2)), MCFGPIO_PEPAR);
 
 	/* Make portE.5 an output */
-	writeb(readb(MCFGPIO_PDDR_E) | (1 << 5), MCFGPIO_PDDR_E);
+	mcf_write8(read8(MCFGPIO_PDDR_E) | (1 << 5), MCFGPIO_PDDR_E);
 
 	/* Now toggle portE.5 from low to high */
-	writeb(readb(MCFGPIO_PODR_E) & ~(1 << 5), MCFGPIO_PODR_E);
-	writeb(readb(MCFGPIO_PODR_E) | (1 << 5), MCFGPIO_PODR_E);
+	mcf_write8(read8(MCFGPIO_PODR_E) & ~(1 << 5), MCFGPIO_PODR_E);
+	mcf_write8(read8(MCFGPIO_PODR_E) | (1 << 5), MCFGPIO_PODR_E);
 
 	printk(KERN_EMERG "Failed to hibernate. Halting!\n");
 }
diff --git a/arch/m68k/coldfire/m5307.c b/arch/m68k/coldfire/m5307.c
index 4ed2e43ab3ad..fc8f543b9791 100644
--- a/arch/m68k/coldfire/m5307.c
+++ b/arch/m68k/coldfire/m5307.c
@@ -49,7 +49,7 @@ static struct clk_lookup m5307_clk_lookup[] = {
 static void __init m5307_i2c_init(void)
 {
 #if IS_ENABLED(CONFIG_I2C_IMX)
-	writeb(MCFSIM_ICR_AUTOVEC | MCFSIM_ICR_LEVEL5 | MCFSIM_ICR_PRI0,
+	mcf_write8(MCFSIM_ICR_AUTOVEC | MCFSIM_ICR_LEVEL5 | MCFSIM_ICR_PRI0,
 	       MCFSIM_I2CICR);
 	mcf_mapirq2imr(MCF_IRQ_I2C0, MCFINTC_I2C);
 #endif /* IS_ENABLED(CONFIG_I2C_IMX) */
diff --git a/arch/m68k/coldfire/m53xx.c b/arch/m68k/coldfire/m53xx.c
index 17af5f673796..88d4f8da055c 100644
--- a/arch/m68k/coldfire/m53xx.c
+++ b/arch/m68k/coldfire/m53xx.c
@@ -166,7 +166,7 @@ static void __init m53xx_qspi_init(void)
 {
 #if IS_ENABLED(CONFIG_SPI_COLDFIRE_QSPI)
 	/* setup QSPS pins for QSPI with gpio CS control */
-	writew(0x01f0, MCFGPIO_PAR_QSPI);
+	mcf_write16(0x01f0, MCFGPIO_PAR_QSPI);
 #endif /* IS_ENABLED(CONFIG_SPI_COLDFIRE_QSPI) */
 }
 
@@ -177,9 +177,9 @@ static void __init m53xx_i2c_init(void)
 #if IS_ENABLED(CONFIG_I2C_IMX)
 	/* setup Port AS Pin Assignment Register for I2C */
 	/*  set PASPA0 to SCL and PASPA1 to SDA */
-	u8 r = readb(MCFGPIO_PAR_FECI2C);
+	u8 r = mcf_read8(MCFGPIO_PAR_FECI2C);
 	r |= 0x0f;
-	writeb(r, MCFGPIO_PAR_FECI2C);
+	mcf_write8(r, MCFGPIO_PAR_FECI2C);
 #endif /* IS_ENABLED(CONFIG_I2C_IMX) */
 }
 
@@ -188,7 +188,7 @@ static void __init m53xx_i2c_init(void)
 static void __init m53xx_uarts_init(void)
 {
 	/* UART GPIO initialization */
-	writew(readw(MCFGPIO_PAR_UART) | 0x0FFF, MCFGPIO_PAR_UART);
+	mcf_write16(mcf_read16(MCFGPIO_PAR_UART) | 0x0FFF, MCFGPIO_PAR_UART);
 }
 
 /***************************************************************************/
@@ -198,14 +198,14 @@ static void __init m53xx_fec_init(void)
 	u8 v;
 
 	/* Set multi-function pins to ethernet mode for fec0 */
-	v = readb(MCFGPIO_PAR_FECI2C);
+	v = mcf_read8(MCFGPIO_PAR_FECI2C);
 	v |= MCF_GPIO_PAR_FECI2C_PAR_MDC_EMDC |
 		MCF_GPIO_PAR_FECI2C_PAR_MDIO_EMDIO;
-	writeb(v, MCFGPIO_PAR_FECI2C);
+	mcf_write8(v, MCFGPIO_PAR_FECI2C);
 
-	v = readb(MCFGPIO_PAR_FEC);
+	v = mcf_read8(MCFGPIO_PAR_FEC);
 	v = MCF_GPIO_PAR_FEC_PAR_FEC_7W_FEC | MCF_GPIO_PAR_FEC_PAR_FEC_MII_FEC;
-	writeb(v, MCFGPIO_PAR_FEC);
+	mcf_write8(v, MCFGPIO_PAR_FEC);
 }
 
 /***************************************************************************/
@@ -305,7 +305,7 @@ asmlinkage void __init sysinit(void)
 void wtm_init(void)
 {
 	/* Disable watchdog timer */
-	writew(0, MCF_WTM_WCR);
+	mcf_write16(0, MCF_WTM_WCR);
 }
 
 #define MCF_SCM_BCR_GBW		(0x00000100)
@@ -314,53 +314,53 @@ void wtm_init(void)
 void scm_init(void)
 {
 	/* All masters are trusted */
-	writel(0x77777777, MCF_SCM_MPR);
+	mcf_write32(0x77777777, MCF_SCM_MPR);
     
 	/* Allow supervisor/user, read/write, and trusted/untrusted
 	   access to all slaves */
-	writel(0, MCF_SCM_PACRA);
-	writel(0, MCF_SCM_PACRB);
-	writel(0, MCF_SCM_PACRC);
-	writel(0, MCF_SCM_PACRD);
-	writel(0, MCF_SCM_PACRE);
-	writel(0, MCF_SCM_PACRF);
+	mcf_write32(0, MCF_SCM_PACRA);
+	mcf_write32(0, MCF_SCM_PACRB);
+	mcf_write32(0, MCF_SCM_PACRC);
+	mcf_write32(0, MCF_SCM_PACRD);
+	mcf_write32(0, MCF_SCM_PACRE);
+	mcf_write32(0, MCF_SCM_PACRF);
 
 	/* Enable bursts */
-	writel(MCF_SCM_BCR_GBR | MCF_SCM_BCR_GBW, MCF_SCM_BCR);
+	mcf_write32(MCF_SCM_BCR_GBR | MCF_SCM_BCR_GBW, MCF_SCM_BCR);
 }
 
 
 void fbcs_init(void)
 {
-	writeb(0x3E, MCFGPIO_PAR_CS);
+	mcf_write8(0x3E, MCFGPIO_PAR_CS);
 
 	/* Latch chip select */
-	writel(0x10080000, MCF_FBCS1_CSAR);
+	mcf_write32(0x10080000, MCF_FBCS1_CSAR);
 
-	writel(0x002A3780, MCF_FBCS1_CSCR);
-	writel(MCF_FBCS_CSMR_BAM_2M | MCF_FBCS_CSMR_V, MCF_FBCS1_CSMR);
+	mcf_write32(0x002A3780, MCF_FBCS1_CSCR);
+	mcf_write32(MCF_FBCS_CSMR_BAM_2M | MCF_FBCS_CSMR_V, MCF_FBCS1_CSMR);
 
 	/* Initialize latch to drive signals to inactive states */
-	writew(0xffff, 0x10080000);
+	mcf_write16(0xffff, 0x10080000);
 
 	/* External SRAM */
-	writel(EXT_SRAM_ADDRESS, MCF_FBCS1_CSAR);
-	writel(MCF_FBCS_CSCR_PS_16 |
+	mcf_write32(EXT_SRAM_ADDRESS, MCF_FBCS1_CSAR);
+	mcf_write32(MCF_FBCS_CSCR_PS_16 |
 		MCF_FBCS_CSCR_AA |
 		MCF_FBCS_CSCR_SBM |
 		MCF_FBCS_CSCR_WS(1),
 		MCF_FBCS1_CSCR);
-	writel(MCF_FBCS_CSMR_BAM_512K | MCF_FBCS_CSMR_V, MCF_FBCS1_CSMR);
+	mcf_write32(MCF_FBCS_CSMR_BAM_512K | MCF_FBCS_CSMR_V, MCF_FBCS1_CSMR);
 
 	/* Boot Flash connected to FBCS0 */
-	writel(FLASH_ADDRESS, MCF_FBCS0_CSAR);
-	writel(MCF_FBCS_CSCR_PS_16 |
+	mcf_write32(FLASH_ADDRESS, MCF_FBCS0_CSAR);
+	mcf_write32(MCF_FBCS_CSCR_PS_16 |
 		MCF_FBCS_CSCR_BEM |
 		MCF_FBCS_CSCR_AA |
 		MCF_FBCS_CSCR_SBM |
 		MCF_FBCS_CSCR_WS(7),
 		MCF_FBCS0_CSCR);
-	writel(MCF_FBCS_CSMR_BAM_32M | MCF_FBCS_CSMR_V, MCF_FBCS0_CSMR);
+	mcf_write32(MCF_FBCS_CSMR_BAM_32M | MCF_FBCS_CSMR_V, MCF_FBCS0_CSMR);
 }
 
 void sdramc_init(void)
@@ -369,18 +369,18 @@ void sdramc_init(void)
 	 * Check to see if the SDRAM has already been initialized
 	 * by a run control tool
 	 */
-	if (!(readl(MCF_SDRAMC_SDCR) & MCF_SDRAMC_SDCR_REF)) {
+	if (!(mcf_read32(MCF_SDRAMC_SDCR) & MCF_SDRAMC_SDCR_REF)) {
 		/* SDRAM chip select initialization */
 		
 		/* Initialize SDRAM chip select */
-		writel(MCF_SDRAMC_SDCS_BA(SDRAM_ADDRESS) |
+		mcf_write32(MCF_SDRAMC_SDCS_BA(SDRAM_ADDRESS) |
 			MCF_SDRAMC_SDCS_CSSZ(MCF_SDRAMC_SDCS_CSSZ_32MBYTE),
 			MCF_SDRAMC_SDCS0);
 
 	/*
 	 * Basic configuration and initialization
 	 */
-	writel(MCF_SDRAMC_SDCFG1_SRD2RW((int)((SDRAM_CASL + 2) + 0.5)) |
+	mcf_write32(MCF_SDRAMC_SDCFG1_SRD2RW((int)((SDRAM_CASL + 2) + 0.5)) |
 		MCF_SDRAMC_SDCFG1_SWT2RD(SDRAM_TWR + 1) |
 		MCF_SDRAMC_SDCFG1_RDLAT((int)((SDRAM_CASL * 2) + 2)) |
 		MCF_SDRAMC_SDCFG1_ACT2RW((int)(SDRAM_TRCD + 0.5)) |
@@ -388,7 +388,7 @@ void sdramc_init(void)
 		MCF_SDRAMC_SDCFG1_REF2ACT((int)(SDRAM_TRFC + 0.5)) |
 		MCF_SDRAMC_SDCFG1_WTLAT(3),
 		MCF_SDRAMC_SDCFG1);
-	writel(MCF_SDRAMC_SDCFG2_BRD2PRE(SDRAM_BL / 2 + 1) |
+	mcf_write32(MCF_SDRAMC_SDCFG2_BRD2PRE(SDRAM_BL / 2 + 1) |
 		MCF_SDRAMC_SDCFG2_BWT2RW(SDRAM_BL / 2 + SDRAM_TWR) |
 		MCF_SDRAMC_SDCFG2_BRD2WT((int)((SDRAM_CASL + SDRAM_BL / 2 - 1.0) + 0.5)) |
 		MCF_SDRAMC_SDCFG2_BL(SDRAM_BL - 1),
@@ -398,7 +398,7 @@ void sdramc_init(void)
 	/*
 	 * Precharge and enable write to SDMR
 	 */
-	writel(MCF_SDRAMC_SDCR_MODE_EN |
+	mcf_write32(MCF_SDRAMC_SDCR_MODE_EN |
 		MCF_SDRAMC_SDCR_CKE |
 		MCF_SDRAMC_SDCR_DDR |
 		MCF_SDRAMC_SDCR_MUX(1) |
@@ -410,7 +410,7 @@ void sdramc_init(void)
 	/*
 	 * Write extended mode register
 	 */
-	writel(MCF_SDRAMC_SDMR_BNKAD_LEMR |
+	mcf_write32(MCF_SDRAMC_SDMR_BNKAD_LEMR |
 		MCF_SDRAMC_SDMR_AD(0x0) |
 		MCF_SDRAMC_SDMR_CMD,
 		MCF_SDRAMC_SDMR);
@@ -418,7 +418,7 @@ void sdramc_init(void)
 	/*
 	 * Write mode register and reset DLL
 	 */
-	writel(MCF_SDRAMC_SDMR_BNKAD_LMR |
+	mcf_write32(MCF_SDRAMC_SDMR_BNKAD_LMR |
 		MCF_SDRAMC_SDMR_AD(0x163) |
 		MCF_SDRAMC_SDMR_CMD,
 		MCF_SDRAMC_SDMR);
@@ -426,18 +426,18 @@ void sdramc_init(void)
 	/*
 	 * Execute a PALL command
 	 */
-	writel(readl(MCF_SDRAMC_SDCR) | MCF_SDRAMC_SDCR_IPALL, MCF_SDRAMC_SDCR);
+	mcf_write32(mcf_read32(MCF_SDRAMC_SDCR) | MCF_SDRAMC_SDCR_IPALL, MCF_SDRAMC_SDCR);
 
 	/*
 	 * Perform two REF cycles
 	 */
-	writel(readl(MCF_SDRAMC_SDCR) | MCF_SDRAMC_SDCR_IREF, MCF_SDRAMC_SDCR);
-	writel(readl(MCF_SDRAMC_SDCR) | MCF_SDRAMC_SDCR_IREF, MCF_SDRAMC_SDCR);
+	mcf_write32(mcf_read32(MCF_SDRAMC_SDCR) | MCF_SDRAMC_SDCR_IREF, MCF_SDRAMC_SDCR);
+	mcf_write32(mcf_read32(MCF_SDRAMC_SDCR) | MCF_SDRAMC_SDCR_IREF, MCF_SDRAMC_SDCR);
 
 	/*
 	 * Write mode register and clear reset DLL
 	 */
-	writel(MCF_SDRAMC_SDMR_BNKAD_LMR |
+	mcf_write32(MCF_SDRAMC_SDMR_BNKAD_LMR |
 		MCF_SDRAMC_SDMR_AD(0x063) |
 		MCF_SDRAMC_SDMR_CMD,
 		MCF_SDRAMC_SDMR);
@@ -445,9 +445,9 @@ void sdramc_init(void)
 	/*
 	 * Enable auto refresh and lock SDMR
 	 */
-	writel(readl(MCF_SDRAMC_SDCR) & ~MCF_SDRAMC_SDCR_MODE_EN,
+	mcf_write32(mcf_read32(MCF_SDRAMC_SDCR) & ~MCF_SDRAMC_SDCR_MODE_EN,
 		MCF_SDRAMC_SDCR);
-	writel(MCF_SDRAMC_SDCR_REF | MCF_SDRAMC_SDCR_DQS_OE(0xC),
+	mcf_write32(MCF_SDRAMC_SDCR_REF | MCF_SDRAMC_SDCR_DQS_OE(0xC),
 		MCF_SDRAMC_SDCR);
 	}
 }
@@ -455,16 +455,16 @@ void sdramc_init(void)
 void gpio_init(void)
 {
 	/* Enable UART0 pins */
-	writew(MCF_GPIO_PAR_UART_PAR_URXD0 | MCF_GPIO_PAR_UART_PAR_UTXD0,
+	mcf_write16(MCF_GPIO_PAR_UART_PAR_URXD0 | MCF_GPIO_PAR_UART_PAR_UTXD0,
 		MCFGPIO_PAR_UART);
 
 	/*
 	 * Initialize TIN3 as a GPIO output to enable the write
 	 * half of the latch.
 	 */
-	writeb(0x00, MCFGPIO_PAR_TIMER);
-	writeb(0x08, MCFGPIO_PDDR_TIMER);
-	writeb(0x00, MCFGPIO_PCLRR_TIMER);
+	mcf_write8(0x00, MCFGPIO_PAR_TIMER);
+	mcf_write8(0x08, MCFGPIO_PDDR_TIMER);
+	mcf_write8(0x00, MCFGPIO_PCLRR_TIMER);
 }
 
 int clock_pll(int fsys, int flags)
@@ -476,7 +476,7 @@ int clock_pll(int fsys, int flags)
         
 	if (fsys == 0) {
 		/* Return current PLL output */
-		mfd = readb(MCF_PLL_PFDR);
+		mfd = mcf_read8(MCF_PLL_PFDR);
 
 		return (fref * mfd / (BUSDIV * 4));
 	}
@@ -502,9 +502,9 @@ int clock_pll(int fsys, int flags)
 	 * If it has then the SDRAM needs to be put into self refresh
 	 * mode before reprogramming the PLL.
 	 */
-	if (readl(MCF_SDRAMC_SDCR) & MCF_SDRAMC_SDCR_REF)
+	if (mcf_read32(MCF_SDRAMC_SDCR) & MCF_SDRAMC_SDCR_REF)
 		/* Put SDRAM into self refresh mode */
-		writel(readl(MCF_SDRAMC_SDCR) & ~MCF_SDRAMC_SDCR_CKE,
+		mcf_write32(mcf_read32(MCF_SDRAMC_SDCR) & ~MCF_SDRAMC_SDCR_CKE,
 			MCF_SDRAMC_SDCR);
 
 	/*
@@ -516,10 +516,10 @@ int clock_pll(int fsys, int flags)
 	clock_limp(DEFAULT_LPD);
      					
 	/* Reprogram PLL for desired fsys */
-	writeb(MCF_PLL_PODR_CPUDIV(BUSDIV/3) | MCF_PLL_PODR_BUSDIV(BUSDIV),
+	mcf_write8(MCF_PLL_PODR_CPUDIV(BUSDIV/3) | MCF_PLL_PODR_BUSDIV(BUSDIV),
 		MCF_PLL_PODR);
 						
-	writeb(mfd, MCF_PLL_PFDR);
+	mcf_write8(mfd, MCF_PLL_PFDR);
 		
 	/* Exit LIMP mode */
 	clock_exit_limp();
@@ -527,13 +527,13 @@ int clock_pll(int fsys, int flags)
 	/*
 	 * Return the SDRAM to normal operation if it is in use.
 	 */
-	if (readl(MCF_SDRAMC_SDCR) & MCF_SDRAMC_SDCR_REF)
+	if (mcf_read32(MCF_SDRAMC_SDCR) & MCF_SDRAMC_SDCR_REF)
 		/* Exit self refresh mode */
-		writel(readl(MCF_SDRAMC_SDCR) | MCF_SDRAMC_SDCR_CKE,
+		mcf_write32(mcf_read32(MCF_SDRAMC_SDCR) | MCF_SDRAMC_SDCR_CKE,
 			MCF_SDRAMC_SDCR);
 
 	/* Errata - workaround for SDRAM operation after exiting LIMP mode */
-	writel(MCF_SDRAMC_REFRESH, MCF_SDRAMC_LIMP_FIX);
+	mcf_write32(MCF_SDRAMC_REFRESH, MCF_SDRAMC_LIMP_FIX);
 
 	/* wait for DQS logic to relock */
 	for (i = 0; i < 0x200; i++)
@@ -554,12 +554,12 @@ int clock_limp(int div)
     
 	/* Save of the current value of the SSIDIV so we don't
 	   overwrite the value*/
-	temp = readw(MCF_CCM_CDR) & MCF_CCM_CDR_SSIDIV(0xF);
+	temp = mcf_read16(MCF_CCM_CDR) & MCF_CCM_CDR_SSIDIV(0xF);
       
 	/* Apply the divider to the system clock */
-	writew(MCF_CCM_CDR_LPDIV(div) | MCF_CCM_CDR_SSIDIV(temp), MCF_CCM_CDR);
+	mcf_write16(MCF_CCM_CDR_LPDIV(div) | MCF_CCM_CDR_SSIDIV(temp), MCF_CCM_CDR);
     
-	writew(readw(MCF_CCM_MISCCR) | MCF_CCM_MISCCR_LIMP, MCF_CCM_MISCCR);
+	mcf_write16(mcf_read16(MCF_CCM_MISCCR) | MCF_CCM_MISCCR_LIMP, MCF_CCM_MISCCR);
     
 	return (FREF/(3*(1 << div)));
 }
@@ -569,10 +569,10 @@ int clock_exit_limp(void)
 	int fout;
 	
 	/* Exit LIMP mode */
-	writew(readw(MCF_CCM_MISCCR) & ~MCF_CCM_MISCCR_LIMP, MCF_CCM_MISCCR);
+	mcf_write16(mcf_read16(MCF_CCM_MISCCR) & ~MCF_CCM_MISCCR_LIMP, MCF_CCM_MISCCR);
 
 	/* Wait for PLL to lock */
-	while (!(readw(MCF_CCM_MISCCR) & MCF_CCM_MISCCR_PLL_LOCK))
+	while (!(mcf_read16(MCF_CCM_MISCCR) & MCF_CCM_MISCCR_PLL_LOCK))
 		;
 	
 	fout = get_sys_clock();
@@ -585,10 +585,10 @@ int get_sys_clock(void)
 	int divider;
 	
 	/* Test to see if device is in LIMP mode */
-	if (readw(MCF_CCM_MISCCR) & MCF_CCM_MISCCR_LIMP) {
-		divider = readw(MCF_CCM_CDR) & MCF_CCM_CDR_LPDIV(0xF);
+	if (mcf_read16(MCF_CCM_MISCCR) & MCF_CCM_MISCCR_LIMP) {
+		divider = mcf_read16(MCF_CCM_CDR) & MCF_CCM_CDR_LPDIV(0xF);
 		return (FREF/(2 << divider));
 	}
 	else
-		return (FREF * readb(MCF_PLL_PFDR)) / (BUSDIV * 4);
+		return (FREF * mcf_read8(MCF_PLL_PFDR)) / (BUSDIV * 4);
 }
diff --git a/arch/m68k/coldfire/m5407.c b/arch/m68k/coldfire/m5407.c
index b32efb3042a2..23a14416241c 100644
--- a/arch/m68k/coldfire/m5407.c
+++ b/arch/m68k/coldfire/m5407.c
@@ -40,7 +40,7 @@ static struct clk_lookup m5407_clk_lookup[] = {
 static void __init m5407_i2c_init(void)
 {
 #if IS_ENABLED(CONFIG_I2C_IMX)
-	writeb(MCFSIM_ICR_AUTOVEC | MCFSIM_ICR_LEVEL5 | MCFSIM_ICR_PRI0,
+	mcf_write8(MCFSIM_ICR_AUTOVEC | MCFSIM_ICR_LEVEL5 | MCFSIM_ICR_PRI0,
 	       MCFSIM_I2CICR);
 	mcf_mapirq2imr(MCF_IRQ_I2C0, MCFINTC_I2C);
 #endif /* IS_ENABLED(CONFIG_I2C_IMX) */
diff --git a/arch/m68k/coldfire/m5441x.c b/arch/m68k/coldfire/m5441x.c
index 7a25cfc7ac07..6ce730098ff6 100644
--- a/arch/m68k/coldfire/m5441x.c
+++ b/arch/m68k/coldfire/m5441x.c
@@ -201,12 +201,12 @@ static struct clk * const disable_clks[] __initconst = {
 
 static void __clk_enable2(struct clk *clk)
 {
-	__raw_writel(__raw_readl(MCFSDHC_CLK) | (1 << clk->slot), MCFSDHC_CLK);
+	mcf_write32(mcf_read32(MCFSDHC_CLK) | (1 << clk->slot), MCFSDHC_CLK);
 }
 
 static void __clk_disable2(struct clk *clk)
 {
-	__raw_writel(__raw_readl(MCFSDHC_CLK) & ~(1 << clk->slot), MCFSDHC_CLK);
+	mcf_write32(mcf_read32(MCFSDHC_CLK) & ~(1 << clk->slot), MCFSDHC_CLK);
 }
 
 struct clk_ops clk_ops2 = {
@@ -229,14 +229,14 @@ static void __init m5441x_clk_init(void)
 
 static void __init m5441x_uarts_init(void)
 {
-	__raw_writeb(0x0f, MCFGPIO_PAR_UART0);
-	__raw_writeb(0x00, MCFGPIO_PAR_UART1);
-	__raw_writeb(0x00, MCFGPIO_PAR_UART2);
+	mcf_write8(0x0f, MCFGPIO_PAR_UART0);
+	mcf_write8(0x00, MCFGPIO_PAR_UART1);
+	mcf_write8(0x00, MCFGPIO_PAR_UART2);
 }
 
 static void __init m5441x_fec_init(void)
 {
-	__raw_writeb(0x03, MCFGPIO_PAR_FEC);
+	mcf_write8(0x03, MCFGPIO_PAR_FEC);
 }
 
 void __init config_BSP(char *commandp, int size)
diff --git a/arch/m68k/coldfire/m54xx.c b/arch/m68k/coldfire/m54xx.c
index 8e3c8fee8327..90bb209b278d 100644
--- a/arch/m68k/coldfire/m54xx.c
+++ b/arch/m68k/coldfire/m54xx.c
@@ -51,12 +51,12 @@ static struct clk_lookup m54xx_clk_lookup[] = {
 static void __init m54xx_uarts_init(void)
 {
 	/* enable io pins */
-	__raw_writeb(MCF_PAR_PSC_TXD | MCF_PAR_PSC_RXD, MCFGPIO_PAR_PSC0);
-	__raw_writeb(MCF_PAR_PSC_TXD | MCF_PAR_PSC_RXD | MCF_PAR_PSC_RTS_RTS,
+	mcf_write8(MCF_PAR_PSC_TXD | MCF_PAR_PSC_RXD, MCFGPIO_PAR_PSC0);
+	mcf_write8(MCF_PAR_PSC_TXD | MCF_PAR_PSC_RXD | MCF_PAR_PSC_RTS_RTS,
 		MCFGPIO_PAR_PSC1);
-	__raw_writeb(MCF_PAR_PSC_TXD | MCF_PAR_PSC_RXD | MCF_PAR_PSC_RTS_RTS |
+	mcf_write8(MCF_PAR_PSC_TXD | MCF_PAR_PSC_RXD | MCF_PAR_PSC_RTS_RTS |
 		MCF_PAR_PSC_CTS_CTS, MCFGPIO_PAR_PSC2);
-	__raw_writeb(MCF_PAR_PSC_TXD | MCF_PAR_PSC_RXD, MCFGPIO_PAR_PSC3);
+	mcf_write8(MCF_PAR_PSC_TXD | MCF_PAR_PSC_RXD, MCFGPIO_PAR_PSC3);
 }
 
 /***************************************************************************/
@@ -67,9 +67,9 @@ static void __init m54xx_i2c_init(void)
 	u32 r;
 
 	/* set the fec/i2c/irq pin assignment register for i2c */
-	r = readl(MCF_PAR_FECI2CIRQ);
+	r = mcf_read32(MCF_PAR_FECI2CIRQ);
 	r |= MCF_PAR_FECI2CIRQ_SDA | MCF_PAR_FECI2CIRQ_SCL;
-	writel(r, MCF_PAR_FECI2CIRQ);
+	mcf_write32(r, MCF_PAR_FECI2CIRQ);
 #endif /* IS_ENABLED(CONFIG_I2C_IMX) */
 }
 
@@ -79,9 +79,9 @@ static void mcf54xx_reset(void)
 {
 	/* disable interrupts and enable the watchdog */
 	asm("movew #0x2700, %sr\n");
-	__raw_writel(0, MCF_GPT_GMS0);
-	__raw_writel(MCF_GPT_GCIR_CNT(1), MCF_GPT_GCIR0);
-	__raw_writel(MCF_GPT_GMS_WDEN | MCF_GPT_GMS_CE | MCF_GPT_GMS_TMS(4),
+	mcf_write32(0, MCF_GPT_GMS0);
+	mcf_write32(MCF_GPT_GCIR_CNT(1), MCF_GPT_GCIR0);
+	mcf_write32(MCF_GPT_GMS_WDEN | MCF_GPT_GMS_CE | MCF_GPT_GMS_TMS(4),
 		MCF_GPT_GMS0);
 }
 
diff --git a/arch/m68k/coldfire/nettel.c b/arch/m68k/coldfire/nettel.c
index ea8df6e7a6cc..e304571e03ea 100644
--- a/arch/m68k/coldfire/nettel.c
+++ b/arch/m68k/coldfire/nettel.c
@@ -106,10 +106,10 @@ static void __init nettel_smc91x_setmac(unsigned int ioaddr, unsigned int flasha
 	if ((macp[0] == 0xffff) && (macp[1] == 0xffff) && (macp[2] == 0xffff))
 		macp = (u16 *) &nettel_macdefault[0];
 
-	writew(1, NETTEL_SMC0_ADDR + SMC91xx_BANKSELECT);
-	writew(macp[0], ioaddr + SMC91xx_BASEMAC);
-	writew(macp[1], ioaddr + SMC91xx_BASEMAC + 2);
-	writew(macp[2], ioaddr + SMC91xx_BASEMAC + 4);
+	mcf_write16(1, NETTEL_SMC0_ADDR + SMC91xx_BANKSELECT);
+	mcf_write16(macp[0], ioaddr + SMC91xx_BASEMAC);
+	mcf_write16(macp[1], ioaddr + SMC91xx_BASEMAC + 2);
+	mcf_write16(macp[2], ioaddr + SMC91xx_BASEMAC + 4);
 }
 
 /***************************************************************************/
@@ -122,14 +122,14 @@ static void __init nettel_smc91x_setmac(unsigned int ioaddr, unsigned int flasha
 
 static void __init nettel_smc91x_init(void)
 {
-	writew(0x00ec, MCFSIM_PADDR);
+	mcf_write16(0x00ec, MCFSIM_PADDR);
 	mcf_setppdata(0, 0x0080);
-	writew(1, NETTEL_SMC0_ADDR + SMC91xx_BANKSELECT);
-	writew(0x0067, NETTEL_SMC0_ADDR + SMC91xx_BASEADDR);
+	mcf_write16(1, NETTEL_SMC0_ADDR + SMC91xx_BANKSELECT);
+	mcf_write16(0x0067, NETTEL_SMC0_ADDR + SMC91xx_BASEADDR);
 	mcf_setppdata(0x0080, 0);
 
 	/* Set correct chip select timing for SMC9196 accesses */
-	writew(0x1180, MCFSIM_CSCR3);
+	mcf_write16(0x1180, MCFSIM_CSCR3);
 
 	/* Set the SMC interrupts to be auto-vectored */
 	mcf_autovector(NETTEL_SMC0_IRQ);
diff --git a/arch/m68k/coldfire/stmark2.c b/arch/m68k/coldfire/stmark2.c
index 036a6ae5f599..2999ce6f3913 100644
--- a/arch/m68k/coldfire/stmark2.c
+++ b/arch/m68k/coldfire/stmark2.c
@@ -104,16 +104,16 @@ static struct platform_device *stmark2_devices[] __initdata = {
 static int __init init_stmark2(void)
 {
 	/* DSPI0, all pins as DSPI, and using CS1 */
-	__raw_writeb(0x80, MCFGPIO_PAR_DSPIOWL);
-	__raw_writeb(0xfc, MCFGPIO_PAR_DSPIOWH);
+	mcf_write8(0x80, MCFGPIO_PAR_DSPIOWL);
+	mcf_write8(0xfc, MCFGPIO_PAR_DSPIOWH);
 
 	/* Board gpio setup */
-	__raw_writeb(0x00, MCFGPIO_PAR_BE);
-	__raw_writeb(0x00, MCFGPIO_PAR_FBCTL);
-	__raw_writeb(0x00, MCFGPIO_PAR_CS);
+	mcf_write8(0x00, MCFGPIO_PAR_BE);
+	mcf_write8(0x00, MCFGPIO_PAR_FBCTL);
+	mcf_write8(0x00, MCFGPIO_PAR_CS);
 
 	/* CAN pads */
-	__raw_writeb(0x50, MCFGPIO_PAR_CANI2C);
+	mcf_write8(0x50, MCFGPIO_PAR_CANI2C);
 
 	platform_add_devices(stmark2_devices, ARRAY_SIZE(stmark2_devices));
 
-- 
2.54.0

