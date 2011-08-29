From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: m68k: [v5] Convert to genirq (WIP)
Date: Mon, 29 Aug 2011 09:36:32 +0200
Message-ID: <CAMuHMdVG+GM5c0Wmpa-sAYL+pY1Oz7SynEqmpE1vJWY6j4rXvg@mail.gmail.com>
References: <CAMuHMdUZe0Y55ZPee+umJdEsmY5X-EB-KoC-w-SGEtbPMAcf3g@mail.gmail.com>
	<alpine.OSX.2.00.1108271506320.190@ibook.local>
	<CAMuHMdXk6_1CO8mvfNtbjf3V0Awh=zFYOcrpbUe2-pZkL5knxQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-gw0-f46.google.com ([74.125.83.46]:64102 "EHLO
	mail-gw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752741Ab1H2Hgd convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 29 Aug 2011 03:36:33 -0400
In-Reply-To: <CAMuHMdXk6_1CO8mvfNtbjf3V0Awh=zFYOcrpbUe2-pZkL5knxQ@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>, linux-kernel@vger.kernel.org, Finn Thain <fthain@telegraphics.com.au>

On Sun, Aug 28, 2011 at 09:53, Geert Uytterhoeven <geert@linux-m68k.org=
> wrote:
> On Sun, Aug 28, 2011 at 04:08, Finn Thain <fthain@telegraphics.com.au=
> wrote:
>> On one VIA-based machine that I tested, !CONFIG_USE_GENERIC_HARDIRQS
>> gives:
>>
>> # cat /proc/interrupts
>> auto =C2=A0 =C2=A0 =C2=A0 1: =C2=A0 =C2=A0 =C2=A0 2299 via1
>> auto =C2=A0 =C2=A0 =C2=A0 2: =C2=A0 =C2=A0 =C2=A0 3876 via2
>> auto =C2=A0 =C2=A0 =C2=A0 4: =C2=A0 =C2=A0 =C2=A0 =C2=A0562 SCC
>> auto =C2=A0 =C2=A0 =C2=A0 7: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00 NMI
>> mac =C2=A0 =C2=A0 =C2=A0 10: =C2=A0 =C2=A0 =C2=A0 =C2=A0590 pmu-shif=
t
>> mac =C2=A0 =C2=A0 =C2=A0 12: =C2=A0 =C2=A0 =C2=A0 =C2=A0 90 pmu-cloc=
k
>> mac =C2=A0 =C2=A0 =C2=A0 14: =C2=A0 =C2=A0 =C2=A0 1635 timer
>> mac =C2=A0 =C2=A0 =C2=A0 17: =C2=A0 =C2=A0 =C2=A0 3876 nubus
>> mac =C2=A0 =C2=A0 =C2=A0 56: =C2=A0 =C2=A0 =C2=A0 3879 sonic
>>
>> whereas, CONFIG_USE_GENERIC_HARDIRQS=3Dy gives:
>>
>> # cat /proc/interrupts
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 CPU0
>> =C2=A04: =C2=A0 =C2=A0 =C2=A0 5303 =C2=A0 =C2=A0 =C2=A0auto =C2=A0SC=
C
>> =C2=A07: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00 =C2=A0 =C2=A0 =C2=A0aut=
o =C2=A0NMI
>> =C2=A010: =C2=A0 =C2=A0 =C2=A0 2136 =C2=A0 =C2=A0 =C2=A0 mac =C2=A0p=
mu-shift
>> =C2=A012: =C2=A0 =C2=A0 =C2=A0 =C2=A0607 =C2=A0 =C2=A0 =C2=A0 mac =C2=
=A0pmu-clock
>> =C2=A014: =C2=A0 =C2=A0 =C2=A041858 =C2=A0 =C2=A0 =C2=A0 mac =C2=A0t=
imer
>> =C2=A056: =C2=A0 =C2=A0 =C2=A066876 =C2=A0 =C2=A0 =C2=A0 mac =C2=A0s=
onic
>> ERR: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00
>>
>> Are there no counters for chained IRQs?
>
> I noticed the same for Amiga.

Thomas, is it intentional that chain handlers don't show counters?
What if we get unexpected interrupts the chain handler can't handle?

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
