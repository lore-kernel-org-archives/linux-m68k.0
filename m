From: Nicholas Krause <xerofoify@gmail.com>
Subject: [PATCH] m68k: Remove unneeded FIXME message in sun3_pgalloc.h
Date: Wed, 16 Jul 2014 22:13:37 -0400
Message-ID: <1405563217-9628-1-git-send-email-xerofoify__3271.55833733759$1405563273$gmane$org@gmail.com>
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: sammy@sammy.net
Cc: geert@linux-m68k.org, linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org

This removes a FIX ME message due to this file not compiling.
Now that this message is no longer needed I am removing it
from sun3_pgalloc.h.

Signed-off-by: Nicholas Krause <xerofoify@gmail.com>
---
 arch/m68k/include/asm/sun3_pgalloc.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/m68k/include/asm/sun3_pgalloc.h b/arch/m68k/include/asm/sun3_pgalloc.h
index f868506..66644f3 100644
--- a/arch/m68k/include/asm/sun3_pgalloc.h
+++ b/arch/m68k/include/asm/sun3_pgalloc.h
@@ -12,8 +12,6 @@
 
 #include <asm/tlb.h>
 
-/* FIXME - when we get this compiling */
-/* erm, now that it's compiling, what do we do with it? */
 #define _KERNPG_TABLE 0
 
 extern const char bad_pmd_string[];
-- 
1.9.1
