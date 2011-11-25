From: <gerg@snapgear.com>
Subject: [PATCH 24/35] m68k: ColdFire V4e MMU paging init code and miss handler
Date: Fri, 25 Nov 2011 13:41:09 +1000
Message-ID: <1322192480-22822-25-git-send-email-gerg@snapgear.com>
References: <1322192480-22822-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from dalsmrelay2.nai.com ([205.227.136.216]:53463 "EHLO
	dalsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752430Ab1KYDjf (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 24 Nov 2011 22:39:35 -0500
In-Reply-To: <1322192480-22822-1-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

The different ColdFire V4e MMU requires its own dedicated paging init
code, and a TLB miss handler for its software driven TLB.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 arch/m68k/include/asm/mcfmmu.h |   10 +-
 arch/m68k/mm/mcfmmu.c          |  219 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 225 insertions(+), 4 deletions(-)
 create mode 100644 arch/m68k/mm/mcfmmu.c

diff --git a/arch/m68k/include/asm/mcfmmu.h b/arch/m68k/include/asm/mcfmmu.h
index 84b4c28..34c4240 100644
--- a/arch/m68k/include/asm/mcfmmu.h
+++ b/arch/m68k/include/asm/mcfmmu.h
@@ -92,14 +92,14 @@
 #define	MMUDR_PAN	10			/* Physical address */
 #define	MMUDR_PAMASK	0xfffffc00		/* PA mask */
 
-/*
- *	Simple access functions for the MMU registers. Nothing fancy
- *	currently required, just simple 32bit access.
- */
 #ifndef __ASSEMBLY__
 
 #define	CF_PAGE_PGNUM_MASK	(PAGE_MASK)
 
+/*
+ *	Simple access functions for the MMU registers. Nothing fancy
+ *	currently required, just simple 32bit access.
+ */
 static inline u32 mmu_read(u32 a)
 {
 	return *((volatile u32 *) a);
@@ -111,6 +111,8 @@ static inline void mmu_write(u32 a, u32 v)
 	__asm__ __volatile__ ("nop");
 }
 
+int cf_tlb_miss(struct pt_regs *regs, int write, int dtlb, int extension_word);
+
 #endif
 
 /****************************************************************************/
diff --git a/arch/m68k/mm/mcfmmu.c b/arch/m68k/mm/mcfmmu.c
new file mode 100644
index 0000000..7e7130b
--- /dev/null
+++ b/arch/m68k/mm/mcfmmu.c
@@ -0,0 +1,219 @@
+/*
+ * Based upon linux/arch/m68k/mm/sun3mmu.c
+ * Based upon linux/arch/ppc/mm/mmu_context.c
+ *
+ * Implementations of mm routines specific to the Coldfire MMU.
+ *
+ * Copyright (c) 2008 Freescale Semiconductor, Inc.
+ */
+
+#include <linux/signal.h>
+#include <linux/sched.h>
+#include <linux/mm.h>
+#include <linux/swap.h>
+#include <linux/kernel.h>
+#include <linux/string.h>
+#include <linux/types.h>
+#include <linux/init.h>
+#ifdef CONFIG_BLK_DEV_RAM
+#include <linux/blkdev.h>
+#endif
+#include <linux/bootmem.h>
+
+#include <asm/setup.h>
+#include <asm/uaccess.h>
+#include <asm/page.h>
+#include <asm/pgtable.h>
+#include <asm/system.h>
+#include <asm/machdep.h>
+#include <asm/io.h>
+#include <asm/mmu_context.h>
+#include <asm/mcf_pgalloc.h>
+#include <asm/coldfire.h>
+#include <asm/tlbflush.h>
+
+#define KMAPAREA(x)	((x >= VMALLOC_START) && (x < KMAP_END))
+
+mm_context_t next_mmu_context;
+unsigned long context_map[LAST_CONTEXT / BITS_PER_LONG + 1];
+atomic_t nr_free_contexts;
+struct mm_struct *context_mm[LAST_CONTEXT+1];
+extern unsigned long num_pages;
+
+void free_initmem(void)
+{
+}
+
+/*
+ * ColdFire paging_init derived from sun3.
+ */
+void __init paging_init(void)
+{
+	pgd_t *pg_dir;
+	pte_t *pg_table;
+	unsigned long address;
+	unsigned long next_pgtable;
+	unsigned long bootmem_end;
+	unsigned long zones_size[MAX_NR_ZONES];
+	unsigned long size;
+	enum zone_type zone;
+	int i;
+
+	empty_zero_page = (void *)alloc_bootmem_pages(PAGE_SIZE);
+	memset((void *)empty_zero_page, 0, PAGE_SIZE);
+
+	pg_dir = swapper_pg_dir;
+	memset(swapper_pg_dir, 0, sizeof(swapper_pg_dir));
+
+	size = num_pages * sizeof(pte_t);
+	size = (size + PAGE_SIZE) & ~(PAGE_SIZE-1);
+	next_pgtable = (unsigned long)alloc_bootmem_pages(size);
+
+	bootmem_end = (next_pgtable + size + PAGE_SIZE) & PAGE_MASK;
+	pg_dir += PAGE_OFFSET >> PGDIR_SHIFT;
+
+	address = PAGE_OFFSET;
+	while (address < (unsigned long)high_memory) {
+		pg_table = (pte_t *)next_pgtable;
+		next_pgtable += PTRS_PER_PTE * sizeof(pte_t);
+		pgd_val(*pg_dir) = (unsigned long) pg_table;
+		pg_dir++;
+
+		/* now change pg_table to kernel virtual addresses */
+		for (i = 0; i < PTRS_PER_PTE; ++i, ++pg_table) {
+			pte_t pte = pfn_pte(virt_to_pfn(address), PAGE_INIT);
+			if (address >= (unsigned long)high_memory)
+				pte_val(pte) = 0;
+
+			set_pte(pg_table, pte);
+			address += PAGE_SIZE;
+		}
+	}
+
+	current->mm = NULL;
+
+	/* clear zones */
+	for (zone = 0; zone < MAX_NR_ZONES; zone++)
+		zones_size[zone] = 0x0;
+
+	zones_size[ZONE_DMA] = (32*1024*1024) >> PAGE_SHIFT;
+
+	/* allocate the rest to NORMAL - head.S marks them CACHE */
+	zones_size[ZONE_NORMAL] =
+		(((unsigned long)high_memory - PAGE_OFFSET) >> PAGE_SHIFT) -
+		zones_size[0];
+
+	free_area_init(zones_size);
+}
+
+int cf_tlb_miss(struct pt_regs *regs, int write, int dtlb, int extension_word)
+{
+	unsigned long flags;
+	unsigned long mmuar;
+	struct mm_struct *mm;
+	pgd_t *pgd;
+	pmd_t *pmd;
+	pte_t *pte;
+	int asid;
+
+	local_irq_save(flags);
+
+	mmuar = (dtlb) ? mmu_read(MMUAR) :
+		regs->pc + (extension_word * sizeof(long));
+
+	mm = (!user_mode(regs) && KMAPAREA(mmuar)) ? &init_mm : current->mm;
+	if (!mm) {
+		local_irq_restore(flags);
+		return -1;
+	}
+
+	pgd = pgd_offset(mm, mmuar);
+	if (pgd_none(*pgd))  {
+		local_irq_restore(flags);
+		return -1;
+	}
+
+	pmd = pmd_offset(pgd, mmuar);
+	if (pmd_none(*pmd)) {
+		local_irq_restore(flags);
+		return -1;
+	}
+
+	pte = (KMAPAREA(mmuar)) ? pte_offset_kernel(pmd, mmuar)
+				: pte_offset_map(pmd, mmuar);
+	if (pte_none(*pte) || !pte_present(*pte)) {
+		local_irq_restore(flags);
+		return -1;
+	}
+
+	if (write) {
+		if (!pte_write(*pte)) {
+			local_irq_restore(flags);
+			return -1;
+		}
+		set_pte(pte, pte_mkdirty(*pte));
+	}
+
+	set_pte(pte, pte_mkyoung(*pte));
+	asid = mm->context & 0xff;
+	if (!pte_dirty(*pte) && !KMAPAREA(mmuar))
+		set_pte(pte, pte_wrprotect(*pte));
+
+	mmu_write(MMUTR, (mmuar & PAGE_MASK) | (asid << MMUTR_IDN) |
+		(((int)(pte->pte) & (int)CF_PAGE_MMUTR_MASK)
+		>> CF_PAGE_MMUTR_SHIFT) | MMUTR_V);
+
+	mmu_write(MMUDR, (pte_val(*pte) & PAGE_MASK) |
+		((pte->pte) & CF_PAGE_MMUDR_MASK) | MMUDR_SZ_8KB | MMUDR_X);
+
+	if (dtlb)
+		mmu_write(MMUOR, MMUOR_ACC | MMUOR_UAA);
+	else
+		mmu_write(MMUOR, MMUOR_ITLB | MMUOR_ACC | MMUOR_UAA);
+
+	local_irq_restore(flags);
+	return 0;
+}
+
+
+/*
+ * Initialize the context management stuff.
+ * The following was taken from arch/ppc/mmu_context.c
+ */
+void __init mmu_context_init(void)
+{
+	/*
+	 * Some processors have too few contexts to reserve one for
+	 * init_mm, and require using context 0 for a normal task.
+	 * Other processors reserve the use of context zero for the kernel.
+	 * This code assumes FIRST_CONTEXT < 32.
+	 */
+	context_map[0] = (1 << FIRST_CONTEXT) - 1;
+	next_mmu_context = FIRST_CONTEXT;
+	atomic_set(&nr_free_contexts, LAST_CONTEXT - FIRST_CONTEXT + 1);
+}
+
+/*
+ * Steal a context from a task that has one at the moment.
+ * This is only used on 8xx and 4xx and we presently assume that
+ * they don't do SMP.  If they do then thicfpgalloc.hs will have to check
+ * whether the MM we steal is in use.
+ * We also assume that this is only used on systems that don't
+ * use an MMU hash table - this is true for 8xx and 4xx.
+ * This isn't an LRU system, it just frees up each context in
+ * turn (sort-of pseudo-random replacement :).  This would be the
+ * place to implement an LRU scheme if anyone was motivated to do it.
+ *  -- paulus
+ */
+void steal_context(void)
+{
+	struct mm_struct *mm;
+	/* free up context `next_mmu_context' */
+	/* if we shouldn't free context 0, don't... */
+	if (next_mmu_context < FIRST_CONTEXT)
+		next_mmu_context = FIRST_CONTEXT;
+	mm = context_mm[next_mmu_context];
+	flush_tlb_mm(mm);
+	destroy_context(mm);
+}
+
-- 
1.7.0.4
