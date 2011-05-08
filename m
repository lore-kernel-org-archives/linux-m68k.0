From: "Christian T. Steigies" <cts@debian.org>
Subject: Re: Debian kernel 2.6.38-5
Date: Sun, 8 May 2011 23:45:46 +0200
Message-ID: <20110508214546.GC16281@chumley.earth.sol>
References: <BANLkTimCKhPbp3wOCpVusHu1JmoyhwKX0w@mail.gmail.com>
 <Pine.BSM.4.64L.1105081254100.28983@herc.mirbsd.org>
 <20110508165909.GA16281@chumley.earth.sol>
 <Pine.BSM.4.64L.1105081834101.28983@herc.mirbsd.org>
 <20110508200802.GB16281@chumley.earth.sol>
 <BANLkTin7E_Aedv8RAeaAfR_+me3YZgsbjw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-in-03.arcor-online.net ([151.189.21.43]:42909 "EHLO
	mail-in-03.arcor-online.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753655Ab1EHVo2 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 8 May 2011 17:44:28 -0400
Content-Disposition: inline
In-Reply-To: <BANLkTin7E_Aedv8RAeaAfR_+me3YZgsbjw@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@googlemail.com>
Cc: Thorsten Glaser <tg@mirbsd.de>, linux-m68k@vger.kernel.org

On Mon, May 09, 2011 at 08:58:00AM +1200, Michael Schmitz wrote:
> Christian,
>=20
> > Yes, but I am not trying to build a debian package, I try to build =
directly
> > from linux-m68k. This has worked, only the Amiga complained a missi=
ng
> > modules.dep (but I built in the network driver):
>=20
> Run depmod -a after the Amiga has booted.

I guess I did not have the modules on the linux partition yet...
=20
> > make ARCH=3Dm68k CROSS_COMPILE=3Dm68k-linux-gnu-
> > make ARCH=3Dm68k CROSS_COMPILE=3Dm68k-linux-gnu- INSTALL_MOD_PATH=3D=
/data/m68k modules_install
> >
> > The kernel boots, it configures the network (static). When I try to=
 ping a
> > host on my network, I get this oops(?). =A0A few seconds later I al=
so get the
> > mismatch message I reported earlier (does not show up in dmesg?).
>=20
> It should show up - if it's being printed to the console it has to be
> in the kernel log buffer for klogd to pick up.

You are right, I did not wait long enough. In 2.6.32 I see it in dmesg,=
 same
error as before :-(
In addition the network module (and I thought it was built in...) did n=
ot
get loaded on boot. After insmoding it (modprobe did not work), the err=
ors
came back. In addition sshd was blocking the kernel, so the system was
fairly unresponsive.

2.6.30 with TLS patch does not boot, I guess I did something wrong (do =
I
need to activate a kernel option?).

enough for today... but since Geert has found the problem, I hope a pat=
ch is
not far away :-)

Christian
