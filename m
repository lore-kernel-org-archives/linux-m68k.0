Return-Path: <SRS0=v436=DT=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1495DC433DF
	for <linux-m68k@archiver.kernel.org>; Mon, 12 Oct 2020 20:33:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C207420BED
	for <linux-m68k@archiver.kernel.org>; Mon, 12 Oct 2020 20:33:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729978AbgJLUdq (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 12 Oct 2020 16:33:46 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:42407 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729476AbgJLUdq (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 12 Oct 2020 16:33:46 -0400
Received: by mail-ot1-f67.google.com with SMTP id m13so16992209otl.9
        for <linux-m68k@lists.linux-m68k.org>; Mon, 12 Oct 2020 13:33:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WHj2EuQ6Y9UuZUdPKYmroHd7gs7p/Zz8/iUe6juJ+/s=;
        b=sP0ViinfeYTut6iq2DOaWaLg56SPbwDCVw9Zlo7dmydj3RA0imG3anfyJ6O6VsomHM
         UNKMr6gjm7DPeKImec+Dd3ffwDz5MB+U7QXpDBpCsnvVdmc5r+mGFW6vecJx6ViEBesZ
         god07xEky84kWc46Vi8yuaVBnNLUpistHRVmDsF1zr3C3BQalxrn/nEF2FHpksosTKs0
         R2o6H/dY3VWDJYeGku7TGtJShzoDB94RZDr2Sqpl3Sa/71jP5sqJKdb0+5T5u2P0gyOB
         cv/2qXZIuzd6McBVjsYzYkq9TGBF/QuYPIpKSgVRFXEBXIxmXoqNATBO19hS+lf0M3kv
         7NjQ==
X-Gm-Message-State: AOAM533lf6Xtknmcf4pq9BYztOoAAlPqa3xl3SJUqjFR5adIAclUFn3R
        DcVBrTgLI7Nhu9xKiPhebOhTRhlC/5PYB/9cEL4=
X-Google-Smtp-Source: ABdhPJxRQUPv4QRU6bGXQ32mHjNH8DlCArC4gpcRZuNH1X3e73U3xKZSxcyGyJ5QbmACZ01+5UvtW70qVpcHzevNLb8=
X-Received: by 2002:a05:6830:210a:: with SMTP id i10mr19468668otc.145.1602534825338;
 Mon, 12 Oct 2020 13:33:45 -0700 (PDT)
MIME-Version: 1.0
References: <20201008154651.1901126-1-arnd@arndb.de> <20201008154651.1901126-9-arnd@arndb.de>
 <CAMuHMdWtMZaJ8ETb4g+AfaLeSZ1vyi8-POEaRzmdwh3ha=jieA@mail.gmail.com> <CAK8P3a1nDZYYwtuniUGxmy=H8LHbOEGSU=Pmi2=LMrLw09x8+w@mail.gmail.com>
In-Reply-To: <CAK8P3a1nDZYYwtuniUGxmy=H8LHbOEGSU=Pmi2=LMrLw09x8+w@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 12 Oct 2020 22:33:34 +0200
Message-ID: <CAMuHMdXn=1Gsn6hS72BoJ0jZwTVv_nurV0zCdSpUKJ6T5BL=Rg@mail.gmail.com>
Subject: Re: [PATCH 08/13] m68k: m68328: use legacy_timer_tick()
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Tony Luck <tony.luck@intel.com>,
        Fenghua Yu <fenghua.yu@intel.com>,
        Greg Ungerer <gerg@linux-m68k.org>,
        Finn Thain <fthain@telegraphics.com.au>,
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
        "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
        Parisc List <linux-parisc@vger.kernel.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Arnd,

On Mon, Oct 12, 2020 at 5:31 PM Arnd Bergmann <arnd@arndb.de> wrote:
> On Mon, Oct 12, 2020 at 3:15 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > Given this feature is SoC-specific, not platform-specific, perhaps
> > it makes sense to move the selects to the M68{,EZ,VZ}328 symbols?
> >
> > Regardless:
> > Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
>
> Ok, folded in the change blow, using one less line. I couldn't figure

Thanks, looks good.

> out whether
> it should just be part of the CONFIG_M68000 instead, which doesn't appear

It must definitely not be selected by CONFIG_M68000, as the plain MC68000
is a CPU, not an SoC, and does not have the timer.

> to have any machine support by itself. The dragonball CPU configuration
> looks really odd, because you have to build exactly one of M68{,EZ,VZ}328
> into the kernel to get a successful compilation, while Kconfig allows
> many other combinations.

While CONFIG_M68000 could be used for a "pure" MC68000-based machine,
I believe we don't support any yet.
M68{,EZ,VZ}328 select M68000 as they are SoCs containing a 68000
CPU core.
Other m68k SoCs have a CPU32 core, which is a simplified 68020 CPU core
(hmm, what happened to 68360 support? Oh, removed in 2016, so nothing
selects CPU32 anymore).

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
