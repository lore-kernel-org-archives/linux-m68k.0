From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [RFC] m68k: Update defconfigs
Date: Thu, 5 Jan 2012 11:03:58 +0100
Message-ID: <CAMuHMdVg9UNWyyVEG0wmxbKpgS+MWs8-iETie0wwVr0gGoorEw@mail.gmail.com>
References: <alpine.DEB.2.00.1201042252450.15625@ayla.of.borg>
	<Pine.BSM.4.64L.1201042220180.16408@herc.mirbsd.org>
	<CAMuHMdVN470=RBQMHZ9PQ_rNCVbS4gD0+5P654YdxrBR3aqotA@mail.gmail.com>
	<4F057459.3060101@fairlite.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-wi0-f174.google.com ([209.85.212.174]:50140 "EHLO
	mail-wi0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753229Ab2AEKD7 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 5 Jan 2012 05:03:59 -0500
Received: by wibhm6 with SMTP id hm6so214358wib.19
        for <linux-m68k@vger.kernel.org>; Thu, 05 Jan 2012 02:03:58 -0800 (PST)
In-Reply-To: <4F057459.3060101@fairlite.co.uk>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Alan Hourihane <alanh@fairlite.co.uk>
Cc: Thorsten Glaser <tg@mirbsd.de>, Finn Thain <fthain@telegraphics.com.au>, Michael Schmitz <schmitzmic@googlemail.com>, linux-m68k@vger.kernel.org, debian-68k@lists.debian.org

On Thu, Jan 5, 2012 at 10:58, Alan Hourihane <alanh@fairlite.co.uk> wro=
te:
> It would certainly be wonderful to have atari_scc.c back.

You can probably just "git revert" the relevant commits to resurrect al=
l pieces
and make it work again for debugging. But the result won't go upstream.

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
