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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F8FBC2B9F4
	for <linux-m68k@archiver.kernel.org>; Thu, 17 Jun 2021 05:39:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 469FC613DF
	for <linux-m68k@archiver.kernel.org>; Thu, 17 Jun 2021 05:39:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229580AbhFQFlg (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 17 Jun 2021 01:41:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229515AbhFQFlg (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Thu, 17 Jun 2021 01:41:36 -0400
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77C60C061574
        for <linux-m68k@vger.kernel.org>; Wed, 16 Jun 2021 22:39:28 -0700 (PDT)
Received: by mail-pf1-x42d.google.com with SMTP id h12so4101669pfe.2
        for <linux-m68k@vger.kernel.org>; Wed, 16 Jun 2021 22:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=zdlkssB8kkE3t0yd9MzHlFs5Z3kbqsqbfnS7iAuhXJk=;
        b=RJAevVVUTPm3WDeH2QH1zRFAEvKtAa1+0LeYy0NZILONQJLT7u0F1phfMWjJiUPWwb
         xdFpBOUOYA5TTGAZ1Acqi74Ed+mClNfpfDIzZAC+aT8u/WWQwkEee4Y7HE+qjMxYJkjh
         RTYgzcIiRbdjQ0iPsb4B1hu5b4zNOk4bMaSKEn9LMzz8UI4VUbq9+ciwgRv9aDAMKzX1
         rl6dgyuXTolQ0LP/oRf+pRBCxvBl+aKoMpKAfOyOGPvdDEfTzte5AJ4gKUtC4YwFdPMN
         0YBAjexz91K7BCV6iyZDVnrG/VrkBpGHSM+g8B8Z0gMGzhkIMzHFx8RFNBHbRy5+MPmp
         +gKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=zdlkssB8kkE3t0yd9MzHlFs5Z3kbqsqbfnS7iAuhXJk=;
        b=F4cfJmuFwZbHDNSXwqml/A75kCfU2lhiFg4n00juz8Itq6/nBR7e//q+mDHFAFhlJ1
         X75JDmu349Xx29tYe2XdTuykx1f743vRHwVjDwWkfwtfx1sEsntcCW+AgGBKWQqlJ8Kw
         7+ax8S4YD+9l6McemmhWsDxK5tpcyFyEhWfptWCANJ5NwW/TqEW/3ucnyLCsTuN6nkn+
         edN4E5jCxFMmjncx66tbfz7Jx8S0b3nZrqN49cvilbHaGfs9v0OKniPZ1iLkohBO5cu0
         RvkT0MwPpLVBmZcxCZTAHxXmkLQhazQlkvfCBdeeGqjo/mvUWwsLi7k1e7x/34k9z8Py
         tVEA==
X-Gm-Message-State: AOAM532cFf56KHhu6GsymISFUlUzZ9OB+/IwpfwsNC+g0iOu/a8oCLds
        oUeMFS+5FA0baoFS69o+tKU=
X-Google-Smtp-Source: ABdhPJyn3QbuBd2j0DQHiaNPlzXZPmTAEoH8b2pJrREIuH1Y6UJ3XP7SzyF93mpxHavD6ngOF59aWw==
X-Received: by 2002:a63:30d:: with SMTP id 13mr3313437pgd.204.1623908368030;
        Wed, 16 Jun 2021 22:39:28 -0700 (PDT)
Received: from xplor.waratah.dyndns.org (222-152-189-137-fibre.sparkbb.co.nz. [222.152.189.137])
        by smtp.gmail.com with ESMTPSA id d22sm3950322pgb.15.2021.06.16.22.39.26
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 16 Jun 2021 22:39:27 -0700 (PDT)
Received: by xplor.waratah.dyndns.org (Postfix, from userid 1000)
        id EA9DB36040F; Thu, 17 Jun 2021 17:39:23 +1200 (NZST)
From:   Michael Schmitz <schmitzmic@gmail.com>
To:     linux-m68k@vger.kernel.org, geert@linux-m68k.org
Cc:     glaubitz@physik.fu-berlin.de, schwab@linux-m68k.org,
        Michael Schmitz <schmitzmic@gmail.com>
Subject: [PATCH v5 1/2] m68k/kernel - wire up syscall_trace_enter/leave for m68k
Date:   Thu, 17 Jun 2021 17:39:20 +1200
Message-Id: <1623908361-29837-1-git-send-email-schmitzmic@gmail.com>
X-Mailer: git-send-email 2.7.4
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
Changes from v4:

Andreas Schwab:
- optimize return code test (addql #1,%d0 for cmpil #-1,%d0)
- spelling fix in commit message

Changes from v3:

- change syscall_trace_enter return code test from !=0 to ==-1

Andreas: optimize syscall trace return code test
---
 arch/m68k/kernel/entry.S  |  8 +++++---
 arch/m68k/kernel/ptrace.c | 17 -----------------
 2 files changed, 5 insertions(+), 20 deletions(-)

diff --git a/arch/m68k/kernel/entry.S b/arch/m68k/kernel/entry.S
index 9dd76fb..90c5dcc 100644
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
+	addql	#1,%d0
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

