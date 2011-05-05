From: Michael Schmitz <schmitzmic@googlemail.com>
Subject: Re: [PATCH] m68k/atari: Do not use "/" in interrupt names
Date: Thu, 5 May 2011 16:33:34 +1200
Message-ID: <BANLkTi=PKV23PqLMudno-kMRMr1_OgqaDQ@mail.gmail.com>
References: <alpine.DEB.2.00.1105041629390.2629@ayla.of.borg>
	<m3d3jybjf3.fsf@linux-m68k.org>
	<BANLkTind9TLfuyVmRnRZJotFPgOebwf-dw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <BANLkTind9TLfuyVmRnRZJotFPgOebwf-dw@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Andreas Schwab <schwab@linux-m68k.org>, Linux/m68k <linux-m68k@lists.linux-m68k.org>

Hi,

>>> =A0 =A0 =A0 error =3D request_irq(IRQ_MFP_ACIA, atari_keyboard_inte=
rrupt,
>>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 IRQ_TYPE_SLOW, "k=
eyboard/mouse/MIDI",
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 IRQ_TYPE_SLOW, "k=
eyboard:mouse:MIDI",
>>
>> The name is not a path, but an enumeration, so the slash should prob=
ably
>> be changed to a comma instead.
>
> I thought about that, but comma (albeit followed by a space) is also =
used to
> separate multiple interrupt handlers for shared interrupts.

What about '//', '|' or ':'?

Except for the atarilance one, these are sort of shared interrupt
handlers so maybe the comma won't hurt after all.

Cheers,

  Michael
