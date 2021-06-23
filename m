Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C747C48BC2
	for <linux-m68k@archiver.kernel.org>; Wed, 23 Jun 2021 23:31:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 014C96115A
	for <linux-m68k@archiver.kernel.org>; Wed, 23 Jun 2021 23:31:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229796AbhFWXeJ (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 23 Jun 2021 19:34:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229726AbhFWXeJ (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Wed, 23 Jun 2021 19:34:09 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F439C061574
        for <linux-m68k@vger.kernel.org>; Wed, 23 Jun 2021 16:31:50 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id gn32so6581468ejc.2
        for <linux-m68k@vger.kernel.org>; Wed, 23 Jun 2021 16:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=maQsGoW0HkyB1Fr7N9zIIvyVnHnrrjUPbQmt/mYVnKE=;
        b=G2j9gEFbuUH2NzrnGAadbM0Omt1krOE9kFb5bWzMNWpf+HKUHY1GxClejy0CCXRHiS
         JdqrHSq0gOuE47c49xOo4zF4b2KCbaiFOB4l2GEg3ifHIJFcZ0xmEDdI6rnSU/Zjq9vG
         SbOfcegKG1EwU8fs7MkZkHvAp9g8YBITb2CuXFarqdkpJsJllINU5FlZJ519wE7Fjl33
         uaxNrtwvFebLUgHOxN5phTyiTsN5Md5kBeW8LgesnePxT32dgFKu8BBKVwqWh6P1PdIC
         LO4zMKnWdTljZqeV4REhQ+GXrrBk6epOfvJtrq2fHyUWZ3leX7l4f+/mAqSmtfkcdf40
         7DQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=maQsGoW0HkyB1Fr7N9zIIvyVnHnrrjUPbQmt/mYVnKE=;
        b=D/7+f0IMmOmkQ4uXjZs9qSUFf2m/qmCwGWbizFLNX/6QQniw2iUJ96ymoemNvU81FX
         ClAbXC+/tI16AIDmvcCWzSw8j2s0zx4Rg9CdXJLKBTRj2kZbX3mtFPEZ25TjJBNGFwIo
         Kwf42ZwMf5p1URGK1q/QK42xzKoMRMTQ+IuOLyLNIS6ZfZ/l43qAgnpnng79zAHu/ihn
         X08TcaqN9zNl52cYvnmA2ENkK5ZJ1DaUQR8UfGoRtRl3pBi6gYmKpZB/tDeOlEOk0Efb
         YTkru6an2nQNmbgyK99RjMmJmJlYvt8InBMg6rzrYbBG7TNo/szlzaGnaxSyOLvlt1MU
         1g8A==
X-Gm-Message-State: AOAM53049375ZJr3V7cSQsJdOGCwCCGoFSdobZdEGt+ypAGBCIawfgAW
        B+vE7WJALbmqXigHUuPowy6m0YdduD5Ozmq9I00=
X-Google-Smtp-Source: ABdhPJzaNF1q7YRLlEDBc1r61lRYRJ3/R+pX+3COkyuDNRg+ixYoIldRdNUYp9jKW22HGb70ZYKmam95UyLAf1ICOjM=
X-Received: by 2002:a17:906:254d:: with SMTP id j13mr2396915ejb.27.1624491108740;
 Wed, 23 Jun 2021 16:31:48 -0700 (PDT)
MIME-Version: 1.0
References: <1623908361-29837-1-git-send-email-schmitzmic@gmail.com>
 <1623908361-29837-2-git-send-email-schmitzmic@gmail.com> <CAMuHMdV+CCcUWYTOs3J+wKsgXD=G0u3_5aP1RcPz1p2tviKreA@mail.gmail.com>
In-Reply-To: <CAMuHMdV+CCcUWYTOs3J+wKsgXD=G0u3_5aP1RcPz1p2tviKreA@mail.gmail.com>
From:   Michael Schmitz <schmitzmic@gmail.com>
Date:   Thu, 24 Jun 2021 11:31:37 +1200
Message-ID: <CAOmrzk+7i5w7kuj2n3_5S76+f-AhxzGCOGeWo8U6iHE81oAY4Q@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] m68k: add kernel seccomp support
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     "Linux/m68k" <linux-m68k@vger.kernel.org>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        Andreas Schwab <schwab@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Geert, Andeas,
I admit I am no great shakes at libc stuff - how is syscall argument
no. 6 passed in the few syscalls that have this many arguments?
Cheers,
  Michael

On Wed, Jun 23, 2021 at 7:27 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Michael,
>
> On Thu, Jun 17, 2021 at 7:39 AM Michael Schmitz <schmitzmic@gmail.com> wrote:
> > Add secure_computing() call to syscall_trace_enter to actually
> > filter system calls.
> >
> > Add necessary arch Kconfig options, define TIF_SECCOMP trace
> > flag and provide basic seccomp filter support in asm/syscall.h
> >
> > syscall_get_nr currently uses the syscall nr stored in orig_d0
> > because we change d0 to a default return code before starting a
> > syscall trace. This may be inconsistent with syscall_rollback
> > copying orig_d0 to d0 (which we never check upon return from
> > trace). We use d0 for the return code from syscall_trace_enter
> > in entry.S currently, and could perhaps expand that to store
> > a new syscall number returned by the seccomp filter before
> > executing the syscall. This clearly needs some discussion.
> >
> > Compiles (for Atari) and boots on ARAnyM, otherwise untested.
> >
> > Signed-off-by: Michael Schmitz <schmitzmic@gmail.com>
>
> Thanks for your patch!
>
> > --- a/arch/m68k/include/asm/syscall.h
> > +++ b/arch/m68k/include/asm/syscall.h
> > @@ -4,6 +4,39 @@
> >
> >  #include <uapi/linux/audit.h>
> >
> > +#include <asm/unistd.h>
> > +
> > +extern const unsigned long sys_call_table[];
> > +
> > +static inline int syscall_get_nr(struct task_struct *task,
> > +                                struct pt_regs *regs)
> > +{
> > +       return regs->orig_d0;
> > +}
> > +
> > +static inline void syscall_rollback(struct task_struct *task,
> > +                                   struct pt_regs *regs)
> > +{
> > +       regs->d0 = regs->orig_d0;
> > +}
> > +
> > +static inline void syscall_set_return_value(struct task_struct *task,
> > +                                           struct pt_regs *regs,
> > +                                           int error, long val)
> > +{
> > +       regs->d0 = (long) error ? error : val;
> > +}
> > +
> > +static inline void syscall_get_arguments(struct task_struct *task,
> > +                                        struct pt_regs *regs,
> > +                                        unsigned long *args)
> > +{
> > +       args[0] = regs->orig_d0;
> > +       args++;
> > +
> > +       memcpy(args, &regs->d0 + 1, 5 * sizeof(args[0]));
>
> This doesn't look right to me: "&regs->d0 + 1" is "&regs->orig_d0"
> again, and there are no registers after that.
> Perhaps you meant "&regs->d1"?
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
