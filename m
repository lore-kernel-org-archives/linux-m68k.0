From: Thierry Reding <thierry.reding@avionic-design.de>
Subject: Re: [PATCH] clk: Make the managed clk functions generically available
Date: Wed, 19 Sep 2012 08:55:11 +0200
Message-ID: <20120919065510.GA3213__41350.8154023022$1348037746$gmane$org@avionic-0098.mockup.avionic-design.de>
References: <20120910003913.GM13739@n2100.arm.linux.org.uk>
 <504F4E36.20309@metafoo.de>
 <1347375033.27206.3.camel@sauron.fi.intel.com>
 <504FE633.2090304@snapgear.com>
 <5050F3DB.1050202@metafoo.de>
 <20120915213151.GM12245@n2100.arm.linux.org.uk>
 <20120918080037.GA15982@avionic-0098.mockup.avionic-design.de>
 <20120918093536.GV12245@n2100.arm.linux.org.uk>
 <20120918112555.GA21004@avionic-0098.mockup.avionic-design.de>
 <20120918204014.GY12245@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="FL5UXtIhxfXey3p5"
Return-path: <linux-m68k-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20120918204014.GY12245@n2100.arm.linux.org.uk>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Lars-Peter Clausen <lars@metafoo.de>, Greg Ungerer <gerg@snapgear.com>, dedekind1@gmail.com, Mark Brown <broonie@opensource.wolfsonmicro.com>, linux-kernel@vger.kernel.org, stable@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>, linux-m68k@lists.linux-m68k.org, Greg Ungerer <gerg@uclinux.org>, linux-arm-kernel@lists.infradead.org, Mike Turquette <mturquette@ti.com>


--FL5UXtIhxfXey3p5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 18, 2012 at 09:40:14PM +0100, Russell King - ARM Linux wrote:
> On Tue, Sep 18, 2012 at 01:25:55PM +0200, Thierry Reding wrote:
> > On Tue, Sep 18, 2012 at 10:35:36AM +0100, Russell King - ARM Linux wrot=
e:
> > > On Tue, Sep 18, 2012 at 10:00:37AM +0200, Thierry Reding wrote:
> > > > On Sat, Sep 15, 2012 at 10:31:52PM +0100, Russell King - ARM Linux =
wrote:
> > > > > On Wed, Sep 12, 2012 at 10:43:07PM +0200, Lars-Peter Clausen wrot=
e:
> > > > > > I wouldn't mind having this merged sooner rather than later, th=
ere is at least
> > > > > > one driver in next which is currently broken due to the missing=
 devm_clk_get.
> > > > > > Russell what's your plan for the patch? Maybe under the given c=
ircumstances it
> > > > > > makes sense to let it go through the m68k tree.
> > > > >=20
> > > > > Ok, I've merged it but there was no indication in the patch that =
it was
> > > > > supposed to be a fix... there's no cc: to stable.  Does it need t=
o go to
> > > > > stable?  When was this brokenness introduced?  What's the story f=
or the
> > > > > m68k bit?
>=20
> I said abouve "I've merged it" - that means, I've put it in my
> tree...
>=20
> > > > What tree is this supposed to go through? I've checked your ARM tre=
e as
> > > > well as Mike's clock tree but neither seem to carry this patch. The
> > > > reason I ask is because I want to take a patch series that converts=
 the
> > > > Unicore32 PWM code to the PWM framework into linux-next but it depe=
nds
> > > > on this patch as well.
> > >=20
> > > It /is/ in my tree (you'll notice that it is in linux-next.)  You're
> > > probably looking at my Linaro tree instead, which doesn't carry
> > > anything which isn't about to be sent to Linus.
> >=20
> > I must be blind then. next-20120918 doesn't have it. And looking at your
> > tree here[0] doesn't show the commit either.
>=20
> Hmm, it's possible I didn't push the tree out... well, I have done so
> now, so it should be visible from tonight onwards and should be in
> -next sometime during the next couple of days (it seems to take a
> couple of days between me pushing stuff out one evening to stuff
> appearing in -next because of the timezones and timing of sfr's pulls.)

Okay, I see it both in your tree and in linux-next now. Thanks!

Thierry

--FL5UXtIhxfXey3p5
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJQWWxOAAoJEN0jrNd/PrOhrvEP/1MGEbTNfLOJenwc5VvkXaJj
FtdagDJlUsmFr4dayjtWVItm6tEqp7Ahrdbsui14xUMV2VuFxAcOnqQQ8WTZ5E9e
O1jxTCzUK9VC24M1U3w/xq6swIzaSrlp1/j5Bfi3z2tRRLM/b8wHn453sN39k35u
owZDIUVlN5ll9VZenM6LcDyZDHwv9Sw5jcZUEjxMXCwnDSU+FUbQqmSkBxi98sUD
jY7vuXmX9a4q8GdEL7Ar8JctQZsf+ZYKKjeQcHuI2Cg0R14eyCP0vcW1S3/O2Fu+
Cuj85l22PNP+zQNXOSVByAQ9YgnflMLueZ/udA7kn74OLMpgPC2GZkQjOcDW7yF6
2Hl4UD+e4KKHGxWeLi3jS74rRSlJejHPxKO9xiT2Bm8btYrI8nzedTyod0jlfQIL
GtYSB0hVlokctNU4ozt3z2hkS//GtXJSZZ5hhN50faI5S4kzQZAwjzN5Mt1ck0nO
reug0hCvmbrEfU9bEqYvo+VcCdjD+QmfSWfEt4HXZne9eUzibKKJ1SxghvP64+0E
agCYa+D9ONMaHYb+O4G4LLLACBG9xHhkgA35wrxLSQQnXkHkIiAHO70y9lqhGC6x
lJQ0yNVnLUyajtZR7Y8cPcWNIvqns0OYMdt+WWRA1qcj12Gn/DLROomd0RRKIAEc
t/SaDDpDrOvS/YfPOWRe
=Pu2i
-----END PGP SIGNATURE-----

--FL5UXtIhxfXey3p5--
