From: Ben Hutchings <ben@decadent.org.uk>
Subject: Re: aufs vs. m68k conflict, please advice
Date: Sat, 17 Dec 2011 16:29:35 +0000
Message-ID: <1324139375.2825.330.camel@deadeye>
References: <Pine.BSM.4.64L.1112161437090.856@herc.mirbsd.org>
	 <1324054093.2825.282.camel@deadeye>
	 <Pine.BSM.4.64L.1112171426140.856@herc.mirbsd.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-56QoyAzvFlMKpAA3Lhw9"
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from shadbolt.e.decadent.org.uk ([88.96.1.126]:42205 "EHLO
	shadbolt.e.decadent.org.uk" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751616Ab1LQQ3u (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>);
	Sat, 17 Dec 2011 11:29:50 -0500
In-Reply-To: <Pine.BSM.4.64L.1112171426140.856@herc.mirbsd.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Thorsten Glaser <tg@mirbsd.de>
Cc: linux-m68k@vger.kernel.org, Debian Kernel Team <debian-kernel@lists.debian.org>


--=-56QoyAzvFlMKpAA3Lhw9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 2011-12-17 at 14:28 +0000, Thorsten Glaser wrote:
> Ben Hutchings dixit:
>=20
> >why other architectures get away with it.  Maybe they just don't use
> >pr_*() in headers.
>=20
> Maybe something like this?
>=20
> #define ack_bad_irq(irq) do {					\
> 	pr_crit("unexpected IRQ trap at vector %02x\n",		\
> 	    (unsigned int)(irq));				\
> } while (/* CONSTCOND */ 0)
>=20
> This would defer pr_crit expansion to when the static inline
> function was actually used.

No, I don't think this is a bug in the header.

Ben.

--=20
Ben Hutchings
Computers are not intelligent.	They only think they are.

--=-56QoyAzvFlMKpAA3Lhw9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIVAwUATuzDb+e/yOyVhhEJAQrTyRAAl04MYXEHxeobafTkWDN73N6wyDRO79cc
brnvVGLh7tz/hs2Gpi/kixiVdq7Nh9nLbRi2ciV2gKJWV8/+y+oM5hoPR24T4EEt
VF704ekzmRyatb3JwN1ndcGkObcVzHKS0jOGl3yrtLY6sHQO1Mmsc3WrsmrXu8OY
eLCOOjoZ/1isEPxszf7/1BniezYC5niGwhHzmDbNOV9YsByX747qop2RzawfjhBR
t0BggJOWVXtSWKBZocUm3W9mFhb1zoeC9c5/MiN1cZL8Y/5G7Xy6H+qxRVC6dZ81
uuW2bgX/6WrRmtw9569oZsPFsqDasqWFPoQfbM52zeaCho8wtoRvGVV5vO6f8OhS
/n+QSdElistD0zKYPwepsEujoO+pjUeY3yKpDfQcIXsnvrlhQR/co8krdKmSZ1/L
JcsJ0Jwxfpghyw4hlCDPdILFJ+Jw7LmJoAvflhDxaKHUDnGpUeq+7cvjio/YibKJ
vuNvGXcnogtXY6JuD79Mz9DiB+ZkS7fFCACMUgTRnQ1W0ZEv8DXTs8AaaVoNnEYY
57vIa1hKeAK4Q2IHqAoW0e5/Fw0/sO40EbnJnmjFzgamPLM3iM5vVyH7b3upKQd4
TQtSJKN7TH9EFGGaORu+2jgbwdtCWDUx3Z29KzwcjYoSiSkp+byFOh8XCy8OhN9r
O47ueWKa2DE=
=P2J+
-----END PGP SIGNATURE-----

--=-56QoyAzvFlMKpAA3Lhw9--
