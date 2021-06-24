Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DED42C49EA5
	for <linux-m68k@archiver.kernel.org>; Thu, 24 Jun 2021 00:46:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id ADF4E61185
	for <linux-m68k@archiver.kernel.org>; Thu, 24 Jun 2021 00:46:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229818AbhFXAs1 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 23 Jun 2021 20:48:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229726AbhFXAs1 (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Wed, 23 Jun 2021 20:48:27 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE1A9C061756
        for <linux-m68k@vger.kernel.org>; Wed, 23 Jun 2021 17:46:07 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id c7-20020a17090ad907b029016faeeab0ccso4817702pjv.4
        for <linux-m68k@vger.kernel.org>; Wed, 23 Jun 2021 17:46:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=m1m1S8/XurGJVe+58CsfGi2yfhBse5fddhLQFsq6B4Y=;
        b=ad1x+2NLOTfGRbFXUQV07cjQNRBRfqVv+86egix22kp0Ku7pG7wWQknM1SmUYvV/Sp
         pAh0TMQqfYj5w57M4XnAmXj49vmUIKL9vANdHBUZLm9mXXb99MsuUFB5zY3VsKQQRh6T
         BONJnHty0YPSdGtQb1/1DV36oiSM0iccRJQNjRWYkVoWzebeBflGxzSLnEZn9niIjRa9
         mr+qUmBj3v41AwLT8Lo1h6ggMHfk7mTsjY1xWRPTt63PSVPE6BwX4IBRtK/XNBtLOtWb
         tdvhZsepO0ngmUyAF5W+l+d85ayqxgf52EKUc5fCv68U+OeFdt/A5j5ETc7FrT5XoIkX
         s+Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=m1m1S8/XurGJVe+58CsfGi2yfhBse5fddhLQFsq6B4Y=;
        b=oEFYRK79r0i/f6qsPF/bu8GlTWqAaFvXmUBofs4Hfv9aQvKtERXmpbFJV/P9kKYOkN
         UxJixyo6BDya4iI7WlqhNXAX+vcU5Ndfb9FlidSqQuSzAO4trdGx9Fs6RnxNG1yUb0av
         MtuQvLY6fuu3GoRSF73B7O5NdydzK6fXx2Pvq0MFnFSDSEx+6+sTiS6g20YdGKdwYYn2
         ubApb9Qk826Qea++4rIpgXdA0DU/eOJiAv18lLZghVOoMoKeN4znGutJ0pvga1pBQcic
         dn4eWKRWzuHUPecHyl6+0zhyMK3NIpQbJRQyHzFEm0kMZXXhgM7rA7JKTIKCSs/GBjJn
         YgoA==
X-Gm-Message-State: AOAM5320PIEWFs/9UiZD3Mbj/GKYduPV+wDYGuUqB17ZgAlvLFSxXGUx
        Z9Pydh49nZACT/om0XSYNG0=
X-Google-Smtp-Source: ABdhPJzPuayjRmhM+gowAnADouCY0/AhsY9pGzHt89OLDqWLSUBey0cvMpzgIg5IFh0Xwc4ZA+74RA==
X-Received: by 2002:a17:90a:7381:: with SMTP id j1mr12073967pjg.29.1624495567337;
        Wed, 23 Jun 2021 17:46:07 -0700 (PDT)
Received: from xplor.waratah.dyndns.org (222-152-189-137-fibre.sparkbb.co.nz. [222.152.189.137])
        by smtp.gmail.com with ESMTPSA id c184sm855378pfa.38.2021.06.23.17.46.05
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 23 Jun 2021 17:46:06 -0700 (PDT)
Received: by xplor.waratah.dyndns.org (Postfix, from userid 1000)
        id E9AA03603D9; Thu, 24 Jun 2021 12:46:02 +1200 (NZST)
From:   Michael Schmitz <schmitzmic@gmail.com>
To:     linux-m68k@vger.kernel.org, geert@linux-m68k.org
Cc:     glaubitz@physik.fu-berlin.de, schwab@linux-m68k.org,
        Michael Schmitz <schmitzmic@gmail.com>
Subject: [PATCH v6 1/2] m68k/kernel - wire up syscall_trace_enter/leave for m68k
Date:   Thu, 24 Jun 2021 12:45:59 +1200
Message-Id: <1624495560-6351-2-git-send-email-schmitzmic@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1624495560-6351-1-git-send-email-schmitzmic@gmail.com>
References: <1624495560-6351-1-git-send-email-schmitzmic@gmail.com>
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
Changes from v5:

- add comment to explain optimization

Changes from v4:

Andreas Schwab:
- optimize return code test (addql #1,%d0 for cmpil #-1,%d0)
- spelling fix in commit message

Changes from v3:

- change syscall_trace_enter return code test from !=0 to ==-1
---
 arch/m68k/kernel/entry.S  |  8 +++++---
 arch/m68k/kernel/ptrace.c | 17 -----------------
 2 files changed, 5 insertions(+), 20 deletions(-)

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

