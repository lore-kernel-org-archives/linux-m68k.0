From: <gerg@snapgear.com>
Subject: [PATCH 1/3] m68k: consistently call ret_from_exception in entry code
Date: Tue, 15 May 2012 16:55:47 +1000
Message-ID: <1337064949-966-2-git-send-email-gerg@snapgear.com>
References: <1337064949-966-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from dalsmrelay2.nai.com ([205.227.136.216]:46352 "EHLO
	dalsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752574Ab2EOG5t (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 15 May 2012 02:57:49 -0400
In-Reply-To: <1337064949-966-1-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

The ret_from_excption code is referenced by its function name, or by a label
set at the start of its code. Modify all uses to consistently just use the
function name "ret_from_exception".

This will help when we come to merge the MMU and non-MMU entry code.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/kernel/entry_mm.S |   13 ++++++-------
 1 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/arch/m68k/kernel/entry_mm.S b/arch/m68k/kernel/entry_mm.S
index 675a854..f2ecc64 100644
--- a/arch/m68k/kernel/entry_mm.S
+++ b/arch/m68k/kernel/entry_mm.S
@@ -57,7 +57,7 @@ ENTRY(buserr)
 	movel	%sp,%sp@-		| stack frame pointer argument
 	bsrl	buserr_c
 	addql	#4,%sp
-	jra	.Lret_from_exception
+	jra	ret_from_exception
 
 ENTRY(trap)
 	SAVE_ALL_INT
@@ -65,7 +65,7 @@ ENTRY(trap)
 	movel	%sp,%sp@-		| stack frame pointer argument
 	bsrl	trap_c
 	addql	#4,%sp
-	jra	.Lret_from_exception
+	jra	ret_from_exception
 
 	| After a fork we jump here directly from resume,
 	| so that %d1 contains the previous task
@@ -74,7 +74,7 @@ ENTRY(ret_from_fork)
 	movel	%d1,%sp@-
 	jsr	schedule_tail
 	addql	#4,%sp
-	jra	.Lret_from_exception
+	jra	ret_from_exception
 
 do_trace_entry:
 	movel	#-ENOSYS,%sp@(PT_OFF_D0)| needed for strace
@@ -96,7 +96,7 @@ do_trace_exit:
 	jbsr	syscall_trace
 	RESTORE_SWITCH_STACK
 	addql	#4,%sp
-	jra	.Lret_from_exception
+	jra	ret_from_exception
 
 ENTRY(ret_from_signal)
 	movel	%curptr@(TASK_STACK),%a1
@@ -115,7 +115,7 @@ ENTRY(ret_from_signal)
 	addql	#4,%sp
 1:
 #endif
-	jra	.Lret_from_exception
+	jra	ret_from_exception
 
 ENTRY(system_call)
 	SAVE_ALL_SYS
@@ -154,7 +154,6 @@ syscall_exit_work:
 
 
 ENTRY(ret_from_exception)
-.Lret_from_exception:
 	btst	#5,%sp@(PT_OFF_SR)	| check if returning to kernel
 	bnes	1f			| if so, skip resched, signals
 	| only allow interrupts when we are really the last one on the
@@ -230,7 +229,7 @@ ret_from_last_interrupt:
 
 	/* check if we need to do software interrupts */
 	tstl	irq_stat+CPUSTAT_SOFTIRQ_PENDING
-	jeq	.Lret_from_exception
+	jeq	ret_from_exception
 	pea	ret_from_exception
 	jra	do_softirq
 
-- 
1.7.0.4
