From: <gerg@snapgear.com>
Subject: [PATCH 1/5] m68knommu: factor some common ColdFire cpu reset code
Date: Tue, 28 Feb 2012 13:58:18 +1000
Message-ID: <1330401502-26250-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from dalsmrelay2.nai.com ([205.227.136.216]:40996 "EHLO
	dalsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752881Ab2B1D4R (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 27 Feb 2012 22:56:17 -0500
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

A number of the early ColdFire cores use the same code to reset the CPU.
Currently that is duplicated in each of the sub-arch files. Pull out this
common code and use a single copy of it for all CPU types that use it.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/platform/5206/config.c     |   13 -------------
 arch/m68k/platform/5249/config.c     |   12 ------------
 arch/m68k/platform/5307/config.c     |   13 -------------
 arch/m68k/platform/5407/config.c     |   13 -------------
 arch/m68k/platform/coldfire/Makefile |   10 +++++-----
 arch/m68k/platform/coldfire/reset.c  |   32 ++++++++++++++++++++++++++++++++
 6 files changed, 37 insertions(+), 56 deletions(-)
 create mode 100644 arch/m68k/platform/coldfire/reset.c

diff --git a/arch/m68k/platform/5206/config.c b/arch/m68k/platform/5206/config.c
index 00182b7..4f34a0c 100644
--- a/arch/m68k/platform/5206/config.c
+++ b/arch/m68k/platform/5206/config.c
@@ -19,17 +19,6 @@
 
 /***************************************************************************/
 
-void m5206_cpu_reset(void)
-{
-	local_irq_disable();
-	/* Set watchdog to soft reset, and enabled */
-	__raw_writeb(0xc0, MCF_MBAR + MCFSIM_SYPCR);
-	for (;;)
-		/* wait for watchdog to timeout */;
-}
-
-/***************************************************************************/
-
 void __init config_BSP(char *commandp, int size)
 {
 #if defined(CONFIG_NETtel)
@@ -38,8 +27,6 @@ void __init config_BSP(char *commandp, int size)
 	commandp[size-1] = 0;
 #endif /* CONFIG_NETtel */
 
-	mach_reset = m5206_cpu_reset;
-
 	/* Only support the external interrupts on their primary level */
 	mcf_mapirq2imr(25, MCFINTC_EINT1);
 	mcf_mapirq2imr(28, MCFINTC_EINT4);
diff --git a/arch/m68k/platform/5249/config.c b/arch/m68k/platform/5249/config.c
index ef34f58..c299763 100644
--- a/arch/m68k/platform/5249/config.c
+++ b/arch/m68k/platform/5249/config.c
@@ -83,20 +83,8 @@ static void __init m5249_smc91x_init(void)
 
 /***************************************************************************/
 
-void m5249_cpu_reset(void)
-{
-	local_irq_disable();
-	/* Set watchdog to soft reset, and enabled */
-	__raw_writeb(0xc0, MCF_MBAR + MCFSIM_SYPCR);
-	for (;;)
-		/* wait for watchdog to timeout */;
-}
-
-/***************************************************************************/
-
 void __init config_BSP(char *commandp, int size)
 {
-	mach_reset = m5249_cpu_reset;
 #ifdef CONFIG_M5249C3
 	m5249_smc91x_init();
 #endif
diff --git a/arch/m68k/platform/5307/config.c b/arch/m68k/platform/5307/config.c
index 86f92ef..73e4685 100644
--- a/arch/m68k/platform/5307/config.c
+++ b/arch/m68k/platform/5307/config.c
@@ -28,17 +28,6 @@ unsigned char ledbank = 0xff;
 
 /***************************************************************************/
 
-void m5307_cpu_reset(void)
-{
-	local_irq_disable();
-	/* Set watchdog to soft reset, and enabled */
-	__raw_writeb(0xc0, MCF_MBAR + MCFSIM_SYPCR);
-	for (;;)
-		/* wait for watchdog to timeout */;
-}
-
-/***************************************************************************/
-
 void __init config_BSP(char *commandp, int size)
 {
 #if defined(CONFIG_NETtel) || \
@@ -48,8 +37,6 @@ void __init config_BSP(char *commandp, int size)
 	commandp[size-1] = 0;
 #endif
 
-	mach_reset = m5307_cpu_reset;
-
 	/* Only support the external interrupts on their primary level */
 	mcf_mapirq2imr(25, MCFINTC_EINT1);
 	mcf_mapirq2imr(27, MCFINTC_EINT3);
diff --git a/arch/m68k/platform/5407/config.c b/arch/m68k/platform/5407/config.c
index 02177b9..d70328c 100644
--- a/arch/m68k/platform/5407/config.c
+++ b/arch/m68k/platform/5407/config.c
@@ -19,21 +19,8 @@
 
 /***************************************************************************/
 
-void m5407_cpu_reset(void)
-{
-	local_irq_disable();
-	/* set watchdog to soft reset, and enabled */
-	__raw_writeb(0xc0, MCF_MBAR + MCFSIM_SYPCR);
-	for (;;)
-		/* wait for watchdog to timeout */;
-}
-
-/***************************************************************************/
-
 void __init config_BSP(char *commandp, int size)
 {
-	mach_reset = m5407_cpu_reset;
-
 	/* Only support the external interrupts on their primary level */
 	mcf_mapirq2imr(25, MCFINTC_EINT1);
 	mcf_mapirq2imr(27, MCFINTC_EINT3);
diff --git a/arch/m68k/platform/coldfire/Makefile b/arch/m68k/platform/coldfire/Makefile
index 4572af2..bccab93 100644
--- a/arch/m68k/platform/coldfire/Makefile
+++ b/arch/m68k/platform/coldfire/Makefile
@@ -15,17 +15,17 @@
 asflags-$(CONFIG_FULLDEBUG) := -DDEBUGGER_COMPATIBLE_CACHE=1
 
 obj-$(CONFIG_COLDFIRE)	+= cache.o clk.o device.o dma.o entry.o vectors.o
-obj-$(CONFIG_M5206)	+= timers.o intc.o
-obj-$(CONFIG_M5206e)	+= timers.o intc.o
+obj-$(CONFIG_M5206)	+= timers.o intc.o reset.o
+obj-$(CONFIG_M5206e)	+= timers.o intc.o reset.o
 obj-$(CONFIG_M520x)	+= pit.o intc-simr.o
 obj-$(CONFIG_M523x)	+= pit.o dma_timer.o intc-2.o
-obj-$(CONFIG_M5249)	+= timers.o intc.o
+obj-$(CONFIG_M5249)	+= timers.o intc.o reset.o
 obj-$(CONFIG_M527x)	+= pit.o intc-2.o
 obj-$(CONFIG_M5272)	+= timers.o
 obj-$(CONFIG_M528x)	+= pit.o intc-2.o
-obj-$(CONFIG_M5307)	+= timers.o intc.o
+obj-$(CONFIG_M5307)	+= timers.o intc.o reset.o
 obj-$(CONFIG_M532x)	+= timers.o intc-simr.o
-obj-$(CONFIG_M5407)	+= timers.o intc.o
+obj-$(CONFIG_M5407)	+= timers.o intc.o reset.o
 obj-$(CONFIG_M54xx)	+= sltimers.o intc-2.o
 
 obj-y			+= pinmux.o gpio.o
diff --git a/arch/m68k/platform/coldfire/reset.c b/arch/m68k/platform/coldfire/reset.c
new file mode 100644
index 0000000..2ee3887
--- /dev/null
+++ b/arch/m68k/platform/coldfire/reset.c
@@ -0,0 +1,32 @@
+/*
+ * reset.c  -- common ColdFire SoC reset support
+ *
+ * (C) Copyright 2012, Greg Ungerer <gerg@uclinux.org>
+ *
+ * This file is subject to the terms and conditions of the GNU General Public
+ * License.  See the file COPYING in the main directory of this archive
+ * for more details.
+ */
+
+#include <linux/kernel.h>
+#include <linux/init.h>
+#include <linux/io.h>
+#include <asm/coldfire.h>
+#include <asm/mcfsim.h>
+
+void mcf_cpu_reset(void)
+{
+	local_irq_disable();
+	/* Set watchdog to soft reset, and enabled */
+	__raw_writeb(0xc0, MCF_MBAR + MCFSIM_SYPCR);
+	for (;;)
+		/* wait for watchdog to timeout */;
+}
+
+static int __init mcf_setup_reset(void)
+{
+	mach_reset = mcf_cpu_reset;
+	return 0;
+}
+
+arch_initcall(mcf_setup_reset);
-- 
1.7.0.4
