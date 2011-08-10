From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: m68k: Convert to genirq (WIP)
Date: Wed, 10 Aug 2011 11:59:08 +0200
Message-ID: <CAMuHMdXVt5+nCaCSH3+z0fsL+vhOOTgbKsOAses8OudT-1OZGQ__15580.7151961655$1312970392$gmane$org@mail.gmail.com>
References: <alpine.DEB.2.00.1105282010370.16617@ayla.of.borg>
	<alpine.OSX.2.00.1106011300550.199@ibook.intranet>
	<20110605062702.GA2034@cynthia.pants.nu>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <20110605062702.GA2034@cynthia.pants.nu>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Brad Boyer <flar@allandria.com>
Cc: Finn Thain <fthain@telegraphics.com.au>, Linux/m68k <linux-m68k@lists.linux-m68k.org>, Thomas Gleixner <tglx@linutronix.de>, Linux Kernel Development <linux-kernel@vger.kernel.org>

On Sun, Jun 5, 2011 at 08:27, Brad Boyer <flar@allandria.com> wrote:
> If we could really map all the interrupt controllers, we could probab=
ly
> cut down on the largest interrupt number. Most Macs really only have
> 20 or 30 actual interrupt sources. The problem is the two or three
> layers of cascaded mess. None of them have just a single layer. Just
> getting rid of the fixed global mapping could take us down to 64 sinc=
e
> nothing has both Baboon and PSC, but we have unique numbers for them.
> We have 3 whole blocks of 8 just for PSC, even though that's just in
> two models. We don't even know what most of those do, if anything.

While looking into optimizing interrupts using chain handlers (which ca=
nnot
be shared), I noticed several of these cascades are hung on the same in=
terrupt.
Hence we cannot use the optimization of chain handlers for them.

Knowing which are mutually exclusive helps a lot, but my Mac knowledge =
is
very limited.

I derived from the code this list of cascade handlers and the
interrupts they use:

baboon_irq
    IRQ_NUBUS_C

oss_irq
    OSS_IRQLEV_SCSI =3D IRQ_AUTO_2                conflict: via2_irq
    OSS_IRQLEV_SOUND =3D IRQ_AUTO_5               conflict: psc_irq

oss_nubus_irq
    OSS_IRQLEV_NUBUS =3D IRQ_AUTO_3               conflict: psc_irq

psc_irq
    IRQ_AUTO_3                                  conflict: oss_nubus_irq
    IRQ_AUTO_4
    IRQ_AUTO_5                                  conflict: oss_irq
    IRQ_AUTO_6                                  conflict: via1_irq

via1_irq
    OSS_IRQLEV_VIA1 =3D IRQ_AUTO_6 (on oss)       conflict: psc_irq

    IRQ_AUTO_1                                  conflict: iop_ism_irq
    IRQ_AUTO_6 (if via_alt_mapping)             conflict: psc_irq

via2_irq
    IRQ_AUTO_2                                  conflict: oss_irq

via_nubus_irq
    IRQ_MAC_NUBUS =3D IRQ_VIA2_1

These are other interrupts using in the Mac core code, which may use th=
e same
interrupts as some of the cascades above:

iop_ism_irq
    OSS_IRQLEV_IOPISM =3D 1 =3D IRQ_AUTO_1 (on oss) conflict: via1_irq
    IRQ_VIA2_0 (on !oss)

mac_nmi_handler
    IRQ_AUTO_7

timer handler
    IRQ_MAC_TIMER_1 =3D IRQ_VIA1_6

So baboon and PSC are mutually exclusive? But they don't conflict w.r.t=
=2E to
interrupt lines anyway, so they're not an issue.

=46rom the code, OSS and VIA are also mutually exclusive (except for vi=
a1_irq)?

But PSC can coexist with OSS? That's where most of the conflicts are.

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
