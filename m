From: <gerg@snapgear.com>
Subject: [PATCH 5/5] m68knommu: factor more common ColdFire cpu reset code
Date: Tue, 28 Feb 2012 13:58:22 +1000
Message-ID: <1330401502-26250-5-git-send-email-gerg@snapgear.com>
References: <1330401502-26250-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from dalsmrelay2.nai.com ([205.227.136.216]:41214 "EHLO
	dalsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754856Ab2B1D4X (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 27 Feb 2012 22:56:23 -0500
In-Reply-To: <1330401502-26250-1-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

Most of the more modern ColdFire cores use the same code to reset the CPU
(but it is different to most of the earlier cores). Currently that is
duplicated in each of the sub-arch files. Pull out this common code and
out a single copy of it with the other common reset code.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/platform/520x/config.c     |    9 ---------
 arch/m68k/platform/523x/config.c     |    9 ---------
 arch/m68k/platform/527x/config.c     |    9 ---------
 arch/m68k/platform/528x/config.c     |    9 ---------
 arch/m68k/platform/532x/config.c     |    9 ---------
 arch/m68k/platform/coldfire/Makefile |   10 +++++-----
 arch/m68k/platform/coldfire/reset.c  |   19 ++++++++++++++++++-
 7 files changed, 23 insertions(+), 51 deletions(-)

diff --git a/arch/m68k/platform/520x/config.c b/arch/m68k/platform/520x/config.c
index 733d550..27fc505 100644
--- a/arch/m68k/platform/520x/config.c
+++ b/arch/m68k/platform/520x/config.c
@@ -74,17 +74,8 @@ static void __init m520x_fec_init(void)
 
 /***************************************************************************/
 
-static void m520x_cpu_reset(void)
-{
-	local_irq_disable();
-	__raw_writeb(MCF_RCR_SWRESET, MCF_RCR);
-}
-
-/***************************************************************************/
-
 void __init config_BSP(char *commandp, int size)
 {
-	mach_reset = m520x_cpu_reset;
 	m520x_uarts_init();
 	m520x_fec_init();
 #ifdef CONFIG_SPI_COLDFIRE_QSPI
diff --git a/arch/m68k/platform/523x/config.c b/arch/m68k/platform/523x/config.c
index 5f5e80b..9c188e5 100644
--- a/arch/m68k/platform/523x/config.c
+++ b/arch/m68k/platform/523x/config.c
@@ -54,17 +54,8 @@ static void __init m523x_fec_init(void)
 
 /***************************************************************************/
 
-static void m523x_cpu_reset(void)
-{
-	local_irq_disable();
-	__raw_writeb(MCF_RCR_SWRESET, MCF_RCR);
-}
-
-/***************************************************************************/
-
 void __init config_BSP(char *commandp, int size)
 {
-	mach_reset = m523x_cpu_reset;
 	m523x_fec_init();
 #ifdef CONFIG_SPI_COLDFIRE_QSPI
 	m523x_qspi_init();
diff --git a/arch/m68k/platform/527x/config.c b/arch/m68k/platform/527x/config.c
index 51a3095..d1f062b 100644
--- a/arch/m68k/platform/527x/config.c
+++ b/arch/m68k/platform/527x/config.c
@@ -87,17 +87,8 @@ static void __init m527x_fec_init(void)
 
 /***************************************************************************/
 
-static void m527x_cpu_reset(void)
-{
-	local_irq_disable();
-	__raw_writeb(MCF_RCR_SWRESET, MCF_RCR);
-}
-
-/***************************************************************************/
-
 void __init config_BSP(char *commandp, int size)
 {
-	mach_reset = m527x_cpu_reset;
 	m527x_uarts_init();
 	m527x_fec_init();
 #ifdef CONFIG_SPI_COLDFIRE_QSPI
diff --git a/arch/m68k/platform/528x/config.c b/arch/m68k/platform/528x/config.c
index 957b5c0..7d6f357 100644
--- a/arch/m68k/platform/528x/config.c
+++ b/arch/m68k/platform/528x/config.c
@@ -60,14 +60,6 @@ static void __init m528x_fec_init(void)
 
 /***************************************************************************/
 
-static void m528x_cpu_reset(void)
-{
-	local_irq_disable();
-	__raw_writeb(MCF_RCR_SWRESET, MCF_RCR);
-}
-
-/***************************************************************************/
-
 #ifdef CONFIG_WILDFIRE
 void wildfire_halt(void)
 {
@@ -103,7 +95,6 @@ void __init config_BSP(char *commandp, int size)
 #ifdef CONFIG_WILDFIREMOD
 	mach_halt = wildfiremod_halt;
 #endif
-	mach_reset = m528x_cpu_reset;
 	m528x_uarts_init();
 	m528x_fec_init();
 #ifdef CONFIG_SPI_COLDFIRE_QSPI
diff --git a/arch/m68k/platform/532x/config.c b/arch/m68k/platform/532x/config.c
index 99c9e4a..f92771d 100644
--- a/arch/m68k/platform/532x/config.c
+++ b/arch/m68k/platform/532x/config.c
@@ -61,14 +61,6 @@ static void __init m532x_fec_init(void)
 
 /***************************************************************************/
 
-static void m532x_cpu_reset(void)
-{
-	local_irq_disable();
-	__raw_writeb(MCF_RCR_SWRESET, MCF_RCR);
-}
-
-/***************************************************************************/
-
 void __init config_BSP(char *commandp, int size)
 {
 #if !defined(CONFIG_BOOTPARAM)
@@ -82,7 +74,6 @@ void __init config_BSP(char *commandp, int size)
 	}
 #endif
 
-	mach_reset = m532x_cpu_reset;
 	m532x_uarts_init();
 	m532x_fec_init();
 #ifdef CONFIG_SPI_COLDFIRE_QSPI
diff --git a/arch/m68k/platform/coldfire/Makefile b/arch/m68k/platform/coldfire/Makefile
index bccab93..a0815c6 100644
--- a/arch/m68k/platform/coldfire/Makefile
+++ b/arch/m68k/platform/coldfire/Makefile
@@ -17,14 +17,14 @@ asflags-$(CONFIG_FULLDEBUG) := -DDEBUGGER_COMPATIBLE_CACHE=1
 obj-$(CONFIG_COLDFIRE)	+= cache.o clk.o device.o dma.o entry.o vectors.o
 obj-$(CONFIG_M5206)	+= timers.o intc.o reset.o
 obj-$(CONFIG_M5206e)	+= timers.o intc.o reset.o
-obj-$(CONFIG_M520x)	+= pit.o intc-simr.o
-obj-$(CONFIG_M523x)	+= pit.o dma_timer.o intc-2.o
+obj-$(CONFIG_M520x)	+= pit.o intc-simr.o reset.o
+obj-$(CONFIG_M523x)	+= pit.o dma_timer.o intc-2.o reset.o
 obj-$(CONFIG_M5249)	+= timers.o intc.o reset.o
-obj-$(CONFIG_M527x)	+= pit.o intc-2.o
+obj-$(CONFIG_M527x)	+= pit.o intc-2.o reset.o
 obj-$(CONFIG_M5272)	+= timers.o
-obj-$(CONFIG_M528x)	+= pit.o intc-2.o
+obj-$(CONFIG_M528x)	+= pit.o intc-2.o reset.o
 obj-$(CONFIG_M5307)	+= timers.o intc.o reset.o
-obj-$(CONFIG_M532x)	+= timers.o intc-simr.o
+obj-$(CONFIG_M532x)	+= timers.o intc-simr.o reset.o
 obj-$(CONFIG_M5407)	+= timers.o intc.o reset.o
 obj-$(CONFIG_M54xx)	+= sltimers.o intc-2.o
 
diff --git a/arch/m68k/platform/coldfire/reset.c b/arch/m68k/platform/coldfire/reset.c
index 2ee3887..40609b4 100644
--- a/arch/m68k/platform/coldfire/reset.c
+++ b/arch/m68k/platform/coldfire/reset.c
@@ -14,7 +14,15 @@
 #include <asm/coldfire.h>
 #include <asm/mcfsim.h>
 
-void mcf_cpu_reset(void)
+/*
+ *	There are 2 common methods amongst the ColdFure parts for reseting
+ *	the CPU. But there are couple of exceptions, the 5272 and the 547x
+ *	have something completely special to them, and we let their specific
+ *	subarch code handle them.
+ */
+
+#ifdef MCFSIM_SYPCR
+static void mcf_cpu_reset(void)
 {
 	local_irq_disable();
 	/* Set watchdog to soft reset, and enabled */
@@ -22,6 +30,15 @@ void mcf_cpu_reset(void)
 	for (;;)
 		/* wait for watchdog to timeout */;
 }
+#endif
+
+#ifdef MCF_RCR
+static void mcf_cpu_reset(void)
+{
+	local_irq_disable();
+	__raw_writeb(MCF_RCR_SWRESET, MCF_RCR);
+}
+#endif
 
 static int __init mcf_setup_reset(void)
 {
-- 
1.7.0.4
