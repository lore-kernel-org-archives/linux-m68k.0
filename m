From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: m68k: kernel/up.c:16: error: dereferencing pointer to
 incomplete  type
Date: Sun, 15 Mar 2009 20:53:24 +1100
Message-ID: <20090315205324.1f475fac.sfr@canb.auug.org.au>
References: <10f740e80903120608v314be360u30911fa003ab5ebc@mail.gmail.com>
	<20090313142033.d69d9d2e.sfr@canb.auug.org.au>
	<10f740e80903130059h7c6b9b3bpe2a204eba15c37b6@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Sun__15_Mar_2009_20_53_24_+1100_atM661FUi9u6zmFR"
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:53835 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751698AbZCOJxd (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
	Sun, 15 Mar 2009 05:53:33 -0400
In-Reply-To: <10f740e80903130059h7c6b9b3bpe2a204eba15c37b6@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-next@vger.kernel.org, linux-m68k@vger.kernel.org, michael@ellerman.id.au

--Signature=_Sun__15_Mar_2009_20_53_24_+1100_atM661FUi9u6zmFR
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Geert,

On Fri, 13 Mar 2009 08:59:31 +0100 Geert Uytterhoeven <geert@linux-m68k.org=
> wrote:
>
> Ah, that explains it, thanks!
>=20
> I had also just noticed kernel/up.o was compiled twice, and the first
> one succeeded.
> Now I understand why...

This has now been fixed, thanks to Michael.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Sun__15_Mar_2009_20_53_24_+1100_atM661FUi9u6zmFR
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkm80BQACgkQjjKRsyhoI8zhcQCgqcji/SX+L8RMEPsMav12u0ON
uPgAoIQQ/ChLDTFy8GUpOd9IuAdF1O9x
=hM3u
-----END PGP SIGNATURE-----

--Signature=_Sun__15_Mar_2009_20_53_24_+1100_atM661FUi9u6zmFR--
