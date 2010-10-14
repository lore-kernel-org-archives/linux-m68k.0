From: Thorsten Glaser <tg@mirbsd.de>
Subject: Re: eglibc sysroot
Date: Thu, 14 Oct 2010 11:36:42 +0000
Message-ID: <Pine.BSM.4.64L.1010141131490.16747@herc.mirbsd.org>
References: <alpine.LNX.2.00.1009221445130.7495@nippy.intranet>
 <alpine.OSX.2.00.1010122347280.278@localhost> <Pine.BSM.4.64L.1010121755580.28735@herc.mirbsd.org>
 <alpine.OSX.2.00.1010131102470.285@localhost> <Pine.BSM.4.64L.1010131656010.19763@herc.mirbsd.org>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from lo.gmane.org ([80.91.229.12]:42394 "EHLO lo.gmane.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753123Ab0JNLg7 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 14 Oct 2010 07:36:59 -0400
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <glpm-linux-m68k@m.gmane.org>)
	id 1P6M7C-00063l-36
	for linux-m68k@vger.kernel.org; Thu, 14 Oct 2010 13:36:54 +0200
Received: from static-87-79-237-121.netcologne.de ([87.79.237.121])
        by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
        id 1AlnuQ-0007hv-00
        for <linux-m68k@vger.kernel.org>; Thu, 14 Oct 2010 13:36:54 +0200
Received: from tg by static-87-79-237-121.netcologne.de with local (Gmexim 0.1 (Debian))
        id 1AlnuQ-0007hv-00
        for <linux-m68k@vger.kernel.org>; Thu, 14 Oct 2010 13:36:54 +0200
In-Reply-To: <Pine.BSM.4.64L.1010131656010.19763@herc.mirbsd.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA384

Dixi quod=E2=80=A6

>Trying again now, thanks to Stephen=E2=80=99s commit in the Debian Ker=
nel svn.

Works, as seen on #debian-68k on OFTC.

13:25=E2=8E=9C<mira> [    0.000000] Linux version 2.6.32-5+m68k.1-atari=
 (Debian 2.6.32-24+m68k.1) (tg@mirbsd.de)
     =E2=8E=9C    (gcc version 4.3.4 (Debian 4.3.4-10+m68k) ) #1 Thu Oc=
t 14 08:10:30 UTC 2010
13:25=E2=8E=9C<mira> [    0.000000] Kernel command line: root=3D/dev/hd=
a1 console=3Dtty debug=3Dpar video=3Datafb:vga2
     =E2=8E=9C    BOOT_IMAGE=3Dvmlinux
13:26=E2=8E=9C<mira> [    4.590000] /root/linux-2.6-2.6.32/debian/build=
/source_m68k_none/drivers/rtc/hctosys.c:
     =E2=8E=9C    unable to open rtc device (rtc0)
13:27=E2=8E=9C<mira> root@aranym:~ # uname -a
13:27=E2=8E=9C<mira> Linux aranym.mirbsd.org 2.6.32-5+m68k.1-atari #1 T=
hu Oct 14 08:10:30 UTC 2010 m68k GNU/Linux
13:27=E2=8E=9C<mira> \o/

https://www.freewrt.org/~tg/aradebs/dists/notls/unreleased/Pkgs/kernel/

Is there a simple TLS test programme I can run before extracting the
eglibc sysroot and building gcc, to see whether the Linux kernel is
working as expected?

Stephen: please look at the .dsc from the above URI, I had not only
to revert the commit disabling the m68k/fp series but also to remove
one and fix two others. (Furthermore =E2=80=93 very interesting =E2=80=93=
 ulimit -n
1024 was not enough=E2=80=A6)

Note, while the kernel is in =E2=80=9Cuploadable=E2=80=9D quality I won=
=E2=80=99t do so, as
I disabled all flavours but atari for quicker test cycles. You can
pull it from that repo though. It=E2=80=99s signed by:
pub   2048R/405422DD 2008-09-06 Thorsten Glaser (Package signing key fo=
r wtf debs) <tg@freewrt.org>
 Primary key fingerprint: 8955 B26D 1CB5 DDB6 519F  A02D F7E9 74E9 4054=
 22DD

Next steps:
=E2=80=A2 build gcc-4.4 b-d (they tightened binutils again)
=E2=80=A2 extract sysroot
=E2=80=A2 install updated linux-headers-*.deb and friends over that
=E2=80=A2 build gcc-4.4 with TLS support, hopefully=E2=80=A6

bye,
//mirabilos
- --=20
I believe no one can invent an algorithm. One just happens to hit upon =
it
when God enlightens him. Or only God invents algorithms, we merely copy=
 them.
If you don't believe in God, just consider God as Nature if you won't d=
eny
existence.		-- Coywolf Qi Hunt
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.7 (MirBSD)

iQIVAwUBTLbrVna1NLLpkAfgAQkVShAAixGehC7qGDNzNG6I6jPF7ovLN0So/PWt
7EiDH7QG21y5RY2t3NiRoRzDhzmfrJMmu0v6tkL0cYT/nYzGFQ1hetW9+EZ4VlBf
qdsKx8Fxt5ZU//VClR/RmF2Jz+v9eEmfF6IQgCr5q7JqjheOBt7VnJNmGaz1eVTP
aAyybg7SBwXelwr9XfWFrt4QVBIjs03zGKSojRvMh9WXhqEmAyhJCqbCfI7y3+OW
nnCvvJjOaQbDzOPh2Ox+11D1no0c1J7XeMNLmRp0WKWNLpTm0M8zyubHC+VUK3CT
7PeKBYyxkfBEfscHz0yGePC+pSW25I/xFHMBY1/rsf8s2QFQQ9PRwhpFKMYp1J7f
sikS0D5Xp+BC70/EptqI1TmyUTfT2cicCfS9prC5XcRXNZoHCXbk6m+cJP73w8Ga
=46mOMO2Y9Z75u8lihm0uAi4DEvBsg4LEZYUK3gmcQAmpUGCZbOwGie+1J2HR7FCDx
533gz3tKNmG8P9xFdAxSVLNFVpt/q0iVGTnGKpA6PrwoTfkceG2npnNnQf42kBnA
v1ifcsUPGnFz2im9eOeu8CMlZOfXqVdUXmnwUddv19F3LpPunmu/DZ/ZDBmeBIEE
BSjPkkl9UF/3+KlRPPT+BBa3tGDbMCVL7GpYQvNmHOhwmmcH23ko2Z8b90lDU14m
mEzoWr3fRKU=3D
=3DfALF
-----END PGP SIGNATURE-----
