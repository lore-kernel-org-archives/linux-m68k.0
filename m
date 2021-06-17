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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CE78C49361
	for <linux-m68k@archiver.kernel.org>; Thu, 17 Jun 2021 05:39:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E9726613DF
	for <linux-m68k@archiver.kernel.org>; Thu, 17 Jun 2021 05:39:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229616AbhFQFlh (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 17 Jun 2021 01:41:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229515AbhFQFlh (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Thu, 17 Jun 2021 01:41:37 -0400
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49223C06175F
        for <linux-m68k@vger.kernel.org>; Wed, 16 Jun 2021 22:39:29 -0700 (PDT)
Received: by mail-pg1-x52c.google.com with SMTP id e33so4020244pgm.3
        for <linux-m68k@vger.kernel.org>; Wed, 16 Jun 2021 22:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=EI5rhymHAOvEcgIGBtZdUJ2J9CL6EU4nlQMmpeAtuE0=;
        b=uGKVR3a2M2lRSsAvYEgfoFHGVnZ0TmRAF80/WYBQMM9l4O4QSW1vTNLyMWziklsAq/
         K420gUNtn4krMOBDjpdewqNZH1CGz3mJJb8bNBoI/0cblNWowetMf7NopKHlGShVNXBa
         mN7dWZ9mfV/l4vviWtuhAPIB1iwmXq/lLAr+8p28csgxxzR4UJ1DhxFGkkEfcUQQ0g11
         eXTJmPjNXGOxyDGICPwLwstBnCoQ4gO6g0z9ONflld4OMwFXSGRdYBDzIEYTMl7FA30u
         bBekwJK2LTueWYNgtHq/llR+8NRpAES7qBF2cCKw+/O1ToZ+nwM+dRuY8fLfKMVefyfk
         bekA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=EI5rhymHAOvEcgIGBtZdUJ2J9CL6EU4nlQMmpeAtuE0=;
        b=qTmgoo4VQ/KlHvjoRnlue5z7LcBhbr9O8qSq/QNeRbe10j2xs3z9Nflj5iinB+QHn+
         e/PC8i1KDMINkDn/O4kkflBBd8Q1UEcNGnARdAE502stJYhwJE22gftpytXxnIgYA8ig
         uYrhzYGPINTD2F+jPABmTcKKdArIa3COneWDZvdDKxw70J2vn+dOEhcsFQKvikFWuVyl
         31f208M9bchbfmBDq76hW0zf6A0vyhvJOsFGQaQcvIzfsUPBBEzh/3XmHFnKtiWNXCXT
         6eNUQ92py+wvY9pJV95loPp3uEDGThDqkZtSBuageGpwT5YpU70OGFOtzQs/3ENwChcu
         6+UQ==
X-Gm-Message-State: AOAM532IEqTaGHwqDZv16SqUSU6caEYHwtLenIPKHmMipVs9o3iCwQmw
        M1RNVyeZImxTRfva4d0oHSh9TtoU2XIVbQ==
X-Google-Smtp-Source: ABdhPJw3Vvyj34bXkkGIBDmn+3FQugXyRHdpfKyBlM5MuUa0NHowuwnGeRqLG9nOGi4M6x49EsrBxw==
X-Received: by 2002:a63:e14:: with SMTP id d20mr3419154pgl.35.1623908368906;
        Wed, 16 Jun 2021 22:39:28 -0700 (PDT)
Received: from xplor.waratah.dyndns.org (222-152-189-137-fibre.sparkbb.co.nz. [222.152.189.137])
        by smtp.gmail.com with ESMTPSA id f8sm3592950pfv.73.2021.06.16.22.39.27
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 16 Jun 2021 22:39:28 -0700 (PDT)
Received: by xplor.waratah.dyndns.org (Postfix, from userid 1000)
        id 9A749360410; Thu, 17 Jun 2021 17:39:24 +1200 (NZST)
From:   Michael Schmitz <schmitzmic@gmail.com>
To:     linux-m68k@vger.kernel.org, geert@linux-m68k.org
Cc:     glaubitz@physik.fu-berlin.de, schwab@linux-m68k.org,
        Michael Schmitz <schmitzmic@gmail.com>
Subject: [PATCH v5 2/2] m68k: add kernel seccomp support
Date:   Thu, 17 Jun 2021 17:39:21 +1200
Message-Id: <1623908361-29837-2-git-send-email-schmitzmic@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1623908361-29837-1-git-send-email-schmitzmic@gmail.com>
References: <1623908361-29837-1-git-send-email-schmitzmic@gmail.com>
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

