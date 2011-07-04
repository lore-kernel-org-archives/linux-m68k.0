From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] m68knommu: Move forward declaration of do_IRQ() from
 machdep.h to irq.h
Date: Mon, 4 Jul 2011 21:55:07 +0200
Message-ID: <CAMuHMdV2ktVAwWLECnu0DrQ1kW6883Djkzs9=Fu3Koj1aQqnXw__7760.8531727039$1309809777$gmane$org@mail.gmail.com>
References: <alpine.DEB.2.00.1107031054470.5931@ayla.of.borg>
	<alpine.DEB.2.00.1107031108390.6100@ayla.of.borg>
	<4E11089B.5070001@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <4E11089B.5070001@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Greg Ungerer <gerg@snapgear.com>
Cc: Greg Ungerer <gerg@uclinux.org>, uClinux list <uclinux-dev@uclinux.org>, Linux/m68k <linux-m68k@lists.linux-m68k.org>

Hi Greg,

On Mon, Jul 4, 2011 at 02:26, Greg Ungerer <gerg@snapgear.com> wrote:
> On 03/07/11 19:09, Geert Uytterhoeven wrote:
>> Oops, there's also an asmlinkage missing. Corrected patch below.
>>
>> from 63dab1c663875083f095819431bbc6560c2a8dfb Mon Sep 17 00:00:00 20=
01
>> From: Geert Uytterhoeven<geert@linux-m68k.org>
>> Date: Sun, 3 Jul 2011 10:49:58 +0200
>> Subject: [PATCH] m68knommu: Move forward declaration of do_IRQ() fro=
m
>> machdep.h to irq.h
>>
>> It is not machine-specific, but common irq infrastructure.
>> Also add the missing asmlinkage, to match its definition.
>>
>> Signed-off-by: Geert Uytterhoeven<geert@linux-m68k.org>
>
> Acked-by: Greg Ungerer <gerg@uclinux.org>

Thanks!

> Looks good. Are you going to push this one, or do you want
> me too?

I'll add it to my genirq WIP branch when needed. But I don't mind if it=
 enters
Linus' tree via yours.

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
