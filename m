From: sfking@fdwdc.com
Subject: [RFC 23/31] proof of concept merge of m68k and m68knommu
Date: Sun,  6 Sep 2009 22:40:13 -0700
Message-ID: <c4340c33259effcd3a821f48cbdd44e5ced25077.1252222134.git.sfking@fdwdc.com>
References: <cover.1252222129.git.sfking@fdwdc.com>
 <cfdcab7374087d5279ec9a1269831e8159d98f2b.1252222133.git.sfking@fdwdc.com>
 <8cb57205150fb96915e9d12c936be301a5e1e1e1.1252222133.git.sfking@fdwdc.com>
 <44c52df23985288bc2f4a819b73b3cc6da0826b9.1252222133.git.sfking@fdwdc.com>
 <6db080fb352e20adab49ed7762d3200831160b0f.1252222133.git.sfking@fdwdc.com>
 <c2e845e94079ee2a24e19456666f571c687f93f7.1252222133.git.sfking@fdwdc.com>
 <afa7a198356e79718b7682ea33cdfeec1933ae3d.1252222133.git.sfking@fdwdc.com>
 <f6625c80e8b3246063209517cccc855c056b2b71.1252222133.git.sfking@fdwdc.com>
 <55335001e487bd208ef4801c9df7e2d38a842ad3.1252222134.git.sfking@fdwdc.com>
 <1960838f2a4476b115b27420dcec29f81f0a15c1.1252222134.git.sfking@fdwdc.com>
 <491494a31232c4ce3a7fb96c3ed9db228f0ec5b4.1252222134.git.sfking@fdwdc.com>
 <b5baa71b2c543432ce8561ef7c18ef73201d47a8.1252222134.git.sfking@fdwdc.com>
 <fa246e049b7bc779d1c85def3f733a540463c3e2.1252222134.git.sfking@fdwdc.com>
 <c90263ddd638105b7df953128fd150d7fafc56ee.1252222134.git.sfking@fdwdc.com>
 <732b3e401d3708f1abf810ff0028e48d63df7e4b.1252222134.git.sfking@fdwdc.com>
 <9132c5b379a84a9b9a8762fc557abcae6e6ca479.1252222134.git.sfking@fdwdc.com>
 <f9216a12af8475d50631ae2dfea94d807aae1c1f.1252222134.git.sfking@fdwdc.com>
 <58c8b539029e276a7fc7ddeca2f2909845959c25.1252222134.git.sfking@fdwdc.com>
 <7916cd27beda9a78f37dcd9bef81229fcf67e7c6.1252222134.git.sfking@fdwdc.com>
 <f3cef3055f176a78514b07c083d19b5aec5f821f.1252222134.git.sfking@fdwdc.com>
 <572b33baa354e24a1e4ddfbaaf4b9ad71f262f0c.1252222134.git.sfking@fdwdc.com>
 <2e03009ed21c515946779f20bfbd182d04fa45fe.1252222134.git.sfking@fdwdc.com>
 <8f43ed7055e315597a6f75d70cf391cca512204b.1252222134.git.sfking@fdwdc.com>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from smtp109.biz.mail.mud.yahoo.com ([68.142.201.178]:34456 "HELO
	smtp109.biz.mail.mud.yahoo.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with SMTP id S1758986AbZIGFrU (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 7 Sep 2009 01:47:20 -0400
In-Reply-To: <8f43ed7055e315597a6f75d70cf391cca512204b.1252222134.git.sfking@fdwdc.com>
In-Reply-To: <cover.1252222129.git.sfking@fdwdc.com>
References: <cover.1252222129.git.sfking@fdwdc.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: uclinux-dev@uclinux.org
Cc: gerg@snapgear.com, linux-m68k@lists.linux-m68k.org

---
 arch/m68k/mm/init.c                             |  152 +----------------------
 arch/m68k/mm/{init.c => init_mm.c}              |    0 
 arch/{m68knommu/mm/init.c => m68k/mm/init_no.c} |    0 
 3 files changed, 4 insertions(+), 148 deletions(-)
 copy arch/m68k/mm/{init.c => init_mm.c} (100%)
 copy arch/{m68knommu/mm/init.c => m68k/mm/init_no.c} (100%)

diff --git a/arch/m68k/mm/init.c b/arch/m68k/mm/init.c
index 0007b2a..27b5ce0 100644
--- a/arch/m68k/mm/init.c
+++ b/arch/m68k/mm/init.c
@@ -1,149 +1,5 @@
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
-
-#include <asm/setup.h>
-#include <asm/uaccess.h>
-#include <asm/page.h>
-#include <asm/pgalloc.h>
-#include <asm/system.h>
-#include <asm/machdep.h>
-#include <asm/io.h>
-#ifdef CONFIG_ATARI
-#include <asm/atari_stram.h>
-#endif
-#include <asm/sections.h>
-#include <asm/tlb.h>
-
-DEFINE_PER_CPU(struct mmu_gather, mmu_gathers);
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
-void __init mem_init(void)
-{
-	pg_data_t *pgdat;
-	int codepages = 0;
-	int datapages = 0;
-	int initpages = 0;
-	int i;
-
-#ifdef CONFIG_ATARI
-	if (MACH_IS_ATARI)
-		atari_stram_mem_init_hook();
-#endif
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
-#ifndef CONFIG_SUN3
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
-	       (unsigned long)nr_free_pages() << (PAGE_SHIFT-10),
-	       totalram_pages << (PAGE_SHIFT-10),
-	       codepages << (PAGE_SHIFT-10),
-	       datapages << (PAGE_SHIFT-10),
-	       initpages << (PAGE_SHIFT-10));
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
+#ifdef CONFIG_MMU
+#include "init_mm.c"
+#else
+#include "init_no.c"
 #endif
diff --git a/arch/m68k/mm/init.c b/arch/m68k/mm/init_mm.c
similarity index 100%
copy from arch/m68k/mm/init.c
copy to arch/m68k/mm/init_mm.c
diff --git a/arch/m68knommu/mm/init.c b/arch/m68k/mm/init_no.c
similarity index 100%
copy from arch/m68knommu/mm/init.c
copy to arch/m68k/mm/init_no.c
-- 
1.5.6.5

