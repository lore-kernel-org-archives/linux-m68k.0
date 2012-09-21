From: <gerg@snapgear.com>
Subject: [PATCH 03/11] m68knommu: remove address offsets relative to IPSBAR for ColdFire 527x
Date: Fri, 21 Sep 2012 16:51:05 +1000
Message-ID: <1348210273-31246-4-git-send-email-gerg@snapgear.com>
References: <1348210273-31246-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from dalsmrelay2.nai.com ([205.227.136.216]:28520 "EHLO
	dalsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754148Ab2IUGvh (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 21 Sep 2012 02:51:37 -0400
In-Reply-To: <1348210273-31246-1-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

Remove the last address definitions relative to the IPSBAR peripheral region
for the ColdFire 527x family. This involved cleaning up some magic numbers
used in the code part, and making them proper register definitions in the 527x
specific header.

This is part of the process of cleaning up the ColdFire register definitions
to make them consistently use absolute addresses for the primary registers.
This will reduce the occasional bugs caused by inconsistent definition of
the register addresses.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/include/asm/m527xsim.h    |   52 +++++++++++++++++++++++------------
 arch/m68k/platform/coldfire/m527x.c |   24 ++++++++--------
 2 files changed, 46 insertions(+), 30 deletions(-)

diff --git a/arch/m68k/include/asm/m527xsim.h b/arch/m68k/include/asm/m527xsim.h
index 71aa510..6335e42 100644
--- a/arch/m68k/include/asm/m527xsim.h
+++ b/arch/m68k/include/asm/m527xsim.h
@@ -194,9 +194,23 @@
 #define MCFGPIO_IRQ_MAX			8
 #define MCFGPIO_IRQ_VECBASE		MCFINT_VECBASE
 
+/*
+ * Port Pin Assignment registers.
+ */
+#define MCFGPIO_PAR_AD		(MCF_IPSBAR + 0x100040)
+#define MCFGPIO_PAR_BUSCTL	(MCF_IPSBAR + 0x100042)
+#define MCFGPIO_PAR_BS		(MCF_IPSBAR + 0x100044)
+#define MCFGPIO_PAR_CS		(MCF_IPSBAR + 0x100045)
+#define MCFGPIO_PAR_SDRAM	(MCF_IPSBAR + 0x100046)
+#define MCFGPIO_PAR_FECI2C	(MCF_IPSBAR + 0x100047)
+#define MCFGPIO_PAR_UART	(MCF_IPSBAR + 0x100048)
 #define MCFGPIO_PAR_QSPI	(MCF_IPSBAR + 0x10004A)
 #define MCFGPIO_PAR_TIMER	(MCF_IPSBAR + 0x10004C)
-#endif
+
+#define UART0_ENABLE_MASK	0x000f
+#define UART1_ENABLE_MASK	0x0ff0
+#define UART2_ENABLE_MASK	0x3000
+#endif /* CONFIG_M5271 */
 
 #ifdef CONFIG_M5275
 #define MCFGPIO_PODR_BUSCTL	(MCF_IPSBAR + 0x100004)
@@ -289,8 +303,26 @@
 #define MCFGPIO_IRQ_MAX			8
 #define MCFGPIO_IRQ_VECBASE		MCFINT_VECBASE
 
+/*
+ * Port Pin Assignment registers.
+ */
+#define MCFGPIO_PAR_AD		(MCF_IPSBAR + 0x100070)
+#define MCFGPIO_PAR_CS		(MCF_IPSBAR + 0x100071)
+#define MCFGPIO_PAR_BUSCTL	(MCF_IPSBAR + 0x100072)
+#define MCFGPIO_PAR_USB		(MCF_IPSBAR + 0x100076)
+#define MCFGPIO_PAR_FEC0HL	(MCF_IPSBAR + 0x100078)
+#define MCFGPIO_PAR_FEC1HL	(MCF_IPSBAR + 0x100079)
+#define MCFGPIO_PAR_TIMER	(MCF_IPSBAR + 0x10007A)
+#define MCFGPIO_PAR_UART	(MCF_IPSBAR + 0x10007C)
 #define MCFGPIO_PAR_QSPI	(MCF_IPSBAR + 0x10007E)
-#endif
+#define MCFGPIO_PAR_SDRAM	(MCF_IPSBAR + 0x100080)
+#define MCFGPIO_PAR_FECI2C	(MCF_IPSBAR + 0x100082)
+#define MCFGPIO_PAR_BS		(MCF_IPSBAR + 0x100084)
+
+#define UART0_ENABLE_MASK	0x000f
+#define UART1_ENABLE_MASK	0x00f0
+#define UART2_ENABLE_MASK	0x3f00
+#endif /* CONFIG_M5275 */
 
 /*
  * PIT timer base addresses.
@@ -311,22 +343,6 @@
 #define MCFEPORT_EPFR		(MCF_IPSBAR + 0x130006)
 
 /*
- *	GPIO pins setups to enable the UARTs.
- */
-#ifdef CONFIG_M5271
-#define MCF_GPIO_PAR_UART	0x100048	/* PAR UART address */
-#define UART0_ENABLE_MASK	0x000f
-#define UART1_ENABLE_MASK	0x0ff0
-#define UART2_ENABLE_MASK	0x3000
-#endif
-#ifdef CONFIG_M5275
-#define MCF_GPIO_PAR_UART	0x10007c	/* PAR UART address */
-#define UART0_ENABLE_MASK	0x000f
-#define UART1_ENABLE_MASK	0x00f0
-#define UART2_ENABLE_MASK	0x3f00 
-#endif
-
-/*
  *  Reset Control Unit (relative to IPSBAR).
  */
 #define	MCF_RCR			(MCF_IPSBAR + 0x110000)
diff --git a/arch/m68k/platform/coldfire/m527x.c b/arch/m68k/platform/coldfire/m527x.c
index b3cb378..1431ba0 100644
--- a/arch/m68k/platform/coldfire/m527x.c
+++ b/arch/m68k/platform/coldfire/m527x.c
@@ -53,9 +53,9 @@ static void __init m527x_uarts_init(void)
 	/*
 	 * External Pin Mask Setting & Enable External Pin for Interface
 	 */
-	sepmask = readw(MCF_IPSBAR + MCF_GPIO_PAR_UART);
+	sepmask = readw(MCFGPIO_PAR_UART);
 	sepmask |= UART0_ENABLE_MASK | UART1_ENABLE_MASK | UART2_ENABLE_MASK;
-	writew(sepmask, MCF_IPSBAR + MCF_GPIO_PAR_UART);
+	writew(sepmask, MCFGPIO_PAR_UART);
 }
 
 /***************************************************************************/
@@ -67,19 +67,19 @@ static void __init m527x_fec_init(void)
 
 	/* Set multi-function pins to ethernet mode for fec0 */
 #if defined(CONFIG_M5271)
-	v = readb(MCF_IPSBAR + 0x100047);
-	writeb(v | 0xf0, MCF_IPSBAR + 0x100047);
+	v = readb(MCFGPIO_PAR_FECI2C);
+	writeb(v | 0xf0, MCFGPIO_PAR_FECI2C);
 #else
-	par = readw(MCF_IPSBAR + 0x100082);
-	writew(par | 0xf00, MCF_IPSBAR + 0x100082);
-	v = readb(MCF_IPSBAR + 0x100078);
-	writeb(v | 0xc0, MCF_IPSBAR + 0x100078);
+	par = readw(MCFGPIO_PAR_FECI2C);
+	writew(par | 0xf00, MCFGPIO_PAR_FECI2C);
+	v = readb(MCFGPIO_PAR_FEC0HL);
+	writeb(v | 0xc0, MCFGPIO_PAR_FEC0HL);
 
 	/* Set multi-function pins to ethernet mode for fec1 */
-	par = readw(MCF_IPSBAR + 0x100082);
-	writew(par | 0xa0, MCF_IPSBAR + 0x100082);
-	v = readb(MCF_IPSBAR + 0x100079);
-	writeb(v | 0xc0, MCF_IPSBAR + 0x100079);
+	par = readw(MCFGPIO_PAR_FECI2C);
+	writew(par | 0xa0, MCFGPIO_PAR_FECI2C);
+	v = readb(MCFGPIO_PAR_FEC1HL);
+	writeb(v | 0xc0, MCFGPIO_PAR_FEC1HL);
 #endif
 }
 
-- 
1.7.0.4
