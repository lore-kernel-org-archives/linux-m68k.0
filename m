Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7BBBC63797
	for <linux-m68k@archiver.kernel.org>; Tue, 10 Jan 2023 00:45:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231311AbjAJApY (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 9 Jan 2023 19:45:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234517AbjAJApU (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Mon, 9 Jan 2023 19:45:20 -0500
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D79511159
        for <linux-m68k@vger.kernel.org>; Mon,  9 Jan 2023 16:45:19 -0800 (PST)
Received: by mail-pl1-x636.google.com with SMTP id b17so3979218pld.7
        for <linux-m68k@vger.kernel.org>; Mon, 09 Jan 2023 16:45:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OsWUp/0ChB004MPj1lCufkRf2denQvoZOhQFLkQxNPo=;
        b=OgV3A41mzOnpwCTWacWIgC5qEWKPCdohPJRN9djm2iIfj8p20Z4lkb5aGhxyOAigpk
         zxwhI2fTjCrUN82rv+GcxsHSvsaaE7tyOiJPJrF8cj9VceH6onKJIGppfpUk/RiCX7k5
         810whEICvJJAHeFIxIUWsS7oHFDpm1lMfa9u5IfO+X2ViDFiRXF7zFIZJGzeJg8f+HAX
         VyQ3YEKwedF46c5IEqSckHVlFeuPsmJjD8QqghIqDWe3Kb6Bcq7VxPCPWqlngEo3uJKW
         lOzQwxAS197SnrY+9NgmiyQO9TALdJNFTc1Eo1AlA6Ga02HpD3B5PpSbQjNsCRNGAooy
         dO8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OsWUp/0ChB004MPj1lCufkRf2denQvoZOhQFLkQxNPo=;
        b=dXRUaV8cPWi7Q94bAtYdadQ+nGmYDMmISq+gamWktsYx43JiwzyEFFrArc4DyX3dj5
         pkowxGelFwpUm/pr1+HkzVkRAnXEMujD6gG/NZx0LMXXiD5B/QFLwHqIkp8WHW8ovqdn
         57s4Cqim4BOQkniWD9+oTaGHOdrvYQJ20gT1cQhGp6juDhrH+DJSYQ2deg8vAa6uEieq
         PIwnl7La90N6SHvKruvftUCeCXjqIamdo/oQ2z88CMdud/YOTnQO0YcFpRuPOH8A7xAg
         Db9kF+M/vWn9hlaKiJjKd0RkcwIiyjku/BzvZi5vCZOFbmqklmu+I16MHmKvzN13dBHy
         ZBHg==
X-Gm-Message-State: AFqh2kp7df8LRfE0SegxWC6JRyGAIalL+vd3IMU+2EvPIhjriJUfQrON
        lLLMGA7MT/YQf6FwMMFty2jd2BQuY7s=
X-Google-Smtp-Source: AMrXdXsMv2eTi1SS5h8EPWMtXZc8wQ/kMQGSNaEJGrDfMOKvapdXq47/hY8qVDxUlmsBZovvH5OaCA==
X-Received: by 2002:a17:902:7e8f:b0:192:ef83:7976 with SMTP id z15-20020a1709027e8f00b00192ef837976mr19957854pla.46.1673311518791;
        Mon, 09 Jan 2023 16:45:18 -0800 (PST)
Received: from xplor.waratah.dyndns.org (222-154-147-142-fibre.sparkbb.co.nz. [222.154.147.142])
        by smtp.gmail.com with ESMTPSA id n6-20020a170903110600b00192d9258532sm6700873plh.150.2023.01.09.16.45.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jan 2023 16:45:18 -0800 (PST)
Received: by xplor.waratah.dyndns.org (Postfix, from userid 1000)
        id 9C1D9360316; Tue, 10 Jan 2023 13:45:14 +1300 (NZDT)
From:   Michael Schmitz <schmitzmic@gmail.com>
To:     linux-m68k@vger.kernel.org, geert@linux-m68k.org
Cc:     glaubitz@physik.fu-berlin.de,
        Michael Schmitz <schmitzmic@gmail.com>
Subject: [PATCH v11 2/3] m68k: add kernel seccomp support
Date:   Tue, 10 Jan 2023 13:45:03 +1300
Message-Id: <20230110004504.20292-3-schmitzmic@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230110004504.20292-1-schmitzmic@gmail.com>
References: <20230110004504.20292-1-schmitzmic@gmail.com>
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
 .../seccomp/seccomp-filter/arch-support.txt   |  4 ++
 arch/m68k/Kconfig                             |  2 +
 arch/m68k/include/asm/seccomp.h               | 11 ++++
 arch/m68k/include/asm/syscall.h               | 56 +++++++++++++++++++
 arch/m68k/include/asm/thread_info.h           |  2 +
 arch/m68k/kernel/entry.S                      |  3 +
 arch/m68k/kernel/ptrace.c                     |  6 +-
 7 files changed, 83 insertions(+), 1 deletion(-)
 create mode 100644 arch/m68k/include/asm/seccomp.h

diff --git a/Documentation/features/seccomp/seccomp-filter/arch-support.txt b/Documentation/features/seccomp/seccomp-filter/arch-support.txt
index dc71bf7b1a7e..0c2ac424094d 100644
--- a/Documentation/features/seccomp/seccomp-filter/arch-support.txt
+++ b/Documentation/features/seccomp/seccomp-filter/arch-support.txt
@@ -13,8 +13,12 @@
     |        csky: |  ok  |
     |     hexagon: | TODO |
     |        ia64: | TODO |
+<<<<<<< HEAD
     |   loongarch: |  ok  |
     |        m68k: | TODO |
+=======
+    |        m68k: |  ok  |
+>>>>>>> 596095b777b9... m68k: add kernel seccomp support
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

