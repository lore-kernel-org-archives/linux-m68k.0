Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 805A4C49EAB
	for <linux-m68k@archiver.kernel.org>; Mon, 28 Jun 2021 07:23:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 61A2961C31
	for <linux-m68k@archiver.kernel.org>; Mon, 28 Jun 2021 07:23:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232369AbhF1HZz (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 28 Jun 2021 03:25:55 -0400
Received: from mail-ua1-f46.google.com ([209.85.222.46]:41972 "EHLO
        mail-ua1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232353AbhF1HZy (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Mon, 28 Jun 2021 03:25:54 -0400
Received: by mail-ua1-f46.google.com with SMTP id k20so988613uao.8
        for <linux-m68k@vger.kernel.org>; Mon, 28 Jun 2021 00:23:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1vfCxQoOKo+mHWeD3i9chikgVU5vWQOI/Yw8n20gQAA=;
        b=dcD+DAbdUBKW0p8Jp4LhTSqhK2k6pSzei1bwmUGmWGXtnvjlb5KEUb4Lnh+jNS7N4L
         QkRwe32W4BDp8SeUGg8mMtubSl23IXYYt+oMZJHGPRZF/yMfVjojd8zOdIUlbsPgZ8yh
         /Dc3onlH4DaqV9mqhXRH/unBcICQjUjnTVc0WlCsvChhtElrTNtF/5OmRh+h67Q41lfq
         ck8BlyIWKm196nzZE/EnVFfNj+MujA3EG+xL9UGEoHp1jS1NqnOrTNWctxaiCcFYBsEy
         xhcwC3xt36GLscEaQZItPGX+CK/yzNotxbuS+AfGx1n3iMWnELUA8ISx+jlaC2NAWQDc
         Roeg==
X-Gm-Message-State: AOAM531/Xezyur29HpKgp2UfVIAq3ytyu7YSp1dE4R6u+tP8ZmwFmz55
        ggZAKhOBCyJjqg5eXjaJMJsAso942ai454ucC1M=
X-Google-Smtp-Source: ABdhPJyadbyJUuVIcbF3RMxWnWM8Jfn47/KuQ3OfUD77PbUqV0PGuaOvnmPLyk9e5213Z920iDTh5SqZlkI9o4GThG0=
X-Received: by 2002:ab0:70b3:: with SMTP id q19mr19424255ual.2.1624865009125;
 Mon, 28 Jun 2021 00:23:29 -0700 (PDT)
MIME-Version: 1.0
References: <1624495560-6351-1-git-send-email-schmitzmic@gmail.com> <1624495560-6351-3-git-send-email-schmitzmic@gmail.com>
In-Reply-To: <1624495560-6351-3-git-send-email-schmitzmic@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 28 Jun 2021 09:23:17 +0200
Message-ID: <CAMuHMdWC9sLUdDpscdHAr--iWxKN=qm7Qq9Zu5VOOR9JTrvo0A@mail.gmail.com>
Subject: Re: [PATCH v6 2/2] m68k: add kernel seccomp support
To:     Michael Schmitz <schmitzmic@gmail.com>
Cc:     "Linux/m68k" <linux-m68k@vger.kernel.org>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        Andreas Schwab <schwab@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Michael,

On Thu, Jun 24, 2021 at 2:46 AM Michael Schmitz <schmitzmic@gmail.com> wrote:
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

> --- a/arch/m68k/include/asm/syscall.h
> +++ b/arch/m68k/include/asm/syscall.h
> @@ -4,6 +4,39 @@
>
>  #include <uapi/linux/audit.h>
>
> +#include <asm/unistd.h>
> +
> +extern const unsigned long sys_call_table[];
> +
> +static inline int syscall_get_nr(struct task_struct *task,
> +                                struct pt_regs *regs)
> +{
> +       return regs->orig_d0;
> +}
> +
> +static inline void syscall_rollback(struct task_struct *task,
> +                                   struct pt_regs *regs)
> +{
> +       regs->d0 = regs->orig_d0;
> +}
> +
> +static inline void syscall_set_return_value(struct task_struct *task,
> +                                           struct pt_regs *regs,
> +                                           int error, long val)
> +{
> +       regs->d0 = (long) error ? error : val;
> +}
> +
> +static inline void syscall_get_arguments(struct task_struct *task,
> +                                        struct pt_regs *regs,
> +                                        unsigned long *args)
> +{
> +       args[0] = regs->orig_d0;
> +       args++;
> +
> +       memcpy(args, &regs->d1, 5 * sizeof(args[0]));
> +}
> +
>  static inline int syscall_get_arch(struct task_struct *task)
>  {
>         return AUDIT_ARCH_M68K;

Comparing this to what I had before, I noticed syscall_get_return_value()
is missing.

Upon closer look, we don't need it (yet), as we don't select any
of GENERIC_ENTRY, HAVE_ARCH_TRACEHOOK, or HAVE_SYSCALL_TRACEPOINTS,
but why not add it while we're at it?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
