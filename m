From: Alexander Kuleshov <kuleshovmail@gmail.com>
Subject: [PATCH] m68k/coldfire: use PFN_DOWN macro
Date: Tue, 11 Aug 2015 22:57:01 +0600
Message-ID: <1439312221-12688-1-git-send-email-kuleshovmail@gmail.com>
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Greg Ungerer <gerg@uclinux.org>, Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, Alexander Kuleshov <kuleshovmail@gmail.com>

Replace ((x) >> PAGE_SHIFT) with the predefined PFN_DOWN macro.

Signed-off-by: Alexander Kuleshov <kuleshovmail@gmail.com>
---
 arch/m68k/coldfire/m54xx.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/arch/m68k/coldfire/m54xx.c b/arch/m68k/coldfire/m54xx.c
index 075aaab..f7836c6 100644
--- a/arch/m68k/coldfire/m54xx.c
+++ b/arch/m68k/coldfire/m54xx.c
@@ -25,4 +25,5 @@
 #include <asm/m54xxgpt.h>
 #ifdef CONFIG_MMU
 #include <asm/mmu_context.h>
+#include <linux/pfn.h>
 #endif

 /***************************************************************************/
@@ -91,1 +92,1 @@ static void __init mcf54xx_bootmem_alloc(void)
 	m68k_memory[0].size = _ramend - _rambase;

 	/* compute total pages in system */
-	num_pages = (_ramend - _rambase) >> PAGE_SHIFT;
+	num_pages = PFN_DOWN(_ramend - _rambase);

 	/* page numbers */
 	memstart = PAGE_ALIGN(_ramstart);
-	min_low_pfn = _rambase >> PAGE_SHIFT;
-	start_pfn = memstart >> PAGE_SHIFT;
-	max_low_pfn = _ramend >> PAGE_SHIFT;
+	min_low_pfn = PFN_DOWN(_rambase);
+	start_pfn = PFN_DOWN(memstart);
+	max_low_pfn = PFN_DOWN(_ramend);
 	high_memory = (void *)_ramend;

 	m68k_virt_to_node_shift = fls(_ramend - _rambase - 1) - 6;
--
2.5.0
