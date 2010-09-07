From: Greg Ungerer <gerg@snapgear.com>
Subject: [PATCH] m68k/m68knommu: clean up page.h
Date: Tue, 7 Sep 2010 15:49:10 +1000
Message-ID: <201009070549.o875nAZp008037@goober.internal.moreton.com.au>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from dalsmrelay2.nai.com ([205.227.136.216]:36523 "HELO
	dalsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1751083Ab0IGFtU (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 7 Sep 2010 01:49:20 -0400
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org
Cc: gerg@uclinux.org

m68k/m68knommu: clean up page.h

There is a lot of common defines in the MMU and non-MMU variants of
page.h. Factor out the common stuff into the master page.h. It still
includes the underlying page_mm.h or page_no.h, but they only contain
the real differences now.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/include/asm/page.h    |   48 +++++++++++++++++++++++++++++++++++-
 arch/m68k/include/asm/page_mm.h |   49 ++-----------------------------------
 arch/m68k/include/asm/page_no.h |   51 ++++----------------------------------
 3 files changed, 55 insertions(+), 93 deletions(-)

diff --git a/arch/m68k/include/asm/page.h b/arch/m68k/include/asm/page.h
index f2b4480..dfebb7c 100644
--- a/arch/m68k/include/asm/page.h
+++ b/arch/m68k/include/asm/page.h
@@ -1,5 +1,49 @@
-#ifdef __uClinux__
-#include "page_no.h"
+#ifndef _M68K_PAGE_H
+#define _M68K_PAGE_H
+
+#include <linux/const.h>
+#include <asm/setup.h>
+#include <asm/page_offset.h>
+
+/* PAGE_SHIFT determines the page size */
+#ifndef CONFIG_SUN3
+#define PAGE_SHIFT	(12)
 #else
+#define PAGE_SHIFT	(13)
+#endif
+#define PAGE_SIZE	(_AC(1, UL) << PAGE_SHIFT)
+#define PAGE_MASK	(~(PAGE_SIZE-1))
+#define PAGE_OFFSET	(PAGE_OFFSET_RAW)
+
+#ifndef __ASSEMBLY__
+
+/*
+ * These are used to make use of C type-checking..
+ */
+typedef struct { unsigned long pte; } pte_t;
+typedef struct { unsigned long pmd[16]; } pmd_t;
+typedef struct { unsigned long pgd; } pgd_t;
+typedef struct { unsigned long pgprot; } pgprot_t;
+typedef struct page *pgtable_t;
+
+#define pte_val(x)	((x).pte)
+#define pmd_val(x)	((&x)->pmd[0])
+#define pgd_val(x)	((x).pgd)
+#define pgprot_val(x)	((x).pgprot)
+
+#define __pte(x)	((pte_t) { (x) } )
+#define __pmd(x)	((pmd_t) { (x) } )
+#define __pgd(x)	((pgd_t) { (x) } )
+#define __pgprot(x)	((pgprot_t) { (x) } )
+
+#endif /* !__ASSEMBLY__ */
+
+#ifdef CONFIG_MMU
 #include "page_mm.h"
+#else
+#include "page_no.h"
 #endif
+
+#include <asm-generic/getorder.h>
+
+#endif /* _M68K_PAGE_H */
diff --git a/arch/m68k/include/asm/page_mm.h b/arch/m68k/include/asm/page_mm.h
index eeb6764..66f0b39 100644
--- a/arch/m68k/include/asm/page_mm.h
+++ b/arch/m68k/include/asm/page_mm.h
@@ -1,23 +1,9 @@
-#ifndef _M68K_PAGE_H
-#define _M68K_PAGE_H
-
-#include <linux/const.h>
-
-/* PAGE_SHIFT determines the page size */
-#ifndef CONFIG_SUN3
-#define PAGE_SHIFT	(12)
-#else
-#define PAGE_SHIFT	(13)
-#endif
-#define PAGE_SIZE	(_AC(1, UL) << PAGE_SHIFT)
-#define PAGE_MASK	(~(PAGE_SIZE-1))
-
-#include <asm/setup.h>
+#ifndef _M68K_PAGE_MM_H
+#define _M68K_PAGE_MM_H
 
 #ifndef __ASSEMBLY__
 
 #include <linux/compiler.h>
-
 #include <asm/module.h>
 
 #define get_user_page(vaddr)		__get_free_page(GFP_KERNEL)
@@ -78,33 +64,6 @@ static inline void clear_page(void *page)
 		flush_dcache_page(page);	\
 	} while (0)
 
-/*
- * These are used to make use of C type-checking..
- */
-typedef struct { unsigned long pte; } pte_t;
-typedef struct { unsigned long pmd[16]; } pmd_t;
-typedef struct { unsigned long pgd; } pgd_t;
-typedef struct { unsigned long pgprot; } pgprot_t;
-typedef struct page *pgtable_t;
-
-#define pte_val(x)	((x).pte)
-#define pmd_val(x)	((&x)->pmd[0])
-#define pgd_val(x)	((x).pgd)
-#define pgprot_val(x)	((x).pgprot)
-
-#define __pte(x)	((pte_t) { (x) } )
-#define __pmd(x)	((pmd_t) { (x) } )
-#define __pgd(x)	((pgd_t) { (x) } )
-#define __pgprot(x)	((pgprot_t) { (x) } )
-
-#endif /* !__ASSEMBLY__ */
-
-#include <asm/page_offset.h>
-
-#define PAGE_OFFSET		(PAGE_OFFSET_RAW)
-
-#ifndef __ASSEMBLY__
-
 extern unsigned long m68k_memoffset;
 
 #ifndef CONFIG_SUN3
@@ -217,6 +176,4 @@ static inline __attribute_const__ int __virt_to_node_shift(void)
 #define VM_DATA_DEFAULT_FLAGS	(VM_READ | VM_WRITE | VM_EXEC | \
 				 VM_MAYREAD | VM_MAYWRITE | VM_MAYEXEC)
 
-#include <asm-generic/getorder.h>
-
-#endif /* _M68K_PAGE_H */
+#endif /* _M68K_PAGE_MM_H */
diff --git a/arch/m68k/include/asm/page_no.h b/arch/m68k/include/asm/page_no.h
index 8029a33..9059572 100644
--- a/arch/m68k/include/asm/page_no.h
+++ b/arch/m68k/include/asm/page_no.h
@@ -1,18 +1,11 @@
-#ifndef _M68KNOMMU_PAGE_H
-#define _M68KNOMMU_PAGE_H
-
-#include <linux/const.h>
-
-/* PAGE_SHIFT determines the page size */
-
-#define PAGE_SHIFT	(12)
-#define PAGE_SIZE	(_AC(1,UL) << PAGE_SHIFT)
-#define PAGE_MASK	(~(PAGE_SIZE-1))
-
-#include <asm/setup.h>
+#ifndef _M68K_PAGE_NO_H
+#define _M68K_PAGE_NO_H
 
 #ifndef __ASSEMBLY__
  
+extern unsigned long memory_start;
+extern unsigned long memory_end;
+
 #define get_user_page(vaddr)		__get_free_page(GFP_KERNEL)
 #define free_user_page(page, addr)	free_page(addr)
 
@@ -26,36 +19,6 @@
 	alloc_page_vma(GFP_HIGHUSER | __GFP_ZERO | movableflags, vma, vaddr)
 #define __HAVE_ARCH_ALLOC_ZEROED_USER_HIGHPAGE
 
-/*
- * These are used to make use of C type-checking..
- */
-typedef struct { unsigned long pte; } pte_t;
-typedef struct { unsigned long pmd[16]; } pmd_t;
-typedef struct { unsigned long pgd; } pgd_t;
-typedef struct { unsigned long pgprot; } pgprot_t;
-typedef struct page *pgtable_t;
-
-#define pte_val(x)	((x).pte)
-#define pmd_val(x)	((&x)->pmd[0])
-#define pgd_val(x)	((x).pgd)
-#define pgprot_val(x)	((x).pgprot)
-
-#define __pte(x)	((pte_t) { (x) } )
-#define __pmd(x)	((pmd_t) { (x) } )
-#define __pgd(x)	((pgd_t) { (x) } )
-#define __pgprot(x)	((pgprot_t) { (x) } )
-
-extern unsigned long memory_start;
-extern unsigned long memory_end;
-
-#endif /* !__ASSEMBLY__ */
-
-#include <asm/page_offset.h>
-
-#define PAGE_OFFSET		(PAGE_OFFSET_RAW)
-
-#ifndef __ASSEMBLY__
-
 #define __pa(vaddr)		((unsigned long)(vaddr))
 #define __va(paddr)		((void *)(paddr))
 
@@ -74,6 +37,4 @@ extern unsigned long memory_end;
 
 #endif /* __ASSEMBLY__ */
 
-#include <asm-generic/getorder.h>
-
-#endif /* _M68KNOMMU_PAGE_H */
+#endif /* _M68K_PAGE_NO_H */
-- 
1.6.3.3
