From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] m68k: Revive reporting of spurious interrupts
Date: Thu, 14 Jul 2011 09:20:01 +0200
Message-ID: <CAMuHMdXS7QcKpyguSP0mtdh6etgLHisui=cf3xu2GbZDdk-45A@mail.gmail.com>
References: <alpine.DEB.2.00.1107132028080.31317@ayla.of.borg>
	<1310625174.18428.2.camel@joy-desktop>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1310625174.18428.2.camel@joy-desktop>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Petr Stehlik <pstehlik@sophics.cz>
Cc: Linux/m68k <linux-m68k@lists.linux-m68k.org>

On Thu, Jul 14, 2011 at 08:32, Petr Stehlik <pstehlik@sophics.cz> wrote=
:
> Geert Uytterhoeven p=C3=AD=C5=A1e v Wed 13. 07. 2011 v 20:29 +0200:
>> commit 2502b667ea835ee16685c74b2a0d89ba8afe117a ("Change the m68knom=
mu irq
>> handling to use the generic irq framework.") removed the reporting o=
f spurious
>> interrupts on nommu (68328 and 68360).
>>
>> Bring it back in a generic way, using "atomic_t irq_err_count", as t=
hat's what
>> most of the other architectures are using.
>
> I am curious if this would fix the kernel running in FastRAM on Falco=
n
> with Afterburner040 (MC68040) by any chance. Because that never worke=
d
> correctly and there always were a lot of spurious interrupts :-)
>
> If/when there is a binary kernel 3.1 for Falcon040 I might give it a
> try, just out of curiosity.

It won't. It affects nommu only.

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
