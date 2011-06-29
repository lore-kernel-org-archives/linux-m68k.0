From: Thorsten Glaser <tg@mirbsd.de>
Subject: Re: [m68k] Patches for 3.0
Date: Wed, 29 Jun 2011 21:59:59 +0000 (UTC)
Message-ID: <Pine.BSM.4.64L.1106292158280.32507@herc.mirbsd.org>
References: <BANLkTikepyD1GjzOpYm6uuHj88TpVkowZA@mail.gmail.com>
 <BANLkTikSZQXM3vQt0CCgmb8+rW8CEMKLqQ@mail.gmail.com> <m27h8itgp9.fsf@linux-m68k.org>
 <BANLkTimmQCEB+qTtEfhmi1zr-GdMBHQQBw@mail.gmail.com>
 <BANLkTikDZN3Z-Lc067f2fCaUBon5ugqCqw@mail.gmail.com>
 <BANLkTinH6+cyubYpo+cfOuLiKqTjKdmZvg@mail.gmail.com>
 <BANLkTik6-eEhu23Vzjs6TS6dC_912ZCafQ@mail.gmail.com>
 <Pine.BSM.4.64L.1106291737340.32507@herc.mirbsd.org>
 <BANLkTi=nFDUQf6j9c-8OVBqHaqKsN38AVQ@mail.gmail.com>
 <Pine.BSM.4.64L.1106292002530.32507@herc.mirbsd.org> <20110629215316.GA1072@vostochny.stro.at>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from static-87-79-237-121.netcologne.de ([87.79.237.121]:7542 "EHLO
	herc.mirbsd.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752263Ab1F2WIt convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 29 Jun 2011 18:08:49 -0400
In-Reply-To: <20110629215316.GA1072@vostochny.stro.at>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: maximilian attems <max@stro.at>
Cc: Debian Kernel Team <debian-kernel@lists.debian.org>, linux-m68k@vger.kernel.org

maximilian attems dixit:

>aboves confuses me, I don't see any m68k patches in the trunk branch
>heading for the next 3.0-rcX upload?

Yes, they were in 2.6.38 but someone removed them before 2.6.39 in Debi=
an.
All but this one patch, replaced by (see below), were included in 2.6.3=
9
upstream though, so only this issue popped up again.

>which are needed?

These:

>> >The two patches you need are
>> >
>> >http://git.kernel.org/?p=3Dlinux/kernel/git/geert/linux-m68k.git;a=3D=
commitdiff;h=3D1789c38726c2805563e9049dbc5d5253251761a7
>> >http://git.kernel.org/?p=3Dlinux/kernel/git/geert/linux-m68k.git;a=3D=
commitdiff;h=3D10b2495b79eb8c2b6ec92b3ce1e5577f892f7821

>ah ok I see, will wait till these 2 materialise in linux-next and
>then add them.

OK, thanks!

bye,
//mirabilos
--=20
08:05=E2=8E=9C<XTaran:#grml> mika: Does grml have an tool to read Apple
     =E2=8E=9C    System Log (asl) files? :)
08:08=E2=8E=9C<ft:#grml> yeah. /bin/rm. ;)       08:09=E2=8E=9C<mrud:#g=
rml> hexdump -C
08:31=E2=8E=9C<XTaran:#grml> ft, mrud: *g*
