From: <gerg@snapgear.com>
Subject: [PATCH] m68knommu: define a local devm_clk_get() function
Date: Mon, 25 Jun 2012 11:05:55 +1000
Message-ID: <1340586355-304-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from dnvwsmailout1.mcafee.com ([161.69.31.173]:52280 "EHLO
	DNVWSMAILOUT1.mcafee.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751972Ab2FYBGX (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 24 Jun 2012 21:06:23 -0400
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

Commit f4d40de39a23f0c39cca55ac63e1175c69c3d2f7 ("net fec: do not depend
on grouped clocks") breaks compilation of the FEC driver for non iMX
platforms in linux-3.5-rc1. For example when compiling for ColdFire I get:

      LD      vmlinux
    drivers/built-in.o: In function `fec_probe':
    fec.c:(.devinit.text+0x1e0): undefined reference to `devm_clk_get'

Define a simple devm_clk_get() function for the m68knommu architecture.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/platform/coldfire/clk.c |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/arch/m68k/platform/coldfire/clk.c b/arch/m68k/platform/coldfire/clk.c
index 9f1260c..44da406 100644
--- a/arch/m68k/platform/coldfire/clk.c
+++ b/arch/m68k/platform/coldfire/clk.c
@@ -42,4 +42,11 @@ unsigned long clk_get_rate(struct clk *clk)
 	return MCF_CLK;
 }
 EXPORT_SYMBOL(clk_get_rate);
+
+struct clk *devm_clk_get(struct device *dev, const char *id)
+{
+	return NULL;
+}
+EXPORT_SYMBOL(devm_clk_get);
+
 /***************************************************************************/
-- 
1.7.0.4
