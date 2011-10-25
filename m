From: <gerg@snapgear.com>
Subject: [PATCH 09/36] m68k: set register a2 to current if MMU enabled on ColdFire
Date: Tue, 25 Oct 2011 17:19:01 +1000
Message-ID: <1319527168-11166-10-git-send-email-gerg@snapgear.com>
References: <1319527168-11166-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:25204 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754762Ab1JYHVG (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 25 Oct 2011 03:21:06 -0400
In-Reply-To: <1319527168-11166-1-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

Virtual memory m68k systems build with register a2 dedicated to being the
current proc pointer. Add code to the ColdFire interrupt and exception
processing to set this on entry, and also at context switch time.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/kernel/entry_no.S         |   24 ++++++++++++++++++------
 arch/m68k/platform/coldfire/entry.S |   18 +++++++++++++++++-
 2 files changed, 35 insertions(+), 7 deletions(-)

diff --git a/arch/m68k/kernel/entry_no.S b/arch/m68k/kernel/entry_no.S
index 1b42890..050d7ea 100644
--- a/arch/m68k/kernel/entry_no.S
+++ b/arch/m68k/kernel/entry_no.S
@@ -44,8 +44,12 @@
 
 ENTRY(buserr)
 	SAVE_ALL_INT
-	moveq	#-1,%d0
-	movel	%d0,%sp@(PT_OFF_ORIG_D0)
+#ifdef CONFIG_MMU
+	movel	%sp,%d0			/* get thread_info pointer */
+	andl	#-THREAD_SIZE,%d0	/* at start of kernel stack */
+	movel	%d0,%a2
+	movel	%a2@,%a2		/* current pointer into a2 */
+#endif
 	movel	%sp,%sp@- 		/* stack frame pointer argument */
 	jsr	buserr_c
 	addql	#4,%sp
@@ -53,8 +57,12 @@ ENTRY(buserr)
 
 ENTRY(trap)
 	SAVE_ALL_INT
-	moveq	#-1,%d0
-	movel	%d0,%sp@(PT_OFF_ORIG_D0)
+#ifdef CONFIG_MMU
+	movel	%sp,%d0			/* get thread_info pointer */
+	andl	#-THREAD_SIZE,%d0	/* at start of kernel stack */
+	movel	%d0,%a2
+	movel	%a2@,%a2		/* current pointer into a2 */
+#endif
 	movel	%sp,%sp@- 		/* stack frame pointer argument */
 	jsr	trap_c
 	addql	#4,%sp
@@ -65,8 +73,12 @@ ENTRY(trap)
 .globl dbginterrupt
 ENTRY(dbginterrupt)
 	SAVE_ALL_INT
-	moveq	#-1,%d0
-	movel	%d0,%sp@(PT_OFF_ORIG_D0)
+#ifdef CONFIG_MMU
+	movel	%sp,%d0			/* get thread_info pointer */
+	andl	#-THREAD_SIZE,%d0	/* at start of kernel stack */
+	movel	%d0,%a2
+	movel	%a2@,%a2		/* current pointer into a2 */
+#endif
 	movel	%sp,%sp@- 		/* stack frame pointer argument */
 	jsr	dbginterrupt_c
 	addql	#4,%sp
diff --git a/arch/m68k/platform/coldfire/entry.S b/arch/m68k/platform/coldfire/entry.S
index f567a16..5fc1f40 100644
--- a/arch/m68k/platform/coldfire/entry.S
+++ b/arch/m68k/platform/coldfire/entry.S
@@ -63,6 +63,13 @@ ENTRY(system_call)
 	SAVE_ALL_SYS
 	move	#0x2000,%sr		/* enable intrs again */
 
+#ifdef CONFIG_MMU
+	movel	%sp,%d2			/* get thread_info pointer */
+	andl	#-THREAD_SIZE,%d2	/* at start of kernel stack */
+	movel	%d2,%a2
+	movel	%a2@,%a2		/* current pointer into a2 */
+#endif
+
 	cmpl	#NR_syscalls,%d0
 	jcc	enosys
 	lea	sys_call_table,%a0
@@ -166,6 +173,13 @@ Lsignal_return:
 ENTRY(inthandler)
 	SAVE_ALL_INT
 
+#ifdef CONFIG_MMU
+	movel	%sp,%d2			/* get thread_info pointer */
+	andl	#-THREAD_SIZE,%d2	/* at start of kernel stack */
+	movel	%d2,%a2
+	movel	%a2@,%a2		/* current pointer into a2 */
+#endif
+
 	movew	%sp@(PT_OFF_FORMATVEC),%d0 /* put exception # in d0 */
 	andl	#0x03fc,%d0		/* mask out vector only */
 
@@ -190,7 +204,9 @@ ENTRY(resume)
 	movel	%sp,%a0@(TASK_THREAD+THREAD_KSP) /* save kernel stack pointer */
 	RDUSP					 /* movel %usp,%a3 */
 	movel	%a3,%a0@(TASK_THREAD+THREAD_USP) /* save thread user stack */
-
+#ifdef CONFIG_MMU
+	movel	%a1,%a2				 /* set new current */
+#endif
 	movel	%a1@(TASK_THREAD+THREAD_USP),%a3 /* restore thread user stack */
 	WRUSP					 /* movel %a3,%usp */
 	movel	%a1@(TASK_THREAD+THREAD_KSP),%sp /* restore new kernel stack */
-- 
1.7.0.4
