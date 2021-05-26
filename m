Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD226C47088
	for <linux-m68k@archiver.kernel.org>; Wed, 26 May 2021 14:51:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8BA4A613B0
	for <linux-m68k@archiver.kernel.org>; Wed, 26 May 2021 14:51:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235150AbhEZOxU (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 26 May 2021 10:53:20 -0400
Received: from mail-vs1-f54.google.com ([209.85.217.54]:33568 "EHLO
        mail-vs1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235146AbhEZOxU (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 26 May 2021 10:53:20 -0400
Received: by mail-vs1-f54.google.com with SMTP id f11so832632vst.0
        for <linux-m68k@lists.linux-m68k.org>; Wed, 26 May 2021 07:51:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BARZY/Zm/Q9bSQpQWNCPuOu1nEYjPwLPq7uNIDXm7kk=;
        b=DB/wuXfOH2c2yKd93HYk5Mw+3/NnwqblYBOTzrw2J4J6Z0lvgIbE4ZtDShQcqozF2D
         +x7EvYOBGGvXLOD2KmNFoIqfULbd4j6lPExSCAIeioxF+pc+CNCM7YFtJLOVdY9kyK69
         YGApwVAaJFZMev5LIc/UY76DGFL7OZj2JDc8eicPCDsJ8akWkHbzdwZb5QEFoV+/wifn
         flVWWgbHEtxFZMze8EAsD7URBk6FU2GS0YtU0Vjb/MTTJ3MF6ov83djRgWk5GgXnO04B
         4IQZVZ4gKgD5JSnXsHcSJt3xicawaqX1TcjCwyupDjI/3V/nfs2PuzxX9gMJlIjSuM/H
         ZEVQ==
X-Gm-Message-State: AOAM532afktPt6UjDjff/pbeI1+GKUUIvFzSUCz4yY0B4weKjorexxVy
        F7nZooLa8Es6vuSPW9JPTX9RT0WmDi8ZNNs2jWc=
X-Google-Smtp-Source: ABdhPJxHFkT/Ut4XcWcmc+uY1kwmt7LbdgIdiTRddR/Hb6SvL9PjTUS3ABPW2ezC6FfM0VGqzQ9U1tJsbBQR15GYK4w=
X-Received: by 2002:a05:6102:392:: with SMTP id m18mr32558814vsq.40.1622040707282;
 Wed, 26 May 2021 07:51:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210526084536.1454449-1-geert@linux-m68k.org> <CAK7LNARq87zoD9-r4YfY5rewwieBOBJYETs4MLwBz9vddxMsRA@mail.gmail.com>
In-Reply-To: <CAK7LNARq87zoD9-r4YfY5rewwieBOBJYETs4MLwBz9vddxMsRA@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 26 May 2021 16:51:35 +0200
Message-ID: <CAMuHMdW9CzMMwvJKHsLLD_BT9Roor6xWxzZYhv0fkEA7LT0Z9A@mail.gmail.com>
Subject: Re: [PATCH] m68k: Drop duplicate "core-y += arch/m68k/" rule causing
 link failures
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Yamada-san,

On Wed, May 26, 2021 at 4:24 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
> On Wed, May 26, 2021 at 5:45 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> >     Makefile:1949: target 'arch/m68k' given more than once in the same rule
> >     [...]
> >       LD      vmlinux.o
> >     m68k-linux-gnu-ld: arch/m68k/kernel/entry.o: in function `system_call':
> >     (.text+0x160): multiple definition of `system_call'; arch/m68k/kernel/entry.o:(.text+0x160): first defined here
> >     [...]
> >
> > All "core-y += arch/<arch>/" rules were dropped from the corresponding
> > arch/<arch>/Makefiles, but m68k was forgotten.
> >
> > Reported-by: noreply@ellerman.id.au
> > Fixes: 7d9677835b10b5de ("kbuild: require all architectures to have arch/$(SRCARCH)/Kbuild")
> > Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> > ---
>
> I will squash this.

Fine for me. Thx!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
