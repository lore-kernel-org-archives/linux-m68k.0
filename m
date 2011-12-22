From: <gerg@snapgear.com>
Subject: [PATCH 09/35 v4] m68k: add ColdFire 54xx CPU MMU memory init code
Date: Thu, 22 Dec 2011 18:09:39 +1000
Message-ID: <1324541379-30371-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from dalsmrelay2.nai.com ([205.227.136.216]:62026 "EHLO
	dalsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752773Ab1LVIMY (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 22 Dec 2011 03:12:24 -0500
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

Add code to the 54xx ColdFire CPU init to setup memory ready for the m68k
paged memory start up.

Some of the RAM variables that were specific to the non-mmu code paths
now need to be used during this setup, so when CONFIG_MMU is enabled.
Move these out of page_no.h and into page.h.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
Acked-by: Matt Waddel <mwaddel@yahoo.com>
Acked-by: Kurt Mahan <kmahan@xmission.com>
---

This is a re-worked version of patch 0009 in the ColdFire/MMU series.
I have moved the extern defines for the _ram* variables so that no
matter whether CONFIG_MMU is set or not anyone can see them. Otherwise
checkpatch complains about externs in C source files.

 arch/m68k/include/asm/page.h     |    4 +++
 arch/m68k/include/asm/page_no.h  |    3 --
 arch/m68k/platform/54xx/config.c |   47 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 51 insertions(+), 3 deletions(-)

diff --git a/arch/m68k/include/asm/page.h b/arch/m68k/include/asm/page.h
index dfebb7c..ba6c91d 100644
--- a/arch/m68k/include/asm/page.h
+++ b/arch/m68k/include/asm/page.h
@@ -36,6 +36,10 @@ typedef struct page *pgtable_t;
 #define __pgd(x)	((pgd_t) { (x) } )
 #define __pgprot(x)	((pgprot_t) { (x) } )
 
+extern unsigned long _rambase;
+extern unsigned long _ramstart;
+extern unsigned long _ramend;
+
 #endif /* !__ASSEMBLY__ */
 
 #ifdef CONFIG_MMU
diff --git a/arch/m68k/include/asm/page_no.h b/arch/m68k/include/asm/page_no.h
index a8d1c60..9059572 100644
--- a/arch/m68k/include/asm/page_no.h
+++ b/arch/m68k/include/asm/page_no.h
@@ -5,9 +5,6 @@
  
 extern unsigned long memory_start;
 extern unsigned long memory_end;
-extern unsigned long _rambase;
-extern unsigned long _ramstart;
-extern unsigned long _ramend;
 
 #define get_user_page(vaddr)		__get_free_page(GFP_KERNEL)
 #define free_user_page(page, addr)	free_page(addr)
diff --git a/arch/m68k/platform/54xx/config.c b/arch/m68k/platform/54xx/config.c
index 7813098..ee04354 100644
--- a/arch/m68k/platform/54xx/config.c
+++ b/arch/m68k/platform/54xx/config.c
@@ -13,11 +13,17 @@
 #include <linux/init.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
+#include <linux/mm.h>
+#include <linux/bootmem.h>
+#include <asm/pgalloc.h>
 #include <asm/machdep.h>
 #include <asm/coldfire.h>
 #include <asm/m54xxsim.h>
 #include <asm/mcfuart.h>
 #include <asm/m54xxgpt.h>
+#ifdef CONFIG_MMU
+#include <asm/mmu_context.h>
+#endif
 
 /***************************************************************************/
 
@@ -95,8 +101,49 @@ static void mcf54xx_reset(void)
 
 /***************************************************************************/
 
+#ifdef CONFIG_MMU
+
+unsigned long num_pages;
+
+static void __init mcf54xx_bootmem_alloc(void)
+{
+	unsigned long start_pfn;
+	unsigned long memstart;
+
+	/* _rambase and _ramend will be naturally page aligned */
+	m68k_memory[0].addr = _rambase;
+	m68k_memory[0].size = _ramend - _rambase;
+
+	/* compute total pages in system */
+	num_pages = (_ramend - _rambase) >> PAGE_SHIFT;
+
+	/* page numbers */
+	memstart = PAGE_ALIGN(_ramstart);
+	min_low_pfn = _rambase >> PAGE_SHIFT;
+	start_pfn = memstart >> PAGE_SHIFT;
+	max_low_pfn = _ramend >> PAGE_SHIFT;
+	high_memory = (void *)_ramend;
+
+	m68k_virt_to_node_shift = fls(_ramend - _rambase - 1) - 6;
+	module_fixup(NULL, __start_fixup, __stop_fixup);
+
+	/* setup bootmem data */
+	m68k_setup_node(0);
+	memstart += init_bootmem_node(NODE_DATA(0), start_pfn,
+		min_low_pfn, max_low_pfn);
+	free_bootmem_node(NODE_DATA(0), memstart, _ramend - memstart);
+}
+
+#endif /* CONFIG_MMU */
+
+/***************************************************************************/
+
 void __init config_BSP(char *commandp, int size)
 {
+#ifdef CONFIG_MMU
+	mcf54xx_bootmem_alloc();
+	mmu_context_init();
+#endif
 	mach_reset = mcf54xx_reset;
 	m54xx_uarts_init();
 }
-- 
1.7.0.4
