From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] m68k/mm: kmap spelling/grammar fixes
Date: Mon, 30 Dec 2013 10:08:50 +0100
Message-ID: <1388394530-25851-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@lists.linux-m68k.org
Cc: Geert Uytterhoeven <geert@linux-m68k.org>

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 arch/m68k/mm/kmap.c |   10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/m68k/mm/kmap.c b/arch/m68k/mm/kmap.c
index 568cfad3ceb8..6e4955bc542b 100644
--- a/arch/m68k/mm/kmap.c
+++ b/arch/m68k/mm/kmap.c
@@ -27,9 +27,9 @@
 
 /*
  * For 040/060 we can use the virtual memory area like other architectures,
- * but for 020/030 we want to use early termination page descriptor and we
+ * but for 020/030 we want to use early termination page descriptors and we
  * can't mix this with normal page descriptors, so we have to copy that code
- * (mm/vmalloc.c) and return appriorate aligned addresses.
+ * (mm/vmalloc.c) and return appropriately aligned addresses.
  */
 
 #ifdef CPU_M68040_OR_M68060_ONLY
@@ -224,7 +224,7 @@ void __iomem *__ioremap(unsigned long physaddr, unsigned long size, int cachefla
 EXPORT_SYMBOL(__ioremap);
 
 /*
- * Unmap a ioremap()ed region again
+ * Unmap an ioremap()ed region again
  */
 void iounmap(void __iomem *addr)
 {
@@ -241,8 +241,8 @@ EXPORT_SYMBOL(iounmap);
 
 /*
  * __iounmap unmaps nearly everything, so be careful
- * it doesn't free currently pointer/page tables anymore but it
- * wans't used anyway and might be added later.
+ * Currently it doesn't free pointer/page tables anymore but this
+ * wasn't used anyway and might be added later.
  */
 void __iounmap(void *addr, unsigned long size)
 {
-- 
1.7.9.5
