From: maximilian attems <max@stro.at>
Subject: Re: [m68k] Patches for 3.0 (was Re:
 linux-2.6_2.6.39-1_amd64.changes ACCEPTED into unstable)
Date: Wed, 29 Jun 2011 21:53:16 +0000
Message-ID: <20110629215316.GA1072@vostochny.stro.at>
References: <BANLkTikepyD1GjzOpYm6uuHj88TpVkowZA@mail.gmail.com>
 <BANLkTikSZQXM3vQt0CCgmb8+rW8CEMKLqQ@mail.gmail.com>
 <m27h8itgp9.fsf@linux-m68k.org>
 <BANLkTimmQCEB+qTtEfhmi1zr-GdMBHQQBw@mail.gmail.com>
 <BANLkTikDZN3Z-Lc067f2fCaUBon5ugqCqw@mail.gmail.com>
 <BANLkTinH6+cyubYpo+cfOuLiKqTjKdmZvg@mail.gmail.com>
 <BANLkTik6-eEhu23Vzjs6TS6dC_912ZCafQ@mail.gmail.com>
 <Pine.BSM.4.64L.1106291737340.32507@herc.mirbsd.org>
 <BANLkTi=nFDUQf6j9c-8OVBqHaqKsN38AVQ@mail.gmail.com>
 <Pine.BSM.4.64L.1106292002530.32507@herc.mirbsd.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from vostochny.stro.at ([78.47.22.85]:57960 "EHLO vostochny.stro.at"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753125Ab1F2VxR (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
	Wed, 29 Jun 2011 17:53:17 -0400
Content-Disposition: inline
In-Reply-To: <Pine.BSM.4.64L.1106292002530.32507@herc.mirbsd.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Thorsten Glaser <tg@mirbsd.de>
Cc: Debian Kernel Team <debian-kernel@lists.debian.org>, linux-m68k@vger.kernel.org

hello,

On Wed, Jun 29, 2011 at 08:05:11PM +0000, Thorsten Glaser wrote:
> Hi Debian Kernel team,
>=20
> can we please have these for 3.0? They will be in 3.1, and replace
> 0008-m68k-atari-Reserve-some-ST-RAM-early-on-for-device-b.patch
> from 2.6.38-2, addressing the same problem (garbled video output
> when the machine has too much FastRAM).

aboves confuses me, I don't see any m68k patches in the trunk branch
heading for the next 3.0-rcX upload?

which are needed?
=20
> Thanks!
>=20
>=20
>=20
> Geert Uytterhoeven dixit:
>=20
> >On Wed, Jun 29, 2011 at 19:38, Thorsten Glaser <tg@mirbsd.de> wrote:
> >> Geert Uytterhoeven dixit:
> >>
> >>>I folded it into your previous patch and pushed it out for 3.1.
> >>
> >> Can you make a patch (series) on top of 3.0 and mail that to
> >> debian-kernel asking for inclusion in the next 3.0 upload, on
> >> the ground it=E2=80=99s been accepted upstream and fixes UI proble=
ms?
> >
> >The two patches you need are
> >
> >http://git.kernel.org/?p=3Dlinux/kernel/git/geert/linux-m68k.git;a=3D=
commitdiff;h=3D1789c38726c2805563e9049dbc5d5253251761a7
> >http://git.kernel.org/?p=3Dlinux/kernel/git/geert/linux-m68k.git;a=3D=
commitdiff;h=3D10b2495b79eb8c2b6ec92b3ce1e5577f892f7821
> >
> >which are both on my for-3.1/for-next branch:
> >
> >http://git.kernel.org/?p=3Dlinux/kernel/git/geert/linux-m68k.git;a=3D=
shortlog;h=3Drefs/heads/for-3.1
> >
> >Gr{oetje,eeting}s,
> >
> >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 Geert

ah ok I see, will wait till these 2 materialise in linux-next and
then add them.

thanks.

--=20
maks
