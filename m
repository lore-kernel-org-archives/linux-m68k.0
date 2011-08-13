From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: m68k: [v3] Convert to genirq (WIP)
Date: Sat, 13 Aug 2011 22:09:07 +0200
Message-ID: <CAMuHMdVyWB6xzDemYDgn0ATh+btCKY-uQvrHwJWs7uOwoBL1OA@mail.gmail.com>
References: <CAMuHMdU=wG=yv-EjfFhDC_jO5GMva3JMa=J2tST_nnWPXEfAow@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-iy0-f170.google.com ([209.85.210.170]:54307 "EHLO
	mail-iy0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750852Ab1HMUJI convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sat, 13 Aug 2011 16:09:08 -0400
In-Reply-To: <CAMuHMdU=wG=yv-EjfFhDC_jO5GMva3JMa=J2tST_nnWPXEfAow@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Linux/m68k <linux-m68k@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>
Cc: linux-kernel@vger.kernel.org

On Sat, Aug 13, 2011 at 20:50, Geert Uytterhoeven <geert@linux-m68k.org=
> wrote:
> I rebased and updated my m68k-genirq branch at
>
> git://git.kernel.org:/pub/scm/linux/kernel/git/geert/linux-m68k.git m=
68k-genirq
> http://git.kernel.org/?p=3Dlinux/kernel/git/geert/linux-m68k.git;a=3D=
shortlog;h=3Drefs/heads/m68k-genirq
>
> [PATCH 01/16] ide-{cd,floppy,tape}, keyboard: Do not include <linux/i=
rq.>
> [PATCH 02/16] m68k/irq: Rename irq_controller to irq_chip
> [PATCH 03/16] m68k/irq: Kill irq_node_t typedef, always use struct ir=
q_node
> [PATCH 04/16] m68k/irq: Rename irq_node to irq_data
> [PATCH 05/16] m68k/irq: Switch irq_chip methods to "struct irq_data *=
data"
> [PATCH 06/16] m68k/irq: Rename setup_irq() to m68k_setup_irq() and
> make it static
> [PATCH 07/16] m68k/irq: Extract irq_set_chip()
> [PATCH 08/16] m68k/irq: Add m68k_setup_irq_controller()
> [PATCH 09/16] m68k/irq: Rename {,__}m68k_handle_int()
> [PATCH 10/16] m68k/irq: Remove obsolete IRQ_FLG_* definitions and use=
rs
> [PATCH 11/16] m68k/irq: Add genirq support
> [PATCH 12/16] m68k/atari: Convert Atari to genirq
> [PATCH 13/16] m68k/amiga: Refactor amiints.c
> [PATCH 14/16] m68k/amiga: Convert Amiga to genirq
> [PATCH 15/16] m68k/amiga: Optimize interrupts using chain handlers
> [PATCH 16/16] m68k/mac: Convert Mac to genirq
>
> Changes:
> =C2=A0- Some more refactoring to ease the conversion,
> =C2=A0- (now trivial) Conversion of Mac, which is still untested.

> Remaining platforms to convert:
>   - HP300: Just autovectored interrupts, should be trivial to convert
>   - VME: vectored user interrupts, should be trivial to convert

As HP300 and VME turned out to be really easy (but untested due to lack=
 of
hardware), I added two more commits:

[PATCH 17/18] m68k/hp300: Convert HP9000/300 and HP9000/400 to genirq
[PATCH 18/18] m68k/vme: Convert VME to genirq

> Remaining platforms to convert:
> =C2=A0- Apollo: ISA interrupts, mapped to vectored user interrupts
> =C2=A0- Q40: weirdest of all m68k platforms?
> =C2=A0- Sun3/3x: autovector and vectored user interrupts, overriding =
of standard
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 interrupt handlers

These all pass non-NULL handlers to m68k_setup_{auto,user}_interrupt().

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
