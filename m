Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83273C7EE32
	for <linux-m68k@archiver.kernel.org>; Thu,  1 Jun 2023 07:44:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231952AbjFAHon convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 1 Jun 2023 03:44:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232134AbjFAHmh (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 1 Jun 2023 03:42:37 -0400
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 234FE10CE
        for <linux-m68k@lists.linux-m68k.org>; Thu,  1 Jun 2023 00:40:24 -0700 (PDT)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-561b7729a12so27904497b3.1
        for <linux-m68k@lists.linux-m68k.org>; Thu, 01 Jun 2023 00:40:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685605223; x=1688197223;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+Vy5gwXbACIYw+FA/+yi3OHDGD1kIURAtfeea/c7peI=;
        b=bLyVSxRKm9G5RtIhvXSbEmQKORN0cnGmX6KWzJKOcbtIds3IHKZefOo6S9bZTiw54/
         oBsFx7zv9LrskputdrwybHPjgCxBULcgGF2JVV291g9yMuUSb35U8oVS6qnwXO2FxsKd
         yn3Nqm3UGHRi0sg6lKbiqs54VBdN3ZCCxkVpEGFVR3Rcqq2IIjZ7hQ7iL5cdJ3ByKx5T
         UggreecLGwcQUcn5oFuP+BUfAYTQHuwbuTrZ5vkXVpsThl4BO+kqD1Qgc3pFvu5ji0rH
         nBD7oGpUZW0RS4XzrkZE4/Z27lsr15TTG8MVjZ+a+iYj1TmsJEWcUgzhxSosUY81gSQI
         jL2g==
X-Gm-Message-State: AC+VfDxHcY9G9v4WvNKbJzBXCi25GTqM8Aqn03xakGE82dcswD1p/hd8
        hKAQFQgOdrHfR7COSLqsjx48rnKix/mC8Q==
X-Google-Smtp-Source: ACHHUZ71MZ1AWAWVrFonXgS2f0C3gQ8mr4KTC9S2FeBWGCDHqb1dlClUcXVjz5vPFR2B+WMv27AkAg==
X-Received: by 2002:a0d:d452:0:b0:565:b76d:82c8 with SMTP id w79-20020a0dd452000000b00565b76d82c8mr1159767ywd.5.1685605222981;
        Thu, 01 Jun 2023 00:40:22 -0700 (PDT)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com. [209.85.128.173])
        by smtp.gmail.com with ESMTPSA id j188-20020a0df9c5000000b005619cfb1b88sm6040761ywf.52.2023.06.01.00.40.21
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Jun 2023 00:40:21 -0700 (PDT)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-561b7729a12so27904257b3.1
        for <linux-m68k@lists.linux-m68k.org>; Thu, 01 Jun 2023 00:40:21 -0700 (PDT)
X-Received: by 2002:a81:a041:0:b0:565:9f61:c771 with SMTP id
 x62-20020a81a041000000b005659f61c771mr1176431ywg.9.1685605221248; Thu, 01 Jun
 2023 00:40:21 -0700 (PDT)
MIME-Version: 1.0
References: <20230531213032.25338-1-vishal.moola@gmail.com> <20230531213032.25338-26-vishal.moola@gmail.com>
In-Reply-To: <20230531213032.25338-26-vishal.moola@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 1 Jun 2023 09:40:07 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWCe=VsTJYNA_-k=JipeAGKzgBFjZ8i+XRK7U1DBei=7A@mail.gmail.com>
Message-ID: <CAMuHMdWCe=VsTJYNA_-k=JipeAGKzgBFjZ8i+XRK7U1DBei=7A@mail.gmail.com>
Subject: Re: [PATCH v3 25/34] m68k: Convert various functions to use ptdescs
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
        xen-devel@lists.xenproject.org, kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Vishal,

On Wed, May 31, 2023 at 11:32 PM Vishal Moola (Oracle)
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
> @@ -7,20 +7,19 @@
>
>  extern inline void pte_free_kernel(struct mm_struct *mm, pte_t *pte)
>  {
> -       free_page((unsigned long) pte);
> +       pagetable_free(virt_to_ptdesc(pte));
>  }
>
>  extern const char bad_pmd_string[];
>
>  extern inline pte_t *pte_alloc_one_kernel(struct mm_struct *mm)
>  {
> -       unsigned long page = __get_free_page(GFP_DMA);
> +       struct ptdesc *ptdesc = pagetable_alloc(GFP_DMA | __GFP_ZERO, 0);
>
> -       if (!page)
> +       if (!ptdesc)
>                 return NULL;
>
> -       memset((void *)page, 0, PAGE_SIZE);
> -       return (pte_t *) (page);
> +       return (pte_t *) (ptdesc_address(ptdesc));

No need to cast "void *" when returning a different pointer type.

>  }
>
>  extern inline pmd_t *pmd_alloc_kernel(pgd_t *pgd, unsigned long address)
> @@ -35,36 +34,36 @@ extern inline pmd_t *pmd_alloc_kernel(pgd_t *pgd, unsigned long address)
>  static inline void __pte_free_tlb(struct mmu_gather *tlb, pgtable_t pgtable,
>                                   unsigned long address)
>  {
> -       struct page *page = virt_to_page(pgtable);
> +       struct ptdesc *ptdesc = virt_to_ptdesc(pgtable);
>
> -       pgtable_pte_page_dtor(page);
> -       __free_page(page);
> +       pagetable_pte_dtor(ptdesc);
> +       pagetable_free(ptdesc);
>  }
>
>  static inline pgtable_t pte_alloc_one(struct mm_struct *mm)
>  {
> -       struct page *page = alloc_pages(GFP_DMA, 0);
> +       struct ptdesc *ptdesc = pagetable_alloc(GFP_DMA, 0);
>         pte_t *pte;
>
> -       if (!page)
> +       if (!ptdesc)
>                 return NULL;
> -       if (!pgtable_pte_page_ctor(page)) {
> -               __free_page(page);
> +       if (!pagetable_pte_ctor(ptdesc)) {
> +               pagetable_free(ptdesc);
>                 return NULL;
>         }
>
> -       pte = page_address(page);
> -       clear_page(pte);
> +       pte = ptdesc_address(ptdesc);
> +       pagetable_clear(pte);
>
>         return pte;
>  }
>
>  static inline void pte_free(struct mm_struct *mm, pgtable_t pgtable)
>  {
> -       struct page *page = virt_to_page(pgtable);
> +       struct ptdesc *ptdesc = virt_to_ptdesc(ptdesc);

virt_to_ptdesc(pgtable)

(You can build this using m5475evb_defconfig)

>
> -       pgtable_pte_page_dtor(page);
> -       __free_page(page);
> +       pagetable_pte_dtor(ptdesc);
> +       pagetable_free(ptdesc);
>  }
>
>  /*
> @@ -75,16 +74,18 @@ static inline void pte_free(struct mm_struct *mm, pgtable_t pgtable)
>
>  static inline void pgd_free(struct mm_struct *mm, pgd_t *pgd)
>  {
> -       free_page((unsigned long) pgd);
> +       pagetable_free(virt_to_ptdesc(pgd));
>  }
>
>  static inline pgd_t *pgd_alloc(struct mm_struct *mm)
>  {
>         pgd_t *new_pgd;
> +       struct ptdesc *ptdesc = pagetable_alloc(GFP_DMA | GFP_NOWARN, 0);
>
> -       new_pgd = (pgd_t *)__get_free_page(GFP_DMA | __GFP_NOWARN);
> -       if (!new_pgd)
> +       if (!ptdesc)
>                 return NULL;
> +       new_pgd = (pgd_t *) ptdesc_address(ptdesc);

No need to cast "void *" when assigning to a different pointer type.

> +
>         memcpy(new_pgd, swapper_pg_dir, PTRS_PER_PGD * sizeof(pgd_t));
>         memset(new_pgd, 0, PAGE_OFFSET >> PGDIR_SHIFT);
>         return new_pgd;

The rest LGTM.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
