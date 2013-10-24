From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: Zero Divide in Kernel 3.12-rc4
Date: Thu, 24 Oct 2013 10:37:44 +0200
Message-ID: <CAMuHMdX_hbDzak-y0CMbdXUhgdQCCoGOeyaCH_DE2C7E3gLi7A@mail.gmail.com>
References: <dbbdc369c25c9eea7abc4ca331128de3@muaddib.hro.localnet>
	<f8389c591d50fe216b546e70d464c1f9@biophys.uni-duesseldorf.de>
	<CAMuHMdVfvDAuqpTFFq5qQK2Prio55i2bmcne-eu_VQt5xFY-LQ@mail.gmail.com>
	<335d2ba0b0b19e56b2880882a1c4c543@biophys.uni-duesseldorf.de>
	<9f57bf0fdf7329055ee5f7d2b2fe966d@biophys.uni-duesseldorf.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pd0-f174.google.com ([209.85.192.174]:58874 "EHLO
	mail-pd0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753903Ab3JXIho (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 24 Oct 2013 04:37:44 -0400
Received: by mail-pd0-f174.google.com with SMTP id y13so2623671pdi.5
        for <linux-m68k@vger.kernel.org>; Thu, 24 Oct 2013 01:37:44 -0700 (PDT)
In-Reply-To: <9f57bf0fdf7329055ee5f7d2b2fe966d@biophys.uni-duesseldorf.de>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>
Cc: Debian m68k <debian-68k@lists.debian.org>, Linux/m68k <linux-m68k@vger.kernel.org>, tuomas.vainikka@kopteri.net, =?UTF-8?Q?Ingo_J=C3=BCrgensmann?= <ij@2013.bluespice.org>

On Tue, Oct 22, 2013 at 10:38 PM, Michael Schmitz
<schmitz@biophys.uni-duesseldorf.de> wrote:
>>>> To pinpoint where in sd_completed_bytes this happens, I'd need the
>>>> sd_mod
>>>> module and the module symbol map.
>>>
>>>
>>>                 /* be careful ... don't want any overflows */
>>>                 u64 factor = scmd->device->sector_size / 512;
>>>                 do_div(start_lba, factor);
>>>                 do_div(end_lba, factor);
>>>
>>> scmd->device->sector_size should be 512, so factor should be 1.
>
>
> Looking at a bit of context right above what you quote here, we can be
> reasonably certain that scmd->device->sector_size is greater or equal 512.

Stupid me, I missed that check ;-)

Perhaps the "u64" is still an issue there, despite Andreas' fix for do_div()?

> Ingo - could you add
>
> if (scmd->device->sector_size > 2048)
>         sdev_printk(KERN_ERR, scmd->device, "Whoa - large secor size %d\n",
> scmd->device->sector_size);
>
> before the do_div calls, and see what that reports?

Anyway, if it triggers again, I'd like to see the real kernel binary
that matches
the crash log.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
