Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D82DC61DA4
	for <linux-m68k@archiver.kernel.org>; Wed, 15 Mar 2023 07:44:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229571AbjCOHoX convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 15 Mar 2023 03:44:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231234AbjCOHoV (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 15 Mar 2023 03:44:21 -0400
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7360C6131C
        for <linux-m68k@lists.linux-m68k.org>; Wed, 15 Mar 2023 00:43:58 -0700 (PDT)
Received: by mail-qv1-f49.google.com with SMTP id f1so15250326qvx.13
        for <linux-m68k@lists.linux-m68k.org>; Wed, 15 Mar 2023 00:43:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678866237;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=irw1UVNowl4JF0FKbWda8y5x3cm6gsUP6fVPn73ScMA=;
        b=um2OkOkWRMxd7GfQLRu5FkVNDHs42G8/XPZewu0AYw7Jcg2OJEv2WzkeFOQq4wL6zX
         OLW0ZrES2HSnjCJstrmYrHHxWSHy+qKu4jZ0zqshmxn78LyrQl6sIihkcnTHVYiw3dJ5
         kuGcXqiMdVbShTmL0wUbxlT5yWOVokc2rP5zTzTbvOB9M6zsAeT3qOwcpVtyeUGcjrbS
         PHwJMsHncRXRit1mEhiyOHuOtdBqLJmEBeiqCFcQPApn2WHSxz+GA/dtxxJn+WCsCyLs
         oCT0dMT+nGLzTl0Ai5SyIWZuS0EoOXYIQD6/CvOHeRHhSDDGncxzrP3HR19jqkGO9gae
         Ck9A==
X-Gm-Message-State: AO0yUKXL3NVZKcDWqV15g6iNaxFgGYUS0sPQy5mjhxd2qZobwXZDLM3g
        UFTxE2f7ScYNIYdJjtUI6l5w6EfLY/6XN3bc
X-Google-Smtp-Source: AK7set+A22fHQme6fzVK32Tct9IBAiuPy+E3WRH/aWTtLt7SiaUiBi7Bp99PxtFQ0B/e8uvy7FpHsA==
X-Received: by 2002:ac8:7fc4:0:b0:3bd:7a6:67a2 with SMTP id b4-20020ac87fc4000000b003bd07a667a2mr71159315qtk.27.1678866237239;
        Wed, 15 Mar 2023 00:43:57 -0700 (PDT)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com. [209.85.219.173])
        by smtp.gmail.com with ESMTPSA id a3-20020ac87203000000b003bfa52112f9sm3296520qtp.4.2023.03.15.00.43.56
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Mar 2023 00:43:57 -0700 (PDT)
Received: by mail-yb1-f173.google.com with SMTP id u32so11497564ybi.6
        for <linux-m68k@lists.linux-m68k.org>; Wed, 15 Mar 2023 00:43:56 -0700 (PDT)
X-Received: by 2002:a05:6902:188:b0:a99:de9d:d504 with SMTP id
 t8-20020a056902018800b00a99de9dd504mr25136921ybh.12.1678866236647; Wed, 15
 Mar 2023 00:43:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230315051444.3229621-1-willy@infradead.org> <20230315051444.3229621-15-willy@infradead.org>
In-Reply-To: <20230315051444.3229621-15-willy@infradead.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 15 Mar 2023 08:43:44 +0100
X-Gmail-Original-Message-ID: <CAMuHMdULvhry_pGap0J0FLH8TMXG1smanQjUNzPoyKsWh1FZBQ@mail.gmail.com>
Message-ID: <CAMuHMdULvhry_pGap0J0FLH8TMXG1smanQjUNzPoyKsWh1FZBQ@mail.gmail.com>
Subject: Re: [PATCH v4 14/36] m68k: Implement the new page table range API
To:     "Matthew Wilcox (Oracle)" <willy@infradead.org>
Cc:     linux-arch@vger.kernel.org, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Willy,

On Wed, Mar 15, 2023 at 6:14 AM Matthew Wilcox (Oracle)
<willy@infradead.org> wrote:
> Add PFN_PTE_SHIFT, update_mmu_cache_range(), flush_icache_pages() and
> flush_dcache_folio().
>
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>

Thanks for your patch!

> --- a/arch/m68k/include/asm/cacheflush_mm.h
> +++ b/arch/m68k/include/asm/cacheflush_mm.h
> @@ -220,24 +220,29 @@ static inline void flush_cache_page(struct vm_area_struct *vma, unsigned long vm
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
> +               do {
> +                       __asm__ __volatile__("nop\n\t"
> +                                            ".chip 68040\n\t"
> +                                            "cpushp %%bc,(%0)\n\t"
> +                                            ".chip 68k"
> +                                            : : "a" (paddr));
> +                       paddr += PAGE_SIZE;
> +               } while (--nr);

Please use "while (nr--) { ... }", to protect against anyone ever
calling this with nr == 0.

The rest LGTM, I'll give it a try shortly...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
