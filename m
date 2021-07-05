Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3EEAC07E98
	for <linux-m68k@archiver.kernel.org>; Mon,  5 Jul 2021 08:45:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7FD1F613C2
	for <linux-m68k@archiver.kernel.org>; Mon,  5 Jul 2021 08:45:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230127AbhGEIrl (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 5 Jul 2021 04:47:41 -0400
Received: from mail-vs1-f48.google.com ([209.85.217.48]:43771 "EHLO
        mail-vs1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230101AbhGEIrk (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 5 Jul 2021 04:47:40 -0400
Received: by mail-vs1-f48.google.com with SMTP id g24so2248490vsa.10
        for <linux-m68k@lists.linux-m68k.org>; Mon, 05 Jul 2021 01:45:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UZi1bZYzWDxlVv0PI+3A9vjhvOfjLHjEZtYS/H0/d2c=;
        b=jT4OXntC1CjBvtTzCViadsYvjWDWGHk3Eeb3NrmvwgEXkl0QZmzdCCvEvqCBEo1TCH
         YVppJ0av80N/UdT8I+vkeP2/upe9gh4JsEZVZiVeX9vKTSFEh2KYGddGFATGXedGYSvk
         4sAPVuDGOLqq+waEWEHRUFs7jjciwRZWiXkBEEg2fndAQjkLvNaMkWfWrn8GLd1yoyyK
         NL0p3CEEzVMvmT50pU207OPx7Zwmu3X6XfaPkKSROT+SDhH6hmd+tVayxh7/1cTRReFt
         EyyM6c1QhnQ4ag913TE7QJgSOJsqX7l3LSO/xf0wpnfFVE3UCEKn0Thb9UTotoI7AVzn
         G63w==
X-Gm-Message-State: AOAM530f+RRuDsIszJP0isAWwA/OnDB5s2d0T3BxxFjF0u3Zkxc9x5Fv
        DWxv+SeASlhEsa8wtgt6aL9XHN04VdxK59ZBUGE=
X-Google-Smtp-Source: ABdhPJz42LcBFnSbCxe0YXK3gz2Fz33+j46M3kAaqOp7Y02HTY23u6ar9OXMO23l05kTuxQpON0x4ZNeaQ5OVdgnhss=
X-Received: by 2002:a67:d012:: with SMTP id r18mr608980vsi.3.1625474702791;
 Mon, 05 Jul 2021 01:45:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210705055719.949875-1-hch@lst.de> <20210705055719.949875-2-hch@lst.de>
In-Reply-To: <20210705055719.949875-2-hch@lst.de>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 5 Jul 2021 10:44:51 +0200
Message-ID: <CAMuHMdV4UQaKE7fn0_HhPfHzwEMwouPvqoeW6_V13yebe7ZSQQ@mail.gmail.com>
Subject: Re: [PATCH] m68knommu: remove set_fs()
To:     Christoph Hellwig <hch@lst.de>
Cc:     Greg Ungerer <gerg@linux-m68k.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        uClinux development list <uclinux-dev@uclinux.org>,
        Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Christoph,

On Mon, Jul 5, 2021 at 7:58 AM Christoph Hellwig <hch@lst.de> wrote:
> m68knommu already does not distinguish between kernel and user address
> spaces.  Stop defining set_fs() and thus uaccess_kernel() to avoid
> confusion.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Thanks for your patch!

> --- a/arch/m68k/Kconfig
> +++ b/arch/m68k/Kconfig
> @@ -32,7 +32,7 @@ config M68K
>         select NO_DMA if !MMU && !COLDFIRE
>         select OLD_SIGACTION
>         select OLD_SIGSUSPEND3
> -       select SET_FS
> +       select SET_FS if MMU

Probably this should be

    select SET_FS if CPU_HAS_ADDRESS_SPACES

instead.  Classic m68k (except for good old 68000) has address spaces,
Coldfire has not.

Which brought my attention to a problem with support for embedded
68EC020 cores: MCPU32  does not select CPU_HAS_ADDRESS_SPACES, but
it also does not select GENERIC_CSUM.  The latter means it will use
arch/m68k/lib/checksum.c, which does contain moves instructions, thus
assuming separate address spaces.  Fortunately MCPU32 is no longer
used since commit a3595962d82495f5 ("m68knommu: remove obsolete 68360
support"), so it can be removed, too.

I guess we want to simplify

    config GENERIC_CSUM
        default y if !CPU_HAS_ADDRESS_SPACES

which would allow us to get rid of the ifndef CONFIG_GENERIC_CSUM in
arch/m68k/lib/Makefile, in favor of lib-$(CPU_HAS_ADDRESS_SPACES).

> --- a/arch/m68k/include/asm/segment.h
> +++ b/arch/m68k/include/asm/segment.h
> @@ -2,19 +2,20 @@
>  #ifndef _M68K_SEGMENT_H
>  #define _M68K_SEGMENT_H
>
> -/* define constants */
>  /* Address spaces (FC0-FC2) */
>  #define USER_DATA     (1)
> +#define USER_PROGRAM  (2)
> +#define SUPER_DATA    (5)
> +#define SUPER_PROGRAM (6)
> +#define CPU_SPACE     (7)
> +
> +#ifdef CONFIG_MMU
>  #ifndef __USER_DS
>  #define __USER_DS     (USER_DATA)
>  #endif
> -#define USER_PROGRAM  (2)
> -#define SUPER_DATA    (5)
>  #ifndef __KERNEL_DS
>  #define __KERNEL_DS   (SUPER_DATA)
>  #endif
> -#define SUPER_PROGRAM (6)
> -#define CPU_SPACE     (7)
>
>  #ifndef __ASSEMBLY__

Just below this is the existing handling for !CPU_HAS_ADDRESS_SPACES.
Probably the [sg]et_fs() definitions there should be made dummies,
reducing the need to add a rather large number of #ifdefs.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
