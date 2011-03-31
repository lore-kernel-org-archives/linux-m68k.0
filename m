From: Greg Ungerer <gerg@uclinux.org>
Subject: [PATCH 5/5] m68knommu: clean up mm/init_no.c
Date: Thu, 31 Mar 2011 14:19:31 +1000
Message-ID: <0572d21c85b205827c640be2ccbe74464cef4336.1301544679.git.gerg@uclinux.org>
References: <3401d75b43ad3a987a93456d978e53fea9dee11c.1301544679.git.gerg@uclinux.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:31861 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751996Ab1CaEWG (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 31 Mar 2011 00:22:06 -0400
In-Reply-To: <3401d75b43ad3a987a93456d978e53fea9dee11c.1301544679.git.gerg@uclinux.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org
Cc: Greg Ungerer <gerg@uclinux.org>

The memory initialization code for m68knommu has grown a bit crufty,
clean it up.

. remove unused declaration for die_if_kernel()
. remove un-needed declaration of free_initmem()
. removed unused definitions of empty_bad_page and empty_bad_page_table
. removed unused DEBUG code
. make free_initmem() proper prototype

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/mm/init_no.c |   51 +++--------------------------------------------
 1 files changed, 4 insertions(+), 47 deletions(-)

diff --git a/arch/m68k/mm/init_no.c b/arch/m68k/mm/init_no.c
index 8a6653f..7cbd7bd 100644
--- a/arch/m68k/mm/init_no.c
+++ b/arch/m68k/mm/init_no.c
@@ -38,28 +38,10 @@
 #include <asm/system.h>
 #include <asm/machdep.h>
 
-#undef DEBUG
-
-extern void die_if_kernel(char *,struct pt_regs *,long);
-extern void free_initmem(void);
-
 /*
- * BAD_PAGE is the page that is used for page faults when linux
- * is out-of-memory. Older versions of linux just did a
- * do_exit(), but using this instead means there is less risk
- * for a process dying in kernel mode, possibly leaving a inode
- * unused etc..
- *
- * BAD_PAGETABLE is the accompanying page-table: it is initialized
- * to point to BAD_PAGE entries.
- *
  * ZERO_PAGE is a special page that is used for zero-initialized
  * data and COW.
  */
-static unsigned long empty_bad_page_table;
-
-static unsigned long empty_bad_page;
-
 unsigned long empty_zero_page;
 
 extern unsigned long memory_start;
@@ -77,22 +59,9 @@ void __init paging_init(void)
 	 * Make sure start_mem is page aligned, otherwise bootmem and
 	 * page_alloc get different views of the world.
 	 */
-#ifdef DEBUG
-	unsigned long start_mem = PAGE_ALIGN(memory_start);
-#endif
 	unsigned long end_mem   = memory_end & PAGE_MASK;
+	unsigned long zones_size[MAX_NR_ZONES] = {0, };
 
-#ifdef DEBUG
-	printk (KERN_DEBUG "start_mem is %#lx\nvirtual_end is %#lx\n",
-		start_mem, end_mem);
-#endif
-
-	/*
-	 * Initialize the bad page table and bad page to point
-	 * to a couple of allocated pages.
-	 */
-	empty_bad_page_table = (unsigned long)alloc_bootmem_pages(PAGE_SIZE);
-	empty_bad_page = (unsigned long)alloc_bootmem_pages(PAGE_SIZE);
 	empty_zero_page = (unsigned long)alloc_bootmem_pages(PAGE_SIZE);
 	memset((void *)empty_zero_page, 0, PAGE_SIZE);
 
@@ -101,19 +70,8 @@ void __init paging_init(void)
 	 */
 	set_fs (USER_DS);
 
-#ifdef DEBUG
-	printk (KERN_DEBUG "before free_area_init\n");
-
-	printk (KERN_DEBUG "free_area_init -> start_mem is %#lx\nvirtual_end is %#lx\n",
-		start_mem, end_mem);
-#endif
-
-	{
-		unsigned long zones_size[MAX_NR_ZONES] = {0, };
-
-		zones_size[ZONE_DMA] = (end_mem - PAGE_OFFSET) >> PAGE_SHIFT;
-		free_area_init(zones_size);
-	}
+	zones_size[ZONE_DMA] = (end_mem - PAGE_OFFSET) >> PAGE_SHIFT;
+	free_area_init(zones_size);
 }
 
 void __init mem_init(void)
@@ -166,8 +124,7 @@ void free_initrd_mem(unsigned long start, unsigned long end)
 }
 #endif
 
-void
-free_initmem()
+void free_initmem(void)
 {
 #ifdef CONFIG_RAMKERNEL
 	unsigned long addr;
-- 
1.7.0.4
