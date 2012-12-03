From: <gerg@uclinux.org>
Subject: [PATCH v2] m68k: merge arch free memory functions into a single function
Date: Mon, 3 Dec 2012 16:35:38 +1000
Message-ID: <1354516538-23699-1-git-send-email-gerg@uclinux.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from dnvwsmailout1.mcafee.com ([161.69.31.173]:41336 "EHLO
	DNVWSMAILOUT1.mcafee.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751700Ab2LCGbg (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 3 Dec 2012 01:31:36 -0500
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

We have separate architecture functions for freeing the initrd memory, and
for freeing the init sections. But they are essentially the same code, they
are doing exactly the same thing.

Create a common local arch free memory function and make the current users
call it to do the real work.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
v2: prettied up the notice string (uses SI memory units)

 arch/m68k/mm/init.c |   42 ++++++++++++++++++++----------------------
 1 files changed, 20 insertions(+), 22 deletions(-)

diff --git a/arch/m68k/mm/init.c b/arch/m68k/mm/init.c
index f0e05bc..0771fcc 100644
--- a/arch/m68k/mm/init.c
+++ b/arch/m68k/mm/init.c
@@ -105,21 +105,34 @@ void __init paging_init(void)
 
 #endif /* CONFIG_MMU */
 
-void free_initmem(void)
+static void free_mem(const char *name, unsigned long start, unsigned long end)
 {
-#ifndef CONFIG_MMU_SUN3
 	unsigned long addr;
+	int pages = 0;
 
-	addr = (unsigned long) __init_begin;
-	for (; addr < ((unsigned long) __init_end); addr += PAGE_SIZE) {
+	for (addr = start; addr < end; addr += PAGE_SIZE) {
 		ClearPageReserved(virt_to_page(addr));
 		init_page_count(virt_to_page(addr));
 		free_page(addr);
 		totalram_pages++;
+		pages++;
 	}
-	pr_notice("Freeing unused kernel memory: %luk freed (0x%x - 0x%x)\n",
-		(addr - (unsigned long) __init_begin) >> 10,
-		(unsigned int) __init_begin, (unsigned int) __init_end);
+	pr_notice("Freed %d KiB %s memory: 0x%lx - 0x%lx\n",
+		pages << (PAGE_SHIFT - 10), name, start, end);
+}
+
+#ifdef CONFIG_BLK_DEV_INITRD
+void free_initrd_mem(unsigned long start, unsigned long end)
+{
+	free_mem("initrd", start, end);
+}
+#endif
+
+void free_initmem(void)
+{
+#ifndef CONFIG_MMU_SUN3
+	free_mem("unused kernel", (unsigned long) __init_begin,
+		(unsigned long) __init_end);
 #endif /* CONFIG_MMU_SUN3 */
 }
 
@@ -208,18 +221,3 @@ void __init mem_init(void)
 	print_memmap();
 }
 
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
-	pr_notice("Freeing initrd memory: %dk freed\n",
-		pages << (PAGE_SHIFT - 10));
-}
-#endif
-- 
1.7.0.4
