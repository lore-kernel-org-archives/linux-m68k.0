From: <gerg@snapgear.com>
Subject: [PATCH 23/23] m68knommu: merge common ColdFire UART IRQ setup
Date: Thu, 23 Feb 2012 14:34:55 +1000
Message-ID: <1329971695-2203-24-git-send-email-gerg@snapgear.com>
References: <1329971695-2203-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:17828 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753940Ab2BWEev (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 22 Feb 2012 23:34:51 -0500
In-Reply-To: <1329971695-2203-1-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

Some ColdFire CPU UART hardware modules can configure the IRQ they use.
Currently the same setup code is duplicated in the init code for each of
these ColdFire CPUs. Merge all this code to a single instance.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/include/asm/mcfuart.h      |    5 ++++-
 arch/m68k/platform/5206/config.c     |   17 -----------------
 arch/m68k/platform/5249/config.c     |   17 -----------------
 arch/m68k/platform/5307/config.c     |   17 -----------------
 arch/m68k/platform/5407/config.c     |   17 -----------------
 arch/m68k/platform/coldfire/device.c |   20 ++++++++++++++++++++
 6 files changed, 24 insertions(+), 69 deletions(-)

diff --git a/arch/m68k/include/asm/mcfuart.h b/arch/m68k/include/asm/mcfuart.h
index 2abedff..2d3bc77 100644
--- a/arch/m68k/include/asm/mcfuart.h
+++ b/arch/m68k/include/asm/mcfuart.h
@@ -41,7 +41,10 @@ struct mcf_platform_uart {
 #define	MCFUART_UTF		0x28		/* Transmitter FIFO (r/w) */
 #define	MCFUART_URF		0x2c		/* Receiver FIFO (r/w) */
 #define	MCFUART_UFPD		0x30		/* Frac Prec. Divider (r/w) */
-#else
+#endif
+#if defined(CONFIG_M5206) || defined(CONFIG_M5206e) || \
+        defined(CONFIG_M5249) || defined(CONFIG_M5307) || \
+        defined(CONFIG_M5407)
 #define	MCFUART_UIVR		0x30		/* Interrupt Vector (r/w) */
 #endif
 #define	MCFUART_UIPR		0x34		/* Input Port (r) */
diff --git a/arch/m68k/platform/5206/config.c b/arch/m68k/platform/5206/config.c
index 98b26dc..570934d 100644
--- a/arch/m68k/platform/5206/config.c
+++ b/arch/m68k/platform/5206/config.c
@@ -16,22 +16,6 @@
 #include <asm/machdep.h>
 #include <asm/coldfire.h>
 #include <asm/mcfsim.h>
-#include <asm/mcfuart.h>
-
-/***************************************************************************/
-
-static void __init m5206_uarts_init(void)
-{
-	/* UART0 interrupt setup */
-	writel(MCFSIM_ICR_LEVEL6 | MCFSIM_ICR_PRI1, MCF_MBAR + MCFSIM_UART1ICR);
-	writeb(MCF_IRQ_UART0, MCFUART_BASE0 + MCFUART_UIVR);
-	mcf_mapirq2imr(MCF_IRQ_UART0, MCFINTC_UART0);
-
-	/* UART1 interrupt setup */
-	writel(MCFSIM_ICR_LEVEL6 | MCFSIM_ICR_PRI2, MCF_MBAR + MCFSIM_UART2ICR);
-	writeb(MCF_IRQ_UART1, MCFUART_BASE1 + MCFUART_UIVR);
-	mcf_mapirq2imr(MCF_IRQ_UART1, MCFINTC_UART1);
-}
 
 /***************************************************************************/
 
@@ -73,7 +57,6 @@ void __init config_BSP(char *commandp, int size)
 
 	mach_reset = m5206_cpu_reset;
 	m5206_timers_init();
-	m5206_uarts_init();
 
 	/* Only support the external interrupts on their primary level */
 	mcf_mapirq2imr(25, MCFINTC_EINT1);
diff --git a/arch/m68k/platform/5249/config.c b/arch/m68k/platform/5249/config.c
index 06fab4a..3871251 100644
--- a/arch/m68k/platform/5249/config.c
+++ b/arch/m68k/platform/5249/config.c
@@ -17,7 +17,6 @@
 #include <asm/machdep.h>
 #include <asm/coldfire.h>
 #include <asm/mcfsim.h>
-#include <asm/mcfuart.h>
 #include <asm/mcfqspi.h>
 
 /***************************************************************************/
@@ -215,21 +214,6 @@ static struct platform_device *m5249_devices[] __initdata = {
 
 /***************************************************************************/
 
-static void __init m5249_uarts_init(void)
-{
-	/* UART0 interrupt setup */
-	writeb(MCFSIM_ICR_LEVEL6 | MCFSIM_ICR_PRI1, MCF_MBAR + MCFSIM_UART1ICR);
-	writeb(MCF_IRQ_UART0, MCFUART_BASE0 + MCFUART_UIVR);
-	mcf_mapirq2imr(MCF_IRQ_UART0, MCFINTC_UART0);
-
-	/* UART1 interrupt setup */
-	writeb(MCFSIM_ICR_LEVEL6 | MCFSIM_ICR_PRI2, MCF_MBAR + MCFSIM_UART2ICR);
-	writeb(MCF_IRQ_UART1, MCFUART_BASE1 + MCFUART_UIVR);
-	mcf_mapirq2imr(MCF_IRQ_UART1, MCFINTC_UART1);
-}
-
-/***************************************************************************/
-
 #ifdef CONFIG_M5249C3
 
 static void __init m5249_smc91x_init(void)
@@ -280,7 +264,6 @@ void __init config_BSP(char *commandp, int size)
 {
 	mach_reset = m5249_cpu_reset;
 	m5249_timers_init();
-	m5249_uarts_init();
 #ifdef CONFIG_M5249C3
 	m5249_smc91x_init();
 #endif
diff --git a/arch/m68k/platform/5307/config.c b/arch/m68k/platform/5307/config.c
index 0459725..a45db41 100644
--- a/arch/m68k/platform/5307/config.c
+++ b/arch/m68k/platform/5307/config.c
@@ -16,7 +16,6 @@
 #include <asm/machdep.h>
 #include <asm/coldfire.h>
 #include <asm/mcfsim.h>
-#include <asm/mcfuart.h>
 #include <asm/mcfwdebug.h>
 
 /***************************************************************************/
@@ -29,21 +28,6 @@ unsigned char ledbank = 0xff;
 
 /***************************************************************************/
 
-static void __init m5307_uarts_init(void)
-{
-	/* UART0 interrupt setup */
-	writeb(MCFSIM_ICR_LEVEL6 | MCFSIM_ICR_PRI1, MCF_MBAR + MCFSIM_UART1ICR);
-	writeb(MCF_IRQ_UART0, MCFUART_BASE0 + MCFUART_UIVR);
-	mcf_mapirq2imr(MCF_IRQ_UART0, MCFINTC_UART0);
-
-	/* UART1 interrupt setup */
-	writeb(MCFSIM_ICR_LEVEL6 | MCFSIM_ICR_PRI2, MCF_MBAR + MCFSIM_UART2ICR);
-	writeb(MCF_IRQ_UART1, MCFUART_BASE1 + MCFUART_UIVR);
-	mcf_mapirq2imr(MCF_IRQ_UART1, MCFINTC_UART1);
-}
-
-/***************************************************************************/
-
 static void __init m5307_timers_init(void)
 {
 	/* Timer1 is always used as system timer */
@@ -83,7 +67,6 @@ void __init config_BSP(char *commandp, int size)
 
 	mach_reset = m5307_cpu_reset;
 	m5307_timers_init();
-	m5307_uarts_init();
 
 	/* Only support the external interrupts on their primary level */
 	mcf_mapirq2imr(25, MCFINTC_EINT1);
diff --git a/arch/m68k/platform/5407/config.c b/arch/m68k/platform/5407/config.c
index f1af78c..3fb3010 100644
--- a/arch/m68k/platform/5407/config.c
+++ b/arch/m68k/platform/5407/config.c
@@ -16,22 +16,6 @@
 #include <asm/machdep.h>
 #include <asm/coldfire.h>
 #include <asm/mcfsim.h>
-#include <asm/mcfuart.h>
-
-/***************************************************************************/
-
-static void __init m5407_uarts_init(void)
-{
-	/* UART0 interrupt setup */
-	writeb(MCFSIM_ICR_LEVEL6 | MCFSIM_ICR_PRI1, MCF_MBAR + MCFSIM_UART1ICR);
-	writeb(MCF_IRQ_UART0, MCFUART_BASE0 + MCFUART_UIVR);
-	mcf_mapirq2imr(MCF_IRQ_UART0, MCFINTC_UART0);
-
-	/* UART1 interrupt setup */
-	writeb(MCFSIM_ICR_LEVEL6 | MCFSIM_ICR_PRI2, MCF_MBAR + MCFSIM_UART2ICR);
-	writeb(MCF_IRQ_UART1, MCFUART_BASE1 + MCFUART_UIVR);
-	mcf_mapirq2imr(MCF_IRQ_UART1, MCFINTC_UART1);
-}
 
 /***************************************************************************/
 
@@ -67,7 +51,6 @@ void __init config_BSP(char *commandp, int size)
 {
 	mach_reset = m5407_cpu_reset;
 	m5407_timers_init();
-	m5407_uarts_init();
 
 	/* Only support the external interrupts on their primary level */
 	mcf_mapirq2imr(25, MCFINTC_EINT1);
diff --git a/arch/m68k/platform/coldfire/device.c b/arch/m68k/platform/coldfire/device.c
index c950690..b930192 100644
--- a/arch/m68k/platform/coldfire/device.c
+++ b/arch/m68k/platform/coldfire/device.c
@@ -50,8 +50,28 @@ static struct platform_device *mcf_devices[] __initdata = {
 	&mcf_uart,
 };
 
+
+/*
+ *	Some ColdFire UARTs let you set the IRQ line to use.
+ */
+static void __init mcf_uart_set_irq(void)
+{
+#ifdef MCFUART_UIVR
+	/* UART0 interrupt setup */
+	writeb(MCFSIM_ICR_LEVEL6 | MCFSIM_ICR_PRI1, MCF_MBAR + MCFSIM_UART1ICR);
+	writeb(MCF_IRQ_UART0, MCFUART_BASE0 + MCFUART_UIVR);
+	mcf_mapirq2imr(MCF_IRQ_UART0, MCFINTC_UART0);
+
+	/* UART1 interrupt setup */
+	writeb(MCFSIM_ICR_LEVEL6 | MCFSIM_ICR_PRI2, MCF_MBAR + MCFSIM_UART2ICR);
+	writeb(MCF_IRQ_UART1, MCFUART_BASE1 + MCFUART_UIVR);
+	mcf_mapirq2imr(MCF_IRQ_UART1, MCFINTC_UART1);
+#endif
+}
+
 static int __init mcf_init_devices(void)
 {
+	mcf_uart_set_irq();
 	platform_add_devices(mcf_devices, ARRAY_SIZE(mcf_devices));
 	return 0;
 }
-- 
1.7.0.4
