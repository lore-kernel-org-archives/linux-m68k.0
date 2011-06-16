From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: m68k: Convert to genirq (WIP)
Date: Thu, 16 Jun 2011 21:30:56 +0200
Message-ID: <BANLkTik5-H1fc2rk3QrwvQiF=7fELmE2CA@mail.gmail.com>
References: <alpine.DEB.2.00.1105282010370.16617@ayla.of.borg>
	<BANLkTimebx56-Wb5JPWxYVnND9gG8OVdsQ@mail.gmail.com>
	<BANLkTin+gp2Cnxj8kHbHRmuoEgyDR8YeaQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <BANLkTin+gp2Cnxj8kHbHRmuoEgyDR8YeaQ@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Linux/m68k <linux-m68k@lists.linux-m68k.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Linux Kernel Development <linux-kernel@vger.kernel.org>

On Wed, Jun 15, 2011 at 21:44, Geert Uytterhoeven <geert@linux-m68k.org=
> wrote:
> On Sat, Jun 4, 2011 at 19:56, Geert Uytterhoeven <geert@linux-m68k.or=
g> wrote:
>> On Sat, May 28, 2011 at 20:32, Geert Uytterhoeven <geert@linux-m68k.=
org> wrote:
>>> Now sparc32 has beaten me, I pushed out my work in progress of conv=
erting m68k
>>> to use the generic hardirq framework:
>>>
>>> git://git.kernel.org:/pub/scm/linux/kernel/git/geert/linux-m68k.git=
 m68k-genirq
>>> http://git.kernel.org/?p=3Dlinux/kernel/git/geert/linux-m68k.git;a=3D=
shortlog;h=3Drefs/heads/m68k-genirq
>>
>>> Next on my list is Amiga, which will cover autovectored and chained=
 interrupts.
>>
>> I rebased to 3.0-rc1 and added (not in that order):
>> =C2=A0[10] m68k/irq: Add m68k_setup_irq_controller()
>> =C2=A0[11] m68k/irq: Adding missing "irq" offset in m68k_setup_irq_c=
ontroller()
>> =C2=A0[12] m68k/irq: Fix auto and user chips and handlers
>> =C2=A0[13] m68k/amiga: Refactor amiints.c
>> =C2=A0[14] m68k/amiga: Convert Amiga to genirq
>> =C2=A0[15] m68k/amiga: Optimize interrupts using chain handlers
>>
>> It works on Amiga now, too. It can still use some optimizations in t=
he
>> irq_{enable,disable,ack,mask,mask_ack,unmask} area, as my BogoMIPS
>> rating dropped by ca 2.5% and is now under 16, for a 25 MHz 68040.
>
> Seems like everything (Atari/ARAnyM and Amiga) still works when using
> handle_simple_irq instead of handle_level_irq.
> As a bonus, BogoMIPS is above 16 again.

With handle_simple_irq(), we no longer need to define irq_{,un}mask() m=
ethods
in our irq_chips. Hence the "old" m68k platform interrupt code seems to=
 be much
closer to genirq than I thought...

Does this make sense?

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
