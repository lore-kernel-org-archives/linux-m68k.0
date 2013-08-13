From: Thorsten Glaser <tg@mirbsd.de>
Subject: Re: Multiple Memory Chunks
Date: Tue, 13 Aug 2013 10:46:36 +0000 (UTC)
Message-ID: <Pine.BSM.4.64L.1308131043250.1920@herc.mirbsd.org>
References: <2ff3a4b6bf1251e63cd24d4bda680c5b@localhost>
 <CAMuHMdVEdz9cmenqYNeemSK+O0aZj0RG7oKdxwygfBE6WWONsg@mail.gmail.com>
 <6EF44417-6A7D-467E-8489-3E9928E22B12@2013.bluespice.org>
 <CAMuHMdUNS5UXbzV5g_YFESJmu43EqiZsE6c1_F3YSLpxN39+Wg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from eurynome.mirbsd.org ([81.169.181.30]:6120 "EHLO
	eurynome.mirbsd.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757147Ab3HMKxS convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 13 Aug 2013 06:53:18 -0400
Received: from herc.mirbsd.org (root@herc.mirbsd.org [IPv6:2a01:198:25d:0:202:b3ff:feb7:54e8])
	by eurynome.mirbsd.org (8.14.5.Beta0/8.14.3) with ESMTP id r7DAr5nr001932
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
	for <linux-m68k@vger.kernel.org>; Tue, 13 Aug 2013 10:53:16 GMT
In-Reply-To: <CAMuHMdUNS5UXbzV5g_YFESJmu43EqiZsE6c1_F3YSLpxN39+Wg@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: debian-68k@lists.debian.org
Cc: Linux/m68k <linux-m68k@vger.kernel.org>

Geert Uytterhoeven dixit:

>We may also use the slow mainboard RAM (I get ca. 12 MiB/s) as a fast =
swap
>device.
>For Z2 RAM we have our good old z2ram driver, but in the mean time the=
re's a
>more generic solution in drivers/mtd, IIRC.

bwh mentioned transcendent memory in
http://womble.decadent.org.uk/talks/debconf13-kernel-news/

But I think with total memory sizes at the magnitude that real
m68k machines have, we=E2=80=99re probably better off using them for
main memory as much as possible. (Compressed swap comes to mind,
but even so, main memory is likely to be under pressure; this
might help with machines with _very_ slow disc, or root on nfs/nbd
with slow NIC, though.)

>> Remember that there were problems with loading 3.2.0-4-amiga without=
 the memfile.
>
>Yes, going out of memory when allocating the page table arrays? That w=
on't
>improve when adding 256 MiB of Z3 RAM in the far end of the physical
>address space...

Right, that=E2=80=99s another reason I made the 3.10 kernel much more
modular and the best one to swallow the bitter pill of having
to construct an initrd.

You can always build your own custom kernel, of course, but I
think that Debian buildds should, as much as possible, use the
proper Debian kernels of course ;-)

bye,
//mirabilos
--=20
<gcc> ncal.c: In function 'parsemonth': warning: comparison between poi=
nter
and integer  =E2=80=A2 <mirabilos> =E2=86=91 hab da =E2=80=9Ein functio=
n parselmouth=E2=80=9C gelesen
<Natureshadow> ICH AUCH! =E2=80=A2 <Natureshadow> Ich hab gerade gedach=
t "H=C3=A4h? Wie,
hab da parselmouth gelesen ... steht da doch auch :o?"	-- too much fanf=
ic=E2=80=A6
