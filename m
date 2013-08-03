From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: linux 3.10.1 with initrd (was Re: linux 3.8.12-1 (atari flavour)
 does not boot)
Date: Sat, 3 Aug 2013 10:05:50 +0200
Message-ID: <CAMuHMdXiwukj7O29DSW5vyWAXFQur4n5OX-Q_BAiZVHMm98A9w@mail.gmail.com>
References: <alpine.DEB.2.02.1305132122190.14304@tglase.lan.tarent.de>
	<CAMuHMdX+t0=J+8a1JoF6Jf=gO_ROuL_kgAVjF0DJA-cgPGp_Ng@mail.gmail.com>
	<Pine.BSM.4.64L.1305132126170.11828@herc.mirbsd.org>
	<5192331E.9010009@debian.org>
	<Pine.BSM.4.64L.1305141338580.14676@herc.mirbsd.org>
	<20130514144112.GH11842@chumley.earth.sol>
	<Pine.BSM.4.64L.1305141642360.9568@herc.mirbsd.org>
	<Pine.BSM.4.64L.1307201716460.31890@herc.mirbsd.org>
	<CAMuHMdVj_xZWYc1Cszun0F6Xrrz0=e_EJN4b1cqdbcRqgC7ABg@mail.gmail.com>
	<0f1d3739660c2bece613948285afd937@biophys.uni-duesseldorf.de>
	<CAMuHMdXq1Cz9K9qcVqx=C6sbrDJ4JpWT7c6G+JhY+Z4SdYdnKg@mail.gmail.com>
	<51FBEBE1.1020507@gmail.com>
	<CAMuHMdX+BCD8zt9MFw32stzM7dZzu05pOSCW=5jQURB5mpXUpg@mail.gmail.com>
	<51FC5ED0.2070708@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pb0-f48.google.com ([209.85.160.48]:50242 "EHLO
	mail-pb0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751158Ab3HCIFv (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sat, 3 Aug 2013 04:05:51 -0400
Received: by mail-pb0-f48.google.com with SMTP id ma3so1485798pbc.7
        for <linux-m68k@vger.kernel.org>; Sat, 03 Aug 2013 01:05:50 -0700 (PDT)
In-Reply-To: <51FC5ED0.2070708@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>, Mikael Pettersson <mikpe@it.uu.se>, Thorsten Glaser <tg@mirbsd.de>, Linux/m68k <linux-m68k@vger.kernel.org>, Debian m68k <debian-68k@lists.debian.org>

On Sat, Aug 3, 2013 at 3:37 AM, Michael Schmitz <schmitzmic@gmail.com> wrote:
>  static inline bool arch_irqs_disabled_flags(unsigned long flags)
>  {
> + #if defined(MACH_ATARI_ONLY) || defined(MACH_AMIGA_ONLY)

The above is not needed:
  - If MACH_ATARI_ONLY, MACH_IS_ATARI is hardcoded to 1, so the
    compiler will optimize-away the else part. In that case,
    "ALLOWINT | 0x200" == "ALLOWINT".
  - If MACH_AMIGA_ONLY, MACH_IS_ATARI is hardcoded to 0, and
    the compiler will optimize-away the other part.

>
>         return (flags & ~ALLOWINT) != 0;
> + #else
>
> +       if (MACH_IS_ATARI) {
> +               /* Ignore HSYNC = ipl 2 on Atari */
> +               return (flags & ~(ALLOWINT | 0x200)) != 0;
> +       } else
> +           return (flags & ~ALLOWINT) != 0;
> + #endif
>  }
>
>
> (or whatever compiler flag we have to indicate we're not building a
> multi-platform kernel)

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
