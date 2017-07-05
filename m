From: Joe Perches <joe@perches.com>
Subject: [PATCH 08/18] m68k: coldfire: Move inline before return type
Date: Wed,  5 Jul 2017 13:02:17 -0700
Message-ID: <14db9c166d5b68efa77e337cfe49bb9b29bca3f7.1499284835.git.joe__11111.6791995757$1499285443$gmane$org@perches.com>
References: <cover.1499284835.git.joe@perches.com>
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <cover.1499284835.git.joe@perches.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>, Greg Ungerer <gerg@linux-m68k.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org

Make the code like the rest of the kernel.

Signed-off-by: Joe Perches <joe@perches.com>
---
 arch/m68k/coldfire/intc-simr.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/m68k/coldfire/intc-simr.c b/arch/m68k/coldfire/intc-simr.c
index 7cf2c156f72d..15c4b7a6e38f 100644
--- a/arch/m68k/coldfire/intc-simr.c
+++ b/arch/m68k/coldfire/intc-simr.c
@@ -35,7 +35,7 @@
 #define	EINT7	67	/* EDGE Port interrupt 7 */
 
 static unsigned int irqebitmap[] = { 0, 1, 4, 7 };
-static unsigned int inline irq2ebit(unsigned int irq)
+static inline unsigned int irq2ebit(unsigned int irq)
 {
 	return irqebitmap[irq - EINT0];
 }
@@ -51,7 +51,7 @@ static unsigned int inline irq2ebit(unsigned int irq)
 #define	EINT1	65	/* EDGE Port interrupt 1 */
 #define	EINT7	71	/* EDGE Port interrupt 7 */
 
-static unsigned int inline irq2ebit(unsigned int irq)
+static inline unsigned int irq2ebit(unsigned int irq)
 {
 	return irq - EINT0;
 }
-- 
2.10.0.rc2.1.g053435c
