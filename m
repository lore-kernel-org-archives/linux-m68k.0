From: Greg Ungerer <gerg@snapgear.com>
Subject: m68k/m68knommu: merge MMU and non-MMU thread_info.h
Date: Tue, 7 Sep 2010 15:49:27 +1000
Message-ID: <201009070549.o875nRrI008047@goober.internal.moreton.com.au>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from dalsmrelay2.nai.com ([205.227.136.216]:36536 "HELO
	dalsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1751320Ab0IGFte (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 7 Sep 2010 01:49:34 -0400
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org
Cc: gerg@uclinux.org


Hi All,

The non-mmu and mmu versions of thread_info.h are quite similar.
The merge required a little cleanup of the definitions of THREAD_SIZE
and THREAD_SIZE_ORDER. I have tried to preserve the logic but simplified
the code.

Regards
Greg



m68k/m68knommu: merge MMU and non-MMU thread_info.h

The MMU and non-MMU versions of thread_info.h and quite similar.
Merge the two files.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 .../asm/{thread_info_mm.h => thread_info.h}        |   60 +++++++++---
 arch/m68k/include/asm/thread_info_no.h             |  102 --------------------
 arch/m68knommu/platform/coldfire/entry.S           |    4 +-
 3 files changed, 47 insertions(+), 119 deletions(-)
 rename arch/m68k/include/asm/{thread_info_mm.h => thread_info.h} (67%)
 delete mode 100644 arch/m68k/include/asm/thread_info_no.h

diff --git a/arch/m68k/include/asm/thread_info_mm.h b/arch/m68k/include/asm/thread_info.h
similarity index 67%
rename from arch/m68k/include/asm/thread_info_mm.h
rename to arch/m68k/include/asm/thread_info.h
index d08046c..21171bf 100644
--- a/arch/m68k/include/asm/thread_info_mm.h
+++ b/arch/m68k/include/asm/thread_info.h
@@ -1,21 +1,33 @@
 #ifndef _ASM_M68K_THREAD_INFO_H
 #define _ASM_M68K_THREAD_INFO_H
 
-#ifndef ASM_OFFSETS_C
-#include <asm/asm-offsets.h>
-#endif
 #include <asm/types.h>
 #include <asm/page.h>
 
+/*
+ * On machines with 4k pages we default to an 8k thread size, though we
+ * allow a 4k with config option. Any other machine page size then
+ * the thread size must match the page size (which is 8k and larger here).
+ */
+#if PAGE_SHIFT < 13
+#ifdef CONFIG_4KSTACKS
+#define THREAD_SIZE	4096
+#else
+#define THREAD_SIZE	8192
+#endif
+#else
+#define THREAD_SIZE	PAGE_SIZE
+#endif
+#define THREAD_SIZE_ORDER	((THREAD_SIZE / PAGE_SIZE) - 1)
+
 #ifndef __ASSEMBLY__
-#include <asm/current.h>
 
 struct thread_info {
 	struct task_struct	*task;		/* main task structure */
 	unsigned long		flags;
 	struct exec_domain	*exec_domain;	/* execution domain */
 	int			preempt_count;	/* 0 => preemptable, <0 => BUG */
-	__u32 cpu; /* should always be 0 on m68k */
+	__u32			cpu;		/* should always be 0 on m68k */
 	unsigned long		tp_value;	/* thread pointer */
 	struct restart_block    restart_block;
 };
@@ -33,23 +45,20 @@ struct thread_info {
 	},					\
 }
 
-/* THREAD_SIZE should be 8k, so handle differently for 4k and 8k machines */
-#if PAGE_SHIFT < 13
-#define THREAD_SIZE (8192)
-#else
-#define THREAD_SIZE PAGE_SIZE
-#endif
-#define THREAD_SIZE_ORDER (13 - PAGE_SHIFT)
-
-#define init_thread_info	(init_task.thread.info)
 #define init_stack		(init_thread_union.stack)
 
+#ifdef CONFIG_MMU
+
+#include <asm/current.h>
+
 #ifdef ASM_OFFSETS_C
 #define task_thread_info(tsk)	((struct thread_info *) NULL)
 #else
+#include <asm/asm-offsets.h>
 #define task_thread_info(tsk)	((struct thread_info *)((char *)tsk+TASK_TINFO))
 #endif
 
+#define init_thread_info	(init_task.thread.info)
 #define task_stack_page(tsk)	((tsk)->stack)
 #define current_thread_info()	task_thread_info(current)
 
@@ -60,7 +69,28 @@ struct thread_info {
 	task_thread_info(p)->task = (p);		\
 })
 
-#define end_of_stack(p) ((unsigned long *)(p)->stack + 1)
+#define end_of_stack(p)		((unsigned long *)(p)->stack + 1)
+
+#else /* !CONFIG_MMU */
+
+#ifndef __ASSEMBLY__
+/* how to get the thread information struct from C */
+static inline struct thread_info *current_thread_info(void)
+{
+	struct thread_info *ti;
+	__asm__(
+		"move.l %%sp, %0 \n\t"
+		"and.l  %1, %0"
+		: "=&d"(ti)
+		: "di" (~(THREAD_SIZE-1))
+		);
+	return ti;
+}
+#endif
+
+#define init_thread_info	(init_thread_union.thread_info)
+
+#endif /* CONFIG_MMU */
 
 /* entry.S relies on these definitions!
  * bits 0-7 are tested at every exception exit
diff --git a/arch/m68k/include/asm/thread_info_no.h b/arch/m68k/include/asm/thread_info_no.h
deleted file mode 100644
index 51f354b..0000000
--- a/arch/m68k/include/asm/thread_info_no.h
+++ /dev/null
@@ -1,102 +0,0 @@
-/* thread_info.h: m68knommu low-level thread information
- * adapted from the i386 and PPC versions by Greg Ungerer (gerg@snapgear.com)
- *
- * Copyright (C) 2002  David Howells (dhowells@redhat.com)
- * - Incorporating suggestions made by Linus Torvalds and Dave Miller
- */
-
-#ifndef _ASM_THREAD_INFO_H
-#define _ASM_THREAD_INFO_H
-
-#include <asm/page.h>
-
-#ifdef __KERNEL__
-
-/*
- * Size of kernel stack for each process. This must be a power of 2...
- */
-#ifdef CONFIG_4KSTACKS
-#define THREAD_SIZE_ORDER (0)
-#else
-#define THREAD_SIZE_ORDER (1)
-#endif
-                                                                                
-/*
- * for asm files, THREAD_SIZE is now generated by asm-offsets.c
- */
-#define THREAD_SIZE (PAGE_SIZE<<THREAD_SIZE_ORDER)
-
-#ifndef __ASSEMBLY__
-
-/*
- * low level task data.
- */
-struct thread_info {
-	struct task_struct *task;		/* main task structure */
-	struct exec_domain *exec_domain;	/* execution domain */
-	unsigned long	   flags;		/* low level flags */
-	int		   cpu;			/* cpu we're on */
-	int		   preempt_count;	/* 0 => preemptable, <0 => BUG */
-	unsigned long	   tp_value;		/* thread pointer */
-	struct restart_block restart_block;
-};
-
-/*
- * macros/functions for gaining access to the thread information structure
- */
-#define INIT_THREAD_INFO(tsk)			\
-{						\
-	.task		= &tsk,			\
-	.exec_domain	= &default_exec_domain,	\
-	.flags		= 0,			\
-	.cpu		= 0,			\
-	.preempt_count	= INIT_PREEMPT_COUNT,	\
-	.restart_block	= {			\
-		.fn = do_no_restart_syscall,	\
-	},					\
-}
-
-#define init_thread_info	(init_thread_union.thread_info)
-#define init_stack		(init_thread_union.stack)
-
-
-/* how to get the thread information struct from C */
-static inline struct thread_info *current_thread_info(void)
-{
-	struct thread_info *ti;
-	__asm__(
-		"move.l	%%sp, %0 \n\t"
-		"and.l	%1, %0"
-		: "=&d"(ti)
-		: "di" (~(THREAD_SIZE-1))
-		);
-	return ti;
-}
-
-#endif /* __ASSEMBLY__ */
-
-#define	PREEMPT_ACTIVE	0x4000000
-
-/*
- * thread information flag bit numbers
- */
-#define TIF_SYSCALL_TRACE	0	/* syscall trace active */
-#define TIF_SIGPENDING		1	/* signal pending */
-#define TIF_NEED_RESCHED	2	/* rescheduling necessary */
-#define TIF_POLLING_NRFLAG	3	/* true if poll_idle() is polling
-					   TIF_NEED_RESCHED */
-#define TIF_MEMDIE		4	/* is terminating due to OOM killer */
-#define TIF_FREEZE		16	/* is freezing for suspend */
-
-/* as above, but as bit values */
-#define _TIF_SYSCALL_TRACE	(1<<TIF_SYSCALL_TRACE)
-#define _TIF_SIGPENDING		(1<<TIF_SIGPENDING)
-#define _TIF_NEED_RESCHED	(1<<TIF_NEED_RESCHED)
-#define _TIF_POLLING_NRFLAG	(1<<TIF_POLLING_NRFLAG)
-#define _TIF_FREEZE		(1<<TIF_FREEZE)
-
-#define _TIF_WORK_MASK		0x0000FFFE	/* work to do on interrupt/exception return */
-
-#endif /* __KERNEL__ */
-
-#endif /* _ASM_THREAD_INFO_H */
diff --git a/arch/m68knommu/platform/coldfire/entry.S b/arch/m68knommu/platform/coldfire/entry.S
index dd7d591..cd79d7e 100644
--- a/arch/m68knommu/platform/coldfire/entry.S
+++ b/arch/m68knommu/platform/coldfire/entry.S
@@ -112,7 +112,7 @@ ret_from_exception:
 	andl	#-THREAD_SIZE,%d1	/* at base of kernel stack */
 	movel	%d1,%a0
 	movel	%a0@(TI_FLAGS),%d1	/* get thread_info->flags */
-	andl	#_TIF_NEED_RESCHED,%d1
+	andl	#(1<<TIF_NEED_RESCHED),%d1
 	jeq	Lkernel_return
 
 	movel	%a0@(TI_PREEMPTCOUNT),%d1
@@ -136,7 +136,7 @@ Luser_return:
 	andl	#-THREAD_SIZE,%d1	/* at base of kernel stack */
 	movel	%d1,%a0
 	movel	%a0@(TI_FLAGS),%d1	/* get thread_info->flags */
-	andl	#_TIF_WORK_MASK,%d1
+	andl	#0xefff,%d1
 	jne	Lwork_to_do		/* still work to do */
 
 Lreturn:
-- 
1.6.3.3
