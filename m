From: Michael Schmitz <schmitzmic@gmail.com>
Subject: Chained vs. shared EtherNEC interrupts - was: Re: [SOLVED] Re: ARAnyM
 VMs with Debian hanging at 100% CPU usage
Date: Mon, 30 Jul 2012 11:09:03 +1200
Message-ID: <CAOmrzkKiPdAjcN4Pp883Gzj0hnYh=kv0Lxwau8Fa38ZsOCVTCQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-ob0-f174.google.com ([209.85.214.174]:36867 "EHLO
	mail-ob0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753087Ab2G2XJE (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 29 Jul 2012 19:09:04 -0400
Received: by obbuo13 with SMTP id uo13so8035572obb.19
        for <linux-m68k@vger.kernel.org>; Sun, 29 Jul 2012 16:09:03 -0700 (PDT)
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Thorsten Glaser <tg@mirbsd.de>
Cc: debian-68k@lists.debian.org, Linux/m68k <linux-m68k@vger.kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>

Thorsten, Geert:

>>> I hear you - and I am still working on sanitizing the driver's
>>> interrupt use.
>>>
>>
>>
>> Oh, sounds like fun. Good luck! (ragnar76 is the one in need of
>> such drivers, he'd probably help testing, too.)
>>
>>
>
> Looks like I may have something working that will require a minimum of
> changes to the ne.c driver -
> need to run a few last tests though.

Looks like it sort of works - but now I'm stuck at the very same point
that got me
to playing tricks with shared interrupts in the first place: the
interrupt watchdog
kicks in and disables the eip_interrupt handler.

The good news: sharing the timer interrupt with other devices (USB
function on NetUSBee) is trival.

And the EtherNEC still functions even after its interrupts have been
disabled - how that works is a
bit of a mystery to me, but who am I to argue with serendipity?
Latency mushrooms to 50ms, and
data rate drops from 70k/sec to 20k/sec but it's still alive.

Geert - can we do anything other than using noirqdebug = 1 to ensure
this doesn't impact on network
performance?

Cheers,

  Michael
