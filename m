From: Thorsten Glaser <tg@mirbsd.de>
Subject: Re: Debian kernel 2.6.38-5
Date: Sun, 8 May 2011 18:40:40 +0000 (UTC)
Message-ID: <Pine.BSM.4.64L.1105081834101.28983@herc.mirbsd.org>
References: <BANLkTimCKhPbp3wOCpVusHu1JmoyhwKX0w@mail.gmail.com>
 <Pine.BSM.4.64L.1105081254100.28983@herc.mirbsd.org> <20110508165909.GA16281@chumley.earth.sol>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from static-87-79-237-121.netcologne.de ([87.79.237.121]:46409 "EHLO
	herc.mirbsd.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932153Ab1EHSmR convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 8 May 2011 14:42:17 -0400
Received: from herc.mirbsd.org (tg@localhost [IPv6:::1])
	by herc.mirbsd.org (8.14.5.Beta0/8.14.5.Beta0) with ESMTP id p48IejRt019347
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-m68k@vger.kernel.org>; Sun, 8 May 2011 18:40:48 GMT
In-Reply-To: <20110508165909.GA16281@chumley.earth.sol>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
Cc: linux-m68k@vger.kernel.org

Christian T. Steigies dixit:

>> ??? Accepted linux-2.6 2.6.38-5 (source all i386) Ben Hutchings
>> http://lists.debian.org/debian-devel-changes/2011/05/msg00736.html
>
>Why don't you cross-compile it?

I cross-built the kernels I ran for testing the patches, but that
was an exception =E2=80=93 packages that I upload to Debian are *always=
*
built natively.

>How do I get the older versions from Geert's git? I don't see any othe=
r
>branches, I only see tags. What is the magic word to get for example t=
he 2.6.30
>tree?=20

tg@zigo:~/linux-m68k $ git branch -r
  origin/HEAD -> origin/master
  origin/atari-aranym
  origin/atari-ethernat
  origin/atari-ethernec
  origin/atari-fat
  origin/atari-scc
  origin/for-2.6.33
  origin/for-2.6.34
  origin/for-2.6.35
  origin/for-2.6.36
  origin/for-2.6.37
  origin/for-2.6.38
  origin/for-2.6.39
  origin/for-linus
  origin/for-next
  origin/m68k-queue
  origin/m68k-v2.6.28
  origin/m68k-v2.6.29
  origin/m68k-v2.6.31
  origin/m68k-v2.6.32
  origin/m68k-v2.6.33
  origin/m68k-v2.6.34
  origin/m68k-v2.6.35
  origin/m68k-v2.6.36
  origin/m68k-v2.6.37
  origin/m68k-v2.6.38
  origin/master
  origin/misc
  origin/postponed

>When crosscompiling Geert's tree, shouldn't make ARCH=3Dm68k be suffic=
ient
>(after setting up a propper .config)?

I=E2=80=99ll leave that to the Linux experts.

>It's been so long, is this the correct way to cross-build linux-m68k?

sudo cowbuilder --debbuildopts -am68k --binary-arch --build linux*.dsc
is the correct way in Debian (but will build all 6 images and more; it
takes about half a day, cross).

https://wiki.debian.org/HowToRebuildAnOfficialDebianKernelPackage#Build=
ing_only_a_single_kernel_variant
lists another way, where you only =E2=80=9Cdpkg-source -x linux*.dsc=E2=
=80=9D then
=E2=80=9Ccd linux-*/=E2=80=9D and =E2=80=9Cfakeroot debian/rules binary=
-arch_m68k_none_amiga=E2=80=9D
I think (but cross parameters might need to be added). This is also
in README.Debian in the source package.

But, like I said above, I=E2=80=99m building packages for the archive a=
nd
follow archive rules. Basically, I =E2=80=9Cam=E2=80=9D a buildd now ;-=
)

bye,
//mirabilos, still mumbling about how setting up sbuild is arcane
--=20
If Harry Potter gets a splitting headache in his scar
when he=E2=80=99s near Tom Riddle (aka Voldemort),
does Tom get pain in the arse when Harry is near him?
	-- me, wondering why it=E2=80=99s not Jerry Potter=E2=80=A6=E2=80=A6=E2=
=80=A6
