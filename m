From: <gerg@snapgear.com>
Subject: [PATCH 2/4] m68knommu: make ColdFire M532x platform support more v3 generic
Date: Mon, 19 Nov 2012 15:14:06 +1000
Message-ID: <1353302048-924-3-git-send-email-gerg@snapgear.com>
References: <1353302048-924-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mivwsmailout1.mcafee.com ([161.69.47.167]:27399 "EHLO
	MIVWSMAILOUT1.mcafee.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751395Ab2KSFOt (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 19 Nov 2012 00:14:49 -0500
In-Reply-To: <1353302048-924-1-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

The M532x CPU platform support can be used on more ColdFire CPU families
than just the 532x types. So rename and reconfigure it to reflect that.
The ColdFire 537x family has virtualy identical internals to the 532x,
and so it will be able to share this code when we add support for them.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/platform/coldfire/Makefile             |    2 +-
 arch/m68k/platform/coldfire/{m532x.c => m53xx.c} |   18 +++++++++---------
 2 files changed, 10 insertions(+), 10 deletions(-)
 rename arch/m68k/platform/coldfire/{m532x.c => m53xx.c} (98%)

diff --git a/arch/m68k/platform/coldfire/Makefile b/arch/m68k/platform/coldfire/Makefile
index 02591a1..68f0fac 100644
--- a/arch/m68k/platform/coldfire/Makefile
+++ b/arch/m68k/platform/coldfire/Makefile
@@ -25,7 +25,7 @@ obj-$(CONFIG_M527x)	+= m527x.o pit.o intc-2.o reset.o
 obj-$(CONFIG_M5272)	+= m5272.o intc-5272.o timers.o
 obj-$(CONFIG_M528x)	+= m528x.o pit.o intc-2.o reset.o
 obj-$(CONFIG_M5307)	+= m5307.o timers.o intc.o reset.o
-obj-$(CONFIG_M532x)	+= m532x.o timers.o intc-simr.o reset.o
+obj-$(CONFIG_M53xx)	+= m53xx.o timers.o intc-simr.o reset.o
 obj-$(CONFIG_M5407)	+= m5407.o timers.o intc.o reset.o
 obj-$(CONFIG_M54xx)	+= m54xx.o sltimers.o intc-2.o
 obj-$(CONFIG_M5441x)	+= m5441x.o pit.o intc-simr.o reset.o
diff --git a/arch/m68k/platform/coldfire/m532x.c b/arch/m68k/platform/coldfire/m53xx.c
similarity index 98%
rename from arch/m68k/platform/coldfire/m532x.c
rename to arch/m68k/platform/coldfire/m53xx.c
index 7951d1d..638382e 100644
--- a/arch/m68k/platform/coldfire/m532x.c
+++ b/arch/m68k/platform/coldfire/m53xx.c
@@ -1,7 +1,7 @@
 /***************************************************************************/
 
 /*
- *	linux/arch/m68knommu/platform/532x/config.c
+ *	m53xx.c -- platform support for ColdFire 53xx based boards
  *
  *	Copyright (C) 1999-2002, Greg Ungerer (gerg@snapgear.com)
  *	Copyright (C) 2000, Lineo (www.lineo.com)
@@ -153,7 +153,7 @@ static struct clk * const disable_clks[] __initconst = {
 };
 
 
-static void __init m532x_clk_init(void)
+static void __init m53xx_clk_init(void)
 {
 	unsigned i;
 
@@ -169,7 +169,7 @@ static void __init m532x_clk_init(void)
 
 #if IS_ENABLED(CONFIG_SPI_COLDFIRE_QSPI)
 
-static void __init m532x_qspi_init(void)
+static void __init m53xx_qspi_init(void)
 {
 	/* setup QSPS pins for QSPI with gpio CS control */
 	writew(0x01f0, MCFGPIO_PAR_QSPI);
@@ -179,7 +179,7 @@ static void __init m532x_qspi_init(void)
 
 /***************************************************************************/
 
-static void __init m532x_uarts_init(void)
+static void __init m53xx_uarts_init(void)
 {
 	/* UART GPIO initialization */
 	writew(readw(MCFGPIO_PAR_UART) | 0x0FFF, MCFGPIO_PAR_UART);
@@ -187,7 +187,7 @@ static void __init m532x_uarts_init(void)
 
 /***************************************************************************/
 
-static void __init m532x_fec_init(void)
+static void __init m53xx_fec_init(void)
 {
 	u8 v;
 
@@ -217,11 +217,11 @@ void __init config_BSP(char *commandp, int size)
 	}
 #endif
 	mach_sched_init = hw_timer_init;
-	m532x_clk_init();
-	m532x_uarts_init();
-	m532x_fec_init();
+	m53xx_clk_init();
+	m53xx_uarts_init();
+	m53xx_fec_init();
 #if IS_ENABLED(CONFIG_SPI_COLDFIRE_QSPI)
-	m532x_qspi_init();
+	m53xx_qspi_init();
 #endif
 
 #ifdef CONFIG_BDM_DISABLE
-- 
1.7.0.4
