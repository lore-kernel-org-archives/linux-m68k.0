From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Q40 interrupts (and genirq)
Date: Tue, 23 Aug 2011 11:16:40 +0200
Message-ID: <CAMuHMdV1bpFDkLyDsdkzgvQg6_C1Jf=hwR=VOVBObB19mhH6yA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-iy0-f170.google.com ([209.85.210.170]:63528 "EHLO
	mail-iy0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754957Ab1HWJQl convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 23 Aug 2011 05:16:41 -0400
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Richard Zidlicky <rz@linux-m68k.org>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>, linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>

Hi Richard,

I'm a bit puzzled by the Q40 interrupt architecture.

arch/m68k/q40/q40ints.c says:

 * Q40 IRQs are defined as follows:
 *            3,4,5,6,7,10,11,14,15 : ISA dev IRQs

Yep, that's _9_ interrupts.

 *            16-31: reserved
 *            32   : keyboard int
 *            33   : frame int (50/200 Hz periodic timer)
 *            34   : sample int (10/20 KHz periodic timer)

According to the Q40_IRQ*_MASK definitions (8 bits in the mask) and the=
 code
(e.g. q40_irq_startup()), ISA IRQ 11 is not implemented.

In the "new" interrupt code, by Roman Zippel, all interrupts sources ar=
e handled
through q40_irq_handler().
Only autovector IRQs IRQ_AUTO_2 and IRQ_AUTO_4 are enabled.

In the old (pre-2006) interrupt code, only internal (master) and ISA in=
terrupts
go through q40_irq2_handler on IRQ_AUTO_2.
Q40_IRQ_SAMPLE goes via both IRQ_AUTO_4 and IRQ_AUTO_6.

Why doesn't the new code use IRQ_AUTO_6? Does the new code work?

=46or the genirq conversion, I was first thinking about using a custom
chain-alike flow handler.
But it looks like this is not possible, as the Q40 handler remaps
autovector interrupts to
conflicting numbers (it handles IRQ_AUTO_4 =3D 4, but ISA interrupt 4 i=
s also 4).
So if the custom flow handler would call generic_handle_irq(4) for ISA
interrupt 4,
it would recurse into the flow handler set up for autovector IRQ 4 :-(
Changing the numbers is not trivial, as ISA assumes interrupts 1-15 eve=
rywhere.

So I'm afraid we're stuck with the current m68k_setup_auto_interrupt() =
hack,
which overwrites the lowest-level asm interrupt code, and keep the curr=
ent
q40_irq_handler() (This is similar to process_int() for 68328 on nommu)=
=2E

Thanks for your clarifications and suggestions!

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
