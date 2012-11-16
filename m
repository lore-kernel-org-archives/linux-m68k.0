From: <gerg@snapgear.com>
Subject: [PATCH 01/12] m68knommu: add clock creation support macro for other ColdFire CPUs
Date: Fri, 16 Nov 2012 14:47:25 +1000
Message-ID: <1353041256-2959-2-git-send-email-gerg@snapgear.com>
References: <1353041256-2959-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from dnvwsmailout1.mcafee.com ([161.69.31.173]:45209 "EHLO
	DNVWSMAILOUT1.mcafee.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750939Ab2KPElW (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 15 Nov 2012 23:41:22 -0500
In-Reply-To: <1353041256-2959-1-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

The clock support code for ColdFire CPUs currently supports those that
have the clock control register PPMCR. Expose the struct clk for all CPU
types and add a definition for all other ColdFire CPU types.

With this we will be able to define simple clock trees for all ColdFire
CPU types, even though will not be able to be enabled or disabled. They
will be able to report the clock rate.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/include/asm/mcfclk.h |    9 ++++++++-
 1 files changed, 8 insertions(+), 1 deletions(-)

diff --git a/arch/m68k/include/asm/mcfclk.h b/arch/m68k/include/asm/mcfclk.h
index b676a02..ea4791e 100644
--- a/arch/m68k/include/asm/mcfclk.h
+++ b/arch/m68k/include/asm/mcfclk.h
@@ -8,7 +8,6 @@
 
 struct clk;
 
-#ifdef MCFPM_PPMCR0
 struct clk_ops {
 	void (*enable)(struct clk *);
 	void (*disable)(struct clk *);
@@ -23,6 +22,8 @@ struct clk {
 };
 
 extern struct clk *mcf_clks[];
+
+#ifdef MCFPM_PPMCR0
 extern struct clk_ops clk_ops0;
 #ifdef MCFPM_PPMCR1
 extern struct clk_ops clk_ops1;
@@ -38,6 +39,12 @@ static struct clk __clk_##clk_bank##_##clk_slot = { \
 
 void __clk_init_enabled(struct clk *);
 void __clk_init_disabled(struct clk *);
+#else
+#define DEFINE_CLK(clk_ref, clk_name, clk_rate) \
+        static struct clk clk_##clk_ref = { \
+                .name = clk_name, \
+                .rate = clk_rate, \
+        }
 #endif /* MCFPM_PPMCR0 */
 
 #endif /* mcfclk_h */
-- 
1.7.0.4
