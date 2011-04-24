From: Ben Hutchings <ben@decadent.org.uk>
Subject: Re: Debian/m68k kernel (preview)
Date: Sun, 24 Apr 2011 05:00:02 +0100
Message-ID: <1303617602.3032.86.camel@localhost>
References: <BANLkTi=6T8SxqnsXTY5ceyikg2NTKLVSKw@mail.gmail.com>
	 <BANLkTimN4vbAPJVKgH8iTZy7B5Fr8B+ibA@mail.gmail.com>
	 <BANLkTikSRStQO6cyE+L2vHHe0TnkoBe8=A@mail.gmail.com>
	 <BANLkTim_A-r4Khdx20tLKFU8ybtB+=wcyg@mail.gmail.com>
	 <BANLkTin4=QFyQUT95d7eoXXrdkNJc=T9Tw@mail.gmail.com>
	 <Pine.BSM.4.64L.1104231534340.3979@herc.mirbsd.org>
	 <20110423185725.GA16947@chumley.earth.sol>
	 <Pine.BSM.4.64L.1104232054070.3979@herc.mirbsd.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512"; protocol="application/pgp-signature"; boundary="=-DSrUb9Ek6fS2LyZeeQ7O"
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from shadbolt.e.decadent.org.uk ([88.96.1.126]:57314 "EHLO
	shadbolt.e.decadent.org.uk" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1750716Ab1DXEAK (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>);
	Sun, 24 Apr 2011 00:00:10 -0400
In-Reply-To: <Pine.BSM.4.64L.1104232054070.3979@herc.mirbsd.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Thorsten Glaser <tg@mirbsd.de>
Cc: Debian Kernel Team <debian-kernel@lists.debian.org>, linux-m68k@vger.kernel.org


--=-DSrUb9Ek6fS2LyZeeQ7O
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 2011-04-23 at 21:00 +0000, Thorsten Glaser wrote:
> Christian T. Steigies dixit:
>=20
> >As Geert wrote, almost all patches will make it into the official kernel
> >tree, only m68k usually needs them a little sooner.
>=20
> OK, I=E2=80=99ve tracked down the patches that were indeed submitted,
> added the SLUB workaround, and prepared another source package.
> It=E2=80=99s currently building (cross, for speed of testing), but if
> you like, you can review the patch I=E2=80=99d ask the Debian Kernel
> Team to include later (if this works). My patch is based on
> linux-2.6_2.6.38-3 since that=E2=80=99s what was in main when I began,
> but should work against the scheduled -4, too. I=E2=80=99ve reduced
> the number of patches to what I think is the minimum needed.

You don't need to unset ECONET or X25 in debian/config/m68k/config; they
are explicitly unset in the top-level config.

> Some of the changes to debian/config/m68k/* were already in
> sid/2.6.32 in Debian but not in what was trunk back then, so
> I=E2=80=99ve re-added them. I think they come from Stephen Marenka.
>=20
> I don=E2=80=99t know how the ABI files are generated, there=E2=80=99s non=
e for
> m68k yet. Please tell me if I have to do something.
[...]

They are based on the Module.symvers files generated during a build and
included in the linux-headers-* packages.  They are added to the *next*
version of the source package if we are intending to maintain the ABI,
using debian/bin/abiupdate.py.  If there has not been a successful build
of kernel version '2.6.38-2' for m68k then there is no need to add them.

Ben.

--=20
Ben Hutchings
Once a job is fouled up, anything done to improve it makes it worse.

--=-DSrUb9Ek6fS2LyZeeQ7O
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIVAwUATbOgQee/yOyVhhEJAQrUNQ/+NUG/tzjB5MH4VO399smF0yXrDm5/oye8
RpfwMNVT/9jcL8mFZp3nwrvnb50NKo77tJuQbBopgpCoSHV//L1sTWvnQ3WJzhJP
chtvA8ZbTbBd2AXQeiPyHCA914h+vNT21l9OwmUWqk2GjhC6VQH+dEN9Y4Q9qZyZ
tStey/8nx+6cZfX+xQAlfIE/YlPus0y+jx7BD552srnjCMyQb2sqd0f7sxdON1Av
TImcGXd1ozXRJcflgiXY1wTFCWSEXxiQyb0WX1YkPxBRF1CI8CrHoRSHPMg837VW
Gfb3XCfqTd1hlfblQJIgI3ItNBHZk99neh0QNhywR95SgNQNJIglIEBY/1aSBIxW
2UU7XKgfYFf0javkncO2BDQeusmhWhzVDfGRDI7UYuNxi3OfSwmAn56/IHYE/k8v
zhLwiY6h31w9lz7WXdWrTOQueT2Vj9MOdPaKB2DaT7Z3rPd6p+kvnFYnHAr9JQZu
l+zfwy6VkmhH6t/1zUs7ITf+H4nZWWo2OOI3Ap/5hO7DyBFaQunbQVW0aV00bvWG
ERjc+yWLAcl8UOkDB+9n7PXrnydlsBs7WvgAZh8EU3KNfEFhlyTHV1Mcx5DM1ndP
ur1TeJdviOLTRwy6Gb5CYzvdZbav2GfH1o5tFmIsa6jD4fSxsoS/Eme5elULDjC7
AoGsvlqSVC4=
=Hzrz
-----END PGP SIGNATURE-----

--=-DSrUb9Ek6fS2LyZeeQ7O--
