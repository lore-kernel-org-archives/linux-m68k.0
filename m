From: <gerg@snapgear.com>
Subject: [PATCH 12/35] m68k: add page table size definitions for ColdFire V4e MMU
Date: Fri, 23 Dec 2011 13:15:25 +1000
Message-ID: <1324610148-20666-13-git-send-email-gerg@snapgear.com>
References: <1324610148-20666-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:39251 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756353Ab1LWDOw (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 22 Dec 2011 22:14:52 -0500
In-Reply-To: <1324610148-20666-1-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

Define the page table size and attributes for the ColdFire V4e MMU.
Also setup the vmalloc and kmap regions we will use.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Matt Waddel <mwaddel@yahoo.com>
Acked-by: Kurt Mahan <kmahan@xmission.com>
---
 arch/m68k/include/asm/pgtable_mm.h |   30 ++++++++++++++++++++++++------
 1 files changed, 24 insertions(+), 6 deletions(-)

diff --git a/arch/m68k/include/asm/pgtable_mm.h b/arch/m68k/include/asm/pgtable_mm.h
index 87174c9..dc35e0e 100644
--- a/arch/m68k/include/asm/pgtable_mm.h
+++ b/arch/m68k/include/asm/pgtable_mm.h
@@ -40,6 +40,8 @@
 /* PGDIR_SHIFT determines what a third-level page table entry can map */
 #ifdef CONFIG_SUN3
 #define PGDIR_SHIFT     17
+#elif defined(CONFIG_COLDFIRE)
+#define PGDIR_SHIFT     22
 #else
 #define PGDIR_SHIFT	25
 #endif
@@ -54,6 +56,10 @@
 #define PTRS_PER_PTE   16
 #define PTRS_PER_PMD   1
 #define PTRS_PER_PGD   2048
+#elif defined(CONFIG_COLDFIRE)
+#define PTRS_PER_PTE	512
+#define PTRS_PER_PMD	1
+#define PTRS_PER_PGD	1024
 #else
 #define PTRS_PER_PTE	1024
 #define PTRS_PER_PMD	8
@@ -66,12 +72,22 @@
 #ifdef CONFIG_SUN3
 #define KMAP_START     0x0DC00000
 #define KMAP_END       0x0E000000
+#elif defined(CONFIG_COLDFIRE)
+#define KMAP_START	0xe0000000
+#define KMAP_END	0xf0000000
 #else
 #define	KMAP_START	0xd0000000
 #define	KMAP_END	0xf0000000
 #endif
 
-#ifndef CONFIG_SUN3
+#ifdef CONFIG_SUN3
+extern unsigned long m68k_vmalloc_end;
+#define VMALLOC_START 0x0f800000
+#define VMALLOC_END m68k_vmalloc_end
+#elif defined(CONFIG_COLDFIRE)
+#define VMALLOC_START	0xd0000000
+#define VMALLOC_END	0xe0000000
+#else
 /* Just any arbitrary offset to the start of the vmalloc VM area: the
  * current 8MB value just means that there will be a 8MB "hole" after the
  * physical memory until the kernel virtual memory starts.  That means that
@@ -82,11 +98,7 @@
 #define VMALLOC_OFFSET	(8*1024*1024)
 #define VMALLOC_START (((unsigned long) high_memory + VMALLOC_OFFSET) & ~(VMALLOC_OFFSET-1))
 #define VMALLOC_END KMAP_START
-#else
-extern unsigned long m68k_vmalloc_end;
-#define VMALLOC_START 0x0f800000
-#define VMALLOC_END m68k_vmalloc_end
-#endif /* CONFIG_SUN3 */
+#endif
 
 /* zero page used for uninitialized stuff */
 extern void *empty_zero_page;
@@ -130,6 +142,8 @@ static inline void update_mmu_cache(struct vm_area_struct *vma,
 
 #ifdef CONFIG_SUN3
 #include <asm/sun3_pgtable.h>
+#elif defined(CONFIG_COLDFIRE)
+#include <asm/mcf_pgtable.h>
 #else
 #include <asm/motorola_pgtable.h>
 #endif
@@ -138,6 +152,9 @@ static inline void update_mmu_cache(struct vm_area_struct *vma,
 /*
  * Macro to mark a page protection value as "uncacheable".
  */
+#ifdef CONFIG_COLDFIRE
+# define pgprot_noncached(prot) (__pgprot(pgprot_val(prot) | CF_PAGE_NOCACHE))
+#else
 #ifdef SUN3_PAGE_NOCACHE
 # define __SUN3_PAGE_NOCACHE	SUN3_PAGE_NOCACHE
 #else
@@ -152,6 +169,7 @@ static inline void update_mmu_cache(struct vm_area_struct *vma,
 	    ? (__pgprot((pgprot_val(prot) & _CACHEMASK040) | _PAGE_NOCACHE_S))	\
 	    : (prot)))
 
+#endif /* CONFIG_COLDFIRE */
 #include <asm-generic/pgtable.h>
 #endif /* !__ASSEMBLY__ */
 
-- 
1.7.0.4
