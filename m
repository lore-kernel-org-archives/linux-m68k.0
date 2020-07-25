Return-Path: <SRS0=imOp=BE=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7BADC433E1
	for <linux-m68k@archiver.kernel.org>; Sat, 25 Jul 2020 01:49:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B307D2070E
	for <linux-m68k@archiver.kernel.org>; Sat, 25 Jul 2020 01:49:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="au+RSayr"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726706AbgGYBtH (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 24 Jul 2020 21:49:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726592AbgGYBtH (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Fri, 24 Jul 2020 21:49:07 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BEA8C0619D3
        for <linux-m68k@vger.kernel.org>; Fri, 24 Jul 2020 18:49:07 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id e8so6370965pgc.5
        for <linux-m68k@vger.kernel.org>; Fri, 24 Jul 2020 18:49:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=i0YzcEeKUyQ2HN8m7FgbBxhZhj3ZVRh/ox9QODUE0G4=;
        b=au+RSayriwaoayDfbz+kQN7khEN4rLCNyop3f04pvdj3JWbPcyZcv7Bg4/m2qLOvlD
         CulsufKeaJ1yuLCFO3K4/2FgtbqPksmMpzd8dBGF/FpXSik8zmVQgJ3pPdV5by2C4GjK
         /jBp9L/r7fDLP+3KO3+ggZ2v4DHZ08QHq5QVamdfMfplRQrn06o5OpwrXq8xENXCidgG
         ipy71hSPHQs5qZsSmfuG/SsN1pEr24TmuH5lNSQLUopGLQrtsEmnW0aq8rzKoSdUeEX0
         bhqoKy/NVTzk7uPufwvaMf6InAbj8ZpM0vhIIFvDgQQmUjqdBPreBMcVQTWZ9chqwKJ8
         RAEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=i0YzcEeKUyQ2HN8m7FgbBxhZhj3ZVRh/ox9QODUE0G4=;
        b=Q0o/FrToMTVhvBaW/Kt3iNM//ya5q4Eh1BX2UUdQPKLKioeyWgnEuTR/zCbC53Y5ZC
         Yqm3EnfTu5Jhgk5WxC8nJmVrYocukvGL3TVrszKCeWzlYzvRWlGprquU2FPEE8JpCiS+
         UZLncIlWmKVVPqRD+vWVpy1WdmVS4ovpI+Ta97GyLNo1OkExsdQXQR6tHrvJJMnfMAMY
         Klzzb1Xg3cLZXAoixNTVL0uE8GgiE7RPWO8hj55WJA0Ep4gy4vz/knqMK92Pj0WbKo8g
         SqCkyQbEcBjtCVK83bcM/RngV1pBxvxDUXd4bSs3MuSoTW1Vv7nzWB6AOqKiOmow7i0H
         0PYA==
X-Gm-Message-State: AOAM532w0YLAoOASfXyop1OzK3ZQ9Dp41xEjteXj2MnoUc+pTYIas8iH
        bH78gGFY8ekojTKWFMZgJzU=
X-Google-Smtp-Source: ABdhPJy4ngsnBLwHDWIC+8GB+R0klGIQyig6Hilq6BziARFLao3cjYzwtMcvEAcTnOE+uTnM6N80Yw==
X-Received: by 2002:a63:7f5a:: with SMTP id p26mr10894191pgn.117.1595641746620;
        Fri, 24 Jul 2020 18:49:06 -0700 (PDT)
Received: from xplor.waratah.dyndns.org (122-58-181-132-adsl.sparkbb.co.nz. [122.58.181.132])
        by smtp.gmail.com with ESMTPSA id a184sm811388pfa.83.2020.07.24.18.49.05
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 24 Jul 2020 18:49:05 -0700 (PDT)
Received: by xplor.waratah.dyndns.org (Postfix, from userid 1000)
        id 10017360081; Sat, 25 Jul 2020 13:49:02 +1200 (NZST)
From:   Michael Schmitz <schmitzmic@gmail.com>
To:     glaubitz@physik.fu-berlin.de, geert@linux-m68k.org
Cc:     linux-m68k@vger.kernel.org, Michael Schmitz <schmitzmic@gmail.com>
Subject: [PATCH RFC] m68k/kernel - wire up syscall_trace_enter/leave for m68k
Date:   Sat, 25 Jul 2020 13:48:59 +1200
Message-Id: <1595641739-6651-1-git-send-email-schmitzmic@gmail.com>
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
in preparation for seccomp support.

No regression seen in testing with strace on ARAnyM.

Signed-off-by: Michael Schmitz <schmitzmic@gmail.com>
---
 arch/m68k/kernel/entry.S  |    6 +++---
 arch/m68k/kernel/ptrace.c |   17 -----------------
 2 files changed, 3 insertions(+), 20 deletions(-)

diff --git a/arch/m68k/kernel/entry.S b/arch/m68k/kernel/entry.S
index 9dd76fb..76badc4 100644
--- a/arch/m68k/kernel/entry.S
+++ b/arch/m68k/kernel/entry.S
@@ -164,7 +164,7 @@ do_trace_entry:
 	movel	#-ENOSYS,%sp@(PT_OFF_D0)| needed for strace
 	subql	#4,%sp
 	SAVE_SWITCH_STACK
-	jbsr	syscall_trace
+	jbsr	syscall_trace_enter
 	RESTORE_SWITCH_STACK
 	addql	#4,%sp
 	movel	%sp@(PT_OFF_ORIG_D0),%d0
@@ -177,7 +177,7 @@ badsys:
 do_trace_exit:
 	subql	#4,%sp
 	SAVE_SWITCH_STACK
-	jbsr	syscall_trace
+	jbsr	syscall_trace_leave
 	RESTORE_SWITCH_STACK
 	addql	#4,%sp
 	jra	.Lret_from_exception
@@ -186,7 +186,7 @@ ENTRY(ret_from_signal)
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

