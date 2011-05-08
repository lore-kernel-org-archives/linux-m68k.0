From: Thorsten Glaser <tg@mirbsd.de>
Subject: Re: Debian kernel 2.6.38-5
Date: Sun, 8 May 2011 21:30:30 +0000 (UTC)
Message-ID: <Pine.BSM.4.64L.1105082127170.28983@herc.mirbsd.org>
References: <BANLkTimCKhPbp3wOCpVusHu1JmoyhwKX0w@mail.gmail.com>
 <Pine.BSM.4.64L.1105081254100.28983@herc.mirbsd.org> <20110508165909.GA16281@chumley.earth.sol>
 <Pine.BSM.4.64L.1105081834101.28983@herc.mirbsd.org> <20110508200802.GB16281@chumley.earth.sol>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from static-87-79-237-121.netcologne.de ([87.79.237.121]:42830 "EHLO
	herc.mirbsd.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752333Ab1EHVcA convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 8 May 2011 17:32:00 -0400
Received: from herc.mirbsd.org (tg@localhost [IPv6:::1])
	by herc.mirbsd.org (8.14.5.Beta0/8.14.5.Beta0) with ESMTP id p48LUXnC028379
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-m68k@vger.kernel.org>; Sun, 8 May 2011 21:30:37 GMT
In-Reply-To: <20110508200802.GB16281@chumley.earth.sol>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
Cc: linux-m68k@vger.kernel.org

Christian T. Steigies dixit:

>> I cross-built the kernels I ran for testing the patches, but that
>> was an exception ??? packages that I upload to Debian are *always*
>> built natively.
>
>Brave

No, it=E2=80=99s a must, clean build environment and native builds.
But I=E2=80=99m a BSD person so I=E2=80=99m used to slow boxen ;)

>I haven't used cowbuilder yet, for debian packages I us this, which I =
guess
>is equivalent to your cowbuilder script:
>DEB_HOST_ARCH=3Dm68k debuild -B -am68k

No, debuild doesn=E2=80=99t create a clean chroot environment with
only the necessary build dependencies installed, and as such
your command, sorry, WILL produce broken packages.

Only cowbuilder, sbuild/buildd and pbuilder (which cowbuilder
is just the user-friendly, decent and fast wrapper around)
can produce =E2=80=9Cclean=E2=80=9D packages. (And can be persuaded to =
cross-
compile at least binutils; gcc is possible too, easily because
it allows to create a =E2=80=9CCOW shell=E2=80=9D, in which I can then =
do the
necessary steps.)

>Yes, but I am not trying to build a debian package, I try to build dir=
ectly
>from linux-m68k.

Yeah but the last time I=E2=80=99ve done that was a one-off with
2.4.3-aa7-aa1-rwsem I think, before that 2.0.3x kernels=E2=80=A6

>PS 2.6.28 did not boot: kernel too old. When was TLS introduced?

Much later, 2.6.32 got only a backport of it.

bye,
//mirabilos
--=20
If Harry Potter gets a splitting headache in his scar
when he=E2=80=99s near Tom Riddle (aka Voldemort),
does Tom get pain in the arse when Harry is near him?
	-- me, wondering why it=E2=80=99s not Jerry Potter=E2=80=A6=E2=80=A6=E2=
=80=A6
