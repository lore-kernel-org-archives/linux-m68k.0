From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] m68knommu: Use generic show_interrupts()
Date: Sun, 1 May 2011 10:08:51 +0200
Message-ID: <BANLkTinhaMMbaPq5mPDseK9Y2q4H1Jhh8w@mail.gmail.com>
References: <alpine.DEB.2.00.1104302312320.24942@ayla.of.borg>
	<4DBC9485.1060601@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <4DBC9485.1060601@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Greg Ungerer <gerg@snapgear.com>
Cc: Greg Ungerer <gerg@uclinux.org>, uClinux list <uclinux-dev@uclinux.org>, Linux/m68k <linux-m68k@lists.linux-m68k.org>, Thomas Gleixner <tglx@linutronix.de>

On Sun, May 1, 2011 at 01:00, Greg Ungerer <gerg@snapgear.com> wrote:
> On 01/05/11 07:15, Geert Uytterhoeven wrote:
>> Apart from whitespace differences, /proc/interrupts doesn't change b=
y
>> enabling GENERIC_IRQ_SHOW.
>>
>> Signed-off-by: Geert Uytterhoeven<geert@linux-m68k.org>
>
> Works fine on m68knommu, so:
>
> Acked-by: Greg Ungerer <gerg@uclinux.org>
>
> Do you want me to push this via the m68knommu git tree?

Yes please. Thx!

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
