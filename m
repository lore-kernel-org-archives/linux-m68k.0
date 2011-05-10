From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: Debian kernel 2.6.38-5
Date: Tue, 10 May 2011 21:57:07 +1000 (EST)
Message-ID: <alpine.OSX.2.00.1105102031140.446@ibook.intranet>
References: <BANLkTimCKhPbp3wOCpVusHu1JmoyhwKX0w@mail.gmail.com> <Pine.BSM.4.64L.1105081254100.28983@herc.mirbsd.org> <20110508165909.GA16281@chumley.earth.sol> <Pine.BSM.4.64L.1105081834101.28983@herc.mirbsd.org> <20110508200802.GB16281@chumley.earth.sol>
 <alpine.OSX.2.00.1105090909080.194@ibook.intranet> <BANLkTin-bsA6KYbCawtrnUdQ-PhqGrTyOA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="0-1987532732-1305028627=:446"
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from vm4.telegraphics.com.au ([98.124.60.149]:35405 "EHLO
	vps4.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756040Ab1EJL4V (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 10 May 2011 07:56:21 -0400
In-Reply-To: <BANLkTin-bsA6KYbCawtrnUdQ-PhqGrTyOA@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: "Christian T. Steigies" <cts@debian.org>, Thorsten Glaser <tg@mirbsd.de>, linux-m68k@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--0-1987532732-1305028627=:446
Content-Type: TEXT/PLAIN; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE


On Tue, 10 May 2011, Geert Uytterhoeven wrote:

> On Mon, May 9, 2011 at 01:14, Finn Thain <fthain@telegraphics.com.au>=20
> wrote:
> > On Sun, 8 May 2011, Christian T. Steigies wrote:
> >>
> >> PS 2.6.28 did not boot: kernel too old. When was TLS introduced? I'll=
=20
> >> try to apply the patch you mentioned in your other message.
> >
> > I sometimes test network cards with busybox. It can be built without=20
> > linking in glibc and doesn't need TLS.
> >
> >
> >> [ =C2=A0130.870000] eth0: trigger_send() called with the transmitter b=
usy.
> >> [ =C2=A0132.240000] ------------[ cut here ]------------
> >> [ =C2=A0132.240000] WARNING: at net/sched/sch_generic.c:256 dev_watchd=
og+0x1ac/0x1cc()
> >> [ =C2=A0132.250000] NETDEV WATCHDOG: eth0 (): transmit queue 0 timed o=
ut
> >
> > Looks a lot like this problem:
> >
> > http://patchwork.ozlabs.org/patch/27774/
>=20
> Finn, could it also work if you remove the "#include "lib8390.c" from=20
> *8390.c? That would reduce code size for distro kernels, which would=20
> have too many copies of lib8390.c (for zorro8390, mac8390, hydra)?

ISTR that I tried the approach you suggest back when I fixed mac8390 but=20
couldn't make it fly but I don't recall why not.

I see that ax88796.c and ne-h8300.c also #include <lib8390.c>. In=20
ax88796.c I find this:

#define __ei_open ax_ei_open
#define __ei_close ax_ei_close
=2E..
#include "lib8390.c"

which would have been better than my patch for mac8390; without this=20
renaming you may not be able to link a sane multi-sub-arch m68k kernel.=20
OTOH, I don't know if it is possible to build a single 8390.o that can=20
work for multiple drivers either.

BTW, ne-h8300 appears to lack the fixes in your patch and mine and so it=20
probably doesn't work properly either.

I'm not really sure how to tackle this; I'd like to think that we could=20
use 8390.o for the m68k drivers at least but I need to investigate=20
further.

Finn

>=20
> Gr{oetje,eeting}s,
>=20
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 Geert
--0-1987532732-1305028627=:446--
