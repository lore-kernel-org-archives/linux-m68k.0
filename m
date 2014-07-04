From: Nicholas Krause <xerofoify@gmail.com>
Subject: [PATCH] m68k: Remove define statement no longer needed
Date: Fri,  4 Jul 2014 12:29:53 -0400
Message-ID: <1404491393-4286-1-git-send-email-xerofoify__3245.49983856759$1404491429$gmane$org@gmail.com>
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: sammy@sammy.net
Cc: geert@linux-m68k.org, linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org

In the file sun3_pgalloc.h we should remove #define_KERNPG_TABLE equals 0
as this define statement hasn't been used since kernel verison 2.15.8 and
is now no longer needed.

Signed-off-by: Nicholas Krause <xerofoify@gmail.com>
---
 arch/m68k/include/asm/sun3_pgalloc.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/m68k/include/asm/sun3_pgalloc.h b/arch/m68k/include/asm/sun3_pgalloc.h
index f868506..0931388 100644
--- a/arch/m68k/include/asm/sun3_pgalloc.h
+++ b/arch/m68k/include/asm/sun3_pgalloc.h
@@ -12,10 +12,6 @@
 
 #include <asm/tlb.h>
 
-/* FIXME - when we get this compiling */
-/* erm, now that it's compiling, what do we do with it? */
-#define _KERNPG_TABLE 0
-
 extern const char bad_pmd_string[];
 
 #define pmd_alloc_one(mm,address)       ({ BUG(); ((pmd_t *)2); })
-- 
1.9.1
