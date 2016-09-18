From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH v4] m68k: let clk_disable() return immediately if clk is NULL
Date: Mon, 19 Sep 2016 03:01:14 +0900
Message-ID: <1474221674-21625-1-git-send-email-yamada.masahiro__8524.56787038154$1474221922$gmane$org@socionext.com>
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@lists.linux-m68k.org
Cc: Stephen Boyd <sboyd@codeaurora.org>, Ralf Baechle <ralf@linux-mips.org>, Michael Turquette <mturquette@baylibre.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Greg Ungerer <gerg@linux-m68k.org>, linux-kernel@vger.kernel.org

In many of clk_disable() implementations, it is a no-op for a NULL
pointer input, but this is one of the exceptions.

Making it treewide consistent will allow clock consumers to call
clk_disable() without NULL pointer check.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
Acked-by: Greg Ungerer <gerg@uclinux.org>
---

Changes in v4:
  - Split into per-arch patches

Changes in v3:
  - Return only when clk is NULL.  Do not take care of error pointer.

Changes in v2:
  - Rebase on Linux 4.6-rc1

 arch/m68k/coldfire/clk.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/m68k/coldfire/clk.c b/arch/m68k/coldfire/clk.c
index fddfdcc..1e3c7e9 100644
--- a/arch/m68k/coldfire/clk.c
+++ b/arch/m68k/coldfire/clk.c
@@ -101,6 +101,10 @@ EXPORT_SYMBOL(clk_enable);
 void clk_disable(struct clk *clk)
 {
 	unsigned long flags;
+
+	if (!clk)
+		return;
+
 	spin_lock_irqsave(&clk_lock, flags);
 	if ((--clk->enabled == 0) && clk->clk_ops)
 		clk->clk_ops->disable(clk);
-- 
1.9.1
