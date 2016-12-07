From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 19/22] m68k/mm: motorola - Modernize printing of kernel messages
Date: Wed,  7 Dec 2016 16:09:17 +0100
Message-ID: <1481123360-10978-20-git-send-email-geert__7986.69372820786$1481123896$gmane$org@linux-m68k.org>
References: <1481123360-10978-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1481123360-10978-1-git-send-email-geert@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Greg Ungerer <gerg@linux-m68k.org>, Sam Creasey <sammy@sammy.net>, Joshua Thompson <funaho@jurai.org>, Finn Thain <fthain@telegraphics.com.au>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>

  - Convert from printk() to pr_*(),
  - Remove #undef DEBUG,
  - Add missing continuations.

Note that "#ifdef DEBUG" is sometimes retained because pr_cont() is not
optimized away when debugging is disabled.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 arch/m68k/include/asm/motorola_pgtable.h |  6 +++---
 arch/m68k/mm/motorola.c                  | 32 ++++++++++++--------------------
 2 files changed, 15 insertions(+), 23 deletions(-)

diff --git a/arch/m68k/include/asm/motorola_pgtable.h b/arch/m68k/include/asm/motorola_pgtable.h
index 0085aab80e5a76aa..df651bdd5f21f3b7 100644
--- a/arch/m68k/include/asm/motorola_pgtable.h
+++ b/arch/m68k/include/asm/motorola_pgtable.h
@@ -153,11 +153,11 @@ static inline void pgd_set(pgd_t *pgdp, pmd_t *pmdp)
 #define pgd_page(pgd)		(mem_map + ((unsigned long)(__va(pgd_val(pgd)) - PAGE_OFFSET) >> PAGE_SHIFT))
 
 #define pte_ERROR(e) \
-	printk("%s:%d: bad pte %08lx.\n", __FILE__, __LINE__, pte_val(e))
+	pr_err("%s:%d: bad pte %08lx.\n", __FILE__, __LINE__, pte_val(e))
 #define pmd_ERROR(e) \
-	printk("%s:%d: bad pmd %08lx.\n", __FILE__, __LINE__, pmd_val(e))
+	pr_err("%s:%d: bad pmd %08lx.\n", __FILE__, __LINE__, pmd_val(e))
 #define pgd_ERROR(e) \
-	printk("%s:%d: bad pgd %08lx.\n", __FILE__, __LINE__, pgd_val(e))
+	pr_err("%s:%d: bad pgd %08lx.\n", __FILE__, __LINE__, pgd_val(e))
 
 
 /*
diff --git a/arch/m68k/mm/motorola.c b/arch/m68k/mm/motorola.c
index 8f37fdd80be9e9cc..9f83a70c796c3303 100644
--- a/arch/m68k/mm/motorola.c
+++ b/arch/m68k/mm/motorola.c
@@ -32,8 +32,6 @@
 #endif
 #include <asm/sections.h>
 
-#undef DEBUG
-
 #ifndef mm_cachebits
 /*
  * Bits to add to page descriptors for "normal" caching mode.
@@ -86,9 +84,7 @@ static pmd_t * __init kernel_ptr_table(void)
 		}
 
 		last_pgtable = (pmd_t *)last;
-#ifdef DEBUG
-		printk("kernel_ptr_init: %p\n", last_pgtable);
-#endif
+		pr_debug("kernel_ptr_init: %p\n", last_pgtable);
 	}
 
 	last_pgtable += PTRS_PER_PMD;
@@ -124,7 +120,7 @@ static void __init map_node(int node)
 	while (size > 0) {
 #ifdef DEBUG
 		if (!(virtaddr & (PTRTREESIZE-1)))
-			printk ("\npa=%#lx va=%#lx ", physaddr & PAGE_MASK,
+			pr_cont("\npa=%#lx va=%#lx ", physaddr & PAGE_MASK,
 				virtaddr);
 #endif
 		pgd_dir = pgd_offset_k(virtaddr);
@@ -132,7 +128,7 @@ static void __init map_node(int node)
 			if (!(virtaddr & (ROOTTREESIZE-1)) &&
 			    size >= ROOTTREESIZE) {
 #ifdef DEBUG
-				printk ("[very early term]");
+				pr_cont("[very early term]");
 #endif
 				pgd_val(*pgd_dir) = physaddr;
 				size -= ROOTTREESIZE;
@@ -144,7 +140,7 @@ static void __init map_node(int node)
 		if (!pgd_present(*pgd_dir)) {
 			pmd_dir = kernel_ptr_table();
 #ifdef DEBUG
-			printk ("[new pointer %p]", pmd_dir);
+			pr_cont("[new pointer %p]", pmd_dir);
 #endif
 			pgd_set(pgd_dir, pmd_dir);
 		} else
@@ -153,14 +149,14 @@ static void __init map_node(int node)
 		if (CPU_IS_020_OR_030) {
 			if (virtaddr) {
 #ifdef DEBUG
-				printk ("[early term]");
+				pr_cont("[early term]");
 #endif
 				pmd_dir->pmd[(virtaddr/PTRTREESIZE) & 15] = physaddr;
 				physaddr += PTRTREESIZE;
 			} else {
 				int i;
 #ifdef DEBUG
-				printk ("[zero map]");
+				pr_cont("[zero map]");
 #endif
 				zero_pgtable = kernel_ptr_table();
 				pte_dir = (pte_t *)zero_pgtable;
@@ -176,7 +172,7 @@ static void __init map_node(int node)
 		} else {
 			if (!pmd_present(*pmd_dir)) {
 #ifdef DEBUG
-				printk ("[new table]");
+				pr_cont("[new table]");
 #endif
 				pte_dir = kernel_page_table();
 				pmd_set(pmd_dir, pte_dir);
@@ -195,7 +191,7 @@ static void __init map_node(int node)
 
 	}
 #ifdef DEBUG
-	printk("\n");
+	pr_cont("\n");
 #endif
 }
 
@@ -210,9 +206,7 @@ void __init paging_init(void)
 	unsigned long addr, size, end;
 	int i;
 
-#ifdef DEBUG
-	printk ("start of paging_init (%p, %lx)\n", kernel_pg_dir, availmem);
-#endif
+	pr_debug("start of paging_init (%p, %lx)\n", kernel_pg_dir, availmem);
 
 	/* Fix the cache mode in the page descriptors for the 680[46]0.  */
 	if (CPU_IS_040_OR_060) {
@@ -228,9 +222,9 @@ void __init paging_init(void)
 	max_addr = min_addr + m68k_memory[0].size;
 	for (i = 1; i < m68k_num_memory;) {
 		if (m68k_memory[i].addr < min_addr) {
-			printk("Ignoring memory chunk at 0x%lx:0x%lx before the first chunk\n",
+			pr_warn("Ignoring memory chunk at 0x%lx:0x%lx before the first chunk\n",
 				m68k_memory[i].addr, m68k_memory[i].size);
-			printk("Fix your bootloader or use a memfile to make use of this area!\n");
+			pr_warn("Fix your bootloader or use a memfile to make use of this area!\n");
 			m68k_num_memory--;
 			memmove(m68k_memory + i, m68k_memory + i + 1,
 				(m68k_num_memory - i) * sizeof(struct m68k_mem_info));
@@ -294,9 +288,7 @@ void __init paging_init(void)
 	 */
 	set_fs(KERNEL_DS);
 
-#ifdef DEBUG
-	printk ("before free_area_init\n");
-#endif
+	pr_debug("before free_area_init\n");
 	for (i = 0; i < m68k_num_memory; i++) {
 		zones_size[ZONE_DMA] = m68k_memory[i].size >> PAGE_SHIFT;
 		free_area_init_node(i, zones_size,
-- 
1.9.1
