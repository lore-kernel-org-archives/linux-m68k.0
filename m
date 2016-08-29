From: Greg Ungerer <gerg@linux-m68k.org>
Subject: [PATCH 4/8] m68k: move ColdFire _bootmem_alloc code
Date: Mon, 29 Aug 2016 21:43:20 +1000
Message-ID: <1472471004-4580-5-git-send-email-gerg@linux-m68k.org>
References: <1472471004-4580-1-git-send-email-gerg@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from icp-osb-irony-out9.external.iinet.net.au ([203.59.1.226]:49468
        "EHLO icp-osb-irony-out9.external.iinet.net.au" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S932814AbcH2LmT (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>);
        Mon, 29 Aug 2016 07:42:19 -0400
In-Reply-To: <1472471004-4580-1-git-send-email-gerg@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org
Cc: Greg Ungerer <gerg@linux-m68k.org>

The early ColdFire bootmem_alloc() code is currently only included in
the board support for the Coldire 54xx platforms. It will be used on all
ColdFire MMU enabled platforms as others are supported. So move the
mcf54xx_bootmem_alloc() function to be generally available to all MMU
enabled ColdFire parts (and use a more generic name for it).

Signed-off-by: Greg Ungerer <gerg@linux-m68k.org>
---
 arch/m68k/coldfire/m54xx.c     | 40 +---------------------------------------
 arch/m68k/include/asm/mcfmmu.h |  1 +
 arch/m68k/mm/mcfmmu.c          | 31 ++++++++++++++++++++++++++++++-
 3 files changed, 32 insertions(+), 40 deletions(-)

diff --git a/arch/m68k/coldfire/m54xx.c b/arch/m68k/coldfire/m54xx.c
index c32f767..386df3b 100644
--- a/arch/m68k/coldfire/m54xx.c
+++ b/arch/m68k/coldfire/m54xx.c
@@ -25,7 +25,6 @@
 #include <asm/m54xxgpt.h>
 #ifdef CONFIG_MMU
 #include <asm/mmu_context.h>
-#include <linux/pfn.h>
 #endif
 
 /***************************************************************************/
@@ -78,47 +77,10 @@ static void mcf54xx_reset(void)
 
 /***************************************************************************/
 
-#ifdef CONFIG_MMU
-
-unsigned long num_pages;
-
-static void __init mcf54xx_bootmem_alloc(void)
-{
-	unsigned long start_pfn;
-	unsigned long memstart;
-
-	/* _rambase and _ramend will be naturally page aligned */
-	m68k_memory[0].addr = _rambase;
-	m68k_memory[0].size = _ramend - _rambase;
-
-	/* compute total pages in system */
-	num_pages = PFN_DOWN(_ramend - _rambase);
-
-	/* page numbers */
-	memstart = PAGE_ALIGN(_ramstart);
-	min_low_pfn = PFN_DOWN(_rambase);
-	start_pfn = PFN_DOWN(memstart);
-	max_pfn = max_low_pfn = PFN_DOWN(_ramend);
-	high_memory = (void *)_ramend;
-
-	m68k_virt_to_node_shift = fls(_ramend - _rambase - 1) - 6;
-	module_fixup(NULL, __start_fixup, __stop_fixup);
-
-	/* setup bootmem data */
-	m68k_setup_node(0);
-	memstart += init_bootmem_node(NODE_DATA(0), start_pfn,
-		min_low_pfn, max_low_pfn);
-	free_bootmem_node(NODE_DATA(0), memstart, _ramend - memstart);
-}
-
-#endif /* CONFIG_MMU */
-
-/***************************************************************************/
-
 void __init config_BSP(char *commandp, int size)
 {
 #ifdef CONFIG_MMU
-	mcf54xx_bootmem_alloc();
+	cf_bootmem_alloc();
 	mmu_context_init();
 #endif
 	mach_reset = mcf54xx_reset;
diff --git a/arch/m68k/include/asm/mcfmmu.h b/arch/m68k/include/asm/mcfmmu.h
index 8824236..10f9930 100644
--- a/arch/m68k/include/asm/mcfmmu.h
+++ b/arch/m68k/include/asm/mcfmmu.h
@@ -105,6 +105,7 @@ static inline void mmu_write(u32 a, u32 v)
 	__asm__ __volatile__ ("nop");
 }
 
+void cf_bootmem_alloc(void);
 int cf_tlb_miss(struct pt_regs *regs, int write, int dtlb, int extension_word);
 
 #endif
diff --git a/arch/m68k/mm/mcfmmu.c b/arch/m68k/mm/mcfmmu.c
index f58fafe..87131cd 100644
--- a/arch/m68k/mm/mcfmmu.c
+++ b/arch/m68k/mm/mcfmmu.c
@@ -27,7 +27,7 @@ mm_context_t next_mmu_context;
 unsigned long context_map[LAST_CONTEXT / BITS_PER_LONG + 1];
 atomic_t nr_free_contexts;
 struct mm_struct *context_mm[LAST_CONTEXT+1];
-extern unsigned long num_pages;
+unsigned long num_pages;
 
 /*
  * ColdFire paging_init derived from sun3.
@@ -150,6 +150,35 @@ int cf_tlb_miss(struct pt_regs *regs, int write, int dtlb, int extension_word)
 	return 0;
 }
 
+void __init cf_bootmem_alloc(void)
+{
+	unsigned long start_pfn;
+	unsigned long memstart;
+
+	/* _rambase and _ramend will be naturally page aligned */
+	m68k_memory[0].addr = _rambase;
+	m68k_memory[0].size = _ramend - _rambase;
+
+	/* compute total pages in system */
+	num_pages = PFN_DOWN(_ramend - _rambase);
+
+	/* page numbers */
+	memstart = PAGE_ALIGN(_ramstart);
+	min_low_pfn = PFN_DOWN(_rambase);
+	start_pfn = PFN_DOWN(memstart);
+	max_pfn = max_low_pfn = PFN_DOWN(_ramend);
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
 /*
  * Initialize the context management stuff.
  * The following was taken from arch/ppc/mmu_context.c
-- 
1.9.1
