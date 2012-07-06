From: Thorsten Glaser <tg@mirbsd.de>
Subject: atafb and X/fbdev
Date: Fri, 6 Jul 2012 23:03:08 +0000 (UTC)
Message-ID: <Pine.BSM.4.64L.1207062301330.12225@herc.mirbsd.org>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from static-87-79-237-121.netcologne.de ([87.79.237.121]:20762 "EHLO
	herc.mirbsd.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756185Ab2GFXHH convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 6 Jul 2012 19:07:07 -0400
Received: from herc.mirbsd.org (tg@localhost [IPv6:::1])
	by herc.mirbsd.org (8.14.5/8.14.5) with ESMTP id q66N3A9k009104
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-m68k@vger.kernel.org>; Fri, 6 Jul 2012 23:03:13 GMT
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org

Hi,

X/xfbdef gets SIGFPE. X/fbdev doesn=E2=80=99t like *any* atafb mode: it=
 likes
neither interleaved planes nor 1bpp modes, and I don=E2=80=99t think th=
ere are
any others. How can we get an X server on ARAnyM running (I=E2=80=99ve =
got both
current x.org from sid and XFree86 from woody installed)?

Sitting at BAAMM! so quick response appreciated ;)

http://lists.debian.org/debian-68k/2012/05/msg00027.html

bye,
//mirabilos
--=20
13:37=E2=8E=9C=C2=ABNatureshadow=C2=BB Deep inside, I hate mirabilos. I=
 mean, he's a good
guy. But he's always right! In every fsckin' situation, he's right. Eve=
n
with his deeply perverted taste in software and borked ambition towards
broken OSes - in the end, he's damn right about it :(! [=E2=80=A6] work=
s in mksh
