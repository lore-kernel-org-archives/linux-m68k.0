Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5058C54EBD
	for <linux-m68k@archiver.kernel.org>; Tue, 10 Jan 2023 03:06:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235332AbjAJDGJ (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 9 Jan 2023 22:06:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230453AbjAJDF5 (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Mon, 9 Jan 2023 22:05:57 -0500
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87C492ADF
        for <linux-m68k@vger.kernel.org>; Mon,  9 Jan 2023 19:05:54 -0800 (PST)
Received: by mail-pj1-x1032.google.com with SMTP id v23so10863980pju.3
        for <linux-m68k@vger.kernel.org>; Mon, 09 Jan 2023 19:05:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OWMyzpH/LMq5ZA0dYZmYOa9iGQH1RIJ2wWaPCrNc0Bo=;
        b=SOVBCptCfazZa0DeMaiKjjQG0+Dtuwiju3LgYfzdgVfDTSLwn+H7we4lABzPgw5RKW
         Venn8U659E85CzPf2xfqOj4X33H864f7bJm5t8e5wJi6DDKQq3+m+mih8MLrzDLygrri
         ZiCxssoGTVKtgLPSD1QvFwHRd13XTl9RCr1DBD9io803+ODl05s1dUjwjam7cobkR+Ko
         LJcsUnoswo78JRcdJ4ZEIQyO9QMyjZaOhhWDIzwMjqU/o2te6JiK6U1t8E28rlhO9t5G
         UWjCJyQl7b2IXMZf0QZR16VLxOLcwhl06rjrgY686ivSKH69rPwCac+30NC8ygUvGuzR
         u9Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OWMyzpH/LMq5ZA0dYZmYOa9iGQH1RIJ2wWaPCrNc0Bo=;
        b=V4Rg/ViFNnI3nMBenEts1Xbn/oqt4et1quyCvRBTbJ1ORJS2d8qCmsWylEiSzl1kb5
         7SQupwMWopTJ3fzUCnT8TnvwTjL/sD80Gm+3SszEHVKFU3R2uJTgdwHSaQvp+UcXd/Vf
         nofJscUF4Z7MjEV5L4mHB1Tuv9USXLxcKYsR8uCjgAay0HgRhDOo95JXzBfOWKKyGJHe
         qQ6DBUC0DndBgapW7rDMtLe8nfvRA+NY9QzmyB5d1RpL3TINZcAe1tIbP1nwj32Hcc8q
         EXecfxwAe4i/0MMl+ce74bsQ2Y2+tKTKwXZ0KHMwYmXUetLBdYG1ZTZJPhEPEUn2eMCN
         Dnxg==
X-Gm-Message-State: AFqh2kryi3ulNv/LoLi3pwtWi3Rt1MKqMqwZUsCa30nm3THZXp4z0V+F
        SpUkrE8WrOM82WwXKl8/Kr8=
X-Google-Smtp-Source: AMrXdXth2Wl+yL59xr0kssHCg6dobysaTuywspx3B9nhFkG0z7nGiOWrPIGUCkbBcTKOqg43Oz9Tig==
X-Received: by 2002:a17:90a:664a:b0:223:ff2e:ca5c with SMTP id f10-20020a17090a664a00b00223ff2eca5cmr68578916pjm.42.1673319954031;
        Mon, 09 Jan 2023 19:05:54 -0800 (PST)
Received: from xplor.waratah.dyndns.org (222-154-147-142-fibre.sparkbb.co.nz. [222.154.147.142])
        by smtp.gmail.com with ESMTPSA id r2-20020a17090a0ac200b002139459e121sm3283237pje.27.2023.01.09.19.05.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jan 2023 19:05:53 -0800 (PST)
Received: by xplor.waratah.dyndns.org (Postfix, from userid 1000)
        id D5AA3360316; Tue, 10 Jan 2023 16:05:49 +1300 (NZDT)
From:   Michael Schmitz <schmitzmic@gmail.com>
To:     linux-m68k@vger.kernel.org, geert@linux-m68k.org
Cc:     glaubitz@physik.fu-berlin.de,
        Michael Schmitz <schmitzmic@gmail.com>
Subject: [PATCH RESEND v11 1/3] m68k/kernel - check syscall_trace_enter() return code on m68k
Date:   Tue, 10 Jan 2023 16:05:45 +1300
Message-Id: <20230110030546.21688-3-schmitzmic@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230110030546.21688-1-schmitzmic@gmail.com>
References: <20230110030546.21688-1-schmitzmic@gmail.com>
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

From: Michael Schmitz <schmitzmic@gmail.com>
Date: Wed, 16 Jun 2021 10:08:59 +1200
Subject: [PATCH RESEND v11 2/3] m68k: add kernel seccomp support

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
index 0d5b7085d76f..ee0a905b5f74 100644
--- a/arch/m68k/kernel/entry.S
+++ b/arch/m68k/kernel/entry.S
@@ -213,6 +213,9 @@ ENTRY(system_call)
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

