Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A2F6C001E0
	for <linux-m68k@archiver.kernel.org>; Sun, 25 Jun 2023 08:51:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230197AbjFYIvg convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Sun, 25 Jun 2023 04:51:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231750AbjFYIve (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sun, 25 Jun 2023 04:51:34 -0400
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C52BE1AE
        for <linux-m68k@lists.linux-m68k.org>; Sun, 25 Jun 2023 01:51:33 -0700 (PDT)
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-c1061f0c282so1488305276.1
        for <linux-m68k@lists.linux-m68k.org>; Sun, 25 Jun 2023 01:51:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687683093; x=1690275093;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e/Aydrd9oAz9wF8VtbGA6a+XUUai3n6kkWsRZbAgo9o=;
        b=kgHpKEUzkzJdcyeW34TVfUdeO4u1VIWXLDHA1OtuiBsPbRGirfAwwperY5MScgXayV
         sdjsY65pUR8Q9vuJBgZVu5f1xfYt8ZlguTsN4jwuU1hEvxci/Wb1tHhFEsWMfqKCQcyT
         hlleovsOIfxoqrDbwO8+tvZiklrVBVzU5/n2sPC/E1w+KDXVlfAO64jEkjpQeqc2KGbW
         DirsbdINJLSnKO6Anfouhyv291E/agtWsQ+0Alde2pgGMf359+jsRD+WOjZFGVaYa0Lk
         L4cyrocV/E8OGwyZIqGi/vI5FbJqi0pDmQwXIMcc7hRbL3ZEUNKYZckPjgF75L8ZXCgA
         cfXQ==
X-Gm-Message-State: AC+VfDxPw41sSXu74Gqw7UtzD4RHBgF9RboEkwiTBWZEDRKMTUxwWQ8v
        sgVVoLOS3FoMPnW5NIlRNI34vI48Lm5a7w==
X-Google-Smtp-Source: ACHHUZ5IyTDLta5z6AWYF7AxL2wSmjBvYyHfgwP72FgtXCis/pO6uyUl0iI9+YAQZTaRdBx0aZRjNg==
X-Received: by 2002:a25:cc02:0:b0:c13:f86d:3324 with SMTP id l2-20020a25cc02000000b00c13f86d3324mr3724446ybf.14.1687683092699;
        Sun, 25 Jun 2023 01:51:32 -0700 (PDT)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com. [209.85.219.178])
        by smtp.gmail.com with ESMTPSA id 187-20020a2510c4000000b00bf4d24fd976sm674380ybq.10.2023.06.25.01.51.30
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Jun 2023 01:51:31 -0700 (PDT)
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-bd6d9d7da35so2325347276.0
        for <linux-m68k@lists.linux-m68k.org>; Sun, 25 Jun 2023 01:51:30 -0700 (PDT)
X-Received: by 2002:a25:cc02:0:b0:c13:f86d:3324 with SMTP id
 l2-20020a25cc02000000b00c13f86d3324mr3724376ybf.14.1687683090555; Sun, 25 Jun
 2023 01:51:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230622205745.79707-1-vishal.moola@gmail.com> <20230622205745.79707-25-vishal.moola@gmail.com>
In-Reply-To: <20230622205745.79707-25-vishal.moola@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Sun, 25 Jun 2023 10:51:19 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU2ZM1oJ7=Br6nezLpxjDQo_07N3T-adOupDm0Jntp=Qg@mail.gmail.com>
Message-ID: <CAMuHMdU2ZM1oJ7=Br6nezLpxjDQo_07N3T-adOupDm0Jntp=Qg@mail.gmail.com>
Subject: Re: [PATCH v5 24/33] m68k: Convert various functions to use ptdescs
To:     "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org,
        linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
        loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
        linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
        linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
        sparclinux@vger.kernel.org, linux-um@lists.infradead.org,
        xen-devel@lists.xenproject.org, kvm@vger.kernel.org,
        Hugh Dickins <hughd@google.com>,
        Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Vishal,

On Thu, Jun 22, 2023 at 10:58 PM Vishal Moola (Oracle)
<vishal.moola@gmail.com> wrote:
> As part of the conversions to replace pgtable constructor/destructors with
> ptdesc equivalents, convert various page table functions to use ptdescs.
>
> Some of the functions use the *get*page*() helper functions. Convert
> these to use pagetable_alloc() and ptdesc_address() instead to help
> standardize page tables further.
>
> Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>

Thanks for your patch!

> --- a/arch/m68k/include/asm/mcf_pgalloc.h
> +++ b/arch/m68k/include/asm/mcf_pgalloc.h

>  static inline pgd_t *pgd_alloc(struct mm_struct *mm)
>  {
>         pgd_t *new_pgd;
> +       struct ptdesc *ptdesc = pagetable_alloc((GFP_DMA | GFP_NOWARN) &

0-day already told you for v3 that GFP_NOWARN does not exist.
Please try cross-compiling your changes:
https://mirrors.edge.kernel.org/pub/tools/crosstool/

> +                       ~__GFP_HIGHMEM, 0);
>
> -       new_pgd = (pgd_t *)__get_free_page(GFP_DMA | __GFP_NOWARN);
> -       if (!new_pgd)
> +       if (!ptdesc)
>                 return NULL;
> +       new_pgd = ptdesc_address(ptdesc);
> +
>         memcpy(new_pgd, swapper_pg_dir, PTRS_PER_PGD * sizeof(pgd_t));
>         memset(new_pgd, 0, PAGE_OFFSET >> PGDIR_SHIFT);
>         return new_pgd;

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
