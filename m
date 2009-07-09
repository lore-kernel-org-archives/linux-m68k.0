From: Alexey Dobriyan <adobriyan@gmail.com>
Subject: [PATCH] m68k: fix compilation
Date: Thu, 9 Jul 2009 17:08:38 +0400
Message-ID: <20090709130838.GA32685@x200.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: geert@linux-m68k.org, zippel@linux-m68k.org
Cc: linux-m68k@lists.linux-m68k.org

* pgprot_noncached() should be defined _before_ including asm-generic/pgtable.h
* kunmap() wants struct page *, not pte

Signed-off-by: Alexey Dobriyan <adobriyan@gmail.com>
---

 arch/m68k/include/asm/motorola_pgalloc.h |    2 +-
 arch/m68k/include/asm/pgtable_mm.h       |    3 +--
 2 files changed, 2 insertions(+), 3 deletions(-)

commit 85dc40e8bc39f106fdf926739acfd23c2a574d9a
Author: Alexey <adobriyan@gmail.com>
Date:   Thu Jul 9 07:41:54 2009 +0400

    m68k fix

--- a/arch/m68k/include/asm/motorola_pgalloc.h
+++ b/arch/m68k/include/asm/motorola_pgalloc.h
@@ -41,7 +41,7 @@ static inline pgtable_t pte_alloc_one(struct mm_struct *mm, unsigned long addres
 		flush_tlb_kernel_page(pte);
 		nocache_page(pte);
 	}
-	kunmap(pte);
+	kunmap(page);
 	pgtable_page_ctor(page);
 	return page;
 }
--- a/arch/m68k/include/asm/pgtable_mm.h
+++ b/arch/m68k/include/asm/pgtable_mm.h
@@ -135,8 +135,6 @@ static inline void update_mmu_cache(struct vm_area_struct *vma,
 #endif
 
 #ifndef __ASSEMBLY__
-#include <asm-generic/pgtable.h>
-
 /*
  * Macro to mark a page protection value as "uncacheable".
  */
@@ -154,6 +152,7 @@ static inline void update_mmu_cache(struct vm_area_struct *vma,
 	    ? (__pgprot((pgprot_val(prot) & _CACHEMASK040) | _PAGE_NOCACHE_S))	\
 	    : (prot)))
 
+#include <asm-generic/pgtable.h>
 #endif /* !__ASSEMBLY__ */
 
 /*
