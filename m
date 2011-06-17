From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: m68k: Convert to genirq (WIP)
Date: Fri, 17 Jun 2011 07:01:30 +0200
Message-ID: <BANLkTi=8eC3aiUL8fhGfQHW0xBrLF2TBCA@mail.gmail.com>
References: <alpine.DEB.2.00.1105282010370.16617@ayla.of.borg>
	<BANLkTimebx56-Wb5JPWxYVnND9gG8OVdsQ@mail.gmail.com>
	<BANLkTin+gp2Cnxj8kHbHRmuoEgyDR8YeaQ@mail.gmail.com>
	<BANLkTik5-H1fc2rk3QrwvQiF=7fELmE2CA@mail.gmail.com>
	<alpine.OSX.2.00.1106171337170.191@ibook.intranet>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <alpine.OSX.2.00.1106171337170.191@ibook.intranet>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: Linux/m68k <linux-m68k@lists.linux-m68k.org>, Thomas Gleixner <tglx@linutronix.de>, Linux Kernel Development <linux-kernel@vger.kernel.org>

On Fri, Jun 17, 2011 at 05:45, Finn Thain <fthain@telegraphics.com.au> =
wrote:
> On Thu, 16 Jun 2011, Geert Uytterhoeven wrote:
>> On Wed, Jun 15, 2011 at 21:44, Geert Uytterhoeven <geert@linux-m68k.=
org> wrote:
>> > On Sat, Jun 4, 2011 at 19:56, Geert Uytterhoeven <geert@linux-m68k=
=2Eorg> wrote:
>> >> On Sat, May 28, 2011 at 20:32, Geert Uytterhoeven <geert@linux-m6=
8k.org> wrote:
>> >>
>> >> It works on Amiga now, too. It can still use some optimizations i=
n
>> >> the irq_{enable,disable,ack,mask,mask_ack,unmask} area, as my
>> >> BogoMIPS rating dropped by ca 2.5% and is now under 16, for a 25 =
MHz
>> >> 68040.
>> >
>> > Seems like everything (Atari/ARAnyM and Amiga) still works when us=
ing
>> > handle_simple_irq instead of handle_level_irq. As a bonus, BogoMIP=
S is
>> > above 16 again.
>
> Your bogomips benchmark would be the best-case penalty, right?
>
> Have you tried say, sending a ping flood to measure throughput and
> latency?

No, I haven't compared network performance.

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
