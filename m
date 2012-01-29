From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: Atari TT (next)
Date: Sun, 29 Jan 2012 22:56:13 +0100
Message-ID: <CAMuHMdXp+_t6262MUbk7o8fxi1Y015=eovhMNT0h_xc0COgVFQ@mail.gmail.com>
References: <4F079F6B.8080502@fairlite.co.uk>
	<4F07EA66.6020603@gmail.com>
	<4F08E748.4020305@fairlite.co.uk>
	<4F0917E9.9090600@gmail.com>
	<4F0964EC.2080505@fairlite.co.uk>
	<CAOmrzkLH18VCY0dzJPM14dn5ccWmSBkiPzq8EFqnCDHiM3bECQ@mail.gmail.com>
	<loom.20120127T175834-143@post.gmane.org>
	<4F245B91.60101@gmail.com>
	<loom.20120129T015428-587@post.gmane.org>
	<CAMuHMdV9s6Ff1yz9jVLqKNU+ejVHvTyyqnDTvRK9i3_CmUj=qw@mail.gmail.com>
	<Pine.BSM.4.64L.1201291954020.4290@herc.mirbsd.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-we0-f174.google.com ([74.125.82.174]:43929 "EHLO
	mail-we0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750979Ab2A2V4O convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 29 Jan 2012 16:56:14 -0500
Received: by werb13 with SMTP id b13so2940131wer.19
        for <linux-m68k@vger.kernel.org>; Sun, 29 Jan 2012 13:56:13 -0800 (PST)
In-Reply-To: <Pine.BSM.4.64L.1201291954020.4290@herc.mirbsd.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Thorsten Glaser <tg@mirbsd.de>
Cc: linux-m68k@vger.kernel.org

On Sun, Jan 29, 2012 at 20:55, Thorsten Glaser <tg@mirbsd.de> wrote:
> Geert Uytterhoeven dixit:
>>Don't tell me. My Amiga also has only 12 MiB of Fast RAM. Where are
>>the days my Amiga was mailserver for 70 people, many of them logging
>>in remotely to read their email with pine? Debian is getted too bloat=
ed,
>
> ;-)
>
> It=E2=80=99s not just that. XFree86 4, for example, is a memory hog c=
ompared
> to XF86 3, and Unicode support eats up lots and lots of RAM.

xserver-xfbdev based on kdrive still exists, right?
But AFAIK it lacks Amiga and Atari frame buffer device support. Fixing
that has been on my list for a looooong time...

>>I have less packages (incl.daemons) installed than 12 years ago, but =
the
>>system is still much slower.
>
> Hm, slower too?

Yep. No free RAM, so everything causes swapping.

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
