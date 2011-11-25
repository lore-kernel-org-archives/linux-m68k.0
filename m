From: <gerg@snapgear.com>
Subject: [PATCH 20/35] m68k: ColdFire V4e MMU context support code
Date: Fri, 25 Nov 2011 13:41:05 +1000
Message-ID: <1322192480-22822-21-git-send-email-gerg@snapgear.com>
References: <1322192480-22822-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from dalsmrelay2.nai.com ([205.227.136.216]:53449 "EHLO
	dalsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752388Ab1KYDj3 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 24 Nov 2011 22:39:29 -0500
In-Reply-To: <1322192480-22822-1-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

Add code to manage the context's of the ColdFire V4e MMU. This code is
mostly taken from the Freescale 2.6.35 kernel BSP for MMU enabled ColdFire.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 arch/m68k/include/asm/atomic.h      |   10 ++
 arch/m68k/include/asm/mmu_context.h |  250 ++++++++++++++++++++++++++++-------
 2 files changed, 211 insertions(+), 49 deletions(-)

diff --git a/arch/m68k/include/asm/atomic.h b/arch/m68k/include/asm/atomic.h
index 65c6be6..4eba796 100644
--- a/arch/m68k/include/asm/atomic.h
+++ b/arch/m68k/include/asm/atomic.h
@@ -55,6 +55,16 @@ static inline int atomic_dec_and_test(atomic_t *v)
 	return c != 0;
 }
 
+static inline int atomic_dec_and_test_lt(atomic_t *v)
+{
+	char c;
+	__asm__ __volatile__(
+		"subql #1,%1; slt %0"
+		: "=d" (c), "=m" (*v)
+		: "m" (*v));
+	return c != 0;
+}
+
 static inline int atomic_inc_and_test(atomic_t *v)
 {
 	char c;
diff --git a/arch/m68k/include/asm/mmu_context.h b/arch/m68k/include/asm/mmu_context.h
index 7d4341e..dc3be99 100644
--- a/arch/m68k/include/asm/mmu_context.h
+++ b/arch/m68k/include/asm/mmu_context.h
@@ -8,7 +8,206 @@ static inline void enter_lazy_tlb(struct mm_struct *mm, struct task_struct *tsk)
 }
 
 #ifdef CONFIG_MMU
-#ifndef CONFIG_SUN3
+
+#if defined(CONFIG_COLDFIRE)
+
+#include <asm/atomic.h>
+#include <asm/bitops.h>
+#include <asm/mcfmmu.h>
+#include <asm/mmu.h>
+
+#define NO_CONTEXT		256
+#define LAST_CONTEXT		255
+#define FIRST_CONTEXT		1
+
+extern unsigned long context_map[];
+extern mm_context_t next_mmu_context;
+
+extern atomic_t nr_free_contexts;
+extern struct mm_struct *context_mm[LAST_CONTEXT+1];
+extern void steal_context(void);
+
+static inline void get_mmu_context(struct mm_struct *mm)
+{
+	mm_context_t ctx;
+
+	if (mm->context != NO_CONTEXT)
+		return;
+	while (atomic_dec_and_test_lt(&nr_free_contexts)) {
+		atomic_inc(&nr_free_contexts);
+		steal_context();
+	}
+	ctx = next_mmu_context;
+	while (test_and_set_bit(ctx, context_map)) {
+		ctx = find_next_zero_bit(context_map, LAST_CONTEXT+1, ctx);
+		if (ctx > LAST_CONTEXT)
+			ctx = 0;
+	}
+	next_mmu_context = (ctx + 1) & LAST_CONTEXT;
+	mm->context = ctx;
+	context_mm[ctx] = mm;
+}
+
+/*
+ * Set up the context for a new address space.
+ */
+#define init_new_context(tsk, mm)	(((mm)->context = NO_CONTEXT), 0)
+
+/*
+ * We're finished using the context for an address space.
+ */
+static inline void destroy_context(struct mm_struct *mm)
+{
+	if (mm->context != NO_CONTEXT) {
+		clear_bit(mm->context, context_map);
+		mm->context = NO_CONTEXT;
+		atomic_inc(&nr_free_contexts);
+	}
+}
+
+static inline void set_context(mm_context_t context, pgd_t *pgd)
+{
+	__asm__ __volatile__ ("movec %0,%%asid" : : "d" (context));
+}
+
+static inline void switch_mm(struct mm_struct *prev, struct mm_struct *next,
+	struct task_struct *tsk)
+{
+	get_mmu_context(tsk->mm);
+	set_context(tsk->mm->context, next->pgd);
+}
+
+/*
+ * After we have set current->mm to a new value, this activates
+ * the context for the new mm so we see the new mappings.
+ */
+static inline void activate_mm(struct mm_struct *active_mm,
+	struct mm_struct *mm)
+{
+	get_mmu_context(mm);
+	set_context(mm->context, mm->pgd);
+}
+
+#define deactivate_mm(tsk, mm) do { } while (0)
+
+extern void mmu_context_init(void);
+#define prepare_arch_switch(next) load_ksp_mmu(next)
+
+static inline void load_ksp_mmu(struct task_struct *task)
+{
+	unsigned long flags;
+	struct mm_struct *mm;
+	int asid;
+	pgd_t *pgd;
+	pmd_t *pmd;
+	pte_t *pte;
+	unsigned long mmuar;
+
+	local_irq_save(flags);
+	mmuar = task->thread.ksp;
+
+	/* Search for a valid TLB entry, if one is found, don't remap */
+	mmu_write(MMUAR, mmuar);
+	mmu_write(MMUOR, MMUOR_STLB | MMUOR_ADR);
+	if (mmu_read(MMUSR) & MMUSR_HIT)
+		goto end;
+
+	if (mmuar >= PAGE_OFFSET) {
+		mm = &init_mm;
+	} else {
+		pr_info("load_ksp_mmu: non-kernel mm found: 0x%p\n", task->mm);
+		mm = task->mm;
+	}
+
+	if (!mm)
+		goto bug;
+
+	pgd = pgd_offset(mm, mmuar);
+	if (pgd_none(*pgd))
+		goto bug;
+
+	pmd = pmd_offset(pgd, mmuar);
+	if (pmd_none(*pmd))
+		goto bug;
+
+	pte = (mmuar >= PAGE_OFFSET) ? pte_offset_kernel(pmd, mmuar)
+				     : pte_offset_map(pmd, mmuar);
+	if (pte_none(*pte) || !pte_present(*pte))
+		goto bug;
+
+	set_pte(pte, pte_mkyoung(*pte));
+	asid = mm->context & 0xff;
+	if (!pte_dirty(*pte) && mmuar <= PAGE_OFFSET)
+		set_pte(pte, pte_wrprotect(*pte));
+
+	mmu_write(MMUTR, (mmuar & PAGE_MASK) | (asid << MMUTR_IDN) |
+		(((int)(pte->pte) & (int)CF_PAGE_MMUTR_MASK)
+		>> CF_PAGE_MMUTR_SHIFT) | MMUTR_V);
+
+	mmu_write(MMUDR, (pte_val(*pte) & PAGE_MASK) |
+		((pte->pte) & CF_PAGE_MMUDR_MASK) | MMUDR_SZ_8KB | MMUDR_X);
+
+	mmu_write(MMUOR, MMUOR_ACC | MMUOR_UAA);
+
+	goto end;
+
+bug:
+	pr_info("ksp load failed: mm=0x%p ksp=0x08%lx\n", mm, mmuar);
+end:
+	local_irq_restore(flags);
+}
+
+#elif defined(CONFIG_SUN3)
+#include <asm/sun3mmu.h>
+#include <linux/sched.h>
+
+extern unsigned long get_free_context(struct mm_struct *mm);
+extern void clear_context(unsigned long context);
+
+/* set the context for a new task to unmapped */
+static inline int init_new_context(struct task_struct *tsk,
+				   struct mm_struct *mm)
+{
+	mm->context = SUN3_INVALID_CONTEXT;
+	return 0;
+}
+
+/* find the context given to this process, and if it hasn't already
+   got one, go get one for it. */
+static inline void get_mmu_context(struct mm_struct *mm)
+{
+	if (mm->context == SUN3_INVALID_CONTEXT)
+		mm->context = get_free_context(mm);
+}
+
+/* flush context if allocated... */
+static inline void destroy_context(struct mm_struct *mm)
+{
+	if (mm->context != SUN3_INVALID_CONTEXT)
+		clear_context(mm->context);
+}
+
+static inline void activate_context(struct mm_struct *mm)
+{
+	get_mmu_context(mm);
+	sun3_put_context(mm->context);
+}
+
+static inline void switch_mm(struct mm_struct *prev, struct mm_struct *next,
+			     struct task_struct *tsk)
+{
+	activate_context(tsk->mm);
+}
+
+#define deactivate_mm(tsk, mm)	do { } while (0)
+
+static inline void activate_mm(struct mm_struct *prev_mm,
+			       struct mm_struct *next_mm)
+{
+	activate_context(next_mm);
+}
+
+#else
 
 #include <asm/setup.h>
 #include <asm/page.h>
@@ -103,55 +302,8 @@ static inline void activate_mm(struct mm_struct *prev_mm,
 		switch_mm_0460(next_mm);
 }
 
-#else  /* CONFIG_SUN3 */
-#include <asm/sun3mmu.h>
-#include <linux/sched.h>
-
-extern unsigned long get_free_context(struct mm_struct *mm);
-extern void clear_context(unsigned long context);
-
-/* set the context for a new task to unmapped */
-static inline int init_new_context(struct task_struct *tsk, struct mm_struct *mm)
-{
-	mm->context = SUN3_INVALID_CONTEXT;
-	return 0;
-}
-
-/* find the context given to this process, and if it hasn't already
-   got one, go get one for it. */
-static inline void get_mmu_context(struct mm_struct *mm)
-{
-	if(mm->context == SUN3_INVALID_CONTEXT)
-		mm->context = get_free_context(mm);
-}
-
-/* flush context if allocated... */
-static inline void destroy_context(struct mm_struct *mm)
-{
-	if(mm->context != SUN3_INVALID_CONTEXT)
-		clear_context(mm->context);
-}
-
-static inline void activate_context(struct mm_struct *mm)
-{
-	get_mmu_context(mm);
-	sun3_put_context(mm->context);
-}
-
-static inline void switch_mm(struct mm_struct *prev, struct mm_struct *next, struct task_struct *tsk)
-{
-	activate_context(tsk->mm);
-}
-
-#define deactivate_mm(tsk,mm)	do { } while (0)
-
-static inline void activate_mm(struct mm_struct *prev_mm,
-			       struct mm_struct *next_mm)
-{
-	activate_context(next_mm);
-}
-
 #endif
+
 #else /* !CONFIG_MMU */
 
 static inline int init_new_context(struct task_struct *tsk, struct mm_struct *mm)
-- 
1.7.0.4
