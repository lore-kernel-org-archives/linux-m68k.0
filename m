From: <gerg@snapgear.com>
Subject: [PATCH 26/35] m68k: create ColdFire MMU pgalloc code
Date: Fri, 25 Nov 2011 13:41:11 +1000
Message-ID: <1322192480-22822-27-git-send-email-gerg@snapgear.com>
References: <1322192480-22822-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from dalsmrelay2.nai.com ([205.227.136.216]:53467 "EHLO
	dalsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752647Ab1KYDji (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 24 Nov 2011 22:39:38 -0500
In-Reply-To: <1322192480-22822-1-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

Add code to support the ColdFire V4e MMU pgalloc functions.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 arch/m68k/include/asm/mcf_pgalloc.h |  102 +++++++++++++++++++++++++++++++++++
 arch/m68k/include/asm/pgalloc.h     |    4 +-
 2 files changed, 105 insertions(+), 1 deletions(-)
 create mode 100644 arch/m68k/include/asm/mcf_pgalloc.h

diff --git a/arch/m68k/include/asm/mcf_pgalloc.h b/arch/m68k/include/asm/mcf_pgalloc.h
new file mode 100644
index 0000000..313f3dd
--- /dev/null
+++ b/arch/m68k/include/asm/mcf_pgalloc.h
@@ -0,0 +1,102 @@
+#ifndef M68K_MCF_PGALLOC_H
+#define M68K_MCF_PGALLOC_H
+
+#include <asm/tlb.h>
+#include <asm/tlbflush.h>
+
+extern inline void pte_free_kernel(struct mm_struct *mm, pte_t *pte)
+{
+	free_page((unsigned long) pte);
+}
+
+extern const char bad_pmd_string[];
+
+extern inline pte_t *pte_alloc_one_kernel(struct mm_struct *mm,
+	unsigned long address)
+{
+	unsigned long page = __get_free_page(GFP_DMA|__GFP_REPEAT);
+
+	if (!page)
+		return NULL;
+
+	memset((void *)page, 0, PAGE_SIZE);
+	return (pte_t *) (page);
+}
+
+extern inline pmd_t *pmd_alloc_kernel(pgd_t *pgd, unsigned long address)
+{
+	return (pmd_t *) pgd;
+}
+
+#define pmd_alloc_one_fast(mm, address) ({ BUG(); ((pmd_t *)1); })
+#define pmd_alloc_one(mm, address)      ({ BUG(); ((pmd_t *)2); })
+
+#define pte_alloc_one_fast(mm, addr) pte_alloc_one(mm, addr)
+
+#define pmd_populate(mm, pmd, page) (pmd_val(*pmd) = \
+	(unsigned long)(page_address(page)))
+
+#define pmd_populate_kernel(mm, pmd, pte) (pmd_val(*pmd) = (unsigned long)(pte))
+
+#define pmd_pgtable(pmd) pmd_page(pmd)
+
+static inline void __pte_free_tlb(struct mmu_gather *tlb, pgtable_t page,
+				  unsigned long address)
+{
+	__free_page(page);
+}
+
+#define __pmd_free_tlb(tlb, pmd, address) do { } while (0)
+
+static inline struct page *pte_alloc_one(struct mm_struct *mm,
+	unsigned long address)
+{
+	struct page *page = alloc_pages(GFP_DMA|__GFP_REPEAT, 0);
+	pte_t *pte;
+
+	if (!page)
+		return NULL;
+
+	pte = kmap(page);
+	if (pte) {
+		clear_page(pte);
+		__flush_page_to_ram(pte);
+		flush_tlb_kernel_page(pte);
+		nocache_page(pte);
+	}
+	kunmap(page);
+
+	return page;
+}
+
+extern inline void pte_free(struct mm_struct *mm, struct page *page)
+{
+	__free_page(page);
+}
+
+/*
+ * In our implementation, each pgd entry contains 1 pmd that is never allocated
+ * or freed.  pgd_present is always 1, so this should never be called. -NL
+ */
+#define pmd_free(mm, pmd) BUG()
+
+static inline void pgd_free(struct mm_struct *mm, pgd_t *pgd)
+{
+	free_page((unsigned long) pgd);
+}
+
+static inline pgd_t *pgd_alloc(struct mm_struct *mm)
+{
+	pgd_t *new_pgd;
+
+	new_pgd = (pgd_t *)__get_free_page(GFP_DMA | __GFP_NOWARN);
+	if (!new_pgd)
+		return NULL;
+	memcpy(new_pgd, swapper_pg_dir, PAGE_SIZE);
+	memset(new_pgd, 0, PAGE_OFFSET >> PGDIR_SHIFT);
+	return new_pgd;
+}
+
+#define pgd_populate(mm, pmd, pte) BUG()
+
+#endif /* M68K_MCF_PGALLOC_H */
diff --git a/arch/m68k/include/asm/pgalloc.h b/arch/m68k/include/asm/pgalloc.h
index c294aad..37bee7e 100644
--- a/arch/m68k/include/asm/pgalloc.h
+++ b/arch/m68k/include/asm/pgalloc.h
@@ -7,7 +7,9 @@
 
 #ifdef CONFIG_MMU
 #include <asm/virtconvert.h>
-#ifdef CONFIG_SUN3
+#if defined(CONFIG_COLDFIRE)
+#include <asm/mcf_pgalloc.h>
+#elif defined(CONFIG_SUN3)
 #include <asm/sun3_pgalloc.h>
 #else
 #include <asm/motorola_pgalloc.h>
-- 
1.7.0.4
