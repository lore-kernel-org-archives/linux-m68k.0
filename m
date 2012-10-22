From: <gerg@snapgear.com>
Subject: [PATCH] m68k: merge MMU and non-MMU versions of mm/init.c
Date: Mon, 22 Oct 2012 15:56:05 +1000
Message-ID: <1350885365-9868-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from dalsmrelay2.nai.com ([205.227.136.216]:55834 "EHLO
	dalsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753627Ab2JVFvo (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 22 Oct 2012 01:51:44 -0400
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

Note that for easier review this was generated with -M.

 arch/m68k/mm/{init_mm.c => init.c} |   73 ++++++++++++++++--
 arch/m68k/mm/init_no.c             |  145 ------------------------------------
 2 files changed, 64 insertions(+), 154 deletions(-)
 rename arch/m68k/mm/{init_mm.c => init.c} (72%)
 delete mode 100644 arch/m68k/mm/init_no.c

diff --git a/arch/m68k/mm/init_mm.c b/arch/m68k/mm/init.c
similarity index 72%
rename from arch/m68k/mm/init_mm.c
rename to arch/m68k/mm/init.c
index 282f9de..d0286db 100644
--- a/arch/m68k/mm/init_mm.c
+++ b/arch/m68k/mm/init.c
@@ -32,6 +32,15 @@
 #include <asm/sections.h>
 #include <asm/tlb.h>
 
+/*
+ * ZERO_PAGE is a special page that is used for zero-initialized
+ * data and COW.
+ */
+void *empty_zero_page;
+EXPORT_SYMBOL(empty_zero_page);
+
+#ifdef CONFIG_MMU
+
 pg_data_t pg_data_map[MAX_NUMNODES];
 EXPORT_SYMBOL(pg_data_map);
 
@@ -60,20 +69,65 @@ void __init m68k_setup_node(int node)
 	node_set_online(node);
 }
 
+extern void init_pointer_table(unsigned long ptable);
+extern pmd_t *zero_pgtable;
+
+#else /* CONFIG_MMU */
 
 /*
- * ZERO_PAGE is a special page that is used for zero-initialized
- * data and COW.
+ * paging_init() continues the virtual memory environment setup which
+ * was begun by the code in arch/head.S.
+ * The parameters are pointers to where to stick the starting and ending
+ * addresses of available kernel virtual memory.
  */
+void __init paging_init(void)
+{
+	/*
+	 * Make sure start_mem is page aligned, otherwise bootmem and
+	 * page_alloc get different views of the world.
+	 */
+	unsigned long end_mem = memory_end & PAGE_MASK;
+	unsigned long zones_size[MAX_NR_ZONES] = { 0, };
 
-void *empty_zero_page;
-EXPORT_SYMBOL(empty_zero_page);
+	high_memory = (void *) end_mem;
 
-extern void init_pointer_table(unsigned long ptable);
+	empty_zero_page = alloc_bootmem_pages(PAGE_SIZE);
+	memset(empty_zero_page, 0, PAGE_SIZE);
 
-/* References to section boundaries */
+	/*
+	 * Set up SFC/DFC registers (user data space).
+	 */
+	set_fs (USER_DS);
 
-extern pmd_t *zero_pgtable;
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
 
 #if defined(CONFIG_MMU) && !defined(CONFIG_COLDFIRE)
 #define VECTORS	&vectors[0]
@@ -151,7 +205,7 @@ void __init mem_init(void)
 		init_pointer_table((unsigned long)zero_pgtable);
 #endif
 
-	printk("Memory: %luk/%luk available (%dk kernel code, %dk data, %dk init)\n",
+	pr_info("Memory: %luk/%luk available (%dk kernel code, %dk data, %dk init)\n",
 	       nr_free_pages() << (PAGE_SHIFT-10),
 	       totalram_pages << (PAGE_SHIFT-10),
 	       codepages << (PAGE_SHIFT-10),
@@ -171,6 +225,7 @@ void free_initrd_mem(unsigned long start, unsigned long end)
 		totalram_pages++;
 		pages++;
 	}
-	printk ("Freeing initrd memory: %dk freed\n", pages);
+	pr_notice("Freeing initrd memory: %luk freed\n",
+		pages << (PAGE_SHIFT - 10));
 }
 #endif
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
