From: Thorsten Glaser <tg@mirbsd.de>
Subject: [m68k] Patches for 3.0 (was Re: linux-2.6_2.6.39-1_amd64.changes
 ACCEPTED into unstable)
Date: Wed, 29 Jun 2011 20:05:11 +0000 (UTC)
Message-ID: <Pine.BSM.4.64L.1106292002530.32507@herc.mirbsd.org>
References: <E1QNV5z-0006jD-Ej@franck.debian.org> <20110521122605.GA16345@chumley.earth.sol>
 <Pine.BSM.4.64L.1105211232060.14234@herc.mirbsd.org>
 <Pine.BSM.4.64L.1105211327140.14234@herc.mirbsd.org>
 <BANLkTimfZ4oHhT7chf=7-gHH_DVMQqHH+g@mail.gmail.com>
 <BANLkTikQSZev=QHYFR2kxsUY2xND37Dr8g@mail.gmail.com>
 <BANLkTinJJn0wvZrdQKgL-1GvVt7mT7DNyQ@mail.gmail.com>
 <BANLkTinhBpxEqRb_Xi-HCejqLPSG3wJGsw@mail.gmail.com>
 <BANLkTikepyD1GjzOpYm6uuHj88TpVkowZA@mail.gmail.com>
 <BANLkTikSZQXM3vQt0CCgmb8+rW8CEMKLqQ@mail.gmail.com> <m27h8itgp9.fsf@linux-m68k.org>
 <BANLkTimmQCEB+qTtEfhmi1zr-GdMBHQQBw@mail.gmail.com>
 <BANLkTikDZN3Z-Lc067f2fCaUBon5ugqCqw@mail.gmail.com>
 <BANLkTinH6+cyubYpo+cfOuLiKqTjKdmZvg@mail.gmail.com>
 <BANLkTik6-eEhu23Vzjs6TS6dC_912ZCafQ@mail.gmail.com>
 <Pine.BSM.4.64L.1106291737340.32507@herc.mirbsd.org>
 <BANLkTi=nFDUQf6j9c-8OVBqHaqKsN38AVQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from static-87-79-237-121.netcologne.de ([87.79.237.121]:40065 "EHLO
	herc.mirbsd.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752990Ab1F2UGR convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 29 Jun 2011 16:06:17 -0400
In-Reply-To: <BANLkTi=nFDUQf6j9c-8OVBqHaqKsN38AVQ@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Debian Kernel Team <debian-kernel@lists.debian.org>
Cc: linux-m68k@vger.kernel.org

Hi Debian Kernel team,

can we please have these for 3.0? They will be in 3.1, and replace
0008-m68k-atari-Reserve-some-ST-RAM-early-on-for-device-b.patch
from 2.6.38-2, addressing the same problem (garbled video output
when the machine has too much FastRAM).

Thanks!



Geert Uytterhoeven dixit:

>On Wed, Jun 29, 2011 at 19:38, Thorsten Glaser <tg@mirbsd.de> wrote:
>> Geert Uytterhoeven dixit:
>>
>>>I folded it into your previous patch and pushed it out for 3.1.
>>
>> Can you make a patch (series) on top of 3.0 and mail that to
>> debian-kernel asking for inclusion in the next 3.0 upload, on
>> the ground it=E2=80=99s been accepted upstream and fixes UI problems=
?
>
>The two patches you need are
>
>http://git.kernel.org/?p=3Dlinux/kernel/git/geert/linux-m68k.git;a=3Dc=
ommitdiff;h=3D1789c38726c2805563e9049dbc5d5253251761a7
>http://git.kernel.org/?p=3Dlinux/kernel/git/geert/linux-m68k.git;a=3Dc=
ommitdiff;h=3D10b2495b79eb8c2b6ec92b3ce1e5577f892f7821
>
>which are both on my for-3.1/for-next branch:
>
>http://git.kernel.org/?p=3Dlinux/kernel/git/geert/linux-m68k.git;a=3Ds=
hortlog;h=3Drefs/heads/for-3.1
>
>Gr{oetje,eeting}s,
>
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 Geert
