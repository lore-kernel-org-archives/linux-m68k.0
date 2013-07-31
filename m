From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: linux 3.10.1 with initrd (was Re: linux 3.8.12-1 (atari flavour)
 does not boot)
Date: Wed, 31 Jul 2013 10:39:50 +0200
Message-ID: <CAMuHMdVj_xZWYc1Cszun0F6Xrrz0=e_EJN4b1cqdbcRqgC7ABg@mail.gmail.com>
References: <alpine.DEB.2.02.1305132122190.14304@tglase.lan.tarent.de>
	<CAMuHMdX+t0=J+8a1JoF6Jf=gO_ROuL_kgAVjF0DJA-cgPGp_Ng@mail.gmail.com>
	<Pine.BSM.4.64L.1305132126170.11828@herc.mirbsd.org>
	<5192331E.9010009@debian.org>
	<Pine.BSM.4.64L.1305141338580.14676@herc.mirbsd.org>
	<20130514144112.GH11842@chumley.earth.sol>
	<Pine.BSM.4.64L.1305141642360.9568@herc.mirbsd.org>
	<Pine.BSM.4.64L.1307201716460.31890@herc.mirbsd.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pa0-f51.google.com ([209.85.220.51]:50813 "EHLO
	mail-pa0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759134Ab3GaIjv convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 31 Jul 2013 04:39:51 -0400
Received: by mail-pa0-f51.google.com with SMTP id lf11so599554pab.38
        for <linux-m68k@vger.kernel.org>; Wed, 31 Jul 2013 01:39:51 -0700 (PDT)
In-Reply-To: <Pine.BSM.4.64L.1307201716460.31890@herc.mirbsd.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Thorsten Glaser <tg@mirbsd.de>, Mikael Pettersson <mikpe@it.uu.se>
Cc: Debian m68k <debian-68k@lists.debian.org>, Linux/m68k <linux-m68k@vger.kernel.org>

On Sat, Jul 20, 2013 at 7:27 PM, Thorsten Glaser <tg@mirbsd.de> wrote:
> So good, so far. An ARAnyM log of the build (kernel
> messages) is attached. There=E2=80=99s one thing sticking out:
>
> [    0.160000] WARNING: at /root/linux-3.10.1/init/main.c:698 do_one_=
initcall+0x12e/0x13a()
> [    0.160000] initcall param_sysfs_init+0x0/0x1a4 returned with disa=
bled interrupts
>
> This seems to happen for several initcalls. Geert et al,
> can you have a look at them, they=E2=80=99re scary =E2=98=BA

It only happens on multi-platform kernels, because of the following def=
inition
of ALLOWINT:

#if defined(MACH_ATARI_ONLY)
        /* block out HSYNC =3D ipl 2 on the atari */
#define ALLOWINT        (~0x500)
#else
        /* portable version */
#define ALLOWINT        (~0x700)
#endif /* machine compilation types */

On an Atari-only kernel, flags is either 0x00c02204 or 0x00c02214.
Hence "flags & ~ALLOWINT" is "flags & 0x500" is always zero.

On a multi-platform kernel, flags is one of 0x00c02004, 0x00c02014,
0x00c02204, or 0x00c02214.
Hence "flags & ~ALLOWINT" is "flags & 0x700" is sometimes non-zero,
triggering the warning.

Anyone who sees a solution that doesn't involve adding a variable to ho=
ld
ALLOWINT?

We're already having a check for Q40 in arch_local_irq_enable()
(in multi-platfom kernels only).

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
