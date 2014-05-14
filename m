From: Steven King <sfking@fdwdc.com>
Subject: [PATCH] m68knommu: qspi declutter.
Date: Wed, 14 May 2014 10:07:55 -0700
Message-ID: <201405141007.56034.sfking@fdwdc.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from smtp102.biz.mail.bf1.yahoo.com ([98.139.221.61]:39802 "HELO
	smtp102.biz.mail.bf1.yahoo.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with SMTP id S1756595AbaENROh (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>);
	Wed, 14 May 2014 13:14:37 -0400
Content-Disposition: inline
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>, Greg Ungerer <gerg@uclinux.org>, linux-m68k@vger.kernel.org

Move the check for the QSPI config option inside the function body.  If the 
option is not enabled, the compiler will optimize away the empty function
body so we can remove the other check for the config option.

Signed-off-by: Steven King <sfking@fdwdc.com>

---
 arch/m68k/platform/coldfire/m520x.c |    8 ++------
 arch/m68k/platform/coldfire/m523x.c |    8 ++------
 arch/m68k/platform/coldfire/m5249.c |    8 ++------
 arch/m68k/platform/coldfire/m527x.c |    8 ++------
 arch/m68k/platform/coldfire/m528x.c |    8 ++------
 arch/m68k/platform/coldfire/m53xx.c |    8 ++------
 6 files changed, 12 insertions(+), 36 deletions(-)

diff --git a/arch/m68k/platform/coldfire/m520x.c b/arch/m68k/platform/coldfire/m520x.c
index ea1be0e..4040a3c 100644
--- a/arch/m68k/platform/coldfire/m520x.c
+++ b/arch/m68k/platform/coldfire/m520x.c
@@ -118,10 +118,9 @@ static void __init m520x_clk_init(void)
 
 /***************************************************************************/
 
-#if IS_ENABLED(CONFIG_SPI_COLDFIRE_QSPI)
-
 static void __init m520x_qspi_init(void)
 {
+#if IS_ENABLED(CONFIG_SPI_COLDFIRE_QSPI)
 	u16 par;
 	/* setup Port QS for QSPI with gpio CS control */
 	writeb(0x3f, MCF_GPIO_PAR_QSPI);
@@ -129,9 +128,8 @@ static void __init m520x_qspi_init(void)
 	par = readw(MCF_GPIO_PAR_UART);
 	par &= 0x00ff;
 	writew(par, MCF_GPIO_PAR_UART);
-}
-
 #endif /* IS_ENABLED(CONFIG_SPI_COLDFIRE_QSPI) */
+}
 
 /***************************************************************************/
 
@@ -176,9 +174,7 @@ void __init config_BSP(char *commandp, int size)
 	m520x_clk_init();
 	m520x_uarts_init();
 	m520x_fec_init();
-#if IS_ENABLED(CONFIG_SPI_COLDFIRE_QSPI)
 	m520x_qspi_init();
-#endif
 }
 
 /***************************************************************************/
diff --git a/arch/m68k/platform/coldfire/m523x.c b/arch/m68k/platform/coldfire/m523x.c
index 2b10e9f..446eee5 100644
--- a/arch/m68k/platform/coldfire/m523x.c
+++ b/arch/m68k/platform/coldfire/m523x.c
@@ -50,10 +50,9 @@ struct clk *mcf_clks[] = {
 
 /***************************************************************************/
 
-#if IS_ENABLED(CONFIG_SPI_COLDFIRE_QSPI)
-
 static void __init m523x_qspi_init(void)
 {
+#if IS_ENABLED(CONFIG_SPI_COLDFIRE_QSPI)
 	u16 par;
 
 	/* setup QSPS pins for QSPI with gpio CS control */
@@ -62,9 +61,8 @@ static void __init m523x_qspi_init(void)
 	par = readw(MCFGPIO_PAR_TIMER);
 	par &= 0x3f3f;
 	writew(par, MCFGPIO_PAR_TIMER);
-}
-
 #endif /* IS_ENABLED(CONFIG_SPI_COLDFIRE_QSPI) */
+}
 
 /***************************************************************************/
 
@@ -80,9 +78,7 @@ void __init config_BSP(char *commandp, int size)
 {
 	mach_sched_init = hw_timer_init;
 	m523x_fec_init();
-#if IS_ENABLED(CONFIG_SPI_COLDFIRE_QSPI)
 	m523x_qspi_init();
-#endif
 }
 
 /***************************************************************************/
diff --git a/arch/m68k/platform/coldfire/m5249.c b/arch/m68k/platform/coldfire/m5249.c
index c80b5e5..f7ba2a2 100644
--- a/arch/m68k/platform/coldfire/m5249.c
+++ b/arch/m68k/platform/coldfire/m5249.c
@@ -71,17 +71,15 @@ static struct platform_device *m5249_devices[] __initdata = {
 
 /***************************************************************************/
 
-#if IS_ENABLED(CONFIG_SPI_COLDFIRE_QSPI)
-
 static void __init m5249_qspi_init(void)
 {
+#if IS_ENABLED(CONFIG_SPI_COLDFIRE_QSPI)
 	/* QSPI irq setup */
 	writeb(MCFSIM_ICR_AUTOVEC | MCFSIM_ICR_LEVEL4 | MCFSIM_ICR_PRI0,
 	       MCFSIM_QSPIICR);
 	mcf_mapirq2imr(MCF_IRQ_QSPI, MCFINTC_QSPI);
-}
-
 #endif /* IS_ENABLED(CONFIG_SPI_COLDFIRE_QSPI) */
+}
 
 /***************************************************************************/
 
@@ -110,9 +108,7 @@ void __init config_BSP(char *commandp, int size)
 #ifdef CONFIG_M5249C3
 	m5249_smc91x_init();
 #endif
-#if IS_ENABLED(CONFIG_SPI_COLDFIRE_QSPI)
 	m5249_qspi_init();
-#endif
 }
 
 /***************************************************************************/
diff --git a/arch/m68k/platform/coldfire/m527x.c b/arch/m68k/platform/coldfire/m527x.c
index 6fbfe909..f253ce0 100644
--- a/arch/m68k/platform/coldfire/m527x.c
+++ b/arch/m68k/platform/coldfire/m527x.c
@@ -53,10 +53,9 @@ struct clk *mcf_clks[] = {
 
 /***************************************************************************/
 
-#if IS_ENABLED(CONFIG_SPI_COLDFIRE_QSPI)
-
 static void __init m527x_qspi_init(void)
 {
+#if IS_ENABLED(CONFIG_SPI_COLDFIRE_QSPI)
 #if defined(CONFIG_M5271)
 	u16 par;
 
@@ -70,9 +69,8 @@ static void __init m527x_qspi_init(void)
 	/* setup QSPS pins for QSPI with gpio CS control */
 	writew(0x003e, MCFGPIO_PAR_QSPI);
 #endif
-}
-
 #endif /* IS_ENABLED(CONFIG_SPI_COLDFIRE_QSPI) */
+}
 
 /***************************************************************************/
 
@@ -120,9 +118,7 @@ void __init config_BSP(char *commandp, int size)
 	mach_sched_init = hw_timer_init;
 	m527x_uarts_init();
 	m527x_fec_init();
-#if IS_ENABLED(CONFIG_SPI_COLDFIRE_QSPI)
 	m527x_qspi_init();
-#endif
 }
 
 /***************************************************************************/
diff --git a/arch/m68k/platform/coldfire/m528x.c b/arch/m68k/platform/coldfire/m528x.c
index b03a9d2..7c258e9 100644
--- a/arch/m68k/platform/coldfire/m528x.c
+++ b/arch/m68k/platform/coldfire/m528x.c
@@ -52,15 +52,13 @@ struct clk *mcf_clks[] = {
 
 /***************************************************************************/
 
-#if IS_ENABLED(CONFIG_SPI_COLDFIRE_QSPI)
-
 static void __init m528x_qspi_init(void)
 {
+#if IS_ENABLED(CONFIG_SPI_COLDFIRE_QSPI)
 	/* setup Port QS for QSPI with gpio CS control */
 	__raw_writeb(0x07, MCFGPIO_PQSPAR);
-}
-
 #endif /* IS_ENABLED(CONFIG_SPI_COLDFIRE_QSPI) */
+}
 
 /***************************************************************************/
 
@@ -126,9 +124,7 @@ void __init config_BSP(char *commandp, int size)
 	mach_sched_init = hw_timer_init;
 	m528x_uarts_init();
 	m528x_fec_init();
-#if IS_ENABLED(CONFIG_SPI_COLDFIRE_QSPI)
 	m528x_qspi_init();
-#endif
 }
 
 /***************************************************************************/
diff --git a/arch/m68k/platform/coldfire/m53xx.c b/arch/m68k/platform/coldfire/m53xx.c
index 5286f98..80879a7 100644
--- a/arch/m68k/platform/coldfire/m53xx.c
+++ b/arch/m68k/platform/coldfire/m53xx.c
@@ -166,15 +166,13 @@ static void __init m53xx_clk_init(void)
 
 /***************************************************************************/
 
-#if IS_ENABLED(CONFIG_SPI_COLDFIRE_QSPI)
-
 static void __init m53xx_qspi_init(void)
 {
+#if IS_ENABLED(CONFIG_SPI_COLDFIRE_QSPI)
 	/* setup QSPS pins for QSPI with gpio CS control */
 	writew(0x01f0, MCFGPIO_PAR_QSPI);
-}
-
 #endif /* IS_ENABLED(CONFIG_SPI_COLDFIRE_QSPI) */
+}
 
 /***************************************************************************/
 
@@ -219,9 +217,7 @@ void __init config_BSP(char *commandp, int size)
 	m53xx_clk_init();
 	m53xx_uarts_init();
 	m53xx_fec_init();
-#if IS_ENABLED(CONFIG_SPI_COLDFIRE_QSPI)
 	m53xx_qspi_init();
-#endif
 
 #ifdef CONFIG_BDM_DISABLE
 	/*
