From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: m68k: Convert to genirq (WIP)
Date: Sun, 19 Jun 2011 15:36:58 +0200
Message-ID: <BANLkTimWnDmKx2bh7T+V_x-pPj47faLJfw__25552.0651619465$1308490962$gmane$org@mail.gmail.com>
References: <alpine.DEB.2.00.1105282010370.16617@ayla.of.borg>
	<BANLkTinDvLqHChPUpG9v1AXp0E=iRLteDg@mail.gmail.com>
	<m2sjr8gyp0.fsf@igel.home>
	<BANLkTikxzQSXLfr81q+b1rScW8YCcoJZRQ@mail.gmail.com>
	<m2mxhejcgm.fsf@igel.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <m2mxhejcgm.fsf@igel.home>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: Michael Schmitz <schmitzmic@googlemail.com>, Thomas Gleixner <tglx@linutronix.de>, Linux Kernel Development <linux-kernel@vger.kernel.org>, Linux/m68k <linux-m68k@lists.linux-m68k.org>

On Sun, Jun 19, 2011 at 13:19, Andreas Schwab <schwab@linux-m68k.org> w=
rote:
> Geert Uytterhoeven <geert@linux-m68k.org> writes:
>
>> BUG_ON(!irqs_disabled()) triggers as flags is 0x2619 there.
>
> Which is correct, since arch_local_irq_disable would set it to 2719.
> You need to find out why arch_local_irq_disable wasn't called.

I don't think we ever explicitly disable interrupts in interrupt handle=
rs.
The CPU disables all interupts of the same or lower level anyway.
As all Atari interrupts (except for hblank and vblank) run at level 6,
this is why flags & 0x700 =3D=3D 0x600 above.

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
