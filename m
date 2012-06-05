From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 9/11] Atari: add ndelay() (used by isp116x-hcd)
Date: Tue, 5 Jun 2012 22:43:48 +0200
Message-ID: <CAMuHMdV=U_6i=XaOUVC9rwy1WWbMDSF3WjRWDtLSG-6p+ecR2A@mail.gmail.com>
References: <E1SXMIc-0002Y2-NB@zirkon.biophys.uni-duesseldorf.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-gh0-f174.google.com ([209.85.160.174]:55410 "EHLO
	mail-gh0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751103Ab2FEUnt convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 5 Jun 2012 16:43:49 -0400
Received: by ghrr11 with SMTP id r11so4719638ghr.19
        for <linux-m68k@vger.kernel.org>; Tue, 05 Jun 2012 13:43:49 -0700 (PDT)
In-Reply-To: <E1SXMIc-0002Y2-NB@zirkon.biophys.uni-duesseldorf.de>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitz@zirkon.biophys.uni-duesseldorf.de>
Cc: linux-m68k@vger.kernel.org

On Thu, May 24, 2012 at 2:53 AM, Michael Schmitz
<schmitz@zirkon.biophys.uni-duesseldorf.de> wrote:
> +#if defined(CONFIG_M68000) || defined(CONFIG_COLDFIRE)
> +/*
> + * The simpler m68k and ColdFire processors do not have a 32*32->64
> + * multiply instruction. So we need to handle them a little differen=
tly.
> + * We use a bit of shifting and a single 32*32->32 multiply to get c=
lose.
> + * This is a macro so that the const version can factor out the firs=
t
> + * multiply and shift.
> + */
> +#define =C2=A0 =C2=A0 =C2=A0 =C2=A0HZSCALE =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 (268435456 / (1000000 / HZ))
> +
> +#define ndelay(n) __delay( DIV_ROUND_UP( (n) * ((((HZSCALE) >> 11) *=
 (loops_per_jiffy >> 11)) >> 6), 1000 ) );
> +
> +#endif

Why do you need this? CONFIG_M68000 and CONFIG_COLDFIRE are not set?

You end up using the default implementation in include/linux/delay.h.

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
