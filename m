Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB2B2C433EF
	for <linux-m68k@archiver.kernel.org>; Thu, 13 Jan 2022 01:09:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230028AbiAMBJL (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 12 Jan 2022 20:09:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230076AbiAMBJL (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Wed, 12 Jan 2022 20:09:11 -0500
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C661DC06173F
        for <linux-m68k@vger.kernel.org>; Wed, 12 Jan 2022 17:09:10 -0800 (PST)
Received: by mail-pl1-x636.google.com with SMTP id n11so5212994plf.4
        for <linux-m68k@vger.kernel.org>; Wed, 12 Jan 2022 17:09:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=R5GpNnnm+D+5Mv4MtEUkPSj7rJ+9tNSgYWcydk3MclI=;
        b=X3nfxyMbIyrkCHYLjXGPUzUedEbaEZMYcYryFr2u2DX49ehwQ+UO6e6AWuRPe8jbYi
         rkEUP9E9tM6V0xokqPCSv+9pLkjEZGuLi49PnhWlNrHvov+i5jhRLa+GLBpYl18iN0A7
         dhXKkhfsN0fiiJB2T/T0opXBuPklRbcM4H9J8Ky4nWLh+xrbmcH9MErLOIIRQe7i3JfB
         339QheuM0ix4u7gSumT/7YhhkkgH3qxDKWvOA4/k+vl68XOp81wneLHEjDtODEzaTvqy
         EVEW41asFBdzVNm/IGbf41GxofOXY3NlZsHa5rBNIKTrMmyeZHdwOcyGwMWf6+x0TzJm
         R23A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=R5GpNnnm+D+5Mv4MtEUkPSj7rJ+9tNSgYWcydk3MclI=;
        b=O1H+NboqWxGqs2kLZuxOODYqkLOe/L4yzSmPmx2ytSLYNjgtheaQcB2gq1T+A3NUm+
         2OQA+DHnxSozJ088wIAMPvQRKIdPJbRwlasOGzpvzCgPbaoz38TmTfsHOam/azLxtIEi
         /s8F7JJc5pWnpywO9ppgcQXFDELmqMmwGdjxDpbk2ghdiTa6gONHi6JxFkjt+Dbi8RiF
         KdYDF4clFCINaYaj/LHPIxxiK/9Kj52CR6+q59+70SHpVZ3f8fZytKXcU62iidAwKRy2
         vqNnMpjn+ZDCh8TYSCgS5LZJ5nWWyUi/9Zr0Hr89KWbbi+v/EfJTt/ixkQCAbk/wf8OY
         SCng==
X-Gm-Message-State: AOAM532gIDgifO54//FK3fVODeKHqD31ayQwtmv4fWXTf5IkZJCCniv1
        ydV01R+z8eroM0nHL06xmXkZ8f0Mcsg=
X-Google-Smtp-Source: ABdhPJwReGXEevZA9WyIRq+KVkw/2fp5EIgCF4FyKrBwnvzBFiLT0e8342yj5+l3rbZ0QpjX3rnc0Q==
X-Received: by 2002:a63:3858:: with SMTP id h24mr1956244pgn.17.1642036150335;
        Wed, 12 Jan 2022 17:09:10 -0800 (PST)
Received: from xplor.waratah.dyndns.org (222-155-5-102-adsl.sparkbb.co.nz. [222.155.5.102])
        by smtp.gmail.com with ESMTPSA id kt19sm742754pjb.50.2022.01.12.17.09.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jan 2022 17:09:09 -0800 (PST)
Received: by xplor.waratah.dyndns.org (Postfix, from userid 1000)
        id 00C1D36032D; Thu, 13 Jan 2022 14:09:05 +1300 (NZDT)
From:   Michael Schmitz <schmitzmic@gmail.com>
To:     linux-m68k@vger.kernel.org, geert@linux-m68k.org
Cc:     ebiederm@xmission.com, viro@zeniv.linux.org.uk,
        Michael Schmitz <schmitzmic@gmail.com>
Subject: [PATCH v8 1/3] m68k/kernel - wire up syscall_trace_enter/leave for m68k
Date:   Thu, 13 Jan 2022 14:09:01 +1300
Message-Id: <20220113010903.720-2-schmitzmic@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220113010903.720-1-schmitzmic@gmail.com>
References: <20220113010903.720-1-schmitzmic@gmail.com>
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

--
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
 arch/m68k/kernel/entry.S  |  4 ++--
 arch/m68k/kernel/ptrace.c | 17 -----------------
 2 files changed, 2 insertions(+), 19 deletions(-)

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
index 94b3b274186d..74d58a82a135 100644
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
2.17.1

