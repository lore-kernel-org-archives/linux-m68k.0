From: Tobias Klauser <tklauser@distanz.ch>
Subject: [PATCH] m68knommu: Remove unnecessary prototype for kobjsize()
Date: Fri, 20 Jun 2014 09:29:36 +0200
Message-ID: <1403249376-27739-1-git-send-email-tklauser__12719.2221036696$1403249703$gmane$org@distanz.ch>
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Greg Ungerer <gerg@uclinux.org>, Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org

The prototype for kobjsize() is already defined in linux/mm.h which is
included where kobjsize() is used.

Signed-off-by: Tobias Klauser <tklauser@distanz.ch>
---
 arch/m68k/include/asm/pgtable_no.h |    5 -----
 1 file changed, 5 deletions(-)

diff --git a/arch/m68k/include/asm/pgtable_no.h b/arch/m68k/include/asm/pgtable_no.h
index c527fc2..11859b8 100644
--- a/arch/m68k/include/asm/pgtable_no.h
+++ b/arch/m68k/include/asm/pgtable_no.h
@@ -46,11 +46,6 @@ static inline int pte_file(pte_t pte) { return 0; }
 #define ZERO_PAGE(vaddr)	(virt_to_page(0))
 
 /*
- * These would be in other places but having them here reduces the diffs.
- */
-extern unsigned int kobjsize(const void *objp);
-
-/*
  * No page table caches to initialise.
  */
 #define pgtable_cache_init()	do { } while (0)
-- 
1.7.9.5
