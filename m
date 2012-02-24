From: <gerg@snapgear.com>
Subject: [PATCH 7/7] m68knommu: merge common ColdFire QSPI platform setup code
Date: Fri, 24 Feb 2012 15:06:55 +1000
Message-ID: <1330060015-10877-8-git-send-email-gerg@snapgear.com>
References: <1330060015-10877-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from dalsmrelay2.nai.com ([205.227.136.216]:17063 "EHLO
	dalsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751176Ab2BXFHf (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 24 Feb 2012 00:07:35 -0500
In-Reply-To: <1330060015-10877-1-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

The ColdFire QSPI is common to quite a few ColdFire CPUs. No need to duplicate
its platform setup code for every CPU family member that has it. Merge all the
setup code into a single shared file.

This also results in few platforms no longer needing any local platform
setup code. In those cases remove the empty devices array and initcall
code as well.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/platform/520x/config.c     |  146 +---------------
 arch/m68k/platform/523x/config.c     |  317 +++++++++-------------------------
 arch/m68k/platform/5249/config.c     |  162 +----------------
 arch/m68k/platform/527x/config.c     |  165 +-----------------
 arch/m68k/platform/528x/config.c     |  130 +--------------
 arch/m68k/platform/532x/config.c     |  117 +------------
 arch/m68k/platform/coldfire/device.c |  162 +++++++++++++++++-
 7 files changed, 265 insertions(+), 934 deletions(-)
 rewrite arch/m68k/platform/523x/config.c (65%)

diff --git a/arch/m68k/platform/520x/config.c b/arch/m68k/platform/520x/config.c
index 9b7dad9..733d550 100644
--- a/arch/m68k/platform/520x/config.c
+++ b/arch/m68k/platform/520x/config.c
@@ -15,138 +15,14 @@
 #include <linux/param.h>
 #include <linux/init.h>
 #include <linux/io.h>
-#include <linux/spi/spi.h>
-#include <linux/gpio.h>
 #include <asm/machdep.h>
 #include <asm/coldfire.h>
 #include <asm/mcfsim.h>
 #include <asm/mcfuart.h>
-#include <asm/mcfqspi.h>
 
 /***************************************************************************/
 
-#if defined(CONFIG_SPI_COLDFIRE_QSPI) || defined(CONFIG_SPI_COLDFIRE_QSPI_MODULE)
-static struct resource m520x_qspi_resources[] = {
-	{
-		.start		= MCFQSPI_BASE,
-		.end		= MCFQSPI_BASE + MCFQSPI_SIZE - 1,
-		.flags		= IORESOURCE_MEM,
-	},
-	{
-		.start		= MCF_IRQ_QSPI,
-		.end		= MCF_IRQ_QSPI,
-		.flags		= IORESOURCE_IRQ,
-	},
-};
-
-static int m520x_cs_setup(struct mcfqspi_cs_control *cs_control)
-{
-	int status;
-
-	status = gpio_request(MCFQSPI_CS0, "MCFQSPI_CS0");
-	if (status) {
-		pr_debug("gpio_request for MCFQSPI_CS0 failed\n");
-		goto fail0;
-	}
-	status = gpio_direction_output(MCFQSPI_CS0, 1);
-	if (status) {
-		pr_debug("gpio_direction_output for MCFQSPI_CS0 failed\n");
-		goto fail1;
-	}
-
-	status = gpio_request(MCFQSPI_CS1, "MCFQSPI_CS1");
-	if (status) {
-		pr_debug("gpio_request for MCFQSPI_CS1 failed\n");
-		goto fail1;
-	}
-	status = gpio_direction_output(MCFQSPI_CS1, 1);
-	if (status) {
-		pr_debug("gpio_direction_output for MCFQSPI_CS1 failed\n");
-		goto fail2;
-	}
-
-	status = gpio_request(MCFQSPI_CS2, "MCFQSPI_CS2");
-	if (status) {
-		pr_debug("gpio_request for MCFQSPI_CS2 failed\n");
-		goto fail2;
-	}
-	status = gpio_direction_output(MCFQSPI_CS2, 1);
-	if (status) {
-		pr_debug("gpio_direction_output for MCFQSPI_CS2 failed\n");
-		goto fail3;
-	}
-
-	return 0;
-
-fail3:
-	gpio_free(MCFQSPI_CS2);
-fail2:
-	gpio_free(MCFQSPI_CS1);
-fail1:
-	gpio_free(MCFQSPI_CS0);
-fail0:
-	return status;
-}
-
-static void m520x_cs_teardown(struct mcfqspi_cs_control *cs_control)
-{
-	gpio_free(MCFQSPI_CS2);
-	gpio_free(MCFQSPI_CS1);
-	gpio_free(MCFQSPI_CS0);
-}
-
-static void m520x_cs_select(struct mcfqspi_cs_control *cs_control,
-			    u8 chip_select, bool cs_high)
-{
-	switch (chip_select) {
-	case 0:
-		gpio_set_value(MCFQSPI_CS0, cs_high);
-		break;
-	case 1:
-		gpio_set_value(MCFQSPI_CS1, cs_high);
-		break;
-	case 2:
-		gpio_set_value(MCFQSPI_CS2, cs_high);
-		break;
-	}
-}
-
-static void m520x_cs_deselect(struct mcfqspi_cs_control *cs_control,
-			      u8 chip_select, bool cs_high)
-{
-	switch (chip_select) {
-	case 0:
-		gpio_set_value(MCFQSPI_CS0, !cs_high);
-		break;
-	case 1:
-		gpio_set_value(MCFQSPI_CS1, !cs_high);
-		break;
-	case 2:
-		gpio_set_value(MCFQSPI_CS2, !cs_high);
-		break;
-	}
-}
-
-static struct mcfqspi_cs_control m520x_cs_control = {
-	.setup                  = m520x_cs_setup,
-	.teardown               = m520x_cs_teardown,
-	.select                 = m520x_cs_select,
-	.deselect               = m520x_cs_deselect,
-};
-
-static struct mcfqspi_platform_data m520x_qspi_data = {
-	.bus_num		= 0,
-	.num_chipselect		= 3,
-	.cs_control		= &m520x_cs_control,
-};
-
-static struct platform_device m520x_qspi = {
-	.name			= "mcfqspi",
-	.id			= 0,
-	.num_resources		= ARRAY_SIZE(m520x_qspi_resources),
-	.resource		= m520x_qspi_resources,
-	.dev.platform_data	= &m520x_qspi_data,
-};
+#ifdef CONFIG_SPI_COLDFIRE_QSPI
 
 static void __init m520x_qspi_init(void)
 {
@@ -158,14 +34,8 @@ static void __init m520x_qspi_init(void)
 	par &= 0x00ff;
 	writew(par, MCF_GPIO_PAR_UART);
 }
-#endif /* defined(CONFIG_SPI_COLDFIRE_QSPI) || defined(CONFIG_SPI_COLDFIRE_QSPI_MODULE) */
 
-
-static struct platform_device *m520x_devices[] __initdata = {
-#if defined(CONFIG_SPI_COLDFIRE_QSPI) || defined(CONFIG_SPI_COLDFIRE_QSPI_MODULE)
-	&m520x_qspi,
-#endif
-};
+#endif /* CONFIG_SPI_COLDFIRE_QSPI */
 
 /***************************************************************************/
 
@@ -217,19 +87,9 @@ void __init config_BSP(char *commandp, int size)
 	mach_reset = m520x_cpu_reset;
 	m520x_uarts_init();
 	m520x_fec_init();
-#if defined(CONFIG_SPI_COLDFIRE_QSPI) || defined(CONFIG_SPI_COLDFIRE_QSPI_MODULE)
+#ifdef CONFIG_SPI_COLDFIRE_QSPI
 	m520x_qspi_init();
 #endif
 }
 
 /***************************************************************************/
-
-static int __init init_BSP(void)
-{
-	platform_add_devices(m520x_devices, ARRAY_SIZE(m520x_devices));
-	return 0;
-}
-
-arch_initcall(init_BSP);
-
-/***************************************************************************/
diff --git a/arch/m68k/platform/523x/config.c b/arch/m68k/platform/523x/config.c
dissimilarity index 65%
index 32bb522..518c27b 100644
--- a/arch/m68k/platform/523x/config.c
+++ b/arch/m68k/platform/523x/config.c
@@ -1,234 +1,83 @@
-/***************************************************************************/
-
-/*
- *	linux/arch/m68knommu/platform/523x/config.c
- *
- *	Sub-architcture dependent initialization code for the Freescale
- *	523x CPUs.
- *
- *	Copyright (C) 1999-2005, Greg Ungerer (gerg@snapgear.com)
- *	Copyright (C) 2001-2003, SnapGear Inc. (www.snapgear.com)
- */
-
-/***************************************************************************/
-
-#include <linux/kernel.h>
-#include <linux/param.h>
-#include <linux/init.h>
-#include <linux/io.h>
-#include <linux/spi/spi.h>
-#include <linux/gpio.h>
-#include <asm/machdep.h>
-#include <asm/coldfire.h>
-#include <asm/mcfsim.h>
-#include <asm/mcfuart.h>
-#include <asm/mcfqspi.h>
-
-/***************************************************************************/
-
-#if defined(CONFIG_SPI_COLDFIRE_QSPI) || defined(CONFIG_SPI_COLDFIRE_QSPI_MODULE)
-static struct resource m523x_qspi_resources[] = {
-	{
-		.start		= MCFQSPI_BASE,
-		.end		= MCFQSPI_BASE + MCFQSPI_SIZE - 1,
-		.flags		= IORESOURCE_MEM,
-	},
-	{
-		.start		= MCF_IRQ_QSPI,
-		.end		= MCF_IRQ_QSPI,
-		.flags		= IORESOURCE_IRQ,
-	},
-};
-
-static int m523x_cs_setup(struct mcfqspi_cs_control *cs_control)
-{
-	int status;
-
-	status = gpio_request(MCFQSPI_CS0, "MCFQSPI_CS0");
-	if (status) {
-		pr_debug("gpio_request for MCFQSPI_CS0 failed\n");
-		goto fail0;
-	}
-	status = gpio_direction_output(MCFQSPI_CS0, 1);
-	if (status) {
-		pr_debug("gpio_direction_output for MCFQSPI_CS0 failed\n");
-		goto fail1;
-	}
-
-	status = gpio_request(MCFQSPI_CS1, "MCFQSPI_CS1");
-	if (status) {
-		pr_debug("gpio_request for MCFQSPI_CS1 failed\n");
-		goto fail1;
-	}
-	status = gpio_direction_output(MCFQSPI_CS1, 1);
-	if (status) {
-		pr_debug("gpio_direction_output for MCFQSPI_CS1 failed\n");
-		goto fail2;
-	}
-
-	status = gpio_request(MCFQSPI_CS2, "MCFQSPI_CS2");
-	if (status) {
-		pr_debug("gpio_request for MCFQSPI_CS2 failed\n");
-		goto fail2;
-	}
-	status = gpio_direction_output(MCFQSPI_CS2, 1);
-	if (status) {
-		pr_debug("gpio_direction_output for MCFQSPI_CS2 failed\n");
-		goto fail3;
-	}
-
-	status = gpio_request(MCFQSPI_CS3, "MCFQSPI_CS3");
-	if (status) {
-		pr_debug("gpio_request for MCFQSPI_CS3 failed\n");
-		goto fail3;
-	}
-	status = gpio_direction_output(MCFQSPI_CS3, 1);
-	if (status) {
-		pr_debug("gpio_direction_output for MCFQSPI_CS3 failed\n");
-		goto fail4;
-	}
-
-	return 0;
-
-fail4:
-	gpio_free(MCFQSPI_CS3);
-fail3:
-	gpio_free(MCFQSPI_CS2);
-fail2:
-	gpio_free(MCFQSPI_CS1);
-fail1:
-	gpio_free(MCFQSPI_CS0);
-fail0:
-	return status;
-}
-
-static void m523x_cs_teardown(struct mcfqspi_cs_control *cs_control)
-{
-	gpio_free(MCFQSPI_CS3);
-	gpio_free(MCFQSPI_CS2);
-	gpio_free(MCFQSPI_CS1);
-	gpio_free(MCFQSPI_CS0);
-}
-
-static void m523x_cs_select(struct mcfqspi_cs_control *cs_control,
-			    u8 chip_select, bool cs_high)
-{
-	switch (chip_select) {
-	case 0:
-		gpio_set_value(MCFQSPI_CS0, cs_high);
-		break;
-	case 1:
-		gpio_set_value(MCFQSPI_CS1, cs_high);
-		break;
-	case 2:
-		gpio_set_value(MCFQSPI_CS2, cs_high);
-		break;
-	case 3:
-		gpio_set_value(MCFQSPI_CS3, cs_high);
-		break;
-	}
-}
-
-static void m523x_cs_deselect(struct mcfqspi_cs_control *cs_control,
-			      u8 chip_select, bool cs_high)
-{
-	switch (chip_select) {
-	case 0:
-		gpio_set_value(MCFQSPI_CS0, !cs_high);
-		break;
-	case 1:
-		gpio_set_value(MCFQSPI_CS1, !cs_high);
-		break;
-	case 2:
-		gpio_set_value(MCFQSPI_CS2, !cs_high);
-		break;
-	case 3:
-		gpio_set_value(MCFQSPI_CS3, !cs_high);
-		break;
-	}
-}
-
-static struct mcfqspi_cs_control m523x_cs_control = {
-	.setup                  = m523x_cs_setup,
-	.teardown               = m523x_cs_teardown,
-	.select                 = m523x_cs_select,
-	.deselect               = m523x_cs_deselect,
-};
-
-static struct mcfqspi_platform_data m523x_qspi_data = {
-	.bus_num		= 0,
-	.num_chipselect		= 4,
-	.cs_control		= &m523x_cs_control,
-};
-
-static struct platform_device m523x_qspi = {
-	.name			= "mcfqspi",
-	.id			= 0,
-	.num_resources		= ARRAY_SIZE(m523x_qspi_resources),
-	.resource		= m523x_qspi_resources,
-	.dev.platform_data	= &m523x_qspi_data,
-};
-
-static void __init m523x_qspi_init(void)
-{
-	u16 par;
-
-	/* setup QSPS pins for QSPI with gpio CS control */
-	writeb(0x1f, MCFGPIO_PAR_QSPI);
-	/* and CS2 & CS3 as gpio */
-	par = readw(MCFGPIO_PAR_TIMER);
-	par &= 0x3f3f;
-	writew(par, MCFGPIO_PAR_TIMER);
-}
-#endif /* defined(CONFIG_SPI_COLDFIRE_QSPI) || defined(CONFIG_SPI_COLDFIRE_QSPI_MODULE) */
-
-static struct platform_device *m523x_devices[] __initdata = {
-	&m523x_fec,
-#if defined(CONFIG_SPI_COLDFIRE_QSPI) || defined(CONFIG_SPI_COLDFIRE_QSPI_MODULE)
-	&m523x_qspi,
-#endif
-};
-
-/***************************************************************************/
-
-static void __init m523x_fec_init(void)
-{
-	u16 par;
-	u8 v;
-
-	/* Set multi-function pins to ethernet use */
-	par = readw(MCF_IPSBAR + 0x100082);
-	writew(par | 0xf00, MCF_IPSBAR + 0x100082);
-	v = readb(MCF_IPSBAR + 0x100078);
-	writeb(v | 0xc0, MCF_IPSBAR + 0x100078);
-}
-
-/***************************************************************************/
-
-static void m523x_cpu_reset(void)
-{
-	local_irq_disable();
-	__raw_writeb(MCF_RCR_SWRESET, MCF_IPSBAR + MCF_RCR);
-}
-
-/***************************************************************************/
-
-void __init config_BSP(char *commandp, int size)
-{
-	mach_reset = m523x_cpu_reset;
-}
-
-/***************************************************************************/
-
-static int __init init_BSP(void)
-{
-#if defined(CONFIG_SPI_COLDFIRE_QSPI) || defined(CONFIG_SPI_COLDFIRE_QSPI_MODULE)
-	m523x_qspi_init();
-#endif
-	platform_add_devices(m523x_devices, ARRAY_SIZE(m523x_devices));
-	return 0;
-}
-
-arch_initcall(init_BSP);
-
-/***************************************************************************/
+/***************************************************************************/
+
+/*
+ *	linux/arch/m68knommu/platform/523x/config.c
+ *
+ *	Sub-architcture dependent initialization code for the Freescale
+ *	523x CPUs.
+ *
+ *	Copyright (C) 1999-2005, Greg Ungerer (gerg@snapgear.com)
+ *	Copyright (C) 2001-2003, SnapGear Inc. (www.snapgear.com)
+ */
+
+/***************************************************************************/
+
+#include <linux/kernel.h>
+#include <linux/param.h>
+#include <linux/init.h>
+#include <linux/io.h>
+#include <asm/machdep.h>
+#include <asm/coldfire.h>
+#include <asm/mcfsim.h>
+#include <asm/mcfuart.h>
+
+/***************************************************************************/
+
+#ifdef CONFIG_SPI_COLDFIRE_QSPI
+
+static void __init m523x_qspi_init(void)
+{
+	u16 par;
+
+	/* setup QSPS pins for QSPI with gpio CS control */
+	writeb(0x1f, MCFGPIO_PAR_QSPI);
+	/* and CS2 & CS3 as gpio */
+	par = readw(MCFGPIO_PAR_TIMER);
+	par &= 0x3f3f;
+	writew(par, MCFGPIO_PAR_TIMER);
+}
+
+#endif /* CONFIG_SPI_COLDFIRE_QSPI */
+
+/***************************************************************************/
+
+static void __init m523x_fec_init(void)
+{
+	u16 par;
+	u8 v;
+
+	/* Set multi-function pins to ethernet use */
+	par = readw(MCF_IPSBAR + 0x100082);
+	writew(par | 0xf00, MCF_IPSBAR + 0x100082);
+	v = readb(MCF_IPSBAR + 0x100078);
+	writeb(v | 0xc0, MCF_IPSBAR + 0x100078);
+}
+
+/***************************************************************************/
+
+static void m523x_cpu_reset(void)
+{
+	local_irq_disable();
+	__raw_writeb(MCF_RCR_SWRESET, MCF_IPSBAR + MCF_RCR);
+}
+
+/***************************************************************************/
+
+void __init config_BSP(char *commandp, int size)
+{
+	mach_reset = m523x_cpu_reset;
+}
+
+/***************************************************************************/
+
+static int __init init_BSP(void)
+{
+#ifdef CONFIG_SPI_COLDFIRE_QSPI
+	m523x_qspi_init();
+#endif
+	return 0;
+}
+
+arch_initcall(init_BSP);
+
+/***************************************************************************/
diff --git a/arch/m68k/platform/5249/config.c b/arch/m68k/platform/5249/config.c
index b7feb92..ac4386a 100644
--- a/arch/m68k/platform/5249/config.c
+++ b/arch/m68k/platform/5249/config.c
@@ -12,12 +12,10 @@
 #include <linux/param.h>
 #include <linux/init.h>
 #include <linux/io.h>
-#include <linux/spi/spi.h>
-#include <linux/gpio.h>
+#include <linux/platform_device.h>
 #include <asm/machdep.h>
 #include <asm/coldfire.h>
 #include <asm/mcfsim.h>
-#include <asm/mcfqspi.h>
 
 /***************************************************************************/
 
@@ -45,148 +43,15 @@ static struct platform_device m5249_smc91x = {
 
 #endif /* CONFIG_M5249C3 */
 
-#if defined(CONFIG_SPI_COLDFIRE_QSPI) || defined(CONFIG_SPI_COLDFIRE_QSPI_MODULE)
-static struct resource m5249_qspi_resources[] = {
-	{
-		.start		= MCFQSPI_BASE,
-		.end		= MCFQSPI_BASE + MCFQSPI_SIZE - 1,
-		.flags		= IORESOURCE_MEM,
-	},
-	{
-		.start		= MCF_IRQ_QSPI,
-		.end		= MCF_IRQ_QSPI,
-		.flags		= IORESOURCE_IRQ,
-	},
-};
-
-static int m5249_cs_setup(struct mcfqspi_cs_control *cs_control)
-{
-	int status;
-
-	status = gpio_request(MCFQSPI_CS0, "MCFQSPI_CS0");
-	if (status) {
-		pr_debug("gpio_request for MCFQSPI_CS0 failed\n");
-		goto fail0;
-	}
-	status = gpio_direction_output(MCFQSPI_CS0, 1);
-	if (status) {
-		pr_debug("gpio_direction_output for MCFQSPI_CS0 failed\n");
-		goto fail1;
-	}
-
-	status = gpio_request(MCFQSPI_CS1, "MCFQSPI_CS1");
-	if (status) {
-		pr_debug("gpio_request for MCFQSPI_CS1 failed\n");
-		goto fail1;
-	}
-	status = gpio_direction_output(MCFQSPI_CS1, 1);
-	if (status) {
-		pr_debug("gpio_direction_output for MCFQSPI_CS1 failed\n");
-		goto fail2;
-	}
-
-	status = gpio_request(MCFQSPI_CS2, "MCFQSPI_CS2");
-	if (status) {
-		pr_debug("gpio_request for MCFQSPI_CS2 failed\n");
-		goto fail2;
-	}
-	status = gpio_direction_output(MCFQSPI_CS2, 1);
-	if (status) {
-		pr_debug("gpio_direction_output for MCFQSPI_CS2 failed\n");
-		goto fail3;
-	}
-
-	status = gpio_request(MCFQSPI_CS3, "MCFQSPI_CS3");
-	if (status) {
-		pr_debug("gpio_request for MCFQSPI_CS3 failed\n");
-		goto fail3;
-	}
-	status = gpio_direction_output(MCFQSPI_CS3, 1);
-	if (status) {
-		pr_debug("gpio_direction_output for MCFQSPI_CS3 failed\n");
-		goto fail4;
-	}
-
-	return 0;
-
-fail4:
-	gpio_free(MCFQSPI_CS3);
-fail3:
-	gpio_free(MCFQSPI_CS2);
-fail2:
-	gpio_free(MCFQSPI_CS1);
-fail1:
-	gpio_free(MCFQSPI_CS0);
-fail0:
-	return status;
-}
-
-static void m5249_cs_teardown(struct mcfqspi_cs_control *cs_control)
-{
-	gpio_free(MCFQSPI_CS3);
-	gpio_free(MCFQSPI_CS2);
-	gpio_free(MCFQSPI_CS1);
-	gpio_free(MCFQSPI_CS0);
-}
-
-static void m5249_cs_select(struct mcfqspi_cs_control *cs_control,
-			    u8 chip_select, bool cs_high)
-{
-	switch (chip_select) {
-	case 0:
-		gpio_set_value(MCFQSPI_CS0, cs_high);
-		break;
-	case 1:
-		gpio_set_value(MCFQSPI_CS1, cs_high);
-		break;
-	case 2:
-		gpio_set_value(MCFQSPI_CS2, cs_high);
-		break;
-	case 3:
-		gpio_set_value(MCFQSPI_CS3, cs_high);
-		break;
-	}
-}
-
-static void m5249_cs_deselect(struct mcfqspi_cs_control *cs_control,
-			      u8 chip_select, bool cs_high)
-{
-	switch (chip_select) {
-	case 0:
-		gpio_set_value(MCFQSPI_CS0, !cs_high);
-		break;
-	case 1:
-		gpio_set_value(MCFQSPI_CS1, !cs_high);
-		break;
-	case 2:
-		gpio_set_value(MCFQSPI_CS2, !cs_high);
-		break;
-	case 3:
-		gpio_set_value(MCFQSPI_CS3, !cs_high);
-		break;
-	}
-}
-
-static struct mcfqspi_cs_control m5249_cs_control = {
-	.setup                  = m5249_cs_setup,
-	.teardown               = m5249_cs_teardown,
-	.select                 = m5249_cs_select,
-	.deselect               = m5249_cs_deselect,
+static struct platform_device *m5249_devices[] __initdata = {
+#ifdef CONFIG_M5249C3
+	&m5249_smc91x,
+#endif
 };
 
-static struct mcfqspi_platform_data m5249_qspi_data = {
-	.bus_num		= 0,
-	.num_chipselect		= 4,
-	.cs_control		= &m5249_cs_control,
-};
+/***************************************************************************/
 
-static struct platform_device m5249_qspi = {
-	.name			= "mcfqspi",
-	.id			= 0,
-	.num_resources		= ARRAY_SIZE(m5249_qspi_resources),
-	.resource		= m5249_qspi_resources,
-	.dev.platform_data	= &m5249_qspi_data,
-};
+#ifdef CONFIG_SPI_COLDFIRE_QSPI
 
 static void __init m5249_qspi_init(void)
 {
@@ -195,17 +60,8 @@ static void __init m5249_qspi_init(void)
 	       MCF_MBAR + MCFSIM_QSPIICR);
 	mcf_mapirq2imr(MCF_IRQ_QSPI, MCFINTC_QSPI);
 }
-#endif /* defined(CONFIG_SPI_COLDFIRE_QSPI) || defined(CONFIG_SPI_COLDFIRE_QSPI_MODULE) */
 
-
-static struct platform_device *m5249_devices[] __initdata = {
-#ifdef CONFIG_M5249C3
-	&m5249_smc91x,
-#endif
-#if defined(CONFIG_SPI_COLDFIRE_QSPI) || defined(CONFIG_SPI_COLDFIRE_QSPI_MODULE)
-	&m5249_qspi,
-#endif
-};
+#endif /* CONFIG_SPI_COLDFIRE_QSPI */
 
 /***************************************************************************/
 
@@ -262,7 +118,7 @@ void __init config_BSP(char *commandp, int size)
 #ifdef CONFIG_M5249C3
 	m5249_smc91x_init();
 #endif
-#if defined(CONFIG_SPI_COLDFIRE_QSPI) || defined(CONFIG_SPI_COLDFIRE_QSPI_MODULE)
+#ifdef CONFIG_SPI_COLDFIRE_QSPI
 	m5249_qspi_init();
 #endif
 }
diff --git a/arch/m68k/platform/527x/config.c b/arch/m68k/platform/527x/config.c
index cc5311b..00f77ba 100644
--- a/arch/m68k/platform/527x/config.c
+++ b/arch/m68k/platform/527x/config.c
@@ -16,158 +16,14 @@
 #include <linux/param.h>
 #include <linux/init.h>
 #include <linux/io.h>
-#include <linux/spi/spi.h>
-#include <linux/gpio.h>
 #include <asm/machdep.h>
 #include <asm/coldfire.h>
 #include <asm/mcfsim.h>
 #include <asm/mcfuart.h>
-#include <asm/mcfqspi.h>
 
 /***************************************************************************/
 
-#if defined(CONFIG_SPI_COLDFIRE_QSPI) || defined(CONFIG_SPI_COLDFIRE_QSPI_MODULE)
-static struct resource m527x_qspi_resources[] = {
-	{
-		.start		= MCFQSPI_BASE,
-		.end		= MCFQSPI_BASE + MCFQSPI_SIZE - 1,
-		.flags		= IORESOURCE_MEM,
-	},
-	{
-		.start		= MCF_IRQ_QSPI,
-		.end		= MCF_IRQ_QSPI,
-		.flags		= IORESOURCE_IRQ,
-	},
-};
-
-static int m527x_cs_setup(struct mcfqspi_cs_control *cs_control)
-{
-	int status;
-
-	status = gpio_request(MCFQSPI_CS0, "MCFQSPI_CS0");
-	if (status) {
-		pr_debug("gpio_request for MCFQSPI_CS0 failed\n");
-		goto fail0;
-	}
-	status = gpio_direction_output(MCFQSPI_CS0, 1);
-	if (status) {
-		pr_debug("gpio_direction_output for MCFQSPI_CS0 failed\n");
-		goto fail1;
-	}
-
-	status = gpio_request(MCFQSPI_CS1, "MCFQSPI_CS1");
-	if (status) {
-		pr_debug("gpio_request for MCFQSPI_CS1 failed\n");
-		goto fail1;
-	}
-	status = gpio_direction_output(MCFQSPI_CS1, 1);
-	if (status) {
-		pr_debug("gpio_direction_output for MCFQSPI_CS1 failed\n");
-		goto fail2;
-	}
-
-	status = gpio_request(MCFQSPI_CS2, "MCFQSPI_CS2");
-	if (status) {
-		pr_debug("gpio_request for MCFQSPI_CS2 failed\n");
-		goto fail2;
-	}
-	status = gpio_direction_output(MCFQSPI_CS2, 1);
-	if (status) {
-		pr_debug("gpio_direction_output for MCFQSPI_CS2 failed\n");
-		goto fail3;
-	}
-
-	status = gpio_request(MCFQSPI_CS3, "MCFQSPI_CS3");
-	if (status) {
-		pr_debug("gpio_request for MCFQSPI_CS3 failed\n");
-		goto fail3;
-	}
-	status = gpio_direction_output(MCFQSPI_CS3, 1);
-	if (status) {
-		pr_debug("gpio_direction_output for MCFQSPI_CS3 failed\n");
-		goto fail4;
-	}
-
-	return 0;
-
-fail4:
-	gpio_free(MCFQSPI_CS3);
-fail3:
-	gpio_free(MCFQSPI_CS2);
-fail2:
-	gpio_free(MCFQSPI_CS1);
-fail1:
-	gpio_free(MCFQSPI_CS0);
-fail0:
-	return status;
-}
-
-static void m527x_cs_teardown(struct mcfqspi_cs_control *cs_control)
-{
-	gpio_free(MCFQSPI_CS3);
-	gpio_free(MCFQSPI_CS2);
-	gpio_free(MCFQSPI_CS1);
-	gpio_free(MCFQSPI_CS0);
-}
-
-static void m527x_cs_select(struct mcfqspi_cs_control *cs_control,
-			    u8 chip_select, bool cs_high)
-{
-	switch (chip_select) {
-	case 0:
-		gpio_set_value(MCFQSPI_CS0, cs_high);
-		break;
-	case 1:
-		gpio_set_value(MCFQSPI_CS1, cs_high);
-		break;
-	case 2:
-		gpio_set_value(MCFQSPI_CS2, cs_high);
-		break;
-	case 3:
-		gpio_set_value(MCFQSPI_CS3, cs_high);
-		break;
-	}
-}
-
-static void m527x_cs_deselect(struct mcfqspi_cs_control *cs_control,
-			      u8 chip_select, bool cs_high)
-{
-	switch (chip_select) {
-	case 0:
-		gpio_set_value(MCFQSPI_CS0, !cs_high);
-		break;
-	case 1:
-		gpio_set_value(MCFQSPI_CS1, !cs_high);
-		break;
-	case 2:
-		gpio_set_value(MCFQSPI_CS2, !cs_high);
-		break;
-	case 3:
-		gpio_set_value(MCFQSPI_CS3, !cs_high);
-		break;
-	}
-}
-
-static struct mcfqspi_cs_control m527x_cs_control = {
-	.setup                  = m527x_cs_setup,
-	.teardown               = m527x_cs_teardown,
-	.select                 = m527x_cs_select,
-	.deselect               = m527x_cs_deselect,
-};
-
-static struct mcfqspi_platform_data m527x_qspi_data = {
-	.bus_num		= 0,
-	.num_chipselect		= 4,
-	.cs_control		= &m527x_cs_control,
-};
-
-static struct platform_device m527x_qspi = {
-	.name			= "mcfqspi",
-	.id			= 0,
-	.num_resources		= ARRAY_SIZE(m527x_qspi_resources),
-	.resource		= m527x_qspi_resources,
-	.dev.platform_data	= &m527x_qspi_data,
-};
+#ifdef CONFIG_SPI_COLDFIRE_QSPI
 
 static void __init m527x_qspi_init(void)
 {
@@ -185,13 +41,8 @@ static void __init m527x_qspi_init(void)
 	writew(0x003e, MCFGPIO_PAR_QSPI);
 #endif
 }
-#endif /* defined(CONFIG_SPI_COLDFIRE_QSPI) || defined(CONFIG_SPI_COLDFIRE_QSPI_MODULE) */
 
-static struct platform_device *m527x_devices[] __initdata = {
-#if defined(CONFIG_SPI_COLDFIRE_QSPI) || defined(CONFIG_SPI_COLDFIRE_QSPI_MODULE)
-	&m527x_qspi,
-#endif
-};
+#endif /* CONFIG_SPI_COLDFIRE_QSPI */
 
 /***************************************************************************/
 
@@ -249,19 +100,9 @@ void __init config_BSP(char *commandp, int size)
 	mach_reset = m527x_cpu_reset;
 	m527x_uarts_init();
 	m527x_fec_init();
-#if defined(CONFIG_SPI_COLDFIRE_QSPI) || defined(CONFIG_SPI_COLDFIRE_QSPI_MODULE)
+#ifdef CONFIG_SPI_COLDFIRE_QSPI
 	m527x_qspi_init();
 #endif
 }
 
 /***************************************************************************/
-
-static int __init init_BSP(void)
-{
-	platform_add_devices(m527x_devices, ARRAY_SIZE(m527x_devices));
-	return 0;
-}
-
-arch_initcall(init_BSP);
-
-/***************************************************************************/
diff --git a/arch/m68k/platform/528x/config.c b/arch/m68k/platform/528x/config.c
index 2275c5a..7829123 100644
--- a/arch/m68k/platform/528x/config.c
+++ b/arch/m68k/platform/528x/config.c
@@ -17,145 +17,22 @@
 #include <linux/init.h>
 #include <linux/platform_device.h>
 #include <linux/io.h>
-#include <linux/spi/spi.h>
-#include <linux/gpio.h>
 #include <asm/machdep.h>
 #include <asm/coldfire.h>
 #include <asm/mcfsim.h>
 #include <asm/mcfuart.h>
-#include <asm/mcfqspi.h>
 
 /***************************************************************************/
 
-#if defined(CONFIG_SPI_COLDFIRE_QSPI) || defined(CONFIG_SPI_COLDFIRE_QSPI_MODULE)
-static struct resource m528x_qspi_resources[] = {
-	{
-		.start		= MCFQSPI_BASE,
-		.end		= MCFQSPI_BASE + MCFQSPI_SIZE - 1,
-		.flags		= IORESOURCE_MEM,
-	},
-	{
-		.start		= MCF_IRQ_QSPI,
-		.end		= MCF_IRQ_QSPI,
-		.flags		= IORESOURCE_IRQ,
-	},
-};
-
-static int m528x_cs_setup(struct mcfqspi_cs_control *cs_control)
-{
-	int status;
-
-	status = gpio_request(MCFQSPI_CS0, "MCFQSPI_CS0");
-	if (status) {
-		pr_debug("gpio_request for MCFQSPI_CS0 failed\n");
-		goto fail0;
-	}
-	status = gpio_direction_output(MCFQSPI_CS0, 1);
-	if (status) {
-		pr_debug("gpio_direction_output for MCFQSPI_CS0 failed\n");
-		goto fail1;
-	}
-
-	status = gpio_request(MCFQSPI_CS1, "MCFQSPI_CS1");
-	if (status) {
-		pr_debug("gpio_request for MCFQSPI_CS1 failed\n");
-		goto fail1;
-	}
-	status = gpio_direction_output(MCFQSPI_CS1, 1);
-	if (status) {
-		pr_debug("gpio_direction_output for MCFQSPI_CS1 failed\n");
-		goto fail2;
-	}
-
-	status = gpio_request(MCFQSPI_CS2, "MCFQSPI_CS2");
-	if (status) {
-		pr_debug("gpio_request for MCFQSPI_CS2 failed\n");
-		goto fail2;
-	}
-	status = gpio_direction_output(MCFQSPI_CS2, 1);
-	if (status) {
-		pr_debug("gpio_direction_output for MCFQSPI_CS2 failed\n");
-		goto fail3;
-	}
-
-	status = gpio_request(MCFQSPI_CS3, "MCFQSPI_CS3");
-	if (status) {
-		pr_debug("gpio_request for MCFQSPI_CS3 failed\n");
-		goto fail3;
-	}
-	status = gpio_direction_output(MCFQSPI_CS3, 1);
-	if (status) {
-		pr_debug("gpio_direction_output for MCFQSPI_CS3 failed\n");
-		goto fail4;
-	}
-
-	return 0;
-
-fail4:
-	gpio_free(MCFQSPI_CS3);
-fail3:
-	gpio_free(MCFQSPI_CS2);
-fail2:
-	gpio_free(MCFQSPI_CS1);
-fail1:
-	gpio_free(MCFQSPI_CS0);
-fail0:
-	return status;
-}
-
-static void m528x_cs_teardown(struct mcfqspi_cs_control *cs_control)
-{
-	gpio_free(MCFQSPI_CS3);
-	gpio_free(MCFQSPI_CS2);
-	gpio_free(MCFQSPI_CS1);
-	gpio_free(MCFQSPI_CS0);
-}
-
-static void m528x_cs_select(struct mcfqspi_cs_control *cs_control,
-			    u8 chip_select, bool cs_high)
-{
-	gpio_set_value(MCFQSPI_CS0 + chip_select, cs_high);
-}
-
-static void m528x_cs_deselect(struct mcfqspi_cs_control *cs_control,
-			      u8 chip_select, bool cs_high)
-{
-	gpio_set_value(MCFQSPI_CS0 + chip_select, !cs_high);
-}
-
-static struct mcfqspi_cs_control m528x_cs_control = {
-	.setup                  = m528x_cs_setup,
-	.teardown               = m528x_cs_teardown,
-	.select                 = m528x_cs_select,
-	.deselect               = m528x_cs_deselect,
-};
-
-static struct mcfqspi_platform_data m528x_qspi_data = {
-	.bus_num		= 0,
-	.num_chipselect		= 4,
-	.cs_control		= &m528x_cs_control,
-};
-
-static struct platform_device m528x_qspi = {
-	.name			= "mcfqspi",
-	.id			= 0,
-	.num_resources		= ARRAY_SIZE(m528x_qspi_resources),
-	.resource		= m528x_qspi_resources,
-	.dev.platform_data	= &m528x_qspi_data,
-};
+#ifdef CONFIG_SPI_COLDFIRE_QSPI
 
 static void __init m528x_qspi_init(void)
 {
 	/* setup Port QS for QSPI with gpio CS control */
 	__raw_writeb(0x07, MCFGPIO_PQSPAR);
 }
-#endif /* defined(CONFIG_SPI_COLDFIRE_QSPI) || defined(CONFIG_SPI_COLDFIRE_QSPI_MODULE) */
 
-static struct platform_device *m528x_devices[] __initdata = {
-#if defined(CONFIG_SPI_COLDFIRE_QSPI) || defined(CONFIG_SPI_COLDFIRE_QSPI_MODULE)
-	&m528x_qspi,
-#endif
-};
+#endif /* CONFIG_SPI_COLDFIRE_QSPI */
 
 /***************************************************************************/
 
@@ -235,10 +112,9 @@ static int __init init_BSP(void)
 	mach_reset = m528x_cpu_reset;
 	m528x_uarts_init();
 	m528x_fec_init();
-#if defined(CONFIG_SPI_COLDFIRE_QSPI) || defined(CONFIG_SPI_COLDFIRE_QSPI_MODULE)
+#ifdef CONFIG_SPI_COLDFIRE_QSPI
 	m528x_qspi_init();
 #endif
-	platform_add_devices(m528x_devices, ARRAY_SIZE(m528x_devices));
 	return 0;
 }
 
diff --git a/arch/m68k/platform/532x/config.c b/arch/m68k/platform/532x/config.c
index 058ba5d..ff20d3e 100644
--- a/arch/m68k/platform/532x/config.c
+++ b/arch/m68k/platform/532x/config.c
@@ -21,134 +21,24 @@
 #include <linux/param.h>
 #include <linux/init.h>
 #include <linux/io.h>
-#include <linux/spi/spi.h>
-#include <linux/gpio.h>
 #include <asm/machdep.h>
 #include <asm/coldfire.h>
 #include <asm/mcfsim.h>
 #include <asm/mcfuart.h>
 #include <asm/mcfdma.h>
 #include <asm/mcfwdebug.h>
-#include <asm/mcfqspi.h>
 
 /***************************************************************************/
 
-#if defined(CONFIG_SPI_COLDFIRE_QSPI) || defined(CONFIG_SPI_COLDFIRE_QSPI_MODULE)
-static struct resource m532x_qspi_resources[] = {
-	{
-		.start		= MCFQSPI_BASE,
-		.end		= MCFQSPI_BASE + MCFQSPI_SIZE - 1,
-		.flags		= IORESOURCE_MEM,
-	},
-	{
-		.start		= MCF_IRQ_QSPI,
-		.end		= MCF_IRQ_QSPI,
-		.flags		= IORESOURCE_IRQ,
-	},
-};
-
-static int m532x_cs_setup(struct mcfqspi_cs_control *cs_control)
-{
-	int status;
-
-	status = gpio_request(MCFQSPI_CS0, "MCFQSPI_CS0");
-	if (status) {
-		pr_debug("gpio_request for MCFQSPI_CS0 failed\n");
-		goto fail0;
-	}
-	status = gpio_direction_output(MCFQSPI_CS0, 1);
-	if (status) {
-		pr_debug("gpio_direction_output for MCFQSPI_CS0 failed\n");
-		goto fail1;
-	}
-
-	status = gpio_request(MCFQSPI_CS1, "MCFQSPI_CS1");
-	if (status) {
-		pr_debug("gpio_request for MCFQSPI_CS1 failed\n");
-		goto fail1;
-	}
-	status = gpio_direction_output(MCFQSPI_CS1, 1);
-	if (status) {
-		pr_debug("gpio_direction_output for MCFQSPI_CS1 failed\n");
-		goto fail2;
-	}
-
-	status = gpio_request(MCFQSPI_CS2, "MCFQSPI_CS2");
-	if (status) {
-		pr_debug("gpio_request for MCFQSPI_CS2 failed\n");
-		goto fail2;
-	}
-	status = gpio_direction_output(MCFQSPI_CS2, 1);
-	if (status) {
-		pr_debug("gpio_direction_output for MCFQSPI_CS2 failed\n");
-		goto fail3;
-	}
-
-	return 0;
-
-fail3:
-	gpio_free(MCFQSPI_CS2);
-fail2:
-	gpio_free(MCFQSPI_CS1);
-fail1:
-	gpio_free(MCFQSPI_CS0);
-fail0:
-	return status;
-}
-
-static void m532x_cs_teardown(struct mcfqspi_cs_control *cs_control)
-{
-	gpio_free(MCFQSPI_CS2);
-	gpio_free(MCFQSPI_CS1);
-	gpio_free(MCFQSPI_CS0);
-}
-
-static void m532x_cs_select(struct mcfqspi_cs_control *cs_control,
-			    u8 chip_select, bool cs_high)
-{
-	gpio_set_value(MCFQSPI_CS0 + chip_select, cs_high);
-}
-
-static void m532x_cs_deselect(struct mcfqspi_cs_control *cs_control,
-			      u8 chip_select, bool cs_high)
-{
-	gpio_set_value(MCFQSPI_CS0 + chip_select, !cs_high);
-}
-
-static struct mcfqspi_cs_control m532x_cs_control = {
-	.setup                  = m532x_cs_setup,
-	.teardown               = m532x_cs_teardown,
-	.select                 = m532x_cs_select,
-	.deselect               = m532x_cs_deselect,
-};
-
-static struct mcfqspi_platform_data m532x_qspi_data = {
-	.bus_num		= 0,
-	.num_chipselect		= 3,
-	.cs_control		= &m532x_cs_control,
-};
-
-static struct platform_device m532x_qspi = {
-	.name			= "mcfqspi",
-	.id			= 0,
-	.num_resources		= ARRAY_SIZE(m532x_qspi_resources),
-	.resource		= m532x_qspi_resources,
-	.dev.platform_data	= &m532x_qspi_data,
-};
+#ifdef CONFIG_SPI_COLDFIRE_QSPI
 
 static void __init m532x_qspi_init(void)
 {
 	/* setup QSPS pins for QSPI with gpio CS control */
 	writew(0x01f0, MCF_GPIO_PAR_QSPI);
 }
-#endif /* defined(CONFIG_SPI_COLDFIRE_QSPI) || defined(CONFIG_SPI_COLDFIRE_QSPI_MODULE) */
-
 
-static struct platform_device *m532x_devices[] __initdata = {
-#if defined(CONFIG_SPI_COLDFIRE_QSPI) || defined(CONFIG_SPI_COLDFIRE_QSPI_MODULE)
-	&m532x_qspi,
-#endif
-};
+#endif /* CONFIG_SPI_COLDFIRE_QSPI */
 
 /***************************************************************************/
 
@@ -208,10 +98,9 @@ static int __init init_BSP(void)
 {
 	m532x_uarts_init();
 	m532x_fec_init();
-#if defined(CONFIG_SPI_COLDFIRE_QSPI) || defined(CONFIG_SPI_COLDFIRE_QSPI_MODULE)
+#ifdef CONFIG_SPI_COLDFIRE_QSPI
 	m532x_qspi_init();
 #endif
-	platform_add_devices(m532x_devices, ARRAY_SIZE(m532x_devices));
 	return 0;
 }
 
diff --git a/arch/m68k/platform/coldfire/device.c b/arch/m68k/platform/coldfire/device.c
index 24b0d5e..fa50c48 100644
--- a/arch/m68k/platform/coldfire/device.c
+++ b/arch/m68k/platform/coldfire/device.c
@@ -11,10 +11,13 @@
 #include <linux/kernel.h>
 #include <linux/init.h>
 #include <linux/io.h>
+#include <linux/spi/spi.h>
+#include <linux/gpio.h>
 #include <asm/traps.h>
 #include <asm/coldfire.h>
 #include <asm/mcfsim.h>
 #include <asm/mcfuart.h>
+#include <asm/mcfqspi.h>
 
 /*
  *	All current ColdFire parts contain from 2, 3 or 4 UARTS.
@@ -118,6 +121,161 @@ static struct platform_device mcf_fec1 = {
 #endif /* MCFFEC_BASE1 */
 #endif /* CONFIG_FEC */
 
+#ifdef CONFIG_SPI_COLDFIRE_QSPI
+/*
+ *	The ColdFire QSPI module is an SPI protocol hardware block used
+ *	on a number of different ColdFire CPUs.
+ */
+static struct resource mcf_qspi_resources[] = {
+	{
+		.start		= MCFQSPI_BASE,
+		.end		= MCFQSPI_BASE + MCFQSPI_SIZE - 1,
+		.flags		= IORESOURCE_MEM,
+	},
+	{
+		.start		= MCF_IRQ_QSPI,
+		.end		= MCF_IRQ_QSPI,
+		.flags		= IORESOURCE_IRQ,
+	},
+};
+
+static int mcf_cs_setup(struct mcfqspi_cs_control *cs_control)
+{
+	int status;
+
+	status = gpio_request(MCFQSPI_CS0, "MCFQSPI_CS0");
+	if (status) {
+		pr_debug("gpio_request for MCFQSPI_CS0 failed\n");
+		goto fail0;
+	}
+	status = gpio_direction_output(MCFQSPI_CS0, 1);
+	if (status) {
+		pr_debug("gpio_direction_output for MCFQSPI_CS0 failed\n");
+		goto fail1;
+	}
+
+	status = gpio_request(MCFQSPI_CS1, "MCFQSPI_CS1");
+	if (status) {
+		pr_debug("gpio_request for MCFQSPI_CS1 failed\n");
+		goto fail1;
+	}
+	status = gpio_direction_output(MCFQSPI_CS1, 1);
+	if (status) {
+		pr_debug("gpio_direction_output for MCFQSPI_CS1 failed\n");
+		goto fail2;
+	}
+
+	status = gpio_request(MCFQSPI_CS2, "MCFQSPI_CS2");
+	if (status) {
+		pr_debug("gpio_request for MCFQSPI_CS2 failed\n");
+		goto fail2;
+	}
+	status = gpio_direction_output(MCFQSPI_CS2, 1);
+	if (status) {
+		pr_debug("gpio_direction_output for MCFQSPI_CS2 failed\n");
+		goto fail3;
+	}
+
+#ifdef MCFQSPI_CS3
+	status = gpio_request(MCFQSPI_CS3, "MCFQSPI_CS3");
+	if (status) {
+		pr_debug("gpio_request for MCFQSPI_CS3 failed\n");
+		goto fail3;
+	}
+	status = gpio_direction_output(MCFQSPI_CS3, 1);
+	if (status) {
+		pr_debug("gpio_direction_output for MCFQSPI_CS3 failed\n");
+		gpio_free(MCFQSPI_CS3);
+		goto fail3;
+	}
+#endif
+
+	return 0;
+
+fail3:
+	gpio_free(MCFQSPI_CS2);
+fail2:
+	gpio_free(MCFQSPI_CS1);
+fail1:
+	gpio_free(MCFQSPI_CS0);
+fail0:
+	return status;
+}
+
+static void mcf_cs_teardown(struct mcfqspi_cs_control *cs_control)
+{
+#ifdef MCFQSPI_CS3
+	gpio_free(MCFQSPI_CS3);
+#endif
+	gpio_free(MCFQSPI_CS2);
+	gpio_free(MCFQSPI_CS1);
+	gpio_free(MCFQSPI_CS0);
+}
+
+static void mcf_cs_select(struct mcfqspi_cs_control *cs_control,
+			  u8 chip_select, bool cs_high)
+{
+	switch (chip_select) {
+	case 0:
+		gpio_set_value(MCFQSPI_CS0, cs_high);
+		break;
+	case 1:
+		gpio_set_value(MCFQSPI_CS1, cs_high);
+		break;
+	case 2:
+		gpio_set_value(MCFQSPI_CS2, cs_high);
+		break;
+#ifdef MCFQSPI_CS3
+	case 3:
+		gpio_set_value(MCFQSPI_CS3, cs_high);
+		break;
+#endif
+	}
+}
+
+static void mcf_cs_deselect(struct mcfqspi_cs_control *cs_control,
+			    u8 chip_select, bool cs_high)
+{
+	switch (chip_select) {
+	case 0:
+		gpio_set_value(MCFQSPI_CS0, !cs_high);
+		break;
+	case 1:
+		gpio_set_value(MCFQSPI_CS1, !cs_high);
+		break;
+	case 2:
+		gpio_set_value(MCFQSPI_CS2, !cs_high);
+		break;
+#ifdef MCFQSPI_CS3
+	case 3:
+		gpio_set_value(MCFQSPI_CS3, !cs_high);
+		break;
+#endif
+	}
+}
+
+static struct mcfqspi_cs_control mcf_cs_control = {
+	.setup			= mcf_cs_setup,
+	.teardown		= mcf_cs_teardown,
+	.select			= mcf_cs_select,
+	.deselect		= mcf_cs_deselect,
+};
+
+static struct mcfqspi_platform_data mcf_qspi_data = {
+	.bus_num		= 0,
+	.num_chipselect		= 4,
+	.cs_control		= &mcf_cs_control,
+};
+
+static struct platform_device mcf_qspi = {
+	.name			= "mcfqspi",
+	.id			= 0,
+	.num_resources		= ARRAY_SIZE(mcf_qspi_resources),
+	.resource		= mcf_qspi_resources,
+	.dev.platform_data	= &mcf_qspi_data,
+};
+#endif /* CONFIG_SPI_COLDFIRE_QSPI */
+
 static struct platform_device *mcf_devices[] __initdata = {
 	&mcf_uart,
 #ifdef CONFIG_FEC
@@ -126,9 +284,11 @@ static struct platform_device *mcf_devices[] __initdata = {
 	&mcf_fec1,
 #endif
 #endif
+#ifdef CONFIG_SPI_COLDFIRE_QSPI
+	&mcf_qspi,
+#endif
 };
 
-
 /*
  *	Some ColdFire UARTs let you set the IRQ line to use.
  */
-- 
1.7.0.4
