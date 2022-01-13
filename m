Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 599C3C433F5
	for <linux-m68k@archiver.kernel.org>; Thu, 13 Jan 2022 01:09:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230076AbiAMBJS (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 12 Jan 2022 20:09:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230094AbiAMBJM (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Wed, 12 Jan 2022 20:09:12 -0500
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E27FC061748
        for <linux-m68k@vger.kernel.org>; Wed, 12 Jan 2022 17:09:12 -0800 (PST)
Received: by mail-pj1-x1031.google.com with SMTP id n30-20020a17090a5aa100b001b2b6509685so8391504pji.3
        for <linux-m68k@vger.kernel.org>; Wed, 12 Jan 2022 17:09:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=MxXnOSiYjC7nYM+XAcibdptSqidDfUc2pcFnxGcowLY=;
        b=dyxuOQ5zhcxrQulgPB4GnKGOffNtD6HT08mF6Tm1RT4K1ttC9mSkxSmW9Td7lWmWuI
         lQSr4dwprcVjx3fOdEz8j2ekN6Nv3WpdO/sgLYfKWITyN60AyXbzzeQaEK4TUgcQEium
         aNDicWWh3h2dVe4AMf1uBrRoc+ml5tXZoab+7EiYBq/ydPMpMBb4M3Rp+P4wPrHETXDU
         02eZsziAebCrxoQzN2u6/J1NR4LoMDd935eRqkBPs8H2khzYKaZw/q1az9hfuRtrKkvp
         bUbpV56BxARy+/6OGLiqx12UdIshMcCAfKow6wuCuesTshi7kgFggq54ZjU8ljRAc9n7
         jVNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=MxXnOSiYjC7nYM+XAcibdptSqidDfUc2pcFnxGcowLY=;
        b=JzF3InNlT4ELGWwlkn/tfvB0E+sbjrbTRYAoa7DOuk4Q8YkFe3GMIHiv+u4T7Frze3
         eiU+cCGJjHiYsGa1zNVCk0US6YHTxL5s/A7Si4oNxHkyFPn9WElFfEQeuPyFp3S+gC6Z
         07qjwhFbkIvidqQH3NAOHMJttuxjIQ832aPPTuYIQeIjm92ANlW/nCHLolXYibv4xX7J
         s3RE6hm/HppmdNCP8XfzvMoNWPky8LX78R03/slJVHVVbSLUewN84aqGP6t932rMIySO
         dUijUaFRzULsaVDX6K2fk80EM6QJmk8kY/Bj56q1810dWgXTOU60HjmWy6+J4jrv6aa+
         SW/g==
X-Gm-Message-State: AOAM5330zr7jjMLuMTGVUTuHe3Qb8QtONwpvMw1W8hFOoatZk2zVl9m2
        qM1BVw8wRMwNVDxHiqpzEpE=
X-Google-Smtp-Source: ABdhPJyVBm0rxauV4y3XGslRga4An++din7eU/FqMZTy3EDK38wvNRWDXAleSxlg7Mexhb050z/nNg==
X-Received: by 2002:a63:b20f:: with SMTP id x15mr1968623pge.82.1642036152174;
        Wed, 12 Jan 2022 17:09:12 -0800 (PST)
Received: from xplor.waratah.dyndns.org (222-155-5-102-adsl.sparkbb.co.nz. [222.155.5.102])
        by smtp.gmail.com with ESMTPSA id 10sm761599pfm.56.2022.01.12.17.09.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jan 2022 17:09:10 -0800 (PST)
Received: by xplor.waratah.dyndns.org (Postfix, from userid 1000)
        id 4E749360334; Thu, 13 Jan 2022 14:09:07 +1300 (NZDT)
From:   Michael Schmitz <schmitzmic@gmail.com>
To:     linux-m68k@vger.kernel.org, geert@linux-m68k.org
Cc:     ebiederm@xmission.com, viro@zeniv.linux.org.uk,
        Michael Schmitz <schmitzmic@gmail.com>
Subject: [PATCH v8 3/3] m68k: add kernel seccomp support
Date:   Thu, 13 Jan 2022 14:09:03 +1300
Message-Id: <20220113010903.720-4-schmitzmic@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220113010903.720-1-schmitzmic@gmail.com>
References: <20220113010903.720-1-schmitzmic@gmail.com>
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

--
Changes from v6:

Geert Uytterhoeven:
- add syscall_get_error(), syscall_get_return_value(), and
  syscall_set_arguments() (not needed to compile!)

Changes from v5:

Geert Uytterhoeven:
- correct wrong offset for d1-d5 register copy
- update Documentation/features/seccomp/seccomp-filter/arch-support.txt

add syscall_get_error(), syscall_get_return_value(), syscall_set_arguments()
---
 .../seccomp/seccomp-filter/arch-support.txt   |  2 +-
 arch/m68k/Kconfig                             |  2 +
 arch/m68k/include/asm/seccomp.h               | 11 ++++
 arch/m68k/include/asm/syscall.h               | 56 +++++++++++++++++++
 arch/m68k/include/asm/thread_info.h           |  2 +
 arch/m68k/kernel/ptrace.c                     |  5 ++
 6 files changed, 77 insertions(+), 1 deletion(-)
 create mode 100644 arch/m68k/include/asm/seccomp.h

diff --git a/Documentation/features/seccomp/seccomp-filter/arch-support.txt b/Documentation/features/seccomp/seccomp-filter/arch-support.txt
index 26eec58ab819..be71f2066981 100644
--- a/Documentation/features/seccomp/seccomp-filter/arch-support.txt
+++ b/Documentation/features/seccomp/seccomp-filter/arch-support.txt
@@ -14,7 +14,7 @@
     |       h8300: | TODO |
     |     hexagon: | TODO |
     |        ia64: | TODO |
-    |        m68k: | TODO |
+    |        m68k: |  ok  |
     |  microblaze: | TODO |
     |        mips: |  ok  |
     |       nds32: | TODO |
diff --git a/arch/m68k/Kconfig b/arch/m68k/Kconfig
index 4cae3fbe7f97..8c4f6b3b3ddd 100644
--- a/arch/m68k/Kconfig
+++ b/arch/m68k/Kconfig
@@ -18,6 +18,8 @@ config M68K
 	select GENERIC_IOMAP
 	select GENERIC_IRQ_SHOW
 	select HAVE_AOUT if MMU
+	select HAVE_ARCH_SECCOMP
+	select HAVE_ARCH_SECCOMP_FILTER
 	select HAVE_ASM_MODVERSIONS
 	select HAVE_DEBUG_BUGVERBOSE
 	select HAVE_EFFICIENT_UNALIGNED_ACCESS if !CPU_HAS_NO_UNALIGNED
diff --git a/arch/m68k/include/asm/seccomp.h b/arch/m68k/include/asm/seccomp.h
new file mode 100644
index 000000000000..de8a94e1fb3f
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
index 465ac039be09..2b49ad725655 100644
--- a/arch/m68k/include/asm/syscall.h
+++ b/arch/m68k/include/asm/syscall.h
@@ -4,6 +4,62 @@
 
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
+static inline long syscall_get_error(struct task_struct *task,
+				     struct pt_regs *regs)
+{
+	unsigned long error = regs->d0;
+	return IS_ERR_VALUE(error) ? error : 0;
+}
+
+static inline long syscall_get_return_value(struct task_struct *task,
+					    struct pt_regs *regs)
+{
+	return regs->d0;
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
+	memcpy(args, &regs->d1, 5 * sizeof(args[0]));
+}
+
+static inline void syscall_set_arguments(struct task_struct *task,
+					 struct pt_regs *regs,
+					 unsigned long *args)
+{
+	regs->orig_d0 = args[0];
+	args++;
+
+	memcpy(&regs->d1, args, 5 * sizeof(args[0]));
+}
+
 static inline int syscall_get_arch(struct task_struct *task)
 {
 	return AUDIT_ARCH_M68K;
diff --git a/arch/m68k/include/asm/thread_info.h b/arch/m68k/include/asm/thread_info.h
index c952658ba792..31be2ad999ca 100644
--- a/arch/m68k/include/asm/thread_info.h
+++ b/arch/m68k/include/asm/thread_info.h
@@ -61,6 +61,7 @@ static inline struct thread_info *current_thread_info(void)
 #define TIF_NOTIFY_RESUME	5	/* callback before returning to user */
 #define TIF_SIGPENDING		6	/* signal pending */
 #define TIF_NEED_RESCHED	7	/* rescheduling necessary */
+#define TIF_SECCOMP		13	/* seccomp syscall filtering active */
 #define TIF_DELAYED_TRACE	14	/* single step a syscall */
 #define TIF_SYSCALL_TRACE	15	/* syscall trace active */
 #define TIF_MEMDIE		16	/* is terminating due to OOM killer */
@@ -69,6 +70,7 @@ static inline struct thread_info *current_thread_info(void)
 #define _TIF_NOTIFY_RESUME	(1 << TIF_NOTIFY_RESUME)
 #define _TIF_SIGPENDING		(1 << TIF_SIGPENDING)
 #define _TIF_NEED_RESCHED	(1 << TIF_NEED_RESCHED)
+#define _TIF_SECCOMP		(1 << TIF_SECCOMP)
 #define _TIF_DELAYED_TRACE	(1 << TIF_DELAYED_TRACE)
 #define _TIF_SYSCALL_TRACE	(1 << TIF_SYSCALL_TRACE)
 #define _TIF_MEMDIE		(1 << TIF_MEMDIE)
diff --git a/arch/m68k/kernel/ptrace.c b/arch/m68k/kernel/ptrace.c
index 74d58a82a135..bc2490c3fb52 100644
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
2.17.1

