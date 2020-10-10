Return-Path: <SRS0=tTa3=DR=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE961C43467
	for <linux-m68k@archiver.kernel.org>; Sat, 10 Oct 2020 23:09:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A9E9B20760
	for <linux-m68k@archiver.kernel.org>; Sat, 10 Oct 2020 23:09:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729162AbgJJW4o (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sat, 10 Oct 2020 18:56:44 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:44621 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730391AbgJJSwY (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sat, 10 Oct 2020 14:52:24 -0400
Received: from mail-qk1-f174.google.com ([209.85.222.174]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1McY0J-1jvqiF1tmP-00d1tv for <linux-m68k@lists.linux-m68k.org>; Sat, 10
 Oct 2020 20:52:18 +0200
Received: by mail-qk1-f174.google.com with SMTP id q63so14092051qkf.3
        for <linux-m68k@lists.linux-m68k.org>; Sat, 10 Oct 2020 11:52:18 -0700 (PDT)
X-Gm-Message-State: AOAM530zU6jLS0ByuFay0TkvaLqJubZWQlIp4EYIy/R2dxE8cKRpmok0
        y0YEg8lNe6y3EnD2T2EYfA+JYb21z325P9zeUWo=
X-Google-Smtp-Source: ABdhPJyHb97asLXMVebqtlWTvKZgLrTtP/hgQ4nxOJVaC7ZPWU+ccFfq4hg78Uvv2vpNcQYhAbXFOff6pGfcfHymFNw=
X-Received: by 2002:a05:620a:b13:: with SMTP id t19mr3306996qkg.3.1602355937246;
 Sat, 10 Oct 2020 11:52:17 -0700 (PDT)
MIME-Version: 1.0
References: <20201008154651.1901126-1-arnd@arndb.de> <20201008154651.1901126-14-arnd@arndb.de>
 <alpine.LNX.2.23.453.2010091900150.12@nippy.intranet>
In-Reply-To: <alpine.LNX.2.23.453.2010091900150.12@nippy.intranet>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Sat, 10 Oct 2020 20:52:01 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3rM7gJjdTtcKzr6yi15n6xs-yhEpmSOf3QHfahQwxqkw@mail.gmail.com>
Message-ID: <CAK8P3a3rM7gJjdTtcKzr6yi15n6xs-yhEpmSOf3QHfahQwxqkw@mail.gmail.com>
Subject: Re: [RFC 13/13] m68k: mac: convert to generic clockevent
To:     Finn Thain <fthain@telegraphics.com.au>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Tony Luck <tony.luck@intel.com>,
        Fenghua Yu <fenghua.yu@intel.com>,
        Greg Ungerer <gerg@linux-m68k.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Philip Blundell <philb@gnu.org>,
        Joshua Thompson <funaho@jurai.org>,
        Sam Creasey <sammy@sammy.net>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        Helge Deller <deller@gmx.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        John Stultz <john.stultz@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-ia64@vger.kernel.org,
        Parisc List <linux-parisc@vger.kernel.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:0qSiIA+gOxyliEY8AsKLkvftu3QeVkceEomb5mUQQlvuL14eFFW
 0p1wpx3RsTY76x3LxkhFO1+1W25Rf7GXk6WyNgOAoMXajZBI9V9l7vrSZiV8FkGmQOwM8CF
 6tboPTT7BifwxyGd3GRutZ3VRSyLxuj2syGJytDQBymUJyk4HFSHatovvBkr+S+4aZziuch
 r+mHXEckjqqFSGdPUDfEw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:mo1LKgcaXgM=:3W+tySmsAOUoz+ENA3iSmp
 Ah/Mkk+wwnTu7voHXgJw4ZKdpwxMwxfmVpNtVS2Fal5emzysnASYPLGEP4yam3QEbz/AMXL91
 8OdSd+ELhk+u/TrZY3L0atIvdl7B30EQ38VLGDsW0kfXpstqlW7phj5RWyqYt3SjVxbdhufDN
 AywudHVrrDn+3iHsUEjhvc37rxQybR2mjO8upK8Fd6y/O14AVJVK9crsq8nZRWmiVzpIrfDa2
 z2ahNcwEMKOY9yf/L6seFMK+DJev3+NaWnbSebfl+2ygc12kPa020fOlmTNrmeVovnrwOMjKZ
 VbPHBoQqvkDX6LRrbenyizHgD1+B/OiUXo9tCC1kOnR+Ot9OXHuQXRayGzGJUD0jgGBje0hud
 fywu6NGSqi5RI1a7rNKZD2jgkj0UX3SXzY5Zsmp1N6CxSY5fJlgn8U4nKxB47LU4No6XCPZ0n
 75ZZLNY+p+yT/+rWPwhA7ZQ+MPQdfnT/16H6Ldq7W0BoJCnozRP3SVlIEuaLbmDyxFczOzdbr
 oPfAdIRP1GRBg7Ofogvo98ejs+czX6YgRFiyiDelgWVc/lpVdo0UTFfM9FNdkpCUwkwq8LyJ8
 NNbk5+qNR9wON9nBhBowejm3lP7LrGiHENHGBPGS0YN+onbvA39bIj0xH4RzFd1IwK747wOaB
 FGlH+qUdCU3rQ6Cu0B1SbOS357cl/Y/+DWTHDPgdGrfVHn5IlraaWy23/8WoqrNnhX63jQxji
 bXhE8SKw6pY1/hAdOWO1mCH7B+UoIVUSYjM6w8/r1NjB2n54x2WcxJdFeNyRgk1Ssr1kr1zjK
 7lKH4zSKAxpnEhcYe9Alx0Wgn5EpdKVbvpn0LXZiraUgliN6D8TqE7BPIGnYLYiFaFLsWKY
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Sat, Oct 10, 2020 at 12:21 AM Finn Thain <fthain@telegraphics.com.au> wrote:
>
> Hi Arnd,
>
> Perhaps patch 13 does not belong in this series (?).
>
> All m68k platforms will need conversion before the TODO can be removed
> from Documentation/features/time/clockevents/arch-support.txt.

Yes, correct. I marked this patch as RFC instead of PATCH, as I'm
just trying to find out where it should be headed. I would hope the
other patches can just get merged.

> On m68k, HZ is fixed at 100. Without addressing that, would there be any
> benefit from adopting GENERIC_CLOCKEVENTS as per this RFC patch?

I don't think so, I mainly did it to see if there is a problem with mixing
the two modes, and I couldn't find any. The behavior seems unchanged
before and after my patch, the main difference being a few extra kilobytes
in kernel .text for the generic clockevents code.

> On Thu, 8 Oct 2020, Arnd Bergmann wrote:
>
> > Now that the infrastructure allows kernels to have both legacy timer
> > ticks and clockevent drivers in the same image, start by moving one
> > platform to generic clockevents.
> >
> > As qemu only supports the q800 platform among the classic m68k, use that
> > as an example.
> >
>
> Correct VIA emulation is suprisingly difficult, so this kind of work
> should be tested on real hardware.
>
> I say that because when I did the clocksource conversion for m68k I ran
> into a bug in QEMU (since fixed) and also because I once worked on some of
> the bugs in the emulated VIA device used in MAME/MESS.

Good point, though I would be surprised if anything went wrong with
this patch on real hardware but not in emulation, as all the register-level
interactions with the timer are the same.

Adding oneshot mode is a completely different matter though, that
clearly needs to be tested on real hardware.

> > I also tried adding oneshot mode, which was successful but broke the
> > clocksource. It's probably not hard to make it work properly, but this
> > is where I've stopped.
> >
>
> I'm not so sure that one timer is able to support both a clocksource
> driver and a clockevent driver. In some cases we may have to drop the
> clocksource driver (i.e. fall back on the jiffies clocksource).
>
> Anyway, even on Macs with only one VIA chip we still have two timers. So I
> think we should try to use Timer 1 as a freerunning clocksource and Timer
> 2 as a oneshot clock event. This may result in better accuracy and simpler
> code. This may require some experimentation though.

Ah, good. This is partly what I had been hoping for, as my patch
can be used as a starting point for that if you want to give it a go.

     Arnd
