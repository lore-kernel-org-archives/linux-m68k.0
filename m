From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [RFC] m68k: Update defconfigs for v3.9
Date: Fri, 24 May 2013 14:59:45 +0200
Message-ID: <CAMuHMdX5hqLUXqUZqhUqB7ErR5sR_-7FNxC2i6M__h0_L9M7Wg@mail.gmail.com>
References: <CAMuHMdVSqN6Bjn1Ph-8xzZ64HzAcj7oBA8B3GNE8PTessUzBkQ@mail.gmail.com>
	<alpine.LNX.2.00.1305241705020.3487@nippy.intranet>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pd0-f169.google.com ([209.85.192.169]:45542 "EHLO
	mail-pd0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753579Ab3EXM7p (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 24 May 2013 08:59:45 -0400
Received: by mail-pd0-f169.google.com with SMTP id y11so4144466pdj.28
        for <linux-m68k@vger.kernel.org>; Fri, 24 May 2013 05:59:45 -0700 (PDT)
In-Reply-To: <alpine.LNX.2.00.1305241705020.3487@nippy.intranet>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>, Debian m68k <debian-68k@lists.debian.org>

On Fri, May 24, 2013 at 9:27 AM, Finn Thain <fthain@telegraphics.com.au> wrote:
>> CONFIG_ADB_MACIISI                    : . . . . . y . . . . . y
>
> This is broken. It should be disabled because it will crash (unless it has
> fixed itself ;-)

Will disable.
If this is really broken, shall I mark ik BROKEN in Kconfig?

> I see that you have the pmac zilog serial console enabled, which is
> essential for Macs with either PMU v1 or IIsi ADB.
>
>> CONFIG_INPUT_M68K_BEEP                : m . m . . m . . m . . m
>> CONFIG_INPUT_MISC                     : y . y . y y . . y . . y
>
> Dunno if this works on Macs. I never tested it.

 arch/m68k/mac/config.c: mach_beep = mac_mksound;

so it should work ;-)

However, hp300 doesn't set mach_beep, so I'll disable it on hp300.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
