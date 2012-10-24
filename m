From: <gerg@snapgear.com>
Subject: [PATCH v2] m68k: merge MMU and non-MMU versions of mm/init.c
Date: Wed, 24 Oct 2012 22:36:27 +1000
Message-ID: <1351082187-15436-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from dnvwsmailout1.mcafee.com ([161.69.31.173]:24266 "EHLO
	DNVWSMAILOUT1.mcafee.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757540Ab2JXMak (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 24 Oct 2012 08:30:40 -0400
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

Some of the code in the existing mm/init_mm.c and mm/init_no.c files is
the same, and if we merge them back to a single file we can save some code
duplication.

Although the old mem_init() code for non-MMU was a little different than
the MMU version, it turns out we can use the same code. So I now we just
use the MMU mem_init() code for all. It also means we now get identical
console info messages for this code on kernel boot up.

So merge the two files back into a single file.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
v2: fixed pr_notice format warning

 arch/m68k/mm/init.c    |  230 +++++++++++++++++++++++++++++++++++++++++++++++-
 arch/m68k/mm/init_mm.c |  176 ------------------------------------
 arch/m68k/mm/init_no.c |  145 ------------------------------
 3 files changed, 228 insertions(+), 323 deletions(-)
 delete mode 100644 arch/m68k/mm/init_mm.c
 delete mode 100644 arch/m68k/mm/init_no.c

diff --git a/arch/m68k/mm/init.c b/arch/m68k/mm/init.c
index 27b5ce0..b0f201a 100644
--- a/arch/m68k/mm/init.c
+++ b/arch/m68k/mm/init.c
@@ -1,5 +1,231 @@
+/*
+ *  linux/arch/m68k/mm/init.c
+ *
+ *  Copyright (C) 1995  Hamish Macdonald
+ *
+ *  Contains common initialization routines, specific init code moved
+ *  to motorola.c and sun3mmu.c
+ */
+
+#include <linux/module.h>
+#include <linux/signal.h>
+#include <linux/sched.h>
+#include <linux/mm.h>
+#include <linux/swap.h>
+#include <linux/kernel.h>
+#include <linux/string.h>
+#include <linux/types.h>
+#include <linux/init.h>
+#include <linux/bootmem.h>
+#include <linux/gfp.h>
+
+#include <asm/setup.h>
+#include <asm/uaccess.h>
+#include <asm/page.h>
+#include <asm/pgalloc.h>
+#include <asm/traps.h>
+#include <asm/machdep.h>
+#include <asm/io.h>
+#ifdef CONFIG_ATARI
+#include <asm/atari_stram.h>
+#endif
+#include <asm/sections.h>
+#include <asm/tlb.h>
+
+/*
+ * ZERO_PAGE is a special page that is used for zero-initialized
+ * data and COW.
+ */
+void *empty_zero_page;
+EXPORT_SYMBOL(empty_zero_page);
+
 #ifdef CONFIG_MMU
-#include "init_mm.c"
+
+pg_data_t pg_data_map[MAX_NUMNODES];
+EXPORT_SYMBOL(pg_data_map);
+
+int m68k_virt_to_node_shift;
+
+#ifndef CONFIG_SINGLE_MEMORY_CHUNK
+pg_data_t *pg_data_table[65];
+EXPORT_SYMBOL(pg_data_table);
+#endif
+
+void __init m68k_setup_node(int node)
+{
+#ifndef CONFIG_SINGLE_MEMORY_CHUNK
+	struct mem_info *info = m68k_memory + node;
+	int i, end;
+
+	i = (unsigned long)phys_to_virt(info->addr) >> __virt_to_node_shift();
+	end = (unsigned long)phys_to_virt(info->addr + info->size - 1) >> __virt_to_node_shift();
+	for (; i <= end; i++) {
+		if (pg_data_table[i])
+			printk("overlap at %u for chunk %u\n", i, node);
+		pg_data_table[i] = pg_data_map + node;
+	}
+#endif
+	pg_data_map[node].bdata = bootmem_node_data + node;
+	node_set_online(node);
+}
+
+extern void init_pointer_table(unsigned long ptable);
+extern pmd_t *zero_pgtable;
+
+#else /* CONFIG_MMU */
+
+/*
+ * paging_init() continues the virtual memory environment setup which
+ * was begun by the code in arch/head.S.
+ * The parameters are pointers to where to stick the starting and ending
+ * addresses of available kernel virtual memory.
+ */
+void __init paging_init(void)
+{
+	/*
+	 * Make sure start_mem is page aligned, otherwise bootmem and
+	 * page_alloc get different views of the world.
+	 */
+	unsigned long end_mem = memory_end & PAGE_MASK;
+	unsigned long zones_size[MAX_NR_ZONES] = { 0, };
+
+	high_memory = (void *) end_mem;
+
+	empty_zero_page = alloc_bootmem_pages(PAGE_SIZE);
+	memset(empty_zero_page, 0, PAGE_SIZE);
+
+	/*
+	 * Set up SFC/DFC registers (user data space).
+	 */
+	set_fs (USER_DS);
+
+	zones_size[ZONE_DMA] = (end_mem - PAGE_OFFSET) >> PAGE_SHIFT;
+	free_area_init(zones_size);
+}
+
+void free_initmem(void)
+{
+#ifdef CONFIG_RAMKERNEL
+	unsigned long addr;
+
+	/*
+	 * The following code should be cool even if these sections
+	 * are not page aligned.
+	 */
+	addr = PAGE_ALIGN((unsigned long) __init_begin);
+	/* next to check that the page we free is not a partial page */
+	for (; addr + PAGE_SIZE < ((unsigned long) __init_end); addr += PAGE_SIZE) {
+		ClearPageReserved(virt_to_page(addr));
+		init_page_count(virt_to_page(addr));
+		free_page(addr);
+		totalram_pages++;
+	}
+	pr_notice("Freeing unused kernel memory: %luk freed (0x%x - 0x%x)\n",
+		(addr - PAGE_ALIGN((unsigned long) __init_begin)) >> 10,
+		(int)(PAGE_ALIGN((unsigned long) __init_begin)),
+		(int)(addr - PAGE_SIZE));
+#endif
+}
+
+#endif /* CONFIG_MMU */
+
+#if defined(CONFIG_MMU) && !defined(CONFIG_COLDFIRE)
+#define VECTORS	&vectors[0]
 #else
-#include "init_no.c"
+#define VECTORS	_ramvec
+#endif
+
+void __init print_memmap(void)
+{
+#define UL(x) ((unsigned long) (x))
+#define MLK(b, t) UL(b), UL(t), (UL(t) - UL(b)) >> 10
+#define MLM(b, t) UL(b), UL(t), (UL(t) - UL(b)) >> 20
+#define MLK_ROUNDUP(b, t) b, t, DIV_ROUND_UP(((t) - (b)), 1024)
+
+	pr_notice("Virtual kernel memory layout:\n"
+		"    vector  : 0x%08lx - 0x%08lx   (%4ld KiB)\n"
+		"    kmap    : 0x%08lx - 0x%08lx   (%4ld MiB)\n"
+		"    vmalloc : 0x%08lx - 0x%08lx   (%4ld MiB)\n"
+		"    lowmem  : 0x%08lx - 0x%08lx   (%4ld MiB)\n"
+		"      .init : 0x%p" " - 0x%p" "   (%4d KiB)\n"
+		"      .text : 0x%p" " - 0x%p" "   (%4d KiB)\n"
+		"      .data : 0x%p" " - 0x%p" "   (%4d KiB)\n"
+		"      .bss  : 0x%p" " - 0x%p" "   (%4d KiB)\n",
+		MLK(VECTORS, VECTORS + 256),
+		MLM(KMAP_START, KMAP_END),
+		MLM(VMALLOC_START, VMALLOC_END),
+		MLM(PAGE_OFFSET, (unsigned long)high_memory),
+		MLK_ROUNDUP(__init_begin, __init_end),
+		MLK_ROUNDUP(_stext, _etext),
+		MLK_ROUNDUP(_sdata, _edata),
+		MLK_ROUNDUP(__bss_start, __bss_stop));
+}
+
+void __init mem_init(void)
+{
+	pg_data_t *pgdat;
+	int codepages = 0;
+	int datapages = 0;
+	int initpages = 0;
+	int i;
+
+	/* this will put all memory onto the freelists */
+	totalram_pages = num_physpages = 0;
+	for_each_online_pgdat(pgdat) {
+		num_physpages += pgdat->node_present_pages;
+
+		totalram_pages += free_all_bootmem_node(pgdat);
+		for (i = 0; i < pgdat->node_spanned_pages; i++) {
+			struct page *page = pgdat->node_mem_map + i;
+			char *addr = page_to_virt(page);
+
+			if (!PageReserved(page))
+				continue;
+			if (addr >= _text &&
+			    addr < _etext)
+				codepages++;
+			else if (addr >= __init_begin &&
+				 addr < __init_end)
+				initpages++;
+			else
+				datapages++;
+		}
+	}
+
+#if !defined(CONFIG_SUN3) && !defined(CONFIG_COLDFIRE)
+	/* insert pointer tables allocated so far into the tablelist */
+	init_pointer_table((unsigned long)kernel_pg_dir);
+	for (i = 0; i < PTRS_PER_PGD; i++) {
+		if (pgd_present(kernel_pg_dir[i]))
+			init_pointer_table(__pgd_page(kernel_pg_dir[i]));
+	}
+
+	/* insert also pointer table that we used to unmap the zero page */
+	if (zero_pgtable)
+		init_pointer_table((unsigned long)zero_pgtable);
+#endif
+
+	pr_info("Memory: %luk/%luk available (%dk kernel code, %dk data, %dk init)\n",
+	       nr_free_pages() << (PAGE_SHIFT-10),
+	       totalram_pages << (PAGE_SHIFT-10),
+	       codepages << (PAGE_SHIFT-10),
+	       datapages << (PAGE_SHIFT-10),
+	       initpages << (PAGE_SHIFT-10));
+	print_memmap();
+}
+
+#ifdef CONFIG_BLK_DEV_INITRD
+void free_initrd_mem(unsigned long start, unsigned long end)
+{
+	int pages = 0;
+	for (; start < end; start += PAGE_SIZE) {
+		ClearPageReserved(virt_to_page(start));
+		init_page_count(virt_to_page(start));
+		free_page(start);
+		totalram_pages++;
+		pages++;
+	}
+	pr_notice("Freeing initrd memory: %dk freed\n",
+		pages << (PAGE_SHIFT - 10));
+}
 #endif
diff --git a/arch/m68k/mm/init_mm.c b/arch/m68k/mm/init_mm.c
deleted file mode 100644
index 282f9de..0000000
--- a/arch/m68k/mm/init_mm.c
+++ /dev/null
@@ -1,176 +0,0 @@
-/*
- *  linux/arch/m68k/mm/init.c
- *
- *  Copyright (C) 1995  Hamish Macdonald
- *
- *  Contains common initialization routines, specific init code moved
- *  to motorola.c and sun3mmu.c
- */
-
-#include <linux/module.h>
-#include <linux/signal.h>
-#include <linux/sched.h>
-#include <linux/mm.h>
-#include <linux/swap.h>
-#include <linux/kernel.h>
-#include <linux/string.h>
-#include <linux/types.h>
-#include <linux/init.h>
-#include <linux/bootmem.h>
-#include <linux/gfp.h>
-
-#include <asm/setup.h>
-#include <asm/uaccess.h>
-#include <asm/page.h>
-#include <asm/pgalloc.h>
-#include <asm/traps.h>
-#include <asm/machdep.h>
-#include <asm/io.h>
-#ifdef CONFIG_ATARI
-#include <asm/atari_stram.h>
-#endif
-#include <asm/sections.h>
-#include <asm/tlb.h>
-
-pg_data_t pg_data_map[MAX_NUMNODES];
-EXPORT_SYMBOL(pg_data_map);
-
-int m68k_virt_to_node_shift;
-
-#ifndef CONFIG_SINGLE_MEMORY_CHUNK
-pg_data_t *pg_data_table[65];
-EXPORT_SYMBOL(pg_data_table);
-#endif
-
-void __init m68k_setup_node(int node)
-{
-#ifndef CONFIG_SINGLE_MEMORY_CHUNK
-	struct mem_info *info = m68k_memory + node;
-	int i, end;
-
-	i = (unsigned long)phys_to_virt(info->addr) >> __virt_to_node_shift();
-	end = (unsigned long)phys_to_virt(info->addr + info->size - 1) >> __virt_to_node_shift();
-	for (; i <= end; i++) {
-		if (pg_data_table[i])
-			printk("overlap at %u for chunk %u\n", i, node);
-		pg_data_table[i] = pg_data_map + node;
-	}
-#endif
-	pg_data_map[node].bdata = bootmem_node_data + node;
-	node_set_online(node);
-}
-
-
-/*
- * ZERO_PAGE is a special page that is used for zero-initialized
- * data and COW.
- */
-
-void *empty_zero_page;
-EXPORT_SYMBOL(empty_zero_page);
-
-extern void init_pointer_table(unsigned long ptable);
-
-/* References to section boundaries */
-
-extern pmd_t *zero_pgtable;
-
-#if defined(CONFIG_MMU) && !defined(CONFIG_COLDFIRE)
-#define VECTORS	&vectors[0]
-#else
-#define VECTORS	_ramvec
-#endif
-
-void __init print_memmap(void)
-{
-#define UL(x) ((unsigned long) (x))
-#define MLK(b, t) UL(b), UL(t), (UL(t) - UL(b)) >> 10
-#define MLM(b, t) UL(b), UL(t), (UL(t) - UL(b)) >> 20
-#define MLK_ROUNDUP(b, t) b, t, DIV_ROUND_UP(((t) - (b)), 1024)
-
-	pr_notice("Virtual kernel memory layout:\n"
-		"    vector  : 0x%08lx - 0x%08lx   (%4ld KiB)\n"
-		"    kmap    : 0x%08lx - 0x%08lx   (%4ld MiB)\n"
-		"    vmalloc : 0x%08lx - 0x%08lx   (%4ld MiB)\n"
-		"    lowmem  : 0x%08lx - 0x%08lx   (%4ld MiB)\n"
-		"      .init : 0x%p" " - 0x%p" "   (%4d KiB)\n"
-		"      .text : 0x%p" " - 0x%p" "   (%4d KiB)\n"
-		"      .data : 0x%p" " - 0x%p" "   (%4d KiB)\n"
-		"      .bss  : 0x%p" " - 0x%p" "   (%4d KiB)\n",
-		MLK(VECTORS, VECTORS + 256),
-		MLM(KMAP_START, KMAP_END),
-		MLM(VMALLOC_START, VMALLOC_END),
-		MLM(PAGE_OFFSET, (unsigned long)high_memory),
-		MLK_ROUNDUP(__init_begin, __init_end),
-		MLK_ROUNDUP(_stext, _etext),
-		MLK_ROUNDUP(_sdata, _edata),
-		MLK_ROUNDUP(__bss_start, __bss_stop));
-}
-
-void __init mem_init(void)
-{
-	pg_data_t *pgdat;
-	int codepages = 0;
-	int datapages = 0;
-	int initpages = 0;
-	int i;
-
-	/* this will put all memory onto the freelists */
-	totalram_pages = num_physpages = 0;
-	for_each_online_pgdat(pgdat) {
-		num_physpages += pgdat->node_present_pages;
-
-		totalram_pages += free_all_bootmem_node(pgdat);
-		for (i = 0; i < pgdat->node_spanned_pages; i++) {
-			struct page *page = pgdat->node_mem_map + i;
-			char *addr = page_to_virt(page);
-
-			if (!PageReserved(page))
-				continue;
-			if (addr >= _text &&
-			    addr < _etext)
-				codepages++;
-			else if (addr >= __init_begin &&
-				 addr < __init_end)
-				initpages++;
-			else
-				datapages++;
-		}
-	}
-
-#if !defined(CONFIG_SUN3) && !defined(CONFIG_COLDFIRE)
-	/* insert pointer tables allocated so far into the tablelist */
-	init_pointer_table((unsigned long)kernel_pg_dir);
-	for (i = 0; i < PTRS_PER_PGD; i++) {
-		if (pgd_present(kernel_pg_dir[i]))
-			init_pointer_table(__pgd_page(kernel_pg_dir[i]));
-	}
-
-	/* insert also pointer table that we used to unmap the zero page */
-	if (zero_pgtable)
-		init_pointer_table((unsigned long)zero_pgtable);
-#endif
-
-	printk("Memory: %luk/%luk available (%dk kernel code, %dk data, %dk init)\n",
-	       nr_free_pages() << (PAGE_SHIFT-10),
-	       totalram_pages << (PAGE_SHIFT-10),
-	       codepages << (PAGE_SHIFT-10),
-	       datapages << (PAGE_SHIFT-10),
-	       initpages << (PAGE_SHIFT-10));
-	print_memmap();
-}
-
-#ifdef CONFIG_BLK_DEV_INITRD
-void free_initrd_mem(unsigned long start, unsigned long end)
-{
-	int pages = 0;
-	for (; start < end; start += PAGE_SIZE) {
-		ClearPageReserved(virt_to_page(start));
-		init_page_count(virt_to_page(start));
-		free_page(start);
-		totalram_pages++;
-		pages++;
-	}
-	printk ("Freeing initrd memory: %dk freed\n", pages);
-}
-#endif
diff --git a/arch/m68k/mm/init_no.c b/arch/m68k/mm/init_no.c
deleted file mode 100644
index 688e366..0000000
--- a/arch/m68k/mm/init_no.c
+++ /dev/null
@@ -1,145 +0,0 @@
-/*
- *  linux/arch/m68knommu/mm/init.c
- *
- *  Copyright (C) 1998  D. Jeff Dionne <jeff@lineo.ca>,
- *                      Kenneth Albanowski <kjahds@kjahds.com>,
- *  Copyright (C) 2000  Lineo, Inc.  (www.lineo.com) 
- *
- *  Based on:
- *
- *  linux/arch/m68k/mm/init.c
- *
- *  Copyright (C) 1995  Hamish Macdonald
- *
- *  JAN/1999 -- hacked to support ColdFire (gerg@snapgear.com)
- *  DEC/2000 -- linux 2.4 support <davidm@snapgear.com>
- */
-
-#include <linux/signal.h>
-#include <linux/sched.h>
-#include <linux/kernel.h>
-#include <linux/errno.h>
-#include <linux/string.h>
-#include <linux/types.h>
-#include <linux/ptrace.h>
-#include <linux/mman.h>
-#include <linux/mm.h>
-#include <linux/swap.h>
-#include <linux/init.h>
-#include <linux/highmem.h>
-#include <linux/pagemap.h>
-#include <linux/bootmem.h>
-#include <linux/gfp.h>
-
-#include <asm/setup.h>
-#include <asm/sections.h>
-#include <asm/segment.h>
-#include <asm/page.h>
-#include <asm/pgtable.h>
-#include <asm/machdep.h>
-
-/*
- * ZERO_PAGE is a special page that is used for zero-initialized
- * data and COW.
- */
-void *empty_zero_page;
-
-/*
- * paging_init() continues the virtual memory environment setup which
- * was begun by the code in arch/head.S.
- * The parameters are pointers to where to stick the starting and ending
- * addresses of available kernel virtual memory.
- */
-void __init paging_init(void)
-{
-	/*
-	 * Make sure start_mem is page aligned, otherwise bootmem and
-	 * page_alloc get different views of the world.
-	 */
-	unsigned long end_mem   = memory_end & PAGE_MASK;
-	unsigned long zones_size[MAX_NR_ZONES] = {0, };
-
-	empty_zero_page = alloc_bootmem_pages(PAGE_SIZE);
-	memset(empty_zero_page, 0, PAGE_SIZE);
-
-	/*
-	 * Set up SFC/DFC registers (user data space).
-	 */
-	set_fs (USER_DS);
-
-	zones_size[ZONE_DMA] = (end_mem - PAGE_OFFSET) >> PAGE_SHIFT;
-	free_area_init(zones_size);
-}
-
-void __init mem_init(void)
-{
-	int codek = 0, datak = 0, initk = 0;
-	unsigned long tmp;
-	unsigned long len = _ramend - _rambase;
-	unsigned long start_mem = memory_start; /* DAVIDM - these must start at end of kernel */
-	unsigned long end_mem   = memory_end; /* DAVIDM - this must not include kernel stack at top */
-
-	pr_debug("Mem_init: start=%lx, end=%lx\n", start_mem, end_mem);
-
-	end_mem &= PAGE_MASK;
-	high_memory = (void *) end_mem;
-
-	start_mem = PAGE_ALIGN(start_mem);
-	max_mapnr = num_physpages = (((unsigned long) high_memory) - PAGE_OFFSET) >> PAGE_SHIFT;
-
-	/* this will put all memory onto the freelists */
-	totalram_pages = free_all_bootmem();
-
-	codek = (_etext - _stext) >> 10;
-	datak = (__bss_stop - _sdata) >> 10;
-	initk = (__init_begin - __init_end) >> 10;
-
-	tmp = nr_free_pages() << PAGE_SHIFT;
-	printk(KERN_INFO "Memory available: %luk/%luk RAM, (%dk kernel code, %dk data)\n",
-	       tmp >> 10,
-	       len >> 10,
-	       codek,
-	       datak
-	       );
-}
-
-
-#ifdef CONFIG_BLK_DEV_INITRD
-void free_initrd_mem(unsigned long start, unsigned long end)
-{
-	int pages = 0;
-	for (; start < end; start += PAGE_SIZE) {
-		ClearPageReserved(virt_to_page(start));
-		init_page_count(virt_to_page(start));
-		free_page(start);
-		totalram_pages++;
-		pages++;
-	}
-	pr_notice("Freeing initrd memory: %luk freed\n",
-		  pages * (PAGE_SIZE / 1024));
-}
-#endif
-
-void free_initmem(void)
-{
-#ifdef CONFIG_RAMKERNEL
-	unsigned long addr;
-	/*
-	 * The following code should be cool even if these sections
-	 * are not page aligned.
-	 */
-	addr = PAGE_ALIGN((unsigned long) __init_begin);
-	/* next to check that the page we free is not a partial page */
-	for (; addr + PAGE_SIZE < ((unsigned long) __init_end); addr += PAGE_SIZE) {
-		ClearPageReserved(virt_to_page(addr));
-		init_page_count(virt_to_page(addr));
-		free_page(addr);
-		totalram_pages++;
-	}
-	pr_notice("Freeing unused kernel memory: %luk freed (0x%x - 0x%x)\n",
-			(addr - PAGE_ALIGN((unsigned long) __init_begin)) >> 10,
-			(int)(PAGE_ALIGN((unsigned long) __init_begin)),
-			(int)(addr - PAGE_SIZE));
-#endif
-}
-
-- 
1.7.0.4
