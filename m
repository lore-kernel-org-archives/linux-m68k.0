From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] m68k: Add braces to __pmd(x) initializer to kill compiler warning
Date: Sun, 10 Sep 2017 15:20:03 +0200
Message-ID: <1505049603-25546-1-git-send-email-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, Zi Yan <zi.yan@cs.rutgers.edu>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>

With gcc 4.1.2:

    include/linux/swapops.h: In function ‘swp_entry_to_pmd’:
    include/linux/swapops.h:294: warning: missing braces around initializer
    include/linux/swapops.h:294: warning: (near initialization for ‘(anonymous).pmd’)

Due to a GCC zero initializer bug (#53119), the standard "(pmd_t){ 0 }"
initializer is not accepted by all GCC versions.
In addition, on m68k pmd_t is an array instead of a single value, so we
need "(pmd_t){ { 0 }, }" instead of "(pmd_t){ 0 }".

Based on commit 9157259d16a8ee81 ("mm: add pmd_t initializer __pmd() to
work around a GCC bug.") for sparc32.

Fixes: 616b8371539a6c48 ("mm: thp: enable thp migration in generic path")
Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 arch/m68k/include/asm/page.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/m68k/include/asm/page.h b/arch/m68k/include/asm/page.h
index 430d4d54c88383a9..d8a02c7e72d3e610 100644
--- a/arch/m68k/include/asm/page.h
+++ b/arch/m68k/include/asm/page.h
@@ -32,7 +32,7 @@ typedef struct page *pgtable_t;
 #define pgprot_val(x)	((x).pgprot)
 
 #define __pte(x)	((pte_t) { (x) } )
-#define __pmd(x)	((pmd_t) { (x) } )
+#define __pmd(x)	((pmd_t) { { (x) }, })
 #define __pgd(x)	((pgd_t) { (x) } )
 #define __pgprot(x)	((pgprot_t) { (x) } )
 
-- 
2.7.4
