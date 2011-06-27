From: <gerg@snapgear.com>
Subject: [PATCH] m68knommu: merge ColdFire 5206 and 5206e
	platform code
Date: Mon, 27 Jun 2011 12:01:29 +1000
Message-ID: <1309140089-20168-1-git-send-email-gerg@snapgear.com>
Reply-To: uClinux development list <uclinux-dev@uclinux.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <uclinux-dev-bounces@uclinux.org>
List-Unsubscribe: <http://mailman.uclinux.org/mailman/listinfo/uclinux-dev>,
	<mailto:uclinux-dev-request@uclinux.org?subject=unsubscribe>
List-Archive: <http://mailman.uclinux.org/pipermail/uclinux-dev>
List-Post: <mailto:uclinux-dev@uclinux.org>
List-Help: <mailto:uclinux-dev-request@uclinux.org?subject=help>
List-Subscribe: <http://mailman.uclinux.org/mailman/listinfo/uclinux-dev>,
	<mailto:uclinux-dev-request@uclinux.org?subject=subscribe>
Sender: uclinux-dev-bounces@uclinux.org
Errors-To: uclinux-dev-bounces@uclinux.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>
List-Id: linux-m68k@vger.kernel.org

From: Greg Ungerer <gerg@uclinux.org>

The ColdFire 5206 and 5206e CPU families are almost identical, we can
easily merge the platform support code for them. All the differences
are dealt with in the current include/asm/5206sim.h.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/Makefile_no             |    2 +-
 arch/m68k/platform/5206/config.c  |    6 ++
 arch/m68k/platform/5206e/Makefile |   18 -----
 arch/m68k/platform/5206e/config.c |  127 -------------------------------------
 arch/m68k/platform/5206e/gpio.c   |   49 --------------
 5 files changed, 7 insertions(+), 195 deletions(-)
 delete mode 100644 arch/m68k/platform/5206e/Makefile
 delete mode 100644 arch/m68k/platform/5206e/config.c
 delete mode 100644 arch/m68k/platform/5206e/gpio.c

diff --git a/arch/m68k/Makefile_no b/arch/m68k/Makefile_no
index 81652ab..844d3f1 100644
--- a/arch/m68k/Makefile_no
+++ b/arch/m68k/Makefile_no
@@ -13,7 +13,7 @@ platform-$(CONFIG_M68EZ328)	:= 68EZ328
 platform-$(CONFIG_M68VZ328)	:= 68VZ328
 platform-$(CONFIG_M68360)	:= 68360
 platform-$(CONFIG_M5206)	:= 5206
-platform-$(CONFIG_M5206e)	:= 5206e
+platform-$(CONFIG_M5206e)	:= 5206
 platform-$(CONFIG_M520x)	:= 520x
 platform-$(CONFIG_M523x)	:= 523x
 platform-$(CONFIG_M5249)	:= 5249
diff --git a/arch/m68k/platform/5206/config.c b/arch/m68k/platform/5206/config.c
index 9c33546..6fa3f80 100644
--- a/arch/m68k/platform/5206/config.c
+++ b/arch/m68k/platform/5206/config.c
@@ -98,6 +98,12 @@ void m5206_cpu_reset(void)
 
 void __init config_BSP(char *commandp, int size)
 {
+#if defined(CONFIG_NETtel)
+	/* Copy command line from FLASH to local buffer... */
+	memcpy(commandp, (char *) 0xf0004000, size);
+	commandp[size-1] = 0;
+#endif /* CONFIG_NETtel */
+
 	mach_reset = m5206_cpu_reset;
 	m5206_timers_init();
 	m5206_uarts_init();
diff --git a/arch/m68k/platform/5206e/Makefile b/arch/m68k/platform/5206e/Makefile
deleted file mode 100644
index b5db056..0000000
--- a/arch/m68k/platform/5206e/Makefile
+++ /dev/null
@@ -1,18 +0,0 @@
-#
-# Makefile for the m68knommu linux kernel.
-#
-
-#
-# If you want to play with the HW breakpoints then you will
-# need to add define this,  which will give you a stack backtrace
-# on the console port whenever a DBG interrupt occurs.  You have to
-# set up you HW breakpoints to trigger a DBG interrupt:
-#
-# ccflags-y := -DTRAP_DBG_INTERRUPT
-# asflags-y := -DTRAP_DBG_INTERRUPT
-#
-
-asflags-$(CONFIG_FULLDEBUG) := -DDEBUGGER_COMPATIBLE_CACHE=1
-
-obj-y := config.o gpio.o
-
diff --git a/arch/m68k/platform/5206e/config.c b/arch/m68k/platform/5206e/config.c
deleted file mode 100644
index 9423979..0000000
--- a/arch/m68k/platform/5206e/config.c
+++ /dev/null
@@ -1,127 +0,0 @@
-/***************************************************************************/
-
-/*
- *	linux/arch/m68knommu/platform/5206e/config.c
- *
- *	Copyright (C) 1999-2002, Greg Ungerer (gerg@snapgear.com)
- */
-
-/***************************************************************************/
-
-#include <linux/kernel.h>
-#include <linux/param.h>
-#include <linux/init.h>
-#include <linux/io.h>
-#include <asm/machdep.h>
-#include <asm/coldfire.h>
-#include <asm/mcfsim.h>
-#include <asm/mcfuart.h>
-#include <asm/mcfdma.h>
-
-/***************************************************************************/
-
-static struct mcf_platform_uart m5206e_uart_platform[] = {
-	{
-		.mapbase	= MCF_MBAR + MCFUART_BASE1,
-		.irq		= 73,
-	},
-	{
-		.mapbase 	= MCF_MBAR + MCFUART_BASE2,
-		.irq		= 74,
-	},
-	{ },
-};
-
-static struct platform_device m5206e_uart = {
-	.name			= "mcfuart",
-	.id			= 0,
-	.dev.platform_data	= m5206e_uart_platform,
-};
-
-static struct platform_device *m5206e_devices[] __initdata = {
-	&m5206e_uart,
-};
-
-/***************************************************************************/
-
-static void __init m5206e_uart_init_line(int line, int irq)
-{
-	if (line == 0) {
-		writel(MCFSIM_ICR_LEVEL6 | MCFSIM_ICR_PRI1, MCF_MBAR + MCFSIM_UART1ICR);
-		writeb(irq, MCFUART_BASE1 + MCFUART_UIVR);
-		mcf_mapirq2imr(irq, MCFINTC_UART0);
-	} else if (line == 1) {
-		writel(MCFSIM_ICR_LEVEL6 | MCFSIM_ICR_PRI2, MCF_MBAR + MCFSIM_UART2ICR);
-		writeb(irq, MCFUART_BASE2 + MCFUART_UIVR);
-		mcf_mapirq2imr(irq, MCFINTC_UART1);
-	}
-}
-
-static void __init m5206e_uarts_init(void)
-{
-	const int nrlines = ARRAY_SIZE(m5206e_uart_platform);
-	int line;
-
-	for (line = 0; (line < nrlines); line++)
-		m5206e_uart_init_line(line, m5206e_uart_platform[line].irq);
-}
-
-/***************************************************************************/
-
-static void __init m5206e_timers_init(void)
-{
-	/* Timer1 is always used as system timer */
-	writeb(MCFSIM_ICR_AUTOVEC | MCFSIM_ICR_LEVEL6 | MCFSIM_ICR_PRI3,
-		MCF_MBAR + MCFSIM_TIMER1ICR);
-	mcf_mapirq2imr(MCF_IRQ_TIMER, MCFINTC_TIMER1);
-
-#ifdef CONFIG_HIGHPROFILE
-	/* Timer2 is to be used as a high speed profile timer  */
-	writeb(MCFSIM_ICR_AUTOVEC | MCFSIM_ICR_LEVEL7 | MCFSIM_ICR_PRI3,
-		MCF_MBAR + MCFSIM_TIMER2ICR);
-	mcf_mapirq2imr(MCF_IRQ_PROFILER, MCFINTC_TIMER2);
-#endif
-}
-
-/***************************************************************************/
-
-void m5206e_cpu_reset(void)
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
-void __init config_BSP(char *commandp, int size)
-{
-#if defined(CONFIG_NETtel)
-	/* Copy command line from FLASH to local buffer... */
-	memcpy(commandp, (char *) 0xf0004000, size);
-	commandp[size-1] = 0;
-#endif /* CONFIG_NETtel */
-
-	mach_reset = m5206e_cpu_reset;
-	m5206e_timers_init();
-	m5206e_uarts_init();
-
-	/* Only support the external interrupts on their primary level */
-	mcf_mapirq2imr(25, MCFINTC_EINT1);
-	mcf_mapirq2imr(28, MCFINTC_EINT4);
-	mcf_mapirq2imr(31, MCFINTC_EINT7);
-}
-
-/***************************************************************************/
-
-static int __init init_BSP(void)
-{
-	platform_add_devices(m5206e_devices, ARRAY_SIZE(m5206e_devices));
-	return 0;
-}
-
-arch_initcall(init_BSP);
-
-/***************************************************************************/
diff --git a/arch/m68k/platform/5206e/gpio.c b/arch/m68k/platform/5206e/gpio.c
deleted file mode 100644
index b9ab4a1..0000000
--- a/arch/m68k/platform/5206e/gpio.c
+++ /dev/null
@@ -1,49 +0,0 @@
-/*
- * Coldfire generic GPIO support
- *
- * (C) Copyright 2009, Steven King <sfking@fdwdc.com>
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; version 2 of the License.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
-*/
-
-#include <linux/kernel.h>
-#include <linux/init.h>
-
-#include <asm/coldfire.h>
-#include <asm/mcfsim.h>
-#include <asm/mcfgpio.h>
-
-static struct mcf_gpio_chip mcf_gpio_chips[] = {
-	{
-		.gpio_chip			= {
-			.label			= "PP",
-			.request		= mcf_gpio_request,
-			.free			= mcf_gpio_free,
-			.direction_input	= mcf_gpio_direction_input,
-			.direction_output	= mcf_gpio_direction_output,
-			.get			= mcf_gpio_get_value,
-			.set			= mcf_gpio_set_value,
-			.ngpio			= 8,
-		},
-		.pddr				= (void __iomem *) MCFSIM_PADDR,
-		.podr				= (void __iomem *) MCFSIM_PADAT,
-		.ppdr				= (void __iomem *) MCFSIM_PADAT,
-	},
-};
-
-static int __init mcf_gpio_init(void)
-{
-	unsigned i = 0;
-	while (i < ARRAY_SIZE(mcf_gpio_chips))
-		(void)gpiochip_add((struct gpio_chip *)&mcf_gpio_chips[i++]);
-	return 0;
-}
-
-core_initcall(mcf_gpio_init);
-- 
1.7.0.4

_______________________________________________
uClinux-dev mailing list
uClinux-dev@uclinux.org
http://mailman.uclinux.org/mailman/listinfo/uclinux-dev
This message was resent by uclinux-dev@uclinux.org
To unsubscribe see:
http://mailman.uclinux.org/mailman/options/uclinux-dev
