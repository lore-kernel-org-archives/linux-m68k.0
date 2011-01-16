From: Thorsten Glaser <tg@mirbsd.de>
Subject: Re: build warnings
Date: Sun, 16 Jan 2011 22:29:23 +0000 (UTC)
Message-ID: <Pine.BSM.4.64L.1101162226120.11797@herc.mirbsd.org>
References: <alpine.DEB.2.00.1101131539400.19098@tglase.bonn.tarent.de>
 <alpine.DEB.2.00.1101141023130.5300@tglase.bonn.tarent.de>
 <AANLkTi=2Cb+EHR9xAgNPa7wGsSWWydZ56_iAGRDN-hXU@mail.gmail.com>
 <AANLkTinN+0i9gZxvUn0cig1kp0aM9iJ+fph0=-R-ChKZ@mail.gmail.com>
 <Pine.BSM.4.64L.1101161347480.11797@herc.mirbsd.org>
 <AANLkTimcvXaCqRrn+uZ9eVjxg0UyncSF1YL=Xpz2FiNF@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from static-87-79-237-121.netcologne.de ([87.79.237.121]:39374 "EHLO
	herc.mirbsd.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751469Ab1APWd6 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 16 Jan 2011 17:33:58 -0500
In-Reply-To: <AANLkTimcvXaCqRrn+uZ9eVjxg0UyncSF1YL=Xpz2FiNF@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@googlemail.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@vger.kernel.org

Michael Schmitz dixit:

>Mmh - Geert's 2.6.37 does work just fine for me; I'll better get your
>patches applied to a vanilla kernel and see how that differs from
>2.6.37-m68k. vanilla plus the git branch m68k-queue _should_ just get
>us to 2.6.37-m68k, right?

I applied all of m68k-queue and for-linus of that day (which is the
signal patchset for both m68ks and the rest of the queue) but on top
of a 2.6.37-1~experimental.1 Debian kernel.

I posted a link to the source package earlier. I cancelled the build
though due to this problem.

>sometime. Not something the consumer electronics shops in Auckland CBD
>stock, for some reason.

Heh well. I=E2=80=99ve had fun times buying an IDE drive with less than=
 1024
cylinders, floppies, and printer paper (not loose pages like copier
paper they use nowadays, no, real 21x30.48cm endless paper) too ;-)
But they had new print ribbon for my Epson FX-80, so=E2=80=A6 =E2=98=BB=
=E2=98=BA

bye,
//mirabilos
--=20
=C2=ABMyISAM tables -will- get corrupted eventually. This is a fact of =
life. =C2=BB
=E2=80=9Cmysql is about as much database as ms access=E2=80=9D =E2=80=93=
 =E2=80=9CMSSQL at least descends
from a database=E2=80=9D =E2=80=9Cit's a rebranded SyBase=E2=80=9D =E2=80=
=9CMySQL however was born from a
flatfile and went downhill from there=E2=80=9D =E2=80=93 =E2=80=9Cat le=
ast jetDB doesn=E2=80=99t claim to
be a database=E2=80=9D	-- Tonnerre, psychoschlumpf and myself in #nosec
