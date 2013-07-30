From: Thorsten Glaser <tg@mirbsd.de>
Subject: Re: [PATCH] make NatFeat drivers bool, not tristate
Date: Tue, 30 Jul 2013 08:50:25 +0000 (UTC)
Message-ID: <Pine.BSM.4.64L.1307300847360.2555@herc.mirbsd.org>
References: <201307232255.r6NMt8Z9027017@herc.mirbsd.org>
 <CAMuHMdVF8HntVUiV7vBU7ZDwyjXbnpn=NiM05O60ewtz5S=KKw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from static-87-79-237-121.netcologne.de ([87.79.237.121]:8817 "EHLO
	herc.mirbsd.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758242Ab3G3IwY convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 30 Jul 2013 04:52:24 -0400
Received: from herc.mirbsd.org (tg@herc.mirbsd.org [192.168.0.82])
	by herc.mirbsd.org (8.14.5/8.14.5) with ESMTP id r6U8oP8t011471
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-m68k@vger.kernel.org>; Tue, 30 Jul 2013 08:50:29 GMT
In-Reply-To: <CAMuHMdVF8HntVUiV7vBU7ZDwyjXbnpn=NiM05O60ewtz5S=KKw@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
Cc: Linux/m68k <linux-m68k@vger.kernel.org>

Geert Uytterhoeven dixit:

>On Wed, Jul 24, 2013 at 12:51 AM, Thorsten Glaser <tg@debian.org> wrot=
e:
>> - nfeth: says "No such device" upon insmod
>
>You're lucky. When insmodding nfeth.ko, my ARAnyM just terminates with=
:
>
>Gotcha! Illegal memory access. Atari PC =3D $968c

That=E2=80=99s http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D69806=
4

>With my patch, insmod works again, and the network works, too.

Nice!

>AFAIK you cannot have two physical memory blocks with ARAnyM, so using
>a copy on the stack should be safe.

Hmm, okay. I think the ARAnyM code also only checks that
beginning and end are physical memory, so it=E2=80=99s contiguous.

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
