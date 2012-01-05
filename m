From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: Atari TT
Date: Thu, 5 Jan 2012 15:42:35 +0100
Message-ID: <CAMuHMdUK=2tkFtxQjua6LLGDJuEkrbK0W+mMVQ6PLBB9MfqPSw@mail.gmail.com>
References: <4F0488A9.5030100@fairlite.co.uk>
	<Pine.BSM.4.64L.1201041911580.19192@herc.mirbsd.org>
	<alpine.LNX.2.00.1201052128060.6601@nippy.intranet>
	<4F059460.5040305@fairlite.co.uk>
	<CAMuHMdUxQq_29g7yeaS2Ktz193CcHNX5FaP8PR9ijU0htnKbZg@mail.gmail.com>
	<4F059AE1.6070707@fairlite.co.uk>
	<4F059DB9.1050209@fairlite.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-ww0-f44.google.com ([74.125.82.44]:52052 "EHLO
	mail-ww0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932476Ab2AEOmh convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 5 Jan 2012 09:42:37 -0500
Received: by wgbdr13 with SMTP id dr13so700909wgb.1
        for <linux-m68k@vger.kernel.org>; Thu, 05 Jan 2012 06:42:36 -0800 (PST)
In-Reply-To: <4F059DB9.1050209@fairlite.co.uk>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Alan Hourihane <alanh@fairlite.co.uk>
Cc: Finn Thain <fthain@telegraphics.com.au>, Thorsten Glaser <tg@mirbsd.de>, debian-68k@lists.debian.org, Linux/m68k <linux-m68k@vger.kernel.org>

On Thu, Jan 5, 2012 at 13:55, Alan Hourihane <alanh@fairlite.co.uk> wro=
te:
> Linux version 3.1.0-atari-00246-gbff0dc7 (root@server) (gcc version

bff0dc7 =3D m68k-v3.1. That kernel still has the SCC driver, but it dep=
ends on
BROKEN, so you cannot select it.
If you revert 173808aa9203cf752518acd80fde3c9c910ddd0f ("m68k/atari: SC=
C
- Mark Atari serial driver BROKEN") you can select CONFIG_ATARI_SCC aga=
in,
and get a real serial console.

But first the interrupt storm must be fixed.

> unexpected interrupt from 112

That's the vector number, so the actual IRQ number is 112 / 4 =3D 28, w=
hich is
IRQ_TT_MFP_TIMD. Sorry, no clues.

Can you please try a pristine v3.1? The only relevant differences are t=
he
conversion to the genirq framework and the Atari SCC driver.

If that works, I guess it's a regression introduced by the genirq conve=
rsion.
Then you can bisect between v3.1 and m68k-v3.1.

BTW, in between 9fa434585e5f6cfeae685505b4cd8465dbab1dff ("m68k/irq:
Add genirq support") and 971ae31663e817a5e5b673d30c7652d9160145f0
("m68k/irq: Remove obsolete m68k irq framework"), genirq support is a c=
onfig
option that can be turned on or off.

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
