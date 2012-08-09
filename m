From: Michael Schmitz <schmitzmic@gmail.com>
Subject: Re: Chained vs. shared EtherNEC interrupts - was: Re: [SOLVED] Re:
 ARAnyM VMs with Debian hanging at 100% CPU usage
Date: Thu, 9 Aug 2012 12:21:44 +1200
Message-ID: <CAOmrzk+j3QwJw6jJ0wcRoibik7fbDNS_3uqZphB6Ba80bTWKxQ@mail.gmail.com>
References: <CAOmrzkKiPdAjcN4Pp883Gzj0hnYh=kv0Lxwau8Fa38ZsOCVTCQ@mail.gmail.com>
	<CAMuHMdWoq_M4yhuk8YK0+ibNXbwbZYDBu9WUfu+9cvvpvqQxpg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-vc0-f174.google.com ([209.85.220.174]:62279 "EHLO
	mail-vc0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758674Ab2HIAVp (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 8 Aug 2012 20:21:45 -0400
Received: by vcbfk26 with SMTP id fk26so1392494vcb.19
        for <linux-m68k@vger.kernel.org>; Wed, 08 Aug 2012 17:21:44 -0700 (PDT)
In-Reply-To: <CAMuHMdWoq_M4yhuk8YK0+ibNXbwbZYDBu9WUfu+9cvvpvqQxpg@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Thorsten Glaser <tg@mirbsd.de>, debian-68k@lists.debian.org, Linux/m68k <linux-m68k@vger.kernel.org>

Hi Geert,

>> Looks like it sort of works - but now I'm stuck at the very same point
>> that got me
>> to playing tricks with shared interrupts in the first place: the
>> interrupt watchdog
>> kicks in and disables the eip_interrupt handler.
>
> Oops...

Indeed :-)


>> The good news: sharing the timer interrupt with other devices (USB
>> function on NetUSBee) is trival.
>>
>> And the EtherNEC still functions even after its interrupts have been
>> disabled - how that works is a
>> bit of a mystery to me, but who am I to argue with serendipity?
>> Latency mushrooms to 50ms, and
>> data rate drops from 70k/sec to 20k/sec but it's still alive.
>
> My initial guess was that the transmit code also checks for received
> packets somewhere, but I can't seem to find this in the code. Oh well...

Possible ... but I don't think it's all that important really.

>> Geert - can we do anything other than using noirqdebug = 1 to ensure
>> this doesn't impact on network
>> performance?
>
> Hmm, so we do need IRQF_SHARED inside an #ifdef.
> If we can't convince Paul, that'll mean another 8390 driver. Sigh...

No, if we cant't convince Paul we have to make sure irqdebug is not
used, disabled in the config or explicitly vetoed by the m68k arch
setup code (call the noirqdebug kernel option parser from
atari/config,c). Best would be to have a IRQF_BORKED flag to tell the
irqdebug code not to worry about unserviced interrupts.

Any chance to get this sort of stuff accepted by Linus?

(Kidding - I'd settle for a note in the docs to disable IRQ debugging.
In use for a few weeks on my Falcon, with no adverse effects).

I still need to separate the USB driver stuff out of my chained
interrupt patch, and possibly clean up checkpatch violations. Should
be done with that by this weekend. How long until the current merge
window closes?

Cheers,

  Michael
