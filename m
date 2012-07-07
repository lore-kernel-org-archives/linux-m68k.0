From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: atafb and X/fbdev
Date: Sat, 7 Jul 2012 10:06:35 +0200
Message-ID: <CAMuHMdW1Gigu0642GuXHGyOmghDLkndboTKyGt=z=zDgWcNWFw@mail.gmail.com>
References: <Pine.BSM.4.64L.1207062301330.12225@herc.mirbsd.org>
	<4FF7AFD7.8000005@biophys.uni-duesseldorf.de>
	<Pine.BSM.4.64L.1207070751590.7146@herc.mirbsd.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-ob0-f174.google.com ([209.85.214.174]:40604 "EHLO
	mail-ob0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751133Ab2GGIGh convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sat, 7 Jul 2012 04:06:37 -0400
Received: by obbuo13 with SMTP id uo13so16459218obb.19
        for <linux-m68k@vger.kernel.org>; Sat, 07 Jul 2012 01:06:36 -0700 (PDT)
In-Reply-To: <Pine.BSM.4.64L.1207070751590.7146@herc.mirbsd.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Thorsten Glaser <tg@mirbsd.de>
Cc: linux-m68k@vger.kernel.org

Hi Thorsten,

On Sat, Jul 7, 2012 at 9:54 AM, Thorsten Glaser <tg@mirbsd.de> wrote:
> schmitz dixit:
>> Have you tried the VGA modes (vga256 for instance)? That might boil =
down to
>> interleaved planes in the end though.
>
> Yes, vgs256 was interleaved too. From my limited understanding of
> atafb.c all modes are interleaved or monochrome.

The 16-bpp Falcon mode should be chunky and work.

The 2, 4, and 8 bpp Atari interleaved bitplane support is botched due t=
o the
removal of the iplan2p[248] code.

The 1 bpp monochrome mode (mfb) is (used to be, cfr. Xsun) fairly stand=
ard,
but it may have been broken by regressions introduced in the fbdev X
server code.

It's also broken on Amiga, which uses interleaved bitplanes (ilbm).

I once had a look at it, and at several places the new fbdev X code did=
 stupid
things that wouldn't work on bitplanes. It did work a long time ago, wh=
en I
maintained it.

>> You will have to go back to one of the earlier Debian releases (slin=
k or
>> potato) for Atari support in the X server. potato should still have =
the
>> required code.
>
> Hrm, okay. I couldn=E2=80=99t find much in the =E2=80=99net except a =
reference to
> xfree68 but was unable to find that, either. Too bad, all the history=
=E2=80=A6
> you don=E2=80=99t happen to know the _package_ name of the server, an=
d the
> needed config? ;-)

xserver-fbdev? Or is that already the newer broken one?

The "XFree68" binaries I uploaded in the nineties should still be avail=
able
on FTP sites, though.

=46or the future, my plan (if I ever get to it, sigh) is to use tinyX
shadowfb, and
add support for converting rectangles from iplan2p[48] and ilbm (4 and =
8 bpp)
to cfb[48]. The actual low-level conversion code is available in the
kernel, for the
console. As I wrote it, there's no license issue in taking that ;-)

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-=
m68k.org

In personal conversations with technical people, I call myself a hacker=
=2E But
when I'm talking to journalists I just say "programmer" or something li=
ke that.
                                -- Linus Torvalds
