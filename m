From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: [PATCH 1/1] m68k: add missing I/O macros {in,out}{w,l}_p() for
 !CONFIG_ISA
Date: Mon, 4 Oct 2010 19:47:51 +1100 (EST)
Message-ID: <alpine.OSX.2.00.1010041943530.285@localhost>
References: <Pine.BSM.4.64L.1010031832530.15165@herc.mirbsd.org> <Pine.BSM.4.64L.1010031846060.15165@herc.mirbsd.org> <alpine.OSX.2.00.1010041149030.285@localhost> <Pine.BSM.4.64L.1010040738160.22274@herc.mirbsd.org>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="0-1939136947-1286182071=:285"
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from www.telegraphics.com.au ([204.15.192.19]:34047 "EHLO
	mail.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753038Ab0JDIrv (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 4 Oct 2010 04:47:51 -0400
In-Reply-To: <Pine.BSM.4.64L.1010040738160.22274@herc.mirbsd.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Thorsten Glaser <tg@mirbsd.de>
Cc: linux-m68k@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--0-1939136947-1286182071=:285
Content-Type: TEXT/PLAIN; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE


On Mon, 4 Oct 2010, Thorsten Glaser wrote:

> Finn Thain dixit:
>=20
> >On Sun, 3 Oct 2010, Thorsten Glaser wrote:
>=20
> >> Debian=E2=80=99s linux-2.6_2.6.32-24, but
> >
> >I was able to compile that source package. Can you please send the .conf=
ig=20
> >you used?
>=20
> Erm, Debian=E2=80=99s? Otherwise I wouldn=E2=80=99t say =E2=80=9Ctrying t=
o build Debian=E2=80=99s
> package=E2=80=9D.

My mistake. I compiled Debian's linux-2.6_2.6.32-23, to be precise.

> (The atari variant, to be exact, in order to run ARAnyM.) You might=20
> remember I=E2=80=99m sticking to stock unmodified Debian soruce, native=
=20
> compilation, etc. as much as possible and then some.
>=20
> Thing is, the macros are defined correctly if CONFIG_ISA is defined,=20
> which appears to be the case for e.g. amiga but not atari.

Perhaps I should try atari_defconfig and enable speakup. Or something=20
else.

It would be better if we used the same .config, don't you think?

Finn

>=20
> bye,
> //mirabilos
>=20
--0-1939136947-1286182071=:285--
