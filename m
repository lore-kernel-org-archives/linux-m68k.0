From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: m68k: Convert to genirq (WIP)
Date: Tue, 31 May 2011 21:54:26 +0200
Message-ID: <BANLkTinsMhQZSeO_ujtYEJuOcAa=FRh-6g@mail.gmail.com>
References: <alpine.DEB.2.00.1105282010370.16617@ayla.of.borg>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.00.1105282010370.16617@ayla.of.borg>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Linux/m68k <linux-m68k@lists.linux-m68k.org>, Linux Kernel Development <linux-kernel@vger.kernel.org>

Hi Thomas,

On Sat, May 28, 2011 at 20:32, Geert Uytterhoeven <geert@linux-m68k.org=
> wrote:
> Next on my list is Amiga, which will cover autovectored and chained i=
nterrupts.

Plain chained interrupts should be handled by calling irq_set_chained_h=
andler()
to register an irq_flow_handler_t, and let the handler call
generic_handle_irq() for
each successive interrupt, right?

However, on Amiga we have interrupts (IRQ_AMIGA_PORTS and
IRQ_AMIGA_EXTER) that are a combination of chained (for the CIA interru=
pt
controllers) and shared level interrupts (for motherboard hardware and
Zorro expansion
boards).
But irq_set_chained_handler() sets IRQ_NOREQUEST, i.e. the interrupt ca=
nnot
be requested anymore via request_irq(), so this rules out using it with=
 shared
level interrupts.

What's the preferred way to handle this? Is there are standard way, or =
should I
write my own specialized irq_flow_handler_t that handles both?

In the old scheme, we just registered the chain handlers with
request_irq(), so they
worked nicely together with the shared level interrupts (cfr.
arch/m68k/amiga/cia.c)

Thanks!

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
