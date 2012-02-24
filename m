From: <gerg@snapgear.com>
Subject: [PATCH 7/7] m68knommu: merge common ColdFire FEC platform setup code
Date: Fri, 24 Feb 2012 14:24:11 +1000
Message-ID: <1330057451-28481-8-git-send-email-gerg@snapgear.com>
References: <1330057451-28481-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:44638 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755680Ab2BXEXd (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 23 Feb 2012 23:23:33 -0500
In-Reply-To: <1330057451-28481-1-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

The ColdFire FEC is common to quite a few ColdFire CPUs. No need to duplicate
its platform setup code for every CPU family member that has it. Merge all the
setup code into a single shared file.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/platform/520x/config.c     |   31 -------------
 arch/m68k/platform/523x/config.c     |   31 -------------
 arch/m68k/platform/5272/config.c     |   37 ----------------
 arch/m68k/platform/527x/config.c     |   65 ----------------------------
 arch/m68k/platform/528x/config.c     |   31 -------------
 arch/m68k/platform/532x/config.c     |   31 -------------
 arch/m68k/platform/coldfire/device.c |   78 ++++++++++++++++++++++++++++++++++
 7 files changed, 78 insertions(+), 226 deletions(-)

diff --git a/arch/m68k/platform/520x/config.c b/arch/m68k/platform/520x/config.c
index b756315..709291d 100644
--- a/arch/m68k/platform/520x/config.c
+++ b/arch/m68k/platform/520x/config.c
@@ -25,36 +25,6 @@
 
 /***************************************************************************/
 
-static struct resource m520x_fec_resources[] = {
-	{
-		.start		= MCFFEC_BASE0,
-		.end		= MCFFEC_BASE0 + MCFFEC_SIZE0 - 1,
-		.flags		= IORESOURCE_MEM,
-	},
-	{
-		.start		= MCF_IRQ_FEXRX0,
-		.end		= MCF_IRQ_FECRX0,
-		.flags		= IORESOURCE_IRQ,
-	},
-	{
-		.start		= MCF_IRQ_FECTX0,
-		.end		= MCF_IRQ_FECTX0,
-		.flags		= IORESOURCE_IRQ,
-	},
-	{
-		.start		= MCF_IRQ_FECENTC0,
-		.end		= MCF_IRQ_FECENTC0,
-		.flags		= IORESOURCE_IRQ,
-	},
-};
-
-static struct platform_device m520x_fec = {
-	.name			= "fec",
-	.id			= 0,
-	.num_resources		= ARRAY_SIZE(m520x_fec_resources),
-	.resource		= m520x_fec_resources,
-};
-
 #if defined(CONFIG_SPI_COLDFIRE_QSPI) || defined(CONFIG_SPI_COLDFIRE_QSPI_MODULE)
 static struct resource m520x_qspi_resources[] = {
 	{
@@ -196,7 +166,6 @@ static void __init m520x_qspi_init(void)
 
 
 static struct platform_device *m520x_devices[] __initdata = {
-	&m520x_fec,
 #if defined(CONFIG_SPI_COLDFIRE_QSPI) || defined(CONFIG_SPI_COLDFIRE_QSPI_MODULE)
 	&m520x_qspi,
 #endif
diff --git a/arch/m68k/platform/523x/config.c b/arch/m68k/platform/523x/config.c
index 5433c76..371175d 100644
--- a/arch/m68k/platform/523x/config.c
+++ b/arch/m68k/platform/523x/config.c
@@ -26,36 +26,6 @@
 
 /***************************************************************************/
 
-static struct resource m523x_fec_resources[] = {
-	{
-		.start		= MCFFEC_BASE0,
-		.end		= MCFFEC_BASE0 + MCFFEC_SIZE0 - 1,
-		.flags		= IORESOURCE_MEM,
-	},
-	{
-		.start		= MCF_IRQ_FECRX0,
-		.end		= MCF_IRQ_FECRX0,
-		.flags		= IORESOURCE_IRQ,
-	},
-	{
-		.start		= MCF_IRQ_FECTX0,
-		.end		= MCF_IRQ_FECTX0,
-		.flags		= IORESOURCE_IRQ,
-	},
-	{
-		.start		= MCF_IRQ_FECENTC0,
-		.end		= MCF_IRQ_FECENTC0,
-		.flags		= IORESOURCE_IRQ,
-	},
-};
-
-static struct platform_device m523x_fec = {
-	.name			= "fec",
-	.id			= 0,
-	.num_resources		= ARRAY_SIZE(m523x_fec_resources),
-	.resource		= m523x_fec_resources,
-};
-
 #if defined(CONFIG_SPI_COLDFIRE_QSPI) || defined(CONFIG_SPI_COLDFIRE_QSPI_MODULE)
 static struct resource m523x_qspi_resources[] = {
 	{
@@ -257,7 +227,6 @@ void __init config_BSP(char *commandp, int size)
 
 static int __init init_BSP(void)
 {
-	m523x_fec_init();
 #if defined(CONFIG_SPI_COLDFIRE_QSPI) || defined(CONFIG_SPI_COLDFIRE_QSPI_MODULE)
 	m523x_qspi_init();
 #endif
diff --git a/arch/m68k/platform/5272/config.c b/arch/m68k/platform/5272/config.c
index 8c77fee..0a5f0b3 100644
--- a/arch/m68k/platform/5272/config.c
+++ b/arch/m68k/platform/5272/config.c
@@ -30,42 +30,6 @@ unsigned char ledbank = 0xff;
 
 /***************************************************************************/
 
-static struct resource m5272_fec_resources[] = {
-	{
-		.start		= MCFFEC_BASE0,
-		.end		= MCFFEC_BASE0 + MCFFEC_SIZE0 - 1,
-		.flags		= IORESOURCE_MEM,
-	},
-	{
-		.start		= MCF_IRQ_FECRX0,
-		.end		= MCF_IRQ_FECRX0,
-		.flags		= IORESOURCE_IRQ,
-	},
-	{
-		.start		= MCF_IRQ_FECTX0,
-		.end		= MCF_IRQ_FECTX0,
-		.flags		= IORESOURCE_IRQ,
-	},
-	{
-		.start		= MCF_IRQ_FECENTC0,
-		.end		= MCF_IRQ_FECENTC0,
-		.flags		= IORESOURCE_IRQ,
-	},
-};
-
-static struct platform_device m5272_fec = {
-	.name			= "fec",
-	.id			= 0,
-	.num_resources		= ARRAY_SIZE(m5272_fec_resources),
-	.resource		= m5272_fec_resources,
-};
-
-static struct platform_device *m5272_devices[] __initdata = {
-	&m5272_fec,
-};
-
-/***************************************************************************/
-
 static void __init m5272_uarts_init(void)
 {
 	u32 v;
@@ -137,7 +101,6 @@ static int __init init_BSP(void)
 {
 	m5272_uarts_init();
 	fixed_phy_add(PHY_POLL, 0, &nettel_fixed_phy_status);
-	platform_add_devices(m5272_devices, ARRAY_SIZE(m5272_devices));
 	return 0;
 }
 
diff --git a/arch/m68k/platform/527x/config.c b/arch/m68k/platform/527x/config.c
index f395e8b..9f31c29 100644
--- a/arch/m68k/platform/527x/config.c
+++ b/arch/m68k/platform/527x/config.c
@@ -26,67 +26,6 @@
 
 /***************************************************************************/
 
-static struct resource m527x_fec0_resources[] = {
-	{
-		.start		= MCFFEC_BASE0,
-		.end		= MCFFEC_BASE0 + MCFFEC_SIZE0 - 1,
-		.flags		= IORESOURCE_MEM,
-	},
-	{
-		.start		= MCF_IRQ_FECRX0,
-		.end		= MCF_IRQ_FECRX0,
-		.flags		= IORESOURCE_IRQ,
-	},
-	{
-		.start		= MCF_IRQ_FECTX0,
-		.end		= MCF_IRQ_FECTX0,
-		.flags		= IORESOURCE_IRQ,
-	},
-	{
-		.start		= MCF_IRQ_FECENTC0,
-		.end		= MCF_IRQ_FECENTC0,
-		.flags		= IORESOURCE_IRQ,
-	},
-};
-
-static struct resource m527x_fec1_resources[] = {
-	{
-		.start		= MCFFEC_BASE1,
-		.end		= MCFFEC_BASE1 + MCFFEC_SIZE1 - 1,
-		.flags		= IORESOURCE_MEM,
-	},
-	{
-		.start		= MCF_IRQ_FECRX1,
-		.end		= MCF_IRQ_FECRX1,
-		.flags		= IORESOURCE_IRQ,
-	},
-	{
-		.start		= MCF_IRQ_FECTX1,
-		.end		= MCF_IRQ_FECTX1,
-		.flags		= IORESOURCE_IRQ,
-	},
-	{
-		.start		= MCF_IRQ_FECENTC1,
-		.end		= MCF_IRQ_FECENTC1,
-		.flags		= IORESOURCE_IRQ,
-	},
-};
-
-static struct platform_device m527x_fec[] = {
-	{
-		.name		= "fec",
-		.id		= 0,
-		.num_resources	= ARRAY_SIZE(m527x_fec0_resources),
-		.resource	= m527x_fec0_resources,
-	},
-	{
-		.name		= "fec",
-		.id		= 1,
-		.num_resources	= ARRAY_SIZE(m527x_fec1_resources),
-		.resource	= m527x_fec1_resources,
-	},
-};
-
 #if defined(CONFIG_SPI_COLDFIRE_QSPI) || defined(CONFIG_SPI_COLDFIRE_QSPI_MODULE)
 static struct resource m527x_qspi_resources[] = {
 	{
@@ -261,10 +200,6 @@ static void __init m527x_qspi_init(void)
 #endif /* defined(CONFIG_SPI_COLDFIRE_QSPI) || defined(CONFIG_SPI_COLDFIRE_QSPI_MODULE) */
 
 static struct platform_device *m527x_devices[] __initdata = {
-	&m527x_fec[0],
-#ifdef CONFIG_FEC2
-	&m527x_fec[1],
-#endif
 #if defined(CONFIG_SPI_COLDFIRE_QSPI) || defined(CONFIG_SPI_COLDFIRE_QSPI_MODULE)
 	&m527x_qspi,
 #endif
diff --git a/arch/m68k/platform/528x/config.c b/arch/m68k/platform/528x/config.c
index a391978..9b10e33 100644
--- a/arch/m68k/platform/528x/config.c
+++ b/arch/m68k/platform/528x/config.c
@@ -27,36 +27,6 @@
 
 /***************************************************************************/
 
-static struct resource m528x_fec_resources[] = {
-	{
-		.start		= MCFFEC_BASE0,
-		.end		= MCFFEC_BASE0 + MCFFEC_SIZE0 - 1,
-		.flags		= IORESOURCE_MEM,
-	},
-	{
-		.start		= MCF_IRQ_FECRX0,
-		.end		= MCF_IRQ_FECRX0,
-		.flags		= IORESOURCE_IRQ,
-	},
-	{
-		.start		= MCF_IRQ_FECTX0,
-		.end		= MCF_IRQ_FECTX0,
-		.flags		= IORESOURCE_IRQ,
-	},
-	{
-		.start		= MCF_IRQ_FECENTC0,
-		.end		= MCF_IRQ_FECENTC0,
-		.flags		= IORESOURCE_IRQ,
-	},
-};
-
-static struct platform_device m528x_fec = {
-	.name			= "fec",
-	.id			= 0,
-	.num_resources		= ARRAY_SIZE(m528x_fec_resources),
-	.resource		= m528x_fec_resources,
-};
-
 #if defined(CONFIG_SPI_COLDFIRE_QSPI) || defined(CONFIG_SPI_COLDFIRE_QSPI_MODULE)
 static struct resource m528x_qspi_resources[] = {
 	{
@@ -187,7 +157,6 @@ static void __init m528x_qspi_init(void)
 #endif /* defined(CONFIG_SPI_COLDFIRE_QSPI) || defined(CONFIG_SPI_COLDFIRE_QSPI_MODULE) */
 
 static struct platform_device *m528x_devices[] __initdata = {
-	&m528x_fec,
 #if defined(CONFIG_SPI_COLDFIRE_QSPI) || defined(CONFIG_SPI_COLDFIRE_QSPI_MODULE)
 	&m528x_qspi,
 #endif
diff --git a/arch/m68k/platform/532x/config.c b/arch/m68k/platform/532x/config.c
index 69e2bc0..e340dac 100644
--- a/arch/m68k/platform/532x/config.c
+++ b/arch/m68k/platform/532x/config.c
@@ -33,36 +33,6 @@
 
 /***************************************************************************/
 
-static struct resource m532x_fec_resources[] = {
-	{
-		.start		= MCFFEC_BASE0,
-		.end		= MCFFEC_BASE0 + MCFFEC_SIZE0 - 1,
-		.flags		= IORESOURCE_MEM,
-	},
-	{
-		.start		= MCF_IRQ_FECRX0,
-		.end		= MCF_IRQ_FECRX0,
-		.flags		= IORESOURCE_IRQ,
-	},
-	{
-		.start		= MCF_IRQ_FECTX0,
-		.end		= MCF_IRQ_FECTX0,
-		.flags		= IORESOURCE_IRQ,
-	},
-	{
-		.start		= MCF_IRQ_FECENTC0,
-		.end		= MCF_IRQ_FECENTC0,
-		.flags		= IORESOURCE_IRQ,
-	},
-};
-
-static struct platform_device m532x_fec = {
-	.name			= "fec",
-	.id			= 0,
-	.num_resources		= ARRAY_SIZE(m532x_fec_resources),
-	.resource		= m532x_fec_resources,
-};
-
 #if defined(CONFIG_SPI_COLDFIRE_QSPI) || defined(CONFIG_SPI_COLDFIRE_QSPI_MODULE)
 static struct resource m532x_qspi_resources[] = {
 	{
@@ -179,7 +149,6 @@ static void __init m532x_qspi_init(void)
 
 
 static struct platform_device *m532x_devices[] __initdata = {
-	&m532x_fec,
 #if defined(CONFIG_SPI_COLDFIRE_QSPI) || defined(CONFIG_SPI_COLDFIRE_QSPI_MODULE)
 	&m532x_qspi,
 #endif
diff --git a/arch/m68k/platform/coldfire/device.c b/arch/m68k/platform/coldfire/device.c
index b930192..24b0d5e 100644
--- a/arch/m68k/platform/coldfire/device.c
+++ b/arch/m68k/platform/coldfire/device.c
@@ -16,6 +16,9 @@
 #include <asm/mcfsim.h>
 #include <asm/mcfuart.h>
 
+/*
+ *	All current ColdFire parts contain from 2, 3 or 4 UARTS.
+ */
 static struct mcf_platform_uart mcf_uart_platform_data[] = {
 	{
 		.mapbase	= MCFUART_BASE0,
@@ -46,8 +49,83 @@ static struct platform_device mcf_uart = {
 	.dev.platform_data	= mcf_uart_platform_data,
 };
 
+#ifdef CONFIG_FEC
+/*
+ *	Some ColdFire cores contain the Fast Ethernet Controller (FEC)
+ *	block. It is Freescale's own hardware block. Some ColdFires
+ *	have 2 of these.
+ */
+static struct resource mcf_fec0_resources[] = {
+	{
+		.start		= MCFFEC_BASE0,
+		.end		= MCFFEC_BASE0 + MCFFEC_SIZE0 - 1,
+		.flags		= IORESOURCE_MEM,
+	},
+	{
+		.start		= MCF_IRQ_FECRX0,
+		.end		= MCF_IRQ_FECRX0,
+		.flags		= IORESOURCE_IRQ,
+	},
+	{
+		.start		= MCF_IRQ_FECTX0,
+		.end		= MCF_IRQ_FECTX0,
+		.flags		= IORESOURCE_IRQ,
+	},
+	{
+		.start		= MCF_IRQ_FECENTC0,
+		.end		= MCF_IRQ_FECENTC0,
+		.flags		= IORESOURCE_IRQ,
+	},
+};
+
+static struct platform_device mcf_fec0 = {
+	.name			= "fec",
+	.id			= 0,
+	.num_resources		= ARRAY_SIZE(mcf_fec0_resources),
+	.resource		= mcf_fec0_resources,
+};
+
+#ifdef MCFFEC_BASE1
+static struct resource mcf_fec1_resources[] = {
+	{
+		.start		= MCFFEC_BASE1,
+		.end		= MCFFEC_BASE1 + MCFFEC_SIZE1 - 1,
+		.flags		= IORESOURCE_MEM,
+	},
+	{
+		.start		= MCF_IRQ_FECRX1,
+		.end		= MCF_IRQ_FECRX1,
+		.flags		= IORESOURCE_IRQ,
+	},
+	{
+		.start		= MCF_IRQ_FECTX1,
+		.end		= MCF_IRQ_FECTX1,
+		.flags		= IORESOURCE_IRQ,
+	},
+	{
+		.start		= MCF_IRQ_FECENTC1,
+		.end		= MCF_IRQ_FECENTC1,
+		.flags		= IORESOURCE_IRQ,
+	},
+};
+
+static struct platform_device mcf_fec1 = {
+	.name			= "fec",
+	.id			= 0,
+	.num_resources		= ARRAY_SIZE(mcf_fec1_resources),
+	.resource		= mcf_fec1_resources,
+};
+#endif /* MCFFEC_BASE1 */
+#endif /* CONFIG_FEC */
+
 static struct platform_device *mcf_devices[] __initdata = {
 	&mcf_uart,
+#ifdef CONFIG_FEC
+	&mcf_fec0,
+#ifdef MCFFEC_BASE1
+	&mcf_fec1,
+#endif
+#endif
 };
 
 
-- 
1.7.0.4
