From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: FPU emulation incorrect for 68LC040?
Date: Wed, 21 Jul 2010 22:32:33 +0200
Message-ID: <AANLkTilKXTCUJIOEvQ-H5GjGfPwYV5_QufuD46twmNvS@mail.gmail.com>
References: <08EC3395-75C3-4E81-B468-C9978DDCF85D@bredband.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-ww0-f42.google.com ([74.125.82.42]:45910 "EHLO
	mail-ww0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752123Ab0GUUcg convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 21 Jul 2010 16:32:36 -0400
Received: by wwf26 with SMTP id 26so3488074wwf.1
        for <linux-m68k@vger.kernel.org>; Wed, 21 Jul 2010 13:32:34 -0700 (PDT)
In-Reply-To: <08EC3395-75C3-4E81-B468-C9978DDCF85D@bredband.net>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: =?UTF-8?Q?Mattias_Engdeg=C3=A5rd?= <mattiase@bredband.net>
Cc: linux-m68k@vger.kernel.org, zippel@linux-m68k.org

On Wed, Jul 21, 2010 at 22:22, Mattias Engdeg=C3=A5rd <mattiase@bredban=
d.net> wrote:
> Does anyone know whether a 68LC040 alters the address register in
> postincrement/predecrement modes when it calculates the effective add=
ress
> for an FP instruction? The FPU emulation in the kernel seems to assum=
e that
> it doesn't, but that doesn't really make sense.
>
> If the 'LC040 does increment a0 in fadd.d (a0)+,fp0, say, then the Li=
nux FPU
> emulation is quite broken, at least in 2.6.34. If not, then I have
> misunderstood how the hardware works.

As the 'LC040 doesn't implement FPU instructions, I'd expect it to
just generate an
exception when the "fadd.d (a0)+,fp0" is encountered. I.e. not do anyth=
ing else,
like postincrementing a0.

> I'm writing a 68040/68LC040 simulator and unfortunately do not have a=
 real
> 'LC040 to do experiments on. If someone with actual hardware could he=
lp me,
> I'd be most grateful.

Sorry, only a full '040 here.

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
