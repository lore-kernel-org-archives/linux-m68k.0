From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: [PATCH 1/1] m68k: add missing I/O macros {in,out}{w,l}_p() for
 !CONFIG_ISA
Date: Mon, 4 Oct 2010 21:51:21 +1100 (EST)
Message-ID: <alpine.OSX.2.00.1010042123060.285@localhost>
References: <Pine.BSM.4.64L.1010031832530.15165@herc.mirbsd.org> <Pine.BSM.4.64L.1010031846060.15165@herc.mirbsd.org> <AANLkTinJbQY_4jg4dWUA6QxE+zu9=Phcd4o7DDu=UfeR@mail.gmail.com> <Pine.BSM.4.64L.1010040809360.8491@herc.mirbsd.org> <alpine.OSX.2.00.1010041955060.285@localhost>
 <Pine.BSM.4.64L.1010041016060.29280@herc.mirbsd.org>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="0-1558580085-1286189481=:285"
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from www.telegraphics.com.au ([204.15.192.19]:35648 "EHLO
	mail.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755112Ab0JDKvU (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 4 Oct 2010 06:51:20 -0400
In-Reply-To: <Pine.BSM.4.64L.1010041016060.29280@herc.mirbsd.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Thorsten Glaser <tg@debian.org>
Cc: linux-m68k@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--0-1558580085-1286189481=:285
Content-Type: TEXT/PLAIN; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE


On Mon, 4 Oct 2010, Thorsten Glaser wrote:

> Finn Thain dixit:
>=20
> Besides, this seems like a simple fix or an accidental omission to me.=20
> What is with all this bikeshedding?

It isn't bikeshedding. Recall that I built these sources a few weeks ago=20
when you mentioned the speakup issue in private correspondence. At the=20
time, I built speakup in 2.6.32-23 to see if it would behave differently=20
than the 2.6.3[45] sources that were giving you grief.

It built for me at the time, so I was suprised to find out it didn't build=
=20
for you, and naturally I wanted to know what I did wrong.

It may be that speakup works on amiga and atari (I don't know). It doesn't=
=20
work on mac as there are no audio drivers. It has long frustrated me that=
=20
there is bloat in the debian kernel configs. So perhaps I am guilty of=20
being unfairly obstructionist here, in the hope that the config file=20
issues could be addressed. My apologies.

> Some macros are not available on m68k if CONFIG_ISA is not set, but they=
=20
> are available =E2=80=9Calmost=E2=80=9D or even really everywhere else, so=
 drivers use=20
> them, so m68k is buggy in not providing them. (Outsider=E2=80=99s PoV.)

You may be right. I confess to being ignorant when it comes to ISA.

Finn

>=20
> bye,
> //mirabilos
>=20
--0-1558580085-1286189481=:285--
