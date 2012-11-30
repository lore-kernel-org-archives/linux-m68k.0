From: <gerg@snapgear.com>
Subject: [PATCH] m68k: merge arch free memory functions into a
	single function
Date: Fri, 30 Nov 2012 14:27:50 +1000
Message-ID: <1354249670-4376-1-git-send-email-gerg@snapgear.com>
Reply-To: uClinux development list <uclinux-dev@uclinux.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <uclinux-dev-bounces@uclinux.org>
List-Unsubscribe: <http://mailman.uclinux.org/mailman/options/uclinux-dev>,
 <mailto:uclinux-dev-request@uclinux.org?subject=unsubscribe>
List-Archive: <http://mailman.uclinux.org/pipermail/uclinux-dev>
List-Post: <mailto:uclinux-dev@uclinux.org>
List-Help: <mailto:uclinux-dev-request@uclinux.org?subject=help>
List-Subscribe: <http://mailman.uclinux.org/mailman/listinfo/uclinux-dev>,
 <mailto:uclinux-dev-request@uclinux.org?subject=subscribe>
Errors-To: uclinux-dev-bounces@uclinux.org
Sender: uclinux-dev-bounces@uclinux.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>
List-Id: linux-m68k@vger.kernel.org

From: Greg Ungerer <gerg@uclinux.org>

We have separate architecture functions for freeing the initrd memory, and
for freeing the init sections. But they are essentially the same code, they
are doing exactly the same thing.

Create a common local arch free memory function and make the current users
call it to do the real work.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/mm/init.c |   42 ++++++++++++++++++++----------------------
 1 files changed, 20 insertions(+), 22 deletions(-)

diff --git a/arch/m68k/mm/init.c b/arch/m68k/mm/init.c
index f0e05bc..a95f6c4 100644
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
+	pr_notice("Freeing %s memory: %dk freed (0x%lx-0x%lx)\n", name, 
+		pages << (PAGE_SHIFT - 10), start, end);
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

_______________________________________________
uClinux-dev mailing list
uClinux-dev@uclinux.org
http://mailman.uclinux.org/mailman/listinfo/uclinux-dev
This message was resent by uclinux-dev@uclinux.org
To unsubscribe see:
http://mailman.uclinux.org/mailman/options/uclinux-dev
