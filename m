Return-Path: <SRS0=TiHb=BF=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E3D9C433DF
	for <linux-m68k@archiver.kernel.org>; Sun, 26 Jul 2020 01:28:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D9467206D8
	for <linux-m68k@archiver.kernel.org>; Sun, 26 Jul 2020 01:28:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NeUxBG2n"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726931AbgGZB25 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sat, 25 Jul 2020 21:28:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726870AbgGZB25 (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Sat, 25 Jul 2020 21:28:57 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55215C0619D2
        for <linux-m68k@vger.kernel.org>; Sat, 25 Jul 2020 18:28:57 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id e22so266785pjt.3
        for <linux-m68k@vger.kernel.org>; Sat, 25 Jul 2020 18:28:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=A05j56+bNmUVzkHGnQALsZsNXARZHm+toJ+cIFkLJKI=;
        b=NeUxBG2nZMZrJ0oqUuPdLMwI2iECZMw7YOT+pTMyBplMFbnfInbrzlQ/pYpfD37QiR
         qqLYGkiGC8QknOgQxJgESKiRIxX/mj8rw/GSoxUg95pFfz6YzFazmzeNKUr9vcxUckdV
         ImPTjj9XPY0capURyCET5bcJyQVfMUhQ6poEhTiAnbZ7yU/EpyTKVYkO98E1hR2TuGLg
         3OlEM0us9YBGGnFptcbl9Adm1d6buL+Q8SIlAqEUu3PJMBlTZevLpwiC0MwHtOk2mce1
         CAUuZBr4WmWoEjZFwHGDgNyQPLVb9kMmpMhuSSpc6RUcY5FXh8IyHK1MH/ssnQ7Aa5bW
         qADw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=A05j56+bNmUVzkHGnQALsZsNXARZHm+toJ+cIFkLJKI=;
        b=igO/CRSlOkSLGetfBtFlIGjVe1Xfo6/7p0HzkH8JT1s1ZyJrMSM3eTQdHbo0f6rcV9
         1QVCKyKDCyLfzlrl0dAK8McfW42ew/BsMKVs1AmRmq2NKPTBG++88ZZbll0plCisHu9s
         ULos4tpRKILjHrB0+cpuN/8kzy8h2BM81QRf+Q4KOAt0lIOSXTfJTGyIEDRBpoWLEFoX
         OOjnAy8dMIUfGKuMbEpaCdSEWAZ9BGn/TJwSmWK64d3k99LS0ltON1cykr19BGoiv6dF
         LUTwQwAaCAqolT1yK6MI9pYEFrRPeycGCldTO+RLJRSKopJPLsVNDzZxE03pLW5pA4DM
         px2A==
X-Gm-Message-State: AOAM530aOZVrHCCHfHHfV+iiGuYSWMIl3vIpX0ZgFAF1vlYsLr391cqk
        wiElCyQM3Ks2e8ZiM+95hx9EfnRo
X-Google-Smtp-Source: ABdhPJxPoiEDm8IhufTti7mKFSxS1Q3Q1DNnUWdQYNcJdNncqDOAXXxm9xWCNoV1ZnbDGwal2Y48xg==
X-Received: by 2002:a17:90a:916:: with SMTP id n22mr11550304pjn.78.1595726936906;
        Sat, 25 Jul 2020 18:28:56 -0700 (PDT)
Received: from xplor.waratah.dyndns.org (122-58-181-132-adsl.sparkbb.co.nz. [122.58.181.132])
        by smtp.gmail.com with ESMTPSA id s23sm211764pjs.47.2020.07.25.18.28.55
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 25 Jul 2020 18:28:56 -0700 (PDT)
Received: by xplor.waratah.dyndns.org (Postfix, from userid 1000)
        id EE08D360081; Sun, 26 Jul 2020 13:28:52 +1200 (NZST)
From:   Michael Schmitz <schmitzmic@gmail.com>
To:     glaubitz@physik.fu-berlin.de, geert@linux-m68k.org
Cc:     linux-m68k@vger.kernel.org, schwab@linux-m68k.org,
        Michael Schmitz <schmitzmic@gmail.com>
Subject: [PATCH RFC v2] m68k/kernel - wire up syscall_trace_enter/leave for m68k
Date:   Sun, 26 Jul 2020 13:28:50 +1200
Message-Id: <1595726930-8969-1-git-send-email-schmitzmic@gmail.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <f0c9edc0-e596-c483-b9a6-f67778bd297c@physik.fu-berlin.de>
References: <f0c9edc0-e596-c483-b9a6-f67778bd297c@physik.fu-berlin.de>
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

m68k (other than Coldfire) uses syscall_trace for both trace entry
and trace exit. Seccomp support requires separate entry points for
trace entry and exit which are already provided for Coldfire.

Replace syscall_trace by syscall_trace_enter and syscall_trace_leave
in preparation for seccomp support. Check return code of
syscall_trace_enter(), and skip syscall if nonzero. Return code
will be set to -EPERM in that case.

No regression seen in testing with strace on ARAnyM.

Signed-off-by: Michael Schmitz <schmitzmic@gmail.com>
---

Changes from v1:

- add return code check in do_trace_entry branch to enable syscall
  filtering (will return -EPERM)
- change to use testl for return code check (suggested by Andreas Schwab)
 
---
 arch/m68k/kernel/entry.S  |   11 ++++++++---
 arch/m68k/kernel/ptrace.c |   17 -----------------
 2 files changed, 8 insertions(+), 20 deletions(-)

diff --git a/arch/m68k/kernel/entry.S b/arch/m68k/kernel/entry.S
index 9dd76fb..fbd2222 100644
--- a/arch/m68k/kernel/entry.S
+++ b/arch/m68k/kernel/entry.S
@@ -164,20 +164,25 @@ do_trace_entry:
 	movel	#-ENOSYS,%sp@(PT_OFF_D0)| needed for strace
 	subql	#4,%sp
 	SAVE_SWITCH_STACK
-	jbsr	syscall_trace
+	jbsr	syscall_trace_enter
 	RESTORE_SWITCH_STACK
 	addql	#4,%sp
+	tstl	%d0
+	jne	denied
 	movel	%sp@(PT_OFF_ORIG_D0),%d0
 	cmpl	#NR_syscalls,%d0
 	jcs	syscall
 badsys:
 	movel	#-ENOSYS,%sp@(PT_OFF_D0)
 	jra	ret_from_syscall
+denied:
+	movel	#-EPERM,%sp@(PT_OFF_D0)
+	jra	ret_from_syscall
 
 do_trace_exit:
 	subql	#4,%sp
 	SAVE_SWITCH_STACK
-	jbsr	syscall_trace
+	jbsr	syscall_trace_leave
 	RESTORE_SWITCH_STACK
 	addql	#4,%sp
 	jra	.Lret_from_exception
@@ -186,7 +191,7 @@ ENTRY(ret_from_signal)
 	movel	%curptr@(TASK_STACK),%a1
 	tstb	%a1@(TINFO_FLAGS+2)
 	jge	1f
-	jbsr	syscall_trace
+	jbsr	syscall_trace_leave
 1:	RESTORE_SWITCH_STACK
 	addql	#4,%sp
 /* on 68040 complete pending writebacks if any */
diff --git a/arch/m68k/kernel/ptrace.c b/arch/m68k/kernel/ptrace.c
index 748c63b..b747a86 100644
--- a/arch/m68k/kernel/ptrace.c
+++ b/arch/m68k/kernel/ptrace.c
@@ -272,22 +272,6 @@ long arch_ptrace(struct task_struct *child, long request,
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
@@ -302,4 +286,3 @@ asmlinkage void syscall_trace_leave(void)
 	if (test_thread_flag(TIF_SYSCALL_TRACE))
 		tracehook_report_syscall_exit(task_pt_regs(current), 0);
 }
-#endif /* CONFIG_COLDFIRE */
-- 
1.7.0.4

