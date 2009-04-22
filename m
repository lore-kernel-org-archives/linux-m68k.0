From: Stephen R Marenka <stephen@marenka.net>
Subject: Re: debian kernel m68k patches for 2.6.29
Date: Wed, 22 Apr 2009 07:57:06 -0500
Message-ID: <20090422125706.GC5886@marenka.net>
References: <20090326123822.GD8081@marenka.net> <10f740e80903260610k29f73c4ci76594f46881e17a5@mail.gmail.com> <10f740e80903290607y743bada9w829754722e9f7d9f@mail.gmail.com> <20090421172039.GA26858@marenka.net> <10f740e80904220020o70837da9mfb74cbbfb0f917d3@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="0F1p//8PRICkK4MW"
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from smtp.knology.net ([24.214.63.101]:37154 "EHLO smtp.knology.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751650AbZDVNAS (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
	Wed, 22 Apr 2009 09:00:18 -0400
Content-Disposition: inline
In-Reply-To: <10f740e80904220020o70837da9mfb74cbbfb0f917d3@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: debian-68k@lists.debian.org, linux-m68k@lists.linux-m68k.org, linux-m68k@vger.kernel.org


--0F1p//8PRICkK4MW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 22, 2009 at 09:20:31AM +0200, Geert Uytterhoeven wrote:
> On Tue, Apr 21, 2009 at 19:20, Stephen R Marenka <stephen@marenka.net> wr=
ote:

> > http://wiki.debian.org/M68k/Kernel/Patches
>=20
> A few comments:
>   - If you cloned from linux-m68k.git, you don't have to do the `git
> remote add',
>     as `origin' is already the same remote.

Added.

>   - You may want to put a `sort' in the `find ../bugfix/m68k/2.6.29
> -print | sed -e 's;../;+ ;' | sed -e 's;$; m68k;' >> $series`
>     pipeline.

The patches come out numbered 0001-0090. I'm not sure what I can sort.

Thanks,

Stephen

--=20
Stephen R. Marenka     If life's not fun, you're not doing it right!
<stephen@marenka.net>

--0F1p//8PRICkK4MW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iD8DBQFJ7xQiVKM4J7YoSbMRAt35AJ9iPUngPNaqKCXT1xyFM79aa3AUwwCfYhug
6fMqihwd3CXx1djoBLuFqV0=
=aHMC
-----END PGP SIGNATURE-----

--0F1p//8PRICkK4MW--
