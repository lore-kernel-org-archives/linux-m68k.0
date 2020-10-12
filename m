Return-Path: <SRS0=v436=DT=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EFC2C43467
	for <linux-m68k@archiver.kernel.org>; Mon, 12 Oct 2020 13:38:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 33A3B2074F
	for <linux-m68k@archiver.kernel.org>; Mon, 12 Oct 2020 13:38:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731102AbgJLNiD (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 12 Oct 2020 09:38:03 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:45959 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731061AbgJLNh3 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 12 Oct 2020 09:37:29 -0400
Received: from mail-qt1-f169.google.com ([209.85.160.169]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1MHWzP-1kfSY205Cr-00DXXn for <linux-m68k@lists.linux-m68k.org>; Mon, 12
 Oct 2020 15:37:27 +0200
Received: by mail-qt1-f169.google.com with SMTP id e6so3647686qtw.10
        for <linux-m68k@lists.linux-m68k.org>; Mon, 12 Oct 2020 06:37:26 -0700 (PDT)
X-Gm-Message-State: AOAM533boBbz2vbYS+SiRYYItit6ur4os47lqApgJeCKAWAZGVh36Qwl
        LcLknHHh21h7ZlFpQ6Anx8EOnMBz8AQSC73CLcQ=
X-Google-Smtp-Source: ABdhPJw6Xw5QPFz9Hbm4r+y0vTuo5ru8d6HOL66whTmsLJNolGIOqnjXdgx88Su9kNbZVfsNfxwFqVNIjbZi+UQICLY=
X-Received: by 2002:ac8:64a:: with SMTP id e10mr9800808qth.142.1602509845710;
 Mon, 12 Oct 2020 06:37:25 -0700 (PDT)
MIME-Version: 1.0
References: <20201008154651.1901126-1-arnd@arndb.de> <20201008154651.1901126-12-arnd@arndb.de>
 <CAMuHMdU7bn7rzG-0xzr4St1uArGoOhw6dy7HCkrHRvYqM38Wxg@mail.gmail.com>
In-Reply-To: <CAMuHMdU7bn7rzG-0xzr4St1uArGoOhw6dy7HCkrHRvYqM38Wxg@mail.gmail.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Mon, 12 Oct 2020 15:37:09 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2hY+Vc3S32KKBJj7gUaUFQb4=rKsRJwCwhAbYP7CakzA@mail.gmail.com>
Message-ID: <CAK8P3a2hY+Vc3S32KKBJj7gUaUFQb4=rKsRJwCwhAbYP7CakzA@mail.gmail.com>
Subject: Re: [PATCH 11/13] timekeeping: remove xtime_update
To:     Geert Uytterhoeven <geert@linux-m68k.org>
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
X-Provags-ID: V03:K1:VMYDQz35POxwS0fbSLm1B4h1AtTF+yK3BNZhrdkd3/sCLR7sf2Q
 +JnMpsHP1n/qggTTw239olKazcTSwInAPrqbjssSuKe1/2yLSPKg2G3mduocFKcgD/tnBRy
 VhIxLIpjw/SxeI2iH1juM5Az8Dv2C4skIW8gOmgYFVDVmgRbKw8hJjqrGBBLy9q7fwj1JoI
 ZpgKGG1nsdLqZcJ66/06A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:3ybFpVO3m7s=:aUouKZTfN73IpoPAadhIiB
 5L5lDkjrA8bhfo4CiyZFoQJ81uYmQJ9FaS4miwa1+csFv6zBhJUfUB15e1P0mOFRWRc67MEzY
 RKBe1mxJyD7jK7vzku1ANImUVMJYnbHk/qNhxN51jMBQ3OR7arNKcviafipIIHVpbQgrbenzB
 AzHzCR5xjwiWcdObcbFZUA7xiQRBJODLUDEK4PJYD2+spmiG/xunKfnTZ5o79AMRUjbJdnobP
 f7aCr8AKb8GPPS1reJbS9Rl0czHgr73ZuzUsChJW0YZdeBpY5Xo7LgnWpS8gpGphI8bx4+nOU
 I6xXeQa368CVoHBIJdwZf7opOiDlHzOLQv0pe9vnvaXyAlqgZu415pfyZgVzwQw+YnHQazFoF
 L2fohSm6ObKs7zhgSNrIFps2+LLjW2is2Aub/wyLkoF98g5jyYVArCd2bhX1blTyvgHvk2/xS
 1QoRGm9UWMY11mtcx9lU9EoYTh65EklrQQ2ERN96DgbUAoMmfjjs4n8Ur4ig2tiop0SYOtNuy
 tAXz/pbduXLWV3cHy5IztgMINK/wUuODVseTtHTP+ZKQ/tH/BEUflp/lMiKu1/HnvCmlTgfS7
 wNdrk2+0N2+a6tLuFyKXlDe9S83ArBkvASAGgG2uS+8Fbyp9P2V8YuksZAeZya63a47g6aGEO
 7WbMvWoWeFxcZBFAEt+2O7IHLs9x++tEBjBKtkSraLdKZ9liWwmGEK9XiKaKtrdLprdgPF9jX
 3Nk8xcF3nAUVxElF0ohb5uiMp0o4Y7oY4P9BK8KZaqrNCxy6ANI7wZfLRpzRjn82mH+YVNhha
 yan3IzU9oKfEKWKgyWw+ogcB/nxShVD2OdUAtiIbtEYN6krmgAhpzHyrYu6gHa6vOdtOkw7yf
 nraKJP67QJEvLwXljiGB2ObWURTMSl0k1mSjRyRk4LjboiRaKowGUo4CDxk0xgrRJ+Z2T+oY+
 fpmV+sXPZ2pRjt/m5ktiyKG5ye+ITnP0D2l/FSnsWtE4CPvr2HUDx
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Mon, Oct 12, 2020 at 3:16 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Thu, Oct 8, 2020 at 5:48 PM Arnd Bergmann <arnd@arndb.de> wrote:
> > There are no more users of xtime_update aside from legacy_timer_tick(),
> > so fold it into that function and remove the declaration.
> >
> > update_process_times() is now only called inside of the kernel/time/
> > code, so the declaration can be moved there.
> >
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>
> Thanks for your patch!
>
> Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
>
> The comment about xtime_update() in arch/ia64/kernel/time.c needs
> an update.

I think the correct action for ia64 would be to make it a
proper clockevent driver with oneshot support, and remove
the rest of this logic.

I could try to rewrite the comment, but I tried not to touch that
part since I don't understand the logic behind it. Maybe the
ia64 maintainers can comment here why it even tries to skip
a timer tick. Is there a danger of ending up with the timer irq
permanently disabled if the timer_interrupt() function returns
with the itm register in the past, or is this simply about not having
too many interrupts in a row?

> Does the comment about update_process_times() in
> arch/openrisc/kernel/time.c needs an update, too?

I think that one is still technically correct.

       Arnd
