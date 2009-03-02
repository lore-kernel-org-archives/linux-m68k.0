From: Stephen R Marenka <stephen@marenka.net>
Subject: Re: debian kernel m68k patches for 2.6.28
Date: Mon, 2 Mar 2009 08:37:47 -0600
Message-ID: <20090302143747.GG10135__36496.2595202543$1236005355$gmane$org@marenka.net>
References: <20090301202823.GF13268@marenka.net> <10f740e80903020148i23db9424vd2fa529f6d7a4134@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="TakKZr9L6Hm6aLOc"
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from smtp.knology.net ([24.214.63.101]:35828 "EHLO smtp.knology.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752117AbZCBOrf (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
	Mon, 2 Mar 2009 09:47:35 -0500
Content-Disposition: inline
In-Reply-To: <10f740e80903020148i23db9424vd2fa529f6d7a4134@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: debian-68k@lists.debian.org, linux-m68k@lists.linux-m68k.org


--TakKZr9L6Hm6aLOc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 02, 2009 at 10:48:48AM +0100, Geert Uytterhoeven wrote:
> On Sun, Mar 1, 2009 at 21:28, Stephen R Marenka <stephen@marenka.net> wro=
te:
> > The debian 2.6.28 kernel has hit sid, so it's probably time to
> > update the m68k patches.

> Please note that I no longer maintain the quilt series file. I'm using
> git only now.

I was wondering if that wasn't true.

> For 2.6.28, there's a separate branch:
> http://git.kernel.org/?p=3Dlinux/kernel/git/geert/linux-m68k.git;a=3Dshor=
tlog;h=3Dm68k-v2.6.28
>=20
> Hmm, I've just noticed this is Linus' v2.6.28 with only a few new m68k
> patches applied, while I think
> I intended it to be the master (m68k) branch just after I merged it
> with v2.6.28, with newer
> critical patches applied when needed. Oh well...

So what do you recommend for 2.6.28? I'd like to get a functional=20
debian kernel in the meantime. Should I start with the quilt patches?

> But even if it was what I had intended, you'd still have to use `git
> cherry' to find the m68k-specific commits
> and import them into Debian. So I should have all changes nicely
> rebased (and reordered/squashed) against Linus' latest tree, so you
> can easily export them. This would also help in keeping track what
> needs to be submitted upstream.

That sounds like a whole new world of workflow to me. So I'll need
your 2.6.x, linus's 2.6.x, and debian svn to figure out which patches
need applying?

Thanks,

Stephen

--=20
Stephen R. Marenka     If life's not fun, you're not doing it right!
<stephen@marenka.net>

--TakKZr9L6Hm6aLOc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iD8DBQFJq+87VKM4J7YoSbMRAiO7AJ0XtMh0fmULo3U5ncBJIIS5z1PhGACfflN6
Mhs/gg9HLZK4S7fp8PFiDmw=
=r3ru
-----END PGP SIGNATURE-----

--TakKZr9L6Hm6aLOc--
