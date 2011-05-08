From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: Debian kernel 2.6.38-5
Date: Sun, 8 May 2011 21:26:33 +0200
Message-ID: <BANLkTimdGZs0OgcnXJOweHYZ4hONw=4idQ@mail.gmail.com>
References: <BANLkTimCKhPbp3wOCpVusHu1JmoyhwKX0w@mail.gmail.com>
	<Pine.BSM.4.64L.1105081254100.28983@herc.mirbsd.org>
	<20110508165909.GA16281@chumley.earth.sol>
	<BANLkTin8cSKLWynnJZQfeE-VQqdfXgpcsQ@mail.gmail.com>
	<Pine.BSM.4.64L.1105081841510.28983@herc.mirbsd.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:51615 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754420Ab1EHT0e convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 8 May 2011 15:26:34 -0400
Received: by bwz15 with SMTP id 15so3522500bwz.19
        for <linux-m68k@vger.kernel.org>; Sun, 08 May 2011 12:26:33 -0700 (PDT)
In-Reply-To: <Pine.BSM.4.64L.1105081841510.28983@herc.mirbsd.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Thorsten Glaser <tg@mirbsd.de>
Cc: linux-m68k@vger.kernel.org

On Sun, May 8, 2011 at 20:49, Thorsten Glaser <tg@mirbsd.de> wrote:
> Geert Uytterhoeven dixit:
>
>>Anyway, plain v2.6.30 should work on Amiga.
>
> Not on his, he=E2=80=99s got the TLS eglibc already. Applying
> http://svn.debian.org/viewsvn/kernel/dists/squeeze/linux-2.6/debian/p=
atches/bugfix/m68k/linux-2.6.git-9674cdc74d63f346870943ef966a034f8c71ee=
57.patch?revision=3D16861&view=3Dmarkup
> might help, though.

Oops yes, forgot about his TLS dependency.

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
