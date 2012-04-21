From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: Atari ROM port ISA
Date: Sat, 21 Apr 2012 10:20:09 +0200
Message-ID: <CAMuHMdWSpkD=-55nzG=mO=ZUVTG=-D0TM5-JGAhFWvdzTR=pPQ@mail.gmail.com>
References: <alpine.DEB.2.00.1204151113430.31626@ayla.of.borg>
	<4F8BCF49.4060109@gmail.com>
	<20120417050500.GA14387@cynthia.pants.nu>
	<loom.20120419T165359-796@post.gmane.org>
	<CAOmrzkKRE2SsJM532itFRd5fG2Bx-wxfno=ftb0SjXC1vWkbgQ@mail.gmail.com>
	<Pine.BSM.4.64L.1204192041320.27380@herc.mirbsd.org>
	<4F92D5CA.1000205@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:49716 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751188Ab2DUIUK convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sat, 21 Apr 2012 04:20:10 -0400
Received: by iagz16 with SMTP id z16so14365456iag.19
        for <linux-m68k@vger.kernel.org>; Sat, 21 Apr 2012 01:20:09 -0700 (PDT)
In-Reply-To: <4F92D5CA.1000205@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@googlemail.com>
Cc: Thorsten Glaser <tg@mirbsd.de>, linux-m68k@vger.kernel.org

On Sat, Apr 21, 2012 at 17:44, Michael Schmitz
<schmitzmic@googlemail.com> wrote:
>>> If someone ever comes up with a way to hook up a fully featured ISA
>>> slot to the ROM port (mapping ports 0x00 to 0x7f to IO and above to
>>> mem access should be possible) we might revisit the code. For now,
>>> anything except for 8 bit IO can be turned into dummy functions or
>>> compile warnings.
>>
>> Might be nice, if possible. But for now, that would indeed be
>> the way to go (and clean up code).
>
> I've had a look at the NetUSBee docs and see that the USB part of it =
does
> require 8 bit writes but little endian 16 bit reads. So we will need =
to
> retain the 16 bit reads for potential USB support there.

OK. But you ain't gonna get the right 16 bits using

#define rom_in_be16(addr) \
        ({ u16 __v =3D (*(__force volatile u16 *) (addr)); __v >>=3D 8;=
 __v; })
#define rom_in_le16(addr) \
        ({ u16 __v =3D le16_to_cpu(*(__force volatile u16 *) (addr));
__v >>=3D 8; __v; })

as they both do a 16-bit read and shift the result.
Perhaps it should just be a 32-bit read instead?
Are the schematics publicly available?

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
