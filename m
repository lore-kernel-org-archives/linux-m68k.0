Return-Path: <SRS0=i6Xs=CE=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39FAAC433DF
	for <linux-m68k@archiver.kernel.org>; Wed, 26 Aug 2020 14:22:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 16D97221E2
	for <linux-m68k@archiver.kernel.org>; Wed, 26 Aug 2020 14:22:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728060AbgHZOWV (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 26 Aug 2020 10:22:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728053AbgHZOWU (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Wed, 26 Aug 2020 10:22:20 -0400
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EADDC061574
        for <linux-m68k@vger.kernel.org>; Wed, 26 Aug 2020 07:22:19 -0700 (PDT)
Received: from ramsan ([84.195.186.194])
        by baptiste.telenet-ops.be with bizsmtp
        id LENG2300j4C55Sk01ENHpL; Wed, 26 Aug 2020 16:22:17 +0200
Received: from geert (helo=localhost)
        by ramsan with local-esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1kAwJc-0000ts-SE; Wed, 26 Aug 2020 16:22:16 +0200
Date:   Wed, 26 Aug 2020 16:22:16 +0200 (CEST)
From:   Geert Uytterhoeven <geert@linux-m68k.org>
To:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
cc:     Michael Schmitz <schmitzmic@gmail.com>,
        Linux/m68k <linux-m68k@vger.kernel.org>,
        Andreas Schwab <schwab@linux-m68k.org>,
        Michael Karcher <kernel@mkarcher.dialup.fu-berlin.de>
Subject: Re: [PATCH] m68k/kernel - wire up syscall_trace_enter/leave for
 m68k
In-Reply-To: <266db1b5-c470-4f94-264a-577673dd902f@physik.fu-berlin.de>
Message-ID: <alpine.DEB.2.21.2008261612360.2926@ramsan.of.borg>
References: <f0c9edc0-e596-c483-b9a6-f67778bd297c@physik.fu-berlin.de> <1595823555-11103-1-git-send-email-schmitzmic@gmail.com> <CAMuHMdVNqgG_6LSSuzMZekE1q7i_V4YisDJQUsjptLDejNGaRw@mail.gmail.com> <01c270ec-cd73-1d7e-0d1a-4ccde66e9d1b@physik.fu-berlin.de>
 <alpine.DEB.2.21.2008261430460.30022@ramsan.of.borg> <db3aaa13-1cc5-232d-102a-ef89a3304065@physik.fu-berlin.de> <CAMuHMdVH6OtTMzM7jbhnwvhUtag217PTYghLwd3iVAchXEn2xw@mail.gmail.com> <266db1b5-c470-4f94-264a-577673dd902f@physik.fu-berlin.de>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

 	Hi Adrian,

On Wed, 26 Aug 2020, John Paul Adrian Glaubitz wrote:
> On 8/26/20 2:38 PM, Geert Uytterhoeven wrote:
>>> That part is outdated. It was removed in the second commit I posted, see:
>>>
>>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/arch/sh?id=0bb605c2c7f2b4b314b91510810b226de7f34fa1
>>
>> That's the part which adds seccomp filter support.
>>
>>> Do you have the check of the return value already in syscall_trace_entry?
>>>
>>> It should check for "-1" and jump to syscall_exit if true.
>>
>> No, as that's needed only for seccomp filter support, AFAIU.
>>
>> Have a look at arm, where seccomp filter support is optional, depending on ABI.
>
> As far as I know, filter support is mandatory these days. At least for SH, libseccomp
> sent me away with my PR and told me to come back until the kernel has filter support.

OK.

> Maybe I'm missing something but let's put Michael Karcher in the loop, he knows better
> as he helped me with the kernel parts of SECCOMP on SH.

More work on top of the previous patch. It starts to look better:

    -FAILED: 13 / 86 tests passed.
    +FAILED: 35 / 86 tests passed.

But there are still fishy failures.  Most popular one is:

     Test exited normally instead of by signal (code: 0)

And things like:

     Expected 0 (0) == syscall(__NR_getpid) (705)
     Expected 0 (-270272472) == ptrace(PTRACE_GETREGS, tracee, 0, &regs) (0)



From 1ae515061575024081af930f4e5f9283910648de Mon Sep 17 00:00:00 2001
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 26 Aug 2020 16:11:35 +0200
Subject: [PATCH] [WIP] seccomp filter support

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
  arch/m68k/68000/entry.S         |  2 ++
  arch/m68k/Kconfig               |  1 +
  arch/m68k/coldfire/entry.S      |  2 ++
  arch/m68k/include/asm/syscall.h | 41 +++++++++++++++++++++++++++++++++
  arch/m68k/kernel/ptrace.c       |  3 ++-
  5 files changed, 48 insertions(+), 1 deletion(-)

diff --git a/arch/m68k/68000/entry.S b/arch/m68k/68000/entry.S
index 259b3661b614168f..3526970e3c10535f 100644
--- a/arch/m68k/68000/entry.S
+++ b/arch/m68k/68000/entry.S
@@ -47,6 +47,8 @@ do_trace:
  	jbsr	syscall_trace_enter
  	RESTORE_SWITCH_STACK
  	addql	#4,%sp
+	tstl	%d0
+	jne	ret_from_exception
  	movel	%sp@(PT_OFF_ORIG_D0),%d1
  	movel	#-ENOSYS,%d0
  	cmpl	#NR_syscalls,%d1
diff --git a/arch/m68k/Kconfig b/arch/m68k/Kconfig
index 29ab228a9a721939..2166c9d84794a969 100644
--- a/arch/m68k/Kconfig
+++ b/arch/m68k/Kconfig
@@ -19,6 +19,7 @@ config M68K
  	select GENERIC_STRNCPY_FROM_USER if MMU
  	select GENERIC_STRNLEN_USER if MMU
  	select HAVE_AOUT if MMU
+	select HAVE_ARCH_SECCOMP_FILTER
  	select HAVE_ASM_MODVERSIONS
  	select HAVE_DEBUG_BUGVERBOSE
  	select HAVE_FUTEX_CMPXCHG if MMU && FUTEX
diff --git a/arch/m68k/coldfire/entry.S b/arch/m68k/coldfire/entry.S
index d43a02795a4a445e..13bf787968273165 100644
--- a/arch/m68k/coldfire/entry.S
+++ b/arch/m68k/coldfire/entry.S
@@ -92,6 +92,8 @@ ENTRY(system_call)
  	jbsr	syscall_trace_enter
  	RESTORE_SWITCH_STACK
  	addql	#4,%sp
+	tstl	%d0
+	jne	ret_from_exception
  	movel	%d3,%a0
  	jbsr	%a0@
  	movel	%d0,%sp@(PT_OFF_D0)		/* save the return value */
diff --git a/arch/m68k/include/asm/syscall.h b/arch/m68k/include/asm/syscall.h
index 465ac039be09a1b8..ac0f5d997be63b07 100644
--- a/arch/m68k/include/asm/syscall.h
+++ b/arch/m68k/include/asm/syscall.h
@@ -4,6 +4,47 @@

  #include <uapi/linux/audit.h>

+static inline long syscall_get_nr(struct task_struct *tsk,
+				  struct pt_regs *regs)
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
+	regs->d0 = error ?: val;
+}
+
+static inline void syscall_get_arguments(struct task_struct *tsk,
+					 struct pt_regs *regs,
+					 unsigned long *args)
+{
+	memcpy(args, &regs->d1, 6 * sizeof(args[0]));
+}
+
+static inline void syscall_set_arguments(struct task_struct *task,
+					 struct pt_regs *regs,
+					 unsigned int i, unsigned int n,
+					 const unsigned long *args)
+{
+	BUG_ON(i + n > 6);
+	memcpy(&regs->d1 + i, args, n * sizeof(args[0]));
+}
+
  static inline int syscall_get_arch(struct task_struct *task)
  {
  	return AUDIT_ARCH_M68K;
diff --git a/arch/m68k/kernel/ptrace.c b/arch/m68k/kernel/ptrace.c
index ec5653b85dcdb4f9..a3a0a230dcdfc953 100644
--- a/arch/m68k/kernel/ptrace.c
+++ b/arch/m68k/kernel/ptrace.c
@@ -279,7 +279,8 @@ asmlinkage int syscall_trace_enter(void)
  	if (test_thread_flag(TIF_SYSCALL_TRACE))
  		ret = tracehook_report_syscall_entry(task_pt_regs(current));

-	secure_computing_strict(task_pt_regs(current)->orig_d0);
+	if (secure_computing())
+		return -1;

  	return ret;
  }
-- 
2.17.1



Gr{oetje,eeting}s,

 						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
 							    -- Linus Torvalds
