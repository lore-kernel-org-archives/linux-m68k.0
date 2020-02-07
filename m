Return-Path: <SRS0=/w+O=33=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46CC2C352A4
	for <linux-m68k@archiver.kernel.org>; Fri,  7 Feb 2020 10:56:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2873A217BA
	for <linux-m68k@archiver.kernel.org>; Fri,  7 Feb 2020 10:56:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726861AbgBGK4w (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 7 Feb 2020 05:56:52 -0500
Received: from mail-oi1-f194.google.com ([209.85.167.194]:45556 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726798AbgBGK4w (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 7 Feb 2020 05:56:52 -0500
Received: by mail-oi1-f194.google.com with SMTP id v19so1519912oic.12
        for <linux-m68k@lists.linux-m68k.org>; Fri, 07 Feb 2020 02:56:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lQfKy5egA44S13U4f9rXqvq6xpf552ahmYbsPFShrKM=;
        b=HfAG+A5TDRPfEvHfAKZCk/1EKPLpn08oCNye2aUxRMYcoIPa30QsRz06jNeAzOQyxT
         LDVT+OHroAv/2KLirEMiMQi+x1UuZyGQ0fwO6mYJxEMZ0OL+m693mgS6pm8xRVMkudJ8
         aXuTO5tPNjFCtWLYyeqK/OA2iglu3U34x9foEUMNf32LgRe4I7Vr+3jO5pYwBzmH0cWJ
         X8G4WmcPKPpW+pfHwqfJmf81deLMMdHLQrNI+edu/pypklCdXfh3B/ByiWdXPbcGzxO/
         22+7ZmO+NpAB7MUL06IlGBnbX+giK8JzshBZ8lVBBZ4BcV2d7akjDni6gSm28ZNxtlwT
         x7Ug==
X-Gm-Message-State: APjAAAWp6B3IoRr+Q4Kr0FApa5MbLOk5m9a1JyDLI8fq3wJ174drhphS
        ng60bSIzoUZdyAY36NNIR3mDI05JC43nvQ9FYjE=
X-Google-Smtp-Source: APXvYqycqwpBkZcbsxdpAKyOtPvyvpl/LqBhnsVq4iF7d0akiB5eVMu0w+UqttgfVubClK/yMH5lfc5AImZoy6mgRNU=
X-Received: by 2002:aca:48cd:: with SMTP id v196mr1723906oia.102.1581073011608;
 Fri, 07 Feb 2020 02:56:51 -0800 (PST)
MIME-Version: 1.0
References: <20200131124531.623136425@infradead.org> <20200131125403.882175409@infradead.org>
In-Reply-To: <20200131125403.882175409@infradead.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 7 Feb 2020 11:56:40 +0100
Message-ID: <CAMuHMdWa8R=3fHLV7W_ni8An_1CwOoJxErnnDA3t4rq2XN+QzA@mail.gmail.com>
Subject: Re: [PATCH -v2 08/10] m68k,mm: Extend table allocator for multiple sizes
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

On Fri, Jan 31, 2020 at 1:56 PM Peter Zijlstra <peterz@infradead.org> wrote:
> In addition to the PGD/PMD table size (128*4) add a PTE table size
> (64*4) to the table allocator. This completely removes the pte-table
> overhead compared to the old code, even for dense tables.

Thanks for your patch!

> Notes:
>
>  - the allocator gained a list_empty() check to deal with there not
>    being any pages at all.
>
>  - the free mask is extended to cover more than the 8 bits required
>    for the (512 byte) PGD/PMD tables.

Being an mm-illiterate, I don't understand the relation between the number
of bits and the size (see below).

>  - NR_PAGETABLE accounting is restored.
>
> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>

WARNING: Missing Signed-off-by: line by nominal patch author 'Peter
Zijlstra <peterz@infradead.org>'
(in all patches)

I can fix that (the From?) up while applying.

> --- a/arch/m68k/mm/motorola.c
> +++ b/arch/m68k/mm/motorola.c
> @@ -72,24 +72,35 @@ void mmu_page_dtor(void *page)
>     arch/sparc/mm/srmmu.c ... */
>
>  typedef struct list_head ptable_desc;
> -static LIST_HEAD(ptable_list);
> +
> +static struct list_head ptable_list[2] = {
> +       LIST_HEAD_INIT(ptable_list[0]),
> +       LIST_HEAD_INIT(ptable_list[1]),
> +};
>
>  #define PD_PTABLE(page) ((ptable_desc *)&(virt_to_page(page)->lru))
>  #define PD_PAGE(ptable) (list_entry(ptable, struct page, lru))
> -#define PD_MARKBITS(dp) (*(unsigned char *)&PD_PAGE(dp)->index)
> +#define PD_MARKBITS(dp) (*(unsigned int *)&PD_PAGE(dp)->index)
> +
> +static const int ptable_shift[2] = {
> +       7+2, /* PGD, PMD */
> +       6+2, /* PTE */
> +};
>
> -#define PTABLE_SIZE (PTRS_PER_PMD * sizeof(pmd_t))
> +#define ptable_size(type) (1U << ptable_shift[type])
> +#define ptable_mask(type) ((1U << (PAGE_SIZE / ptable_size(type))) - 1)

So this is 0xff for PGD and PMD, like before, and 0xffff for PTE.
Why the latter value?

Thanks!

>
> -void __init init_pointer_table(unsigned long ptable)
> +void __init init_pointer_table(void *table, int type)
>  {
>         ptable_desc *dp;
> +       unsigned long ptable = (unsigned long)table;
>         unsigned long page = ptable & PAGE_MASK;
> -       unsigned char mask = 1 << ((ptable - page)/PTABLE_SIZE);
> +       unsigned int mask = 1U << ((ptable - page)/ptable_size(type));
>
>         dp = PD_PTABLE(page);
>         if (!(PD_MARKBITS(dp) & mask)) {
> -               PD_MARKBITS(dp) = 0xff;
> -               list_add(dp, &ptable_list);
> +               PD_MARKBITS(dp) = ptable_mask(type);
> +               list_add(dp, &ptable_list[type]);
>         }
>
>         PD_MARKBITS(dp) &= ~mask;

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
