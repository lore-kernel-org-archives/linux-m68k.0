From: Ben Hutchings <ben@decadent.org.uk>
Subject: [PATCH 3.16 054/133] m68k: allow NULL clock for clk_get_rate
Date: Wed, 22 Nov 2017 01:58:13 +0000
Message-ID: <lsq.1511315893.982088477__33831.613607663$1511317623$gmane$org@decadent.org.uk>
References: <lsq.1511315892.657723235@decadent.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <lsq.1511315892.657723235@decadent.org.uk>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc: akpm@linux-foundation.org, Mathias Kresin <dev@kresin.me>, linux-m68k@lists.linux-m68k.org, Geert Uytterhoeven <geert@linux-m68k.org>, Greg Ungerer <gerg@linux-m68k.org>, Jonas Gorski <jonas.gorski@gmail.com>

3.16.51-rc1 review patch.  If anyone has any objections, please let me know.

------------------

From: Jonas Gorski <jonas.gorski@gmail.com>

commit 94b282267c2f3af725b154c91275ed374c1f11de upstream.

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
Signed-off-by: Greg Ungerer <gerg@linux-m68k.org>
[bwh: Backported to 3.16: adjust filename]
Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
---
 arch/m68k/platform/coldfire/clk.c | 3 +++
 1 file changed, 3 insertions(+)

--- a/arch/m68k/platform/coldfire/clk.c
+++ b/arch/m68k/platform/coldfire/clk.c
@@ -117,6 +117,9 @@ EXPORT_SYMBOL(clk_put);
 
 unsigned long clk_get_rate(struct clk *clk)
 {
+	if (!clk)
+		return 0;
+
 	return clk->rate;
 }
 EXPORT_SYMBOL(clk_get_rate);
