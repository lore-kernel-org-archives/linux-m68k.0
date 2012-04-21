From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: Atari ROM port ISA
Date: Sat, 21 Apr 2012 21:39:51 +0200
Message-ID: <CAMuHMdW6tYbn6aW46x9yDiG7hptjSPz9gGDhS=n7bBTs7=pLkA@mail.gmail.com>
References: <alpine.DEB.2.00.1204151113430.31626@ayla.of.borg>
	<4F8BCF49.4060109@gmail.com>
	<20120417050500.GA14387@cynthia.pants.nu>
	<loom.20120419T165359-796@post.gmane.org>
	<CAOmrzkKRE2SsJM532itFRd5fG2Bx-wxfno=ftb0SjXC1vWkbgQ@mail.gmail.com>
	<Pine.BSM.4.64L.1204192041320.27380@herc.mirbsd.org>
	<4F92D5CA.1000205@gmail.com>
	<CAMuHMdWSpkD=-55nzG=mO=ZUVTG=-D0TM5-JGAhFWvdzTR=pPQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:57951 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751444Ab2DUTjv convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sat, 21 Apr 2012 15:39:51 -0400
Received: by iadi9 with SMTP id i9so252467iad.19
        for <linux-m68k@vger.kernel.org>; Sat, 21 Apr 2012 12:39:51 -0700 (PDT)
In-Reply-To: <CAMuHMdWSpkD=-55nzG=mO=ZUVTG=-D0TM5-JGAhFWvdzTR=pPQ@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@googlemail.com>
Cc: Thorsten Glaser <tg@mirbsd.de>, linux-m68k@vger.kernel.org

On Sat, Apr 21, 2012 at 10:20, Geert Uytterhoeven <geert@linux-m68k.org=
> wrote:
>> I've had a look at the NetUSBee docs and see that the USB part of it=
 does
>> require 8 bit writes but little endian 16 bit reads. So we will need=
 to
>> retain the 16 bit reads for potential USB support there.
>
> OK. But you ain't gonna get the right 16 bits using
>
> #define rom_in_be16(addr) \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0({ u16 __v =3D (*(__force volatile u16 *) =
(addr)); __v >>=3D 8; __v; })
> #define rom_in_le16(addr) \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0({ u16 __v =3D le16_to_cpu(*(__force volat=
ile u16 *) (addr));
> __v >>=3D 8; __v; })
>
> as they both do a 16-bit read and shift the result.
> Perhaps it should just be a 32-bit read instead?
> Are the schematics publicly available?

I found netusbee.zip.
Unfortunately I (my computer) can't grok the schematics files.

However, program_spec.txt says (a.o., I encourage all interested
parties to read it in full):

| USB Data Reads
| =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
|
| Data Reads from USB are done at base address 0xFA8000 (activating a r=
ead
| cycle) as a 16bit word.  Data appears on D8-15 as most significant by=
te, and
| D0-7 as least significant byte.  Notice how A15 has to be set to 1 to=
 make it
| a USB cycle.

So inw() should just do a 16-bit big-endian read.

| USB Data Writes
| =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
|
| Data reads at base address 0xFB8000 actually cause data to be written=
=2E  As
| the write interface is only 8 bits wide, the 16bits of data must be p=
assed
| through this "8 bit window".  The Least Signifant Byte is transferred=
 first
| by left shifting data once and added to 0xFA8000.  This is followed b=
y the
| Most significant byte, transferred by left shifting data once and the=
n added
| to 0xFB8000.  On this last cycle is where the transfer is actually do=
ne.
| Notice how A15 has to be set to 1 to make it a USB cycle.

So outw() should do 2 byte reads.

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
