From: <gerg@snapgear.com>
Subject: [PATCH] m68k: remove thread_info struct from thread struct
Date: Mon, 5 Sep 2011 14:41:49 +1000
Message-ID: <1315197709-21421-2-git-send-email-gerg@snapgear.com>
References: <1315197709-21421-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:56304 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750764Ab1IEEmQ (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 5 Sep 2011 00:42:16 -0400
In-Reply-To: <1315197709-21421-1-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

Currently on m68k we have a comeplete thread_info structure stored inside
of the thread_struct, and we also have it in the initial part of the kernel
stack. Mostly the code currently uses the one inside of the thread_struct,
only using the "task" pointer from the stack based one.

This is wasteful and confusing, we should only have the single instance of
thread_info inside the stack page. And this is the norm for all other
architectures.

This change makes m68k handle thread_info consistently on both MMU enabled
and non-MMU setups.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/include/asm/processor.h   |    2 --
 arch/m68k/include/asm/thread_info.h |   26 --------------------------
 arch/m68k/kernel/asm-offsets.c      |    2 +-
 arch/m68k/kernel/entry_mm.S         |   31 +++++++++++++++++++++----------
 4 files changed, 22 insertions(+), 39 deletions(-)

diff --git a/arch/m68k/include/asm/processor.h b/arch/m68k/include/asm/processor.h
index 568facf..7ec0609 100644
--- a/arch/m68k/include/asm/processor.h
+++ b/arch/m68k/include/asm/processor.h
@@ -88,14 +88,12 @@ struct thread_struct {
 	unsigned long  fp[8*3];
 	unsigned long  fpcntl[3];	/* fp control regs */
 	unsigned char  fpstate[FPSTATESIZE];  /* floating point state */
-	struct thread_info info;
 };
 
 #define INIT_THREAD  {							\
 	.ksp	= sizeof(init_stack) + (unsigned long) init_stack,	\
 	.sr	= PS_S,							\
 	.fs	= __KERNEL_DS,						\
-	.info	= INIT_THREAD_INFO(init_task),				\
 }
 
 #ifdef CONFIG_MMU
diff --git a/arch/m68k/include/asm/thread_info.h b/arch/m68k/include/asm/thread_info.h
index 6140b48..01cef3c 100644
--- a/arch/m68k/include/asm/thread_info.h
+++ b/arch/m68k/include/asm/thread_info.h
@@ -47,30 +47,6 @@ struct thread_info {
 
 #define init_stack		(init_thread_union.stack)
 
-#ifdef CONFIG_MMU
-
-#ifndef __ASSEMBLY__
-#include <asm/current.h>
-#endif
-
-#include <asm/asm-offsets.h>
-
-#define task_thread_info(tsk)	((struct thread_info *)((char *)tsk+TASK_INFO))
-#define init_thread_info	(init_task.thread.info)
-#define task_stack_page(tsk)	((tsk)->stack)
-#define current_thread_info()	task_thread_info(current)
-
-#define __HAVE_THREAD_FUNCTIONS
-
-#define setup_thread_stack(p, org) ({			\
-	*(struct task_struct **)(p)->stack = (p);	\
-	task_thread_info(p)->task = (p);		\
-})
-
-#define end_of_stack(p)		((unsigned long *)(p)->stack + 1)
-
-#else /* !CONFIG_MMU */
-
 #ifndef __ASSEMBLY__
 /* how to get the thread information struct from C */
 static inline struct thread_info *current_thread_info(void)
@@ -88,8 +64,6 @@ static inline struct thread_info *current_thread_info(void)
 
 #define init_thread_info	(init_thread_union.thread_info)
 
-#endif /* CONFIG_MMU */
-
 /* entry.S relies on these definitions!
  * bits 0-7 are tested at every exception exit
  * bits 8-15 are also tested at syscall exit
diff --git a/arch/m68k/kernel/asm-offsets.c b/arch/m68k/kernel/asm-offsets.c
index f6a54e2..a972b00 100644
--- a/arch/m68k/kernel/asm-offsets.c
+++ b/arch/m68k/kernel/asm-offsets.c
@@ -24,7 +24,7 @@ int main(void)
 	/* offsets into the task struct */
 	DEFINE(TASK_THREAD, offsetof(struct task_struct, thread));
 	DEFINE(TASK_MM, offsetof(struct task_struct, mm));
-	DEFINE(TASK_INFO, offsetof(struct task_struct, thread.info));
+	DEFINE(TASK_STACK, offsetof(struct task_struct, stack));
 
 	/* offsets into the thread struct */
 	DEFINE(THREAD_KSP, offsetof(struct thread_struct, ksp));
diff --git a/arch/m68k/kernel/entry_mm.S b/arch/m68k/kernel/entry_mm.S
index bd0ec05..ef81351 100644
--- a/arch/m68k/kernel/entry_mm.S
+++ b/arch/m68k/kernel/entry_mm.S
@@ -99,7 +99,8 @@ do_trace_exit:
 	jra	.Lret_from_exception
 
 ENTRY(ret_from_signal)
-	tstb	%curptr@(TASK_INFO+TINFO_FLAGS+2)
+	movel	%curptr@(TASK_STACK),%a1
+	tstb	%a1@(TINFO_FLAGS+2)
 	jge	1f
 	jbsr	syscall_trace
 1:	RESTORE_SWITCH_STACK
@@ -120,11 +121,13 @@ ENTRY(system_call)
 	SAVE_ALL_SYS
 
 	GET_CURRENT(%d1)
+	movel	%d1,%a1
+
 	| save top of frame
 	movel	%sp,%curptr@(TASK_THREAD+THREAD_ESP0)
 
 	| syscall trace?
-	tstb	%curptr@(TASK_INFO+TINFO_FLAGS+2)
+	tstb	%a1@(TINFO_FLAGS+2)
 	jmi	do_trace_entry
 	cmpl	#NR_syscalls,%d0
 	jcc	badsys
@@ -133,7 +136,8 @@ syscall:
 	movel	%d0,%sp@(PT_OFF_D0)	| save the return value
 ret_from_syscall:
 	|oriw	#0x0700,%sr
-	movew	%curptr@(TASK_INFO+TINFO_FLAGS+2),%d0
+	movel	%curptr@(TASK_STACK),%a1
+	movew	%a1@(TINFO_FLAGS+2),%d0
 	jne	syscall_exit_work
 1:	RESTORE_ALL
 
@@ -159,7 +163,8 @@ ENTRY(ret_from_exception)
 	andw	#ALLOWINT,%sr
 
 resume_userspace:
-	moveb	%curptr@(TASK_INFO+TINFO_FLAGS+3),%d0
+	movel	%curptr@(TASK_STACK),%a1
+	moveb	%a1@(TINFO_FLAGS+3),%d0
 	jne	exit_work
 1:	RESTORE_ALL
 
@@ -199,7 +204,8 @@ do_delayed_trace:
 ENTRY(auto_inthandler)
 	SAVE_ALL_INT
 	GET_CURRENT(%d0)
-	addqb	#1,%curptr@(TASK_INFO+TINFO_PREEMPT+1)
+	movel	%d0,%a1
+	addqb	#1,%a1@(TINFO_PREEMPT+1)
 					|  put exception # in d0
 	bfextu	%sp@(PT_OFF_FORMATVEC){#4,#10},%d0
 	subw	#VEC_SPUR,%d0
@@ -211,7 +217,8 @@ auto_irqhandler_fixup = . + 2
 	addql	#8,%sp			|  pop parameters off stack
 
 ret_from_interrupt:
-	subqb	#1,%curptr@(TASK_INFO+TINFO_PREEMPT+1)
+	movel	%curptr@(TASK_STACK),%a1
+	subqb	#1,%a1@(TINFO_PREEMPT+1)
 	jeq	ret_from_last_interrupt
 2:	RESTORE_ALL
 
@@ -232,7 +239,8 @@ ret_from_last_interrupt:
 ENTRY(user_inthandler)
 	SAVE_ALL_INT
 	GET_CURRENT(%d0)
-	addqb	#1,%curptr@(TASK_INFO+TINFO_PREEMPT+1)
+	movel	%d0,%a1
+	addqb	#1,%a1@(TINFO_PREEMPT+1)
 					|  put exception # in d0
 	bfextu	%sp@(PT_OFF_FORMATVEC){#4,#10},%d0
 user_irqvec_fixup = . + 2
@@ -244,7 +252,8 @@ user_irqhandler_fixup = . + 2
 	jsr	__m68k_handle_int	|  process the IRQ
 	addql	#8,%sp			|  pop parameters off stack
 
-	subqb	#1,%curptr@(TASK_INFO+TINFO_PREEMPT+1)
+	movel	%curptr@(TASK_STACK),%a1
+	subqb	#1,%a1@(TINFO_PREEMPT+1)
 	jeq	ret_from_last_interrupt
 	RESTORE_ALL
 
@@ -253,13 +262,15 @@ user_irqhandler_fixup = . + 2
 ENTRY(bad_inthandler)
 	SAVE_ALL_INT
 	GET_CURRENT(%d0)
-	addqb	#1,%curptr@(TASK_INFO+TINFO_PREEMPT+1)
+	movel	%d0,%a1
+	addqb	#1,%a1@(TINFO_PREEMPT+1)
 
 	movel	%sp,%sp@-
 	jsr	handle_badint
 	addql	#4,%sp
 
-	subqb	#1,%curptr@(TASK_INFO+TINFO_PREEMPT+1)
+	movel	%curptr@(TASK_STACK),%a1
+	subqb	#1,%a1@(TINFO_PREEMPT+1)
 	jeq	ret_from_last_interrupt
 	RESTORE_ALL
 
-- 
1.7.0.4
