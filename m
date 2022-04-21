Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6300C4332F
	for <linux-m68k@archiver.kernel.org>; Thu, 21 Apr 2022 06:54:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229787AbiDUG5I (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 21 Apr 2022 02:57:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1385445AbiDUG5B (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 21 Apr 2022 02:57:01 -0400
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CD0F15802
        for <linux-m68k@lists.linux-m68k.org>; Wed, 20 Apr 2022 23:53:13 -0700 (PDT)
Received: by mail-qt1-f177.google.com with SMTP id x12so2627836qtp.9
        for <linux-m68k@lists.linux-m68k.org>; Wed, 20 Apr 2022 23:53:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qJDkHKGLNQny7+nf6+dAQhj4pSl5mPJhKTIW2Wu14QI=;
        b=UfdU2CFuEvAJxC7mF6HiuWjoKgxNG5Vt96OkL8UjMAndaIQHKci1gZIZPczhpxtA9M
         Nvyufed9I1aZ7fUkbKTJ54tzfoNKShdCKE9RpZPhHIImoOmRgQrHXMHrQUQfq9iUaZYL
         aPSdJpSUGYRow7dayLk6ewF8mYBfWnYm3bEGAL5DoiznmCyIGK/fPgfTRR0lyROg6ql3
         tMaX3lIC7DRz/S9cl9xbmJKoBjbuv4MapIrwbeUaTu4Asmw5jQTiQa7ASbXsRc7rSdDo
         4iTR9QNJs2eRMPkqn7rxtaU26T9y2h0eIAkCycIRpYp8rE/Z93EnA3zYbDaEB61VgRzy
         l3yQ==
X-Gm-Message-State: AOAM533grf3WcHbJZCENrPe5Ct3ML0WQOIs0qPk7bN4r46ouDwEVbb0o
        fJgZLa9hNt2PJNS4SGziJxWKu3eVY+wiWMN3
X-Google-Smtp-Source: ABdhPJwCiOS4Nw+ueZlRM+U7WW/xYHwj6t0Dj/mOQ8YxRLe+geJF98e3ij1RnX/z1L32qn7WNIfvYg==
X-Received: by 2002:ac8:7f8c:0:b0:2f2:5f:4a5c with SMTP id z12-20020ac87f8c000000b002f2005f4a5cmr11822627qtj.212.1650523992204;
        Wed, 20 Apr 2022 23:53:12 -0700 (PDT)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com. [209.85.219.181])
        by smtp.gmail.com with ESMTPSA id 135-20020a37078d000000b0069ea3c7513bsm2636593qkh.121.2022.04.20.23.53.11
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Apr 2022 23:53:11 -0700 (PDT)
Received: by mail-yb1-f181.google.com with SMTP id f17so7019941ybj.10
        for <linux-m68k@lists.linux-m68k.org>; Wed, 20 Apr 2022 23:53:11 -0700 (PDT)
X-Received: by 2002:a5b:984:0:b0:63f:8c38:676c with SMTP id
 c4-20020a5b0984000000b0063f8c38676cmr23970174ybq.393.1650523990757; Wed, 20
 Apr 2022 23:53:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220414091018.896737-1-niklas.cassel@wdc.com>
 <f379cb56-6ff5-f256-d5f2-3718a47e976d@opensource.wdc.com> <Yli8voX7hw3EZ7E/@x1-carbon>
 <81788b56-5b15-7308-38c7-c7f2502c4e15@linux-m68k.org> <87levzzts4.fsf_-_@email.froward.int.ebiederm.org>
 <01b063d7-d5c2-8af0-ad90-ed6c069252c5@linux-m68k.org>
In-Reply-To: <01b063d7-d5c2-8af0-ad90-ed6c069252c5@linux-m68k.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 21 Apr 2022 08:52:59 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXd94L=766usN4WG-hK2MpQLy50mJZ=9G9NGv03kx8V8Q@mail.gmail.com>
Message-ID: <CAMuHMdXd94L=766usN4WG-hK2MpQLy50mJZ=9G9NGv03kx8V8Q@mail.gmail.com>
Subject: Re: [PATCH] binfmt_flat: Remove shared library support
To:     Greg Ungerer <gerg@linux-m68k.org>
Cc:     "Eric W. Biederman" <ebiederm@xmission.com>,
        Kees Cook <keescook@chromium.org>,
        Niklas Cassel <Niklas.Cassel@wdc.com>,
        Damien Le Moal <damien.lemoal@opensource.wdc.com>,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Mike Frysinger <vapier@gentoo.org>,
        "stable@vger.kernel.org" <stable@vger.kernel.org>,
        "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
        "linux-mm@kvack.org" <linux-mm@kvack.org>,
        "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
        Linux-Arch <linux-arch@vger.kernel.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux-sh list <linux-sh@vger.kernel.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Thu, Apr 21, 2022 at 1:53 AM Greg Ungerer <gerg@linux-m68k.org> wrote:
> On 21/4/22 00:58, Eric W. Biederman wrote:
> > In a recent discussion[1] it was reported that the binfmt_flat library
> > support was only ever used on m68k and even on m68k has not been used
> > in a very long time.
> >
> > The structure of binfmt_flat is different from all of the other binfmt
> > implementations becasue of this shared library support and it made
> > life and code review more effort when I refactored the code in fs/exec.c.
> >
> > Since in practice the code is dead remove the binfmt_flat shared libarary
> > support and make maintenance of the code easier.
> >
> > [1] https://lkml.kernel.org/r/81788b56-5b15-7308-38c7-c7f2502c4e15@linux-m68k.org
> > Signed-off-by: "Eric W. Biederman" <ebiederm@xmission.com>
> > ---
> >
> > Can the binfmt_flat folks please verify that the shared library support
> > really isn't used?
>
> I can definitely confirm I don't use it on m68k. And I don't know of
> anyone that has used it in many years.
>
>
> > Was binfmt_flat being enabled on arm and sh the mistake it looks like?

I think the question was intended to be

    Was *binfmt_flat_shared_flat* being enabled on arm and sh the
    mistake it looks like?

> >
> >   arch/arm/configs/lpc18xx_defconfig |   1 -
> >   arch/arm/configs/mps2_defconfig    |   1 -
> >   arch/arm/configs/stm32_defconfig   |   1 -
> >   arch/arm/configs/vf610m4_defconfig |   1 -
>
> binfmt_flat works on ARM. I use it all the time.
> According to those defconfigs those are all non-MMU systems, so
> having binfmt_flat enabled makes some sense there.
>
>
> >   arch/sh/configs/rsk7201_defconfig  |   1 -
> >   arch/sh/configs/rsk7203_defconfig  |   1 -
> >   arch/sh/configs/se7206_defconfig   |   1 -
>
> Those are all SH2 systems if I am reading the defconfigs correctly.
> SH2 is non-MMU according to the Kconfig setup. So it makes sense that
> binfmt_flat is enabled on those too.

I've checked git history, and CONFIG_BINFMT_SHARED_FLAT was enabled
in se7206_defconfig in a non-specific defconfig update, so no
further info.
The other two had it enabled since their introduction, so I guess
they were just based on the former.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
