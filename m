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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7998FC48BDF
	for <linux-m68k@archiver.kernel.org>; Wed, 16 Jun 2021 00:49:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5C46960698
	for <linux-m68k@archiver.kernel.org>; Wed, 16 Jun 2021 00:49:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231453AbhFPAvk (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 15 Jun 2021 20:51:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230507AbhFPAvi (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Tue, 15 Jun 2021 20:51:38 -0400
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 461F6C061574
        for <linux-m68k@vger.kernel.org>; Tue, 15 Jun 2021 17:49:32 -0700 (PDT)
Received: by mail-pf1-x430.google.com with SMTP id k6so766846pfk.12
        for <linux-m68k@vger.kernel.org>; Tue, 15 Jun 2021 17:49:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=CvHWfSGUNPjgOLLOeBLUD8Z90qeBoXQBaupCR5BDJqQ=;
        b=LuTPGqrOnNkqDRtWQWiZpiRSHFCPqCn+qbDtA1U2beh7taSb5b1wCMCOVnpV9E9/kc
         Cd48QgySPJZwUfw2czifGZA9LuL2Gmt/J50oYS/utCwcWRvuRs6UuZh7O/WRc9Hu5CM7
         oEIfySgvrwagrD4U0JwRb3KGbElJjpiBXbdqJDgvzyX8kGa26j9w+PNtt8xSHDcs2HJt
         WRQeN2yInbkG42F6mB29MPhPow0u4rkwF6jRr5eMG3cs/qiNEb4gIIqTxMiVDMMtkWl5
         stjyxYqkaykf32Aiv/+6O+8I7PTj/sUfXh/QWsekxrhzMPc2+AZRL6aK8+SDLEKagpsF
         CalQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=CvHWfSGUNPjgOLLOeBLUD8Z90qeBoXQBaupCR5BDJqQ=;
        b=eZSx4mD5ij+Y217z2Bzkq9XKAkkSiuOCqOQXrvd1ZoLaBK6M9LvtiD9+pU5Jf43KXX
         Wkfi/ysCqpGDR9y+WbKyEFsB6HgfE6KbK0TfBTtv+o3KijyJ8JCSaF6Q6HUepjfRRfIy
         UpJYbtcWK6640lJ1WYLzYkKUsvJ/j6LKseU+ZHfjJbY4JT70gQf13z/EgUwrQ+rw3UuZ
         LJps+so40wcvfkyUAIdHzecLU/WA6b5G6qYNbfG8NCZGbaU/qJscR1NMYInXAE+v7bne
         wkXv1rVslbyGr2v+BZ9RUdEHS08wYz0leiLCOs0zsJUfF8qMhLSSkW4oEqbERfZTWNqA
         6kPQ==
X-Gm-Message-State: AOAM530jMRMQjqejJgOIYwkY9iJlsZB2IuTchiBrZeKrmosqAbvfmlSO
        BqM1jVSkd4riWYRnCdTvcc4=
X-Google-Smtp-Source: ABdhPJyogWzktj/gEh347D407vXli/7LKFQJaOIEbNYzmOCxUEavHSzTqgXwnE9ojtRkqa/2kuU4Pg==
X-Received: by 2002:a62:6491:0:b029:28e:8c90:6b16 with SMTP id y139-20020a6264910000b029028e8c906b16mr6838091pfb.24.1623804571845;
        Tue, 15 Jun 2021 17:49:31 -0700 (PDT)
Received: from xplor.waratah.dyndns.org (222-152-189-137-fibre.sparkbb.co.nz. [222.152.189.137])
        by smtp.gmail.com with ESMTPSA id b1sm262867pgb.91.2021.06.15.17.49.30
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 15 Jun 2021 17:49:31 -0700 (PDT)
Received: by xplor.waratah.dyndns.org (Postfix, from userid 1000)
        id 3D6FC36040F; Wed, 16 Jun 2021 12:49:27 +1200 (NZST)
From:   Michael Schmitz <schmitzmic@gmail.com>
To:     linux-m68k@vger.kernel.org, geert@linux-m68k.org
Cc:     glaubitz@physik.fu-berlin.de, schwab@linux-m68k.org,
        Michael Schmitz <schmitzmic@gmail.com>
Subject: [PATCH v4] m68k/kernel - wire up syscall_trace_enter/leave for m68k
Date:   Wed, 16 Jun 2021 12:49:25 +1200
Message-Id: <1623804565-25473-1-git-send-email-schmitzmic@gmail.com>
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
left at what had been set by by ptrace or seccomp (in regs->d0).

No regression seen in testing with strace on ARAnyM.

Signed-off-by: Michael Schmitz <schmitzmic@gmail.com>

--
Changes from v3:

- change syscall_trace_enter return code test from !=0 to ==-1
---
 arch/m68k/kernel/entry.S  |  8 +++++---
 arch/m68k/kernel/ptrace.c | 17 -----------------
 2 files changed, 5 insertions(+), 20 deletions(-)

diff --git a/arch/m68k/kernel/entry.S b/arch/m68k/kernel/entry.S
index 9dd76fb..e949b66 100644
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
+	cmpil	#-1,%d0
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

