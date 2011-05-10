From: "Christian T. Steigies" <cts@debian.org>
Subject: Re: Debian kernel 2.6.38-5
Date: Tue, 10 May 2011 09:00:02 +0200
Message-ID: <20110510070002.GA32329@chumley.earth.sol>
References: <BANLkTimCKhPbp3wOCpVusHu1JmoyhwKX0w@mail.gmail.com>
 <Pine.BSM.4.64L.1105081254100.28983@herc.mirbsd.org>
 <20110508165909.GA16281@chumley.earth.sol>
 <Pine.BSM.4.64L.1105081834101.28983@herc.mirbsd.org>
 <20110508200802.GB16281@chumley.earth.sol>
 <alpine.OSX.2.00.1105090909080.194@ibook.intranet>
 <BANLkTim6_gHr_re0bv0eTWCQ7=5AG1HzwQ@mail.gmail.com>
 <20110509202559.GA27320@chumley.earth.sol>
 <BANLkTinP_U1c+X_zVrT1zXdzVh_p=STP0Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-in-13.arcor-online.net ([151.189.21.53]:34419 "EHLO
	mail-in-13.arcor-online.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753589Ab1EJG6l (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>);
	Tue, 10 May 2011 02:58:41 -0400
Content-Disposition: inline
In-Reply-To: <BANLkTinP_U1c+X_zVrT1zXdzVh_p=STP0Q@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@googlemail.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Finn Thain <fthain@telegraphics.com.au>, Thorsten Glaser <tg@mirbsd.de>, linux-m68k@vger.kernel.org

On Tue, May 10, 2011 at 10:49:45AM +1200, Michael Schmitz wrote:
> Christian,
>=20
>=20
> > I applied the following patch and it works! apt-get update that is,=
 there is
> > no sshd on this freshly installed system yet...
> >
> > I also changed this line to have 4 underscores at the beginning:
> >
> > =A0 =A0 =A0 =A0{ 0xec940559, "____alloc_ei_netdev" },
>=20
> Where does that appear? Can't find it in drivers/net anywhere.

It's in zorro8390.mod.c, but *.mod.c is listed in .gitignore, so it mus=
t be
a remnant of my experiments with git and older branches. I wonder why i=
t has
been compiled, though, I did not change any of the Makefiles.
=20
> > it does not show up in git diff, so I am not sure if this is a left=
over from
> > a previous checkout, or if it is also needed. And if it is needed, =
if it
> > should be two underscores or four or none, and if so why or why not=
=2E..
> > Looking at the other drivers, there does not seem to be a lot of co=
nsistency?
>=20
> ____alloc_ei_netdev is the function defined in lib8390.c which is
> called by the individual drivers from their respective
> __alloc_ei_netdev().
>=20
> The only symbol exported by zorro8390.c should be __alloc_ei_netdev -
> if your above change was done in some symbol exports file it should
> probably have been left at __alloc_ei_netdev.

I did none of that, but to be sure, I should build another kernel with
Geert's patch on a clean checkout.=20

I installed a few packages, rebooted to check if the network is set up
automatically (it is!), and installed more packages. Now I am upgrading
some more and I see reasonable download speeds: 140kB/s. However, I als=
o saw
this flying by:

eth0: Interrupted while interrupts are masked! isr=3D0x0 imr=3D0x0.

Three times in about one minute. The whole system is a bit more respons=
ive
now (I an log in on a second console without a long delay). I could not=
 log
in with ssh yet, though I get a little bit further than yesterday, ther=
e is
some response already from the remote system.

Christian
