From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: Aranym, more than 244MB FastRAM, garbled display
Date: Fri, 1 Oct 2010 19:17:33 +0200
Message-ID: <AANLkTind9=+een0ttr85FYdY6X+GDbiFSzqMKXEZoadb@mail.gmail.com>
References: <alpine.LNX.2.00.1010011728270.4788@halbrend.uninett.no>
	<m2tyl5u9hu.fsf@igel.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-yx0-f174.google.com ([209.85.213.174]:49039 "EHLO
	mail-yx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753188Ab0JARRf convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 1 Oct 2010 13:17:35 -0400
Received: by yxp4 with SMTP id 4so1222061yxp.19
        for <linux-m68k@vger.kernel.org>; Fri, 01 Oct 2010 10:17:34 -0700 (PDT)
In-Reply-To: <m2tyl5u9hu.fsf@igel.home>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: =?UTF-8?Q?Kolbj=C3=B8rn_Barmen?= <linux-m68k@kolla.no>, Linux/m68k <linux-m68k@vger.kernel.org>

On Fri, Oct 1, 2010 at 19:07, Andreas Schwab <schwab@linux-m68k.org> wr=
ote:
> Kolbj=C3=B8rn Barmen <linux-m68k@kolla.no> writes:
>
>> One thing I have noticed is that if I set FastRAM in aranym config t=
o
>> something higher than 244 I get garbled display, kinda like frozen r=
andom
>> noise - the kernel does boot in the background though. I tried with
>> different kernels (only up to 2.6.34 though), and with different ver=
sions
>> of aranym, but it didn't make much difference.
>
> I have always been using FastRAM =3D 256 without problems.

Just checked, /me too!

I have `video=3Datafb:tthigh` but removing that doesn't change anything=
=2E
Ah yes, it emulates a Falcon, so the tthigh is bogus ;-)

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
