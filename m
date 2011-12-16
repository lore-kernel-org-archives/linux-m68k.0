From: <gerg@snapgear.com>
Subject: [PATCH 10/35] m68k: set register a2 to current if MMU enabled on ColdFire
Date: Fri, 16 Dec 2011 22:36:07 +1000
Message-ID: <1324038992-31222-11-git-send-email-gerg@snapgear.com>
References: <1324038992-31222-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:49367 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759110Ab1LPMgp (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 16 Dec 2011 07:36:45 -0500
In-Reply-To: <1324038992-31222-1-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

Virtual memory m68k systems build with register a2 dedicated to being the
current proc pointer (non-MMU don't do this). Add code to the ColdFire
interrupt and exception processing to set this on entry, and at context
switch time. We use the same GET_CURRENT() macro that MMU enabled code
uses - modifying it so that the assembler is ColdFire clean.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
Acked-by: Matt Waddel <mwaddel@yahoo.com>
Acked-by: Kurt Mahan <kmahan@xmission.com>
---
 arch/m68k/include/asm/entry.h       |   10 +++++++++-
 arch/m68k/kernel/entry_no.S         |    3 +++
 arch/m68k/platform/coldfire/entry.S |    6 +++++-
 3 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/arch/m68k/include/asm/entry.h b/arch/m68k/include/asm/entry.h
index c3c5a86..622138d 100644
--- a/arch/m68k/include/asm/entry.h
+++ b/arch/m68k/include/asm/entry.h
@@ -222,16 +222,24 @@
  * Non-MMU systems do not reserve %a2 in this way, and this definition is
  * not used for them.
  */
+#ifdef CONFIG_MMU
+
 #define curptr a2
 
 #define GET_CURRENT(tmp) get_current tmp
 .macro get_current reg=%d0
 	movel	%sp,\reg
-	andw	#-THREAD_SIZE,\reg
+	andl	#-THREAD_SIZE,\reg
 	movel	\reg,%curptr
 	movel	%curptr@,%curptr
 .endm
 
+#else
+
+#define GET_CURRENT(tmp)
+
+#endif /* CONFIG_MMU */
+
 #else /* C source */
 
 #define STR(X) STR1(X)
diff --git a/arch/m68k/kernel/entry_no.S b/arch/m68k/kernel/entry_no.S
index ac86a9f..d80cba4 100644
--- a/arch/m68k/kernel/entry_no.S
+++ b/arch/m68k/kernel/entry_no.S
@@ -44,6 +44,7 @@
 
 ENTRY(buserr)
 	SAVE_ALL_INT
+	GET_CURRENT(%d0)
 	movel	%sp,%sp@- 		/* stack frame pointer argument */
 	jsr	buserr_c
 	addql	#4,%sp
@@ -51,6 +52,7 @@ ENTRY(buserr)
 
 ENTRY(trap)
 	SAVE_ALL_INT
+	GET_CURRENT(%d0)
 	movel	%sp,%sp@- 		/* stack frame pointer argument */
 	jsr	trap_c
 	addql	#4,%sp
@@ -61,6 +63,7 @@ ENTRY(trap)
 .globl dbginterrupt
 ENTRY(dbginterrupt)
 	SAVE_ALL_INT
+	GET_CURRENT(%d0)
 	movel	%sp,%sp@- 		/* stack frame pointer argument */
 	jsr	dbginterrupt_c
 	addql	#4,%sp
diff --git a/arch/m68k/platform/coldfire/entry.S b/arch/m68k/platform/coldfire/entry.S
index f567a16..863889f 100644
--- a/arch/m68k/platform/coldfire/entry.S
+++ b/arch/m68k/platform/coldfire/entry.S
@@ -62,6 +62,7 @@ enosys:
 ENTRY(system_call)
 	SAVE_ALL_SYS
 	move	#0x2000,%sr		/* enable intrs again */
+	GET_CURRENT(%d2)
 
 	cmpl	#NR_syscalls,%d0
 	jcc	enosys
@@ -165,6 +166,7 @@ Lsignal_return:
  */
 ENTRY(inthandler)
 	SAVE_ALL_INT
+	GET_CURRENT(%d2)
 
 	movew	%sp@(PT_OFF_FORMATVEC),%d0 /* put exception # in d0 */
 	andl	#0x03fc,%d0		/* mask out vector only */
@@ -190,7 +192,9 @@ ENTRY(resume)
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
