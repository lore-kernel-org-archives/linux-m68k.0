From: sfking@fdwdc.com
Subject: [RFC 06/31] proof of concept merge of m68k and m68knommu
Date: Sun,  6 Sep 2009 22:39:56 -0700
Message-ID: <afa7a198356e79718b7682ea33cdfeec1933ae3d.1252222133.git.sfking__2115.40984823859$1252302446$gmane$org@fdwdc.com>
References: <cover.1252222129.git.sfking@fdwdc.com>
 <cfdcab7374087d5279ec9a1269831e8159d98f2b.1252222133.git.sfking@fdwdc.com>
 <8cb57205150fb96915e9d12c936be301a5e1e1e1.1252222133.git.sfking@fdwdc.com>
 <44c52df23985288bc2f4a819b73b3cc6da0826b9.1252222133.git.sfking@fdwdc.com>
 <6db080fb352e20adab49ed7762d3200831160b0f.1252222133.git.sfking@fdwdc.com>
 <c2e845e94079ee2a24e19456666f571c687f93f7.1252222133.git.sfking@fdwdc.com>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from smtp109.biz.mail.mud.yahoo.com ([68.142.201.178]:34391 "HELO
	smtp109.biz.mail.mud.yahoo.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with SMTP id S1758859AbZIGFrF (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 7 Sep 2009 01:47:05 -0400
In-Reply-To: <c2e845e94079ee2a24e19456666f571c687f93f7.1252222133.git.sfking@fdwdc.com>
In-Reply-To: <cover.1252222129.git.sfking@fdwdc.com>
References: <cover.1252222129.git.sfking@fdwdc.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: uclinux-dev@uclinux.org
Cc: gerg@snapgear.com, linux-m68k@lists.linux-m68k.org

---
 arch/m68k/kernel/asm-offsets.c                     |  112 +-------------------
 .../kernel/{asm-offsets.c => asm-offsets_mm.c}     |    0 
 .../asm-offsets.c => m68k/kernel/asm-offsets_no.c} |    0 
 3 files changed, 5 insertions(+), 107 deletions(-)
 copy arch/m68k/kernel/{asm-offsets.c => asm-offsets_mm.c} (100%)
 copy arch/{m68knommu/kernel/asm-offsets.c => m68k/kernel/asm-offsets_no.c} (100%)

diff --git a/arch/m68k/kernel/asm-offsets.c b/arch/m68k/kernel/asm-offsets.c
index b1f012f..59a69a5 100644
--- a/arch/m68k/kernel/asm-offsets.c
+++ b/arch/m68k/kernel/asm-offsets.c
@@ -1,107 +1,5 @@
-/*
- * This program is used to generate definitions needed by
- * assembly language modules.
- *
- * We use the technique used in the OSF Mach kernel code:
- * generate asm statements containing #defines,
- * compile this file to assembler, and then extract the
- * #defines from the assembly-language output.
- */
-
-#include <linux/stddef.h>
-#include <linux/sched.h>
-#include <linux/kernel_stat.h>
-#include <linux/kbuild.h>
-#include <asm/bootinfo.h>
-#include <asm/irq.h>
-#include <asm/amigahw.h>
-#include <linux/font.h>
-
-int main(void)
-{
-	/* offsets into the task struct */
-	DEFINE(TASK_STATE, offsetof(struct task_struct, state));
-	DEFINE(TASK_FLAGS, offsetof(struct task_struct, flags));
-	DEFINE(TASK_PTRACE, offsetof(struct task_struct, ptrace));
-	DEFINE(TASK_THREAD, offsetof(struct task_struct, thread));
-	DEFINE(TASK_INFO, offsetof(struct task_struct, thread.info));
-	DEFINE(TASK_MM, offsetof(struct task_struct, mm));
-	DEFINE(TASK_ACTIVE_MM, offsetof(struct task_struct, active_mm));
-
-	/* offsets into the thread struct */
-	DEFINE(THREAD_KSP, offsetof(struct thread_struct, ksp));
-	DEFINE(THREAD_USP, offsetof(struct thread_struct, usp));
-	DEFINE(THREAD_SR, offsetof(struct thread_struct, sr));
-	DEFINE(THREAD_FS, offsetof(struct thread_struct, fs));
-	DEFINE(THREAD_CRP, offsetof(struct thread_struct, crp));
-	DEFINE(THREAD_ESP0, offsetof(struct thread_struct, esp0));
-	DEFINE(THREAD_FPREG, offsetof(struct thread_struct, fp));
-	DEFINE(THREAD_FPCNTL, offsetof(struct thread_struct, fpcntl));
-	DEFINE(THREAD_FPSTATE, offsetof(struct thread_struct, fpstate));
-
-	/* offsets into the thread_info struct */
-	DEFINE(TINFO_PREEMPT, offsetof(struct thread_info, preempt_count));
-	DEFINE(TINFO_FLAGS, offsetof(struct thread_info, flags));
-
-	/* offsets into the pt_regs */
-	DEFINE(PT_D0, offsetof(struct pt_regs, d0));
-	DEFINE(PT_ORIG_D0, offsetof(struct pt_regs, orig_d0));
-	DEFINE(PT_D1, offsetof(struct pt_regs, d1));
-	DEFINE(PT_D2, offsetof(struct pt_regs, d2));
-	DEFINE(PT_D3, offsetof(struct pt_regs, d3));
-	DEFINE(PT_D4, offsetof(struct pt_regs, d4));
-	DEFINE(PT_D5, offsetof(struct pt_regs, d5));
-	DEFINE(PT_A0, offsetof(struct pt_regs, a0));
-	DEFINE(PT_A1, offsetof(struct pt_regs, a1));
-	DEFINE(PT_A2, offsetof(struct pt_regs, a2));
-	DEFINE(PT_PC, offsetof(struct pt_regs, pc));
-	DEFINE(PT_SR, offsetof(struct pt_regs, sr));
-	/* bitfields are a bit difficult */
-	DEFINE(PT_VECTOR, offsetof(struct pt_regs, pc) + 4);
-
-	/* offsets into the irq_handler struct */
-	DEFINE(IRQ_HANDLER, offsetof(struct irq_node, handler));
-	DEFINE(IRQ_DEVID, offsetof(struct irq_node, dev_id));
-	DEFINE(IRQ_NEXT, offsetof(struct irq_node, next));
-
-	/* offsets into the kernel_stat struct */
-	DEFINE(STAT_IRQ, offsetof(struct kernel_stat, irqs));
-
-	/* offsets into the irq_cpustat_t struct */
-	DEFINE(CPUSTAT_SOFTIRQ_PENDING, offsetof(irq_cpustat_t, __softirq_pending));
-
-	/* offsets into the bi_record struct */
-	DEFINE(BIR_TAG, offsetof(struct bi_record, tag));
-	DEFINE(BIR_SIZE, offsetof(struct bi_record, size));
-	DEFINE(BIR_DATA, offsetof(struct bi_record, data));
-
-	/* offsets into font_desc (drivers/video/console/font.h) */
-	DEFINE(FONT_DESC_IDX, offsetof(struct font_desc, idx));
-	DEFINE(FONT_DESC_NAME, offsetof(struct font_desc, name));
-	DEFINE(FONT_DESC_WIDTH, offsetof(struct font_desc, width));
-	DEFINE(FONT_DESC_HEIGHT, offsetof(struct font_desc, height));
-	DEFINE(FONT_DESC_DATA, offsetof(struct font_desc, data));
-	DEFINE(FONT_DESC_PREF, offsetof(struct font_desc, pref));
-
-	/* signal defines */
-	DEFINE(SIGSEGV, SIGSEGV);
-	DEFINE(SEGV_MAPERR, SEGV_MAPERR);
-	DEFINE(SIGTRAP, SIGTRAP);
-	DEFINE(TRAP_TRACE, TRAP_TRACE);
-
-	/* offsets into the custom struct */
-	DEFINE(CUSTOMBASE, &amiga_custom);
-	DEFINE(C_INTENAR, offsetof(struct CUSTOM, intenar));
-	DEFINE(C_INTREQR, offsetof(struct CUSTOM, intreqr));
-	DEFINE(C_INTENA, offsetof(struct CUSTOM, intena));
-	DEFINE(C_INTREQ, offsetof(struct CUSTOM, intreq));
-	DEFINE(C_SERDATR, offsetof(struct CUSTOM, serdatr));
-	DEFINE(C_SERDAT, offsetof(struct CUSTOM, serdat));
-	DEFINE(C_SERPER, offsetof(struct CUSTOM, serper));
-	DEFINE(CIAABASE, &ciaa);
-	DEFINE(CIABBASE, &ciab);
-	DEFINE(C_PRA, offsetof(struct CIA, pra));
-	DEFINE(ZTWOBASE, zTwoBase);
-
-	return 0;
-}
+#ifdef CONFIG_MMU
+#include "asm-offsets_mm.c"
+#else
+#include "asm-offsets_no.c"
+#endif
diff --git a/arch/m68k/kernel/asm-offsets.c b/arch/m68k/kernel/asm-offsets_mm.c
similarity index 100%
copy from arch/m68k/kernel/asm-offsets.c
copy to arch/m68k/kernel/asm-offsets_mm.c
diff --git a/arch/m68knommu/kernel/asm-offsets.c b/arch/m68k/kernel/asm-offsets_no.c
similarity index 100%
copy from arch/m68knommu/kernel/asm-offsets.c
copy to arch/m68k/kernel/asm-offsets_no.c
-- 
1.5.6.5

