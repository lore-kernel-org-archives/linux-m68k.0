Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54C4FC4743C
	for <linux-m68k@archiver.kernel.org>; Wed, 23 Jun 2021 07:27:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 395D661076
	for <linux-m68k@archiver.kernel.org>; Wed, 23 Jun 2021 07:27:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229949AbhFWH3V (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 23 Jun 2021 03:29:21 -0400
Received: from mail-vk1-f176.google.com ([209.85.221.176]:35752 "EHLO
        mail-vk1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229660AbhFWH3T (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Wed, 23 Jun 2021 03:29:19 -0400
Received: by mail-vk1-f176.google.com with SMTP id d7so306612vkf.2
        for <linux-m68k@vger.kernel.org>; Wed, 23 Jun 2021 00:27:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mbHJeZ/2jQg4KnIx3/UM94SO1G0UPV0Bw9MTNTsLwY0=;
        b=HcM6S88Z92wUB6107caitgD3yjzF3ST5no7L/tCEUZ93QkPghPSApNMyXsfuKy3RjM
         eYvBu48tcqVFhI398TM0mJuyZvkNpmnxZ+8ynd6fI+5aXHL9dflIY6Jd17fR2cNh6vzl
         +xgsy9/6ayb+dhy9Lr6/MeQitNVO0SG+aTilVxfSr4XG58P0pogubFJ+xtnW72YwTf3o
         kTwXfBUOq1DOq8+TbGlgqOIn4TeibQ0DtA5fA+8XG3mVLN+JS8L62iT9lHPaFZqCiFcY
         TK2/JeZCRvRsxuXqc0zaUVcxUo6wTEdbPIulx/J011nM64+W5UGUvNK4Kl+Mc+NalEGv
         UJwg==
X-Gm-Message-State: AOAM532V1CkmLy9Qi4lZUPVk9UuPnFWl4uJia5tT9vBbHSsoCM5+bUqX
        MqBlVZo3vU84xPVrQNzspIFyLEgFrSdKdgeQ6Qs=
X-Google-Smtp-Source: ABdhPJwGfo68zhMWhGupRXStniyG0TvuhyPrgN4e3oI6ibLaYa/nLJ/3ZXtBnvFAzgo19eftp7LgpSlqcNReq2h/990=
X-Received: by 2002:a1f:d8c3:: with SMTP id p186mr22306555vkg.1.1624433222367;
 Wed, 23 Jun 2021 00:27:02 -0700 (PDT)
MIME-Version: 1.0
References: <1623908361-29837-1-git-send-email-schmitzmic@gmail.com> <1623908361-29837-2-git-send-email-schmitzmic@gmail.com>
In-Reply-To: <1623908361-29837-2-git-send-email-schmitzmic@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 23 Jun 2021 09:26:51 +0200
Message-ID: <CAMuHMdV+CCcUWYTOs3J+wKsgXD=G0u3_5aP1RcPz1p2tviKreA@mail.gmail.com>
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

Thanks for your patch!

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
> +       memcpy(args, &regs->d0 + 1, 5 * sizeof(args[0]));

This doesn't look right to me: "&regs->d0 + 1" is "&regs->orig_d0"
again, and there are no registers after that.
Perhaps you meant "&regs->d1"?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
