Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C61B6C433E0
	for <linux-m68k@archiver.kernel.org>; Mon, 11 Jan 2021 09:43:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 821FD22AAA
	for <linux-m68k@archiver.kernel.org>; Mon, 11 Jan 2021 09:43:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728444AbhAKJn2 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 11 Jan 2021 04:43:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726273AbhAKJn1 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 11 Jan 2021 04:43:27 -0500
Received: from mail-qv1-xf2e.google.com (mail-qv1-xf2e.google.com [IPv6:2607:f8b0:4864:20::f2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92F14C061794
        for <linux-m68k@lists.linux-m68k.org>; Mon, 11 Jan 2021 01:42:47 -0800 (PST)
Received: by mail-qv1-xf2e.google.com with SMTP id d11so7116576qvo.11
        for <linux-m68k@lists.linux-m68k.org>; Mon, 11 Jan 2021 01:42:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DUfTbQGm1sYbTuHQ6N2tbg15sRgq+C0/3VzraDpB8+U=;
        b=lp/Rr1x12XrjiBouCvxebPlGEbCGsJ1Q9IDwFuKcAhG7ytOwBl9OVMtRzNeXA2iiGc
         XPTLRf5S9NR/sM7n7Yck/RPcl64wCSZbAtLI9DZhkGBu1BLKzeFP5Q6FwCr8TAm+i9TF
         U90ImdgFEj7WDQ4BLQ4E+OlHsQ1n4y9WG+oXE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DUfTbQGm1sYbTuHQ6N2tbg15sRgq+C0/3VzraDpB8+U=;
        b=npRWBbwE8/okKfLJPyRcYOQzBoO+/PQRPo4RVGwRTXUZX0qk7uj5bUg/7V3uDcmkiM
         OzghkdsJTXN5J0TETm6uPO04IO2j9BqIfqRWu2/ymSu/ViawNWl7gQnNa1ni5cpPQBqt
         L2WteFR2tEkiQmjQ5UEFAs8v8gxnQFuKHHlJWKSzv8j8LMC09ILHdrXQh/qe3Nu5wO/p
         hct8MaGWNUigSL0FSmurQbXXHs3g9NvHZzN6xA4G+6EAGdKFIgOP55OsnCOctreXAFU5
         Ng2IswiWbcNSEkXo29DxxVzp2prqM/yUZYeZ7Dmn7Manj2ALxzT0ShUUX1JKdvZ+NvP2
         Q3Sw==
X-Gm-Message-State: AOAM533wS7o0K+cdRQpJXml4C5cQ9DQp2DdS/v3vNDtHmBGsy4w6og3t
        msp9qpEMNfNWkAXurMZ16Iu+j70Zl+5E9xo1sPTu1w==
X-Google-Smtp-Source: ABdhPJy4K9HB0obyh0Clk+QQIAKuPgk/K6do6jTzF9jnrGAvkp0VxPzdMKLWeegfFzkhWxmUGOfDu/+ZkfmRlkMmziU=
X-Received: by 2002:a0c:c38e:: with SMTP id o14mr15347088qvi.29.1610358166501;
 Mon, 11 Jan 2021 01:42:46 -0800 (PST)
MIME-Version: 1.0
References: <CAFr9PX=BV1YFcO_GQWsW3XEo8nndjUwArzW5Fg1fnWzt8fiwGw@mail.gmail.com>
 <e1b2de15-b4ad-68bb-4fae-cf0f3ecd4b79@physik.fu-berlin.de>
In-Reply-To: <e1b2de15-b4ad-68bb-4fae-cf0f3ecd4b79@physik.fu-berlin.de>
From:   Daniel Palmer <daniel@0x0f.com>
Date:   Mon, 11 Jan 2021 18:42:35 +0900
Message-ID: <CAFr9PXn0jokKt0TRB5EsJeFzBTdLRMiGaWZQdz8nLi+gjqPRMA@mail.gmail.com>
Subject: Re: Old platforms: bring out your dead
To:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc:     Linux ARM <linux-arm-kernel@lists.infradead.org>,
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

On Mon, 11 Jan 2021 at 18:17, John Paul Adrian Glaubitz
<glaubitz@physik.fu-berlin.de> wrote:
>
> Hi Daniel!
> > On Sat, 9 Jan 2021 at 07:56, Arnd Bergmann <arnd@kernel.org> wrote:
> >> * 68000/68328 (Dragonball): these are less capable than the
> >>   68020+ or the Coldfire MCF5xxx line and similar to the 68360
> >>   that was removed in 2016.
> >
> > I have some patches for the DragonBall series to enable SPI etc there,
> > some patches to support the SuperVZ variant, some tools to upload
> > Linux via the integrated serial bootloader.
> > The DragonBall is probably what anyone that wants to build a 68K retro
> > computer should use as the DRAM controller is integrated and it can
> > access 32MB of SDRAM.
>
> Sounds interesting. Do these SoCs come with an MMU? And do they use the
> ColdFire instruction set or do they run plain 68k code?

I can't remember if they have a simple memory protection controller or
not but I'm sure there isn't a proper mmu so they are limited to
nommu.
The instruction set is exactly the same as the original 68000 except I
think they have the one slightly different instruction like the
MC68SEC000 has.
The standard MC68000 only has 24 bits worth of address lines though so
you have to get everything into 16MB which is a bit painful if you
have 8MB of flash and 8MB of RAM.
The DragonBall must have more address lines internally however as I
managed to get 32MB of SDRAM and 16MB of flash working on my board.

It's still a toy at the end of the day though. :)

Cheers,

Daniel
