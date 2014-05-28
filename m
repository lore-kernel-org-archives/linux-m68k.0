From: gerg@uclinux.org
Subject: [PATCH 8/9] m68knommu: enable clock when using dma_timer hardware module
Date: Wed, 28 May 2014 10:49:48 +1000
Message-ID: <1401238189-4402-9-git-send-email-gerg@uclinux.org>
References: <1401238189-4402-1-git-send-email-gerg@uclinux.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from nskntmtas01p.mx.bigpond.com ([61.9.168.137]:50604 "EHLO
	nskntmtas01p.mx.bigpond.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752039AbaE1At5 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>);
	Tue, 27 May 2014 20:49:57 -0400
In-Reply-To: <1401238189-4402-1-git-send-email-gerg@uclinux.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

Acquire the SoC clock when using the DMA timer hardware module. With the
clock acquired we can enable it and get it ticking. On most ColdFire SoC
hardware the DMA timer clock is not enabled by default.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/platform/coldfire/dma_timer.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/m68k/platform/coldfire/dma_timer.c b/arch/m68k/platform/coldfire/dma_timer.c
index 9b7b950..1f8d967 100644
--- a/arch/m68k/platform/coldfire/dma_timer.c
+++ b/arch/m68k/platform/coldfire/dma_timer.c
@@ -7,6 +7,7 @@
  */
 
 #include <linux/clocksource.h>
+#include <linux/clk.h>
 #include <linux/io.h>
 
 #include <asm/machdep.h>
@@ -44,12 +45,18 @@ static struct clocksource clocksource_cf_dt = {
 
 static int __init  init_cf_dt_clocksource(void)
 {
+	struct clk *clk;
+
 	/*
 	 * We setup DMA timer 0 in free run mode. This incrementing counter is
 	 * used as a highly precious clock source. With MCF_CLOCK = 150 MHz we
 	 * get a ~213 ns resolution and the 32bit register will overflow almost
 	 * every 15 minutes.
 	 */
+	clk = clk_get(NULL, "mcftmr.0");
+	if (clk)
+		clk_enable(clk);
+
 	__raw_writeb(0x00, DTXMR0);
 	__raw_writeb(0x00, DTER0);
 	__raw_writel(0x00000000, DTRR0);
-- 
1.8.1.4
