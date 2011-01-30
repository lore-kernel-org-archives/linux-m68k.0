From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: Atari console corruption
Date: Sun, 30 Jan 2011 19:55:13 +0100
Message-ID: <AANLkTikQ26zuDvt6WsHAg_Mn4y3KY+eroSJiKwP8rSWE@mail.gmail.com>
References: <AANLkTimZ4q3mGhy27qVo5gQHMCM2U8jrc_fNPH4YUXev@mail.gmail.com>
	<m2fww9dczv.fsf@igel.home>
	<Pine.BSM.4.64L.1101301417070.30539@herc.mirbsd.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-fx0-f46.google.com ([209.85.161.46]:32805 "EHLO
	mail-fx0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751901Ab1A3SzP convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 30 Jan 2011 13:55:15 -0500
Received: by fxm20 with SMTP id 20so4931135fxm.19
        for <linux-m68k@vger.kernel.org>; Sun, 30 Jan 2011 10:55:14 -0800 (PST)
In-Reply-To: <Pine.BSM.4.64L.1101301417070.30539@herc.mirbsd.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Thorsten Glaser <tg@mirbsd.de>
Cc: linux-m68k@vger.kernel.org

On Sun, Jan 30, 2011 at 15:17, Thorsten Glaser <tg@mirbsd.de> wrote:
> Andreas Schwab dixit:
>
>>> become corrupted.
>>
>>Minimal testcase:
>>
>>$ printf 'abcd\10\10\33[@\n'
>
> Doesn=E2=80=99t happen on the 2.6.32-5+m68k.5-atari I just built. Goo=
d news
> too, video=3Datafb:vga2 is no longer needed either.

Are you sure? Nothing related to that got fixed. I'm still seeing it
on 2.6.38-rc2.
You must use an Atari interleaved bitplanes mode to see it, though.

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
