From: Steven King <sfking@fdwdc.com>
Subject: [PATCH] m68knommu: Add qspi clk for Coldfire SoCs without real clks.
Date: Wed, 14 May 2014 10:06:29 -0700
Message-ID: <201405141006.30078.sfking@fdwdc.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from nm19-vm2.bullet.mail.gq1.yahoo.com ([98.136.217.25]:59114 "EHLO
	nm19-vm2.bullet.mail.gq1.yahoo.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753918AbaENRMq (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>);
	Wed, 14 May 2014 13:12:46 -0400
Content-Disposition: inline
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org
Cc: Greg Ungerer <gerg@uclinux.org>, Geert Uytterhoeven <geert@linux-m68k.org>

Since we now have fake clks on devices without real clocks, we need clks
defined for qspi for the qspi driver to work on those devices.

Signed-off-by: Steven King <sfking@fdwdc.com>

---
 arch/m68k/platform/coldfire/m523x.c |    2 ++
 arch/m68k/platform/coldfire/m5249.c |    2 ++
 arch/m68k/platform/coldfire/m525x.c |    2 ++
 arch/m68k/platform/coldfire/m5272.c |    2 ++
 arch/m68k/platform/coldfire/m527x.c |    2 ++
 arch/m68k/platform/coldfire/m528x.c |    2 ++
 6 files changed, 12 insertions(+)

diff --git a/arch/m68k/platform/coldfire/m523x.c b/arch/m68k/platform/coldfire/m523x.c
index 2b10e9f..bef0ef3 100644
--- a/arch/m68k/platform/coldfire/m523x.c
+++ b/arch/m68k/platform/coldfire/m523x.c
@@ -32,6 +32,7 @@ DEFINE_CLK(mcfpit3, "mcfpit.3", MCF_CLK);
 DEFINE_CLK(mcfuart0, "mcfuart.0", MCF_BUSCLK);
 DEFINE_CLK(mcfuart1, "mcfuart.1", MCF_BUSCLK);
 DEFINE_CLK(mcfuart2, "mcfuart.2", MCF_BUSCLK);
+DEFINE_CLK(mcfqspi0, "mcfqspi.0", MCF_BUSCLK);
 DEFINE_CLK(fec0, "fec.0", MCF_BUSCLK);
 
 struct clk *mcf_clks[] = {
@@ -44,6 +45,7 @@ struct clk *mcf_clks[] = {
 	&clk_mcfuart0,
 	&clk_mcfuart1,
 	&clk_mcfuart2,
+	&clk_mcfqspi0,
 	&clk_fec0,
 	NULL
 };
diff --git a/arch/m68k/platform/coldfire/m5249.c b/arch/m68k/platform/coldfire/m5249.c
index c80b5e5..405ff3c 100644
--- a/arch/m68k/platform/coldfire/m5249.c
+++ b/arch/m68k/platform/coldfire/m5249.c
@@ -26,6 +26,7 @@ DEFINE_CLK(mcftmr0, "mcftmr.0", MCF_BUSCLK);
 DEFINE_CLK(mcftmr1, "mcftmr.1", MCF_BUSCLK);
 DEFINE_CLK(mcfuart0, "mcfuart.0", MCF_BUSCLK);
 DEFINE_CLK(mcfuart1, "mcfuart.1", MCF_BUSCLK);
+DEFINE_CLK(mcfqspi0, "mcfqspi.0", MCF_BUSCLK);
 
 struct clk *mcf_clks[] = {
 	&clk_pll,
@@ -34,6 +35,7 @@ struct clk *mcf_clks[] = {
 	&clk_mcftmr1,
 	&clk_mcfuart0,
 	&clk_mcfuart1,
+	&clk_mcfqspi0,
 	NULL
 };
 
diff --git a/arch/m68k/platform/coldfire/m525x.c b/arch/m68k/platform/coldfire/m525x.c
index 5b9f657..1adba39 100644
--- a/arch/m68k/platform/coldfire/m525x.c
+++ b/arch/m68k/platform/coldfire/m525x.c
@@ -26,6 +26,7 @@ DEFINE_CLK(mcftmr0, "mcftmr.0", MCF_BUSCLK);
 DEFINE_CLK(mcftmr1, "mcftmr.1", MCF_BUSCLK);
 DEFINE_CLK(mcfuart0, "mcfuart.0", MCF_BUSCLK);
 DEFINE_CLK(mcfuart1, "mcfuart.1", MCF_BUSCLK);
+DEFINE_CLK(mcfqspi0, "mcfqspi.0", MCF_BUSCLK);
 
 struct clk *mcf_clks[] = {
 	&clk_pll,
@@ -34,6 +35,7 @@ struct clk *mcf_clks[] = {
 	&clk_mcftmr1,
 	&clk_mcfuart0,
 	&clk_mcfuart1,
+	&clk_mcfqspi0,
 	NULL
 };
 
diff --git a/arch/m68k/platform/coldfire/m5272.c b/arch/m68k/platform/coldfire/m5272.c
index a8c5856..8a4d3cc 100644
--- a/arch/m68k/platform/coldfire/m5272.c
+++ b/arch/m68k/platform/coldfire/m5272.c
@@ -39,6 +39,7 @@ DEFINE_CLK(mcftmr2, "mcftmr.2", MCF_BUSCLK);
 DEFINE_CLK(mcftmr3, "mcftmr.3", MCF_BUSCLK);
 DEFINE_CLK(mcfuart0, "mcfuart.0", MCF_BUSCLK);
 DEFINE_CLK(mcfuart1, "mcfuart.1", MCF_BUSCLK);
+DEFINE_CLK(mcfqspi0, "mcfqspi.0", MCF_BUSCLK);
 DEFINE_CLK(fec0, "fec.0", MCF_BUSCLK);
 
 struct clk *mcf_clks[] = {
@@ -50,6 +51,7 @@ struct clk *mcf_clks[] = {
 	&clk_mcftmr3,
 	&clk_mcfuart0,
 	&clk_mcfuart1,
+	&clk_mcfqspi0,
 	&clk_fec0,
 	NULL
 };
diff --git a/arch/m68k/platform/coldfire/m527x.c b/arch/m68k/platform/coldfire/m527x.c
index 6fbfe909..782e620 100644
--- a/arch/m68k/platform/coldfire/m527x.c
+++ b/arch/m68k/platform/coldfire/m527x.c
@@ -33,6 +33,7 @@ DEFINE_CLK(mcfpit3, "mcfpit.3", MCF_CLK);
 DEFINE_CLK(mcfuart0, "mcfuart.0", MCF_BUSCLK);
 DEFINE_CLK(mcfuart1, "mcfuart.1", MCF_BUSCLK);
 DEFINE_CLK(mcfuart2, "mcfuart.2", MCF_BUSCLK);
+DEFINE_CLK(mcfqspi0, "mcfqspi.0", MCF_BUSCLK);
 DEFINE_CLK(fec0, "fec.0", MCF_BUSCLK);
 DEFINE_CLK(fec1, "fec.1", MCF_BUSCLK);
 
@@ -46,6 +47,7 @@ struct clk *mcf_clks[] = {
 	&clk_mcfuart0,
 	&clk_mcfuart1,
 	&clk_mcfuart2,
+	&clk_mcfqspi0,
 	&clk_fec0,
 	&clk_fec1,
 	NULL
diff --git a/arch/m68k/platform/coldfire/m528x.c b/arch/m68k/platform/coldfire/m528x.c
index b03a9d2..d8348c9 100644
--- a/arch/m68k/platform/coldfire/m528x.c
+++ b/arch/m68k/platform/coldfire/m528x.c
@@ -34,6 +34,7 @@ DEFINE_CLK(mcfpit3, "mcfpit.3", MCF_CLK);
 DEFINE_CLK(mcfuart0, "mcfuart.0", MCF_BUSCLK);
 DEFINE_CLK(mcfuart1, "mcfuart.1", MCF_BUSCLK);
 DEFINE_CLK(mcfuart2, "mcfuart.2", MCF_BUSCLK);
+DEFINE_CLK(mcfqspi0, "mcfqspi.0", MCF_BUSCLK);
 DEFINE_CLK(fec0, "fec.0", MCF_BUSCLK);
 
 struct clk *mcf_clks[] = {
@@ -46,6 +47,7 @@ struct clk *mcf_clks[] = {
 	&clk_mcfuart0,
 	&clk_mcfuart1,
 	&clk_mcfuart2,
+	&clk_mcfqspi0,
 	&clk_fec0,
 	NULL
 };
