Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3E87C4320A
	for <linux-m68k@archiver.kernel.org>; Thu, 26 Aug 2021 12:15:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9F14B610C7
	for <linux-m68k@archiver.kernel.org>; Thu, 26 Aug 2021 12:15:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242454AbhHZMQB (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 26 Aug 2021 08:16:01 -0400
Received: from mail-vs1-f49.google.com ([209.85.217.49]:41507 "EHLO
        mail-vs1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242469AbhHZMQA (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 26 Aug 2021 08:16:00 -0400
Received: by mail-vs1-f49.google.com with SMTP id i1so1862610vsk.8
        for <linux-m68k@lists.linux-m68k.org>; Thu, 26 Aug 2021 05:15:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=E0Hl8jtxjFrHkpLCmmgde7xnpa31MTHOdrTClmEBOFQ=;
        b=BMRkjtS1uqyN7xzqxATbuAaaSlxlDus9KpQXQok4ZAFkaB45crb0vD61jyKGkVuNRe
         7rmsLw1/UL4rXYhtYR9WSrURKKICAsSkFFbC/21m8dyGZAaF0vdymnPydUfvy3u0SW1a
         lp+CBJIfLYQFsFHUapQcloBuEbV6f2rjR+CJj2Jpc0BDtS5vUQ3oEYOqjI6NxhYHjK/E
         ZplUvYoJc7efG12K22alJ4zXplgqrzIkFe5NTnmsdt4dL5HPmaDYe8PArP8QHB6a/HV/
         7V41t4Tbo5dUB9SiuN6mrH1MMWgJ/sHLJMM1Eif2DQY1es1GlKVatVOuzMuRO5pg8MKk
         s3+w==
X-Gm-Message-State: AOAM531rBj2mvxn37KY9Kp35qL5QLWmFg356bDoIQzwolObsHEG4lSQw
        d+qtcmEJJRIykxR2RNFrznDRVEHLIxLKqysWVBE=
X-Google-Smtp-Source: ABdhPJzUKX75Ovzpw+McooHBKT9Ngk2GWrL10ls6hAqG3vuaVDMR8nvQgR7dQ9XEOjABehOcs/46Ra669yu7QFnS+pg=
X-Received: by 2002:a05:6102:3e92:: with SMTP id m18mr2092588vsv.53.1629980113028;
 Thu, 26 Aug 2021 05:15:13 -0700 (PDT)
MIME-Version: 1.0
References: <e9009e13-cfec-c494-0b3b-f334f75cd1e4@gmail.com>
 <af434994-5c61-0e3a-c7bc-3ed966ccb44f@gmail.com> <87h7gopvz2.fsf@disp2133>
 <328e59fb-3e8c-e4cd-06b4-1975ce98614a@gmail.com> <877dhio13t.fsf@disp2133>
 <12992a3c-0740-f90e-aa4e-1ec1d8ea38f6@gmail.com> <87tukkk6h3.fsf@disp2133>
 <df6618bf-d1bc-4759-2d14-934c22d54a83@gmail.com> <87eebn7w7y.fsf@igel.home>
 <db43bef1-7938-4fc1-853d-c20d66521329@gmail.com> <20210725101253.GA6096@allandria.com>
 <be3ddf9a-745e-4798-17a7-a9d0ddd7eef7@gmail.com> <87a6m8kgtx.fsf_-_@disp2133>
 <33327fd4-47fc-2eab-04e4-242697a23d5f@gmail.com> <87tukghjfs.fsf_-_@disp2133>
In-Reply-To: <87tukghjfs.fsf_-_@disp2133>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 26 Aug 2021 14:15:01 +0200
Message-ID: <CAMuHMdVBKfTeLsiuJBdUYh7mmVHXr4dWoiZ_=s8XOz_7J3Wwow@mail.gmail.com>
Subject: Re: [PATCH] signal/m68k: Use force_sigsegv(SIGSEGV) in fpsp040_die
To:     "Eric W. Biederman" <ebiederm@xmission.com>
Cc:     Michael Schmitz <schmitzmic@gmail.com>,
        Brad Boyer <flar@allandria.com>,
        Andreas Schwab <schwab@linux-m68k.org>,
        Linux-Arch <linux-arch@vger.kernel.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Mon, Jul 26, 2021 at 11:08 PM Eric W. Biederman
<ebiederm@xmission.com> wrote:
> In the fpsp040 code when copyin or copyout fails call
> force_sigsegv(SIGSEGV) instead of do_exit(SIGSEGV).
>
> This solves a couple of problems.  Because do_exit embeds the ptrace
> stop PTRACE_EVENT_EXIT a complete stack frame needs to be present for
> that to work correctly.  There is always the information needed for a
> ptrace stop where get_signal is called.  So exiting with a signal
> solves the ptrace issue.
>
> Further exiting with a signal ensures that all of the threads in a
> process are killed not just the thread that malfunctioned.  Which
> avoids confusing userspace.
>
> To make force_sigsegv(SIGSEGV) work in fpsp040_die modify the code to
> save all of the registers and jump to ret_from_exception (which
> ultimately calls get_signal) after fpsp040_die returns.
>
> v2: Updated the branches to use gas's pseudo ops that automatically
>     calculate the best branch instruction to use for the purpose.
>
> v1: Link: https://lkml.kernel.org/r/87a6m8kgtx.fsf_-_@disp2133
> Signed-off-by: "Eric W. Biederman" <ebiederm@xmission.com>

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
