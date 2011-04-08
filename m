From: Greg Ungerer <gerg@uclinux.org>
Subject: [PATCH] m68k: merge mmu and non-mmu versions of asm-offsets.c
Date: Fri, 8 Apr 2011 22:02:15 +1000
Message-ID: <1302264135-6170-1-git-send-email-gerg@uclinux.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:28413 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754293Ab1DHMMb (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 8 Apr 2011 08:12:31 -0400
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org
Cc: Greg Ungerer <gerg@uclinux.org>

It is strait forward to merge the mmu and non-mmu versions of
asm-offstes.c. Some name changes are required for the preempt and
thread_info.flags in the non-mmu entry.S assembler to make them
consistent for both setups.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/kernel/asm-offsets.c      |  106 ++++++++++++++++++++++++++++++++++-
 arch/m68k/kernel/asm-offsets_mm.c   |  100 ---------------------------------
 arch/m68k/kernel/asm-offsets_no.c   |   76 -------------------------
 arch/m68k/platform/68328/entry.S    |    6 +-
 arch/m68k/platform/68360/entry.S    |    6 +-
 arch/m68k/platform/coldfire/entry.S |   10 ++--
 6 files changed, 114 insertions(+), 190 deletions(-)
 delete mode 100644 arch/m68k/kernel/asm-offsets_mm.c
 delete mode 100644 arch/m68k/kernel/asm-offsets_no.c

diff --git a/arch/m68k/kernel/asm-offsets.c b/arch/m68k/kernel/asm-offsets.c
index 59a69a5..983fed9 100644
--- a/arch/m68k/kernel/asm-offsets.c
+++ b/arch/m68k/kernel/asm-offsets.c
@@ -1,5 +1,105 @@
-#ifdef CONFIG_MMU
-#include "asm-offsets_mm.c"
+/*
+ * This program is used to generate definitions needed by
+ * assembly language modules.
+ *
+ * We use the technique used in the OSF Mach kernel code:
+ * generate asm statements containing #defines,
+ * compile this file to assembler, and then extract the
+ * #defines from the assembly-language output.
+ */
+
+#define ASM_OFFSETS_C
+
+#include <linux/stddef.h>
+#include <linux/sched.h>
+#include <linux/kernel_stat.h>
+#include <linux/kbuild.h>
+#include <asm/bootinfo.h>
+#include <asm/irq.h>
+#include <asm/amigahw.h>
+#include <linux/font.h>
+
+int main(void)
+{
+	/* offsets into the task struct */
+	DEFINE(TASK_THREAD, offsetof(struct task_struct, thread));
+	DEFINE(TASK_MM, offsetof(struct task_struct, mm));
+	DEFINE(TASK_INFO, offsetof(struct task_struct, thread.info));
+	DEFINE(TASK_TINFO, offsetof(struct task_struct, thread.info));
+
+	/* offsets into the thread struct */
+	DEFINE(THREAD_KSP, offsetof(struct thread_struct, ksp));
+	DEFINE(THREAD_USP, offsetof(struct thread_struct, usp));
+	DEFINE(THREAD_SR, offsetof(struct thread_struct, sr));
+	DEFINE(THREAD_FS, offsetof(struct thread_struct, fs));
+	DEFINE(THREAD_CRP, offsetof(struct thread_struct, crp));
+	DEFINE(THREAD_ESP0, offsetof(struct thread_struct, esp0));
+	DEFINE(THREAD_FPREG, offsetof(struct thread_struct, fp));
+	DEFINE(THREAD_FPCNTL, offsetof(struct thread_struct, fpcntl));
+	DEFINE(THREAD_FPSTATE, offsetof(struct thread_struct, fpstate));
+
+	/* offsets into the thread_info struct */
+	DEFINE(TINFO_PREEMPT, offsetof(struct thread_info, preempt_count));
+	DEFINE(TINFO_FLAGS, offsetof(struct thread_info, flags));
+
+	/* offsets into the pt_regs */
+	DEFINE(PT_OFF_D0, offsetof(struct pt_regs, d0));
+	DEFINE(PT_OFF_ORIG_D0, offsetof(struct pt_regs, orig_d0));
+	DEFINE(PT_OFF_D1, offsetof(struct pt_regs, d1));
+	DEFINE(PT_OFF_D2, offsetof(struct pt_regs, d2));
+	DEFINE(PT_OFF_D3, offsetof(struct pt_regs, d3));
+	DEFINE(PT_OFF_D4, offsetof(struct pt_regs, d4));
+	DEFINE(PT_OFF_D5, offsetof(struct pt_regs, d5));
+	DEFINE(PT_OFF_A0, offsetof(struct pt_regs, a0));
+	DEFINE(PT_OFF_A1, offsetof(struct pt_regs, a1));
+	DEFINE(PT_OFF_A2, offsetof(struct pt_regs, a2));
+	DEFINE(PT_OFF_PC, offsetof(struct pt_regs, pc));
+	DEFINE(PT_OFF_SR, offsetof(struct pt_regs, sr));
+
+	/* bitfields are a bit difficult */
+#ifdef CONFIG_COLDFIRE
+	DEFINE(PT_OFF_FORMATVEC, offsetof(struct pt_regs, sr) - 2);
 #else
-#include "asm-offsets_no.c"
+	DEFINE(PT_OFF_FORMATVEC, offsetof(struct pt_regs, pc) + 4);
+#endif
+
+	/* offsets into the irq_cpustat_t struct */
+	DEFINE(CPUSTAT_SOFTIRQ_PENDING, offsetof(irq_cpustat_t, __softirq_pending));
+
+	/* signal defines */
+	DEFINE(LSIGSEGV, SIGSEGV);
+	DEFINE(LSEGV_MAPERR, SEGV_MAPERR);
+	DEFINE(LSIGTRAP, SIGTRAP);
+	DEFINE(LTRAP_TRACE, TRAP_TRACE);
+
+#ifdef CONFIG_MMU
+	/* offsets into the bi_record struct */
+	DEFINE(BIR_TAG, offsetof(struct bi_record, tag));
+	DEFINE(BIR_SIZE, offsetof(struct bi_record, size));
+	DEFINE(BIR_DATA, offsetof(struct bi_record, data));
+
+	/* offsets into font_desc (drivers/video/console/font.h) */
+	DEFINE(FONT_DESC_IDX, offsetof(struct font_desc, idx));
+	DEFINE(FONT_DESC_NAME, offsetof(struct font_desc, name));
+	DEFINE(FONT_DESC_WIDTH, offsetof(struct font_desc, width));
+	DEFINE(FONT_DESC_HEIGHT, offsetof(struct font_desc, height));
+	DEFINE(FONT_DESC_DATA, offsetof(struct font_desc, data));
+	DEFINE(FONT_DESC_PREF, offsetof(struct font_desc, pref));
+
+	/* offsets into the custom struct */
+	DEFINE(CUSTOMBASE, &amiga_custom);
+	DEFINE(C_INTENAR, offsetof(struct CUSTOM, intenar));
+	DEFINE(C_INTREQR, offsetof(struct CUSTOM, intreqr));
+	DEFINE(C_INTENA, offsetof(struct CUSTOM, intena));
+	DEFINE(C_INTREQ, offsetof(struct CUSTOM, intreq));
+	DEFINE(C_SERDATR, offsetof(struct CUSTOM, serdatr));
+	DEFINE(C_SERDAT, offsetof(struct CUSTOM, serdat));
+	DEFINE(C_SERPER, offsetof(struct CUSTOM, serper));
+	DEFINE(CIAABASE, &ciaa);
+	DEFINE(CIABBASE, &ciab);
+	DEFINE(C_PRA, offsetof(struct CIA, pra));
+	DEFINE(ZTWOBASE, zTwoBase);
 #endif
+
+	return 0;
+}
diff --git a/arch/m68k/kernel/asm-offsets_mm.c b/arch/m68k/kernel/asm-offsets_mm.c
deleted file mode 100644
index 78e59b8..0000000
--- a/arch/m68k/kernel/asm-offsets_mm.c
+++ /dev/null
@@ -1,100 +0,0 @@
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
-#define ASM_OFFSETS_C
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
-	DEFINE(TASK_THREAD, offsetof(struct task_struct, thread));
-	DEFINE(TASK_INFO, offsetof(struct task_struct, thread.info));
-	DEFINE(TASK_MM, offsetof(struct task_struct, mm));
-#ifdef CONFIG_MMU
-	DEFINE(TASK_TINFO, offsetof(struct task_struct, thread.info));
-#endif
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
-	DEFINE(PT_OFF_D0, offsetof(struct pt_regs, d0));
-	DEFINE(PT_OFF_ORIG_D0, offsetof(struct pt_regs, orig_d0));
-	DEFINE(PT_OFF_D1, offsetof(struct pt_regs, d1));
-	DEFINE(PT_OFF_D2, offsetof(struct pt_regs, d2));
-	DEFINE(PT_OFF_D3, offsetof(struct pt_regs, d3));
-	DEFINE(PT_OFF_D4, offsetof(struct pt_regs, d4));
-	DEFINE(PT_OFF_D5, offsetof(struct pt_regs, d5));
-	DEFINE(PT_OFF_A0, offsetof(struct pt_regs, a0));
-	DEFINE(PT_OFF_A1, offsetof(struct pt_regs, a1));
-	DEFINE(PT_OFF_A2, offsetof(struct pt_regs, a2));
-	DEFINE(PT_OFF_PC, offsetof(struct pt_regs, pc));
-	DEFINE(PT_OFF_SR, offsetof(struct pt_regs, sr));
-	/* bitfields are a bit difficult */
-	DEFINE(PT_OFF_FORMATVEC, offsetof(struct pt_regs, pc) + 4);
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
-	DEFINE(LSIGSEGV, SIGSEGV);
-	DEFINE(LSEGV_MAPERR, SEGV_MAPERR);
-	DEFINE(LSIGTRAP, SIGTRAP);
-	DEFINE(LTRAP_TRACE, TRAP_TRACE);
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
diff --git a/arch/m68k/kernel/asm-offsets_no.c b/arch/m68k/kernel/asm-offsets_no.c
deleted file mode 100644
index ffe02f4..0000000
--- a/arch/m68k/kernel/asm-offsets_no.c
+++ /dev/null
@@ -1,76 +0,0 @@
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
-#include <linux/ptrace.h>
-#include <linux/hardirq.h>
-#include <linux/kbuild.h>
-#include <asm/bootinfo.h>
-#include <asm/irq.h>
-#include <asm/thread_info.h>
-
-int main(void)
-{
-	/* offsets into the task struct */
-	DEFINE(TASK_THREAD, offsetof(struct task_struct, thread));
-	DEFINE(TASK_MM, offsetof(struct task_struct, mm));
-
-	/* offsets into the irq_cpustat_t struct */
-	DEFINE(CPUSTAT_SOFTIRQ_PENDING, offsetof(irq_cpustat_t, __softirq_pending));
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
-	/* offsets into the pt_regs */
-	DEFINE(PT_OFF_D0, offsetof(struct pt_regs, d0));
-	DEFINE(PT_OFF_ORIG_D0, offsetof(struct pt_regs, orig_d0));
-	DEFINE(PT_OFF_D1, offsetof(struct pt_regs, d1));
-	DEFINE(PT_OFF_D2, offsetof(struct pt_regs, d2));
-	DEFINE(PT_OFF_D3, offsetof(struct pt_regs, d3));
-	DEFINE(PT_OFF_D4, offsetof(struct pt_regs, d4));
-	DEFINE(PT_OFF_D5, offsetof(struct pt_regs, d5));
-	DEFINE(PT_OFF_A0, offsetof(struct pt_regs, a0));
-	DEFINE(PT_OFF_A1, offsetof(struct pt_regs, a1));
-	DEFINE(PT_OFF_A2, offsetof(struct pt_regs, a2));
-	DEFINE(PT_OFF_PC, offsetof(struct pt_regs, pc));
-	DEFINE(PT_OFF_SR, offsetof(struct pt_regs, sr));
-
-#ifdef CONFIG_COLDFIRE
-	/* bitfields are a bit difficult */
-	DEFINE(PT_OFF_FORMATVEC, offsetof(struct pt_regs, sr) - 2);
-#else
-	/* bitfields are a bit difficult */
-	DEFINE(PT_OFF_FORMATVEC, offsetof(struct pt_regs, pc) + 4);
-#endif
-
-	/* signal defines */
-	DEFINE(SIGSEGV, SIGSEGV);
-	DEFINE(SEGV_MAPERR, SEGV_MAPERR);
-	DEFINE(SIGTRAP, SIGTRAP);
-	DEFINE(TRAP_TRACE, TRAP_TRACE);
-
-	DEFINE(PT_PTRACED, PT_PTRACED);
-
-	/* Offsets in thread_info structure */
-	DEFINE(TI_FLAGS, offsetof(struct thread_info, flags));
-	DEFINE(TI_PREEMPTCOUNT, offsetof(struct thread_info, preempt_count));
-
-	return 0;
-}
diff --git a/arch/m68k/platform/68328/entry.S b/arch/m68k/platform/68328/entry.S
index 676960c..3e46759 100644
--- a/arch/m68k/platform/68328/entry.S
+++ b/arch/m68k/platform/68328/entry.S
@@ -80,7 +80,7 @@ ENTRY(system_call)
 	movel	%sp,%d1			/* get thread_info pointer */
 	andl	#-THREAD_SIZE,%d1
 	movel	%d1,%a2
-	btst	#(TIF_SYSCALL_TRACE%8),%a2@(TI_FLAGS+(31-TIF_SYSCALL_TRACE)/8)
+	btst	#(TIF_SYSCALL_TRACE%8),%a2@(TINFO_FLAGS+(31-TIF_SYSCALL_TRACE)/8)
 	jne	do_trace
 	cmpl	#NR_syscalls,%d0
 	jcc	badsys
@@ -107,12 +107,12 @@ Luser_return:
 	andl	#-THREAD_SIZE,%d1
 	movel	%d1,%a2
 1:
-	move	%a2@(TI_FLAGS),%d1	/* thread_info->flags */
+	move	%a2@(TINFO_FLAGS),%d1	/* thread_info->flags */
 	jne	Lwork_to_do
 	RESTORE_ALL
 
 Lwork_to_do:
-	movel	%a2@(TI_FLAGS),%d1	/* thread_info->flags */
+	movel	%a2@(TINFO_FLAGS),%d1	/* thread_info->flags */
 	btst	#TIF_NEED_RESCHED,%d1
 	jne	reschedule
 
diff --git a/arch/m68k/platform/68360/entry.S b/arch/m68k/platform/68360/entry.S
index 46c1b18..50dcae6 100644
--- a/arch/m68k/platform/68360/entry.S
+++ b/arch/m68k/platform/68360/entry.S
@@ -76,7 +76,7 @@ ENTRY(system_call)
 	movel	%sp,%d1			/* get thread_info pointer */
 	andl	#-THREAD_SIZE,%d1
 	movel	%d1,%a2
-	btst	#(TIF_SYSCALL_TRACE%8),%a2@(TI_FLAGS+(31-TIF_SYSCALL_TRACE)/8)
+	btst	#(TIF_SYSCALL_TRACE%8),%a2@(TINFO_FLAGS+(31-TIF_SYSCALL_TRACE)/8)
 	jne	do_trace
 	cmpl	#NR_syscalls,%d0
 	jcc	badsys
@@ -103,12 +103,12 @@ Luser_return:
 	andl	#-THREAD_SIZE,%d1
 	movel	%d1,%a2
 1:
-	move	%a2@(TI_FLAGS),%d1	/* thread_info->flags */
+	move	%a2@(TINFO_FLAGS),%d1	/* thread_info->flags */
 	jne	Lwork_to_do
 	RESTORE_ALL
 
 Lwork_to_do:
-	movel	%a2@(TI_FLAGS),%d1	/* thread_info->flags */
+	movel	%a2@(TINFO_FLAGS),%d1	/* thread_info->flags */
 	btst	#TIF_NEED_RESCHED,%d1
 	jne	reschedule
 
diff --git a/arch/m68k/platform/coldfire/entry.S b/arch/m68k/platform/coldfire/entry.S
index 5837cf0..00116c5 100644
--- a/arch/m68k/platform/coldfire/entry.S
+++ b/arch/m68k/platform/coldfire/entry.S
@@ -78,7 +78,7 @@ ENTRY(system_call)
 	movel	%d2,%a0
 	movel	%a0@,%a1		/* save top of frame */
 	movel	%sp,%a1@(TASK_THREAD+THREAD_ESP0)
-	btst	#(TIF_SYSCALL_TRACE%8),%a0@(TI_FLAGS+(31-TIF_SYSCALL_TRACE)/8)
+	btst	#(TIF_SYSCALL_TRACE%8),%a0@(TINFO_FLAGS+(31-TIF_SYSCALL_TRACE)/8)
 	bnes	1f
 
 	movel	%d3,%a0
@@ -113,11 +113,11 @@ ret_from_exception:
 	movel	%sp,%d1			/* get thread_info pointer */
 	andl	#-THREAD_SIZE,%d1	/* at base of kernel stack */
 	movel	%d1,%a0
-	movel	%a0@(TI_FLAGS),%d1	/* get thread_info->flags */
+	movel	%a0@(TINFO_FLAGS),%d1	/* get thread_info->flags */
 	andl	#(1<<TIF_NEED_RESCHED),%d1
 	jeq	Lkernel_return
 
-	movel	%a0@(TI_PREEMPTCOUNT),%d1
+	movel	%a0@(TINFO_PREEMPT),%d1
 	cmpl	#0,%d1
 	jne	Lkernel_return
 
@@ -137,14 +137,14 @@ Luser_return:
 	movel	%sp,%d1			/* get thread_info pointer */
 	andl	#-THREAD_SIZE,%d1	/* at base of kernel stack */
 	movel	%d1,%a0
-	movel	%a0@(TI_FLAGS),%d1	/* get thread_info->flags */
+	movel	%a0@(TINFO_FLAGS),%d1	/* get thread_info->flags */
 	jne	Lwork_to_do		/* still work to do */
 
 Lreturn:
 	RESTORE_USER
 
 Lwork_to_do:
-	movel	%a0@(TI_FLAGS),%d1	/* get thread_info->flags */
+	movel	%a0@(TINFO_FLAGS),%d1	/* get thread_info->flags */
 	move	#0x2000,%sr		/* enable intrs again */
 	btst	#TIF_NEED_RESCHED,%d1
 	jne	reschedule
-- 
1.7.0.4
