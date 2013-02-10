From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 14/17] [m68k] Implement ndelay() based on the existing
 udelay() logic (needed for ISP1160)
Date: Sun, 10 Feb 2013 17:22:30 +0100
Message-ID: <CAMuHMdVcRj3zVecKTqjRHze0P5q3eYsd0afZfo1h6Q8u3DRpQQ@mail.gmail.com>
References: <20130131003015.DCCF4360095@xplor.waratah.dyndns.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-ie0-f179.google.com ([209.85.223.179]:65082 "EHLO
	mail-ie0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755745Ab3BJQWb (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 10 Feb 2013 11:22:31 -0500
Received: by mail-ie0-f179.google.com with SMTP id k11so6781199iea.24
        for <linux-m68k@vger.kernel.org>; Sun, 10 Feb 2013 08:22:30 -0800 (PST)
In-Reply-To: <20130131003015.DCCF4360095@xplor.waratah.dyndns.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: linux-m68k@vger.kernel.org

On Thu, Jan 31, 2013 at 1:30 AM, Michael Schmitz <schmitzmic@gmail.com> wrote:
> Signed-off-by: Michael Schmitz <schmitz@debian.org>
> ---
>  arch/m68k/include/asm/delay.h |   26 ++++++++++++++++++++++++++
>  1 files changed, 26 insertions(+), 0 deletions(-)
>
> diff --git a/arch/m68k/include/asm/delay.h b/arch/m68k/include/asm/delay.h
> index 12d8fe4..b18b667 100644
> --- a/arch/m68k/include/asm/delay.h
> +++ b/arch/m68k/include/asm/delay.h
> @@ -92,5 +92,31 @@ static inline void __udelay(unsigned long usecs)
>  #define udelay(n) (__builtin_constant_p(n) ? \
>         ((n) > 20000 ? __bad_udelay() : __const_udelay(n)) : __udelay(n))
>
> +/*
> + * nanosecond delay:
> + *
> + * ((((HZSCALE) >> 11) * (loops_per_jiffy >> 11)) >> 6) is the number of loops per microsecond
> + *
> + * 1000 / ((((HZSCALE) >> 11) * (loops_per_jiffy >> 11)) >> 6) is the number of nanoseconds per loop
> + *
> + * So n / ( 1000 / ((((HZSCALE) >> 11) * (loops_per_jiffy >> 11)) >> 6) ) would be the number of loops for n nanoseconds
> + *
> + * ndelay(n) = __delay( DIV_ROUND_UP( (n) * ((((HZSCALE) >> 11) * (loops_per_jiffy >> 11)) >> 6), 1000 ) )

This comment line is just a copy of the implementation?

> + */
> +
> +
> +#if defined(CONFIG_M68000) || defined(CONFIG_COLDFIRE)
> +/*
> + * The simpler m68k and ColdFire processors do not have a 32*32->64
> + * multiply instruction. So we need to handle them a little differently.
> + * We use a bit of shifting and a single 32*32->32 multiply to get close.
> + * This is a macro so that the const version can factor out the first
> + * multiply and shift.
> + */
> +#define        HZSCALE         (268435456 / (1000000 / HZ))
> +
> +#define ndelay(n) __delay( DIV_ROUND_UP( (n) * ((((HZSCALE) >> 11) * (loops_per_jiffy >> 11)) >> 6), 1000 ) );
> +
> +#endif

As both of CONFIG_M68000 and CONFIG_COLDFIRE are not set for regular Atari
builds, we still end up using the generic implementation in
<linux/delay.h>, which
does "udelay(DIV_ROUND_UP(x, 1000));"?
I.e. it will never wait for less than 1 us, do we really want that?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
