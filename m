From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: [PATCH 1/1] m68k: add missing I/O macros {in,out}{w,l}_p() for
 !CONFIG_ISA
Date: Mon, 4 Oct 2010 20:08:26 +1100 (EST)
Message-ID: <alpine.OSX.2.00.1010041955060.285@localhost>
References: <Pine.BSM.4.64L.1010031832530.15165@herc.mirbsd.org> <Pine.BSM.4.64L.1010031846060.15165@herc.mirbsd.org> <AANLkTinJbQY_4jg4dWUA6QxE+zu9=Phcd4o7DDu=UfeR@mail.gmail.com> <Pine.BSM.4.64L.1010040809360.8491@herc.mirbsd.org>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="0-1686207583-1286183306=:285"
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from www.telegraphics.com.au ([204.15.192.19]:34295 "EHLO
	mail.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753497Ab0JDJI0 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 4 Oct 2010 05:08:26 -0400
In-Reply-To: <Pine.BSM.4.64L.1010040809360.8491@herc.mirbsd.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Thorsten Glaser <tg@mirbsd.de>
Cc: linux-m68k@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--0-1686207583-1286183306=:285
Content-Type: TEXT/PLAIN; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE


On Mon, 4 Oct 2010, Thorsten Glaser wrote:

> Besides, it=E2=80=99s easier to get a bunch of modules that don=E2=80=99t=
 do anything=20
> except say the hardware they steer isn=E2=80=99t available to compile tha=
n to=20
> change the config

Which modules are we talking about? In 2.6.32-23, debian patches speakup=20
into drivers/staging but I don't see it in mainline drivers/accessibility=
=20
or drivers/staging.

If the bug is not in the mainline, then the fix should arguably be=20
downstream too. (Policy seems to be that the mainline doesn't carry code=20
that doesn't have in-tree users.)

> (especially as the latter potentially has to be done for every new=20
> kernel version, and I=E2=80=99d rather keep things working, as they seem =
to=20
> change very quickly and nobody can keep up really).

Is it easier to maintain local patches from one debian release to another=
=20
than it is to maintain .config changes?

Finn

>=20
> bye,
> //mirabilos
>=20
--0-1686207583-1286183306=:285--
