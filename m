From: Ben Hutchings <ben@decadent.org.uk>
Subject: Re: [PATCH] m68k: Correct the Atari ALLOWINT definition
Date: Mon, 06 Aug 2012 02:03:53 +0100
Message-ID: <1344215033.13142.82.camel@deadeye.wl.decadent.org.uk>
References: <1344028877-18838-1-git-send-email-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-q5uQjWS4cpSLMWWo6Vy1"
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1344028877-18838-1-git-send-email-geert@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: stable@vger.kernel.org, linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, Mikael Pettersson <mikpe@it.uu.se>


--=-q5uQjWS4cpSLMWWo6Vy1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2012-08-03 at 23:21 +0200, Geert Uytterhoeven wrote:
> From: Mikael Pettersson <mikpe@it.uu.se>
>=20
> commit c663600584a596b5e66258cc10716fb781a5c2c9 upstream.
>=20
> Booting a 3.2, 3.3, or 3.4-rc4 kernel on an Atari using the
> `nfeth' ethernet device triggers a WARN_ONCE() in generic irq
> handling code on the first irq for that device:
[...]

Added to the queue for 3.2, thanks.

Ben.

--=20
Ben Hutchings
Theory and practice are closer in theory than in practice.
                                - John Levine, moderator of comp.compilers

--=-q5uQjWS4cpSLMWWo6Vy1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIVAwUAUB8X+ee/yOyVhhEJAQq6bg/9HsIKRsPecoiR+iWMowLvyRSqgO8X00Zq
52lkkcEpFOY+qDxO/q06kg4458bHEpNBLH4mY+94sIHKwwCj1YeX4pyx2CTFw1db
tqyjFF0Oa12B9znwbdbuuV+KxzhoW372CH4lWvZCdwOUhaDJRBR2RkCW2weKt/Bo
09IBKdStGM8bvByj0I6VLxbP6zh8GEOaEvp5+20nLQlkMXrjh6sqIBm10y3tYz4u
iLGsgOU/LuITLryrSnG4NZVmleVxPRPO54Lj7fkTtY7bSIxFjBO7NZX8cz1j04Tf
lVD3MYVvneoz+O2aNczO3Rv2G20uECLBM8VXrgOZc72b05Y/BTo2/WmEg9keut2T
QFCiWpOMOcLSf7qwnzlpO+jJrX7ovj9ENLnB0J+ljxm9R49xr2ismxnmNZTPSARJ
wrAvPMNdqpR9gQxu+JBJN08xVwlOkDwZX1LVlsRjxy89iMQN1HMXtmvzL8Q1HBqJ
xQIONUnq06zwlQmrypaQ2igq13sbZ0GEPdK2ui5Y2UEisbsKkd+a23yo6VZAY9Ti
icDunvu0cob4u5ThNkYwkJ3W+lIvnM/7siSqzq5sGWe+UkLlVAf0fpXIXRPBvO91
T/BsBIYjgJTK4m16fEcfRDh5iHrzsQo/FZ/5FZcYqWS4QmgLi9y3+rupdKVe3AIV
RgxbKq3oaO8=
=thAG
-----END PGP SIGNATURE-----

--=-q5uQjWS4cpSLMWWo6Vy1--
