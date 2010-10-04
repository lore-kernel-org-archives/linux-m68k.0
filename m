From: Thorsten Glaser <tg@mirbsd.de>
Subject: Re: [PATCH 1/1] m68k: add missing I/O macros {in,out}{w,l}_p() for
 !CONFIG_ISA
Date: Mon, 4 Oct 2010 07:40:18 +0000
Message-ID: <Pine.BSM.4.64L.1010040738160.22274@herc.mirbsd.org>
References: <Pine.BSM.4.64L.1010031832530.15165@herc.mirbsd.org>
 <Pine.BSM.4.64L.1010031846060.15165@herc.mirbsd.org>
 <alpine.OSX.2.00.1010041149030.285@localhost>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from lo.gmane.org ([80.91.229.12]:49847 "EHLO lo.gmane.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753174Ab0JDHk3 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 4 Oct 2010 03:40:29 -0400
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <glpm-linux-m68k@m.gmane.org>)
	id 1P2feu-0006vp-Cw
	for linux-m68k@vger.kernel.org; Mon, 04 Oct 2010 09:40:28 +0200
Received: from static-87-79-237-121.netcologne.de ([87.79.237.121])
        by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
        id 1AlnuQ-0007hv-00
        for <linux-m68k@vger.kernel.org>; Mon, 04 Oct 2010 09:40:28 +0200
Received: from tg by static-87-79-237-121.netcologne.de with local (Gmexim 0.1 (Debian))
        id 1AlnuQ-0007hv-00
        for <linux-m68k@vger.kernel.org>; Mon, 04 Oct 2010 09:40:28 +0200
In-Reply-To: <alpine.OSX.2.00.1010041149030.285@localhost>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org

=46inn Thain dixit:

>On Sun, 3 Oct 2010, Thorsten Glaser wrote:

>> Debian=E2=80=99s linux-2.6_2.6.32-24, but
>
>I was able to compile that source package. Can you please send the .co=
nfig=20
>you used?

Erm, Debian=E2=80=99s? Otherwise I wouldn=E2=80=99t say =E2=80=9Ctrying=
 to build Debian=E2=80=99s
package=E2=80=9D. (The atari variant, to be exact, in order to run ARAn=
yM.)
You might remember I=E2=80=99m sticking to stock unmodified Debian soru=
ce,
native compilation, etc. as much as possible and then some.

Thing is, the macros are defined correctly if CONFIG_ISA is defined,
which appears to be the case for e.g. amiga but not atari.

bye,
//mirabilos
--=20
=46WIW, I'm quite impressed with mksh interactively. I thought it was m=
uch
*much* more bare bones. But it turns out it beats the living hell out o=
f
ksh93 in that respect. I'd even consider it for my daily use if I hadn'=
t
wasted half my life on my zsh setup. :-) -- Frank Terbeck in #!/bin/mks=
h
