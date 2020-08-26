Return-Path: <SRS0=i6Xs=CE=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 228C6C433E1
	for <linux-m68k@archiver.kernel.org>; Wed, 26 Aug 2020 12:32:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 05FD720707
	for <linux-m68k@archiver.kernel.org>; Wed, 26 Aug 2020 12:32:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729522AbgHZMcT (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 26 Aug 2020 08:32:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729308AbgHZMcO (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Wed, 26 Aug 2020 08:32:14 -0400
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88871C061574
        for <linux-m68k@vger.kernel.org>; Wed, 26 Aug 2020 05:32:14 -0700 (PDT)
Received: from ramsan ([84.195.186.194])
        by michel.telenet-ops.be with bizsmtp
        id LCYC2300L4C55Sk06CYCvM; Wed, 26 Aug 2020 14:32:13 +0200
Received: from geert (helo=localhost)
        by ramsan with local-esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1kAub6-0007oi-Mw; Wed, 26 Aug 2020 14:32:12 +0200
Date:   Wed, 26 Aug 2020 14:32:12 +0200 (CEST)
From:   Geert Uytterhoeven <geert@linux-m68k.org>
To:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Michael Schmitz <schmitzmic@gmail.com>,
        Linux/m68k <linux-m68k@vger.kernel.org>,
        Andreas Schwab <schwab@linux-m68k.org>
Subject: Re: [PATCH] m68k/kernel - wire up syscall_trace_enter/leave for
 m68k
In-Reply-To: <01c270ec-cd73-1d7e-0d1a-4ccde66e9d1b@physik.fu-berlin.de>
Message-ID: <alpine.DEB.2.21.2008261430460.30022@ramsan.of.borg>
References: <f0c9edc0-e596-c483-b9a6-f67778bd297c@physik.fu-berlin.de> <1595823555-11103-1-git-send-email-schmitzmic@gmail.com> <CAMuHMdVNqgG_6LSSuzMZekE1q7i_V4YisDJQUsjptLDejNGaRw@mail.gmail.com> <01c270ec-cd73-1d7e-0d1a-4ccde66e9d1b@physik.fu-berlin.de>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

 	Hi Adrian,

On Wed, 26 Aug 2020, John Paul Adrian Glaubitz wrote:
> On 8/26/20 1:23 PM, Geert Uytterhoeven wrote:
>>> Changes from RFC v1:
>>>
>>> - add return code check in do_trace_entry branch to enable syscall
>>>   filtering (will return -EPERM)
>>> - change to use testl for return code check (suggested by Andreas Schwab)
>>>
>>> Changes from RFC v2:
>>>
>>> - don't set return code of filtered syscall - seccomp may want to set
>>>   that for use by calling process.
>>
>> As your email subject didn't contain "v3", b4[*] insists on picking up
>> RFC v2, and refuses to pick up the latest version, even when forced
>> (msgid not present)...
>>
>> The patch itself looks good to me. Does it make sense to apply it before
>> we have real seccomp support?
>
> Adding SECCOMP support itself doesn't take much:
>
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/arch/sh?id=c4637d475170ca0d99973efd07df727012db6cd1
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/arch/sh?id=0bb605c2c7f2b4b314b91510810b226de7f34fa1
>
> Once syscall_trace_entry/leave have been made available, we just need to
> add some Kconfig bits and the part which checks the return code of
> syscall_trace_enter.
>
> The rest is done by arch-agnostic code.

I came up with the following (basic seccomp, no seccomp filter), but
the seccomp_bpf selftest still fails all over the place...

From 231c23d07200cdd338dcf8d2adae8322ecef18f4 Mon Sep 17 00:00:00 2001
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 26 Aug 2020 14:24:58 +0200
Subject: [PATCH] [WIP] seccomp support

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
  arch/m68k/Kconfig                   | 14 ++++++++++++++
  arch/m68k/include/asm/Kbuild        |  1 +
  arch/m68k/include/asm/thread_info.h |  2 ++
  arch/m68k/kernel/ptrace.c           |  4 ++++
  4 files changed, 21 insertions(+)

diff --git a/arch/m68k/Kconfig b/arch/m68k/Kconfig
index 93bbb74ea876d6f2..29ab228a9a721939 100644
--- a/arch/m68k/Kconfig
+++ b/arch/m68k/Kconfig
@@ -127,6 +127,20 @@ endmenu

  menu "Kernel Features"

+config SECCOMP
+	bool
+	prompt "Enable seccomp to safely compute untrusted bytecode"
+	help
+	  This kernel feature is useful for number crunching applications
+	  that may need to compute untrusted bytecode during their
+	  execution. By using pipes or other transports made available to
+	  the process as file descriptors supporting the read/write
+	  syscalls, it's possible to isolate those applications in
+	  their own address space using seccomp. Once seccomp is
+	  enabled via prctl(PR_SET_SECCOMP), it cannot be disabled
+	  and the task is only allowed to execute a few safe syscalls
+	  defined by each seccomp mode.
+
  endmenu

  if !MMU
diff --git a/arch/m68k/include/asm/Kbuild b/arch/m68k/include/asm/Kbuild
index 1bff55aa2d54e2ce..d9f0f283707ff352 100644
--- a/arch/m68k/include/asm/Kbuild
+++ b/arch/m68k/include/asm/Kbuild
@@ -4,4 +4,5 @@ generic-y += extable.h
  generic-y += kvm_para.h
  generic-y += local64.h
  generic-y += mcs_spinlock.h
+generic-y += seccomp.h
  generic-y += spinlock.h
diff --git a/arch/m68k/include/asm/thread_info.h b/arch/m68k/include/asm/thread_info.h
index 3689c6718c883d23..388c5c0f2cc905c4 100644
--- a/arch/m68k/include/asm/thread_info.h
+++ b/arch/m68k/include/asm/thread_info.h
@@ -63,6 +63,7 @@ static inline struct thread_info *current_thread_info(void)
  #define TIF_NOTIFY_RESUME	5	/* callback before returning to user */
  #define TIF_SIGPENDING		6	/* signal pending */
  #define TIF_NEED_RESCHED	7	/* rescheduling necessary */
+#define TIF_SECCOMP		8	/* secure computing */
  #define TIF_DELAYED_TRACE	14	/* single step a syscall */
  #define TIF_SYSCALL_TRACE	15	/* syscall trace active */
  #define TIF_MEMDIE		16	/* is terminating due to OOM killer */
@@ -71,6 +72,7 @@ static inline struct thread_info *current_thread_info(void)
  #define _TIF_NOTIFY_RESUME	(1 << TIF_NOTIFY_RESUME)
  #define _TIF_SIGPENDING		(1 << TIF_SIGPENDING)
  #define _TIF_NEED_RESCHED	(1 << TIF_NEED_RESCHED)
+#define _TIF_SECCOMP		(1 << TIF_SECCOMP)
  #define _TIF_DELAYED_TRACE	(1 << TIF_DELAYED_TRACE)
  #define _TIF_SYSCALL_TRACE	(1 << TIF_SYSCALL_TRACE)
  #define _TIF_MEMDIE		(1 << TIF_MEMDIE)
diff --git a/arch/m68k/kernel/ptrace.c b/arch/m68k/kernel/ptrace.c
index 74d58a82a1353180..ec5653b85dcdb4f9 100644
--- a/arch/m68k/kernel/ptrace.c
+++ b/arch/m68k/kernel/ptrace.c
@@ -20,6 +20,7 @@
  #include <linux/user.h>
  #include <linux/signal.h>
  #include <linux/tracehook.h>
+#include <linux/seccomp.h>

  #include <linux/uaccess.h>
  #include <asm/page.h>
@@ -277,6 +278,9 @@ asmlinkage int syscall_trace_enter(void)

  	if (test_thread_flag(TIF_SYSCALL_TRACE))
  		ret = tracehook_report_syscall_entry(task_pt_regs(current));
+
+	secure_computing_strict(task_pt_regs(current)->orig_d0);
+
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
