From: <gerg@snapgear.com>
Subject: [PATCH 3/3] m68k: merge the MMU and non-MMU versions of the entry.S code
Date: Tue, 15 May 2012 16:55:49 +1000
Message-ID: <1337064949-966-4-git-send-email-gerg@snapgear.com>
References: <1337064949-966-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from dalsmrelay2.nai.com ([205.227.136.216]:46367 "EHLO
	dalsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756348Ab2EOG6E (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 15 May 2012 02:58:04 -0400
In-Reply-To: <1337064949-966-1-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

Some of the entry.S code is common to both MMU and non-MMU builds.
So merge the entry_no.S and entry_mm.S files back into a single file.
With a little code movement we only need a single #ifdef.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/kernel/{entry_mm.S => entry.S} |  105 ++++++++++++++++--------
 arch/m68k/kernel/entry_no.S              |  130 ------------------------------
 2 files changed, 69 insertions(+), 166 deletions(-)
 rename arch/m68k/kernel/{entry_mm.S => entry.S} (94%)
 delete mode 100644 arch/m68k/kernel/entry_no.S

diff --git a/arch/m68k/kernel/entry_mm.S b/arch/m68k/kernel/entry.S
similarity index 94%
rename from arch/m68k/kernel/entry_mm.S
rename to arch/m68k/kernel/entry.S
index fca00b4..072626a 100644
--- a/arch/m68k/kernel/entry_mm.S
+++ b/arch/m68k/kernel/entry.S
@@ -51,6 +51,42 @@
 .globl user_irqvec_fixup
 
 .text
+ENTRY(sys_fork)
+	SAVE_SWITCH_STACK
+	pea	%sp@(SWITCH_STACK_SIZE)
+	jbsr	m68k_fork
+	addql	#4,%sp
+	RESTORE_SWITCH_STACK
+	rts
+
+ENTRY(sys_clone)
+	SAVE_SWITCH_STACK
+	pea	%sp@(SWITCH_STACK_SIZE)
+	jbsr	m68k_clone
+	addql	#4,%sp
+	RESTORE_SWITCH_STACK
+	rts
+
+ENTRY(sys_vfork)
+	SAVE_SWITCH_STACK
+	pea	%sp@(SWITCH_STACK_SIZE)
+	jbsr	m68k_vfork
+	addql	#4,%sp
+	RESTORE_SWITCH_STACK
+	rts
+
+ENTRY(sys_sigreturn)
+	SAVE_SWITCH_STACK
+	jbsr	do_sigreturn
+	RESTORE_SWITCH_STACK
+	rts
+
+ENTRY(sys_rt_sigreturn)
+	SAVE_SWITCH_STACK
+	jbsr	do_rt_sigreturn
+	RESTORE_SWITCH_STACK
+	rts
+
 ENTRY(buserr)
 	SAVE_ALL_INT
 	GET_CURRENT(%d0)
@@ -76,6 +112,38 @@ ENTRY(ret_from_fork)
 	addql	#4,%sp
 	jra	ret_from_exception
 
+#if defined(CONFIG_COLDFIRE) || !defined(CONFIG_MMU)
+
+#ifdef TRAP_DBG_INTERRUPT
+
+.globl dbginterrupt
+ENTRY(dbginterrupt)
+	SAVE_ALL_INT
+	GET_CURRENT(%d0)
+	movel	%sp,%sp@- 		/* stack frame pointer argument */
+	jsr	dbginterrupt_c
+	addql	#4,%sp
+	jra	ret_from_exception
+#endif
+
+ENTRY(reschedule)
+	/* save top of frame */
+	pea	%sp@
+	jbsr	set_esp0
+	addql	#4,%sp
+	pea	ret_from_exception
+	jmp	schedule
+
+ENTRY(ret_from_user_signal)
+	moveq #__NR_sigreturn,%d0
+	trap #0
+
+ENTRY(ret_from_user_rt_signal)
+	movel #__NR_rt_sigreturn,%d0
+	trap #0
+
+#else
+
 do_trace_entry:
 	movel	#-ENOSYS,%sp@(PT_OFF_D0)| needed for strace
 	subql	#4,%sp
@@ -273,42 +341,6 @@ ENTRY(bad_inthandler)
 	RESTORE_ALL
 
 
-ENTRY(sys_fork)
-	SAVE_SWITCH_STACK
-	pea	%sp@(SWITCH_STACK_SIZE)
-	jbsr	m68k_fork
-	addql	#4,%sp
-	RESTORE_SWITCH_STACK
-	rts
-
-ENTRY(sys_clone)
-	SAVE_SWITCH_STACK
-	pea	%sp@(SWITCH_STACK_SIZE)
-	jbsr	m68k_clone
-	addql	#4,%sp
-	RESTORE_SWITCH_STACK
-	rts
-
-ENTRY(sys_vfork)
-	SAVE_SWITCH_STACK
-	pea	%sp@(SWITCH_STACK_SIZE)
-	jbsr	m68k_vfork
-	addql	#4,%sp
-	RESTORE_SWITCH_STACK
-	rts
-
-ENTRY(sys_sigreturn)
-	SAVE_SWITCH_STACK
-	jbsr	do_sigreturn
-	RESTORE_SWITCH_STACK
-	rts
-
-ENTRY(sys_rt_sigreturn)
-	SAVE_SWITCH_STACK
-	jbsr	do_rt_sigreturn
-	RESTORE_SWITCH_STACK
-	rts
-
 resume:
 	/*
 	 * Beware - when entering resume, prev (the current task) is
@@ -416,3 +448,4 @@ resume:
 
 	rts
 
+#endif /* CONFIG_MMU && !CONFIG_COLDFIRE */
diff --git a/arch/m68k/kernel/entry_no.S b/arch/m68k/kernel/entry_no.S
deleted file mode 100644
index d80cba4..0000000
--- a/arch/m68k/kernel/entry_no.S
+++ /dev/null
@@ -1,130 +0,0 @@
-/*
- *  linux/arch/m68knommu/kernel/entry.S
- *
- *  Copyright (C) 1999-2002, Greg Ungerer (gerg@snapgear.com)
- *  Copyright (C) 1998  D. Jeff Dionne <jeff@lineo.ca>,
- *                      Kenneth Albanowski <kjahds@kjahds.com>,
- *  Copyright (C) 2000  Lineo Inc. (www.lineo.com) 
- *
- * Based on:
- *
- *  linux/arch/m68k/kernel/entry.S
- *
- *  Copyright (C) 1991, 1992  Linus Torvalds
- *
- * This file is subject to the terms and conditions of the GNU General Public
- * License.  See the file README.legal in the main directory of this archive
- * for more details.
- *
- * Linux/m68k support by Hamish Macdonald
- *
- * 68060 fixes by Jesper Skov
- * ColdFire support by Greg Ungerer (gerg@snapgear.com)
- * 5307 fixes by David W. Miller
- * linux 2.4 support David McCullough <davidm@snapgear.com>
- */
-
-#include <linux/linkage.h>
-#include <asm/errno.h>
-#include <asm/setup.h>
-#include <asm/segment.h>
-#include <asm/asm-offsets.h>
-#include <asm/entry.h>
-#include <asm/unistd.h>
-
-.text
-
-.globl buserr
-.globl trap
-.globl ret_from_exception
-.globl ret_from_signal
-.globl sys_fork
-.globl sys_clone
-.globl sys_vfork
-
-ENTRY(buserr)
-	SAVE_ALL_INT
-	GET_CURRENT(%d0)
-	movel	%sp,%sp@- 		/* stack frame pointer argument */
-	jsr	buserr_c
-	addql	#4,%sp
-	jra	ret_from_exception
-
-ENTRY(trap)
-	SAVE_ALL_INT
-	GET_CURRENT(%d0)
-	movel	%sp,%sp@- 		/* stack frame pointer argument */
-	jsr	trap_c
-	addql	#4,%sp
-	jra	ret_from_exception
-
-#ifdef TRAP_DBG_INTERRUPT
-
-.globl dbginterrupt
-ENTRY(dbginterrupt)
-	SAVE_ALL_INT
-	GET_CURRENT(%d0)
-	movel	%sp,%sp@- 		/* stack frame pointer argument */
-	jsr	dbginterrupt_c
-	addql	#4,%sp
-	jra	ret_from_exception
-#endif
-
-ENTRY(reschedule)
-	/* save top of frame */
-	pea	%sp@
-	jbsr	set_esp0
-	addql	#4,%sp
-	pea	ret_from_exception
-	jmp	schedule
-
-ENTRY(ret_from_fork)
-	movel	%d1,%sp@-
-	jsr	schedule_tail
-	addql	#4,%sp
-	jra	ret_from_exception
-
-ENTRY(sys_fork)
-	SAVE_SWITCH_STACK
-	pea	%sp@(SWITCH_STACK_SIZE)
-	jbsr	m68k_fork
-	addql	#4,%sp
-	RESTORE_SWITCH_STACK
-	rts
-
-ENTRY(sys_vfork)
-	SAVE_SWITCH_STACK
-	pea	%sp@(SWITCH_STACK_SIZE)
-	jbsr	m68k_vfork
-	addql	#4,%sp
-	RESTORE_SWITCH_STACK
-	rts
-
-ENTRY(sys_clone)
-	SAVE_SWITCH_STACK
-	pea	%sp@(SWITCH_STACK_SIZE)
-	jbsr	m68k_clone
-	addql	#4,%sp
-	RESTORE_SWITCH_STACK
-	rts
-
-ENTRY(sys_sigreturn)
-	SAVE_SWITCH_STACK
-	jbsr	do_sigreturn
-	RESTORE_SWITCH_STACK
-	rts
-
-ENTRY(sys_rt_sigreturn)
-	SAVE_SWITCH_STACK
-	jbsr	do_rt_sigreturn
-	RESTORE_SWITCH_STACK
-	rts
-
-ENTRY(ret_from_user_signal)
-	moveq #__NR_sigreturn,%d0
-	trap #0
-
-ENTRY(ret_from_user_rt_signal)
-	movel #__NR_rt_sigreturn,%d0
-	trap #0
-
-- 
1.7.0.4
