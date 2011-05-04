From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] m68k/atari: Do not use "/" in interrupt names
Date: Wed, 4 May 2011 19:45:37 +0200
Message-ID: <BANLkTind9TLfuyVmRnRZJotFPgOebwf-dw__25045.2682878406$1304531159$gmane$org@mail.gmail.com>
References: <alpine.DEB.2.00.1105041629390.2629@ayla.of.borg>
	<m3d3jybjf3.fsf@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <m3d3jybjf3.fsf@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: Linux/m68k <linux-m68k@lists.linux-m68k.org>, Linux Kernel Development <linux-kernel@vger.kernel.org>

On Wed, May 4, 2011 at 17:00, Andreas Schwab <schwab@linux-m68k.org> wr=
ote:
> Geert Uytterhoeven <geert@linux-m68k.org> writes:
>> diff --git a/arch/m68k/atari/atakeyb.c b/arch/m68k/atari/atakeyb.c
>> index e1ada31..779efdc 100644
>> --- a/arch/m68k/atari/atakeyb.c
>> +++ b/arch/m68k/atari/atakeyb.c
>> @@ -572,7 +572,7 @@ int atari_keyb_init(void)
>> =C2=A0 =C2=A0 =C2=A0 kb_state.len =3D 0;
>>
>> =C2=A0 =C2=A0 =C2=A0 error =3D request_irq(IRQ_MFP_ACIA, atari_keybo=
ard_interrupt,
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 IRQ_TYPE_SLOW, "keyboard/mouse/MIDI",
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 IRQ_TYPE_SLOW, "keyboard:mouse:MIDI",
>
> The name is not a path, but an enumeration, so the slash should proba=
bly
> be changed to a comma instead.

I thought about that, but comma (albeit followed by a space) is also us=
ed to
separate multiple interrupt handlers for shared interrupts.

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
