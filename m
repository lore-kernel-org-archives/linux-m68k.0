From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 01/16] block/z2ram: Remove duplicate external declarations
Date: Wed, 16 Oct 2013 14:31:18 +0200
Message-ID: <1381926693-6392-2-git-send-email-geert__9139.07656581632$1381926967$gmane$org@linux-m68k.org>
References: <1381926693-6392-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1381926693-6392-1-git-send-email-geert@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@lists.linux-m68k.org
Cc: linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>

Remove the external declarations for m68k_realnum_memory and m68k_memory,
which are already provided by <asm/setup.h>, to avoid conflicts later.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 drivers/block/z2ram.c |    3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/block/z2ram.c b/drivers/block/z2ram.c
index 8b2a60cee3a0..27de5046708a 100644
--- a/drivers/block/z2ram.c
+++ b/drivers/block/z2ram.c
@@ -43,9 +43,6 @@
 #include <linux/zorro.h>
 
 
-extern int m68k_realnum_memory;
-extern struct mem_info m68k_memory[NUM_MEMINFO];
-
 #define Z2MINOR_COMBINED      (0)
 #define Z2MINOR_Z2ONLY        (1)
 #define Z2MINOR_CHIPONLY      (2)
-- 
1.7.9.5
