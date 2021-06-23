Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5821BC49EB7
	for <linux-m68k@archiver.kernel.org>; Wed, 23 Jun 2021 07:36:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3B9D56128A
	for <linux-m68k@archiver.kernel.org>; Wed, 23 Jun 2021 07:36:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230445AbhFWHig (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 23 Jun 2021 03:38:36 -0400
Received: from mail-vs1-f51.google.com ([209.85.217.51]:45009 "EHLO
        mail-vs1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230291AbhFWHi2 (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Wed, 23 Jun 2021 03:38:28 -0400
Received: by mail-vs1-f51.google.com with SMTP id x13so916521vsf.11
        for <linux-m68k@vger.kernel.org>; Wed, 23 Jun 2021 00:36:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RGL9cZ/xRW33i2pkrE+M4n8gHG+C6+BJc/vskHA4hac=;
        b=XEWn1tYE5ac8/1t5ItC6Tic5uIsOSD+oV8r909G1CktHm/PNq+jQMj/ozK9H+4n8s4
         3sWrYZGgIgJbOBuA2q9ip6IIkkuHuqFeh/fK63s2RHsjNiRpi0ksv0gkfgABzQvsHEGG
         0UZ10snTrVZkGUdE1cFcuwxPlHIOPFjO923jO0XJ5aXGGxnDF83tsfAPZYUTk6z562Mh
         ojA235oGuj8dlK5QlTihQ2lZA0OwdfcPQL9vOGRLt0NDt8Xkcn9ZT5ewtI4P4GKeYaXl
         hcSRV1ZmcwpnXp8KAoD4uP1gRRhtv7lYD2vCm4jjQIgQ6zTNUtsSekNqVEfARFk6MJlb
         qQ/g==
X-Gm-Message-State: AOAM533Q6qhj4EPAVr3mRkKaPAg3jmZbxruYLfcisz11x0awg8viGJGr
        ZWentkTHBHfE9aVjBgqeKVuA/yKAs9xtwcY4vNY=
X-Google-Smtp-Source: ABdhPJxkkCdVxxCVpcKiOcJr1dRuBs+gAufgtX2HEZdX2lmTj7qk2zbLkYRSHPu8cXsi5jpdPhzHsjn4I2C4LqQkAJs=
X-Received: by 2002:a67:ba0c:: with SMTP id l12mr123312vsn.40.1624433770128;
 Wed, 23 Jun 2021 00:36:10 -0700 (PDT)
MIME-Version: 1.0
References: <1623908361-29837-1-git-send-email-schmitzmic@gmail.com> <1623908361-29837-2-git-send-email-schmitzmic@gmail.com>
In-Reply-To: <1623908361-29837-2-git-send-email-schmitzmic@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 23 Jun 2021 09:35:59 +0200
Message-ID: <CAMuHMdX-JBTAWDvFQg7nVGwwxu8o6sX1GYVF0ha6JpZxOxuG8g@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] m68k: add kernel seccomp support
To:     Michael Schmitz <schmitzmic@gmail.com>
Cc:     "Linux/m68k" <linux-m68k@vger.kernel.org>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        Andreas Schwab <schwab@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Michael,

On Thu, Jun 17, 2021 at 7:39 AM Michael Schmitz <schmitzmic@gmail.com> wrote:
> Add secure_computing() call to syscall_trace_enter to actually
> filter system calls.
>
> Add necessary arch Kconfig options, define TIF_SECCOMP trace
> flag and provide basic seccomp filter support in asm/syscall.h
>
> syscall_get_nr currently uses the syscall nr stored in orig_d0
> because we change d0 to a default return code before starting a
> syscall trace. This may be inconsistent with syscall_rollback
> copying orig_d0 to d0 (which we never check upon return from
> trace). We use d0 for the return code from syscall_trace_enter
> in entry.S currently, and could perhaps expand that to store
> a new syscall number returned by the seccomp filter before
> executing the syscall. This clearly needs some discussion.
>
> Compiles (for Atari) and boots on ARAnyM, otherwise untested.
>
> Signed-off-by: Michael Schmitz <schmitzmic@gmail.com>
> ---
>  arch/m68k/Kconfig                   |  2 ++
>  arch/m68k/include/asm/seccomp.h     | 11 +++++++++++
>  arch/m68k/include/asm/syscall.h     | 33 +++++++++++++++++++++++++++++++++
>  arch/m68k/include/asm/thread_info.h |  2 ++
>  arch/m68k/kernel/ptrace.c           |  5 +++++
>  5 files changed, 53 insertions(+)
>  create mode 100644 arch/m68k/include/asm/seccomp.h
>
> diff --git a/arch/m68k/Kconfig b/arch/m68k/Kconfig
> index 372e4e6..deaea88 100644
> --- a/arch/m68k/Kconfig
> +++ b/arch/m68k/Kconfig
> @@ -19,6 +19,8 @@ config M68K
>         select GENERIC_STRNCPY_FROM_USER if MMU
>         select GENERIC_STRNLEN_USER if MMU
>         select HAVE_AOUT if MMU
> +       select HAVE_ARCH_SECCOMP
> +       select HAVE_ARCH_SECCOMP_FILTER

So the status should be changed from "TODO" to "ok" in
Documentation/features/seccomp/seccomp-filter/arch-support.txt

BTW, there was also "[PATCH] [WIP] selftests/seccomp: Add m68k support"
https://lore.kernel.org/linux-m68k/alpine.DEB.2.21.2008261315050.25325@ramsan.of.borg/

I kept on up-porting it, but haven't exercised it recently.
Recent version looks like (gmail-whitespace-damaged):

--- a/tools/testing/selftests/seccomp/seccomp_bpf.c
+++ b/tools/testing/selftests/seccomp/seccomp_bpf.c
@@ -135,6 +135,8 @@ struct seccomp_data {
 #  define __NR_seccomp 337
 # elif defined(__sh__)
 #  define __NR_seccomp 372
+# elif defined(__mc68000__)
+#  define __NR_seccomp 380
 # else
 #  warning "seccomp syscall number unknown for this architecture"
 #  define __NR_seccomp 0xffff
@@ -1815,6 +1817,10 @@ TEST_F(TRACE_poke, getpid_runs_normally)
 # define ARCH_REGS             struct pt_regs
 # define SYSCALL_NUM(_regs)    (_regs).regs[3]
 # define SYSCALL_RET(_regs)    (_regs).regs[0]
+#elif defined(__mc68000__)
+# define ARCH_REGS             struct pt_regs
+# define SYSCALL_NUM(_regs)    (_regs).orig_d0
+# define SYSCALL_RET(_regs)    (_regs).d0
 #else
 # error "Do not know how to find your architecture's registers and syscalls"
 #endif
@@ -1879,7 +1885,7 @@ const bool ptrace_entry_set_syscall_ret =
  * Use PTRACE_GETREGS and PTRACE_SETREGS when available. This is useful for
  * architectures without HAVE_ARCH_TRACEHOOK (e.g. User-mode Linux).
  */
-#if defined(__x86_64__) || defined(__i386__) || defined(__mips__)
+#if defined(__x86_64__) || defined(__i386__) || defined(__mips__) ||
defined(__mc68000)
 # define ARCH_GETREGS(_regs)   ptrace(PTRACE_GETREGS, tracee, 0, &(_regs))
 # define ARCH_SETREGS(_regs)   ptrace(PTRACE_SETREGS, tracee, 0, &(_regs))
 #else

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
