From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: Chained vs. shared EtherNEC interrupts - was: Re: [SOLVED] Re:
 ARAnyM VMs with Debian hanging at 100% CPU usage
Date: Wed, 8 Aug 2012 14:10:03 +0200
Message-ID: <CAMuHMdWoq_M4yhuk8YK0+ibNXbwbZYDBu9WUfu+9cvvpvqQxpg@mail.gmail.com>
References: <CAOmrzkKiPdAjcN4Pp883Gzj0hnYh=kv0Lxwau8Fa38ZsOCVTCQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-vc0-f174.google.com ([209.85.220.174]:46041 "EHLO
	mail-vc0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757505Ab2HHMKE (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 8 Aug 2012 08:10:04 -0400
Received: by vcbfk26 with SMTP id fk26so636493vcb.19
        for <linux-m68k@vger.kernel.org>; Wed, 08 Aug 2012 05:10:03 -0700 (PDT)
In-Reply-To: <CAOmrzkKiPdAjcN4Pp883Gzj0hnYh=kv0Lxwau8Fa38ZsOCVTCQ@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: Thorsten Glaser <tg@mirbsd.de>, debian-68k@lists.debian.org, Linux/m68k <linux-m68k@vger.kernel.org>

Hi Michael,

On Mon, Jul 30, 2012 at 1:09 AM, Michael Schmitz <schmitzmic@gmail.com> wrote:
> Looks like it sort of works - but now I'm stuck at the very same point
> that got me
> to playing tricks with shared interrupts in the first place: the
> interrupt watchdog
> kicks in and disables the eip_interrupt handler.

Oops...

> The good news: sharing the timer interrupt with other devices (USB
> function on NetUSBee) is trival.
>
> And the EtherNEC still functions even after its interrupts have been
> disabled - how that works is a
> bit of a mystery to me, but who am I to argue with serendipity?
> Latency mushrooms to 50ms, and
> data rate drops from 70k/sec to 20k/sec but it's still alive.

My initial guess was that the transmit code also checks for received
packets somewhere, but I can't seem to find this in the code. Oh well...

> Geert - can we do anything other than using noirqdebug = 1 to ensure
> this doesn't impact on network
> performance?

Hmm, so we do need IRQF_SHARED inside an #ifdef.
If we can't convince Paul, that'll mean another 8390 driver. Sigh...

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
