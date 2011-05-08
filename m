From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] m68k/atari: Do not use "/" in interrupt names
Date: Sun, 8 May 2011 10:41:12 +0200
Message-ID: <BANLkTi=8hoPR-yR0dOa9AXaNWwbWFm-M6g@mail.gmail.com>
References: <alpine.DEB.2.00.1105041629390.2629@ayla.of.borg>
	<m3d3jybjf3.fsf@linux-m68k.org>
	<BANLkTind9TLfuyVmRnRZJotFPgOebwf-dw@mail.gmail.com>
	<BANLkTi=PKV23PqLMudno-kMRMr1_OgqaDQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <BANLkTi=PKV23PqLMudno-kMRMr1_OgqaDQ@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@googlemail.com>
Cc: Andreas Schwab <schwab@linux-m68k.org>, Linux/m68k <linux-m68k@lists.linux-m68k.org>

On Thu, May 5, 2011 at 06:33, Michael Schmitz <schmitzmic@googlemail.co=
m> wrote:
>>>> =C2=A0 =C2=A0 =C2=A0 error =3D request_irq(IRQ_MFP_ACIA, atari_key=
board_interrupt,
>>>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 IRQ_TYPE_SLOW, "keyboard/mouse/MIDI",
>>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 IRQ_TYPE_SLOW, "keyboard:mouse:MIDI",
>>>
>>> The name is not a path, but an enumeration, so the slash should pro=
bably
>>> be changed to a comma instead.
>>
>> I thought about that, but comma (albeit followed by a space) is also=
 used to
>> separate multiple interrupt handlers for shared interrupts.
>
> What about '//', '|' or ':'?
>
> Except for the atarilance one, these are sort of shared interrupt
> handlers so maybe the comma won't hurt after all.

OK, I'll go for the comma.

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
