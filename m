From: <gerg@snapgear.com>
Subject: [PATCH 02/12] m68knommu: add clock definitions for 5206 ColdFire CPU types
Date: Fri, 16 Nov 2012 14:47:26 +1000
Message-ID: <1353041256-2959-3-git-send-email-gerg@snapgear.com>
References: <1353041256-2959-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from dnvwsmailout1.mcafee.com ([161.69.31.173]:45219 "EHLO
	DNVWSMAILOUT1.mcafee.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750939Ab2KPElY (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 15 Nov 2012 23:41:24 -0500
In-Reply-To: <1353041256-2959-1-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

Add a base set of clocks for the 5206 ColdFire CPU types.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/platform/coldfire/m5206.c |   20 ++++++++++++++++++++
 1 files changed, 20 insertions(+), 0 deletions(-)

diff --git a/arch/m68k/platform/coldfire/m5206.c b/arch/m68k/platform/coldfire/m5206.c
index 6bfbeeb..0e55f44 100644
--- a/arch/m68k/platform/coldfire/m5206.c
+++ b/arch/m68k/platform/coldfire/m5206.c
@@ -16,6 +16,26 @@
 #include <asm/machdep.h>
 #include <asm/coldfire.h>
 #include <asm/mcfsim.h>
+#include <asm/mcfclk.h>
+
+/***************************************************************************/
+
+DEFINE_CLK(pll, "pll.0", MCF_CLK);
+DEFINE_CLK(sys, "sys.0", MCF_BUSCLK);
+DEFINE_CLK(mcftmr0, "mcftmr.0", MCF_BUSCLK);
+DEFINE_CLK(mcftmr1, "mcftmr.1", MCF_BUSCLK);
+DEFINE_CLK(mcfuart0, "mcfuart.0", MCF_BUSCLK);
+DEFINE_CLK(mcfuart1, "mcfuart.1", MCF_BUSCLK);
+
+struct clk *mcf_clks[] = {
+	&clk_pll,
+	&clk_sys,
+	&clk_mcftmr0,
+	&clk_mcftmr1,
+	&clk_mcfuart0,
+	&clk_mcfuart1,
+	NULL
+};
 
 /***************************************************************************/
 
-- 
1.7.0.4
