From: Andreas Schwab <schwab@linux-m68k.org>
Subject: Re: m68k ptrace code
Date: Sun, 10 May 2009 21:32:29 +0200
Message-ID: <m2zldk7nzm.fsf@igel.home>
References: <20090427191230.GA1657@lst.de> <20090427191441.GC1657@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.10]:56737 "EHLO
	mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751371AbZEJTce (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 10 May 2009 15:32:34 -0400
In-Reply-To: <20090427191441.GC1657@lst.de> (Christoph Hellwig's message of
	"Mon, 27 Apr 2009 21:14:41 +0200")
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Christoph Hellwig <hch@lst.de>
Cc: linux-m68k@vger.kernel.org, roland@redhat.com

Christoph Hellwig <hch@lst.de> writes:

> we're trying to get all architectures converted to the new ptrace world
> order where a lot more code is in the common kernel/ptrace.c file
> instead of in the architecture and the boundaries are much cleaner.
> Can you take a look at
>
> 	http://sourceware.org/systemtap/wiki/utrace/arch/HowTo
>
> and see how feasible it is to convert m68k?

Here's a patch for the first step.

Andreas.
---
>From 6b28b94592f8bb81617a315fcdc7d564ea61740a Mon Sep 17 00:00:00 2001
From: Andreas Schwab <schwab@linux-m68k.org>
Date: Sun, 10 May 2009 21:14:52 +0200
Subject: [PATCH] m68k: use generic code for PTRACE_{SYSCALL,CONT,SINGLESTEP}

This defines user_enable_single_step, user_enable_block_step and
user_disable_single_step so that PTRACE_{SYSCALL,CONT,SINGLESTEP} can be
handled by generic ptrace_request.

Signed-off-by: Andreas Schwab <schwab@linux-m68k.org>
---
 arch/m68k/include/asm/ptrace.h |   11 ++++++++
 arch/m68k/kernel/ptrace.c      |   50 ++++++++++++++++-----------------------
 2 files changed, 32 insertions(+), 29 deletions(-)

diff --git a/arch/m68k/include/asm/ptrace.h b/arch/m68k/include/asm/ptrace.h
index 8c9194b..de260e6 100644
--- a/arch/m68k/include/asm/ptrace.h
+++ b/arch/m68k/include/asm/ptrace.h
@@ -82,6 +82,17 @@ struct switch_stack {
 #define instruction_pointer(regs) ((regs)->pc)
 #define profile_pc(regs) instruction_pointer(regs)
 extern void show_regs(struct pt_regs *);
+
+/*
+ * These are defined as per linux/ptrace.h, which see.
+ */
+#define arch_has_single_step()	(1)
+extern void user_enable_single_step(struct task_struct *);
+extern void user_disable_single_step(struct task_struct *);
+
+#define arch_has_block_step()	(1)
+extern void user_enable_block_step(struct task_struct *);
+
 #endif /* __KERNEL__ */
 #endif /* __ASSEMBLY__ */
 #endif /* _M68K_PTRACE_H */
diff --git a/arch/m68k/kernel/ptrace.c b/arch/m68k/kernel/ptrace.c
index 2075543..2a04cd2 100644
--- a/arch/m68k/kernel/ptrace.c
+++ b/arch/m68k/kernel/ptrace.c
@@ -35,7 +35,9 @@
 #define SR_MASK 0x001f
 
 /* sets the trace bits. */
-#define TRACE_BITS 0x8000
+#define TRACE_BITS 0xC000
+#define T1_BIT 0x8000
+#define T0_BIT 0x4000
 
 /* Find the stack offset for a register, relative to thread.esp0. */
 #define PT_REG(reg)	((long)&((struct pt_regs *)0)->reg)
@@ -118,6 +120,24 @@ void ptrace_disable(struct task_struct *child)
 	singlestep_disable(child);
 }
 
+void user_enable_single_step(struct task_struct *child)
+{
+	unsigned long tmp = get_reg(child, PT_SR) & ~(TRACE_BITS << 16);
+	put_reg(child, PT_SR, tmp | (T1_BIT << 16));
+	set_tsk_thread_flag(child, TIF_DELAYED_TRACE);
+}
+
+void user_enable_block_step(struct task_struct *child)
+{
+	unsigned long tmp = get_reg(child, PT_SR) & ~(TRACE_BITS << 16);
+	put_reg(child, PT_SR, tmp | (T0_BIT << 16));
+}
+
+void user_disable_single_step(struct task_struct *child)
+{
+	singlestep_disable(child);
+}
+
 long arch_ptrace(struct task_struct *child, long request, long addr, long data)
 {
 	unsigned long tmp;
@@ -185,20 +205,6 @@ long arch_ptrace(struct task_struct *child, long request, long addr, long data)
 			goto out_eio;
 		break;
 
-	case PTRACE_SYSCALL:	/* continue and stop at next (return from) syscall */
-	case PTRACE_CONT:	/* restart after signal. */
-		if (!valid_signal(data))
-			goto out_eio;
-
-		if (request == PTRACE_SYSCALL)
-			set_tsk_thread_flag(child, TIF_SYSCALL_TRACE);
-		else
-			clear_tsk_thread_flag(child, TIF_SYSCALL_TRACE);
-		child->exit_code = data;
-		singlestep_disable(child);
-		wake_up_process(child);
-		break;
-
 	/*
 	 * make the child exit.  Best I can do is send it a sigkill.
 	 * perhaps it should be put in the status that it wants to
@@ -212,20 +218,6 @@ long arch_ptrace(struct task_struct *child, long request, long addr, long data)
 		wake_up_process(child);
 		break;
 
-	case PTRACE_SINGLESTEP:	/* set the trap flag. */
-		if (!valid_signal(data))
-			goto out_eio;
-
-		clear_tsk_thread_flag(child, TIF_SYSCALL_TRACE);
-		tmp = get_reg(child, PT_SR) | (TRACE_BITS << 16);
-		put_reg(child, PT_SR, tmp);
-		set_tsk_thread_flag(child, TIF_DELAYED_TRACE);
-
-		child->exit_code = data;
-		/* give it a chance to run. */
-		wake_up_process(child);
-		break;
-
 	case PTRACE_GETREGS:	/* Get all gp regs from the child. */
 		for (i = 0; i < 19; i++) {
 			tmp = get_reg(child, i);
-- 
1.6.3


-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 58CA 54C7 6D53 942B 1756  01D3 44D5 214B 8276 4ED5
"And now for something completely different."
