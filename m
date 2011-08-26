From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: m68k: Convert to genirq (WIP)
Date: Fri, 26 Aug 2011 13:32:28 +0200
Message-ID: <CAMuHMdVz40_HyFpgttGmUO_DBM58vgOhEq3YGzJ0tUM+k9B26w@mail.gmail.com>
References: <alpine.DEB.2.00.1105282010370.16617@ayla.of.borg>
	<alpine.OSX.2.00.1106011300550.199@ibook.intranet>
	<20110605062702.GA2034@cynthia.pants.nu>
	<CAMuHMdXVt5+nCaCSH3+z0fsL+vhOOTgbKsOAses8OudT-1OZGQ@mail.gmail.com>
	<alpine.OSX.2.00.1108102007430.203@ibook.local>
	<CAMuHMdXgeHtOB_3u6G6N9E4vaq=sJY-9NtF68XAnxhspMgRyGg@mail.gmail.com>
	<alpine.OSX.2.00.1108262117070.267@ibook.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <alpine.OSX.2.00.1108262117070.267@ibook.local>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: Brad Boyer <flar@allandria.com>, Linux/m68k <linux-m68k@lists.linux-m68k.org>, Thomas Gleixner <tglx@linutronix.de>, Linux Kernel Development <linux-kernel@vger.kernel.org>

On Fri, Aug 26, 2011 at 13:21, Finn Thain <fthain@telegraphics.com.au> =
wrote:
> On Fri, 26 Aug 2011, Geert Uytterhoeven wrote:
>> On Wed, Aug 10, 2011 at 12:53, Finn Thain <fthain@telegraphics.com.a=
u> wrote:
>> >> via1_irq
>> >> =C2=A0 =C2=A0 OSS_IRQLEV_VIA1 =3D IRQ_AUTO_6 (on oss) =C2=A0 =C2=A0=
 =C2=A0 conflict: psc_irq
>> >>
>> >> =C2=A0 =C2=A0 IRQ_AUTO_1 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0conflict: iop_ism_irq
>>
>> >> iop_ism_irq
>> >> =C2=A0 =C2=A0 OSS_IRQLEV_IOPISM =3D 1 =3D IRQ_AUTO_1 (on oss) con=
flict: via1_irq
>> >
>> > via1_irq is remapped to IRQ_AUTO_6 on OSS.
>>
>> According to via_register_interrupts(), it requests both:
>>
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (via_alt_mapping) {
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (request_=
irq(IRQ_AUTO_1, via1_irq, 0, "software",
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (void *)via1))
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 pr_err("Couldn't register %s interrupt\n", "software");
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (request_=
irq(IRQ_AUTO_6, via1_irq, 0, "via1", (void *)via1))
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 pr_err("Couldn't register %s interrupt\n", "via1");
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (request_=
irq(IRQ_AUTO_1, via1_irq, 0, "via1", (void *)via1))
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 pr_err("Couldn't register %s interrupt\n", "via1");
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 }
>>
>> Hence IRQ_AUTO_1 must be shared and we cannot use an optimized chain
>> handler for via1_irq()
>
> I'm pretty sure that the "software" request_irq can be removed. It ha=
s
> come up before --
> http://marc.info/?l=3Dlinux-mac68k&m=3D110973724208746&w=3D2
>
> Maybe Brad can shed some light on this (?)
>
> I've just cloned and built your m68k-genirq branch. I will run some t=
ests.

Thanks!

>> nor iop_ism_irq().
>
> via_register_interrupts() is not called on OSS.

You're right, I missed that.

>> This is the only remaining conflict I see.

Good, I'll convert them all to chain handlers.

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
