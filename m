Return-Path: <SRS0=/w+O=33=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91FB0C352A3
	for <linux-m68k@archiver.kernel.org>; Fri,  7 Feb 2020 10:58:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7344920838
	for <linux-m68k@archiver.kernel.org>; Fri,  7 Feb 2020 10:58:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727028AbgBGK66 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 7 Feb 2020 05:58:58 -0500
Received: from mail-oi1-f195.google.com ([209.85.167.195]:40558 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726587AbgBGK66 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 7 Feb 2020 05:58:58 -0500
Received: by mail-oi1-f195.google.com with SMTP id a142so1557935oii.7
        for <linux-m68k@lists.linux-m68k.org>; Fri, 07 Feb 2020 02:58:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xlWmAKNVj5dvuafMqzMVgnMvFP7XXln5tSxgE2a8QTA=;
        b=sMoay/rLW21OE/Uj/lKgluoLEusOHfacUBgZ0eYEOaaL25hKYt+QPXgZMxeQbvRJro
         2/yx+jWECgoeT2FV+bGXX5qPXaEyunLYAT+/e4ZDhA20Pemao3Rpq4xvoHpX7aI9dKtX
         YPGiD9CAswmpGgs8HiU8LD6tGAN8wu5ofwllx8uhjiHG4CHFoNyFJYFMEZ1j+GjFXh1T
         BB132S5NIg8Mts+tf3lSTj3UrefAX1bvgwgi2MN9ARQ6K+SesbHyLJePxoaHJqgO2JnB
         yyA4z7pDM25PvedXXoagxY++/4/zpK54u/E3QFeM4sQlGjYdv9pdJgFuXjhb/2x6hzt/
         ZlXg==
X-Gm-Message-State: APjAAAWsM46/9FVU0YVGU7IK2YP5eWJf1heuq1GBLxqP18CJwydOwXPi
        D0+bgMRtmw6C5LI59anEfYfL+NhXPlZZcwPZ6KJzRhbL
X-Google-Smtp-Source: APXvYqw314+cwlH3iHyW2XWK9TYYfJ+GcZAJnc1R38slc6frr4UWK+8kpOFhkF35Ez/ZDEfz7vki8eTJf9/YOKQ3c3U=
X-Received: by 2002:aca:48cd:: with SMTP id v196mr1728279oia.102.1581073136290;
 Fri, 07 Feb 2020 02:58:56 -0800 (PST)
MIME-Version: 1.0
References: <20200131124531.623136425@infradead.org> <20200131125403.938797587@infradead.org>
In-Reply-To: <20200131125403.938797587@infradead.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 7 Feb 2020 11:58:42 +0100
Message-ID: <CAMuHMdUxwz4X+SYCCWCMNAw2nNTMUXWPWrxJ+X9mYC_tirvN=A@mail.gmail.com>
Subject: Re: [PATCH -v2 09/10] m68k,mm: Fully initialize the page-table allocator
To:     Peter Zijlstra <peterz@infradead.org>
Cc:     linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Will Deacon <will@kernel.org>,
        Michael Schmitz <schmitzmic@gmail.com>,
        Greg Ungerer <gerg@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hoi Peter,

Thanks for your patch!

On Fri, Jan 31, 2020 at 1:56 PM Peter Zijlstra <peterz@infradead.org> wrote:
> Also iterate the PMD tables to populate the PTE table allocator. This
> also fully replaces the previous zero_pgtable hack.

As no code is being removed in this patch, does this mean this case was
broken since "[PATCH 06/10] m68k,mm: Improve kernel_page_table()"?

> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> ---
>  arch/m68k/mm/init.c |   13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
>
> --- a/arch/m68k/mm/init.c
> +++ b/arch/m68k/mm/init.c
> @@ -120,7 +120,7 @@ void free_initmem(void)
>  static inline void init_pointer_tables(void)
>  {
>  #if defined(CONFIG_MMU) && !defined(CONFIG_SUN3) && !defined(CONFIG_COLDFIRE)
> -       int i;
> +       int i, j;
>
>         /* insert pointer tables allocated so far into the tablelist */
>         init_pointer_table(kernel_pg_dir, TABLE_PGD);
> @@ -133,6 +133,17 @@ static inline void init_pointer_tables(v
>
>                 pmd_dir = (pmd_t *)pgd_page_vaddr(kernel_pg_dir[i]);
>                 init_pointer_table(pmd_dir, TABLE_PMD);
> +
> +               for (j = 0; j < PTRS_PER_PMD; j++) {
> +                       pmd_t *pmd = &pmd_dir[j];
> +                       pte_t *pte_dir;
> +
> +                       if (!pmd_present(*pmd))
> +                               continue;
> +
> +                       pte_dir = (pte_t *)__pmd_page(*pmd);
> +                       init_pointer_table(pte_dir, TABLE_PTE);
> +               }
>         }
>  #endif
>  }

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
