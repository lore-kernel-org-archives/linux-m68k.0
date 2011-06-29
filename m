From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: linux-2.6_2.6.39-1_amd64.changes ACCEPTED into unstable
Date: Wed, 29 Jun 2011 21:33:57 +0200
Message-ID: <BANLkTi=nFDUQf6j9c-8OVBqHaqKsN38AVQ@mail.gmail.com>
References: <E1QNV5z-0006jD-Ej@franck.debian.org>
	<20110521122605.GA16345@chumley.earth.sol>
	<Pine.BSM.4.64L.1105211232060.14234@herc.mirbsd.org>
	<Pine.BSM.4.64L.1105211327140.14234@herc.mirbsd.org>
	<BANLkTimfZ4oHhT7chf=7-gHH_DVMQqHH+g@mail.gmail.com>
	<BANLkTikQSZev=QHYFR2kxsUY2xND37Dr8g@mail.gmail.com>
	<BANLkTinJJn0wvZrdQKgL-1GvVt7mT7DNyQ@mail.gmail.com>
	<BANLkTinhBpxEqRb_Xi-HCejqLPSG3wJGsw@mail.gmail.com>
	<BANLkTikepyD1GjzOpYm6uuHj88TpVkowZA@mail.gmail.com>
	<BANLkTikSZQXM3vQt0CCgmb8+rW8CEMKLqQ@mail.gmail.com>
	<m27h8itgp9.fsf@linux-m68k.org>
	<BANLkTimmQCEB+qTtEfhmi1zr-GdMBHQQBw@mail.gmail.com>
	<BANLkTikDZN3Z-Lc067f2fCaUBon5ugqCqw@mail.gmail.com>
	<BANLkTinH6+cyubYpo+cfOuLiKqTjKdmZvg@mail.gmail.com>
	<BANLkTik6-eEhu23Vzjs6TS6dC_912ZCafQ@mail.gmail.com>
	<Pine.BSM.4.64L.1106291737340.32507@herc.mirbsd.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-iw0-f174.google.com ([209.85.214.174]:64255 "EHLO
	mail-iw0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757506Ab1F2Td6 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 29 Jun 2011 15:33:58 -0400
Received: by iwn6 with SMTP id 6so1294159iwn.19
        for <linux-m68k@vger.kernel.org>; Wed, 29 Jun 2011 12:33:58 -0700 (PDT)
In-Reply-To: <Pine.BSM.4.64L.1106291737340.32507@herc.mirbsd.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Thorsten Glaser <tg@mirbsd.de>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>

On Wed, Jun 29, 2011 at 19:38, Thorsten Glaser <tg@mirbsd.de> wrote:
> Geert Uytterhoeven dixit:
>
>>I folded it into your previous patch and pushed it out for 3.1.
>
> Can you make a patch (series) on top of 3.0 and mail that to
> debian-kernel asking for inclusion in the next 3.0 upload, on
> the ground it=E2=80=99s been accepted upstream and fixes UI problems?

The two patches you need are

http://git.kernel.org/?p=3Dlinux/kernel/git/geert/linux-m68k.git;a=3Dco=
mmitdiff;h=3D1789c38726c2805563e9049dbc5d5253251761a7
http://git.kernel.org/?p=3Dlinux/kernel/git/geert/linux-m68k.git;a=3Dco=
mmitdiff;h=3D10b2495b79eb8c2b6ec92b3ce1e5577f892f7821

which are both on my for-3.1/for-next branch:

http://git.kernel.org/?p=3Dlinux/kernel/git/geert/linux-m68k.git;a=3Dsh=
ortlog;h=3Drefs/heads/for-3.1

Gr{oetje,eeting}s,

=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-=
m68k.org

In personal conversations with technical people, I call myself a hacker=
=2E But
when I'm talking to journalists I just say "programmer" or something li=
ke that.
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0=C2=A0 -- Linus Torvalds
