From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: m68k: Convert to genirq (WIP)
Date: Sun, 19 Jun 2011 12:17:34 +0200
Message-ID: <BANLkTikxzQSXLfr81q+b1rScW8YCcoJZRQ__24426.6479662203$1308480226$gmane$org@mail.gmail.com>
References: <alpine.DEB.2.00.1105282010370.16617@ayla.of.borg>
	<BANLkTinDvLqHChPUpG9v1AXp0E=iRLteDg@mail.gmail.com>
	<m2sjr8gyp0.fsf@igel.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <m2sjr8gyp0.fsf@igel.home>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: Michael Schmitz <schmitzmic@googlemail.com>, Thomas Gleixner <tglx@linutronix.de>, Linux Kernel Development <linux-kernel@vger.kernel.org>, Linux/m68k <linux-m68k@lists.linux-m68k.org>

On Fri, Jun 17, 2011 at 19:22, Andreas Schwab <schwab@linux-m68k.org> w=
rote:
> Geert Uytterhoeven <geert@linux-m68k.org> writes:
>
>> This is the WARN_ONCE(!irqs_disabled()) check.
>>
>> static inline bool arch_irqs_disabled_flags(unsigned long flags)
>> {
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 return (flags & ~ALLOWINT) !=3D 0;
>
> That should be
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return (flags & 0x700) =3D=3D 0x700=
;
>
> It doesn't make sense to use ALLOWINT here, since arch_local_irq_disa=
ble
> doesn't use it either.

Unfortunately this makes it worse:

| Calibrating delay loop... kernel BUG at kernel/posix-cpu-timers.c:131=
4!

BUG_ON(!irqs_disabled()) triggers as flags is 0x2619 there.

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
