From: Thorsten Glaser <tg@mirbsd.de>
Subject: Re: aranym bug, manifests as "ida_remove called for id=13" on recent
 kernels
Date: Mon, 11 Oct 2010 12:21:46 +0000
Message-ID: <Pine.BSM.4.64L.1010111218040.23471@herc.mirbsd.org>
References: <20101007174948.GT19804@ZenIV.linux.org.uk>
 <AANLkTin4886D+-yo=zrf2Yj2R5NM9qdRkc3M9cG2rN_F@mail.gmail.com>
 <20101010144952.GF19804@ZenIV.linux.org.uk>
 <AANLkTinuA3AzMoJ82pvCuhmo59DZxL2F1j3xhXUkjj7z@mail.gmail.com>
 <20101010235256.GG19804@ZenIV.linux.org.uk> <20101011024103.GH19804@ZenIV.linux.org.uk>
 <20101011043632.GA2566@cynthia.pants.nu> <20101011044808.GI19804@ZenIV.linux.org.uk>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from lo.gmane.org ([80.91.229.12]:52396 "EHLO lo.gmane.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753926Ab0JKMV7 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 11 Oct 2010 08:21:59 -0400
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <glpm-linux-m68k@m.gmane.org>)
	id 1P5HO6-0002Gf-Rs
	for linux-m68k@vger.kernel.org; Mon, 11 Oct 2010 14:21:54 +0200
Received: from static-87-79-237-121.netcologne.de ([87.79.237.121])
        by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
        id 1AlnuQ-0007hv-00
        for <linux-m68k@vger.kernel.org>; Mon, 11 Oct 2010 14:21:54 +0200
Received: from tg by static-87-79-237-121.netcologne.de with local (Gmexim 0.1 (Debian))
        id 1AlnuQ-0007hv-00
        for <linux-m68k@vger.kernel.org>; Mon, 11 Oct 2010 14:21:54 +0200
In-Reply-To: <20101011044808.GI19804@ZenIV.linux.org.uk>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

Al Viro dixit:

>On Sun, Oct 10, 2010 at 09:36:32PM -0700, Brad Boyer wrote:

>> > Spot the obvious bug...  BTW, why on the Earth does debian-ports m=
68k tree
>> > use gcc-4.3 with Cthulhu-scaring 700Kb gzipped patch and does *not=
* have
>> > gcc-4.4?
>>=20
>> I believe that gcc-4.4 for m68k is being held up by the TLS support =
patches.

Yes, indeed. I=E2=80=99m working on gcc-4.4 but am stalled because, aft=
er
finally getting a kernel to build, it has no support for nfeth.
=46inn Thain has kindly provided me with an eglibc+TLS sysroot tarball,
which I can use to bootstrapp gcc-4.4+TLS then Debian=E2=80=99s eglibc+=
TLS,
once I can boot into an aranym with a TLS capable kernel.

>What do autobuilders use, BTW?

They don=E2=80=99t function at the moment because 70% of the archive is
either outdated or uninstallable on m68k. I=E2=80=99m mainly playing (a=
s
in game) buildd here because of that fact, since I didn=E2=80=99t want
mksh to not show up on all architectures ;-) My goal is to get
cowbuilder working then re-bootstrap enough of Debian/m68k to
get the autobuilders working again.


Mikael Pettersson dixit:

>It's gcc PR41302 which was fixed for gcc trunk on November 4 2009
>in r153890.  The patch backports easily to gcc-4.4 and solves the
>test case there (manual inspection using a cross).  It also backports

[x] send unidiff

I=E2=80=99ll include that in my gcc build and then forward it to Debian
once I got a working gcc, unless you want to push that to them
already.


bye,
//mirabilos
--=20
I believe no one can invent an algorithm. One just happens to hit upon =
it
when God enlightens him. Or only God invents algorithms, we merely copy=
 them.
If you don't believe in God, just consider God as Nature if you won't d=
eny
existence.		-- Coywolf Qi Hunt
