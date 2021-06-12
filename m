Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29089C48BE8
	for <linux-m68k@archiver.kernel.org>; Sat, 12 Jun 2021 23:39:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EEB7361105
	for <linux-m68k@archiver.kernel.org>; Sat, 12 Jun 2021 23:39:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229753AbhFLXk0 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sat, 12 Jun 2021 19:40:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231479AbhFLXkZ (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sat, 12 Jun 2021 19:40:25 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D14EC061574
        for <linux-m68k@lists.linux-m68k.org>; Sat, 12 Jun 2021 16:38:24 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id h12-20020a17090aa88cb029016400fd8ad8so8037726pjq.3
        for <linux-m68k@lists.linux-m68k.org>; Sat, 12 Jun 2021 16:38:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=6DYIKrUXMcsL4MIVy/dc7Q9toGqp4qAGWl+gq54bqdk=;
        b=N53F1VinuVv0AWyAoc7M3J+1r59cTqMdDJ4f4JVqPQeMdsbm546Tpx6LTzuBd9/gTz
         L7HxF/MbrHGnrtAwIF/LL/FWQCxLEfRaf1X16VvkC/33S3oHeEtCRz3zgVejelgpmw26
         pduA5sUg8/2G7hRi5j/J0Zy+pPisYuhVPqfgZbSkkWJ7cMCvZ8ShqWxFTmMHfUrs1RbN
         o3ZwlAqMIIrRB8XQjLzIrtkX1bVuoK/xm4jhdLlN8r1euWxALcI/jwit0VauIIF/3wC2
         n9h/zs/A25hWBrMjPk9LFdDXIGNQPxCIoWtVXovWUvy11+e7nXMzNVe4P9o05kzezxp5
         5hUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=6DYIKrUXMcsL4MIVy/dc7Q9toGqp4qAGWl+gq54bqdk=;
        b=Dm+MPsSr2kXdS4CdNwFfyMdsNc9qwvzIGiF2XYkftfrRYUKP9dDDK9Ty2CfS30P9bc
         FuzifuYbsjEROHcetIRYCPulaTEo/7djHJzKVvMpMb2qoiyJ7vtcwRT+l+q/Od3sft8j
         0VOHz8itZ2ulqqt9Mu5iUOlCTfnrgGLdr+7he0GGg6sRuEfMFV35/dlWBa0u8qFXLNf+
         PpDuhROsHVtUH6lzE0cA9gvKRm/+6mf+10gtROorGBs76hQXtIGXCGs1PcuTEjHK5rfg
         3eqbYZ1qL3InWuufi/ddt0YcljIY/RHI27uNGnFPa6MO6Ej4hNWDORQzc6SeT7NJNMZN
         ITWQ==
X-Gm-Message-State: AOAM530K6mEShQoVNijqndoTh1IQR0Ct6FhFlxnpp01k2k6BrU6uY0Ok
        HCvjXbQiWK7Svzc+SMVlrQ0=
X-Google-Smtp-Source: ABdhPJwU4fpMmMl7S0gj2YqbLjrsWqvDhDcG/GGfh6anjev0C45OjP7b3hwW0Kpk2L8MmhLfZcGNmg==
X-Received: by 2002:a17:90a:17c8:: with SMTP id q66mr16070296pja.154.1623541103926;
        Sat, 12 Jun 2021 16:38:23 -0700 (PDT)
Received: from xplor.waratah.dyndns.org (222-152-189-137-fibre.sparkbb.co.nz. [222.152.189.137])
        by smtp.gmail.com with ESMTPSA id j9sm7876809pjy.25.2021.06.12.16.38.22
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 12 Jun 2021 16:38:23 -0700 (PDT)
Received: by xplor.waratah.dyndns.org (Postfix, from userid 1000)
        id CE17736040F; Sun, 13 Jun 2021 11:38:19 +1200 (NZST)
From:   Michael Schmitz <schmitzmic@gmail.com>
To:     geert@linux-m68k.org, linux-arch@vger.kernel.org,
        linux-m68k@lists.linux-m68k.org
Cc:     ebiederm@xmission.com, torvalds@linux-foundation.org,
        schwab@linux-m68k.org, Michael Schmitz <schmitzmic@gmail.com>
Subject: [PATCH v1] m68k: save extra registers on sys_exit and sys_exit_group syscall entry
Date:   Sun, 13 Jun 2021 11:38:18 +1200
Message-Id: <1623541098-6532-1-git-send-email-schmitzmic@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <87sg1p30a1.fsf@disp2133>
References: <87sg1p30a1.fsf@disp2133>
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

do_exit() calls prace_stop() which may require access to all saved
registers. We only save those registers not preserved by C code
currently.

Provide a special syscall entry for exit and exit_group syscalls
similar to that used by clone and clone3, which have the same
requirements.

No fix to io_uring appears to be needed, because m68k copy_thread
treats kernel threads the same as e.g. alpha does, and copies only
a subset of registers in that case.

CC: Eric W. Biederman <ebiederm@xmission.com>
CC: Linus Torvalds <torvalds@linux-foundation.org>
CC: Andreas Schwab <schwab@linux-m68k.org>
Signed-off-by: Michael Schmitz <schmitzmic@gmail.com>
---
 arch/m68k/kernel/entry.S              | 14 ++++++++++++++
 arch/m68k/kernel/process.c            | 16 ++++++++++++++++
 arch/m68k/kernel/syscalls/syscall.tbl |  4 ++--
 3 files changed, 32 insertions(+), 2 deletions(-)

diff --git a/arch/m68k/kernel/entry.S b/arch/m68k/kernel/entry.S
index 9dd76fb..1e067e6 100644
--- a/arch/m68k/kernel/entry.S
+++ b/arch/m68k/kernel/entry.S
@@ -76,6 +76,20 @@ ENTRY(__sys_clone3)
 	lea	%sp@(28),%sp
 	rts
 
+ENTRY(__sys_exit)
+	SAVE_SWITCH_STACK
+	pea	%sp@(SWITCH_STACK_SIZE)
+	jbsr	m68k_exit
+	lea	%sp@(28),%sp
+	rts
+
+ENTRY(__sys_exit_group)
+	SAVE_SWITCH_STACK
+	pea	%sp@(SWITCH_STACK_SIZE)
+	jbsr	m68k_exit_group
+	lea	%sp@(28),%sp
+	rts
+
 ENTRY(sys_sigreturn)
 	SAVE_SWITCH_STACK
 	movel	%sp,%sp@-		  | switch_stack pointer
diff --git a/arch/m68k/kernel/process.c b/arch/m68k/kernel/process.c
index da83cc8..df4e5f1 100644
--- a/arch/m68k/kernel/process.c
+++ b/arch/m68k/kernel/process.c
@@ -138,6 +138,22 @@ asmlinkage int m68k_clone3(struct pt_regs *regs)
 	return sys_clone3((struct clone_args __user *)regs->d1, regs->d2);
 }
 
+/*
+ * Because extra registers are saved on the stack after the sys_exit()
+ * arguments, this C wrapper extracts them from pt_regs * and then calls the
+ * generic sys_exit() implementation.
+ */
+asmlinkage int m68k_exit(struct pt_regs *regs)
+{
+	return sys_exit(regs->d1);
+}
+
+/* Same for sys_exit_group ... */
+asmlinkage int m68k_exit_group(struct pt_regs *regs)
+{
+	return sys_exit_group(regs->d1);
+}
+
 int copy_thread(unsigned long clone_flags, unsigned long usp, unsigned long arg,
 		struct task_struct *p, unsigned long tls)
 {
diff --git a/arch/m68k/kernel/syscalls/syscall.tbl b/arch/m68k/kernel/syscalls/syscall.tbl
index 0dd019d..3d5b6fbc 100644
--- a/arch/m68k/kernel/syscalls/syscall.tbl
+++ b/arch/m68k/kernel/syscalls/syscall.tbl
@@ -8,7 +8,7 @@
 # The <abi> is always "common" for this file
 #
 0	common	restart_syscall			sys_restart_syscall
-1	common	exit				sys_exit
+1	common	exit				__sys_exit
 2	common	fork				__sys_fork
 3	common	read				sys_read
 4	common	write				sys_write
@@ -254,7 +254,7 @@
 244	common	io_submit			sys_io_submit
 245	common	io_cancel			sys_io_cancel
 246	common	fadvise64			sys_fadvise64
-247	common	exit_group			sys_exit_group
+247	common	exit_group			__sys_exit_group
 248	common	lookup_dcookie			sys_lookup_dcookie
 249	common	epoll_create			sys_epoll_create
 250	common	epoll_ctl			sys_epoll_ctl
-- 
2.7.4

