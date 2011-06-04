From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: m68k: Convert to genirq (WIP)
Date: Sat, 4 Jun 2011 19:56:56 +0200
Message-ID: <BANLkTimebx56-Wb5JPWxYVnND9gG8OVdsQ__37969.8517187082$1307210238$gmane$org@mail.gmail.com>
References: <alpine.DEB.2.00.1105282010370.16617@ayla.of.borg>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.00.1105282010370.16617@ayla.of.borg>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Linux/m68k <linux-m68k@lists.linux-m68k.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Linux Kernel Development <linux-kernel@vger.kernel.org>

On Sat, May 28, 2011 at 20:32, Geert Uytterhoeven <geert@linux-m68k.org=
> wrote:
> Now sparc32 has beaten me, I pushed out my work in progress of conver=
ting m68k
> to use the generic hardirq framework:
>
> git://git.kernel.org:/pub/scm/linux/kernel/git/geert/linux-m68k.git m=
68k-genirq
> http://git.kernel.org/?p=3Dlinux/kernel/git/geert/linux-m68k.git;a=3D=
shortlog;h=3Drefs/heads/m68k-genirq

> Next on my list is Amiga, which will cover autovectored and chained i=
nterrupts.

I rebased to 3.0-rc1 and added (not in that order):
  [10] m68k/irq: Add m68k_setup_irq_controller()
  [11] m68k/irq: Adding missing "irq" offset in m68k_setup_irq_controll=
er()
  [12] m68k/irq: Fix auto and user chips and handlers
  [13] m68k/amiga: Refactor amiints.c
  [14] m68k/amiga: Convert Amiga to genirq
  [15] m68k/amiga: Optimize interrupts using chain handlers

It works on Amiga now, too. It can still use some optimizations in the
irq_{enable,disable,ack,mask,mask_ack,unmask} area, as my BogoMIPS
rating dropped by ca 2.5% and is now under 16, for a 25 MHz 68040.

BTW, the second warning on Atari is still there.

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
