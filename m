From: <gerg@snapgear.com>
Subject: [PATCH 11/11] m68knommu: clean up ColdFire 54xx General Timer definitions
Date: Fri, 21 Sep 2012 16:51:13 +1000
Message-ID: <1348210273-31246-12-git-send-email-gerg@snapgear.com>
References: <1348210273-31246-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from dalsmrelay2.nai.com ([205.227.136.216]:28568 "EHLO
	dalsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754344Ab2IUGvo (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 21 Sep 2012 02:51:44 -0400
In-Reply-To: <1348210273-31246-1-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

Convert the ColdFire 54xx CPU General Timer register address definitions to
include the MCF_MBAR peripheral region offset. This makes them consistent
with all other 54xx address register definitions (in m54xxsim.h).

The goal is to reduce different definitions used (some including offsets and
others not) causing bugs when used incorrectly.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/include/asm/m54xxgpt.h    |   40 +++++++++++++++++-----------------
 arch/m68k/platform/coldfire/m54xx.c |    6 ++--
 drivers/watchdog/m54xx_wdt.c        |   21 ++++++++---------
 3 files changed, 33 insertions(+), 34 deletions(-)

diff --git a/arch/m68k/include/asm/m54xxgpt.h b/arch/m68k/include/asm/m54xxgpt.h
index df75dd8..0b69cd1 100644
--- a/arch/m68k/include/asm/m54xxgpt.h
+++ b/arch/m68k/include/asm/m54xxgpt.h
@@ -16,26 +16,26 @@
 *********************************************************************/
 
 /* Register read/write macros */
-#define MCF_GPT_GMS0       0x000800
-#define MCF_GPT_GCIR0      0x000804
-#define MCF_GPT_GPWM0      0x000808
-#define MCF_GPT_GSR0       0x00080C
-#define MCF_GPT_GMS1       0x000810
-#define MCF_GPT_GCIR1      0x000814
-#define MCF_GPT_GPWM1      0x000818
-#define MCF_GPT_GSR1       0x00081C
-#define MCF_GPT_GMS2       0x000820
-#define MCF_GPT_GCIR2      0x000824
-#define MCF_GPT_GPWM2      0x000828
-#define MCF_GPT_GSR2       0x00082C
-#define MCF_GPT_GMS3       0x000830
-#define MCF_GPT_GCIR3      0x000834
-#define MCF_GPT_GPWM3      0x000838
-#define MCF_GPT_GSR3       0x00083C
-#define MCF_GPT_GMS(x)     (0x000800+((x)*0x010))
-#define MCF_GPT_GCIR(x)    (0x000804+((x)*0x010))
-#define MCF_GPT_GPWM(x)    (0x000808+((x)*0x010))
-#define MCF_GPT_GSR(x)     (0x00080C+((x)*0x010))
+#define MCF_GPT_GMS0       (MCF_MBAR + 0x000800)
+#define MCF_GPT_GCIR0      (MCF_MBAR + 0x000804)
+#define MCF_GPT_GPWM0      (MCF_MBAR + 0x000808)
+#define MCF_GPT_GSR0       (MCF_MBAR + 0x00080C)
+#define MCF_GPT_GMS1       (MCF_MBAR + 0x000810)
+#define MCF_GPT_GCIR1      (MCF_MBAR + 0x000814)
+#define MCF_GPT_GPWM1      (MCF_MBAR + 0x000818)
+#define MCF_GPT_GSR1       (MCF_MBAR + 0x00081C)
+#define MCF_GPT_GMS2       (MCF_MBAR + 0x000820)
+#define MCF_GPT_GCIR2      (MCF_MBAR + 0x000824)
+#define MCF_GPT_GPWM2      (MCF_MBAR + 0x000828)
+#define MCF_GPT_GSR2       (MCF_MBAR + 0x00082C)
+#define MCF_GPT_GMS3       (MCF_MBAR + 0x000830)
+#define MCF_GPT_GCIR3      (MCF_MBAR + 0x000834)
+#define MCF_GPT_GPWM3      (MCF_MBAR + 0x000838)
+#define MCF_GPT_GSR3       (MCF_MBAR + 0x00083C)
+#define MCF_GPT_GMS(x)     (MCF_MBAR + 0x000800 + ((x) * 0x010))
+#define MCF_GPT_GCIR(x)    (MCF_MBAR + 0x000804 + ((x) * 0x010))
+#define MCF_GPT_GPWM(x)    (MCF_MBAR + 0x000808 + ((x) * 0x010))
+#define MCF_GPT_GSR(x)     (MCF_MBAR + 0x00080C + ((x) * 0x010))
 
 /* Bit definitions and macros for MCF_GPT_GMS */
 #define MCF_GPT_GMS_TMS(x)         (((x)&0x00000007)<<0)
diff --git a/arch/m68k/platform/coldfire/m54xx.c b/arch/m68k/platform/coldfire/m54xx.c
index 1f7c7fd..b587bf3 100644
--- a/arch/m68k/platform/coldfire/m54xx.c
+++ b/arch/m68k/platform/coldfire/m54xx.c
@@ -44,10 +44,10 @@ static void mcf54xx_reset(void)
 {
 	/* disable interrupts and enable the watchdog */
 	asm("movew #0x2700, %sr\n");
-	__raw_writel(0, MCF_MBAR + MCF_GPT_GMS0);
-	__raw_writel(MCF_GPT_GCIR_CNT(1), MCF_MBAR + MCF_GPT_GCIR0);
+	__raw_writel(0, MCF_GPT_GMS0);
+	__raw_writel(MCF_GPT_GCIR_CNT(1), MCF_GPT_GCIR0);
 	__raw_writel(MCF_GPT_GMS_WDEN | MCF_GPT_GMS_CE | MCF_GPT_GMS_TMS(4),
-						MCF_MBAR + MCF_GPT_GMS0);
+		MCF_GPT_GMS0);
 }
 
 /***************************************************************************/
diff --git a/drivers/watchdog/m54xx_wdt.c b/drivers/watchdog/m54xx_wdt.c
index 663cad8..173494a 100644
--- a/drivers/watchdog/m54xx_wdt.c
+++ b/drivers/watchdog/m54xx_wdt.c
@@ -46,17 +46,17 @@ static void wdt_enable(void)
 	unsigned int gms0;
 
 	/* preserve GPIO usage, if any */
-	gms0 = __raw_readl(MCF_MBAR + MCF_GPT_GMS0);
+	gms0 = __raw_readl(MCF_GPT_GMS0);
 	if (gms0 & MCF_GPT_GMS_TMS_GPIO)
 		gms0 &= (MCF_GPT_GMS_TMS_GPIO | MCF_GPT_GMS_GPIO_MASK
 							| MCF_GPT_GMS_OD);
 	else
 		gms0 = MCF_GPT_GMS_TMS_GPIO | MCF_GPT_GMS_OD;
-	__raw_writel(gms0, MCF_MBAR + MCF_GPT_GMS0);
+	__raw_writel(gms0, MCF_GPT_GMS0);
 	__raw_writel(MCF_GPT_GCIR_PRE(heartbeat*(MCF_BUSCLK/0xffff)) |
-			MCF_GPT_GCIR_CNT(0xffff), MCF_MBAR + MCF_GPT_GCIR0);
+			MCF_GPT_GCIR_CNT(0xffff), MCF_GPT_GCIR0);
 	gms0 |= MCF_GPT_GMS_OCPW(0xA5) | MCF_GPT_GMS_WDEN | MCF_GPT_GMS_CE;
-	__raw_writel(gms0, MCF_MBAR + MCF_GPT_GMS0);
+	__raw_writel(gms0, MCF_GPT_GMS0);
 }
 
 static void wdt_disable(void)
@@ -64,18 +64,18 @@ static void wdt_disable(void)
 	unsigned int gms0;
 
 	/* disable watchdog */
-	gms0 = __raw_readl(MCF_MBAR + MCF_GPT_GMS0);
+	gms0 = __raw_readl(MCF_GPT_GMS0);
 	gms0 &= ~(MCF_GPT_GMS_WDEN | MCF_GPT_GMS_CE);
-	__raw_writel(gms0, MCF_MBAR + MCF_GPT_GMS0);
+	__raw_writel(gms0, MCF_GPT_GMS0);
 }
 
 static void wdt_keepalive(void)
 {
 	unsigned int gms0;
 
-	gms0 = __raw_readl(MCF_MBAR + MCF_GPT_GMS0);
+	gms0 = __raw_readl(MCF_GPT_GMS0);
 	gms0 |= MCF_GPT_GMS_OCPW(0xA5);
-	__raw_writel(gms0, MCF_MBAR + MCF_GPT_GMS0);
+	__raw_writel(gms0, MCF_GPT_GMS0);
 }
 
 static int m54xx_wdt_open(struct inode *inode, struct file *file)
@@ -195,8 +195,7 @@ static struct miscdevice m54xx_wdt_miscdev = {
 
 static int __init m54xx_wdt_init(void)
 {
-	if (!request_mem_region(MCF_MBAR + MCF_GPT_GCIR0, 4,
-						"Coldfire M54xx Watchdog")) {
+	if (!request_mem_region(MCF_GPT_GCIR0, 4, "Coldfire M54xx Watchdog")) {
 		pr_warn("I/O region busy\n");
 		return -EBUSY;
 	}
@@ -208,7 +207,7 @@ static int __init m54xx_wdt_init(void)
 static void __exit m54xx_wdt_exit(void)
 {
 	misc_deregister(&m54xx_wdt_miscdev);
-	release_mem_region(MCF_MBAR + MCF_GPT_GCIR0, 4);
+	release_mem_region(MCF_GPT_GCIR0, 4);
 }
 
 module_init(m54xx_wdt_init);
-- 
1.7.0.4
