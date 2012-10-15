From: Stany MARCEL <stany.marcel@novasys-ingenierie.com>
Subject: [PATCH 3/4] Add for MCF54xx a virtual non cached zone usable for data exchange with DMA
Date: Mon, 15 Oct 2012 14:54:39 +0200
Message-ID: <1350305680-5441-3-git-send-email-stany.marcel@novasys-ingenierie.com>
References: <1350305680-5441-1-git-send-email-stany.marcel@novasys-ingenierie.com>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-wi0-f178.google.com ([209.85.212.178]:34349 "EHLO
	mail-wi0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752262Ab2JOMzF (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 15 Oct 2012 08:55:05 -0400
Received: by mail-wi0-f178.google.com with SMTP id hr7so2048248wib.1
        for <linux-m68k@vger.kernel.org>; Mon, 15 Oct 2012 05:55:05 -0700 (PDT)
In-Reply-To: <1350305680-5441-1-git-send-email-stany.marcel@novasys-ingenierie.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org
Cc: gerg@uclinux.org, Stany MARCEL <stany.marcel@novasys-ingenierie.com>

This permit to share data with DMA without caching issues. M54xx DMA bypass
cache so exchanged data must be flushed before DMA operation. But M54xx cache
opperation does not permit to easily flush concerned data. So this patch permit
to have a non cached zone used for GFP_DMA allocated data.

Signed-off-by: Stany MARCEL <stany.marcel@novasys-ingenierie.com>
---
 arch/m68k/Kconfig.machine           |   32 +++++++++++++++++
 arch/m68k/include/asm/dma.h         |    8 +++++
 arch/m68k/include/asm/m54xxacr.h    |   11 ++++++
 arch/m68k/include/asm/mcf_pgalloc.h |    6 ++--
 arch/m68k/include/asm/page_mm.h     |   68 ++++++++++++++++++++++++++++++++++-
 arch/m68k/kernel/dma.c              |   14 ++++++++
 arch/m68k/mm/mcfmmu.c               |   38 ++++++++++++++++++++
 arch/m68k/platform/coldfire/head.S  |   31 ++++++++++++++++
 arch/m68k/platform/coldfire/m54xx.c |   21 +++++++++++
 9 files changed, 225 insertions(+), 4 deletions(-)

diff --git a/arch/m68k/Kconfig.machine b/arch/m68k/Kconfig.machine
index 7cdf6b0..f9a4d9d 100644
--- a/arch/m68k/Kconfig.machine
+++ b/arch/m68k/Kconfig.machine
@@ -512,6 +512,38 @@ config KERNELBASE
 	  a system with the RAM based at address 0, and leaving enough room
 	  for the theoretical maximum number of 256 vectors.
 
+config M54xx_DMA_ZONE
+	bool "M54xx non cached virtual zone for DMA"
+	depends on MMU
+	depends on M54xx
+	select SINGLE_MEMORY_CHUNK
+	help
+	  Activate a virtual zone with tlb data entries initialized, in non
+	  cached precise mode. This permit to share data with DMA without caching
+	  issues. M54xx DMA bypass cache so exchanged data must be flushed
+	  before DMA operation. But M54xx cache opperation does not permit to
+	  easily flush concerned data. So this patch permit to have a non cached
+	  zone used for GFP_DMA allocated data.
+
+config M54xx_DMA_ZONE_BASE
+	hex "Address of the base of a vitual non cached zone usable for DMA"
+	depends on M54xx_DMA_ZONE
+	default 0xC0000000
+	help
+	  Define the address of a virtual zone, with tlb data entries
+	  initialized, in non cached precise mode.
+	  Addresse must be 1MB aligned, not already mapped and different than
+	  KMAP and VM memory map
+
+config M54xx_DMA_ZONE_SIZE
+	hex "Size of the vitual non cached zone usable for DMA"
+	depends on M54xx_DMA_ZONE
+	default 0x800000
+	help
+	  Define the size of a virtual zone, with tlb data entries
+	  initialized, in non cached precise mode.
+	  Size must be 1MB divisable.
+
 comment "ROM configuration"
 
 config ROM
diff --git a/arch/m68k/include/asm/dma.h b/arch/m68k/include/asm/dma.h
index 0ff3fc6..04e5d2c 100644
--- a/arch/m68k/include/asm/dma.h
+++ b/arch/m68k/include/asm/dma.h
@@ -479,10 +479,18 @@ static __inline__ int get_dma_residue(unsigned int dmanr)
 #endif /* !defined(CONFIG_M5272) */
 #endif /* CONFIG_COLDFIRE */
 
+#if defined(CONFIG_M54xx_DMA_ZONE)
+
+#define MAX_DMA_ADDRESS (CONFIG_M54xx_DMA_ZONE_BASE + \
+			 CONFIG_M54xx_DMA_ZONE_SIZE - 1)
+
+#else
 /* it's useless on the m68k, but unfortunately needed by the new
    bootmem allocator (but this should do it for this) */
 #define MAX_DMA_ADDRESS PAGE_OFFSET
 
+#endif
+
 #define MAX_DMA_CHANNELS 8
 
 extern int request_dma(unsigned int dmanr, const char * device_id);	/* reserve a DMA channel */
diff --git a/arch/m68k/include/asm/m54xxacr.h b/arch/m68k/include/asm/m54xxacr.h
index 192bbfe..cac5bcd 100644
--- a/arch/m68k/include/asm/m54xxacr.h
+++ b/arch/m68k/include/asm/m54xxacr.h
@@ -94,6 +94,8 @@
  *	register region as non-cacheable. And then we map all our RAM as
  *	cacheable and supervisor access only.
  */
+#ifndef CONFIG_M54xx_DMA_ZONE
+
 #define ACR0_MODE	(ACR_BA(CONFIG_MBAR)+ACR_ADMSK(0x1000000)+ \
 			 ACR_ENABLE+ACR_SUPER+ACR_CM_OFF_PRE+ACR_SP)
 #define ACR1_MODE	(ACR_BA(CONFIG_RAMBASE)+ACR_ADMSK(CONFIG_RAMSIZE)+ \
@@ -104,6 +106,15 @@
 
 #else
 
+#define ACR0_MODE	0xF00FA048
+#define ACR1_MODE	0x000FA028
+#define ACR2_MODE	0x00000000
+#define ACR3_MODE	0x000FA028
+
+#endif /* CONFIG_M54xx_DMA_ZONE */
+
+#else
+
 /*
  *	For the non-MMU enabled case we map all of RAM as cacheable.
  */
diff --git a/arch/m68k/include/asm/mcf_pgalloc.h b/arch/m68k/include/asm/mcf_pgalloc.h
index 313f3dd..7fbb5ce 100644
--- a/arch/m68k/include/asm/mcf_pgalloc.h
+++ b/arch/m68k/include/asm/mcf_pgalloc.h
@@ -14,7 +14,7 @@ extern const char bad_pmd_string[];
 extern inline pte_t *pte_alloc_one_kernel(struct mm_struct *mm,
 	unsigned long address)
 {
-	unsigned long page = __get_free_page(GFP_DMA|__GFP_REPEAT);
+	unsigned long page = __get_free_page(GFP_KERNEL|__GFP_REPEAT);
 
 	if (!page)
 		return NULL;
@@ -51,7 +51,7 @@ static inline void __pte_free_tlb(struct mmu_gather *tlb, pgtable_t page,
 static inline struct page *pte_alloc_one(struct mm_struct *mm,
 	unsigned long address)
 {
-	struct page *page = alloc_pages(GFP_DMA|__GFP_REPEAT, 0);
+	struct page *page = alloc_pages(GFP_KERNEL|__GFP_REPEAT, 0);
 	pte_t *pte;
 
 	if (!page)
@@ -89,7 +89,7 @@ static inline pgd_t *pgd_alloc(struct mm_struct *mm)
 {
 	pgd_t *new_pgd;
 
-	new_pgd = (pgd_t *)__get_free_page(GFP_DMA | __GFP_NOWARN);
+	new_pgd = (pgd_t *)__get_free_page(GFP_KERNEL | __GFP_NOWARN);
 	if (!new_pgd)
 		return NULL;
 	memcpy(new_pgd, swapper_pg_dir, PAGE_SIZE);
diff --git a/arch/m68k/include/asm/page_mm.h b/arch/m68k/include/asm/page_mm.h
index 89f2014..7985ffd 100644
--- a/arch/m68k/include/asm/page_mm.h
+++ b/arch/m68k/include/asm/page_mm.h
@@ -70,6 +70,8 @@ extern unsigned long m68k_memoffset;
 
 #define WANT_PAGE_VIRTUAL
 
+#ifndef CONFIG_M54xx_DMA_ZONE
+
 static inline unsigned long ___pa(void *vaddr)
 {
 	unsigned long paddr;
@@ -91,6 +93,58 @@ static inline void *__va(unsigned long paddr)
 		: "0" (paddr), "i" (m68k_fixup_memoffset));
 	return vaddr;
 }
+#else   /* !CONFIG_M54xx_DMA_ZONE */
+
+extern unsigned long m54xx_dma_base;
+extern unsigned long m54xx_dma_end;
+
+/*
+ * Convert a virt to a phys
+ */
+static inline unsigned long ___pa(void *vaddr)
+{
+#if CONFIG_RAMBASE != PAGE_OFFSET
+	return ((unsigned long)vaddr & 0x0fffffff) + CONFIG_RAMBASE;
+#else
+	if ((unsigned long)vaddr >= CONFIG_M54xx_DMA_ZONE_BASE &&
+	    (unsigned long)vaddr < (CONFIG_M54xx_DMA_ZONE_BASE +
+				    CONFIG_M54xx_DMA_ZONE_SIZE)) {
+		/* address is in carved out DMA range */
+		return ((unsigned long)vaddr - CONFIG_M54xx_DMA_ZONE_BASE)
+			+ CONFIG_RAMBASE;
+	} else if ((unsigned long)vaddr >= PAGE_OFFSET &&
+		   (unsigned long)vaddr < (PAGE_OFFSET + CONFIG_RAMSIZE)) {
+		/* normal mapping */
+		return ((unsigned long)vaddr - PAGE_OFFSET) + CONFIG_RAMBASE;
+	}
+
+	return (unsigned long)vaddr;
+#endif
+}
+#define __pa(vaddr)	___pa((void *)(vaddr))
+
+/*
+ * Convert a phys to a virt
+ */
+static inline void *__va(unsigned long paddr)
+{
+#if CONFIG_RAMBASE != PAGE_OFFSET
+	return (void *)((paddr & 0x0fffffff) + PAGE_OFFSET);
+#else
+	if (paddr >= m54xx_dma_base && paddr <= m54xx_dma_end) {
+		/* mapped address for DMA */
+		return (void *)((paddr - CONFIG_RAMBASE)
+				+ CONFIG_M54xx_DMA_ZONE_BASE);
+	} else if (paddr >= m54xx_dma_end &&
+		   paddr < (CONFIG_RAMBASE + CONFIG_RAMSIZE)) {
+		/* normal mapping */
+		return (void *)((paddr - CONFIG_RAMBASE) + PAGE_OFFSET);
+	}
+	return (void *)paddr;
+#endif
+}
+
+#endif
 
 #else	/* !CONFIG_SUN3 */
 /* This #define is a horrible hack to suppress lots of warnings. --m */
@@ -168,7 +222,19 @@ static inline __attribute_const__ int __virt_to_node_shift(void)
 	((__p) - pgdat->node_mem_map) + pgdat->node_start_pfn;		\
 })
 
-#define virt_addr_valid(kaddr)	((void *)(kaddr) >= (void *)PAGE_OFFSET && (void *)(kaddr) < high_memory)
+#ifndef CONFIG_M54xx_DMA_ZONE
+#define virt_addr_valid(kaddr)				\
+	((void *)(kaddr) >= (void *)PAGE_OFFSET &&	\
+	 (void *)(kaddr) < high_memory)
+#else
+#define virt_addr_valid(kaddr)						\
+	(((void *)(kaddr) >= (void *)PAGE_OFFSET &&			\
+	  (void *)(kaddr) < high_memory) ||				\
+	 ((void *)(kaddr) >= (void *)CONFIG_M54xx_DMA_ZONE_BASE &&	\
+	  (void *)(kaddr) <  (void *)(CONFIG_M54xx_DMA_ZONE_BASE	\
+				      + CONFIG_M54xx_DMA_ZONE_SIZE)))
+#endif
+
 #define pfn_valid(pfn)		virt_addr_valid(pfn_to_virt(pfn))
 
 #endif /* __ASSEMBLY__ */
diff --git a/arch/m68k/kernel/dma.c b/arch/m68k/kernel/dma.c
index e546a55..57873d1 100644
--- a/arch/m68k/kernel/dma.c
+++ b/arch/m68k/kernel/dma.c
@@ -76,6 +76,15 @@ void *dma_alloc_coherent(struct device *dev, size_t size,
 			   dma_addr_t *dma_handle, gfp_t gfp)
 {
 	void *ret;
+#ifdef CONFIG_M54xx_DMA_ZONE
+	/*
+	 * On the M54xx platform with CONFIG_M54xx_DMA_ZONE the memory allocated
+	 * with GFP_DMA is guaranteed to be DMA'able, and cache coherent.
+	 */
+	size = PAGE_ALIGN(size);
+	ret = kmalloc(size, GFP_DMA);
+	*dma_handle = virt_to_phys(ret);
+#else
 	/* ignore region specifiers */
 	gfp &= ~(__GFP_DMA | __GFP_HIGHMEM);
 
@@ -87,13 +96,18 @@ void *dma_alloc_coherent(struct device *dev, size_t size,
 		memset(ret, 0, size);
 		*dma_handle = virt_to_phys(ret);
 	}
+#endif
 	return ret;
 }
 
 void dma_free_coherent(struct device *dev, size_t size,
 			 void *vaddr, dma_addr_t dma_handle)
 {
+#ifdef CONFIG_M54xx_DMA_ZONE
+	kfree((void *)dma_handle);
+#else
 	free_pages((unsigned long)vaddr, get_order(size));
+#endif
 }
 
 #endif /* CONFIG_MMU && !CONFIG_COLDFIRE */
diff --git a/arch/m68k/mm/mcfmmu.c b/arch/m68k/mm/mcfmmu.c
index 875b800..932415b 100644
--- a/arch/m68k/mm/mcfmmu.c
+++ b/arch/m68k/mm/mcfmmu.c
@@ -77,11 +77,49 @@ void __init paging_init(void)
 		}
 	}
 
+#ifdef CONFIG_M54xx_DMA_ZONE
+	/* setup page tables for DMA area */
+	/* starting loc in page directory */
+	pg_dir = swapper_pg_dir + (CONFIG_M54xx_DMA_ZONE_BASE >> PGDIR_SHIFT);
+
+	size = (CONFIG_M54xx_DMA_ZONE_SIZE >> PAGE_SHIFT) * sizeof(pte_t);
+	size = (size + PAGE_SIZE) & ~(PAGE_SIZE-1);
+
+	next_pgtable = (unsigned long)alloc_bootmem_pages(size);
+
+	address = CONFIG_M54xx_DMA_ZONE_BASE;
+	while (address < (CONFIG_M54xx_DMA_ZONE_BASE +
+			  CONFIG_M54xx_DMA_ZONE_SIZE)) {
+		pg_table = (pte_t *)next_pgtable;
+		next_pgtable += PTRS_PER_PTE * sizeof(pte_t);
+		pgd_val(*pg_dir) = (unsigned long)pg_table;
+		pg_dir++;
+
+		for (i = 0; i < PTRS_PER_PTE; ++i, ++pg_table) {
+			pte_t pte = pfn_pte(virt_to_pfn(address), PAGE_INIT);
+			if (address >= (CONFIG_M54xx_DMA_ZONE_BASE
+					+ CONFIG_M54xx_DMA_ZONE_SIZE))
+				pte_val(pte) = 0;
+
+			set_pte(pg_table, pte);
+			address += PAGE_SIZE;
+		}
+	}
+#endif
 	current->mm = NULL;
 
 	for (zone = 0; zone < MAX_NR_ZONES; zone++)
 		zones_size[zone] = 0x0;
+
+#ifdef CONFIG_M54xx_DMA_ZONE
+	zones_size[ZONE_DMA] = CONFIG_M54xx_DMA_ZONE_SIZE >> PAGE_SHIFT;
+	zones_size[ZONE_NORMAL] =
+		(((unsigned long)high_memory
+		  - PAGE_OFFSET) >> PAGE_SHIFT)
+		- zones_size[ZONE_DMA];
+#else
 	zones_size[ZONE_DMA] = num_pages;
+#endif
 	free_area_init(zones_size);
 }
 
diff --git a/arch/m68k/platform/coldfire/head.S b/arch/m68k/platform/coldfire/head.S
index fa31be2..62b4f17 100644
--- a/arch/m68k/platform/coldfire/head.S
+++ b/arch/m68k/platform/coldfire/head.S
@@ -265,6 +265,37 @@ _clear_bss:
 	cmpl	%a0,%a1				/* check if at end */
 	bne	_clear_bss
 
+
+#ifdef CONFIG_M54xx_DMA_ZONE
+	clrl	%d0
+__mmu_dma_map:
+	/* Set up search of TLB */
+	movel	#CONFIG_M54xx_DMA_ZONE_BASE, %d1
+	addl	%d0,%d1
+	addil	#1,%d1
+	movel	%d1, MMUAR
+	/* Search */
+	movel	#(MMUOR_STLB+MMUOR_ADR), %d1
+	movel   %d1, MMUOR
+	/* Set up tag value */
+	movel	#CONFIG_M54xx_DMA_ZONE_BASE,%d1
+	addl	%d0,%d1
+	addil	#(MMUTR_SG+MMUTR_V),%d1
+	movel	%d1, MMUTR
+	/* Set up data value */
+	movel	#CONFIG_RAMBASE,%d1
+	addl	%d0,%d1
+	addil	#(MMUDR_SZ_1MB+MMUDR_CM_NCP+MMUDR_SP+MMUDR_R+MMUDR_W+MMUDR_LK),%d1
+	movel	%d1, MMUDR
+	/* Save */
+	movel	#(MMUOR_ACC+MMUOR_UAA), %d1
+	movel   %d1, MMUOR
+
+	addil #0x100000,%d0
+	cmpil #CONFIG_M54xx_DMA_ZONE_SIZE,%d0
+	bnes __mmu_dma_map
+#endif
+
 	/*
 	 *	Load the current task pointer and stack.
 	 */
diff --git a/arch/m68k/platform/coldfire/m54xx.c b/arch/m68k/platform/coldfire/m54xx.c
index b587bf3..c207822 100644
--- a/arch/m68k/platform/coldfire/m54xx.c
+++ b/arch/m68k/platform/coldfire/m54xx.c
@@ -23,6 +23,9 @@
 #include <asm/m54xxgpt.h>
 #ifdef CONFIG_MMU
 #include <asm/mmu_context.h>
+#ifdef CONFIG_M54xx_DMA_ZONE
+#include <asm/dma.h>
+#endif
 #endif
 
 /***************************************************************************/
@@ -56,6 +59,17 @@ static void mcf54xx_reset(void)
 
 unsigned long num_pages;
 
+#ifdef CONFIG_M54xx_DMA_ZONE
+/* cf dma physical addresses */
+unsigned long m54xx_dma_base;
+EXPORT_SYMBOL(m54xx_dma_base);
+unsigned long m54xx_dma_end;
+EXPORT_SYMBOL(m54xx_dma_end);
+unsigned long m54xx_dma_size;
+EXPORT_SYMBOL(m54xx_dma_size);
+#endif
+
+
 static void __init mcf54xx_bootmem_alloc(void)
 {
 	unsigned long start_pfn;
@@ -83,6 +97,13 @@ static void __init mcf54xx_bootmem_alloc(void)
 	memstart += init_bootmem_node(NODE_DATA(0), start_pfn,
 		min_low_pfn, max_low_pfn);
 	free_bootmem_node(NODE_DATA(0), memstart, _ramend - memstart);
+
+#ifdef CONFIG_M54xx_DMA_ZONE
+	/* configure physical dma area */
+	m54xx_dma_base = __pa(PAGE_ALIGN(_ramstart));
+	m54xx_dma_size = CONFIG_M54xx_DMA_ZONE_SIZE;
+	m54xx_dma_end  = CONFIG_RAMBASE + m54xx_dma_size - 1;
+#endif /* CONFIG_M54xx_DMA_ZONE */
 }
 
 #endif /* CONFIG_MMU */
-- 
1.7.9.5
