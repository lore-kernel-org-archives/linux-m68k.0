From: Stephen R Marenka <stephen@marenka.net>
Subject: Re: debian kernel m68k patches for 2.6.29
Date: Tue, 21 Apr 2009 12:20:39 -0500
Message-ID: <20090421172039.GA26858__47828.080567024$1240335522$gmane$org@marenka.net>
References: <20090326123822.GD8081@marenka.net> <10f740e80903260610k29f73c4ci76594f46881e17a5@mail.gmail.com> <10f740e80903290607y743bada9w829754722e9f7d9f@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Dxnq1zWXvFF0Q93v"
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from smtp.knology.net ([24.214.63.101]:56069 "EHLO smtp.knology.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753127AbZDURhE (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
	Tue, 21 Apr 2009 13:37:04 -0400
Content-Disposition: inline
In-Reply-To: <10f740e80903290607y743bada9w829754722e9f7d9f@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: debian-68k@lists.debian.org, linux-m68k@lists.linux-m68k.org


--Dxnq1zWXvFF0Q93v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 29, 2009 at 03:07:57PM +0200, Geert Uytterhoeven wrote:
> On Thu, Mar 26, 2009 at 15:10, Geert Uytterhoeven <geert@linux-m68k.org> =
wrote:
> > On Thu, Mar 26, 2009 at 13:38, Stephen R Marenka <stephen@marenka.net> =
wrote:
> >> So 2.6.29 has hit sid. Anyone want to update the kernel patches? Also,
> >> what patches to apply now that we have git-based goodness?
> >
> > You can start with the ones on the for-next branch.
> > I still have to cherry-pick the others to the (to be created) queue bra=
nch.
> > I'll let you know when I'm finished.
>=20
> Now my git skills have been growing, I created two new branches:
>   - m68k-v2.6.29
>   - queue

That pretty much rocks! Here's my process in case someone else wants
it or wants to fix it. :)

The only downside seems to be the 47 patch difference between m68k
and the point release or whatever else happened on top of 2.6.29.=20
Those pretty much all conflicted.

I just pushed the patches for debian 2.6.29-4.

http://wiki.debian.org/M68k/Kernel/Patches

Thanks,

Stephen

--=20
Stephen R. Marenka     If life's not fun, you're not doing it right!
<stephen@marenka.net>

--Dxnq1zWXvFF0Q93v
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iD8DBQFJ7gBnVKM4J7YoSbMRApwyAJwL5KwJ4mlhTzDhlLL4E7YVNsiTDwCeN4Tl
iograkmgwXlIMaEuVmgr9EE=
=nX/R
-----END PGP SIGNATURE-----

--Dxnq1zWXvFF0Q93v--
