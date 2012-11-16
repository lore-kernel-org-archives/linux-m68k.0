From: <gerg@snapgear.com>
Subject: [PATCH 11/12] m68knommu: add clock definitions for 54xx ColdFire CPU types
Date: Fri, 16 Nov 2012 14:47:35 +1000
Message-ID: <1353041256-2959-12-git-send-email-gerg@snapgear.com>
References: <1353041256-2959-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from dnvwsmailout1.mcafee.com ([161.69.31.173]:45270 "EHLO
	DNVWSMAILOUT1.mcafee.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751290Ab2KPElq (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 15 Nov 2012 23:41:46 -0500
In-Reply-To: <1353041256-2959-1-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

Add a base set of clocks for the 54xx ColdFire CPU types.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/platform/coldfire/m54xx.c |   26 ++++++++++++++++++++++++++
 1 files changed, 26 insertions(+), 0 deletions(-)

diff --git a/arch/m68k/platform/coldfire/m54xx.c b/arch/m68k/platform/coldfire/m54xx.c
index b587bf3..952da53 100644
--- a/arch/m68k/platform/coldfire/m54xx.c
+++ b/arch/m68k/platform/coldfire/m54xx.c
@@ -14,19 +14,45 @@
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/mm.h>
+#include <linux/clk.h>
 #include <linux/bootmem.h>
 #include <asm/pgalloc.h>
 #include <asm/machdep.h>
 #include <asm/coldfire.h>
 #include <asm/m54xxsim.h>
 #include <asm/mcfuart.h>
+#include <asm/mcfclk.h>
 #include <asm/m54xxgpt.h>
+#include <asm/mcfclk.h>
 #ifdef CONFIG_MMU
 #include <asm/mmu_context.h>
 #endif
 
 /***************************************************************************/
 
+DEFINE_CLK(pll, "pll.0", MCF_CLK);
+DEFINE_CLK(sys, "sys.0", MCF_BUSCLK);
+DEFINE_CLK(mcfslt0, "mcfslt.0", MCF_BUSCLK);
+DEFINE_CLK(mcfslt1, "mcfslt.1", MCF_BUSCLK);
+DEFINE_CLK(mcfuart0, "mcfuart.0", MCF_BUSCLK);
+DEFINE_CLK(mcfuart1, "mcfuart.1", MCF_BUSCLK);
+DEFINE_CLK(mcfuart2, "mcfuart.2", MCF_BUSCLK);
+DEFINE_CLK(mcfuart3, "mcfuart.3", MCF_BUSCLK);
+
+struct clk *mcf_clks[] = {
+	&clk_pll,
+	&clk_sys,
+	&clk_mcfslt0,
+	&clk_mcfslt1,
+	&clk_mcfuart0,
+	&clk_mcfuart1,
+	&clk_mcfuart2,
+	&clk_mcfuart3,
+	NULL
+};
+
+/***************************************************************************/
+
 static void __init m54xx_uarts_init(void)
 {
 	/* enable io pins */
-- 
1.7.0.4
