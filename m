From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2] m68k: fix ColdFire clear cache operation
Date: Mon, 16 Jul 2012 21:13:32 +0200
Message-ID: <CAMuHMdXV+PiY5LbahntSOAsV6GZgR-WuKQTmwDM=2wrM13wE7g@mail.gmail.com>
References: <1341967036-14645-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-gh0-f174.google.com ([209.85.160.174]:44748 "EHLO
	mail-gh0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753615Ab2GPTNd (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 16 Jul 2012 15:13:33 -0400
Received: by ghrr11 with SMTP id r11so5372789ghr.19
        for <linux-m68k@vger.kernel.org>; Mon, 16 Jul 2012 12:13:33 -0700 (PDT)
In-Reply-To: <1341967036-14645-1-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: gerg@snapgear.com
Cc: linux-m68k@vger.kernel.org, Greg Ungerer <gerg@uclinux.org>

On Wed, Jul 11, 2012 at 2:37 AM,  <gerg@snapgear.com> wrote:
> --- a/arch/m68k/include/asm/cacheflush_mm.h
> +++ b/arch/m68k/include/asm/cacheflush_mm.h
> @@ -17,6 +17,41 @@
>  #define DCACHE_SETMASK 0
>  #endif
>
> +/*
> + * ColdFire architecture has no way to clear individual cache lines, so we
> + * are stuck invalidating all the cache entries when we want a clear operation.
> + */
> +static inline void clear_cf_icache(unsigned long start, unsigned long end)
> +{
> +       __asm__ __volatile__ (
> +               "movec  %0,%%cacr\n\t"
> +               "nop\n\t"
> +               :
> +               : "r" (CACHE_MODE | CACR_ICINVA | CACR_BCINVA));

These new functions should be moved inside the #ifdef CONFIG_COLDFIRE
at the top of the file:

arch/m68k/include/asm/cacheflush_mm.h:30:10: error: 'CACHE_MODE'
undeclared (first use in this function)
arch/m68k/include/asm/cacheflush_mm.h:30:23: error: 'CACR_ICINVA'
undeclared (first use in this function)
arch/m68k/include/asm/cacheflush_mm.h:30:37: error: 'CACR_BCINVA'
undeclared (first use in this function)
arch/m68k/include/asm/cacheflush_mm.h:39:10: error: 'CACHE_MODE'
undeclared (first use in this function)
arch/m68k/include/asm/cacheflush_mm.h:39:23: error: 'CACR_DCINVA'
undeclared (first use in this function)
arch/m68k/include/asm/cacheflush_mm.h:48:10: error: 'CACHE_MODE'
undeclared (first use in this function)
arch/m68k/include/asm/cacheflush_mm.h:48:23: error: 'CACR_ICINVA'
undeclared (first use in this function)
arch/m68k/include/asm/cacheflush_mm.h:48:37: error: 'CACR_BCINVA'
undeclared (first use in this function)
arch/m68k/include/asm/cacheflush_mm.h:48:51: error: 'CACR_DCINVA'
undeclared (first use in this function)

http://kisskb.ellerman.id.au/kisskb/buildresult/6720541/

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
