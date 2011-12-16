From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: Porting m68k/nommu to a new board.
Date: Fri, 16 Dec 2011 08:03:30 +0100
Message-ID: <CAMuHMdU+VCVxnawb8DHmZp1EfBGW6T5D0WyXRXpo8bj1bJZ+pg@mail.gmail.com>
References: <201112152137.29195.me@danielpalmer.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-ww0-f42.google.com ([74.125.82.42]:55266 "EHLO
	mail-ww0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751293Ab1LPHDc convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 16 Dec 2011 02:03:32 -0500
In-Reply-To: <201112152137.29195.me@danielpalmer.co.uk>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Daniel Palmer <me@danielpalmer.co.uk>
Cc: linux-kernel@vger.kernel.org, Linux/m68k <linux-m68k@vger.kernel.org>, uClinux development list <uclinux-dev@uclinux.org>

Added CCs.

On Fri, Dec 16, 2011 at 06:37, Daniel Palmer <me@danielpalmer.co.uk> wr=
ote:
> Hi,
>
> I'm building a custom machine based around a 68sec000 (Fully static 6=
8ec000).
> The "board" is a bunch of parts at the moment but I have written a wo=
rkable
> simulator for the machine which I am using as a testbed for testing t=
hings
> like my custom video, DMA controller etc before creating the hardware=
 versions
> in VHDL.
>
> I'm interested in getting mmu-less m68k linux (what used to be known =
as
> uclinux I guess, seems to be known as m68k/nommu now) running on the =
simulator
> and later on the real hardware.
>
> From what I can tell the nommu m68k port is still active. But does it=
 actually
> work? All the details on similar hardware (like the older Palm pilots=
, Atari
> machines) is pretty ancient, around 2.0. Does anyone have a machine r=
unning a
> recent kernel? Were there issues getting it running?
>
> I did a bit of digging in the source and doesn't look like it should =
be too
> difficult to add the specifics for my machine.. I have a 16550 style =
UART
> emulated for I/O so I don't need to write a framebuffer driver at the=
 moment.
> I'm open to any suggestions people have on how to approach this thoug=
h.
>
>
> Please CC me as I'm not subscribed.
>
> Thanks,
>
> Daniel
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kerne=
l" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =C2=A0http://vger.kernel.org/majordomo-info.ht=
ml
> Please read the FAQ at =C2=A0http://www.tux.org/lkml/

Gr{oetje,eeting}s,

=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-=
m68k.org

In personal conversations with technical people, I call myself a hacker=
=2E But
when I'm talking to journalists I just say "programmer" or something li=
ke that.
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0=C2=A0 -- Linus Torvalds
