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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E790C48BE5
	for <linux-m68k@archiver.kernel.org>; Wed, 16 Jun 2021 01:03:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EA04C60FEB
	for <linux-m68k@archiver.kernel.org>; Wed, 16 Jun 2021 01:03:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231226AbhFPBFi (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 15 Jun 2021 21:05:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231184AbhFPBFS (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Tue, 15 Jun 2021 21:05:18 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62E6AC061574
        for <linux-m68k@vger.kernel.org>; Tue, 15 Jun 2021 18:03:13 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id k5so720626pjj.1
        for <linux-m68k@vger.kernel.org>; Tue, 15 Jun 2021 18:03:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=EI5rhymHAOvEcgIGBtZdUJ2J9CL6EU4nlQMmpeAtuE0=;
        b=EOwmT6wFiof0XvPtHki89gY0w7cY7oEWsJjvii7nA62BKKoWcGe8wpzQnwRRS8UTTQ
         ISn15OJGsRn3KPx2v28yKv1O8Ne/qRCs5+sEaOjdglb1pLLrVgoh1HCVqdISVlDvczhN
         m74j4nGS8mYjc42DU9e3iKKJMtUboWt9LVQeXAXV5Gl0WCGJW2Apaf4wTULcDVModicd
         NmAfIBYHkI/bQgDyAoxjfWRtP9ZqLH4ipG+HotPTvzrV49IFJSH2WhmQYlxgzCR5GCwX
         iwNqX20Ytxx5YEbZeQfYL/jPmGUL+JnSpl8/hmwr3tm4+BQZbP65lVsAeKnvXc7yp9rD
         qUwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=EI5rhymHAOvEcgIGBtZdUJ2J9CL6EU4nlQMmpeAtuE0=;
        b=LFnHhPaNT15KlhpOqQy88pokfuXJEwjN6PbSt86vRzNKJmFogRGgZe0jXgIoZKZ0F6
         lwklHwUFGGG5PP0EwsFLbBXRF+K1b7XcwRy6LmHfD41P9QGt8dA+e5ZNhRXezTasHW5Y
         l/p/Sp06c3jNaHov4oSLmsArwXfoOhfsg31wJzv2TUEXYY0WBz9LsIdFqAybNDdLYnqr
         CagQC6S7+UFeBHgHLiacRTOgFxjBPISQyjCpYPLAfLKmUaQRq9g2SRDyNaJNLeZm5gSd
         A6ehWhnCZ8I9II5J3RYrW6p09NCURP5ZOIPRvMwQCUZn4hggQuG6B2lNeB9eqcFpbz0/
         Opcg==
X-Gm-Message-State: AOAM530zCp+YzJ+i+Ntz0Jp5aGVIQQb88ieC4CN1m57gRBuHc3zNs5tY
        eH0gHh9ewM+GDQkt6kCMjuKmghBNza97Rg==
X-Google-Smtp-Source: ABdhPJwvC9rxsA4Wl8WnntkRbn67hRGoWQ6mLyWs/yJ0+T0/RZpR2GHmenHbbdg5xVc5XgpMtq6TOw==
X-Received: by 2002:a17:90b:4b88:: with SMTP id lr8mr2103629pjb.85.1623805392796;
        Tue, 15 Jun 2021 18:03:12 -0700 (PDT)
Received: from xplor.waratah.dyndns.org (222-152-189-137-fibre.sparkbb.co.nz. [222.152.189.137])
        by smtp.gmail.com with ESMTPSA id fs24sm305829pjb.6.2021.06.15.18.03.11
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 15 Jun 2021 18:03:12 -0700 (PDT)
Received: by xplor.waratah.dyndns.org (Postfix, from userid 1000)
        id C14B336040F; Wed, 16 Jun 2021 13:03:08 +1200 (NZST)
From:   Michael Schmitz <schmitzmic@gmail.com>
To:     linux-m68k@vger.kernel.org, geert@linux-m68k.org
Cc:     glaubitz@physik.fu-berlin.de, schwab@linux-m68k.org,
        Michael Schmitz <schmitzmic@gmail.com>
Subject: [PATCH RFC] m68k: add kernel seccomp support
Date:   Wed, 16 Jun 2021 13:03:04 +1200
Message-Id: <1623805384-26280-1-git-send-email-schmitzmic@gmail.com>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Add secure_computing() call to syscall_trace_enter to actually
filter system calls.

Add necessary arch Kconfig options, define TIF_SECCOMP trace
flag and provide basic seccomp filter support in asm/syscall.h

syscall_get_nr currently uses the syscall nr stored in orig_d0
because we change d0 to a default return code before starting a
syscall trace. This may be inconsistent with syscall_rollback
copying orig_d0 to d0 (which we never check upon return from
trace). We use d0 for the return code from syscall_trace_enter
in entry.S currently, and could perhaps expand that to store
a new syscall number returned by the seccomp filter before
executing the syscall. This clearly needs some discussion.

Compiles (for Atari) and boots on ARAnyM, otherwise untested.

Signed-off-by: Michael Schmitz <schmitzmic@gmail.com>
---
 arch/m68k/Kconfig                   |  2 ++
 arch/m68k/include/asm/seccomp.h     | 11 +++++++++++
 arch/m68k/include/asm/syscall.h     | 33 +++++++++++++++++++++++++++++++++
 arch/m68k/include/asm/thread_info.h |  2 ++
 arch/m68k/kernel/ptrace.c           |  5 +++++
 5 files changed, 53 insertions(+)
 create mode 100644 arch/m68k/include/asm/seccomp.h

diff --git a/arch/m68k/Kconfig b/arch/m68k/Kconfig
index 372e4e6..deaea88 100644
--- a/arch/m68k/Kconfig
+++ b/arch/m68k/Kconfig
@@ -19,6 +19,8 @@ config M68K
 	select GENERIC_STRNCPY_FROM_USER if MMU
 	select GENERIC_STRNLEN_USER if MMU
 	select HAVE_AOUT if MMU
+	select HAVE_ARCH_SECCOMP
+	select HAVE_ARCH_SECCOMP_FILTER
 	select HAVE_ASM_MODVERSIONS
 	select HAVE_DEBUG_BUGVERBOSE
 	select HAVE_FUTEX_CMPXCHG if MMU && FUTEX
diff --git a/arch/m68k/include/asm/seccomp.h b/arch/m68k/include/asm/seccomp.h
new file mode 100644
index 0000000..de8a94e
--- /dev/null
+++ b/arch/m68k/include/asm/seccomp.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef _ASM_SECCOMP_H
+#define _ASM_SECCOMP_H
+
+#include <asm-generic/seccomp.h>
+
+#define SECCOMP_ARCH_NATIVE		AUDIT_ARCH_M68K
+#define SECCOMP_ARCH_NATIVE_NR		NR_syscalls
+#define SECCOMP_ARCH_NATIVE_NAME	"m68k"
+
+#endif /* _ASM_SECCOMP_H */
diff --git a/arch/m68k/include/asm/syscall.h b/arch/m68k/include/asm/syscall.h
index 465ac03..87bf69f 100644
--- a/arch/m68k/include/asm/syscall.h
+++ b/arch/m68k/include/asm/syscall.h
@@ -4,6 +4,39 @@
 
 #include <uapi/linux/audit.h>
 
+#include <asm/unistd.h>
+
+extern const unsigned long sys_call_table[];
+
+static inline int syscall_get_nr(struct task_struct *task,
+				 struct pt_regs *regs)
+{
+	return regs->orig_d0;
+}
+
+static inline void syscall_rollback(struct task_struct *task,
+				    struct pt_regs *regs)
+{
+	regs->d0 = regs->orig_d0;
+}
+
+static inline void syscall_set_return_value(struct task_struct *task,
+					    struct pt_regs *regs,
+					    int error, long val)
+{
+	regs->d0 = (long) error ? error : val;
+}
+
+static inline void syscall_get_arguments(struct task_struct *task,
+					 struct pt_regs *regs,
+					 unsigned long *args)
+{
+	args[0] = regs->orig_d0;
+	args++;
+
+	memcpy(args, &regs->d0 + 1, 5 * sizeof(args[0]));
+}
+
 static inline int syscall_get_arch(struct task_struct *task)
 {
 	return AUDIT_ARCH_M68K;
diff --git a/arch/m68k/include/asm/thread_info.h b/arch/m68k/include/asm/thread_info.h
index 15a7570..d813fed 100644
--- a/arch/m68k/include/asm/thread_info.h
+++ b/arch/m68k/include/asm/thread_info.h
@@ -64,6 +64,7 @@ static inline struct thread_info *current_thread_info(void)
 #define TIF_NOTIFY_RESUME	5	/* callback before returning to user */
 #define TIF_SIGPENDING		6	/* signal pending */
 #define TIF_NEED_RESCHED	7	/* rescheduling necessary */
+#define TIF_SECCOMP		13	/* seccomp syscall filtering active */
 #define TIF_DELAYED_TRACE	14	/* single step a syscall */
 #define TIF_SYSCALL_TRACE	15	/* syscall trace active */
 #define TIF_MEMDIE		16	/* is terminating due to OOM killer */
@@ -72,6 +73,7 @@ static inline struct thread_info *current_thread_info(void)
 #define _TIF_NOTIFY_RESUME	(1 << TIF_NOTIFY_RESUME)
 #define _TIF_SIGPENDING		(1 << TIF_SIGPENDING)
 #define _TIF_NEED_RESCHED	(1 << TIF_NEED_RESCHED)
+#define _TIF_SECCOMP		(1 << TIF_SECCOMP)
 #define _TIF_DELAYED_TRACE	(1 << TIF_DELAYED_TRACE)
 #define _TIF_SYSCALL_TRACE	(1 << TIF_SYSCALL_TRACE)
 #define _TIF_MEMDIE		(1 << TIF_MEMDIE)
diff --git a/arch/m68k/kernel/ptrace.c b/arch/m68k/kernel/ptrace.c
index 74d58a8..bc2490c 100644
--- a/arch/m68k/kernel/ptrace.c
+++ b/arch/m68k/kernel/ptrace.c
@@ -19,6 +19,7 @@
 #include <linux/ptrace.h>
 #include <linux/user.h>
 #include <linux/signal.h>
+#include <linux/seccomp.h>
 #include <linux/tracehook.h>
 
 #include <linux/uaccess.h>
@@ -277,6 +278,10 @@ asmlinkage int syscall_trace_enter(void)
 
 	if (test_thread_flag(TIF_SYSCALL_TRACE))
 		ret = tracehook_report_syscall_entry(task_pt_regs(current));
+
+	if (secure_computing() == -1)
+		return -1;
+
 	return ret;
 }
 
-- 
2.7.4

