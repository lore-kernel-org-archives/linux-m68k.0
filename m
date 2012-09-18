From: Thierry Reding <thierry.reding@avionic-design.de>
Subject: Re: [PATCH] clk: Make the managed clk functions generically available
Date: Tue, 18 Sep 2012 13:25:55 +0200
Message-ID: <20120918112555.GA21004@avionic-0098.mockup.avionic-design.de>
References: <20120910001524.GL13739@n2100.arm.linux.org.uk>
 <20120910002020.GB16249@opensource.wolfsonmicro.com>
 <20120910003913.GM13739@n2100.arm.linux.org.uk>
 <504F4E36.20309@metafoo.de>
 <1347375033.27206.3.camel@sauron.fi.intel.com>
 <504FE633.2090304@snapgear.com>
 <5050F3DB.1050202@metafoo.de>
 <20120915213151.GM12245@n2100.arm.linux.org.uk>
 <20120918080037.GA15982@avionic-0098.mockup.avionic-design.de>
 <20120918093536.GV12245@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ZPt4rx8FFjLCG7dd"
Return-path: <linux-m68k-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20120918093536.GV12245@n2100.arm.linux.org.uk>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Lars-Peter Clausen <lars@metafoo.de>, Greg Ungerer <gerg@snapgear.com>, dedekind1@gmail.com, Mark Brown <broonie@opensource.wolfsonmicro.com>, linux-kernel@vger.kernel.org, stable@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>, linux-m68k@lists.linux-m68k.org, Greg Ungerer <gerg@uclinux.org>, linux-arm-kernel@lists.infradead.org, Mike Turquette <mturquette@ti.com>


--ZPt4rx8FFjLCG7dd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 18, 2012 at 10:35:36AM +0100, Russell King - ARM Linux wrote:
> On Tue, Sep 18, 2012 at 10:00:37AM +0200, Thierry Reding wrote:
> > On Sat, Sep 15, 2012 at 10:31:52PM +0100, Russell King - ARM Linux wrot=
e:
> > > On Wed, Sep 12, 2012 at 10:43:07PM +0200, Lars-Peter Clausen wrote:
> > > > I wouldn't mind having this merged sooner rather than later, there =
is at least
> > > > one driver in next which is currently broken due to the missing dev=
m_clk_get.
> > > > Russell what's your plan for the patch? Maybe under the given circu=
mstances it
> > > > makes sense to let it go through the m68k tree.
> > >=20
> > > Ok, I've merged it but there was no indication in the patch that it w=
as
> > > supposed to be a fix... there's no cc: to stable.  Does it need to go=
 to
> > > stable?  When was this brokenness introduced?  What's the story for t=
he
> > > m68k bit?
> >=20
> > What tree is this supposed to go through? I've checked your ARM tree as
> > well as Mike's clock tree but neither seem to carry this patch. The
> > reason I ask is because I want to take a patch series that converts the
> > Unicore32 PWM code to the PWM framework into linux-next but it depends
> > on this patch as well.
>=20
> It /is/ in my tree (you'll notice that it is in linux-next.)  You're
> probably looking at my Linaro tree instead, which doesn't carry
> anything which isn't about to be sent to Linus.

I must be blind then. next-20120918 doesn't have it. And looking at your
tree here[0] doesn't show the commit either.

> I'll publish the branch for this in the next couple of days.

Are you saying you haven't pushed the branch containing this commit to
your tree yet? That would certainly explain why I can't find it. Sorry
if I'm being dense.

I'll assume that it'll show up in linux-next eventually and that I can
push the dependent series as well.

Thierry

[0]: git://ftp.arm.linux.org.uk/pub/linux/arm/kernel/git-cur/linux-arm.git

--ZPt4rx8FFjLCG7dd
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJQWFpDAAoJEN0jrNd/PrOh0NcP/32VDBgiURgyiHjhVOEd8JgX
Fnct5okWgTzXVfUcwxsZ1sFE7TI8DJupMcUJHC87q4OFDtnqgfNQ3gtL5hGN8DMe
WEdmxcd3K1DlM9NMoL/cJrwcr46JHtKeGO9SKmpNWmEAKAug92jwmMZ/FHrWVN92
t9S/2y05EqXv3HMWY9uZf40eT939NvoZ2V4HGwzOYZmuj/EyMbmmtaELu+m+cWMb
3ZtSdkavHysTBV5SvNNxVVGxmU2c/5GiHlXcVXCSgwm/y60Svf06yNPTxnoyx+fk
AZucnmyJ3DZC9IIDZOxZowIi6Cf0tdEHHRaSIFTqm06pRksXkvTYFR/DwTNh/N7x
L0aWNl15jj3ofy26LtUIA3aYCbdlTIiS1PKAP2lEoGpMM6bvXgsv7JfPlTX23CBb
qNXoN7FdiFJlGKQSrqlPNKjlFFzK5WEYA3XSjYUGeiDoXrjG7Kvwyeww3AlJzVnj
yxamWTQ5LHgEYX/7y5RKx9xmAnPo4rdGJ0w+0BJNMGr0FTdU6Vji6NOOmq3ehRlJ
MlEFmkxwsPXvRNwnJLMeVrip2K/p4MLlOOClySXYzCablvFdnq+aeL+7Rw8C5UfA
tKu6QQ/TLtT/RA9lUsrOqATJjSGFrz5T7stXMJUpnK0oikc4RreGaC/reqLDtgU5
Uh26peyN72W9PS8lnl+U
=1g/Z
-----END PGP SIGNATURE-----

--ZPt4rx8FFjLCG7dd--
