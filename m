From: <gerg@snapgear.com>
Subject: [PATCH 06/11] m68knommu: modify ColdFire 532x GPIO register definitions to be consistent
Date: Fri, 21 Sep 2012 16:51:08 +1000
Message-ID: <1348210273-31246-7-git-send-email-gerg@snapgear.com>
References: <1348210273-31246-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from dalsmrelay2.nai.com ([205.227.136.216]:28510 "EHLO
	dalsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753544Ab2IUGve (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 21 Sep 2012 02:51:34 -0400
In-Reply-To: <1348210273-31246-1-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

The ColdFire 532x CPU register definitions for the multi-function setup
pins are inconsistently defined compared with other ColdFire parts. Modify
the register defintions to be just the addresses, not pointers. This also
fixes the erroneous use in one case of using these values in the UART setup
code for the 532x.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/include/asm/m532xsim.h    |   52 +++++++++++++++++-----------------
 arch/m68k/platform/coldfire/m532x.c |   38 +++++++++++++++-----------
 2 files changed, 48 insertions(+), 42 deletions(-)

diff --git a/arch/m68k/include/asm/m532xsim.h b/arch/m68k/include/asm/m532xsim.h
index 3833370..d4092fa 100644
--- a/arch/m68k/include/asm/m532xsim.h
+++ b/arch/m68k/include/asm/m532xsim.h
@@ -393,32 +393,32 @@
 #define MCFGPIO_PCLRR_LCDDATAL		(0xFC0A404B)
 #define MCFGPIO_PCLRR_LCDCTLH		(0xFC0A404C)
 #define MCFGPIO_PCLRR_LCDCTLL		(0xFC0A404D)
-#define MCF_GPIO_PAR_FEC		MCF_REG08(0xFC0A4050)
-#define MCF_GPIO_PAR_PWM		MCF_REG08(0xFC0A4051)
-#define MCF_GPIO_PAR_BUSCTL		MCF_REG08(0xFC0A4052)
-#define MCF_GPIO_PAR_FECI2C		MCF_REG08(0xFC0A4053)
-#define MCF_GPIO_PAR_BE			MCF_REG08(0xFC0A4054)
-#define MCF_GPIO_PAR_CS			MCF_REG08(0xFC0A4055)
-#define MCF_GPIO_PAR_SSI		MCF_REG16(0xFC0A4056)
-#define MCF_GPIO_PAR_UART		MCF_REG16(0xFC0A4058)
-#define MCF_GPIO_PAR_QSPI		MCF_REG16(0xFC0A405A)
-#define MCF_GPIO_PAR_TIMER		MCF_REG08(0xFC0A405C)
-#define MCF_GPIO_PAR_LCDDATA		MCF_REG08(0xFC0A405D)
-#define MCF_GPIO_PAR_LCDCTL		MCF_REG16(0xFC0A405E)
-#define MCF_GPIO_PAR_IRQ		MCF_REG16(0xFC0A4060)
-#define MCF_GPIO_MSCR_FLEXBUS		MCF_REG08(0xFC0A4064)
-#define MCF_GPIO_MSCR_SDRAM		MCF_REG08(0xFC0A4065)
-#define MCF_GPIO_DSCR_I2C		MCF_REG08(0xFC0A4068)
-#define MCF_GPIO_DSCR_PWM		MCF_REG08(0xFC0A4069)
-#define MCF_GPIO_DSCR_FEC		MCF_REG08(0xFC0A406A)
-#define MCF_GPIO_DSCR_UART		MCF_REG08(0xFC0A406B)
-#define MCF_GPIO_DSCR_QSPI		MCF_REG08(0xFC0A406C)
-#define MCF_GPIO_DSCR_TIMER		MCF_REG08(0xFC0A406D)
-#define MCF_GPIO_DSCR_SSI		MCF_REG08(0xFC0A406E)
-#define MCF_GPIO_DSCR_LCD		MCF_REG08(0xFC0A406F)
-#define MCF_GPIO_DSCR_DEBUG		MCF_REG08(0xFC0A4070)
-#define MCF_GPIO_DSCR_CLKRST		MCF_REG08(0xFC0A4071)
-#define MCF_GPIO_DSCR_IRQ		MCF_REG08(0xFC0A4072)
+#define MCFGPIO_PAR_FEC			(0xFC0A4050)
+#define MCFGPIO_PAR_PWM			(0xFC0A4051)
+#define MCFGPIO_PAR_BUSCTL		(0xFC0A4052)
+#define MCFGPIO_PAR_FECI2C		(0xFC0A4053)
+#define MCFGPIO_PAR_BE			(0xFC0A4054)
+#define MCFGPIO_PAR_CS			(0xFC0A4055)
+#define MCFGPIO_PAR_SSI			(0xFC0A4056)
+#define MCFGPIO_PAR_UART		(0xFC0A4058)
+#define MCFGPIO_PAR_QSPI		(0xFC0A405A)
+#define MCFGPIO_PAR_TIMER		(0xFC0A405C)
+#define MCFGPIO_PAR_LCDDATA		(0xFC0A405D)
+#define MCFGPIO_PAR_LCDCTL		(0xFC0A405E)
+#define MCFGPIO_PAR_IRQ			(0xFC0A4060)
+#define MCFGPIO_MSCR_FLEXBUS		(0xFC0A4064)
+#define MCFGPIO_MSCR_SDRAM		(0xFC0A4065)
+#define MCFGPIO_DSCR_I2C		(0xFC0A4068)
+#define MCFGPIO_DSCR_PWM		(0xFC0A4069)
+#define MCFGPIO_DSCR_FEC		(0xFC0A406A)
+#define MCFGPIO_DSCR_UART		(0xFC0A406B)
+#define MCFGPIO_DSCR_QSPI		(0xFC0A406C)
+#define MCFGPIO_DSCR_TIMER		(0xFC0A406D)
+#define MCFGPIO_DSCR_SSI		(0xFC0A406E)
+#define MCFGPIO_DSCR_LCD		(0xFC0A406F)
+#define MCFGPIO_DSCR_DEBUG		(0xFC0A4070)
+#define MCFGPIO_DSCR_CLKRST		(0xFC0A4071)
+#define MCFGPIO_DSCR_IRQ		(0xFC0A4072)
 
 /* Bit definitions and macros for MCF_GPIO_PODR_FECH */
 #define MCF_GPIO_PODR_FECH_PODR_FECH0              (0x01)
diff --git a/arch/m68k/platform/coldfire/m532x.c b/arch/m68k/platform/coldfire/m532x.c
index 4819a44..0adeef1 100644
--- a/arch/m68k/platform/coldfire/m532x.c
+++ b/arch/m68k/platform/coldfire/m532x.c
@@ -172,7 +172,7 @@ static void __init m532x_clk_init(void)
 static void __init m532x_qspi_init(void)
 {
 	/* setup QSPS pins for QSPI with gpio CS control */
-	writew(0x01f0, MCF_GPIO_PAR_QSPI);
+	writew(0x01f0, MCFGPIO_PAR_QSPI);
 }
 
 #endif /* IS_ENABLED(CONFIG_SPI_COLDFIRE_QSPI) */
@@ -182,18 +182,24 @@ static void __init m532x_qspi_init(void)
 static void __init m532x_uarts_init(void)
 {
 	/* UART GPIO initialization */
-	MCF_GPIO_PAR_UART |= 0x0FFF;
+	writew(readw(MCFGPIO_PAR_UART) | 0x0FFF, MCFGPIO_PAR_UART);
 }
 
 /***************************************************************************/
 
 static void __init m532x_fec_init(void)
 {
+	u8 v;
+
 	/* Set multi-function pins to ethernet mode for fec0 */
-	MCF_GPIO_PAR_FECI2C |= (MCF_GPIO_PAR_FECI2C_PAR_MDC_EMDC |
-		MCF_GPIO_PAR_FECI2C_PAR_MDIO_EMDIO);
-	MCF_GPIO_PAR_FEC = (MCF_GPIO_PAR_FEC_PAR_FEC_7W_FEC |
-		MCF_GPIO_PAR_FEC_PAR_FEC_MII_FEC);
+	v = readb(MCFGPIO_PAR_FECI2C);
+	v |= MCF_GPIO_PAR_FECI2C_PAR_MDC_EMDC |
+		MCF_GPIO_PAR_FECI2C_PAR_MDIO_EMDIO;
+	writeb(v, MCFGPIO_PAR_FECI2C);
+
+	v = readb(MCFGPIO_PAR_FEC);
+	v = MCF_GPIO_PAR_FEC_PAR_FEC_7W_FEC | MCF_GPIO_PAR_FEC_PAR_FEC_MII_FEC;
+	writeb(v, MCFGPIO_PAR_FEC);
 }
 
 /***************************************************************************/
@@ -325,7 +331,7 @@ void scm_init(void)
 
 void fbcs_init(void)
 {
-	MCF_GPIO_PAR_CS = 0x0000003E;
+	writeb(0x3E, MCFGPIO_PAR_CS);
 
 	/* Latch chip select */
 	MCF_FBCS1_CSAR = 0x10080000;
@@ -448,16 +454,16 @@ void sdramc_init(void)
 void gpio_init(void)
 {
 	/* Enable UART0 pins */
-	MCF_GPIO_PAR_UART = ( 0
-		| MCF_GPIO_PAR_UART_PAR_URXD0
-		| MCF_GPIO_PAR_UART_PAR_UTXD0);
-
-	/* Initialize TIN3 as a GPIO output to enable the write
-	   half of the latch */
-	MCF_GPIO_PAR_TIMER = 0x00;
-	__raw_writeb(0x08, MCFGPIO_PDDR_TIMER);
-	__raw_writeb(0x00, MCFGPIO_PCLRR_TIMER);
+	writew(MCF_GPIO_PAR_UART_PAR_URXD0 | MCF_GPIO_PAR_UART_PAR_UTXD0,
+		MCFGPIO_PAR_UART);
 
+	/*
+	 * Initialize TIN3 as a GPIO output to enable the write
+	 * half of the latch.
+	 */
+	writeb(0x00, MCFGPIO_PAR_TIMER);
+	writeb(0x08, MCFGPIO_PDDR_TIMER);
+	writeb(0x00, MCFGPIO_PCLRR_TIMER);
 }
 
 int clock_pll(int fsys, int flags)
-- 
1.7.0.4
