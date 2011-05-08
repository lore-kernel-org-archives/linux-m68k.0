From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: Debian kernel 2.6.38-5
Date: Sun, 8 May 2011 20:00:57 +0200
Message-ID: <BANLkTin8cSKLWynnJZQfeE-VQqdfXgpcsQ@mail.gmail.com>
References: <BANLkTimCKhPbp3wOCpVusHu1JmoyhwKX0w@mail.gmail.com>
	<Pine.BSM.4.64L.1105081254100.28983@herc.mirbsd.org>
	<20110508165909.GA16281@chumley.earth.sol>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:62588 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753900Ab1EHSA6 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 8 May 2011 14:00:58 -0400
Received: by bwz15 with SMTP id 15so3499514bwz.19
        for <linux-m68k@vger.kernel.org>; Sun, 08 May 2011 11:00:57 -0700 (PDT)
In-Reply-To: <20110508165909.GA16281@chumley.earth.sol>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: "Christian T. Steigies" <cts@debian.org>
Cc: Thorsten Glaser <tg@mirbsd.de>, linux-m68k@vger.kernel.org

On Sun, May 8, 2011 at 18:59, Christian T. Steigies <cts@debian.org> wr=
ote:
> How do I get the older versions from Geert's git? I don't see any oth=
er
> branches, I only see tags.

Doesn't `git branch -r` show all branches?

> What is the magic word to get for example the 2.6.30 tree?

git checkout m68k-v2.6.30

That's actually a bad example, as I don't have a v2.6.30 version, due
to spending too
much time in a dial-up country those days :-)
I have m68k-v2.6.28..m68k-v2.6.38, but no .30.

Anyway, plain v2.6.30 should work on Amiga.

> When crosscompiling Geert's tree, shouldn't make ARCH=3Dm68k be suffi=
cient
> (after setting up a propper .config)?
> After creating a symlink to m68k-linux-gnu-gcc-4.4, this seems to wor=
k now:
> make ARCH=3Dm68k CROSS_COMPILE=3Dm68k-linux-gnu-
> It's been so long, is this the correct way to cross-build linux-m68k?=
 I
> should write that down somewhere...

If your compiler is called m68k-linux-gnu-gcc, `make ARCH=3Dm68k' shoul=
d work.

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
