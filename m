Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8220C67871
	for <linux-m68k@archiver.kernel.org>; Thu, 12 Jan 2023 03:55:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235824AbjALDzm (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 11 Jan 2023 22:55:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236035AbjALDzk (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Wed, 11 Jan 2023 22:55:40 -0500
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14DF048CED
        for <linux-m68k@vger.kernel.org>; Wed, 11 Jan 2023 19:55:39 -0800 (PST)
Received: by mail-pj1-x1032.google.com with SMTP id z4-20020a17090a170400b00226d331390cso19449002pjd.5
        for <linux-m68k@vger.kernel.org>; Wed, 11 Jan 2023 19:55:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Z2nAxnchC25/y0YRdj96h3eq6TMnQ99BtdR5w0TU1b4=;
        b=Tv/AfBJ0XLmhzPiis1md25+W1C2tuToR+TenH6EZ1dedU4seJ3yWr8Q/7s+T4FSeel
         JFtGymgYdgEO8icem0iidi9H9aLlw8JiqF+9lp51ZxAC71RTgxN7wSlufEtBiZ2tZ0Vy
         sGVLePSlM18/G4ti1nOfkd/REUr0OjSCApU37IIWECJB0D4nUH3RGXzqVdyJz4Jwc32g
         XLiPuPUSSi6zWlhmFQPHjc4aM6rm2bkdIEOMa170+ORVrGklFLDJY7fsqmsNo8fCszzR
         o+e8zIwW5xEzGetb6iV9UXMYb0le3FPgz2gh+qUI9x9J1b+FVnis5HeXFF9ZIBnpZsq3
         3SyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z2nAxnchC25/y0YRdj96h3eq6TMnQ99BtdR5w0TU1b4=;
        b=DO6ExOtOucolqAKBgj6uCCJSVnevS1Ao5MYmwz0Or16cr5DOlwbUou5FkpAPdQ3GwF
         F2s8SIwlbimRbgTNDXh5q+WqB3/aL3mqdevQqB0RFFoIz9IeJlBi7erak5eYoy4rcWTI
         HuT4gJIuQHgnwSJjE0BugghOpOL8yQCRg6X59hZHuihIDXjOYS3ZpGWXPv0CczAKe2YX
         sFhlx3KcBXGTexBzbYnj9InJbI6kjf2GV32dD6Wmxr/3LKT7/g+3MuS21po6TycThLn3
         KQXc/CSv7X60a9FLRW0ZPwsHb0cpAmepKxjH/CmvCHzQ/0DGBSHa2uKH+VElrHeGrXn3
         kNaQ==
X-Gm-Message-State: AFqh2ko20fmz6TqxN0wC51D/a0XBNGBS4dboFk1f8vWePYRz5/HRXf9l
        xrW9Ze6ua6Gb7VYfTXQx6rA/inKDCso=
X-Google-Smtp-Source: AMrXdXvCbJMhM8rK3kFFuto/qBfw7mzVKdLlZOu7NIDHKqViEH9Idi24sR95zxTOh7AcbvMZW3VVvA==
X-Received: by 2002:a05:6a20:a59a:b0:9d:efbf:7864 with SMTP id bc26-20020a056a20a59a00b0009defbf7864mr94549506pzb.25.1673495738484;
        Wed, 11 Jan 2023 19:55:38 -0800 (PST)
Received: from xplor.waratah.dyndns.org (222-154-147-142-fibre.sparkbb.co.nz. [222.154.147.142])
        by smtp.gmail.com with ESMTPSA id i1-20020a17090332c100b0018f69009f3esm10890666plr.284.2023.01.11.19.55.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jan 2023 19:55:38 -0800 (PST)
Received: by xplor.waratah.dyndns.org (Postfix, from userid 1000)
        id 2D5E9360319; Thu, 12 Jan 2023 16:55:34 +1300 (NZDT)
From:   Michael Schmitz <schmitzmic@gmail.com>
To:     linux-m68k@vger.kernel.org, geert@linux-m68k.org
Cc:     glaubitz@physik.fu-berlin.de,
        Michael Schmitz <schmitzmic@gmail.com>
Subject: [PATCH v13 2/3] m68k: add kernel seccomp support
Date:   Thu, 12 Jan 2023 16:55:28 +1300
Message-Id: <20230112035529.13521-3-schmitzmic@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230112035529.13521-1-schmitzmic@gmail.com>
References: <20230112035529.13521-1-schmitzmic@gmail.com>
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

seccomp_bpf self test on ARAnyM passes 63 out of 89 tests.

Signed-off-by: Michael Schmitz <schmitzmic@gmail.com>

--
Changes from v10:

- fix merge conflicts

Changes from v9:

- add test for TIF_SECCOMP bit to call syscall_trace_enter()
  if seccomp syscall filtering is active

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
 arch/m68k/kernel/entry.S                      |  3 +
 arch/m68k/kernel/ptrace.c                     |  6 +-
 7 files changed, 80 insertions(+), 2 deletions(-)
 create mode 100644 arch/m68k/include/asm/seccomp.h

diff --git a/Documentation/features/seccomp/seccomp-filter/arch-support.txt b/Documentation/features/seccomp/seccomp-filter/arch-support.txt
index dc71bf7b1a7e..3a7237b989cd 100644
--- a/Documentation/features/seccomp/seccomp-filter/arch-support.txt
+++ b/Documentation/features/seccomp/seccomp-filter/arch-support.txt
@@ -14,7 +14,7 @@
     |     hexagon: | TODO |
     |        ia64: | TODO |
     |   loongarch: |  ok  |
-    |        m68k: | TODO |
+    |        m68k: |  ok  |
     |  microblaze: | TODO |
     |        mips: |  ok  |
     |       nios2: | TODO |
diff --git a/arch/m68k/Kconfig b/arch/m68k/Kconfig
index 7bff88118507..82154952e574 100644
--- a/arch/m68k/Kconfig
+++ b/arch/m68k/Kconfig
@@ -18,6 +18,8 @@ config M68K
 	select GENERIC_CPU_DEVICES
 	select GENERIC_IOMAP
 	select GENERIC_IRQ_SHOW
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
diff --git a/arch/m68k/kernel/entry.S b/arch/m68k/kernel/entry.S
index 42879e6eb651..4dd2fd7acba9 100644
--- a/arch/m68k/kernel/entry.S
+++ b/arch/m68k/kernel/entry.S
@@ -214,6 +214,9 @@ ENTRY(system_call)
 	| syscall trace?
 	tstb	%a1@(TINFO_FLAGS+2)
 	jmi	do_trace_entry
+	| seccomp filter active?
+	btst	#5,%a1@(TINFO_FLAGS+2)
+	bnes	do_trace_entry
 	cmpl	#NR_syscalls,%d0
 	jcc	badsys
 syscall:
diff --git a/arch/m68k/kernel/ptrace.c b/arch/m68k/kernel/ptrace.c
index 0a4184a37461..cd0172d29430 100644
--- a/arch/m68k/kernel/ptrace.c
+++ b/arch/m68k/kernel/ptrace.c
@@ -21,7 +21,7 @@
 #include <linux/signal.h>
 #include <linux/regset.h>
 #include <linux/elf.h>
-
+#include <linux/seccomp.h>
 #include <linux/uaccess.h>
 #include <asm/page.h>
 #include <asm/processor.h>
@@ -278,6 +278,10 @@ asmlinkage int syscall_trace_enter(void)
 
 	if (test_thread_flag(TIF_SYSCALL_TRACE))
 		ret = ptrace_report_syscall_entry(task_pt_regs(current));
+
+	if (secure_computing() == -1)
+		return -1;
+
 	return ret;
 }
 
-- 
2.17.1

