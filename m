From: <gerg@snapgear.com>
Subject: [PATCH 12/12] m68knommu: modify clock code so it can be used by all ColdFire CPU types
Date: Fri, 16 Nov 2012 14:47:36 +1000
Message-ID: <1353041256-2959-13-git-send-email-gerg@snapgear.com>
References: <1353041256-2959-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from dnvwsmailout1.mcafee.com ([161.69.31.173]:45262 "EHLO
	DNVWSMAILOUT1.mcafee.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751290Ab2KPEln (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 15 Nov 2012 23:41:43 -0500
In-Reply-To: <1353041256-2959-1-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

The existing clk.c code for ColdFire CPUs has one set of functions to
support those CPU types that have selectable clocks (those with a PPMCR
register), and a duplicate simpler set for those with static clocks.

Modify the clk.c code so there is just one set of support functions. All
CPU types now define a list of clocks (in "struct clk"s), so we only need
a single set of clock functions.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/platform/coldfire/clk.c |  100 ++++++++++++++-----------------------
 1 files changed, 38 insertions(+), 62 deletions(-)

diff --git a/arch/m68k/platform/coldfire/clk.c b/arch/m68k/platform/coldfire/clk.c
index 9cd13b4..fddfdcc 100644
--- a/arch/m68k/platform/coldfire/clk.c
+++ b/arch/m68k/platform/coldfire/clk.c
@@ -19,37 +19,58 @@
 #include <asm/mcfsim.h>
 #include <asm/mcfclk.h>
 
-/***************************************************************************/
-#ifndef MCFPM_PPMCR0
-struct clk *clk_get(struct device *dev, const char *id)
+static DEFINE_SPINLOCK(clk_lock);
+
+#ifdef MCFPM_PPMCR0
+/*
+ *	For more advanced ColdFire parts that have clocks that can be enabled
+ *	we supply enable/disable functions. These must properly define their
+ *	clocks in their platform specific code.
+ */
+void __clk_init_enabled(struct clk *clk)
 {
-	return NULL;
+	clk->enabled = 1;
+	clk->clk_ops->enable(clk);
 }
-EXPORT_SYMBOL(clk_get);
 
-int clk_enable(struct clk *clk)
+void __clk_init_disabled(struct clk *clk)
 {
-	return 0;
+	clk->enabled = 0;
+	clk->clk_ops->disable(clk);
 }
-EXPORT_SYMBOL(clk_enable);
 
-void clk_disable(struct clk *clk)
+static void __clk_enable0(struct clk *clk)
 {
+	__raw_writeb(clk->slot, MCFPM_PPMCR0);
 }
-EXPORT_SYMBOL(clk_disable);
 
-void clk_put(struct clk *clk)
+static void __clk_disable0(struct clk *clk)
+{
+	__raw_writeb(clk->slot, MCFPM_PPMSR0);
+}
+
+struct clk_ops clk_ops0 = {
+	.enable		= __clk_enable0,
+	.disable	= __clk_disable0,
+};
+
+#ifdef MCFPM_PPMCR1
+static void __clk_enable1(struct clk *clk)
 {
+	__raw_writeb(clk->slot, MCFPM_PPMCR1);
 }
-EXPORT_SYMBOL(clk_put);
 
-unsigned long clk_get_rate(struct clk *clk)
+static void __clk_disable1(struct clk *clk)
 {
-	return MCF_CLK;
+	__raw_writeb(clk->slot, MCFPM_PPMSR1);
 }
-EXPORT_SYMBOL(clk_get_rate);
-#else
-static DEFINE_SPINLOCK(clk_lock);
+
+struct clk_ops clk_ops1 = {
+	.enable		= __clk_enable1,
+	.disable	= __clk_disable1,
+};
+#endif /* MCFPM_PPMCR1 */
+#endif /* MCFPM_PPMCR0 */
 
 struct clk *clk_get(struct device *dev, const char *id)
 {
@@ -101,48 +122,3 @@ unsigned long clk_get_rate(struct clk *clk)
 EXPORT_SYMBOL(clk_get_rate);
 
 /***************************************************************************/
-
-void __clk_init_enabled(struct clk *clk)
-{
-	clk->enabled = 1;
-	clk->clk_ops->enable(clk);
-}
-
-void __clk_init_disabled(struct clk *clk)
-{
-	clk->enabled = 0;
-	clk->clk_ops->disable(clk);
-}
-
-static void __clk_enable0(struct clk *clk)
-{
-	__raw_writeb(clk->slot, MCFPM_PPMCR0);
-}
-
-static void __clk_disable0(struct clk *clk)
-{
-	__raw_writeb(clk->slot, MCFPM_PPMSR0);
-}
-
-struct clk_ops clk_ops0 = {
-	.enable		= __clk_enable0,
-	.disable	= __clk_disable0,
-};
-
-#ifdef MCFPM_PPMCR1
-static void __clk_enable1(struct clk *clk)
-{
-	__raw_writeb(clk->slot, MCFPM_PPMCR1);
-}
-
-static void __clk_disable1(struct clk *clk)
-{
-	__raw_writeb(clk->slot, MCFPM_PPMSR1);
-}
-
-struct clk_ops clk_ops1 = {
-	.enable		= __clk_enable1,
-	.disable	= __clk_disable1,
-};
-#endif /* MCFPM_PPMCR1 */
-#endif /* MCFPM_PPMCR0 */
-- 
1.7.0.4
