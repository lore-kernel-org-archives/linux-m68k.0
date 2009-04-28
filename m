From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] m68k: arch/m68k/kernel/sun3-head.S needs <linux/init.h>
Date: Tue, 28 Apr 2009 21:20:11 +0200 (CEST)
Message-ID: <Pine.LNX.4.64.0904282118330.14413@anakin>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1753908AbZD1TUi@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, Tim Abbott <tabbott@mit.edu>
Cc: Sam Ravnborg <sam@ravnborg.org>, Linux/m68k <linux-m68k@vger.kernel.org>, Linux Kernel Development <linux-kernel@vger.kernel.org>
List-Id: linux-m68k@vger.kernel.org

| arch/m68k/kernel/sun3-head.S: Assembler messages:
| arch/m68k/kernel/sun3-head.S:32: Error: Unknown operator -- statement `__head' ignored

Introduced by commit 6f335cab0431d5df4995bcd4fd952d4c746d5a86 ("m68k: convert
to use __HEAD and HEAD_TEXT macros."), which started using __HEAD without
adding the appropriate include.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
Can we please run `trivial' changes through linux-next too, please? Thx!

 arch/m68k/kernel/sun3-head.S |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/arch/m68k/kernel/sun3-head.S b/arch/m68k/kernel/sun3-head.S
index 9e5c3e5..43036bf 100644
--- a/arch/m68k/kernel/sun3-head.S
+++ b/arch/m68k/kernel/sun3-head.S
@@ -1,4 +1,5 @@
 #include <linux/linkage.h>
+#include <linux/init.h>
 
 #include <asm/entry.h>
 #include <asm/page.h>
-- 
1.6.2.4

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
