From: Angelo Dureghello <angelo@sysam.it>
Subject: [PATCH] m68k: coldfire: add dspi0 module support
Date: Fri, 13 Oct 2017 01:09:32 +0200
Message-ID: <20171012230932.3761-1-angelo@sysam.it>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sysam.it ([5.39.81.93]:48073 "EHLO sysam.it"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752731AbdJLXJg (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
        Thu, 12 Oct 2017 19:09:36 -0400
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org
Cc: gregungerer@westnet.com.au, Angelo Dureghello <angelo@sysam.it>

This patch adds initial module base address and irq for dspi0.
It also defines the dspi0 clock to be used by the Freescale driver.

Signed-off-by: Angelo Dureghello <angelo@sysam.it>
---
 arch/m68k/coldfire/m5441x.c       | 3 ++-
 arch/m68k/include/asm/m5441xsim.h | 6 ++++++
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/m68k/coldfire/m5441x.c b/arch/m68k/coldfire/m5441x.c
index 04fd7fde9fb3..dc48bb1cf3e3 100644
--- a/arch/m68k/coldfire/m5441x.c
+++ b/arch/m68k/coldfire/m5441x.c
@@ -26,7 +26,7 @@ DEFINE_CLK(0, "intc.0", 18, MCF_CLK);
 DEFINE_CLK(0, "intc.1", 19, MCF_CLK);
 DEFINE_CLK(0, "intc.2", 20, MCF_CLK);
 DEFINE_CLK(0, "imx1-i2c.0", 22, MCF_CLK);
-DEFINE_CLK(0, "mcfdspi.0", 23, MCF_CLK);
+DEFINE_CLK(0, "fsl-dspi.0", 23, MCF_CLK);
 DEFINE_CLK(0, "mcfuart.0", 24, MCF_BUSCLK);
 DEFINE_CLK(0, "mcfuart.1", 25, MCF_BUSCLK);
 DEFINE_CLK(0, "mcfuart.2", 26, MCF_BUSCLK);
@@ -139,6 +139,7 @@ static struct clk * const enable_clks[] __initconst = {
 	&__clk_0_18, /* intc0 */
 	&__clk_0_19, /* intc0 */
 	&__clk_0_20, /* intc0 */
+	&__clk_0_23, /* dspi.0 */
 	&__clk_0_24, /* uart0 */
 	&__clk_0_25, /* uart1 */
 	&__clk_0_26, /* uart2 */
diff --git a/arch/m68k/include/asm/m5441xsim.h b/arch/m68k/include/asm/m5441xsim.h
index 64f60be47066..adf6701db052 100644
--- a/arch/m68k/include/asm/m5441xsim.h
+++ b/arch/m68k/include/asm/m5441xsim.h
@@ -277,4 +277,10 @@
 #define MCFGPIO_IRQ_VECBASE	(MCFINT_VECBASE - MCFGPIO_IRQ_MIN)
 #define MCFGPIO_PIN_MAX		87
 
+/*
+ *  DSPI module.
+ */
+#define MCFDSPI_BASE0		0xfc05c000
+#define MCF_IRQ_DSPI0		(MCFINT0_VECBASE + MCFINT0_DSPI0)
+
 #endif /* m5441xsim_h */
-- 
2.14.1
