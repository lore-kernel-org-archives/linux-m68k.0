From: <gerg@snapgear.com>
Subject: [PATCH 03/12] m68knommu: add clock definitions for 523x ColdFire CPU types
Date: Fri, 16 Nov 2012 14:47:27 +1000
Message-ID: <1353041256-2959-4-git-send-email-gerg@snapgear.com>
References: <1353041256-2959-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from dnvwsmailout1.mcafee.com ([161.69.31.173]:45224 "EHLO
	DNVWSMAILOUT1.mcafee.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750939Ab2KPEl0 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 15 Nov 2012 23:41:26 -0500
In-Reply-To: <1353041256-2959-1-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

Add a base set of clocks for the 523x ColdFire CPU types.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/platform/coldfire/m523x.c |   28 ++++++++++++++++++++++++++++
 1 files changed, 28 insertions(+), 0 deletions(-)

diff --git a/arch/m68k/platform/coldfire/m523x.c b/arch/m68k/platform/coldfire/m523x.c
index ff37fe9..2b10e9f 100644
--- a/arch/m68k/platform/coldfire/m523x.c
+++ b/arch/m68k/platform/coldfire/m523x.c
@@ -19,6 +19,34 @@
 #include <asm/machdep.h>
 #include <asm/coldfire.h>
 #include <asm/mcfsim.h>
+#include <asm/mcfclk.h>
+
+/***************************************************************************/
+
+DEFINE_CLK(pll, "pll.0", MCF_CLK);
+DEFINE_CLK(sys, "sys.0", MCF_BUSCLK);
+DEFINE_CLK(mcfpit0, "mcfpit.0", MCF_CLK);
+DEFINE_CLK(mcfpit1, "mcfpit.1", MCF_CLK);
+DEFINE_CLK(mcfpit2, "mcfpit.2", MCF_CLK);
+DEFINE_CLK(mcfpit3, "mcfpit.3", MCF_CLK);
+DEFINE_CLK(mcfuart0, "mcfuart.0", MCF_BUSCLK);
+DEFINE_CLK(mcfuart1, "mcfuart.1", MCF_BUSCLK);
+DEFINE_CLK(mcfuart2, "mcfuart.2", MCF_BUSCLK);
+DEFINE_CLK(fec0, "fec.0", MCF_BUSCLK);
+
+struct clk *mcf_clks[] = {
+	&clk_pll,
+	&clk_sys,
+	&clk_mcfpit0,
+	&clk_mcfpit1,
+	&clk_mcfpit2,
+	&clk_mcfpit3,
+	&clk_mcfuart0,
+	&clk_mcfuart1,
+	&clk_mcfuart2,
+	&clk_fec0,
+	NULL
+};
 
 /***************************************************************************/
 
-- 
1.7.0.4
