Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EB91C11F64
	for <linux-m68k@archiver.kernel.org>; Mon, 28 Jun 2021 23:55:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 42C4161A1D
	for <linux-m68k@archiver.kernel.org>; Mon, 28 Jun 2021 23:55:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229941AbhF1X54 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 28 Jun 2021 19:57:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229933AbhF1X5z (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Mon, 28 Jun 2021 19:57:55 -0400
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1298BC061760
        for <linux-m68k@vger.kernel.org>; Mon, 28 Jun 2021 16:55:27 -0700 (PDT)
Received: by mail-pf1-x42c.google.com with SMTP id x16so15589395pfa.13
        for <linux-m68k@vger.kernel.org>; Mon, 28 Jun 2021 16:55:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=j73IDdLEPlkZl+t4HYbs+gkJSE3bFqQU2r2kIUqf4GU=;
        b=eW7rA0YZbXurp2xRn0itkjGvqzTMmhxKfsY+f3H6+ozb/GGaA4qMkiV4dSDpsamRgg
         eGXyEOFiwBovbwXX3sbb6cEWWE2sEx+Pks4dKXAyK9Dll6j/DGLY3vZyEPaYoTCg5HLO
         +E5NnlUMiqoI7Fge65iWSORDcL7veAzmc3/Bghtrp2ZCHReCGWwcaYdf4kJRGCzHe5Mk
         CrHEEMTShkncnugKGodGNxjlKddUV/GCD6+fLT4s/fUSaee/UVg2DQ1NP8FWcfXgLq1W
         vbeVCJERGQ/S2fI1o0M8buMUTphF58MxLoFk91PSUpIfjKovLjcTkY9lLtDyL0SBqUxx
         eIPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=j73IDdLEPlkZl+t4HYbs+gkJSE3bFqQU2r2kIUqf4GU=;
        b=k4b11EGjZcd6wLsgdMrt7fKEXiiIWmrYxiIIIJYrxwy+o1/wBq4SBm/NbZWcd+FbKv
         9nluUN3nAP7QTXiqqHKhCIRLS9NxAlCsgKprQb5j6lF+0tvDwaXVGgqwVOxTOVzAOuPB
         BKFPRBY+LVe9+5d1pFw1q9CRMIUwPDD8yXvDn1D1c/pboXbJM9nKtcaR+q2Xaq8TCNKX
         H235KX6pbilMTGLuoLnhIxP0SG8IhoSd9eZwNqy8+1CdGfig1BAVJ+ENQhKnkS6OYbnz
         t/EvA6qMXkza9MzpzpMY3RnFpoR8cllmJCL2Lzc1bFogoE3Gmq0QhYgHUpbiib3EE/Ih
         4tLA==
X-Gm-Message-State: AOAM533HLWD+IRexUo40SUq56EVyDuNS2bxeTaOCjCElkdThDrdKOO20
        BVG/ijX3b7rcvRhYPX5XvGjJdidPaGLfMA==
X-Google-Smtp-Source: ABdhPJxnTvLxUlag0ty8+dcoh9vIkPUruMwqu55qWSLNPtfNWwRvx9gxvPvv345x3dXUOHnuZw2jzg==
X-Received: by 2002:a63:5302:: with SMTP id h2mr15811918pgb.262.1624924526580;
        Mon, 28 Jun 2021 16:55:26 -0700 (PDT)
Received: from xplor.waratah.dyndns.org (222-152-189-137-fibre.sparkbb.co.nz. [222.152.189.137])
        by smtp.gmail.com with ESMTPSA id a9sm641895pjm.51.2021.06.28.16.55.25
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 28 Jun 2021 16:55:26 -0700 (PDT)
Received: by xplor.waratah.dyndns.org (Postfix, from userid 1000)
        id AD4D9360412; Tue, 29 Jun 2021 11:55:22 +1200 (NZST)
From:   Michael Schmitz <schmitzmic@gmail.com>
To:     linux-m68k@vger.kernel.org, geert@linux-m68k.org
Cc:     glaubitz@physik.fu-berlin.de, schwab@linux-m68k.org,
        Michael Schmitz <schmitzmic@gmail.com>
Subject: [PATCH v7 1/2] m68k/kernel - wire up syscall_trace_enter/leave for m68k
Date:   Tue, 29 Jun 2021 11:55:19 +1200
Message-Id: <1624924520-17567-2-git-send-email-schmitzmic@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1624924520-17567-1-git-send-email-schmitzmic@gmail.com>
References: <1624924520-17567-1-git-send-email-schmitzmic@gmail.com>
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

m68k (other than Coldfire) uses syscall_trace for both trace entry
and trace exit. Seccomp support requires separate entry points for
trace entry and exit which are already provided for Coldfire.

Replace syscall_trace by syscall_trace_enter and syscall_trace_leave
in preparation for seccomp support. Check return code of
syscall_trace_enter(), and skip syscall if -1. Return code will be
left at what had been set by ptrace or seccomp (in regs->d0).

No regression seen in testing with strace on ARAnyM.

Signed-off-by: Michael Schmitz <schmitzmic@gmail.com>

--
Changes from v6:

Geert Uytterhoeven:
- add syscall_trace_enter() return code check for 68000
  and coldfire

Changes from v5:

- add comment to explain optimization

Changes from v4:

Andreas Schwab:
- optimize return code test (addql #1,%d0 for cmpil #-1,%d0)
- spelling fix in commit message

Changes from v3:

- change syscall_trace_enter return code test from !=0 to ==-1
---
 arch/m68k/68000/entry.S    |  2 ++
 arch/m68k/coldfire/entry.S |  2 ++
 arch/m68k/kernel/entry.S   |  8 +++++---
 arch/m68k/kernel/ptrace.c  | 17 -----------------
 4 files changed, 9 insertions(+), 20 deletions(-)

diff --git a/arch/m68k/68000/entry.S b/arch/m68k/68000/entry.S
index 259b366..94abf3d 100644
--- a/arch/m68k/68000/entry.S
+++ b/arch/m68k/68000/entry.S
@@ -47,6 +47,8 @@ do_trace:
 	jbsr	syscall_trace_enter
 	RESTORE_SWITCH_STACK
 	addql	#4,%sp
+	addql	#1,%d0
+	jeq	ret_from_exception
 	movel	%sp@(PT_OFF_ORIG_D0),%d1
 	movel	#-ENOSYS,%d0
 	cmpl	#NR_syscalls,%d1
diff --git a/arch/m68k/coldfire/entry.S b/arch/m68k/coldfire/entry.S
index d43a027..f1d41a9 100644
--- a/arch/m68k/coldfire/entry.S
+++ b/arch/m68k/coldfire/entry.S
@@ -92,6 +92,8 @@ ENTRY(system_call)
 	jbsr	syscall_trace_enter
 	RESTORE_SWITCH_STACK
 	addql	#4,%sp
+	addql	#1,%d0
+	jeq	ret_from_exception
 	movel	%d3,%a0
 	jbsr	%a0@
 	movel	%d0,%sp@(PT_OFF_D0)		/* save the return value */
diff --git a/arch/m68k/kernel/entry.S b/arch/m68k/kernel/entry.S
index 9dd76fb..d6f941d 100644
--- a/arch/m68k/kernel/entry.S
+++ b/arch/m68k/kernel/entry.S
@@ -164,9 +164,11 @@ do_trace_entry:
 	movel	#-ENOSYS,%sp@(PT_OFF_D0)| needed for strace
 	subql	#4,%sp
 	SAVE_SWITCH_STACK
-	jbsr	syscall_trace
+	jbsr	syscall_trace_enter
 	RESTORE_SWITCH_STACK
 	addql	#4,%sp
+	addql	#1,%d0			| optimization for cmpil #-1,%d0
+	jeq	ret_from_syscall
 	movel	%sp@(PT_OFF_ORIG_D0),%d0
 	cmpl	#NR_syscalls,%d0
 	jcs	syscall
@@ -177,7 +179,7 @@ badsys:
 do_trace_exit:
 	subql	#4,%sp
 	SAVE_SWITCH_STACK
-	jbsr	syscall_trace
+	jbsr	syscall_trace_leave
 	RESTORE_SWITCH_STACK
 	addql	#4,%sp
 	jra	.Lret_from_exception
@@ -186,7 +188,7 @@ ENTRY(ret_from_signal)
 	movel	%curptr@(TASK_STACK),%a1
 	tstb	%a1@(TINFO_FLAGS+2)
 	jge	1f
-	jbsr	syscall_trace
+	jbsr	syscall_trace_leave
 1:	RESTORE_SWITCH_STACK
 	addql	#4,%sp
 /* on 68040 complete pending writebacks if any */
diff --git a/arch/m68k/kernel/ptrace.c b/arch/m68k/kernel/ptrace.c
index 94b3b27..74d58a8 100644
--- a/arch/m68k/kernel/ptrace.c
+++ b/arch/m68k/kernel/ptrace.c
@@ -271,22 +271,6 @@ long arch_ptrace(struct task_struct *child, long request,
 	return -EIO;
 }
 
-asmlinkage void syscall_trace(void)
-{
-	ptrace_notify(SIGTRAP | ((current->ptrace & PT_TRACESYSGOOD)
-				 ? 0x80 : 0));
-	/*
-	 * this isn't the same as continuing with a signal, but it will do
-	 * for normal use.  strace only continues with a signal if the
-	 * stopping signal is not SIGTRAP.  -brl
-	 */
-	if (current->exit_code) {
-		send_sig(current->exit_code, current, 1);
-		current->exit_code = 0;
-	}
-}
-
-#if defined(CONFIG_COLDFIRE) || !defined(CONFIG_MMU)
 asmlinkage int syscall_trace_enter(void)
 {
 	int ret = 0;
@@ -301,4 +285,3 @@ asmlinkage void syscall_trace_leave(void)
 	if (test_thread_flag(TIF_SYSCALL_TRACE))
 		tracehook_report_syscall_exit(task_pt_regs(current), 0);
 }
-#endif /* CONFIG_COLDFIRE */
-- 
2.7.4

