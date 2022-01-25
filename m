Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AA1CC433FE
	for <linux-m68k@archiver.kernel.org>; Tue, 25 Jan 2022 07:16:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1442582AbiAYHQe (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 25 Jan 2022 02:16:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1442711AbiAYHKk (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Tue, 25 Jan 2022 02:10:40 -0500
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE5E0C06808D
        for <linux-m68k@vger.kernel.org>; Mon, 24 Jan 2022 22:08:28 -0800 (PST)
Received: by mail-pf1-x435.google.com with SMTP id y27so14456140pfa.0
        for <linux-m68k@vger.kernel.org>; Mon, 24 Jan 2022 22:08:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=b0k0Q6QG/6k5gpknBDZTiWz4v+wffd/XVo4QzU/unGE=;
        b=kCs40/eNGYLt/yQUHedEjZpx055KHFqLN8LlnJ/lxqgHlkwpoLh4JZlOB30YfeXDxp
         a7bJolhN1+mOBuJfv6eDJ2y2DS6xuK+M75KjP1BFhjD824z2dR5rQRIRUx6BWEHAMWWP
         s237q8h9g8EqqF3PUj3/wgso0Rvk57jCdxnTDuM/fGLteJl5I8KKnY/nVSYoeHaDkcTq
         HNyC1/0gjC7ISpysht/KvcXhD58ju/of25pQMDp2UioIX/1CddgFcz5d53tpl6dnUQMT
         Wsl3ZK/KtJR9N4DKP1sKPYl6E6C/UL8Stx8Wz7mTfl3XJ9gSbA9b+ITGqn3fFRnqQIur
         V+uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=b0k0Q6QG/6k5gpknBDZTiWz4v+wffd/XVo4QzU/unGE=;
        b=B4orY73c894m5yL/vscpxUGhBpum2Bj0L8e3v7LODkqAXqkTBl23XlIVKmsq6+8h1e
         ehZAU9XmmM/DP8Xyha4K4kBhwTy2qWEamvqY+0J0Ss0dmRJKhMn7Jri/U7P4DPsAg/Yg
         umVTfKX2K0XuPzjz5NN9xjuI2x3Hd3e8wOzk9XCmpDI05TFNWnFOWu2/lYpfsx0pN1Y7
         MJlCDe1jBe/z7FaDzuHi6MBxAsk2lGqiDn0DfmT0BWiiUNVt+y4GmHuQzNRiiB7slJ86
         imP2DnAgilPz4ziSc1JKvhVyDLpxqof3b3CKI+Q4F2HiWJVLPp+8AE9bRiEFt4TkW/W4
         F32w==
X-Gm-Message-State: AOAM533FnWOYyI7dxJQ8hMR3XA+dWbpD1wPFyOULo6BYkHfSqJI0dwdL
        iVXZm32W5hzbFHXBrxFGnvWKIRrT5mU=
X-Google-Smtp-Source: ABdhPJzL3QEqnigS5QL7Osc98Tt3Nyb2YWxQ+w6TMthQcSzN85ecTds7Whbn/bdFJs7IY9XtfHdLEA==
X-Received: by 2002:a63:8543:: with SMTP id u64mr9759573pgd.338.1643090908478;
        Mon, 24 Jan 2022 22:08:28 -0800 (PST)
Received: from xplor.waratah.dyndns.org (222-155-5-102-adsl.sparkbb.co.nz. [222.155.5.102])
        by smtp.gmail.com with ESMTPSA id s42sm6182717pfg.146.2022.01.24.22.08.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jan 2022 22:08:27 -0800 (PST)
Received: by xplor.waratah.dyndns.org (Postfix, from userid 1000)
        id CA7B8360334; Tue, 25 Jan 2022 19:08:23 +1300 (NZDT)
From:   Michael Schmitz <schmitzmic@gmail.com>
To:     linux-m68k@vger.kernel.org, geert@linux-m68k.org
Cc:     ebiederm@xmission.com, viro@zeniv.linux.org.uk,
        Michael Schmitz <schmitzmic@gmail.com>
Subject: [PATCH v9 1/3] m68k/kernel - wire up syscall_trace_enter/leave for m68k
Date:   Tue, 25 Jan 2022 19:08:19 +1300
Message-Id: <20220125060821.2405-2-schmitzmic@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220125060821.2405-1-schmitzmic@gmail.com>
References: <20220125060821.2405-1-schmitzmic@gmail.com>
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

m68k (other than Coldfire) uses syscall_trace for both trace entry
and trace exit. Seccomp support requires separate entry points for
trace entry and exit which are already provided for Coldfire.

Replace syscall_trace by syscall_trace_enter and syscall_trace_leave
in preparation for seccomp support.

No regression seen in testing with strace on ARAnyM.

Signed-off-by: Michael Schmitz <schmitzmic@gmail.com>
Acked-by: "Eric W. Biederman" <ebiederm@xmission.com>

--
Changes from v8:

- adapt ptrace.c patch to recent changes by Eric Biederman

Changes from v7:

Al Viro:
- split first patch to separate the switch to
  syscall_trace_enter/leave() from return code checks

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

revert syscall trace return code checks
---
 arch/m68k/kernel/entry.S  | 4 ++--
 arch/m68k/kernel/ptrace.c | 7 -------
 2 files changed, 2 insertions(+), 9 deletions(-)

diff --git a/arch/m68k/kernel/entry.S b/arch/m68k/kernel/entry.S
index 9434fca68de5..18f278bdbd21 100644
--- a/arch/m68k/kernel/entry.S
+++ b/arch/m68k/kernel/entry.S
@@ -181,7 +181,7 @@ do_trace_entry:
 	movel	#-ENOSYS,%sp@(PT_OFF_D0)| needed for strace
 	subql	#4,%sp
 	SAVE_SWITCH_STACK
-	jbsr	syscall_trace
+	jbsr	syscall_trace_enter
 	RESTORE_SWITCH_STACK
 	addql	#4,%sp
 	movel	%sp@(PT_OFF_ORIG_D0),%d0
@@ -194,7 +194,7 @@ badsys:
 do_trace_exit:
 	subql	#4,%sp
 	SAVE_SWITCH_STACK
-	jbsr	syscall_trace
+	jbsr	syscall_trace_leave
 	RESTORE_SWITCH_STACK
 	addql	#4,%sp
 	jra	.Lret_from_exception
diff --git a/arch/m68k/kernel/ptrace.c b/arch/m68k/kernel/ptrace.c
index aa3a0b8d07e9..74d58a82a135 100644
--- a/arch/m68k/kernel/ptrace.c
+++ b/arch/m68k/kernel/ptrace.c
@@ -271,12 +271,6 @@ long arch_ptrace(struct task_struct *child, long request,
 	return -EIO;
 }
 
-asmlinkage void syscall_trace(void)
-{
-	ptrace_report_syscall(0);
-}
-
-#if defined(CONFIG_COLDFIRE) || !defined(CONFIG_MMU)
 asmlinkage int syscall_trace_enter(void)
 {
 	int ret = 0;
@@ -291,4 +285,3 @@ asmlinkage void syscall_trace_leave(void)
 	if (test_thread_flag(TIF_SYSCALL_TRACE))
 		tracehook_report_syscall_exit(task_pt_regs(current), 0);
 }
-#endif /* CONFIG_COLDFIRE */
-- 
2.17.1

