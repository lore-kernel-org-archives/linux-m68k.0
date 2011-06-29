From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: linux-2.6_2.6.39-1_amd64.changes ACCEPTED into unstable
Date: Wed, 29 Jun 2011 13:19:57 +0200
Message-ID: <BANLkTik6-eEhu23Vzjs6TS6dC_912ZCafQ@mail.gmail.com>
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
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:60785 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755046Ab1F2LT6 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 29 Jun 2011 07:19:58 -0400
Received: by iyb12 with SMTP id 12so925895iyb.19
        for <linux-m68k@vger.kernel.org>; Wed, 29 Jun 2011 04:19:58 -0700 (PDT)
In-Reply-To: <BANLkTinH6+cyubYpo+cfOuLiKqTjKdmZvg@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@googlemail.com>
Cc: Andreas Schwab <schwab@linux-m68k.org>, Linux/m68k <linux-m68k@vger.kernel.org>, Thorsten Glaser <tg@mirbsd.de>

On Mon, Jun 27, 2011 at 08:56, Geert Uytterhoeven <geert@linux-m68k.org=
> wrote:
> On Mon, Jun 27, 2011 at 01:49, Michael Schmitz
> <schmitzmic@googlemail.com> wrote:
>> after making sure I had a good patch file, the patch applied sort of
>> cleanly (I had used DEBUG in the stram pool code) and the resulting
>> kernel runs fine on my Falcon. Geert's resource allocator appears to
>> do the right thing and provides ST-RAM where needed so the old ST-RA=
M
>> allcocator can go.
>
> Good. Will queue for 3.1.

I folded it into your previous patch and pushed it out for 3.1.

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
