From: Michael Schmitz <schmitzmic@googlemail.com>
Subject: Re: Aranym, more than 244MB FastRAM, garbled display
Date: Mon, 4 Oct 2010 09:51:02 +0200
Message-ID: <AANLkTimcB7h2Q9RxbHUPAVQ850NCJTkemLaOWHEno5eR@mail.gmail.com>
References: <alpine.LNX.2.00.1010011728270.4788@halbrend.uninett.no>
	<m2tyl5u9hu.fsf@igel.home>
	<AANLkTind9=+een0ttr85FYdY6X+GDbiFSzqMKXEZoadb@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-ww0-f44.google.com ([74.125.82.44]:58880 "EHLO
	mail-ww0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753136Ab0JDHvE convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 4 Oct 2010 03:51:04 -0400
Received: by wwj40 with SMTP id 40so3763924wwj.1
        for <linux-m68k@vger.kernel.org>; Mon, 04 Oct 2010 00:51:02 -0700 (PDT)
In-Reply-To: <AANLkTind9=+een0ttr85FYdY6X+GDbiFSzqMKXEZoadb@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Andreas Schwab <schwab@linux-m68k.org>, =?ISO-8859-1?Q?Kolbj=F8rn_Barmen?= <linux-m68k@kolla.no>, Linux/m68k <linux-m68k@vger.kernel.org>

Hi,

>>> One thing I have noticed is that if I set FastRAM in aranym config =
to
>>> something higher than 244 I get garbled display, kinda like frozen =
random
>>> noise - the kernel does boot in the background though. I tried with
>>> different kernels (only up to 2.6.34 though), and with different ve=
rsions
>>> of aranym, but it didn't make much difference.
>>
>> I have always been using FastRAM =3D 256 without problems.
>
> Just checked, /me too!
>
> I have `video=3Datafb:tthigh` but removing that doesn't change anythi=
ng.
> Ah yes, it emulates a Falcon, so the tthigh is bogus ;-)

I've always used sthigh myself (force of habit, my Falcon wasn't too
happy with faster pixel clocks). tthigh used to work (sort of) when
the driver was ported to 2.6, but that's a few years back.

If I recall this right, allocation of boot memory changed later in 2.6
and drivers initializing after boit memory had been freed could not be
guaranteed to receive enough low memory for things like DMA buffers or
screen buffers.

The kernel will reserve a chunk of ST-RAM early on during arch init,
and I may have set that chunk size too small for high resolution. If
the ST-RAM allocator cannot resort to the reserved chunk of low
memory, it will allocate high memory for you. VIDEL then masks off the
high byte of the framebuffer address, and the screen will show
whatever the kernel happens to write to the 24 bit alias of the frame
buffer address.

=46astRAM should not be declared DMA-able so the allocator can properly
distinguish between the memory kinds. Doing this triggered some
problems in the memory management code that I could not disentangle,
hence the 'reserve some amount of boot memory' hack.

There might even be a kernel parameter like 'stram_reserve' to control
this behaviour, check the ST-RAM allocator code (my home PC is
unreachable, there's probably been a power outage again so I can't
check my git repo right now).

Cheers,

  Michael

>
> Gr{oetje,eeting}s,
>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linu=
x-m68k.org
>
> In personal conversations with technical people, I call myself a hack=
er. But
> when I'm talking to journalists I just say "programmer" or something =
like that.
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=A0 =A0=A0 -- =
Linus Torvalds
> --
> To unsubscribe from this list: send the line "unsubscribe linux-m68k"=
 in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
