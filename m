From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: [PATCH 1/1] m68k: add missing I/O macros {in,out}{w,l}_p() for
 !CONFIG_ISA
Date: Mon, 4 Oct 2010 21:22:52 +1100 (EST)
Message-ID: <alpine.OSX.2.00.1010042115260.285@localhost>
References: <Pine.BSM.4.64L.1010031832530.15165@herc.mirbsd.org> <Pine.BSM.4.64L.1010031846060.15165@herc.mirbsd.org> <alpine.OSX.2.00.1010041149030.285@localhost> <Pine.BSM.4.64L.1010040738160.22274@herc.mirbsd.org> <alpine.OSX.2.00.1010041943530.285@localhost>
 <Pine.BSM.4.64L.1010040906400.22591@herc.mirbsd.org>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="0-1765299851-1286187633=:285"
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from www.telegraphics.com.au ([204.15.192.19]:35280 "EHLO
	mail.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754495Ab0JDKWv (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 4 Oct 2010 06:22:51 -0400
In-Reply-To: <Pine.BSM.4.64L.1010040906400.22591@herc.mirbsd.org>
Content-ID: <alpine.OSX.2.00.1010042121000.285@localhost>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Thorsten Glaser <tg@mirbsd.de>
Cc: linux-m68k@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--0-1765299851-1286187633=:285
Content-Type: TEXT/PLAIN; CHARSET=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Content-ID: <alpine.OSX.2.00.1010042121001.285@localhost>


It builds for me if I disable CONFIG_SPEAKUP. Otherwise, I get:

drivers/staging/speakup/speakup_dtlk.c: In function 'synth_probe':
drivers/staging/speakup/speakup_dtlk.c:339: error: implicit declaration of =
function 'inw_p'
make[3]: *** [drivers/staging/speakup/speakup_dtlk.o] Error 1
make[2]: *** [drivers/staging/speakup] Error 2
make[1]: *** [drivers/staging] Error 2
make: *** [drivers] Error 2

OTOH, I am using my own build of gcc 4.4.4-8 and none of this was built=20
with apt, so YMMV...

I suppose another alternative would be to omit or reverse the patch that=20
adds speakup in the first place, if that's more convenient.

Finn


On Mon, 4 Oct 2010, Thorsten Glaser wrote:

> Finn Thain dixit:
>=20
> >It would be better if we used the same .config, don't you think?
>=20
> *sigh*
>=20
> # apt-get source linux-2.6
> # cd linux-2.6-2.6.32
>=20
> optionally:
> # $EDITOR debian/config/m68k/defines
> =E2=87=92 in [base] comment out everything except =E2=80=9Cflavours:=E2=
=80=9D and =E2=80=9Catari=E2=80=9D
>   to save time compiling the other images
>=20
> then:
> # debian/rules clean
> (this may give you an error message)
> # dpkg-buildpackage -B
>=20
>=20
> So, no modifications to stock Debian. Well, except for #598893=E2=80=A6
>=20
> bye,
> //mirabilos
>=20
--0-1765299851-1286187633=:285--
