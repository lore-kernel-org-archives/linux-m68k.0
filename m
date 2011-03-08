From: Greg Ungerer <gerg@uclinux.org>
Subject: [PATCH 05/12] m68knommu: remove MBAR and IPSBAR hacks for the ColdFire 520x CPUs
Date: Tue, 8 Mar 2011 23:04:02 +1000
Message-ID: <1299589449-24974-6-git-send-email-gerg@uclinux.org>
References: <1299589449-24974-1-git-send-email-gerg@uclinux.org>
 <1299589449-24974-2-git-send-email-gerg@uclinux.org>
 <1299589449-24974-3-git-send-email-gerg@uclinux.org>
 <1299589449-24974-4-git-send-email-gerg@uclinux.org>
 <1299589449-24974-5-git-send-email-gerg@uclinux.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:51494 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753099Ab1CHNIr (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 8 Mar 2011 08:08:47 -0500
In-Reply-To: <1299589449-24974-5-git-send-email-gerg@uclinux.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

The ColdFire 5207 and 5208 CPUs have fixed peripheral addresses.
They do not use the setable peripheral address registers like the MBAR
and IPSBAR used on many other ColdFire parts. Don't use fake values
of MBAR and IPSBAR when using peripheral addresses for them, there
is no need to.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/include/asm/coldfire.h        |    7 +----
 arch/m68k/include/asm/m520xsim.h        |   40 +++++++++++++++++-------------
 arch/m68knommu/platform/520x/config.c   |   36 ++++++++++++++--------------
 arch/m68knommu/platform/coldfire/head.S |    4 +-
 4 files changed, 44 insertions(+), 43 deletions(-)

diff --git a/arch/m68k/include/asm/coldfire.h b/arch/m68k/include/asm/coldfire.h
index 8daea2c..c7dce7e 100644
--- a/arch/m68k/include/asm/coldfire.h
+++ b/arch/m68k/include/asm/coldfire.h
@@ -31,14 +31,9 @@
  *	This is generally setup by the boards start up code.
  */
 #define	MCF_MBAR	0x10000000
-#if defined(CONFIG_M520x)
-#define	MCF_IPSBAR	0xFC000000
-#else
 #define	MCF_IPSBAR	0x40000000
-#endif
 
-#if defined(CONFIG_M523x) || defined(CONFIG_M527x) || defined(CONFIG_M528x) || \
-    defined(CONFIG_M520x)
+#if defined(CONFIG_M523x) || defined(CONFIG_M527x) || defined(CONFIG_M528x)
 #undef MCF_MBAR
 #define	MCF_MBAR	MCF_IPSBAR
 #endif
diff --git a/arch/m68k/include/asm/m520xsim.h b/arch/m68k/include/asm/m520xsim.h
index afc21ad..87f8ce7 100644
--- a/arch/m68k/include/asm/m520xsim.h
+++ b/arch/m68k/include/asm/m520xsim.h
@@ -19,7 +19,7 @@
 /*
  *  Define the 520x SIM register set addresses.
  */
-#define MCFICM_INTC0        0x48000     /* Base for Interrupt Ctrl 0 */
+#define MCFICM_INTC0        0xFC048000  /* Base for Interrupt Ctrl 0 */
 #define MCFINTC_IPRH        0x00        /* Interrupt pending 32-63 */
 #define MCFINTC_IPRL        0x04        /* Interrupt pending 1-31 */
 #define MCFINTC_IMRH        0x08        /* Interrupt mask 32-63 */
@@ -35,9 +35,9 @@
  *  address to the SIMR and CIMR registers (not offsets into IPSBAR).
  *  The 520x family only has a single INTC unit.
  */
-#define MCFINTC0_SIMR       (MCF_IPSBAR + MCFICM_INTC0 + MCFINTC_SIMR)
-#define MCFINTC0_CIMR       (MCF_IPSBAR + MCFICM_INTC0 + MCFINTC_CIMR)
-#define	MCFINTC0_ICR0       (MCF_IPSBAR + MCFICM_INTC0 + MCFINTC_ICR0)
+#define MCFINTC0_SIMR       (MCFICM_INTC0 + MCFINTC_SIMR)
+#define MCFINTC0_CIMR       (MCFICM_INTC0 + MCFINTC_CIMR)
+#define	MCFINTC0_ICR0       (MCFICM_INTC0 + MCFINTC_ICR0)
 #define MCFINTC1_SIMR       (0)
 #define MCFINTC1_CIMR       (0)
 #define	MCFINTC1_ICR0       (0)
@@ -52,12 +52,12 @@
 /*
  *  SDRAM configuration registers.
  */
-#define MCFSIM_SDMR         0x000a8000	/* SDRAM Mode/Extended Mode Register */
-#define MCFSIM_SDCR         0x000a8004	/* SDRAM Control Register */
-#define MCFSIM_SDCFG1       0x000a8008	/* SDRAM Configuration Register 1 */
-#define MCFSIM_SDCFG2       0x000a800c	/* SDRAM Configuration Register 2 */
-#define MCFSIM_SDCS0        0x000a8110	/* SDRAM Chip Select 0 Configuration */
-#define MCFSIM_SDCS1        0x000a8114	/* SDRAM Chip Select 1 Configuration */
+#define MCFSIM_SDMR         0xFC0a8000	/* SDRAM Mode/Extended Mode Register */
+#define MCFSIM_SDCR         0xFC0a8004	/* SDRAM Control Register */
+#define MCFSIM_SDCFG1       0xFC0a8008	/* SDRAM Configuration Register 1 */
+#define MCFSIM_SDCFG2       0xFC0a800c	/* SDRAM Configuration Register 2 */
+#define MCFSIM_SDCS0        0xFC0a8110	/* SDRAM Chip Select 0 Configuration */
+#define MCFSIM_SDCS1        0xFC0a8114	/* SDRAM Chip Select 1 Configuration */
 
 /*
  * EPORT and GPIO registers.
@@ -119,10 +119,10 @@
 #define MCFGPIO_IRQ_MAX			8
 #define MCFGPIO_IRQ_VECBASE		MCFINT_VECBASE
 
-#define MCF_GPIO_PAR_UART                   (0xA4036)
-#define MCF_GPIO_PAR_FECI2C                 (0xA4033)
-#define MCF_GPIO_PAR_QSPI                   (0xA4034)
-#define MCF_GPIO_PAR_FEC                    (0xA4038)
+#define MCF_GPIO_PAR_UART		0xFC0A4036
+#define MCF_GPIO_PAR_FECI2C		0xFC0A4033
+#define MCF_GPIO_PAR_QSPI		0xFC0A4034
+#define MCF_GPIO_PAR_FEC		0xFC0A4038
 
 #define MCF_GPIO_PAR_UART_PAR_URXD0         (0x0001)
 #define MCF_GPIO_PAR_UART_PAR_UTXD0         (0x0002)
@@ -142,9 +142,15 @@
 /*
  *  UART module.
  */
-#define MCFUART_BASE1		0x60000		/* Base address of UART1 */
-#define MCFUART_BASE2		0x64000		/* Base address of UART2 */
-#define MCFUART_BASE3		0x68000		/* Base address of UART2 */
+#define MCFUART_BASE1		0xFC060000	/* Base address of UART1 */
+#define MCFUART_BASE2		0xFC064000	/* Base address of UART2 */
+#define MCFUART_BASE3		0xFC068000	/* Base address of UART2 */
+
+/*
+ *  FEC module.
+ */
+#define	MCFFEC_BASE		0xFC030000	/* Base of FEC ethernet */
+#define	MCFFEC_SIZE		0x800		/* Register set size */
 
 /*
  *  Reset Controll Unit.
diff --git a/arch/m68knommu/platform/520x/config.c b/arch/m68knommu/platform/520x/config.c
index 71d2ba4..621238f 100644
--- a/arch/m68knommu/platform/520x/config.c
+++ b/arch/m68knommu/platform/520x/config.c
@@ -27,15 +27,15 @@
 
 static struct mcf_platform_uart m520x_uart_platform[] = {
 	{
-		.mapbase	= MCF_MBAR + MCFUART_BASE1,
+		.mapbase	= MCFUART_BASE1,
 		.irq		= MCFINT_VECBASE + MCFINT_UART0,
 	},
 	{
-		.mapbase 	= MCF_MBAR + MCFUART_BASE2,
+		.mapbase 	= MCFUART_BASE2,
 		.irq		= MCFINT_VECBASE + MCFINT_UART1,
 	},
 	{
-		.mapbase 	= MCF_MBAR + MCFUART_BASE3,
+		.mapbase 	= MCFUART_BASE3,
 		.irq		= MCFINT_VECBASE + MCFINT_UART2,
 	},
 	{ },
@@ -49,8 +49,8 @@ static struct platform_device m520x_uart = {
 
 static struct resource m520x_fec_resources[] = {
 	{
-		.start		= MCF_MBAR + 0x30000,
-		.end		= MCF_MBAR + 0x30000 + 0x7ff,
+		.start		= MCFFEC_BASE,
+		.end		= MCFFEC_BASE + MCFFEC_SIZE - 1,
 		.flags		= IORESOURCE_MEM,
 	},
 	{
@@ -208,11 +208,11 @@ static void __init m520x_qspi_init(void)
 {
 	u16 par;
 	/* setup Port QS for QSPI with gpio CS control */
-	writeb(0x3f, MCF_IPSBAR + MCF_GPIO_PAR_QSPI);
+	writeb(0x3f, MCF_GPIO_PAR_QSPI);
 	/* make U1CTS and U2RTS gpio for cs_control */
-	par = readw(MCF_IPSBAR + MCF_GPIO_PAR_UART);
+	par = readw(MCF_GPIO_PAR_UART);
 	par &= 0x00ff;
-	writew(par, MCF_IPSBAR + MCF_GPIO_PAR_UART);
+	writew(par, MCF_GPIO_PAR_UART);
 }
 #endif /* defined(CONFIG_SPI_COLDFIRE_QSPI) || defined(CONFIG_SPI_COLDFIRE_QSPI_MODULE) */
 
@@ -234,23 +234,23 @@ static void __init m520x_uart_init_line(int line, int irq)
 
 	switch (line) {
 	case 0:
-		par = readw(MCF_IPSBAR + MCF_GPIO_PAR_UART);
+		par = readw(MCF_GPIO_PAR_UART);
 		par |= MCF_GPIO_PAR_UART_PAR_UTXD0 |
 		       MCF_GPIO_PAR_UART_PAR_URXD0;
-		writew(par, MCF_IPSBAR + MCF_GPIO_PAR_UART);
+		writew(par, MCF_GPIO_PAR_UART);
 		break;
 	case 1:
-		par = readw(MCF_IPSBAR + MCF_GPIO_PAR_UART);
+		par = readw(MCF_GPIO_PAR_UART);
 		par |= MCF_GPIO_PAR_UART_PAR_UTXD1 |
 		       MCF_GPIO_PAR_UART_PAR_URXD1;
-		writew(par, MCF_IPSBAR + MCF_GPIO_PAR_UART);
+		writew(par, MCF_GPIO_PAR_UART);
 		break;
 	case 2:
-		par2 = readb(MCF_IPSBAR + MCF_GPIO_PAR_FECI2C);
+		par2 = readb(MCF_GPIO_PAR_FECI2C);
 		par2 &= ~0x0F;
 		par2 |= MCF_GPIO_PAR_FECI2C_PAR_SCL_UTXD2 |
 			MCF_GPIO_PAR_FECI2C_PAR_SDA_URXD2;
-		writeb(par2, MCF_IPSBAR + MCF_GPIO_PAR_FECI2C);
+		writeb(par2, MCF_GPIO_PAR_FECI2C);
 		break;
 	}
 }
@@ -271,11 +271,11 @@ static void __init m520x_fec_init(void)
 	u8 v;
 
 	/* Set multi-function pins to ethernet mode */
-	v = readb(MCF_IPSBAR + MCF_GPIO_PAR_FEC);
-	writeb(v | 0xf0, MCF_IPSBAR + MCF_GPIO_PAR_FEC);
+	v = readb(MCF_GPIO_PAR_FEC);
+	writeb(v | 0xf0, MCF_GPIO_PAR_FEC);
 
-	v = readb(MCF_IPSBAR + MCF_GPIO_PAR_FECI2C);
-	writeb(v | 0x0f, MCF_IPSBAR + MCF_GPIO_PAR_FECI2C);
+	v = readb(MCF_GPIO_PAR_FECI2C);
+	writeb(v | 0x0f, MCF_GPIO_PAR_FECI2C);
 }
 
 /***************************************************************************/
diff --git a/arch/m68knommu/platform/coldfire/head.S b/arch/m68knommu/platform/coldfire/head.S
index d597790..7967e8a 100644
--- a/arch/m68knommu/platform/coldfire/head.S
+++ b/arch/m68knommu/platform/coldfire/head.S
@@ -68,14 +68,14 @@
 #elif defined(CONFIG_M520x)
 .macro GET_MEM_SIZE
 	clrl	%d0
-	movel	MCF_MBAR+MCFSIM_SDCS0, %d2 /* Get SDRAM chip select 0 config */
+	movel	MCFSIM_SDCS0, %d2	/* Get SDRAM chip select 0 config */
 	andl	#0x1f, %d2		/* Get only the chip select size */
 	beq	3f			/* Check if it is enabled */
 	addql	#1, %d2			/* Form exponent */
 	moveql	#1, %d0
 	lsll	%d2, %d0		/* 2 ^ exponent */
 3:
-	movel	MCF_MBAR+MCFSIM_SDCS1, %d2 /* Get SDRAM chip select 1 config */
+	movel	MCFSIM_SDCS1, %d2	/* Get SDRAM chip select 1 config */
 	andl	#0x1f, %d2		/* Get only the chip select size */
 	beq	4f			/* Check if it is enabled */
 	addql	#1, %d2			/* Form exponent */
-- 
1.7.0.4
