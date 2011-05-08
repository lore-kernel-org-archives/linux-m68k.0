From: Thorsten Glaser <tg@mirbsd.de>
Subject: Re: Debian kernel 2.6.38-5
Date: Sun, 8 May 2011 18:49:29 +0000 (UTC)
Message-ID: <Pine.BSM.4.64L.1105081841510.28983@herc.mirbsd.org>
References: <BANLkTimCKhPbp3wOCpVusHu1JmoyhwKX0w@mail.gmail.com>
 <Pine.BSM.4.64L.1105081254100.28983@herc.mirbsd.org> <20110508165909.GA16281@chumley.earth.sol>
 <BANLkTin8cSKLWynnJZQfeE-VQqdfXgpcsQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from static-87-79-237-121.netcologne.de ([87.79.237.121]:24318 "EHLO
	herc.mirbsd.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932201Ab1EHSyK convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 8 May 2011 14:54:10 -0400
Received: from herc.mirbsd.org (tg@localhost [IPv6:::1])
	by herc.mirbsd.org (8.14.5.Beta0/8.14.5.Beta0) with ESMTP id p48InVmw019174
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-m68k@vger.kernel.org>; Sun, 8 May 2011 18:49:34 GMT
In-Reply-To: <BANLkTin8cSKLWynnJZQfeE-VQqdfXgpcsQ@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org

Geert Uytterhoeven dixit:

>Anyway, plain v2.6.30 should work on Amiga.

Not on his, he=E2=80=99s got the TLS eglibc already. Applying
http://svn.debian.org/viewsvn/kernel/dists/squeeze/linux-2.6/debian/pat=
ches/bugfix/m68k/linux-2.6.git-9674cdc74d63f346870943ef966a034f8c71ee57=
=2Epatch?revision=3D16861&view=3Dmarkup
might help, though.

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
