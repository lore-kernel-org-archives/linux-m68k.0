Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D016C61DA4
	for <linux-m68k@archiver.kernel.org>; Sun,  5 Mar 2023 10:16:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229686AbjCEKQd convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Sun, 5 Mar 2023 05:16:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229699AbjCEKQ2 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sun, 5 Mar 2023 05:16:28 -0500
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D4C914E89
        for <linux-m68k@lists.linux-m68k.org>; Sun,  5 Mar 2023 02:16:26 -0800 (PST)
Received: by mail-qt1-f173.google.com with SMTP id s12so7586341qtq.11
        for <linux-m68k@lists.linux-m68k.org>; Sun, 05 Mar 2023 02:16:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678011385;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h5qRGfTs5+kV00emn3Oo5iN+DSAN1HACfQYEpZctxMY=;
        b=kXM5wJ4YieQIaoa6Eb5I7mhqb/HClTRziapm9CkHlLyOID7Rm79I7RCQgIqYQ1jYrE
         +Fyj4JcNmk0Mz6mj39fXo9LYh6ZSK/e3UFLX8g1HJXDTdR5G0R853Z551f1dw2Ae77v7
         Q1+7jSMBnCwkf/BhxRR3xQY8aImz0iu27HxcfG0t5l+9bUzDk7eerLDNbnVu8OSEFXJd
         Ac1bipZp5sFmQPqqpsVQoFuO3JM5Y8E7t4UKeOtlD/1845d0x2Po+Pg/DdFH6reVO30n
         4UZ7ibavKflNVh2X++JTvK54UVYjjU9dM2dht1jzUDvtjQkIqpb/Z71idnG2JzzOhETK
         Dqow==
X-Gm-Message-State: AO0yUKVjhyroW2XA4bk7sgv+F7mhx74FnswDfVffE9DQzqgN3ofsBK8n
        DqkPzUgwLQXjz8h62NaAV55FYHXb5ySfww==
X-Google-Smtp-Source: AK7set+yyY6TcU8D0Bdck0ZhAngxY3t/Yn1gQA7qHwSO1rZlJwqbmmaG0v5mbWwSLxKm6RCuIVevCw==
X-Received: by 2002:ac8:5b56:0:b0:3bf:dbd3:a014 with SMTP id n22-20020ac85b56000000b003bfdbd3a014mr9563504qtw.45.1678011385321;
        Sun, 05 Mar 2023 02:16:25 -0800 (PST)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com. [209.85.128.174])
        by smtp.gmail.com with ESMTPSA id a191-20020ae9e8c8000000b007423843d879sm5252622qkg.93.2023.03.05.02.16.24
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Mar 2023 02:16:24 -0800 (PST)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-536cb25982eso129101587b3.13
        for <linux-m68k@lists.linux-m68k.org>; Sun, 05 Mar 2023 02:16:24 -0800 (PST)
X-Received: by 2002:a81:b61d:0:b0:52e:f66d:b70f with SMTP id
 u29-20020a81b61d000000b0052ef66db70fmr4376324ywh.5.1678011384672; Sun, 05 Mar
 2023 02:16:24 -0800 (PST)
MIME-Version: 1.0
References: <20230228213738.272178-1-willy@infradead.org> <20230228213738.272178-14-willy@infradead.org>
In-Reply-To: <20230228213738.272178-14-willy@infradead.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Sun, 5 Mar 2023 11:16:13 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW5TtUeZDmtHvxw+DxqUADC-OCW=tHE2Gptcoie62T+4w@mail.gmail.com>
Message-ID: <CAMuHMdW5TtUeZDmtHvxw+DxqUADC-OCW=tHE2Gptcoie62T+4w@mail.gmail.com>
Subject: Re: [PATCH v3 13/34] m68k: Implement the new page table range API
To:     "Matthew Wilcox (Oracle)" <willy@infradead.org>
Cc:     linux-mm@kvack.org, linux-arch@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Willy,

On Tue, Feb 28, 2023 at 10:37 PM Matthew Wilcox (Oracle)
<willy@infradead.org> wrote:
> Add set_ptes(), update_mmu_cache_range(), flush_icache_pages() and
> flush_dcache_folio().
>
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>

Thanks for your patch!

> --- a/arch/m68k/include/asm/cacheflush_mm.h
> +++ b/arch/m68k/include/asm/cacheflush_mm.h
> @@ -220,24 +220,28 @@ static inline void flush_cache_page(struct vm_area_struct *vma, unsigned long vm
>
>  /* Push the page at kernel virtual address and clear the icache */
>  /* RZ: use cpush %bc instead of cpush %dc, cinv %ic */
> -static inline void __flush_page_to_ram(void *vaddr)
> +static inline void __flush_pages_to_ram(void *vaddr, unsigned int nr)
>  {
>         if (CPU_IS_COLDFIRE) {
>                 unsigned long addr, start, end;
>                 addr = ((unsigned long) vaddr) & ~(PAGE_SIZE - 1);
>                 start = addr & ICACHE_SET_MASK;
> -               end = (addr + PAGE_SIZE - 1) & ICACHE_SET_MASK;
> +               end = (addr + nr * PAGE_SIZE - 1) & ICACHE_SET_MASK;
>                 if (start > end) {
>                         flush_cf_bcache(0, end);
>                         end = ICACHE_MAX_ADDR;
>                 }
>                 flush_cf_bcache(start, end);
>         } else if (CPU_IS_040_OR_060) {
> -               __asm__ __volatile__("nop\n\t"
> -                                    ".chip 68040\n\t"
> -                                    "cpushp %%bc,(%0)\n\t"
> -                                    ".chip 68k"
> -                                    : : "a" (__pa(vaddr)));
> +               unsigned long paddr = __pa(vaddr);
> +
> +               while (nr--) {
> +                       __asm__ __volatile__("nop\n\t"
> +                                            ".chip 68040\n\t"
> +                                            "cpushp %%bc,(%0)\n\t"
> +                                            ".chip 68k"
> +                                            : : "a" (paddr + nr * PAGE_SIZE));

As gcc (9.5.0) keeps on calculating "paddr + nr * PAGE_SIZE"
inside the loop (albeit using a shift instead of a multiplication),
please use "paddr" here, followed by "paddr += PAGE_SIZE;".

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
