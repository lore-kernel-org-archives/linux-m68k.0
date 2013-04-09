From: Michael Schmitz <schmitzmic@gmail.com>
Subject: Re: [PATCH 0/13] Atari EtherNAT/EtherNEC/NetUSBee support
Date: Wed, 10 Apr 2013 09:41:05 +1200
Message-ID: <CAOmrzkK9igQScFoujYsnmBAf1mTGUvwqsEat48MyrsVGt99vWg@mail.gmail.com>
References: <1365208006-16227-1-git-send-email-schmitz@debian.org>
	<CAMuHMdVv_EAsRUV9FRLmnR5DzaBmW9dPABiMMpuc43G0anMKxw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-we0-f182.google.com ([74.125.82.182]:56605 "EHLO
	mail-we0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S934470Ab3DIVlH (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 9 Apr 2013 17:41:07 -0400
Received: by mail-we0-f182.google.com with SMTP id k14so5869863wer.27
        for <linux-m68k@vger.kernel.org>; Tue, 09 Apr 2013 14:41:06 -0700 (PDT)
In-Reply-To: <CAMuHMdVv_EAsRUV9FRLmnR5DzaBmW9dPABiMMpuc43G0anMKxw@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>

Hi Geert,

trying again as plain text ...

>
> On Sat, Apr 6, 2013 at 2:26 AM, Michael Schmitz <schmitzmic@gmail.com> wrote:
> > here's my rewrite of the Atari patch series for upstream submission -
> > the only changes are to patches 9 and 12.
> >
> > The USB patch no longer disables the chip interrupt in the interrupt
> > handler - it turns out this wasn't necessary at all. It also does away
> > with direct writes to the EtherNAT interrupt control register, and uses
> > enable_irq() and disable_irq() instead. The probe code has become a lot
> > cleaner as a result.
>
> Thanks, I applied all of them, with some minor changes:
>   - Changed one instance of ATARI to ATARI_ETHERNAT in
>     drivers/net/ethernet/smsc/Kconfig, for consistency,
>   - Split too long comments,
>   - Made platform device structures and isp1160_delay() in
>     arch/m68k/atari/config.c depend on the appropriate CONFIG_* symbols, else
>     you get unused warnings from the compiler if CONFIG_ETHERNAT and/or
>     CONFIG_ETHERNEC are not set.
>

Thanks, that's perfect!

>
> I also updated your old series for the m68k master branch to the
> latest corresponding
> version for upstream, so master == m68k-queue.
>

 Much appreciated! I'll look forward to pulling this back and
resolving the differences now.


> Please send the patches for drivers/net and drivers/usb to the net resp. usb
> mailing lists, to collects acks and comments.


Will do that ASAP!

Thanks,

    Michael



On Wed, Apr 10, 2013 at 8:55 AM, Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> Hi Michael,
>
> On Sat, Apr 6, 2013 at 2:26 AM, Michael Schmitz <schmitzmic@gmail.com> wrote:
>> here's my rewrite of the Atari patch series for upstream submission -
>> the only changes are to patches 9 and 12.
>>
>> The USB patch no longer disables the chip interrupt in the interrupt
>> handler - it turns out this wasn't necessary at all. It also does away
>> with direct writes to the EtherNAT interrupt control register, and uses
>> enable_irq() and disable_irq() instead. The probe code has become a lot
>> cleaner as a result.
>
> Thanks, I applied all of them, with some minor changes:
>   - Changed one instance of ATARI to ATARI_ETHERNAT in
>     drivers/net/ethernet/smsc/Kconfig, for consistency,
>   - Split too long comments,
>   - Made platform device structures and isp1160_delay() in
>     arch/m68k/atari/config.c depend on the appropriate CONFIG_* symbols, else
>     you get unused warnings from the compiler if CONFIG_ETHERNAT and/or
>     CONFIG_ETHERNEC are not set.
>
> I also updated your old series for the m68k master branch to the
> latest corresponding
> version for upstream, so master == m68k-queue.
>
> Please send the patches for drivers/net and drivers/usb to the net resp. usb
> mailing lists, to collects acks and comments.
>
> Thanks again!
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
