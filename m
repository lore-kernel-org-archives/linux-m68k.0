Return-Path: <SRS0=X0A7=CS=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77855C433E2
	for <linux-m68k@archiver.kernel.org>; Wed,  9 Sep 2020 06:55:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 40A1321532
	for <linux-m68k@archiver.kernel.org>; Wed,  9 Sep 2020 06:55:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725917AbgIIGzS (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 9 Sep 2020 02:55:18 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:41046 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725826AbgIIGzR (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Wed, 9 Sep 2020 02:55:17 -0400
Received: by mail-ot1-f67.google.com with SMTP id w25so190513otk.8
        for <linux-m68k@vger.kernel.org>; Tue, 08 Sep 2020 23:55:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yQVFi0rBOeyArSCy1Nq+nU7xU7sTfTT87TjovbKbR+o=;
        b=p5K7ePCqxM0kmaOT+NAyvP+MoX42BQL0UDiXtc9TCg6V1MHolpGS4c0iAMYXHu5UsW
         75d73gtd7EEE9zWVrLMrftTCEOTLyBtKIZHRKB0RkcG1zsMJIs29Ee9UD7K3MNmTRfBF
         R8HsAD3t6skN6+D20JFWTDK300ZCqwnNaJxWRca80kCBcebOuREv+A76LuP7AgSjUBkP
         Z6CBMG0qECoTm88e9VauwiO3BYMZ2AjTL04toxsUR/lj+HDCCkjgbAK2Il3i2x9l99gF
         PxwLel1eycg/FzsDYfrhU6/6w5dicqarQlvAG6vlqlKZZcez8dMv94WToIT5BgpJuUEB
         Fmyg==
X-Gm-Message-State: AOAM530Q54q+G9AkHAzcsCof6k1okDVXswaOKtc4MwL5Oo8GS/xd7dh2
        JQqFoIhPjEtRrb9qJsPnSwB7zux4fhSb84qh9lU=
X-Google-Smtp-Source: ABdhPJwQ1LcIhMmB6uxM5PnsmV271MFJkjiSBYP5/blLfayefCMbs2rgMl6Ns/HOsAldfr06ZMHM9WEoPmLjMN2AFGU=
X-Received: by 2002:a9d:1b62:: with SMTP id l89mr1935334otl.145.1599634516051;
 Tue, 08 Sep 2020 23:55:16 -0700 (PDT)
MIME-Version: 1.0
References: <20200909021831.1881990-1-gerg@linux-m68k.org>
In-Reply-To: <20200909021831.1881990-1-gerg@linux-m68k.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 9 Sep 2020 08:55:05 +0200
Message-ID: <CAMuHMdU8DWRpnTp=iOGDqYbhsDaiDi9TtLLojm5Vd3umBbOo+w@mail.gmail.com>
Subject: Re: [PATCH] m68knommu: switch to using asm-generic/uaccess.h
To:     Greg Ungerer <gerg@linux-m68k.org>
Cc:     "Linux/m68k" <linux-m68k@vger.kernel.org>,
        Christoph Hellwig <hch@lst.de>, Arnd Bergmann <arnd@arndb.de>,
        kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Greg,

On Wed, Sep 9, 2020 at 4:18 AM Greg Ungerer <gerg@linux-m68k.org> wrote:
> Switch to using the asm-generic/uaccess functions for non-MMU builds.
> Remove all the m68knommu local specific uaccess defines and macros.
>
> There is nothing so special about the m68knommu targets that they cannot
> use all of the asm-generic uaccess support. Using the asm-generic
> uaccess definitions also resolves some of the existing problems with
> missing __user annotations in the m68knommu specific functions.
>
> The elimination of all of the contents of uaccess_no.h means we can fold
> the uaccess_mm.h back into uaccess.h - and just have the single file
> now.
>
> The resulting generated code ends up being slightly smaller (by a few
> hundred bytes) due to the compilers ability to better optimize load
> and stores without forcing its hand with asm statements.
>
> Specifically trivial cases like this contrived example:
>
>     get_user(x, ptr);
>     x++;
>     put_user(x, ptr);
>
> end up now being optimized to a single instruction on m68k. More
> generally the compiler can avoid using a temporary register in many
> cases as well.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Greg Ungerer <gerg@linux-m68k.org>

Thanks for your patch!

> rename from arch/m68k/include/asm/uaccess_mm.h
> rename to arch/m68k/include/asm/uaccess.h
> index 9ae9f8d05925..f98208ccbbcd 100644
> --- a/arch/m68k/include/asm/uaccess_mm.h
> +++ b/arch/m68k/include/asm/uaccess.h
> @@ -2,12 +2,15 @@
>  #ifndef __M68K_UACCESS_H
>  #define __M68K_UACCESS_H
>
> +#ifdef CONFIG_MMU
> +
>  /*
>   * User space memory access functions
>   */
>  #include <linux/compiler.h>
>  #include <linux/types.h>
>  #include <asm/segment.h>
> +#include <asm/extable.h>

For a moment, I wondered where this new include came from...

Seems like git doesn't show what happened to the old
arch/m68k/include/asm/uaccess.h file, which was overwritten by the
rename:

    -/* SPDX-License-Identifier: GPL-2.0 */
    -#ifdef __uClinux__
    -#include <asm/uaccess_no.h>
    -#else
    -#include <asm/uaccess_mm.h>
    -#endif
    -#include <asm/extable.h>

There it is ;-)

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

>  /* We let the MMU do all checking */
>  static inline int access_ok(const void __user *addr,
> @@ -387,4 +390,8 @@ unsigned long __clear_user(void __user *to, unsigned long n);
>
>  #define clear_user     __clear_user
>
> +#else /* !CONFIG_MMU */
> +#include <asm-generic/uaccess.h>
> +#endif
> +
>  #endif /* _M68K_UACCESS_H */

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
