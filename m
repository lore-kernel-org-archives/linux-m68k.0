From: gerg@uclinux.org
Subject: [PATCH] m68knommu: add DMA timer counter to entropy
Date: Thu, 29 May 2014 10:58:48 +1000
Message-ID: <1401325128-29787-1-git-send-email-gerg@uclinux.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from nskntmtas01p.mx.bigpond.com ([61.9.168.137]:30756 "EHLO
	nskntmtas01p.mx.bigpond.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751758AbaE2A6j (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>);
	Wed, 28 May 2014 20:58:39 -0400
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

The ColdFire DMA timer hardware module is a free running counter that is
derived from the master system clock. It is effectively a cycle counter,
so lets add it to the entropy pool.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/platform/coldfire/dma_timer.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/m68k/platform/coldfire/dma_timer.c b/arch/m68k/platform/coldfire/dma_timer.c
index 1f8d967..850463c 100644
--- a/arch/m68k/platform/coldfire/dma_timer.c
+++ b/arch/m68k/platform/coldfire/dma_timer.c
@@ -9,6 +9,7 @@
 #include <linux/clocksource.h>
 #include <linux/clk.h>
 #include <linux/io.h>
+#include <linux/timex.h>
 
 #include <asm/machdep.h>
 #include <asm/coldfire.h>
@@ -30,6 +31,11 @@
 #define DMA_DTMR_CLK_DIV_16	(2 << 1)
 #define DMA_DTMR_ENABLE		(1 << 0)
 
+static unsigned long cf_dt_random_get_entropy(void)
+{
+	return __raw_readl(DTCN0);
+}
+
 static cycle_t cf_dt_get_cycles(struct clocksource *cs)
 {
 	return __raw_readl(DTCN0);
@@ -56,6 +62,7 @@ static int __init  init_cf_dt_clocksource(void)
 	clk = clk_get(NULL, "mcftmr.0");
 	if (clk)
 		clk_enable(clk);
+	mach_random_get_entropy = cf_dt_random_get_entropy;
 
 	__raw_writeb(0x00, DTXMR0);
 	__raw_writeb(0x00, DTER0);
-- 
1.8.1.4
