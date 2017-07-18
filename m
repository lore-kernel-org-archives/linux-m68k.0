From: Jonas Gorski <jonas.gorski@gmail.com>
Subject: [PATCH 4/9] m68k: allow NULL clock for clk_get_rate
Date: Tue, 18 Jul 2017 12:17:25 +0200
Message-ID: <20170718101730.2541-5-jonas.gorski__179.028782486235$1500373162$gmane$org@gmail.com>
References: <20170718101730.2541-1-jonas.gorski@gmail.com>
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <20170718101730.2541-1-jonas.gorski@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
Cc: Greg Ungerer <gerg@linux-m68k.org>, Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org

Make the behaviour of clk_get_rate consistent with common clk's
clk_get_rate by accepting NULL clocks as parameter. Some device
drivers rely on this, and will cause an OOPS otherwise.

Fixes: facdf0ed4f59 ("m68knommu: introduce basic clk infrastructure")
Cc: Greg Ungerer <gerg@linux-m68k.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org
Cc: linux-kernel@vger.kernel.org
Reported-by: Mathias Kresin <dev@kresin.me>
Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
---
 arch/m68k/coldfire/clk.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/m68k/coldfire/clk.c b/arch/m68k/coldfire/clk.c
index 1e3c7e9193d1..856069a3196d 100644
--- a/arch/m68k/coldfire/clk.c
+++ b/arch/m68k/coldfire/clk.c
@@ -121,6 +121,9 @@ EXPORT_SYMBOL(clk_put);
 
 unsigned long clk_get_rate(struct clk *clk)
 {
+	if (!clk)
+		return 0;
+
 	return clk->rate;
 }
 EXPORT_SYMBOL(clk_get_rate);
-- 
2.11.0
