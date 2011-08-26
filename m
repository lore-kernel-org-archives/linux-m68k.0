From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: m68k: Convert to genirq (WIP)
Date: Fri, 26 Aug 2011 11:52:21 +0200
Message-ID: <CAMuHMdXgeHtOB_3u6G6N9E4vaq=sJY-9NtF68XAnxhspMgRyGg@mail.gmail.com>
References: <alpine.DEB.2.00.1105282010370.16617@ayla.of.borg>
	<alpine.OSX.2.00.1106011300550.199@ibook.intranet>
	<20110605062702.GA2034@cynthia.pants.nu>
	<CAMuHMdXVt5+nCaCSH3+z0fsL+vhOOTgbKsOAses8OudT-1OZGQ@mail.gmail.com>
	<alpine.OSX.2.00.1108102007430.203@ibook.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <alpine.OSX.2.00.1108102007430.203@ibook.local>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: Brad Boyer <flar@allandria.com>, Linux/m68k <linux-m68k@lists.linux-m68k.org>, Thomas Gleixner <tglx@linutronix.de>, Linux Kernel Development <linux-kernel@vger.kernel.org>

On Wed, Aug 10, 2011 at 12:53, Finn Thain <fthain@telegraphics.com.au> =
wrote:
>> via1_irq
>> =C2=A0 =C2=A0 OSS_IRQLEV_VIA1 =3D IRQ_AUTO_6 (on oss) =C2=A0 =C2=A0 =
=C2=A0 conflict: psc_irq
>>
>> =C2=A0 =C2=A0 IRQ_AUTO_1 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
conflict: iop_ism_irq

>> iop_ism_irq
>> =C2=A0 =C2=A0 OSS_IRQLEV_IOPISM =3D 1 =3D IRQ_AUTO_1 (on oss) confli=
ct: via1_irq
>
> via1_irq is remapped to IRQ_AUTO_6 on OSS.

According to via_register_interrupts(), it requests both:

        if (via_alt_mapping) {
                if (request_irq(IRQ_AUTO_1, via1_irq, 0, "software",
                                (void *)via1))
                        pr_err("Couldn't register %s interrupt\n", "sof=
tware");
                if (request_irq(IRQ_AUTO_6, via1_irq, 0, "via1", (void =
*)via1))
                        pr_err("Couldn't register %s interrupt\n", "via=
1");
        } else {
                if (request_irq(IRQ_AUTO_1, via1_irq, 0, "via1", (void =
*)via1))
                        pr_err("Couldn't register %s interrupt\n", "via=
1");
        }

Hence IRQ_AUTO_1 must be shared, and we cannot use an optimized chain
handler for via1_irq() nor iop_ism_irq(). This is the only remaining co=
nflict
I see.

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
