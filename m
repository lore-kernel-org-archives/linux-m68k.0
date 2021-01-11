Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 587C9C433E6
	for <linux-m68k@archiver.kernel.org>; Mon, 11 Jan 2021 09:38:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 128FE22A84
	for <linux-m68k@archiver.kernel.org>; Mon, 11 Jan 2021 09:38:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725897AbhAKJh4 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 11 Jan 2021 04:37:56 -0500
Received: from mail-ot1-f49.google.com ([209.85.210.49]:38505 "EHLO
        mail-ot1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728494AbhAKJho (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 11 Jan 2021 04:37:44 -0500
Received: by mail-ot1-f49.google.com with SMTP id j20so16305034otq.5
        for <linux-m68k@lists.linux-m68k.org>; Mon, 11 Jan 2021 01:37:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TL0qEC8VyLvfk6/0XMSittUYFqguLqcOb1FSq3dtCW0=;
        b=BirEWZf254KfcCChqbEw3RnD0YrCEH03nks3IEP3FXwMik8Y2+VrLAStM0eidO5S4+
         ou55Hbg2LiJTverUa4nYAkLEK3gUjBflYb1Q+vAy9jgBQfdlRdS4nZHe8IQR7Yjd/UwL
         c9/wgleEs+7VqcxM60aZx2APC3SDFU4OJtL3xe7Cc7iySp1lIkl+RnKCgo8j2mw63vyx
         4nTrlOlfyLnyJwwWrMC46ejuGgurFV+eRHejuv7Ih2iLJpnoAN91dAVrZqkNvFkXIF/J
         HR9wMTFtDVOKkbeCFl32gcbG+cz7XrqdCnvrft4F+qxibj/XB9Vy9R3hx72QT5bwkMvL
         x16Q==
X-Gm-Message-State: AOAM533GInz/QD3ZSQHSCKjGkEXHmkzvT7cQ0Iak0UTWypYyCdmiD4QK
        S1XK05AEjGmoH1Tl3wyiJM9t8wNcz7KO6TlPfJQ=
X-Google-Smtp-Source: ABdhPJwSMmuGp2OZxS0h1K5iXabLbFdL3Te0I+cEmDEVc+mcS9nGMONUn+Am8fSrvTAzlp5aYrYpF9Kn4HIFUErYMaE=
X-Received: by 2002:a05:6830:210a:: with SMTP id i10mr10460944otc.145.1610357823615;
 Mon, 11 Jan 2021 01:37:03 -0800 (PST)
MIME-Version: 1.0
References: <CAFr9PX=BV1YFcO_GQWsW3XEo8nndjUwArzW5Fg1fnWzt8fiwGw@mail.gmail.com>
 <e1b2de15-b4ad-68bb-4fae-cf0f3ecd4b79@physik.fu-berlin.de>
 <CAMuHMdUia3-DroA3VOA5jkYYWP+Rip5yse-nd00JuV8uFnVp1Q@mail.gmail.com> <803a40ba-d0cb-e5e2-9d57-f1b70d7aee37@physik.fu-berlin.de>
In-Reply-To: <803a40ba-d0cb-e5e2-9d57-f1b70d7aee37@physik.fu-berlin.de>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 11 Jan 2021 10:36:51 +0100
Message-ID: <CAMuHMdV0orx=9W3LU40Z4wvtL18Znz79=j6pObUw+22TEaAM6g@mail.gmail.com>
Subject: Re: Old platforms: bring out your dead
To:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc:     Daniel Palmer <daniel@0x0f.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Krzysztof Adamski <krzysztof.adamski@nokia.com>,
        Oleksij Rempel <o.rempel@pengutronix.de>,
        Baruch Siach <baruch@tkos.co.il>,
        Russell King - ARM Linux <linux@armlinux.org.uk>,
        Daniel Tang <dt.tangr@gmail.com>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, Jamie Iles <jamie@jamieiles.com>,
        Barry Song <song.bao.hua@hisilicon.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jonas Jensen <jonas.jensen@gmail.com>,
        Marc Gonzalez <marc.w.gonzalez@free.fr>,
        Hartley Sweeten <hsweeten@visionengravers.com>,
        Lubomir Rintel <lkundrak@v3.sk>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Shawn Guo <shawnguo@kernel.org>, Alex Elder <elder@linaro.org>,
        Alexander Shiyan <shc_work@mail.ru>,
        Koen Vandeputte <koen.vandeputte@ncentric.com>,
        Hans Ulli Kroll <ulli.kroll@googlemail.com>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Wei Xu <xuwei5@hisilicon.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Mark Salter <msalter@redhat.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Adrian,

On Mon, Jan 11, 2021 at 10:26 AM John Paul Adrian Glaubitz
<glaubitz@physik.fu-berlin.de> wrote:
> On 1/11/21 10:20 AM, Geert Uytterhoeven wrote:
> >> Sounds interesting. Do these SoCs come with an MMU? And do they use the
> >> ColdFire instruction set or do they run plain 68k code?
> >
> > No MMU, plain m68k code.
> >
> > 68328 Soc = 68000 core + some peripherals,
> > 68360 SoC = CPU32 core (based on 68020 + some peripherals.
>
> OK, I guess that would be useful for the NoMMU Linux port.

Note that 68360 support was removed from the kernel in 2016, as
Arnd said.

> > Anyone working on integrating m68k (and SPARC and MIPS?) softcores in
> > LiteX? ;-)
>
> I'm personally waiting for the Vampire to gain support for the real 68851
> as the hardware in general looks very attractive [1].

The 68851 is way too complex for what's needed (who needs support for
256 byte pages (https://lwn.net/Articles/839746/)?).
They'd be better off implementing something simpler, like 68040 MMU
support, or perhaps even a software-controlled TLB like most RISC
architectures (incl. ColdFire?).  The latter would require more changes
to Linux, though.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
