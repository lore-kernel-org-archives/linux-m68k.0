From: <gerg@snapgear.com>
Subject: [PATCH] m68k: move to a single instance of free_initmem()
Date: Tue, 23 Oct 2012 13:40:36 +1000
Message-ID: <1350963636-30424-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from dalsmrelay2.nai.com ([205.227.136.216]:62841 "EHLO
	dalsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750907Ab2JWDj0 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 22 Oct 2012 23:39:26 -0400
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

Currently each sub-architecture has its own implementation if init_freemem().
There is two different cases that the various implementations deal with.
They either free the init memory, or they don't. We only need a single instance
to cover all cases.

The non-MMU version did some page alignment twidling, but this is not
neccessary. The current linker script enforces page alignment. It also
checked for CONFIG_RAMKERNEL, but this also is not necessary, the linker
script always keeps the init sections in RAM.

The MMU ColdFire version of free_initmem() was empty. There is no reason it
can't carry out the freeing of the init memory. So it is now changed and
tested to do this.

For the other MMU cases the code is the same. For the general Motorola MMU
case we free the init memory. For the SUN3 case we do nothing (though I
think it could safely free the init memory as well).

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/mm/init.c     |   22 ++++++++--------------
 arch/m68k/mm/mcfmmu.c   |    4 ----
 arch/m68k/mm/motorola.c |   14 --------------
 arch/m68k/mm/sun3mmu.c  |    4 ----
 4 files changed, 8 insertions(+), 36 deletions(-)

diff --git a/arch/m68k/mm/init.c b/arch/m68k/mm/init.c
index d0286db..4d7af92 100644
--- a/arch/m68k/mm/init.c
+++ b/arch/m68k/mm/init.c
@@ -103,32 +103,26 @@ void __init paging_init(void)
 	free_area_init(zones_size);
 }
 
+#endif /* CONFIG_MMU */
+
 void free_initmem(void)
 {
-#ifdef CONFIG_RAMKERNEL
+#ifndef CONFIG_MMU_SUN3
 	unsigned long addr;
 
-	/*
-	 * The following code should be cool even if these sections
-	 * are not page aligned.
-	 */
-	addr = PAGE_ALIGN((unsigned long) __init_begin);
-	/* next to check that the page we free is not a partial page */
-	for (; addr + PAGE_SIZE < ((unsigned long) __init_end); addr += PAGE_SIZE) {
+	addr = (unsigned long) __init_begin;
+	for (; addr < ((unsigned long) __init_end); addr += PAGE_SIZE) {
 		ClearPageReserved(virt_to_page(addr));
 		init_page_count(virt_to_page(addr));
 		free_page(addr);
 		totalram_pages++;
 	}
 	pr_notice("Freeing unused kernel memory: %luk freed (0x%x - 0x%x)\n",
-		(addr - PAGE_ALIGN((unsigned long) __init_begin)) >> 10,
-		(int)(PAGE_ALIGN((unsigned long) __init_begin)),
-		(int)(addr - PAGE_SIZE));
-#endif
+		(addr - (unsigned long) __init_begin) >> 10,
+		(unsigned int) __init_begin, (unsigned int) __init_end);
+#endif /* CONFIG_MMU_SUN3 */
 }
 
-#endif /* CONFIG_MMU */
-
 #if defined(CONFIG_MMU) && !defined(CONFIG_COLDFIRE)
 #define VECTORS	&vectors[0]
 #else
diff --git a/arch/m68k/mm/mcfmmu.c b/arch/m68k/mm/mcfmmu.c
index 875b800..f58fafe 100644
--- a/arch/m68k/mm/mcfmmu.c
+++ b/arch/m68k/mm/mcfmmu.c
@@ -29,10 +29,6 @@ atomic_t nr_free_contexts;
 struct mm_struct *context_mm[LAST_CONTEXT+1];
 extern unsigned long num_pages;
 
-void free_initmem(void)
-{
-}
-
 /*
  * ColdFire paging_init derived from sun3.
  */
diff --git a/arch/m68k/mm/motorola.c b/arch/m68k/mm/motorola.c
index 0dafa69..251c543 100644
--- a/arch/m68k/mm/motorola.c
+++ b/arch/m68k/mm/motorola.c
@@ -304,17 +304,3 @@ void __init paging_init(void)
 	}
 }
 
-void free_initmem(void)
-{
-	unsigned long addr;
-
-	addr = (unsigned long)__init_begin;
-	for (; addr < (unsigned long)__init_end; addr += PAGE_SIZE) {
-		virt_to_page(addr)->flags &= ~(1 << PG_reserved);
-		init_page_count(virt_to_page(addr));
-		free_page(addr);
-		totalram_pages++;
-	}
-}
-
-
diff --git a/arch/m68k/mm/sun3mmu.c b/arch/m68k/mm/sun3mmu.c
index e080406..269f811 100644
--- a/arch/m68k/mm/sun3mmu.c
+++ b/arch/m68k/mm/sun3mmu.c
@@ -30,10 +30,6 @@ const char bad_pmd_string[] = "Bad pmd in pte_alloc: %08lx\n";
 
 extern unsigned long num_pages;
 
-void free_initmem(void)
-{
-}
-
 /* For the sun3 we try to follow the i386 paging_init() more closely */
 /* start_mem and end_mem have PAGE_OFFSET added already */
 /* now sets up tables using sun3 PTEs rather than i386 as before. --m */
-- 
1.7.0.4
