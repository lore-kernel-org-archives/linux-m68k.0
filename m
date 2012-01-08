From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: Atari TT (next)
Date: Sun, 8 Jan 2012 11:20:57 +0100
Message-ID: <CAMuHMdX2BaAp2N0e4aYPz7roaMFD14V1Y076geQQjpPw6-g-5Q@mail.gmail.com>
References: <4F079F6B.8080502@fairlite.co.uk>
	<4F07EA66.6020603@gmail.com>
	<4F08E748.4020305@fairlite.co.uk>
	<4F0917E9.9090600@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-we0-f174.google.com ([74.125.82.174]:60507 "EHLO
	mail-we0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752592Ab2AHKU6 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 8 Jan 2012 05:20:58 -0500
Received: by werm1 with SMTP id m1so2012744wer.19
        for <linux-m68k@vger.kernel.org>; Sun, 08 Jan 2012 02:20:57 -0800 (PST)
In-Reply-To: <4F0917E9.9090600@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@googlemail.com>
Cc: Alan Hourihane <alanh@fairlite.co.uk>, Linux/m68k <linux-m68k@vger.kernel.org>

On Sun, Jan 8, 2012 at 05:13, Michael Schmitz <schmitzmic@googlemail.co=
m> wrote:
> For this option to work, ST-RAM first has to be accepted by memory in=
it
> (i.e. it has to be in the first chunk). We might have to resort to re=
serving
> the entire ST-RAM for the kernel's use if the kernel is not residing =
in
> ST-RAM (breaking the above assumption). Something similar is done for=
 Amiga
> chip RAM - exactly how does the chip RAM situation differ, Geert? Is =
chip
> RAM being claimed by mem_init or is it being left aside?

Chip RAM is different in that Linux (unlike AmigaOS) doesn't use it as
system RAM.
Being on the Zorro II bus (first 16 MiB), it's slow on most machines an=
d doesn't
support RMW cycles (needed for page tables) on Zorro III-capable machin=
es.
In general, we don't use Z2 RAM as system memory on Z3 capable machines=
=2E

> Come to think of it - does the TT video chipset actually require scre=
en
> memory to reside in ST-RAM? If it's fully 32 bit addressed we should =
not
> have any problems with TT-RAM. The problems you see might be caused b=
y a
> fault in the TT codepath in atafb - I'm unsure this has been tested s=
ince
> the last atafb rewrite.

static void set_screen_base(void *s_base)
{
        unsigned long addr;

        addr =3D virt_to_phys(s_base);
        /* Setup Screen Memory */
        shifter.bas_hi =3D (unsigned char)((addr & 0xff0000) >> 16);
        shifter.bas_md =3D (unsigned char)((addr & 0x00ff00) >> 8);
        shifter.bas_lo =3D (unsigned char)(addr & 0x0000ff);
}

It's limited to 24-bit addresses.

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
