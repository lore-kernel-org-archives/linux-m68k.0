From: Greg Ungerer <gerg@linux-m68k.org>
Subject: [PATCH] m68knommu: platform support for i2c devices on ColdFire SoC
Date: Mon, 17 Oct 2016 11:37:08 +1000
Message-ID: <1476668228-2639-1-git-send-email-gerg@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from icp-osb-irony-out1.external.iinet.net.au ([203.59.1.210]:2380
        "EHLO icp-osb-irony-out1.external.iinet.net.au" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1756707AbcJQBhi (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>);
        Sun, 16 Oct 2016 21:37:38 -0400
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, sfking@fdwdc.com, angelo@sysam.it
Cc: Greg Ungerer <gerg@uclinux.org>

From: Steven King <sfking@fdwdc.com>

These changes based on work by Steven King <sfking@fdwdc.com> to support
the i2c hardware modules on ColdFire SoC family devices.

This is the per SoC hardware support. Contains a common platform device
setup. Each of the SoC family members tends to have some minor local
setup required to initialize the module. But all ColdFire family members
use the same i2c hardware module.

This i2c hardware module is the same as used in the Freescale iMX ARM
based family of SoC devices. Steven's original patches were based on using
a new and different i2c-coldfire.c driver. But this is not neccessary as
we can use the existing Linux i2c-imx.c driver with no change required to
it. And this patch is now based on using the existing i2c-imx driver.

This patch only contains the ColdFire platform changes.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
Tested-by: Angelo Dureghello <angelo@sysam.it>
---
 arch/m68k/coldfire/device.c      | 159 +++++++++++++++++++++++++++++++++++++++
 arch/m68k/coldfire/m5206.c       |  12 +++
 arch/m68k/coldfire/m520x.c       |  24 +++++-
 arch/m68k/coldfire/m523x.c       |  18 +++++
 arch/m68k/coldfire/m5249.c       |  25 ++++++
 arch/m68k/coldfire/m525x.c       |  10 ++-
 arch/m68k/coldfire/m527x.c       |  28 +++++++
 arch/m68k/coldfire/m528x.c       |  18 +++++
 arch/m68k/coldfire/m5307.c       |  14 ++++
 arch/m68k/coldfire/m53xx.c       |  20 ++++-
 arch/m68k/coldfire/m5407.c       |  14 ++++
 arch/m68k/coldfire/m5441x.c      |  12 +--
 arch/m68k/coldfire/m54xx.c       |  17 +++++
 arch/m68k/include/asm/m5206sim.h |   8 ++
 arch/m68k/include/asm/m520xsim.h |   8 ++
 arch/m68k/include/asm/m523xsim.h |  10 ++-
 arch/m68k/include/asm/m527xsim.h |   8 ++
 arch/m68k/include/asm/m528xsim.h |   9 +++
 arch/m68k/include/asm/m5307sim.h |   9 ++-
 arch/m68k/include/asm/m53xxsim.h |   8 ++
 arch/m68k/include/asm/m5407sim.h |   8 ++
 arch/m68k/include/asm/m54xxsim.h |  11 +++
 22 files changed, 432 insertions(+), 18 deletions(-)

diff --git a/arch/m68k/coldfire/device.c b/arch/m68k/coldfire/device.c
index a0fc0c1..84938fd 100644
--- a/arch/m68k/coldfire/device.c
+++ b/arch/m68k/coldfire/device.c
@@ -327,6 +327,147 @@ static void mcf_cs_deselect(struct mcfqspi_cs_control *cs_control,
 };
 #endif /* IS_ENABLED(CONFIG_SPI_COLDFIRE_QSPI) */
 
+#if IS_ENABLED(CONFIG_I2C_IMX)
+static struct resource mcf_i2c0_resources[] = {
+	{
+		.start          = MCFI2C_BASE0,
+		.end            = MCFI2C_BASE0 + MCFI2C_SIZE0 - 1,
+		.flags          = IORESOURCE_MEM,
+	},
+	{
+		.start          = MCF_IRQ_I2C0,
+		.end            = MCF_IRQ_I2C0,
+		.flags          = IORESOURCE_IRQ,
+	},
+};
+
+static struct platform_device mcf_i2c0 = {
+	.name                   = "imx1-i2c",
+	.id                     = 0,
+	.num_resources          = ARRAY_SIZE(mcf_i2c0_resources),
+	.resource               = mcf_i2c0_resources,
+};
+#ifdef MCFI2C_BASE1
+
+static struct resource mcf_i2c1_resources[] = {
+	{
+		.start          = MCFI2C_BASE1,
+		.end            = MCFI2C_BASE1 + MCFI2C_SIZE1 - 1,
+		.flags          = IORESOURCE_MEM,
+	},
+	{
+		.start          = MCF_IRQ_I2C1,
+		.end            = MCF_IRQ_I2C1,
+		.flags          = IORESOURCE_IRQ,
+	},
+};
+
+static struct platform_device mcf_i2c1 = {
+	.name                   = "imx1-i2c",
+	.id                     = 1,
+	.num_resources          = ARRAY_SIZE(mcf_i2c1_resources),
+	.resource               = mcf_i2c1_resources,
+};
+
+#endif /* MCFI2C_BASE1 */
+
+#ifdef MCFI2C_BASE2
+
+static struct resource mcf_i2c2_resources[] = {
+	{
+		.start          = MCFI2C_BASE2,
+		.end            = MCFI2C_BASE2 + MCFI2C_SIZE2 - 1,
+		.flags          = IORESOURCE_MEM,
+	},
+	{
+		.start          = MCF_IRQ_I2C2,
+		.end            = MCF_IRQ_I2C2,
+		.flags          = IORESOURCE_IRQ,
+	},
+};
+
+static struct platform_device mcf_i2c2 = {
+	.name                   = "imx1-i2c",
+	.id                     = 2,
+	.num_resources          = ARRAY_SIZE(mcf_i2c2_resources),
+	.resource               = mcf_i2c2_resources,
+};
+
+#endif /* MCFI2C_BASE2 */
+
+#ifdef MCFI2C_BASE3
+
+static struct resource mcf_i2c3_resources[] = {
+	{
+		.start          = MCFI2C_BASE3,
+		.end            = MCFI2C_BASE3 + MCFI2C_SIZE3 - 1,
+		.flags          = IORESOURCE_MEM,
+	},
+	{
+		.start          = MCF_IRQ_I2C3,
+		.end            = MCF_IRQ_I2C3,
+		.flags          = IORESOURCE_IRQ,
+	},
+};
+
+static struct platform_device mcf_i2c3 = {
+	.name                   = "imx1-i2c",
+	.id                     = 3,
+	.num_resources          = ARRAY_SIZE(mcf_i2c3_resources),
+	.resource               = mcf_i2c3_resources,
+};
+
+#endif /* MCFI2C_BASE3 */
+
+#ifdef MCFI2C_BASE4
+
+static struct resource mcf_i2c4_resources[] = {
+	{
+		.start          = MCFI2C_BASE4,
+		.end            = MCFI2C_BASE4 + MCFI2C_SIZE4 - 1,
+		.flags          = IORESOURCE_MEM,
+	},
+	{
+		.start          = MCF_IRQ_I2C4,
+		.end            = MCF_IRQ_I2C4,
+		.flags          = IORESOURCE_IRQ,
+	},
+};
+
+static struct platform_device mcf_i2c4 = {
+	.name                   = "imx1-i2c",
+	.id                     = 4,
+	.num_resources          = ARRAY_SIZE(mcf_i2c4_resources),
+	.resource               = mcf_i2c4_resources,
+};
+
+#endif /* MCFI2C_BASE4 */
+
+#ifdef MCFI2C_BASE5
+
+static struct resource mcf_i2c5_resources[] = {
+	{
+		.start          = MCFI2C_BASE5,
+		.end            = MCFI2C_BASE5 + MCFI2C_SIZE5 - 1,
+		.flags          = IORESOURCE_MEM,
+	},
+	{
+		.start          = MCF_IRQ_I2C5,
+		.end            = MCF_IRQ_I2C5,
+		.flags          = IORESOURCE_IRQ,
+	},
+};
+
+static struct platform_device mcf_i2c5 = {
+	.name                   = "imx1-i2c",
+	.id                     = 5,
+	.num_resources          = ARRAY_SIZE(mcf_i2c5_resources),
+	.resource               = mcf_i2c5_resources,
+};
+
+#endif /* MCFI2C_BASE5 */
+#endif /* IS_ENABLED(CONFIG_I2C_IMX) */
+
 static struct platform_device *mcf_devices[] __initdata = {
 	&mcf_uart,
 #if IS_ENABLED(CONFIG_FEC)
@@ -338,6 +479,24 @@ static void mcf_cs_deselect(struct mcfqspi_cs_control *cs_control,
 #if IS_ENABLED(CONFIG_SPI_COLDFIRE_QSPI)
 	&mcf_qspi,
 #endif
+#if IS_ENABLED(CONFIG_I2C_IMX)
+	&mcf_i2c0,
+#ifdef MCFI2C_BASE1
+	&mcf_i2c1,
+#endif
+#ifdef MCFI2C_BASE2
+	&mcf_i2c2,
+#endif
+#ifdef MCFI2C_BASE3
+	&mcf_i2c3,
+#endif
+#ifdef MCFI2C_BASE4
+	&mcf_i2c4,
+#endif
+#ifdef MCFI2C_BASE5
+	&mcf_i2c5,
+#endif
+#endif
 };
 
 /*
diff --git a/arch/m68k/coldfire/m5206.c b/arch/m68k/coldfire/m5206.c
index 8945f5e..a3bcf08 100644
--- a/arch/m68k/coldfire/m5206.c
+++ b/arch/m68k/coldfire/m5206.c
@@ -26,6 +26,7 @@
 DEFINE_CLK(mcftmr1, "mcftmr.1", MCF_BUSCLK);
 DEFINE_CLK(mcfuart0, "mcfuart.0", MCF_BUSCLK);
 DEFINE_CLK(mcfuart1, "mcfuart.1", MCF_BUSCLK);
+DEFINE_CLK(mcfi2c0, "imx1-i2c.0", MCF_BUSCLK);
 
 struct clk *mcf_clks[] = {
 	&clk_pll,
@@ -34,11 +35,21 @@ struct clk *mcf_clks[] = {
 	&clk_mcftmr1,
 	&clk_mcfuart0,
 	&clk_mcfuart1,
+	&clk_mcfi2c0,
 	NULL
 };
 
 /***************************************************************************/
 
+static void __init m5206_i2c_init(void)
+{
+#if IS_ENABLED(CONFIG_I2C_IMX)
+	writeb(MCFSIM_ICR_AUTOVEC | MCFSIM_ICR_LEVEL5 | MCFSIM_ICR_PRI0,
+	       MCFSIM_I2CICR);
+	mcf_mapirq2imr(MCF_IRQ_I2C0, MCFINTC_I2C);
+#endif /* IS_ENABLED(CONFIG_I2C_IMX) */
+}
+
 void __init config_BSP(char *commandp, int size)
 {
 #if defined(CONFIG_NETtel)
@@ -53,6 +64,7 @@ void __init config_BSP(char *commandp, int size)
 	mcf_mapirq2imr(25, MCFINTC_EINT1);
 	mcf_mapirq2imr(28, MCFINTC_EINT4);
 	mcf_mapirq2imr(31, MCFINTC_EINT7);
+	m5206_i2c_init();
 }
 
 /***************************************************************************/
diff --git a/arch/m68k/coldfire/m520x.c b/arch/m68k/coldfire/m520x.c
index 173834f..5ba6921 100644
--- a/arch/m68k/coldfire/m520x.c
+++ b/arch/m68k/coldfire/m520x.c
@@ -28,7 +28,7 @@
 DEFINE_CLK(0, "edma", 17, MCF_CLK);
 DEFINE_CLK(0, "intc.0", 18, MCF_CLK);
 DEFINE_CLK(0, "iack.0", 21, MCF_CLK);
-DEFINE_CLK(0, "mcfi2c.0", 22, MCF_CLK);
+DEFINE_CLK(0, "imx1-i2c.0", 22, MCF_CLK);
 DEFINE_CLK(0, "mcfqspi.0", 23, MCF_CLK);
 DEFINE_CLK(0, "mcfuart.0", 24, MCF_BUSCLK);
 DEFINE_CLK(0, "mcfuart.1", 25, MCF_BUSCLK);
@@ -53,7 +53,7 @@ struct clk *mcf_clks[] = {
 	&__clk_0_17, /* edma */
 	&__clk_0_18, /* intc.0 */
 	&__clk_0_21, /* iack.0 */
-	&__clk_0_22, /* mcfi2c.0 */
+	&__clk_0_22, /* imx1-i2c.0 */
 	&__clk_0_23, /* mcfqspi.0 */
 	&__clk_0_24, /* mcfuart.0 */
 	&__clk_0_25, /* mcfuart.1 */
@@ -71,7 +71,7 @@ struct clk *mcf_clks[] = {
 	&__clk_0_40, /* sys.0 */
 	&__clk_0_41, /* gpio.0 */
 	&__clk_0_42, /* sdram.0 */
-NULL,
+	NULL,
 };
 
 static struct clk * const enable_clks[] __initconst = {
@@ -94,7 +94,7 @@ struct clk *mcf_clks[] = {
 static struct clk * const disable_clks[] __initconst = {
 	&__clk_0_12, /* fec.0 */
 	&__clk_0_17, /* edma */
-	&__clk_0_22, /* mcfi2c.0 */
+	&__clk_0_22, /* imx1-i2c.0 */
 	&__clk_0_23, /* mcfqspi.0 */
 	&__clk_0_28, /* mcftmr.0 */
 	&__clk_0_29, /* mcftmr.1 */
@@ -133,6 +133,21 @@ static void __init m520x_qspi_init(void)
 
 /***************************************************************************/
 
+static void __init m520x_i2c_init(void)
+{
+#if IS_ENABLED(CONFIG_I2C_IMX)
+	u8 par;
+
+	/* setup Port FECI2C Pin Assignment Register for I2C */
+	/*  set PAR_SCL to SCL and PAR_SDA to SDA */
+	par = readb(MCF_GPIO_PAR_FECI2C);
+	par |= 0x0f;
+	writeb(par, MCF_GPIO_PAR_FECI2C);
+#endif /* IS_ENABLED(CONFIG_I2C_IMX) */
+}
+
+/***************************************************************************/
+
 static void __init m520x_uarts_init(void)
 {
 	u16 par;
@@ -175,6 +190,7 @@ void __init config_BSP(char *commandp, int size)
 	m520x_uarts_init();
 	m520x_fec_init();
 	m520x_qspi_init();
+	m520x_i2c_init();
 }
 
 /***************************************************************************/
diff --git a/arch/m68k/coldfire/m523x.c b/arch/m68k/coldfire/m523x.c
index a191a46..f7a0fcc 100644
--- a/arch/m68k/coldfire/m523x.c
+++ b/arch/m68k/coldfire/m523x.c
@@ -34,6 +34,7 @@
 DEFINE_CLK(mcfuart2, "mcfuart.2", MCF_BUSCLK);
 DEFINE_CLK(mcfqspi0, "mcfqspi.0", MCF_BUSCLK);
 DEFINE_CLK(fec0, "fec.0", MCF_BUSCLK);
+DEFINE_CLK(mcfi2c0, "imx1-i2c.0", MCF_BUSCLK);
 
 struct clk *mcf_clks[] = {
 	&clk_pll,
@@ -47,6 +48,7 @@ struct clk *mcf_clks[] = {
 	&clk_mcfuart2,
 	&clk_mcfqspi0,
 	&clk_fec0,
+	&clk_mcfi2c0,
 	NULL
 };
 
@@ -68,6 +70,21 @@ static void __init m523x_qspi_init(void)
 
 /***************************************************************************/
 
+static void __init m523x_i2c_init(void)
+{
+#if IS_ENABLED(CONFIG_I2C_IMX)
+	u8 par;
+
+	/* setup Port AS Pin Assignment Register for I2C */
+	/*  set PASPA0 to SCL and PASPA1 to SDA */
+	par = readb(MCFGPIO_PAR_FECI2C);
+	par |= 0x0f;
+	writeb(par, MCFGPIO_PAR_FECI2C);
+#endif /* IS_ENABLED(CONFIG_I2C_IMX) */
+}
+
+/***************************************************************************/
+
 static void __init m523x_fec_init(void)
 {
 	/* Set multi-function pins to ethernet use */
@@ -81,6 +98,7 @@ void __init config_BSP(char *commandp, int size)
 	mach_sched_init = hw_timer_init;
 	m523x_fec_init();
 	m523x_qspi_init();
+	m523x_i2c_init();
 }
 
 /***************************************************************************/
diff --git a/arch/m68k/coldfire/m5249.c b/arch/m68k/coldfire/m5249.c
index e48f55a..b16cf9b 100644
--- a/arch/m68k/coldfire/m5249.c
+++ b/arch/m68k/coldfire/m5249.c
@@ -27,6 +27,8 @@
 DEFINE_CLK(mcfuart0, "mcfuart.0", MCF_BUSCLK);
 DEFINE_CLK(mcfuart1, "mcfuart.1", MCF_BUSCLK);
 DEFINE_CLK(mcfqspi0, "mcfqspi.0", MCF_BUSCLK);
+DEFINE_CLK(mcfi2c0, "imx1-i2c.0", MCF_BUSCLK);
+DEFINE_CLK(mcfi2c1, "imx1-i2c.1", MCF_BUSCLK);
 
 struct clk *mcf_clks[] = {
 	&clk_pll,
@@ -36,6 +38,8 @@ struct clk *mcf_clks[] = {
 	&clk_mcfuart0,
 	&clk_mcfuart1,
 	&clk_mcfqspi0,
+	&clk_mcfi2c0,
+	&clk_mcfi2c1,
 	NULL
 };
 
@@ -85,6 +89,26 @@ static void __init m5249_qspi_init(void)
 
 /***************************************************************************/
 
+static void __init m5249_i2c_init(void)
+{
+#if IS_ENABLED(CONFIG_I2C_IMX)
+	u32 r;
+
+	/* first I2C controller uses regular irq setup */
+	writeb(MCFSIM_ICR_AUTOVEC | MCFSIM_ICR_LEVEL5 | MCFSIM_ICR_PRI0,
+	       MCFSIM_I2CICR);
+	mcf_mapirq2imr(MCF_IRQ_I2C0, MCFINTC_I2C);
+
+	/* second I2C controller is completely different */
+	r = readl(MCFINTC2_INTPRI_REG(MCF_IRQ_I2C1));
+	r &= ~MCFINTC2_INTPRI_BITS(0xf, MCF_IRQ_I2C1);
+	r |= MCFINTC2_INTPRI_BITS(0x5, MCF_IRQ_I2C1);
+	writel(r, MCFINTC2_INTPRI_REG(MCF_IRQ_I2C1));
+#endif /* CONFIG_I2C_IMX */
+}
+
+/***************************************************************************/
+
 #ifdef CONFIG_M5249C3
 
 static void __init m5249_smc91x_init(void)
@@ -111,6 +135,7 @@ void __init config_BSP(char *commandp, int size)
 	m5249_smc91x_init();
 #endif
 	m5249_qspi_init();
+	m5249_i2c_init();
 }
 
 /***************************************************************************/
diff --git a/arch/m68k/coldfire/m525x.c b/arch/m68k/coldfire/m525x.c
index 3d8583e..110e2cd 100644
--- a/arch/m68k/coldfire/m525x.c
+++ b/arch/m68k/coldfire/m525x.c
@@ -27,6 +27,8 @@
 DEFINE_CLK(mcfuart0, "mcfuart.0", MCF_BUSCLK);
 DEFINE_CLK(mcfuart1, "mcfuart.1", MCF_BUSCLK);
 DEFINE_CLK(mcfqspi0, "mcfqspi.0", MCF_BUSCLK);
+DEFINE_CLK(mcfi2c0, "imx1-i2c.0", MCF_BUSCLK);
+DEFINE_CLK(mcfi2c1, "imx1-i2c.1", MCF_BUSCLK);
 
 struct clk *mcf_clks[] = {
 	&clk_pll,
@@ -36,6 +38,8 @@ struct clk *mcf_clks[] = {
 	&clk_mcfuart0,
 	&clk_mcfuart1,
 	&clk_mcfqspi0,
+	&clk_mcfi2c0,
+	&clk_mcfi2c1,
 	NULL
 };
 
@@ -59,12 +63,12 @@ static void __init m525x_qspi_init(void)
 
 static void __init m525x_i2c_init(void)
 {
-#if IS_ENABLED(CONFIG_I2C_COLDFIRE)
+#if IS_ENABLED(CONFIG_I2C_IMX)
 	u32 r;
 
 	/* first I2C controller uses regular irq setup */
 	writeb(MCFSIM_ICR_AUTOVEC | MCFSIM_ICR_LEVEL5 | MCFSIM_ICR_PRI0,
-		MCFSIM_I2CICR);
+	       MCFSIM_I2CICR);
 	mcf_mapirq2imr(MCF_IRQ_I2C0, MCFINTC_I2C);
 
 	/* second I2C controller is completely different */
@@ -72,7 +76,7 @@ static void __init m525x_i2c_init(void)
 	r &= ~MCFINTC2_INTPRI_BITS(0xf, MCF_IRQ_I2C1);
 	r |= MCFINTC2_INTPRI_BITS(0x5, MCF_IRQ_I2C1);
 	writel(r, MCFINTC2_INTPRI_REG(MCF_IRQ_I2C1));
-#endif /* IS_ENABLED(CONFIG_I2C_COLDFIRE) */
+#endif /* IS_ENABLED(CONFIG_I2C_IMX) */
 }
 
 /***************************************************************************/
diff --git a/arch/m68k/coldfire/m527x.c b/arch/m68k/coldfire/m527x.c
index c0b3e28..b10b436 100644
--- a/arch/m68k/coldfire/m527x.c
+++ b/arch/m68k/coldfire/m527x.c
@@ -36,6 +36,7 @@
 DEFINE_CLK(mcfqspi0, "mcfqspi.0", MCF_BUSCLK);
 DEFINE_CLK(fec0, "fec.0", MCF_BUSCLK);
 DEFINE_CLK(fec1, "fec.1", MCF_BUSCLK);
+DEFINE_CLK(mcfi2c0, "imx1-i2c.0", MCF_BUSCLK);
 
 struct clk *mcf_clks[] = {
 	&clk_pll,
@@ -50,6 +51,7 @@ struct clk *mcf_clks[] = {
 	&clk_mcfqspi0,
 	&clk_fec0,
 	&clk_fec1,
+	&clk_mcfi2c0,
 	NULL
 };
 
@@ -76,6 +78,31 @@ static void __init m527x_qspi_init(void)
 
 /***************************************************************************/
 
+static void __init m527x_i2c_init(void)
+{
+#if IS_ENABLED(CONFIG_I2C_IMX)
+#if defined(CONFIG_M5271)
+	u8 par;
+
+	/* setup Port FECI2C Pin Assignment Register for I2C */
+	/*  set PAR_SCL to SCL and PAR_SDA to SDA */
+	par = readb(MCFGPIO_PAR_FECI2C);
+	par |= 0x0f;
+	writeb(par, MCFGPIO_PAR_FECI2C);
+#elif defined(CONFIG_M5275)
+	u16 par;
+
+	/* setup Port FECI2C Pin Assignment Register for I2C */
+	/*  set PAR_SCL to SCL and PAR_SDA to SDA */
+	par = readw(MCFGPIO_PAR_FECI2C);
+	par |= 0x0f;
+	writew(par, MCFGPIO_PAR_FECI2C);
+#endif
+#endif /* IS_ENABLED(CONFIG_I2C_IMX) */
+}
+
+/***************************************************************************/
+
 static void __init m527x_uarts_init(void)
 {
 	u16 sepmask;
@@ -122,6 +149,7 @@ void __init config_BSP(char *commandp, int size)
 	m527x_uarts_init();
 	m527x_fec_init();
 	m527x_qspi_init();
+	m527x_i2c_init();
 }
 
 /***************************************************************************/
diff --git a/arch/m68k/coldfire/m528x.c b/arch/m68k/coldfire/m528x.c
index 12f9e37..ea76998 100644
--- a/arch/m68k/coldfire/m528x.c
+++ b/arch/m68k/coldfire/m528x.c
@@ -36,6 +36,7 @@
 DEFINE_CLK(mcfuart2, "mcfuart.2", MCF_BUSCLK);
 DEFINE_CLK(mcfqspi0, "mcfqspi.0", MCF_BUSCLK);
 DEFINE_CLK(fec0, "fec.0", MCF_BUSCLK);
+DEFINE_CLK(mcfi2c0, "imx1-i2c.0", MCF_BUSCLK);
 
 struct clk *mcf_clks[] = {
 	&clk_pll,
@@ -49,6 +50,7 @@ struct clk *mcf_clks[] = {
 	&clk_mcfuart2,
 	&clk_mcfqspi0,
 	&clk_fec0,
+	&clk_mcfi2c0,
 	NULL
 };
 
@@ -64,6 +66,21 @@ static void __init m528x_qspi_init(void)
 
 /***************************************************************************/
 
+static void __init m528x_i2c_init(void)
+{
+#if IS_ENABLED(CONFIG_I2C_IMX)
+	u16 paspar;
+
+	/* setup Port AS Pin Assignment Register for I2C */
+	/*  set PASPA0 to SCL and PASPA1 to SDA */
+	paspar = readw(MCFGPIO_PASPAR);
+	paspar |= 0xF;
+	writew(paspar, MCFGPIO_PASPAR);
+#endif /* IS_ENABLED(CONFIG_I2C_IMX) */
+}
+
+/***************************************************************************/
+
 static void __init m528x_uarts_init(void)
 {
 	u8 port;
@@ -127,6 +144,7 @@ void __init config_BSP(char *commandp, int size)
 	m528x_uarts_init();
 	m528x_fec_init();
 	m528x_qspi_init();
+	m528x_i2c_init();
 }
 
 /***************************************************************************/
diff --git a/arch/m68k/coldfire/m5307.c b/arch/m68k/coldfire/m5307.c
index 2da1d14..cc5e8a5 100644
--- a/arch/m68k/coldfire/m5307.c
+++ b/arch/m68k/coldfire/m5307.c
@@ -35,6 +35,7 @@
 DEFINE_CLK(mcftmr1, "mcftmr.1", MCF_BUSCLK);
 DEFINE_CLK(mcfuart0, "mcfuart.0", MCF_BUSCLK);
 DEFINE_CLK(mcfuart1, "mcfuart.1", MCF_BUSCLK);
+DEFINE_CLK(mcfi2c0, "imx1-i2c.0", MCF_BUSCLK);
 
 struct clk *mcf_clks[] = {
 	&clk_pll,
@@ -43,11 +44,23 @@ struct clk *mcf_clks[] = {
 	&clk_mcftmr1,
 	&clk_mcfuart0,
 	&clk_mcfuart1,
+	&clk_mcfi2c0,
 	NULL
 };
 
 /***************************************************************************/
 
+static void __init m5307_i2c_init(void)
+{
+#if IS_ENABLED(CONFIG_I2C_IMX)
+	writeb(MCFSIM_ICR_AUTOVEC | MCFSIM_ICR_LEVEL5 | MCFSIM_ICR_PRI0,
+	       MCFSIM_I2CICR);
+	mcf_mapirq2imr(MCF_IRQ_I2C0, MCFINTC_I2C);
+#endif /* IS_ENABLED(CONFIG_I2C_IMX) */
+}
+
+/***************************************************************************/
+
 void __init config_BSP(char *commandp, int size)
 {
 #if defined(CONFIG_NETtel) || \
@@ -73,6 +86,7 @@ void __init config_BSP(char *commandp, int size)
 	 */
 	wdebug(MCFDEBUG_CSR, MCFDEBUG_CSR_PSTCLK);
 #endif
+	m5307_i2c_init();
 }
 
 /***************************************************************************/
diff --git a/arch/m68k/coldfire/m53xx.c b/arch/m68k/coldfire/m53xx.c
index 2502f63..cf19179 100644
--- a/arch/m68k/coldfire/m53xx.c
+++ b/arch/m68k/coldfire/m53xx.c
@@ -38,7 +38,7 @@
 DEFINE_CLK(0, "intc.0", 18, MCF_CLK);
 DEFINE_CLK(0, "intc.1", 19, MCF_CLK);
 DEFINE_CLK(0, "iack.0", 21, MCF_CLK);
-DEFINE_CLK(0, "mcfi2c.0", 22, MCF_CLK);
+DEFINE_CLK(0, "imx1-i2c.0", 22, MCF_CLK);
 DEFINE_CLK(0, "mcfqspi.0", 23, MCF_CLK);
 DEFINE_CLK(0, "mcfuart.0", 24, MCF_BUSCLK);
 DEFINE_CLK(0, "mcfuart.1", 25, MCF_BUSCLK);
@@ -77,7 +77,7 @@ struct clk *mcf_clks[] = {
 	&__clk_0_18,	/* intc.0 */
 	&__clk_0_19,	/* intc.1 */
 	&__clk_0_21,	/* iack.0 */
-	&__clk_0_22,	/* mcfi2c.0 */
+	&__clk_0_22,	/* imx1-i2c.0 */
 	&__clk_0_23,	/* mcfqspi.0 */
 	&__clk_0_24,	/* mcfuart.0 */
 	&__clk_0_25,	/* mcfuart.1 */
@@ -133,7 +133,7 @@ struct clk *mcf_clks[] = {
 	&__clk_0_8,	/* mcfcan.0 */
 	&__clk_0_12,	/* fec.0 */
 	&__clk_0_17,	/* edma */
-	&__clk_0_22,	/* mcfi2c.0 */
+	&__clk_0_22,	/* imx1-i2c.0 */
 	&__clk_0_23,	/* mcfqspi.0 */
 	&__clk_0_30,	/* mcftmr.2 */
 	&__clk_0_31,	/* mcftmr.3 */
@@ -176,6 +176,19 @@ static void __init m53xx_qspi_init(void)
 
 /***************************************************************************/
 
+static void __init m53xx_i2c_init(void)
+{
+#if IS_ENABLED(CONFIG_I2C_IMX)
+	/* setup Port AS Pin Assignment Register for I2C */
+	/*  set PASPA0 to SCL and PASPA1 to SDA */
+	u8 r = readb(MCFGPIO_PAR_FECI2C);
+	r |= 0x0f;
+	writeb(r, MCFGPIO_PAR_FECI2C);
+#endif /* IS_ENABLED(CONFIG_I2C_IMX) */
+}
+
+/***************************************************************************/
+
 static void __init m53xx_uarts_init(void)
 {
 	/* UART GPIO initialization */
@@ -218,6 +231,7 @@ void __init config_BSP(char *commandp, int size)
 	m53xx_uarts_init();
 	m53xx_fec_init();
 	m53xx_qspi_init();
+	m53xx_i2c_init();
 
 #ifdef CONFIG_BDM_DISABLE
 	/*
diff --git a/arch/m68k/coldfire/m5407.c b/arch/m68k/coldfire/m5407.c
index 738eba6..38863dd 100644
--- a/arch/m68k/coldfire/m5407.c
+++ b/arch/m68k/coldfire/m5407.c
@@ -26,6 +26,7 @@
 DEFINE_CLK(mcftmr1, "mcftmr.1", MCF_BUSCLK);
 DEFINE_CLK(mcfuart0, "mcfuart.0", MCF_BUSCLK);
 DEFINE_CLK(mcfuart1, "mcfuart.1", MCF_BUSCLK);
+DEFINE_CLK(mcfi2c0, "imx1-i2c.0", MCF_BUSCLK);
 
 struct clk *mcf_clks[] = {
 	&clk_pll,
@@ -34,11 +35,23 @@ struct clk *mcf_clks[] = {
 	&clk_mcftmr1,
 	&clk_mcfuart0,
 	&clk_mcfuart1,
+	&clk_mcfi2c0,
 	NULL
 };
 
 /***************************************************************************/
 
+static void __init m5407_i2c_init(void)
+{
+#if IS_ENABLED(CONFIG_I2C_IMX)
+	writeb(MCFSIM_ICR_AUTOVEC | MCFSIM_ICR_LEVEL5 | MCFSIM_ICR_PRI0,
+	       MCFSIM_I2CICR);
+	mcf_mapirq2imr(MCF_IRQ_I2C0, MCFINTC_I2C);
+#endif /* IS_ENABLED(CONFIG_I2C_IMX) */
+}
+
+/***************************************************************************/
+
 void __init config_BSP(char *commandp, int size)
 {
 	mach_sched_init = hw_timer_init;
@@ -48,6 +61,7 @@ void __init config_BSP(char *commandp, int size)
 	mcf_mapirq2imr(27, MCFINTC_EINT3);
 	mcf_mapirq2imr(29, MCFINTC_EINT5);
 	mcf_mapirq2imr(31, MCFINTC_EINT7);
+	m5407_i2c_init();
 }
 
 /***************************************************************************/
diff --git a/arch/m68k/coldfire/m5441x.c b/arch/m68k/coldfire/m5441x.c
index 98a13cc..dc589b0 100644
--- a/arch/m68k/coldfire/m5441x.c
+++ b/arch/m68k/coldfire/m5441x.c
@@ -19,13 +19,13 @@
 DEFINE_CLK(0, "flexbus", 2, MCF_CLK);
 DEFINE_CLK(0, "mcfcan.0", 8, MCF_CLK);
 DEFINE_CLK(0, "mcfcan.1", 9, MCF_CLK);
-DEFINE_CLK(0, "mcfi2c.1", 14, MCF_CLK);
+DEFINE_CLK(0, "imx1-i2c.1", 14, MCF_CLK);
 DEFINE_CLK(0, "mcfdspi.1", 15, MCF_CLK);
 DEFINE_CLK(0, "edma", 17, MCF_CLK);
 DEFINE_CLK(0, "intc.0", 18, MCF_CLK);
 DEFINE_CLK(0, "intc.1", 19, MCF_CLK);
 DEFINE_CLK(0, "intc.2", 20, MCF_CLK);
-DEFINE_CLK(0, "mcfi2c.0", 22, MCF_CLK);
+DEFINE_CLK(0, "imx1-i2c.0", 22, MCF_CLK);
 DEFINE_CLK(0, "mcfdspi.0", 23, MCF_CLK);
 DEFINE_CLK(0, "mcfuart.0", 24, MCF_BUSCLK);
 DEFINE_CLK(0, "mcfuart.1", 25, MCF_BUSCLK);
@@ -59,10 +59,10 @@
 DEFINE_CLK(0, "nand.0", 63, MCF_CLK);
 
 DEFINE_CLK(1, "mcfow.0", 2, MCF_CLK);
-DEFINE_CLK(1, "mcfi2c.2", 4, MCF_CLK);
-DEFINE_CLK(1, "mcfi2c.3", 5, MCF_CLK);
-DEFINE_CLK(1, "mcfi2c.4", 6, MCF_CLK);
-DEFINE_CLK(1, "mcfi2c.5", 7, MCF_CLK);
+DEFINE_CLK(1, "imx1-i2c.2", 4, MCF_CLK);
+DEFINE_CLK(1, "imx1-i2c.3", 5, MCF_CLK);
+DEFINE_CLK(1, "imx1-i2c.4", 6, MCF_CLK);
+DEFINE_CLK(1, "imx1-i2c.5", 7, MCF_CLK);
 DEFINE_CLK(1, "mcfuart.4", 24, MCF_BUSCLK);
 DEFINE_CLK(1, "mcfuart.5", 25, MCF_BUSCLK);
 DEFINE_CLK(1, "mcfuart.6", 26, MCF_BUSCLK);
diff --git a/arch/m68k/coldfire/m54xx.c b/arch/m68k/coldfire/m54xx.c
index 386df3b..c552851 100644
--- a/arch/m68k/coldfire/m54xx.c
+++ b/arch/m68k/coldfire/m54xx.c
@@ -37,6 +37,7 @@
 DEFINE_CLK(mcfuart1, "mcfuart.1", MCF_BUSCLK);
 DEFINE_CLK(mcfuart2, "mcfuart.2", MCF_BUSCLK);
 DEFINE_CLK(mcfuart3, "mcfuart.3", MCF_BUSCLK);
+DEFINE_CLK(mcfi2c0, "imx1-i2c.0", MCF_BUSCLK);
 
 struct clk *mcf_clks[] = {
 	&clk_pll,
@@ -47,6 +48,7 @@ struct clk *mcf_clks[] = {
 	&clk_mcfuart1,
 	&clk_mcfuart2,
 	&clk_mcfuart3,
+	&clk_mcfi2c0,
 	NULL
 };
 
@@ -65,6 +67,20 @@ static void __init m54xx_uarts_init(void)
 
 /***************************************************************************/
 
+static void __init m54xx_i2c_init(void)
+{
+#if IS_ENABLED(CONFIG_I2C_IMX)
+	u32 r;
+
+	/* set the fec/i2c/irq pin assignment register for i2c */
+	r = readl(MCF_PAR_FECI2CIRQ);
+	r |= MCF_PAR_FECI2CIRQ_SDA | MCF_PAR_FECI2CIRQ_SCL;
+	writel(r, MCF_PAR_FECI2CIRQ);
+#endif /* IS_ENABLED(CONFIG_I2C_IMX) */
+}
+
+/***************************************************************************/
+
 static void mcf54xx_reset(void)
 {
 	/* disable interrupts and enable the watchdog */
@@ -86,6 +102,7 @@ void __init config_BSP(char *commandp, int size)
 	mach_reset = mcf54xx_reset;
 	mach_sched_init = hw_timer_init;
 	m54xx_uarts_init();
+	m54xx_i2c_init();
 }
 
 /***************************************************************************/
diff --git a/arch/m68k/include/asm/m5206sim.h b/arch/m68k/include/asm/m5206sim.h
index 4cf864f..0ddf3ef 100644
--- a/arch/m68k/include/asm/m5206sim.h
+++ b/arch/m68k/include/asm/m5206sim.h
@@ -110,6 +110,7 @@
 /*
  *	Define system peripheral IRQ usage.
  */
+#define	MCF_IRQ_I2C0		29		/* I2C, Level 5 */
 #define	MCF_IRQ_TIMER		30		/* Timer0, Level 6 */
 #define	MCF_IRQ_PROFILER	31		/* Timer1, Level 7 */
 #define	MCF_IRQ_UART0		73		/* UART0 */
@@ -138,6 +139,7 @@
 #define	MCFSIM_SWDICR		MCFSIM_ICR8	/* Watchdog timer ICR */
 #define	MCFSIM_TIMER1ICR	MCFSIM_ICR9	/* Timer 1 ICR */
 #define	MCFSIM_TIMER2ICR	MCFSIM_ICR10	/* Timer 2 ICR */
+#define	MCFSIM_I2CICR		MCFSIM_ICR11	/* I2C ICR */
 #define	MCFSIM_UART1ICR		MCFSIM_ICR12	/* UART 1 ICR */
 #define	MCFSIM_UART2ICR		MCFSIM_ICR13	/* UART 2 ICR */
 #ifdef CONFIG_M5206e
@@ -145,5 +147,11 @@
 #define	MCFSIM_DMA2ICR		MCFSIM_ICR15	/* DMA 2 ICR */
 #endif
 
+/*
+ * I2C Controller
+*/
+#define MCFI2C_BASE0		(MCF_MBAR + 0x1e0)
+#define MCFI2C_SIZE0		0x40
+
 /****************************************************************************/
 #endif	/* m5206sim_h */
diff --git a/arch/m68k/include/asm/m520xsim.h b/arch/m68k/include/asm/m520xsim.h
index db3f8ee..6d50cef 100644
--- a/arch/m68k/include/asm/m520xsim.h
+++ b/arch/m68k/include/asm/m520xsim.h
@@ -50,6 +50,7 @@
 #define MCFINT_UART0        26          /* Interrupt number for UART0 */
 #define MCFINT_UART1        27          /* Interrupt number for UART1 */
 #define MCFINT_UART2        28          /* Interrupt number for UART2 */
+#define MCFINT_I2C0         30          /* Interrupt number for I2C */
 #define MCFINT_QSPI         31          /* Interrupt number for QSPI */
 #define MCFINT_FECRX0	    36		/* Interrupt number for FEC RX */
 #define MCFINT_FECTX0	    40		/* Interrupt number for FEC RX */
@@ -67,6 +68,7 @@
 #define	MCF_IRQ_QSPI	    (MCFINT_VECBASE + MCFINT_QSPI)
 #define MCF_IRQ_PIT1        (MCFINT_VECBASE + MCFINT_PIT1)
 
+#define MCF_IRQ_I2C0        (MCFINT_VECBASE + MCFINT_I2C0)
 /*
  *  SDRAM configuration registers.
  */
@@ -200,5 +202,11 @@
 #define MCFPM_PPMLR0		0xfc040034
 #define MCFPM_LPCR		0xfc0a0007
 
+/*
+ * I2C module.
+ */
+#define MCFI2C_BASE0		0xFC058000
+#define MCFI2C_SIZE0		0x40
+
 /****************************************************************************/
 #endif  /* m520xsim_h */
diff --git a/arch/m68k/include/asm/m523xsim.h b/arch/m68k/include/asm/m523xsim.h
index 5e06b4e..d43f6ab 100644
--- a/arch/m68k/include/asm/m523xsim.h
+++ b/arch/m68k/include/asm/m523xsim.h
@@ -37,7 +37,8 @@
 #define	MCFINT_UART0		13		/* Interrupt number for UART0 */
 #define	MCFINT_UART1		14		/* Interrupt number for UART1 */
 #define	MCFINT_UART2		15		/* Interrupt number for UART2 */
-#define MCFINT_QSPI		18		/* Interrupt number for QSPI */
+#define	MCFINT_I2C0		17		/* Interrupt number for I2C */
+#define	MCFINT_QSPI		18		/* Interrupt number for QSPI */
 #define	MCFINT_FECRX0		23		/* Interrupt number for FEC */
 #define	MCFINT_FECTX0		27		/* Interrupt number for FEC */
 #define	MCFINT_FECENTC0		29		/* Interrupt number for FEC */
@@ -53,6 +54,7 @@
 
 #define	MCF_IRQ_QSPI		(MCFINT_VECBASE + MCFINT_QSPI)
 #define MCF_IRQ_PIT1		(MCFINT_VECBASE + MCFINT_PIT1)
+#define	MCF_IRQ_I2C0		(MCFINT_VECBASE + MCFINT_I2C0)
 
 /*
  *	SDRAM configuration registers.
@@ -208,5 +210,11 @@
 #define	MCFDMA_BASE2		(MCF_IPSBAR + 0x180)
 #define	MCFDMA_BASE3		(MCF_IPSBAR + 0x1C0)
 
+/*
+ * I2C module.
+ */
+#define	MCFI2C_BASE0		(MCF_IPSBAR + 0x300)
+#define	MCFI2C_SIZE0		0x40
+
 /****************************************************************************/
 #endif	/* m523xsim_h */
diff --git a/arch/m68k/include/asm/m527xsim.h b/arch/m68k/include/asm/m527xsim.h
index 2c648a0..35f6fbc 100644
--- a/arch/m68k/include/asm/m527xsim.h
+++ b/arch/m68k/include/asm/m527xsim.h
@@ -37,6 +37,7 @@
 #define	MCFINT_UART0		13		/* Interrupt number for UART0 */
 #define	MCFINT_UART1		14		/* Interrupt number for UART1 */
 #define	MCFINT_UART2		15		/* Interrupt number for UART2 */
+#define	MCFINT_I2C0		17		/* Interrupt number for I2C */
 #define	MCFINT_QSPI		18		/* Interrupt number for QSPI */
 #define	MCFINT_FECRX0		23		/* Interrupt number for FEC0 */
 #define	MCFINT_FECTX0		27		/* Interrupt number for FEC0 */
@@ -61,6 +62,7 @@
 
 #define	MCF_IRQ_QSPI		(MCFINT_VECBASE + MCFINT_QSPI)
 #define MCF_IRQ_PIT1		(MCFINT_VECBASE + MCFINT_PIT1)
+#define	MCF_IRQ_I2C0		(MCFINT_VECBASE + MCFINT_I2C0)
 
 /*
  *	SDRAM configuration registers.
@@ -353,5 +355,11 @@
 #define	MCF_RCR_SWRESET		0x80		/* Software reset bit */
 #define	MCF_RCR_FRCSTOUT	0x40		/* Force external reset */
 
+/*
+ * I2C module.
+ */
+#define	MCFI2C_BASE0		(MCF_IPSBAR + 0x300)
+#define	MCFI2C_SIZE0		0x40
+
 /****************************************************************************/
 #endif	/* m527xsim_h */
diff --git a/arch/m68k/include/asm/m528xsim.h b/arch/m68k/include/asm/m528xsim.h
index cf68ca0..67f6182 100644
--- a/arch/m68k/include/asm/m528xsim.h
+++ b/arch/m68k/include/asm/m528xsim.h
@@ -37,6 +37,7 @@
 #define	MCFINT_UART0		13		/* Interrupt number for UART0 */
 #define	MCFINT_UART1		14		/* Interrupt number for UART1 */
 #define	MCFINT_UART2		15		/* Interrupt number for UART2 */
+#define	MCFINT_I2C0		17		/* Interrupt number for I2C */
 #define	MCFINT_QSPI		18		/* Interrupt number for QSPI */
 #define	MCFINT_FECRX0		23		/* Interrupt number for FEC */
 #define	MCFINT_FECTX0		27		/* Interrupt number for FEC */
@@ -53,6 +54,8 @@
 
 #define	MCF_IRQ_QSPI		(MCFINT_VECBASE + MCFINT_QSPI)
 #define MCF_IRQ_PIT1		(MCFINT_VECBASE + MCFINT_PIT1)
+#define	MCF_IRQ_I2C0		(MCFINT_VECBASE + MCFINT_I2C0)
+
 /*
  *	SDRAM configuration registers.
  */
@@ -242,5 +245,11 @@
 #define	MCF_RCR_SWRESET		0x80		/* Software reset bit */
 #define	MCF_RCR_FRCSTOUT	0x40		/* Force external reset */
 
+/*
+ * I2C module
+ */
+#define	MCFI2C_BASE0		(MCF_IPSBAR + 0x300)
+#define	MCFI2C_SIZE0		0x40
+
 /****************************************************************************/
 #endif	/* m528xsim_h */
diff --git a/arch/m68k/include/asm/m5307sim.h b/arch/m68k/include/asm/m5307sim.h
index 5d0bb7e..d2595e0 100644
--- a/arch/m68k/include/asm/m5307sim.h
+++ b/arch/m68k/include/asm/m5307sim.h
@@ -148,6 +148,7 @@
 #define	MCFSIM_SWDICR		MCFSIM_ICR0	/* Watchdog timer ICR */
 #define	MCFSIM_TIMER1ICR	MCFSIM_ICR1	/* Timer 1 ICR */
 #define	MCFSIM_TIMER2ICR	MCFSIM_ICR2	/* Timer 2 ICR */
+#define	MCFSIM_I2CICR		MCFSIM_ICR3	/* I2C ICR */
 #define	MCFSIM_UART1ICR		MCFSIM_ICR4	/* UART 1 ICR */
 #define	MCFSIM_UART2ICR		MCFSIM_ICR5	/* UART 2 ICR */
 #define	MCFSIM_DMA0ICR		MCFSIM_ICR6	/* DMA 0 ICR */
@@ -155,7 +156,6 @@
 #define	MCFSIM_DMA2ICR		MCFSIM_ICR8	/* DMA 2 ICR */
 #define	MCFSIM_DMA3ICR		MCFSIM_ICR9	/* DMA 3 ICR */
 
-
 /*
  *	Some symbol defines for the Parallel Port Pin Assignment Register
  */
@@ -174,10 +174,17 @@
 /*
  *	Define system peripheral IRQ usage.
  */
+#define	MCF_IRQ_I2C0		29		/* I2C, Level 5 */
 #define	MCF_IRQ_TIMER		30		/* Timer0, Level 6 */
 #define	MCF_IRQ_PROFILER	31		/* Timer1, Level 7 */
 #define	MCF_IRQ_UART0		73		/* UART0 */
 #define	MCF_IRQ_UART1		74		/* UART1 */
 
+/*
+ * I2C module
+ */
+#define	MCFI2C_BASE0		(MCF_MBAR + 0x280)
+#define	MCFI2C_SIZE0		0x40
+
 /****************************************************************************/
 #endif	/* m5307sim_h */
diff --git a/arch/m68k/include/asm/m53xxsim.h b/arch/m68k/include/asm/m53xxsim.h
index faa1a21..53329ae 100644
--- a/arch/m68k/include/asm/m53xxsim.h
+++ b/arch/m68k/include/asm/m53xxsim.h
@@ -19,6 +19,7 @@
 #define MCFINT_UART0        26          /* Interrupt number for UART0 */
 #define MCFINT_UART1        27          /* Interrupt number for UART1 */
 #define MCFINT_UART2        28          /* Interrupt number for UART2 */
+#define MCFINT_I2C0         30		/* Interrupt number for I2C */
 #define MCFINT_QSPI         31          /* Interrupt number for QSPI */
 #define MCFINT_FECRX0	    36		/* Interrupt number for FEC */
 #define MCFINT_FECTX0	    40		/* Interrupt number for FEC */
@@ -32,6 +33,7 @@
 #define MCF_IRQ_FECTX0	    (MCFINT_VECBASE + MCFINT_FECTX0)
 #define MCF_IRQ_FECENTC0    (MCFINT_VECBASE + MCFINT_FECENTC0)
 
+#define	MCF_IRQ_I2C0	    (MCFINT_VECBASE + MCFINT_I2C0)
 #define	MCF_IRQ_QSPI	    (MCFINT_VECBASE + MCFINT_QSPI)
 
 #define MCF_WTM_WCR		0xFC098000
@@ -1237,5 +1239,11 @@
 #define MCFEPORT_EPPDR                (0xFC094005)
 #define MCFEPORT_EPFR                 (0xFC094006)
 
+/*
+ * I2C Module
+ */
+#define	MCFI2C_BASE0			(0xFc058000)
+#define	MCFI2C_SIZE0			0x40
+
 /********************************************************************/
 #endif	/* m53xxsim_h */
diff --git a/arch/m68k/include/asm/m5407sim.h b/arch/m68k/include/asm/m5407sim.h
index a7550bc..ab40c16 100644
--- a/arch/m68k/include/asm/m5407sim.h
+++ b/arch/m68k/include/asm/m5407sim.h
@@ -112,6 +112,7 @@
 #define	MCFSIM_SWDICR		MCFSIM_ICR0	/* Watchdog timer ICR */
 #define	MCFSIM_TIMER1ICR	MCFSIM_ICR1	/* Timer 1 ICR */
 #define	MCFSIM_TIMER2ICR	MCFSIM_ICR2	/* Timer 2 ICR */
+#define	MCFSIM_I2CICR		MCFSIM_ICR3	/* I2C ICR */
 #define	MCFSIM_UART1ICR		MCFSIM_ICR4	/* UART 1 ICR */
 #define	MCFSIM_UART2ICR		MCFSIM_ICR5	/* UART 2 ICR */
 #define	MCFSIM_DMA0ICR		MCFSIM_ICR6	/* DMA 0 ICR */
@@ -137,10 +138,17 @@
 /*
  *	Define system peripheral IRQ usage.
  */
+#define	MCF_IRQ_I2C0		29		/* I2C, Level 5 */
 #define	MCF_IRQ_TIMER		30		/* Timer0, Level 6 */
 #define	MCF_IRQ_PROFILER	31		/* Timer1, Level 7 */
 #define	MCF_IRQ_UART0		73		/* UART0 */
 #define	MCF_IRQ_UART1		74		/* UART1 */
 
+/*
+ * I2C module
+ */
+#define	MCFI2C_BASE0		(MCF_MBAR + 0x280)
+#define	MCFI2C_SIZE0		0x40
+
 /****************************************************************************/
 #endif	/* m5407sim_h */
diff --git a/arch/m68k/include/asm/m54xxsim.h b/arch/m68k/include/asm/m54xxsim.h
index 73d937f..7758d0a 100644
--- a/arch/m68k/include/asm/m54xxsim.h
+++ b/arch/m68k/include/asm/m54xxsim.h
@@ -45,6 +45,7 @@
  */
 #define MCF_IRQ_TIMER		(MCFINT_VECBASE + 54)	/* Slice Timer 0 */
 #define MCF_IRQ_PROFILER	(MCFINT_VECBASE + 53)	/* Slice Timer 1 */
+#define MCF_IRQ_I2C0		(MCFINT_VECBASE + 40)
 #define MCF_IRQ_UART0		(MCFINT_VECBASE + 35)
 #define MCF_IRQ_UART1		(MCFINT_VECBASE + 34)
 #define MCF_IRQ_UART2		(MCFINT_VECBASE + 33)
@@ -107,4 +108,14 @@
 #define MCF_PAR_PSC_RTS_RTS	(0x30)
 #define MCF_PAR_PSC_CANRX	(0x40)
 
+#define MCF_PAR_FECI2CIRQ	(MCF_MBAR + 0x00000a44)	/* FEC/I2C/IRQ */
+#define MCF_PAR_FECI2CIRQ_SDA	(1 << 3)
+#define MCF_PAR_FECI2CIRQ_SCL	(1 << 2)
+
+/*
+ * I2C module.
+ */
+#define MCFI2C_BASE0		(MCF_MBAR + 0x8f00)
+#define MCFI2C_SIZE0		0x40
+
 #endif	/* m54xxsim_h */
-- 
1.9.1
