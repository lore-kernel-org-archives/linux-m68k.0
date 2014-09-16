From: Fabian Frederick <fabf@skynet.be>
Subject: [PATCH 1/1 linux-next] m68k/coldfire: remove second asm/mcfclk.h inclusion in m54xx.c
Date: Tue, 16 Sep 2014 20:43:33 +0200
Message-ID: <1410893014-32665-1-git-send-email-fabf@skynet.be>
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Fabian Frederick <fabf@skynet.be>, Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@lists.linux-m68k.org

asm/mcfclk.h was included twice.

Signed-off-by: Fabian Frederick <fabf@skynet.be>
---
 arch/m68k/coldfire/m54xx.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/m68k/coldfire/m54xx.c b/arch/m68k/coldfire/m54xx.c
index eec7f71..075aaab 100644
--- a/arch/m68k/coldfire/m54xx.c
+++ b/arch/m68k/coldfire/m54xx.c
@@ -23,7 +23,6 @@
 #include <asm/mcfuart.h>
 #include <asm/mcfclk.h>
 #include <asm/m54xxgpt.h>
-#include <asm/mcfclk.h>
 #ifdef CONFIG_MMU
 #include <asm/mmu_context.h>
 #endif
-- 
2.1.0
