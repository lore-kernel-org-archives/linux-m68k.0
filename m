Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8423C433F5
	for <linux-m68k@archiver.kernel.org>; Tue, 12 Apr 2022 09:50:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232691AbiDLJwA (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 12 Apr 2022 05:52:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355075AbiDLH1H (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 12 Apr 2022 03:27:07 -0400
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9F7B48313
        for <linux-m68k@lists.linux-m68k.org>; Tue, 12 Apr 2022 00:07:07 -0700 (PDT)
Received: by mail-qv1-f47.google.com with SMTP id a10so4142264qvm.8
        for <linux-m68k@lists.linux-m68k.org>; Tue, 12 Apr 2022 00:07:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=G5mglcYZA42FcZWexfT//Na3N8U+QShWNDx9HhSMVxo=;
        b=a5iNLogjJgbaQTiHPz4l8xuCAXGg3UYc26fOHOkiZDb2+KtV8bC8Teoh476LBe6AnR
         s+es86Qlk47BwaEYfk93U8ZRcH5vflp6UbbJr/gTidXSW5Cdmu/HKlK1tP5Yf/vUE7ei
         Cg/niPyUtQpYeQ5TYQk5/JGxPoL3FdeJN5BA1G7c4XA8rx891WRAHmQsntCXu8V2Xq+T
         9PSZZADxxwZQBYko8kR2btrF0cWXewFZ8HL5E3r0uX6UKWwYegvOu7GFGnfJS2JRYi1J
         pebnuAVrwamUREvlMA9Jef8cvi/5bSF4gRfUO2Ib8eOb3g6Yu4nnwjJZJIiIORb2VV0E
         qizQ==
X-Gm-Message-State: AOAM533UCjPmPkl0iayNEAJckscuHk4taeN8sXW0kfh4rMJFM77zcz2B
        JB11gOg1oVodjRF9waBKN35URWvh1Vcr08pd
X-Google-Smtp-Source: ABdhPJz1kk+eBT6J2CPf1B0VQrIxXA36nYhJLgxiAU0QKEs0RqMJmBKKwlruTjrE+NI98Me8Mm+48A==
X-Received: by 2002:a05:6214:29c2:b0:444:9d4f:4ed0 with SMTP id gh2-20020a05621429c200b004449d4f4ed0mr1028533qvb.90.1649747226043;
        Tue, 12 Apr 2022 00:07:06 -0700 (PDT)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com. [209.85.219.181])
        by smtp.gmail.com with ESMTPSA id bk18-20020a05620a1a1200b00680c72b7bf4sm22890633qkb.93.2022.04.12.00.07.05
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Apr 2022 00:07:05 -0700 (PDT)
Received: by mail-yb1-f181.google.com with SMTP id j2so31620474ybu.0
        for <linux-m68k@lists.linux-m68k.org>; Tue, 12 Apr 2022 00:07:05 -0700 (PDT)
X-Received: by 2002:a25:c049:0:b0:634:6751:e8d2 with SMTP id
 c70-20020a25c049000000b006346751e8d2mr25945732ybf.6.1649747214062; Tue, 12
 Apr 2022 00:06:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220411233832.391817-1-dmitry.osipenko@collabora.com>
In-Reply-To: <20220411233832.391817-1-dmitry.osipenko@collabora.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 12 Apr 2022 09:06:42 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVfOpGvF5FR6vFD-3a1h-7Kc_yAKQzWV71PD6mDy6BmZw@mail.gmail.com>
Message-ID: <CAMuHMdVfOpGvF5FR6vFD-3a1h-7Kc_yAKQzWV71PD6mDy6BmZw@mail.gmail.com>
Subject: Re: [PATCH v7 00/20] Introduce power-off+restart call chain API
To:     Dmitry Osipenko <dmitry.osipenko@collabora.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>,
        Greg Ungerer <gerg@linux-m68k.org>,
        Joshua Thompson <funaho@jurai.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Sebastian Reichel <sre@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Greentime Hu <green.hu@gmail.com>,
        Vincent Chen <deanbo422@gmail.com>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        Helge Deller <deller@gmx.de>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        "the arch/x86 maintainers" <x86@kernel.org>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Boris Ostrovsky <boris.ostrovsky@oracle.com>,
        Juergen Gross <jgross@suse.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Len Brown <lenb@kernel.org>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Pavel Machek <pavel@ucw.cz>,
        Lee Jones <lee.jones@linaro.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-csky@vger.kernel.org,
        "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        Parisc List <linux-parisc@vger.kernel.org>,
        linux-riscv <linux-riscv@lists.infradead.org>,
        Linux-sh list <linux-sh@vger.kernel.org>,
        xen-devel@lists.xenproject.org,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        Linux PM list <linux-pm@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Dmitry,

On Tue, Apr 12, 2022 at 1:38 AM Dmitry Osipenko
<dmitry.osipenko@collabora.com> wrote:
> Problem
> -------
>
> SoC devices require power-off call chaining functionality from kernel.
> We have a widely used restart chaining provided by restart notifier API,
> but nothing for power-off.

> Changelog:
>
> v7: - Rebased on a recent linux-next. Dropped the recently removed
>       NDS32 architecture. Only SH and x86 arches left un-acked.
>
>     - Added acks from Thomas Bogendoerfer and Krzysztof Kozlowski
>       to the MIPS and memory/emif patches respectively.

Looks like you forgot to add the actual acks?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
