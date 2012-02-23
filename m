From: <gerg@snapgear.com>
Subject: [PATCH 22/23] m68knommu: merge common ColdFire UART platform setup code
Date: Thu, 23 Feb 2012 14:34:54 +1000
Message-ID: <1329971695-2203-23-git-send-email-gerg@snapgear.com>
References: <1329971695-2203-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:53755 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754044Ab2BWEgD (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 22 Feb 2012 23:36:03 -0500
In-Reply-To: <1329971695-2203-1-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

The ColdFire UART is common to all ColdFire CPU's. No need to duplicate
its platform setup code for every CPU family member. Merge all the setup
code into a single shared file.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/platform/5206/config.c     |   34 -------------------
 arch/m68k/platform/520x/config.c     |   23 -------------
 arch/m68k/platform/523x/config.c     |   23 -------------
 arch/m68k/platform/5249/config.c     |   19 -----------
 arch/m68k/platform/5272/config.c     |   19 -----------
 arch/m68k/platform/527x/config.c     |   23 -------------
 arch/m68k/platform/528x/config.c     |   23 -------------
 arch/m68k/platform/5307/config.c     |   34 -------------------
 arch/m68k/platform/532x/config.c     |   23 -------------
 arch/m68k/platform/5407/config.c     |   34 -------------------
 arch/m68k/platform/54xx/config.c     |   43 ------------------------
 arch/m68k/platform/coldfire/Makefile |    2 +-
 arch/m68k/platform/coldfire/device.c |   60 ++++++++++++++++++++++++++++++++++
 13 files changed, 61 insertions(+), 299 deletions(-)
 create mode 100644 arch/m68k/platform/coldfire/device.c

diff --git a/arch/m68k/platform/5206/config.c b/arch/m68k/platform/5206/config.c
index 5ac8e7b..98b26dc 100644
--- a/arch/m68k/platform/5206/config.c
+++ b/arch/m68k/platform/5206/config.c
@@ -20,30 +20,6 @@
 
 /***************************************************************************/
 
-static struct mcf_platform_uart m5206_uart_platform[] = {
-	{
-		.mapbase	= MCFUART_BASE0,
-		.irq		= MCF_IRQ_UART0,
-	},
-	{
-		.mapbase 	= MCFUART_BASE1,
-		.irq		= MCF_IRQ_UART1,
-	},
-	{ },
-};
-
-static struct platform_device m5206_uart = {
-	.name			= "mcfuart",
-	.id			= 0,
-	.dev.platform_data	= m5206_uart_platform,
-};
-
-static struct platform_device *m5206_devices[] __initdata = {
-	&m5206_uart,
-};
-
-/***************************************************************************/
-
 static void __init m5206_uarts_init(void)
 {
 	/* UART0 interrupt setup */
@@ -106,13 +82,3 @@ void __init config_BSP(char *commandp, int size)
 }
 
 /***************************************************************************/
-
-static int __init init_BSP(void)
-{
-	platform_add_devices(m5206_devices, ARRAY_SIZE(m5206_devices));
-	return 0;
-}
-
-arch_initcall(init_BSP);
-
-/***************************************************************************/
diff --git a/arch/m68k/platform/520x/config.c b/arch/m68k/platform/520x/config.c
index c578f47..e2bd2e9 100644
--- a/arch/m68k/platform/520x/config.c
+++ b/arch/m68k/platform/520x/config.c
@@ -25,28 +25,6 @@
 
 /***************************************************************************/
 
-static struct mcf_platform_uart m520x_uart_platform[] = {
-	{
-		.mapbase	= MCFUART_BASE0,
-		.irq		= MCF_IRQ_UART0,
-	},
-	{
-		.mapbase 	= MCFUART_BASE1,
-		.irq		= MCF_IRQ_UART1,
-	},
-	{
-		.mapbase 	= MCFUART_BASE2,
-		.irq		= MCF_IRQ_UART2,
-	},
-	{ },
-};
-
-static struct platform_device m520x_uart = {
-	.name			= "mcfuart",
-	.id			= 0,
-	.dev.platform_data	= m520x_uart_platform,
-};
-
 static struct resource m520x_fec_resources[] = {
 	{
 		.start		= MCFFEC_BASE,
@@ -218,7 +196,6 @@ static void __init m520x_qspi_init(void)
 
 
 static struct platform_device *m520x_devices[] __initdata = {
-	&m520x_uart,
 	&m520x_fec,
 #if defined(CONFIG_SPI_COLDFIRE_QSPI) || defined(CONFIG_SPI_COLDFIRE_QSPI_MODULE)
 	&m520x_qspi,
diff --git a/arch/m68k/platform/523x/config.c b/arch/m68k/platform/523x/config.c
index c01d0ae..308aed1 100644
--- a/arch/m68k/platform/523x/config.c
+++ b/arch/m68k/platform/523x/config.c
@@ -26,28 +26,6 @@
 
 /***************************************************************************/
 
-static struct mcf_platform_uart m523x_uart_platform[] = {
-	{
-		.mapbase	= MCFUART_BASE0,
-		.irq		= MCF_IRQ_UART0,
-	},
-	{
-		.mapbase 	= MCFUART_BASE1,
-		.irq		= MCF_IRQ_UART1,
-	},
-	{
-		.mapbase 	= MCFUART_BASE2,
-		.irq		= MCF_IRQ_UART2,
-	},
-	{ },
-};
-
-static struct platform_device m523x_uart = {
-	.name			= "mcfuart",
-	.id			= 0,
-	.dev.platform_data	= m523x_uart_platform,
-};
-
 static struct resource m523x_fec_resources[] = {
 	{
 		.start		= MCFFEC_BASE,
@@ -240,7 +218,6 @@ static void __init m523x_qspi_init(void)
 #endif /* defined(CONFIG_SPI_COLDFIRE_QSPI) || defined(CONFIG_SPI_COLDFIRE_QSPI_MODULE) */
 
 static struct platform_device *m523x_devices[] __initdata = {
-	&m523x_uart,
 	&m523x_fec,
 #if defined(CONFIG_SPI_COLDFIRE_QSPI) || defined(CONFIG_SPI_COLDFIRE_QSPI_MODULE)
 	&m523x_qspi,
diff --git a/arch/m68k/platform/5249/config.c b/arch/m68k/platform/5249/config.c
index 3b30c7f..06fab4a 100644
--- a/arch/m68k/platform/5249/config.c
+++ b/arch/m68k/platform/5249/config.c
@@ -22,24 +22,6 @@
 
 /***************************************************************************/
 
-static struct mcf_platform_uart m5249_uart_platform[] = {
-	{
-		.mapbase	= MCFUART_BASE0,
-		.irq		= MCF_IRQ_UART0,
-	},
-	{
-		.mapbase 	= MCFUART_BASE1,
-		.irq		= MCF_IRQ_UART1,
-	},
-	{ },
-};
-
-static struct platform_device m5249_uart = {
-	.name			= "mcfuart",
-	.id			= 0,
-	.dev.platform_data	= m5249_uart_platform,
-};
-
 #ifdef CONFIG_M5249C3
 
 static struct resource m5249_smc91x_resources[] = {
@@ -223,7 +205,6 @@ static void __init m5249_qspi_init(void)
 
 
 static struct platform_device *m5249_devices[] __initdata = {
-	&m5249_uart,
 #ifdef CONFIG_M5249C3
 	&m5249_smc91x,
 #endif
diff --git a/arch/m68k/platform/5272/config.c b/arch/m68k/platform/5272/config.c
index 9074411..2199c00 100644
--- a/arch/m68k/platform/5272/config.c
+++ b/arch/m68k/platform/5272/config.c
@@ -30,24 +30,6 @@ unsigned char ledbank = 0xff;
 
 /***************************************************************************/
 
-static struct mcf_platform_uart m5272_uart_platform[] = {
-	{
-		.mapbase	= MCFUART_BASE0,
-		.irq		= MCF_IRQ_UART0,
-	},
-	{
-		.mapbase 	= MCFUART_BASE1,
-		.irq		= MCF_IRQ_UART1,
-	},
-	{ },
-};
-
-static struct platform_device m5272_uart = {
-	.name			= "mcfuart",
-	.id			= 0,
-	.dev.platform_data	= m5272_uart_platform,
-};
-
 static struct resource m5272_fec_resources[] = {
 	{
 		.start		= MCF_MBAR + 0x840,
@@ -79,7 +61,6 @@ static struct platform_device m5272_fec = {
 };
 
 static struct platform_device *m5272_devices[] __initdata = {
-	&m5272_uart,
 	&m5272_fec,
 };
 
diff --git a/arch/m68k/platform/527x/config.c b/arch/m68k/platform/527x/config.c
index 2a8e6b8..febff03 100644
--- a/arch/m68k/platform/527x/config.c
+++ b/arch/m68k/platform/527x/config.c
@@ -26,28 +26,6 @@
 
 /***************************************************************************/
 
-static struct mcf_platform_uart m527x_uart_platform[] = {
-	{
-		.mapbase	= MCFUART_BASE0,
-		.irq		= MCF_IRQ_UART0,
-	},
-	{
-		.mapbase 	= MCFUART_BASE1,
-		.irq		= MCF_IRQ_UART1,
-	},
-	{
-		.mapbase 	= MCFUART_BASE2,
-		.irq		= MCF_IRQ_UART2,
-	},
-	{ },
-};
-
-static struct platform_device m527x_uart = {
-	.name			= "mcfuart",
-	.id			= 0,
-	.dev.platform_data	= m527x_uart_platform,
-};
-
 static struct resource m527x_fec0_resources[] = {
 	{
 		.start		= MCFFEC_BASE0,
@@ -283,7 +261,6 @@ static void __init m527x_qspi_init(void)
 #endif /* defined(CONFIG_SPI_COLDFIRE_QSPI) || defined(CONFIG_SPI_COLDFIRE_QSPI_MODULE) */
 
 static struct platform_device *m527x_devices[] __initdata = {
-	&m527x_uart,
 	&m527x_fec[0],
 #ifdef CONFIG_FEC2
 	&m527x_fec[1],
diff --git a/arch/m68k/platform/528x/config.c b/arch/m68k/platform/528x/config.c
index 822d7f5..8ed0f69 100644
--- a/arch/m68k/platform/528x/config.c
+++ b/arch/m68k/platform/528x/config.c
@@ -27,28 +27,6 @@
 
 /***************************************************************************/
 
-static struct mcf_platform_uart m528x_uart_platform[] = {
-	{
-		.mapbase	= MCFUART_BASE0,
-		.irq		= MCF_IRQ_UART0,
-	},
-	{
-		.mapbase 	= MCFUART_BASE1,
-		.irq		= MCF_IRQ_UART1,
-	},
-	{
-		.mapbase 	= MCFUART_BASE2,
-		.irq		= MCF_IRQ_UART2,
-	},
-	{ },
-};
-
-static struct platform_device m528x_uart = {
-	.name			= "mcfuart",
-	.id			= 0,
-	.dev.platform_data	= m528x_uart_platform,
-};
-
 static struct resource m528x_fec_resources[] = {
 	{
 		.start		= MCFFEC_BASE,
@@ -209,7 +187,6 @@ static void __init m528x_qspi_init(void)
 #endif /* defined(CONFIG_SPI_COLDFIRE_QSPI) || defined(CONFIG_SPI_COLDFIRE_QSPI_MODULE) */
 
 static struct platform_device *m528x_devices[] __initdata = {
-	&m528x_uart,
 	&m528x_fec,
 #if defined(CONFIG_SPI_COLDFIRE_QSPI) || defined(CONFIG_SPI_COLDFIRE_QSPI_MODULE)
 	&m528x_qspi,
diff --git a/arch/m68k/platform/5307/config.c b/arch/m68k/platform/5307/config.c
index 542b76a..0459725 100644
--- a/arch/m68k/platform/5307/config.c
+++ b/arch/m68k/platform/5307/config.c
@@ -29,30 +29,6 @@ unsigned char ledbank = 0xff;
 
 /***************************************************************************/
 
-static struct mcf_platform_uart m5307_uart_platform[] = {
-	{
-		.mapbase	= MCFUART_BASE0,
-		.irq		= MCF_IRQ_UART0,
-	},
-	{
-		.mapbase 	= MCFUART_BASE1,
-		.irq		= MCF_IRQ_UART1,
-	},
-	{ },
-};
-
-static struct platform_device m5307_uart = {
-	.name			= "mcfuart",
-	.id			= 0,
-	.dev.platform_data	= m5307_uart_platform,
-};
-
-static struct platform_device *m5307_devices[] __initdata = {
-	&m5307_uart,
-};
-
-/***************************************************************************/
-
 static void __init m5307_uarts_init(void)
 {
 	/* UART0 interrupt setup */
@@ -126,13 +102,3 @@ void __init config_BSP(char *commandp, int size)
 }
 
 /***************************************************************************/
-
-static int __init init_BSP(void)
-{
-	platform_add_devices(m5307_devices, ARRAY_SIZE(m5307_devices));
-	return 0;
-}
-
-arch_initcall(init_BSP);
-
-/***************************************************************************/
diff --git a/arch/m68k/platform/532x/config.c b/arch/m68k/platform/532x/config.c
index 2203ac9..32f8b82 100644
--- a/arch/m68k/platform/532x/config.c
+++ b/arch/m68k/platform/532x/config.c
@@ -33,28 +33,6 @@
 
 /***************************************************************************/
 
-static struct mcf_platform_uart m532x_uart_platform[] = {
-	{
-		.mapbase	= MCFUART_BASE0,
-		.irq		= MCF_IRQ_UART0,
-	},
-	{
-		.mapbase 	= MCFUART_BASE1,
-		.irq		= MCF_IRQ_UART1,
-	},
-	{
-		.mapbase 	= MCFUART_BASE2,
-		.irq		= MCF_IRQ_UART2,
-	},
-	{ },
-};
-
-static struct platform_device m532x_uart = {
-	.name			= "mcfuart",
-	.id			= 0,
-	.dev.platform_data	= m532x_uart_platform,
-};
-
 static struct resource m532x_fec_resources[] = {
 	{
 		.start		= 0xfc030000,
@@ -201,7 +179,6 @@ static void __init m532x_qspi_init(void)
 
 
 static struct platform_device *m532x_devices[] __initdata = {
-	&m532x_uart,
 	&m532x_fec,
 #if defined(CONFIG_SPI_COLDFIRE_QSPI) || defined(CONFIG_SPI_COLDFIRE_QSPI_MODULE)
 	&m532x_qspi,
diff --git a/arch/m68k/platform/5407/config.c b/arch/m68k/platform/5407/config.c
index 33d857d..f1af78c 100644
--- a/arch/m68k/platform/5407/config.c
+++ b/arch/m68k/platform/5407/config.c
@@ -20,30 +20,6 @@
 
 /***************************************************************************/
 
-static struct mcf_platform_uart m5407_uart_platform[] = {
-	{
-		.mapbase	= MCFUART_BASE0,
-		.irq		= MCF_IRQ_UART0,
-	},
-	{
-		.mapbase 	= MCFUART_BASE1,
-		.irq		= MCF_IRQ_UART1,
-	},
-	{ },
-};
-
-static struct platform_device m5407_uart = {
-	.name			= "mcfuart",
-	.id			= 0,
-	.dev.platform_data	= m5407_uart_platform,
-};
-
-static struct platform_device *m5407_devices[] __initdata = {
-	&m5407_uart,
-};
-
-/***************************************************************************/
-
 static void __init m5407_uarts_init(void)
 {
 	/* UART0 interrupt setup */
@@ -101,13 +77,3 @@ void __init config_BSP(char *commandp, int size)
 }
 
 /***************************************************************************/
-
-static int __init init_BSP(void)
-{
-	platform_add_devices(m5407_devices, ARRAY_SIZE(m5407_devices));
-	return 0;
-}
-
-arch_initcall(init_BSP);
-
-/***************************************************************************/
diff --git a/arch/m68k/platform/54xx/config.c b/arch/m68k/platform/54xx/config.c
index 026bb75..90214d5 100644
--- a/arch/m68k/platform/54xx/config.c
+++ b/arch/m68k/platform/54xx/config.c
@@ -27,38 +27,6 @@
 
 /***************************************************************************/
 
-static struct mcf_platform_uart m54xx_uart_platform[] = {
-	{
-		.mapbase	= MCFUART_BASE0,
-		.irq		= MCF_IRQ_UART0,
-	},
-	{
-		.mapbase	= MCFUART_BASE1,
-		.irq		= MCF_IRQ_UART1,
-	},
-	{
-		.mapbase	= MCFUART_BASE2,
-		.irq		= MCF_IRQ_UART2,
-	},
-	{
-		.mapbase	= MCFUART_BASE3,
-		.irq		= MCF_IRQ_UART3,
-	},
-};
-
-static struct platform_device m54xx_uart = {
-	.name			= "mcfuart",
-	.id			= 0,
-	.dev.platform_data	= m54xx_uart_platform,
-};
-
-static struct platform_device *m54xx_devices[] __initdata = {
-	&m54xx_uart,
-};
-
-
-/***************************************************************************/
-
 static void __init m54xx_uarts_init(void)
 {
 	/* enable io pins */
@@ -134,14 +102,3 @@ void __init config_BSP(char *commandp, int size)
 }
 
 /***************************************************************************/
-
-static int __init init_BSP(void)
-{
-
-	platform_add_devices(m54xx_devices, ARRAY_SIZE(m54xx_devices));
-	return 0;
-}
-
-arch_initcall(init_BSP);
-
-/***************************************************************************/
diff --git a/arch/m68k/platform/coldfire/Makefile b/arch/m68k/platform/coldfire/Makefile
index a8967ba..4572af2 100644
--- a/arch/m68k/platform/coldfire/Makefile
+++ b/arch/m68k/platform/coldfire/Makefile
@@ -14,7 +14,7 @@
 
 asflags-$(CONFIG_FULLDEBUG) := -DDEBUGGER_COMPATIBLE_CACHE=1
 
-obj-$(CONFIG_COLDFIRE)	+= cache.o clk.o dma.o entry.o vectors.o
+obj-$(CONFIG_COLDFIRE)	+= cache.o clk.o device.o dma.o entry.o vectors.o
 obj-$(CONFIG_M5206)	+= timers.o intc.o
 obj-$(CONFIG_M5206e)	+= timers.o intc.o
 obj-$(CONFIG_M520x)	+= pit.o intc-simr.o
diff --git a/arch/m68k/platform/coldfire/device.c b/arch/m68k/platform/coldfire/device.c
new file mode 100644
index 0000000..c950690
--- /dev/null
+++ b/arch/m68k/platform/coldfire/device.c
@@ -0,0 +1,60 @@
+/*
+ * device.c  -- common ColdFire SoC device support
+ *
+ * (C) Copyright 2011, Greg Ungerer <gerg@uclinux.org>
+ *
+ * This file is subject to the terms and conditions of the GNU General Public
+ * License.  See the file COPYING in the main directory of this archive
+ * for more details.
+ */
+
+#include <linux/kernel.h>
+#include <linux/init.h>
+#include <linux/io.h>
+#include <asm/traps.h>
+#include <asm/coldfire.h>
+#include <asm/mcfsim.h>
+#include <asm/mcfuart.h>
+
+static struct mcf_platform_uart mcf_uart_platform_data[] = {
+	{
+		.mapbase	= MCFUART_BASE0,
+		.irq		= MCF_IRQ_UART0,
+	},
+	{
+		.mapbase	= MCFUART_BASE1,
+		.irq		= MCF_IRQ_UART1,
+	},
+#ifdef MCFUART_BASE2
+	{
+		.mapbase	= MCFUART_BASE2,
+		.irq		= MCF_IRQ_UART2,
+	},
+#endif
+#ifdef MCFUART_BASE3
+	{
+		.mapbase	= MCFUART_BASE3,
+		.irq		= MCF_IRQ_UART3,
+	},
+#endif
+	{ },
+};
+
+static struct platform_device mcf_uart = {
+	.name			= "mcfuart",
+	.id			= 0,
+	.dev.platform_data	= mcf_uart_platform_data,
+};
+
+static struct platform_device *mcf_devices[] __initdata = {
+	&mcf_uart,
+};
+
+static int __init mcf_init_devices(void)
+{
+	platform_add_devices(mcf_devices, ARRAY_SIZE(mcf_devices));
+	return 0;
+}
+
+arch_initcall(mcf_init_devices);
+
-- 
1.7.0.4
