Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D488C2B9F7
	for <linux-m68k@archiver.kernel.org>; Wed, 26 May 2021 07:20:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6E19F61402
	for <linux-m68k@archiver.kernel.org>; Wed, 26 May 2021 07:20:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232989AbhEZHWD (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 26 May 2021 03:22:03 -0400
Received: from mail-ua1-f45.google.com ([209.85.222.45]:33558 "EHLO
        mail-ua1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232975AbhEZHWC (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 26 May 2021 03:22:02 -0400
Received: by mail-ua1-f45.google.com with SMTP id c6so258640uat.0
        for <linux-m68k@lists.linux-m68k.org>; Wed, 26 May 2021 00:20:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mfyNClndHUNcIv3x/5sWBhrH6KgenkR88tjR35EvNYU=;
        b=E10nut3jMRv/BEMHGwe54zZYnjHkbwrpLJwU0Hr/ftBRQkRHXczhhNhbHqpl+QwJTQ
         VrNUl7VIcznzNyMW53lxnNC8YXP2q1ffPlECY1qHuJ12uaNzSl+ZCKtQ8Ym70ARdnLWo
         BLFuaCERS96nbQIOK+697/yXvdjJD9pTls9MHVIi66nLX6vWwWUCePQftYdUXQ8qgJjC
         KRFMsnfkuQXdmyc2epenGFeGNVNehpBZJU3DJUZsxUyjsHbxMUb6nPaZY5p6xjhYa7yX
         HIAFd0sYISUiYs0G1GDFOoxT5WJ3vgJw7f3nHOhLkayp37p2Z0LgB/RU/+An9VochJAA
         yLmA==
X-Gm-Message-State: AOAM530BLYyE5bX8ryLg5e9PCUKysUyE1+1P1YIK30isXetxONTXLLC3
        Xob7iOdVTuc34OQsHmbW4uS87xyJzKJfi9eflbA=
X-Google-Smtp-Source: ABdhPJxF+qtPXKWBS1ATx0OB8NSVaKioeEzf3uGa4Whzc6rDzo7AkL3e1u+kHO4TtFK5BkjfqOjJo9rP8okfur+vUSQ=
X-Received: by 2002:ab0:7705:: with SMTP id z5mr30510980uaq.2.1622013630064;
 Wed, 26 May 2021 00:20:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210526070345.31114-1-rdunlap@infradead.org>
In-Reply-To: <20210526070345.31114-1-rdunlap@infradead.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 26 May 2021 09:20:18 +0200
Message-ID: <CAMuHMdXdpzmFMSmM+8z9csZ094O5UG6nmAyTYYb=4TAmyUiSnw@mail.gmail.com>
Subject: Re: [PATCH] MOUSE_ATARI: fix kconfig unmet dependency warning
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Michael Schmitz <schmitz@debian.org>,
        Roman Zippel <zippel@linux-m68k.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input <linux-input@vger.kernel.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Randy,

On Wed, May 26, 2021 at 9:03 AM Randy Dunlap <rdunlap@infradead.org> wrote:
> MOUSE_ATARI should depend on INPUT_KEYBOARD since ATARI_KBD_CORE
> depends on INPUT_KEYBOARD. This prevents MOUSE_ATARI from
> selecting ATARI_KBD_CORE when INPUT_KEYBOARD is not set/enabled.
>
> WARNING: unmet direct dependencies detected for ATARI_KBD_CORE
>   Depends on [n]: !UML && INPUT [=y] && INPUT_KEYBOARD [=n]
>   Selected by [y]:
>   - MOUSE_ATARI [=y] && !UML && INPUT [=y] && INPUT_MOUSE [=y] && ATARI [=y]
>
> Fixes: c04cb856e20a ("m68k: Atari keyboard and mouse support.")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>

Thanks for your patch!

> --- linux-next-20210525.orig/drivers/input/mouse/Kconfig
> +++ linux-next-20210525/drivers/input/mouse/Kconfig
> @@ -348,6 +348,7 @@ config MOUSE_AMIGA
>
>  config MOUSE_ATARI
>         tristate "Atari mouse"
> +       depends on INPUT_KEYBOARD
>         depends on ATARI
>         select ATARI_KBD_CORE
>         help

It looks like arch/m68k/atari/atakeyb.c doesn't use anything from the
input subsystem, so I think you can move the ATARI_KBD_CORE symbol
outside the "if INPUT_KEYBOARD" section instead.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
