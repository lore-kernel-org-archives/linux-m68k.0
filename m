From: <gerg@snapgear.com>
Subject: [PATCH 9/9] m68knommu: make ColdFire 5249 MBAR2 register definitions absolute addresses
Date: Wed, 19 Sep 2012 15:08:44 +1000
Message-ID: <1348031324-13228-10-git-send-email-gerg@snapgear.com>
References: <1348031324-13228-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from dnvwsmailout1.mcafee.com ([161.69.31.173]:46996 "EHLO
	DNVWSMAILOUT1.mcafee.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755224Ab2ISFHW (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 19 Sep 2012 01:07:22 -0400
In-Reply-To: <1348031324-13228-1-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

Make the ColdFire 5249 MBAR peripheral register definitions absolute
addresses, instead of offsets into the region.

The various ColdFire parts use different methods to address the internal
registers, some are absolute, some are relative to peripheral regions
which can be mapped at different address ranges (such as the MBAR and IPSBAR
registers). We don't want to deal with this in the code when we are
accessing these registers, so make all register definitions the absolute
address - factoring out whether it is an offset into a peripheral region.

This makes them all consistently defined, and reduces the occasional bugs
caused by inconsistent definition of the register addresses.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/include/asm/m5249sim.h        |   34 +++++++++++++++---------------
 arch/m68k/platform/coldfire/intc-5249.c |   10 ++++----
 arch/m68k/platform/coldfire/m5249.c     |    8 +++---
 3 files changed, 26 insertions(+), 26 deletions(-)

diff --git a/arch/m68k/include/asm/m5249sim.h b/arch/m68k/include/asm/m5249sim.h
index 3d9c7d7..fdf45e6 100644
--- a/arch/m68k/include/asm/m5249sim.h
+++ b/arch/m68k/include/asm/m5249sim.h
@@ -134,23 +134,23 @@
 #define	MCFSIM2_GPIO1ENABLE	(MCF_MBAR2 + 0x0B8)	/* GPIO1 enabled */
 #define	MCFSIM2_GPIO1FUNC	(MCF_MBAR2 + 0x0BC)	/* GPIO1 function */
 
-#define	MCFSIM2_GPIOINTSTAT	0xc0		/* GPIO interrupt status */
-#define	MCFSIM2_GPIOINTCLEAR	0xc0		/* GPIO interrupt clear */
-#define	MCFSIM2_GPIOINTENABLE	0xc4		/* GPIO interrupt enable */
-
-#define	MCFSIM2_INTLEVEL1	0x140		/* Interrupt level reg 1 */
-#define	MCFSIM2_INTLEVEL2	0x144		/* Interrupt level reg 2 */
-#define	MCFSIM2_INTLEVEL3	0x148		/* Interrupt level reg 3 */
-#define	MCFSIM2_INTLEVEL4	0x14c		/* Interrupt level reg 4 */
-#define	MCFSIM2_INTLEVEL5	0x150		/* Interrupt level reg 5 */
-#define	MCFSIM2_INTLEVEL6	0x154		/* Interrupt level reg 6 */
-#define	MCFSIM2_INTLEVEL7	0x158		/* Interrupt level reg 7 */
-#define	MCFSIM2_INTLEVEL8	0x15c		/* Interrupt level reg 8 */
-
-#define	MCFSIM2_DMAROUTE	0x188		/* DMA routing */
-
-#define	MCFSIM2_IDECONFIG1	0x18c		/* IDEconfig1 */
-#define	MCFSIM2_IDECONFIG2	0x190		/* IDEconfig2 */
+#define	MCFSIM2_GPIOINTSTAT	(MCF_MBAR2 + 0xc0)	/* GPIO intr status */
+#define	MCFSIM2_GPIOINTCLEAR	(MCF_MBAR2 + 0xc0)	/* GPIO intr clear */
+#define	MCFSIM2_GPIOINTENABLE	(MCF_MBAR2 + 0xc4)	/* GPIO intr enable */
+
+#define	MCFSIM2_INTLEVEL1	(MCF_MBAR2 + 0x140)	/* Intr level reg 1 */
+#define	MCFSIM2_INTLEVEL2	(MCF_MBAR2 + 0x144)	/* Intr level reg 2 */
+#define	MCFSIM2_INTLEVEL3	(MCF_MBAR2 + 0x148)	/* Intr level reg 3 */
+#define	MCFSIM2_INTLEVEL4	(MCF_MBAR2 + 0x14c)	/* Intr level reg 4 */
+#define	MCFSIM2_INTLEVEL5	(MCF_MBAR2 + 0x150)	/* Intr level reg 5 */
+#define	MCFSIM2_INTLEVEL6	(MCF_MBAR2 + 0x154)	/* Intr level reg 6 */
+#define	MCFSIM2_INTLEVEL7	(MCF_MBAR2 + 0x158)	/* Intr level reg 7 */
+#define	MCFSIM2_INTLEVEL8	(MCF_MBAR2 + 0x15c)	/* Intr level reg 8 */
+
+#define	MCFSIM2_DMAROUTE	(MCF_MBAR2 + 0x188)	/* DMA routing */
+
+#define	MCFSIM2_IDECONFIG1	(MCF_MBAR2 + 0x18c)	/* IDEconfig1 */
+#define	MCFSIM2_IDECONFIG2	(MCF_MBAR2 + 0x190)	/* IDEconfig2 */
 
 /*
  * Define the base interrupt for the second interrupt controller.
diff --git a/arch/m68k/platform/coldfire/intc-5249.c b/arch/m68k/platform/coldfire/intc-5249.c
index f343bf7..0864b83 100644
--- a/arch/m68k/platform/coldfire/intc-5249.c
+++ b/arch/m68k/platform/coldfire/intc-5249.c
@@ -20,22 +20,22 @@
 static void intc2_irq_gpio_mask(struct irq_data *d)
 {
 	u32 imr;
-	imr = readl(MCF_MBAR2 + MCFSIM2_GPIOINTENABLE);
+	imr = readl(MCFSIM2_GPIOINTENABLE);
 	imr &= ~(0x1 << (d->irq - MCFINTC2_GPIOIRQ0));
-	writel(imr, MCF_MBAR2 + MCFSIM2_GPIOINTENABLE);
+	writel(imr, MCFSIM2_GPIOINTENABLE);
 }
 
 static void intc2_irq_gpio_unmask(struct irq_data *d)
 {
 	u32 imr;
-	imr = readl(MCF_MBAR2 + MCFSIM2_GPIOINTENABLE);
+	imr = readl(MCFSIM2_GPIOINTENABLE);
 	imr |= (0x1 << (d->irq - MCFINTC2_GPIOIRQ0));
-	writel(imr, MCF_MBAR2 + MCFSIM2_GPIOINTENABLE);
+	writel(imr, MCFSIM2_GPIOINTENABLE);
 }
 
 static void intc2_irq_gpio_ack(struct irq_data *d)
 {
-	writel(0x1 << (d->irq - MCFINTC2_GPIOIRQ0), MCF_MBAR2 + MCFSIM2_GPIOINTCLEAR);
+	writel(0x1 << (d->irq - MCFINTC2_GPIOIRQ0), MCFSIM2_GPIOINTCLEAR);
 }
 
 static struct irq_chip intc2_irq_gpio_chip = {
diff --git a/arch/m68k/platform/coldfire/m5249.c b/arch/m68k/platform/coldfire/m5249.c
index df2968d..23b19cb 100644
--- a/arch/m68k/platform/coldfire/m5249.c
+++ b/arch/m68k/platform/coldfire/m5249.c
@@ -72,11 +72,11 @@ static void __init m5249_smc91x_init(void)
 	u32  gpio;
 
 	/* Set the GPIO line as interrupt source for smc91x device */
-	gpio = readl(MCF_MBAR2 + MCFSIM2_GPIOINTENABLE);
-	writel(gpio | 0x40, MCF_MBAR2 + MCFSIM2_GPIOINTENABLE);
+	gpio = readl(MCFSIM2_GPIOINTENABLE);
+	writel(gpio | 0x40, MCFSIM2_GPIOINTENABLE);
 
-	gpio = readl(MCF_MBAR2 + MCFSIM2_INTLEVEL5);
-	writel(gpio | 0x04000000, MCF_MBAR2 + MCFSIM2_INTLEVEL5);
+	gpio = readl(MCFSIM2_INTLEVEL5);
+	writel(gpio | 0x04000000, MCFSIM2_INTLEVEL5);
 }
 
 #endif /* CONFIG_M5249C3 */
-- 
1.7.0.4
