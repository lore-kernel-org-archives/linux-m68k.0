From: <gerg@snapgear.com>
Subject: [PATCH] m68knommu: use generic section names in mm/init code
Date: Tue, 23 Aug 2011 16:03:23 +1000
Message-ID: <1314079403-26655-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:29392 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751094Ab1HWGHg (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 23 Aug 2011 02:07:36 -0400
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

We should be including and using sections.h to get at the extern
definitions of the linker sections in the m68knommu mm init code.
Not defining them locally.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/mm/init_no.c |   17 ++++++++---------
 1 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/arch/m68k/mm/init_no.c b/arch/m68k/mm/init_no.c
index 50cd12c..66512da 100644
--- a/arch/m68k/mm/init_no.c
+++ b/arch/m68k/mm/init_no.c
@@ -32,6 +32,7 @@
 #include <linux/gfp.h>
 
 #include <asm/setup.h>
+#include <asm/sections.h>
 #include <asm/segment.h>
 #include <asm/page.h>
 #include <asm/pgtable.h>
@@ -78,7 +79,6 @@ void __init mem_init(void)
 {
 	int codek = 0, datak = 0, initk = 0;
 	unsigned long tmp;
-	extern char _etext, _stext, _sdata, _ebss, __init_begin, __init_end;
 	extern unsigned int _ramend, _rambase;
 	unsigned long len = _ramend - _rambase;
 	unsigned long start_mem = memory_start; /* DAVIDM - these must start at end of kernel */
@@ -95,9 +95,9 @@ void __init mem_init(void)
 	/* this will put all memory onto the freelists */
 	totalram_pages = free_all_bootmem();
 
-	codek = (&_etext - &_stext) >> 10;
-	datak = (&_ebss - &_sdata) >> 10;
-	initk = (&__init_begin - &__init_end) >> 10;
+	codek = (_etext - _stext) >> 10;
+	datak = (_ebss - _sdata) >> 10;
+	initk = (__init_begin - __init_end) >> 10;
 
 	tmp = nr_free_pages() << PAGE_SHIFT;
 	printk(KERN_INFO "Memory available: %luk/%luk RAM, (%dk kernel code, %dk data)\n",
@@ -129,22 +129,21 @@ void free_initmem(void)
 {
 #ifdef CONFIG_RAMKERNEL
 	unsigned long addr;
-	extern char __init_begin, __init_end;
 	/*
 	 * The following code should be cool even if these sections
 	 * are not page aligned.
 	 */
-	addr = PAGE_ALIGN((unsigned long)(&__init_begin));
+	addr = PAGE_ALIGN((unsigned long) __init_begin);
 	/* next to check that the page we free is not a partial page */
-	for (; addr + PAGE_SIZE < (unsigned long)(&__init_end); addr +=PAGE_SIZE) {
+	for (; addr + PAGE_SIZE < ((unsigned long) __init_end); addr += PAGE_SIZE) {
 		ClearPageReserved(virt_to_page(addr));
 		init_page_count(virt_to_page(addr));
 		free_page(addr);
 		totalram_pages++;
 	}
 	pr_notice("Freeing unused kernel memory: %luk freed (0x%x - 0x%x)\n",
-			(addr - PAGE_ALIGN((long) &__init_begin)) >> 10,
-			(int)(PAGE_ALIGN((unsigned long)(&__init_begin))),
+			(addr - PAGE_ALIGN((unsigned long) __init_begin)) >> 10,
+			(int)(PAGE_ALIGN((unsigned long) __init_begin)),
 			(int)(addr - PAGE_SIZE));
 #endif
 }
-- 
1.7.0.4
