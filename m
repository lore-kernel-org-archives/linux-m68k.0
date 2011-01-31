From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: Atari console corruption
Date: Mon, 31 Jan 2011 19:32:51 +0100
Message-ID: <AANLkTimEeLfHJrcFhk+38og1GDP1KZLaiXVqYRhMfhbc@mail.gmail.com>
References: <AANLkTimZ4q3mGhy27qVo5gQHMCM2U8jrc_fNPH4YUXev@mail.gmail.com>
	<m2fww9dczv.fsf@igel.home>
	<Pine.BSM.4.64L.1101301417070.30539@herc.mirbsd.org>
	<AANLkTikQ26zuDvt6WsHAg_Mn4y3KY+eroSJiKwP8rSWE@mail.gmail.com>
	<Pine.BSM.4.64L.1101301913500.30539@herc.mirbsd.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-fx0-f46.google.com ([209.85.161.46]:42355 "EHLO
	mail-fx0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751663Ab1AaScz convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 31 Jan 2011 13:32:55 -0500
Received: by fxm20 with SMTP id 20so5905892fxm.19
        for <linux-m68k@vger.kernel.org>; Mon, 31 Jan 2011 10:32:54 -0800 (PST)
In-Reply-To: <Pine.BSM.4.64L.1101301913500.30539@herc.mirbsd.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Thorsten Glaser <tg@mirbsd.de>
Cc: linux-m68k@vger.kernel.org

On Sun, Jan 30, 2011 at 20:15, Thorsten Glaser <tg@mirbsd.de> wrote:
> Geert Uytterhoeven dixit:
>>You must use an Atari interleaved bitplanes mode to see it, though.
>
> That might have been the thing I didn=E2=80=99t, probably. I actually
> don=E2=80=99t know what video mode it uses, except the colours are
> reversed (I have linuxlogo in .profile just for fun, and the
> red Debian swirl is blue on the graphical console). No idea
> what =E2=80=9Coptimal=E2=80=9D settings to use in ARAnyM either=E2=80=
=A6

I couldn't reproduce this color issue.
What does `fbset -i' say?

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
