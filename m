From: <gerg@snapgear.com>
Subject: [PATCH] m68knommu: fix arch devm_get_clk() for some ColdFire parts
Date: Mon, 10 Sep 2012 14:47:30 +1000
Message-ID: <1347252450-20392-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from dalsmrelay2.nai.com ([205.227.136.216]:39620 "EHLO
	dalsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751448Ab2IJEoR (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 10 Sep 2012 00:44:17 -0400
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

The arch local devm_get_clk() is always returning the NULL clock even on the
ColdFire parts that we keep a list of clocks for. This breaks drivers that
look for CPU clocks, like the Freescale FEC ethernet driver. So this is
currently broken on ColdFire 520x, 532x amd 5441x SoC parts. All other
ColdFire parts still work.

The simple clocking code traditionaly used by ColdFire parts didn't keep
a list of clocks, and returned NULL for clk_get(). With commit fe66158a
("m68knommu: Add clk definitions for m520x.") for example we now do have
a list of real clocks for some ColdFire parts. The local devm_get_clk()
function needs to return the clock struct on these, which it can easily do
using the existing local clk_get().

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/platform/coldfire/clk.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/m68k/platform/coldfire/clk.c b/arch/m68k/platform/coldfire/clk.c
index 75f9ee9..ca1d8fa 100644
--- a/arch/m68k/platform/coldfire/clk.c
+++ b/arch/m68k/platform/coldfire/clk.c
@@ -149,6 +149,6 @@ struct clk_ops clk_ops1 = {
 
 struct clk *devm_clk_get(struct device *dev, const char *id)
 {
-	return NULL;
+	return clk_get(dev, id);
 }
 EXPORT_SYMBOL(devm_clk_get);
-- 
1.7.0.4
