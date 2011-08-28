From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: m68k: [v5] Convert to genirq (WIP)
Date: Sun, 28 Aug 2011 09:53:22 +0200
Message-ID: <CAMuHMdXk6_1CO8mvfNtbjf3V0Awh=zFYOcrpbUe2-pZkL5knxQ@mail.gmail.com>
References: <CAMuHMdUZe0Y55ZPee+umJdEsmY5X-EB-KoC-w-SGEtbPMAcf3g@mail.gmail.com>
	<alpine.OSX.2.00.1108271506320.190@ibook.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <alpine.OSX.2.00.1108271506320.190@ibook.local>
Sender: linux-kernel-owner@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>, linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>
List-Id: linux-m68k@vger.kernel.org

On Sun, Aug 28, 2011 at 04:08, Finn Thain <fthain@telegraphics.com.au> =
wrote:
> On Fri, 26 Aug 2011, Geert Uytterhoeven wrote:
>> - [PATCH 18/24]: m68k/mac: Optimize interrupts using chain handlers =
(NEW)
>
> That patch has a mistake --
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0irq_set_chained_handler(IRQ_AUTO_4, psc_ir=
q);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0irq_set_handler_data(IRQ_AUTO_3, (void *)0=
x40);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0irq_set_chained_handler(IRQ_AUTO_5, psc_ir=
q);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0irq_set_handler_data(IRQ_AUTO_3, (void *)0=
x50);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0irq_set_chained_handler(IRQ_AUTO_6, psc_ir=
q);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0irq_set_handler_data(IRQ_AUTO_3, (void *)0=
x60);
>
> should be
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0irq_set_chained_handler(IRQ_AUTO_4, psc_ir=
q);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0irq_set_handler_data(IRQ_AUTO_4, (void *)0=
x40);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0irq_set_chained_handler(IRQ_AUTO_5, psc_ir=
q);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0irq_set_handler_data(IRQ_AUTO_5, (void *)0=
x50);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0irq_set_chained_handler(IRQ_AUTO_6, psc_ir=
q);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0irq_set_handler_data(IRQ_AUTO_6, (void *)0=
x60);

Woops, of course. Thanks!

> On one VIA-based machine that I tested, !CONFIG_USE_GENERIC_HARDIRQS
> gives:
>
> # cat /proc/interrupts
> auto =C2=A0 =C2=A0 =C2=A0 1: =C2=A0 =C2=A0 =C2=A0 2299 via1
> auto =C2=A0 =C2=A0 =C2=A0 2: =C2=A0 =C2=A0 =C2=A0 3876 via2
> auto =C2=A0 =C2=A0 =C2=A0 4: =C2=A0 =C2=A0 =C2=A0 =C2=A0562 SCC
> auto =C2=A0 =C2=A0 =C2=A0 7: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00 NMI
> mac =C2=A0 =C2=A0 =C2=A0 10: =C2=A0 =C2=A0 =C2=A0 =C2=A0590 pmu-shift
> mac =C2=A0 =C2=A0 =C2=A0 12: =C2=A0 =C2=A0 =C2=A0 =C2=A0 90 pmu-clock
> mac =C2=A0 =C2=A0 =C2=A0 14: =C2=A0 =C2=A0 =C2=A0 1635 timer
> mac =C2=A0 =C2=A0 =C2=A0 17: =C2=A0 =C2=A0 =C2=A0 3876 nubus
> mac =C2=A0 =C2=A0 =C2=A0 56: =C2=A0 =C2=A0 =C2=A0 3879 sonic
>
> whereas, CONFIG_USE_GENERIC_HARDIRQS=3Dy gives:
>
> # cat /proc/interrupts
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 CPU0
> =C2=A04: =C2=A0 =C2=A0 =C2=A0 5303 =C2=A0 =C2=A0 =C2=A0auto =C2=A0SCC
> =C2=A07: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00 =C2=A0 =C2=A0 =C2=A0auto=
 =C2=A0NMI
> =C2=A010: =C2=A0 =C2=A0 =C2=A0 2136 =C2=A0 =C2=A0 =C2=A0 mac =C2=A0pm=
u-shift
> =C2=A012: =C2=A0 =C2=A0 =C2=A0 =C2=A0607 =C2=A0 =C2=A0 =C2=A0 mac =C2=
=A0pmu-clock
> =C2=A014: =C2=A0 =C2=A0 =C2=A041858 =C2=A0 =C2=A0 =C2=A0 mac =C2=A0ti=
mer
> =C2=A056: =C2=A0 =C2=A0 =C2=A066876 =C2=A0 =C2=A0 =C2=A0 mac =C2=A0so=
nic
> ERR: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00
>
> Are there no counters for chained IRQs?

I noticed the same for Amiga.

> Other than these issues everything looks OK. I will test OSS and Babo=
on
> when I get the relevant hardware set up.

Thanks again!

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
