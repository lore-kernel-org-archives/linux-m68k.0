Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2F68C4332F
	for <linux-m68k@archiver.kernel.org>; Sat, 24 Dec 2022 09:48:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229658AbiLXJsK (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sat, 24 Dec 2022 04:48:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229541AbiLXJsJ (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sat, 24 Dec 2022 04:48:09 -0500
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75565BE1F
        for <linux-m68k@lists.linux-m68k.org>; Sat, 24 Dec 2022 01:48:08 -0800 (PST)
Received: by mail-qt1-f173.google.com with SMTP id a16so5370095qtw.10
        for <linux-m68k@lists.linux-m68k.org>; Sat, 24 Dec 2022 01:48:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NHi3u0HawEEc5/OGkXGO0UddJLW+vqFAqayF1+b6YOw=;
        b=qxCtWUQVOEy+SkyM5/gocIMpvwJn4dfbo/wSKL1Plz2IQdTCjpdbfBtdhlSCMtkCny
         OthlzonrWEQKtR2t0ZfgfQ2GXw4C9NNcs9kpG4OyuNC4CXbcmpSvASUrxzOGA9FIg3Hq
         XeYxDiITqLnJtK7rEKfWW9LB9tahqdF0gwFF7QVL1oYapw3KDZtB+Y9DDSWq+OCmIQ2p
         dJgBFJ0LSLu9/oJDKfEDiPR280B/gM78ATugByBAuQveZE/ZWo4QYEkE/BvzuZiZxYf/
         jDL9Wl1rC9azDHsgZfZKQhmvTEryh0vyaBhU3h5jhRMtMJeIDua8tITlGP5HDDPObIgG
         xLKw==
X-Gm-Message-State: AFqh2kroUUkVM6za5GnGQqUi9uruwehJZtpwOsA+aMN1iL3NZUykHp3B
        eschTcBJf3XIG6HOMEfcP5xZ8ov4bea3lg==
X-Google-Smtp-Source: AMrXdXvI2fd9mkOhxb1JQTHDmFoEUxZtzgMIiGXCq7WIvrLRhRkEuSWMkvjCbABCle5NJFX06QKrSw==
X-Received: by 2002:a05:622a:5a85:b0:3a8:28fb:b076 with SMTP id fz5-20020a05622a5a8500b003a828fbb076mr14810986qtb.31.1671875287336;
        Sat, 24 Dec 2022 01:48:07 -0800 (PST)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com. [209.85.219.173])
        by smtp.gmail.com with ESMTPSA id t16-20020a05620a451000b006fa8299b4d5sm3934968qkp.100.2022.12.24.01.48.06
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Dec 2022 01:48:06 -0800 (PST)
Received: by mail-yb1-f173.google.com with SMTP id o127so7463116yba.5
        for <linux-m68k@lists.linux-m68k.org>; Sat, 24 Dec 2022 01:48:06 -0800 (PST)
X-Received: by 2002:a25:d103:0:b0:75d:3ecb:1967 with SMTP id
 i3-20020a25d103000000b0075d3ecb1967mr1000944ybg.604.1671875286069; Sat, 24
 Dec 2022 01:48:06 -0800 (PST)
MIME-Version: 1.0
References: <Y1BcpXAjR4tmV6RQ@zx2c4.com> <20221019203034.3795710-1-Jason@zx2c4.com>
 <20221221145332.GA2399037@roeck-us.net> <CAMuHMdUAaQSXq=4rO9soCGGnH8HZrSS0PjWELqGzXoym4dOqnQ@mail.gmail.com>
 <1a27385c-cca6-888b-1125-d6383e48c0f5@prevas.dk> <20221221155641.GB2468105@roeck-us.net>
 <CAHk-=wj7FMFLr9AOW9Aa9ZMt1-Lu01_X8vLiaKosPyF2H-+ujA@mail.gmail.com>
 <b2144334261246aa8dc5004c5f1a58c9@AcuMS.aculab.com> <f02e0ac7f2d805020a7ba66803aaff3e31b5eeff.camel@t-online.de>
In-Reply-To: <f02e0ac7f2d805020a7ba66803aaff3e31b5eeff.camel@t-online.de>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Sat, 24 Dec 2022 10:47:53 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUzjvw3t4Q8YaGS=j+WP9Bz6NgK=di7jLXL3fHGuOZcEw@mail.gmail.com>
Message-ID: <CAMuHMdUzjvw3t4Q8YaGS=j+WP9Bz6NgK=di7jLXL3fHGuOZcEw@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: treat char as always unsigned
To:     Holger Lubitz <holger.lubitz@t-online.de>
Cc:     David Laight <David.Laight@aculab.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rasmus Villemoes <rasmus.villemoes@prevas.dk>,
        "Jason A. Donenfeld" <Jason@zx2c4.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>,
        "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
        "linux-toolchains@vger.kernel.org" <linux-toolchains@vger.kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-m68k@lists.linux-m68k.org" <linux-m68k@lists.linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Holger,

On Sat, Dec 24, 2022 at 10:34 AM Holger Lubitz
<holger.lubitz@t-online.de> wrote:
> On Thu, 2022-12-22 at 10:41 +0000, David Laight wrote:
> > I wonder how much slower it is - m68k is likely to be microcoded
> > and I don't think instruction timings are actually available.
>
> Not sure if these are in any way official, but
> http://oldwww.nvg.ntnu.no/amiga/MC680x0_Sections/mc68030timing.HTML
>
> (There's also
> http://oldwww.nvg.ntnu.no/amiga/MC680x0_Sections/mc68000timing.HTML
> but that is probably only interesting to demo coders by now)

Yes, instruction timings are available.  Unlike for e.g. x86, there
is only a very limited number of parts to consider.

> > I believe some of the other m68k asm functions are also missing
> > the "memory" 'clobber' and so could get mis-optimised.
>
> In which case would that happen? This function doesn't clobber memory
> and its result does get used. If gcc mistakenly thinks the parameters
> haven't changed and uses a previously cached result, wouldn't that
> apply to a C function too?

For a pure C inline function, the compiler knows exactly what it does.

For an external C function, the compiler assumes all odds are off.

For inline asm, the compiler doesn't know what happens with (the data
pointed to by) the pointers, unless that's described in the constraints.
We do have some inline asm that has "*ptr" in the constraints, but
that applies to a single value, not to an array.  And in case of
strings, the size of the array is not known without looking for the
zero-terminator.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
