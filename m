Return-Path: <SRS0=uzpD=6N=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC6B6C83003
	for <linux-m68k@archiver.kernel.org>; Wed, 29 Apr 2020 07:34:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9ABB3206D9
	for <linux-m68k@archiver.kernel.org>; Wed, 29 Apr 2020 07:34:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726420AbgD2HeP (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 29 Apr 2020 03:34:15 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:43776 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726355AbgD2HeP (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 29 Apr 2020 03:34:15 -0400
Received: by mail-oi1-f196.google.com with SMTP id j16so956311oih.10
        for <linux-m68k@lists.linux-m68k.org>; Wed, 29 Apr 2020 00:34:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SyWquW6C3h9yYRPnL8ZX6mVqONgOMsOlS/nbLkzCvR8=;
        b=Q7b1WloH3BNWLKrfpG7q1BWRxDDIlc4cnuGijD2OuPAT89XUyE0HqkTLAQSs0yHVY6
         IVIg8IbL+mSskV/zWYRVBPLgAKGJba/pnwHGG38l6HYjhaOZd9rQT3Jb9V+ycK4Cl4OG
         70UzW1J4NNlhJXUP4KHEYNG6+9wZNc+T7NNhCdjvuBypQ2tVG1QuNf3bH0mGvuKgxrqM
         F1oruI9MJvCTy5HVDuDc9bA7UqFInRIi5T14xfXW6vgtN8sVmuaUqGhy3B8G8yR3yWKm
         VftCjDiWrdFBATEyz80q3KhjUPKK4z53ldthPzlD+qlV/qTdeGNlOmZC70MtQXortLsY
         1daw==
X-Gm-Message-State: AGi0Pub2a345ncbkPH7oYCzujCMVdUHDoOAQO8g/+OrMriSDMEVrjHCP
        74cEVjU9ILtTdu+n5djhXgGw+/6Oxar+VmQy0aY=
X-Google-Smtp-Source: APiQypJAsZR6cJVnPhd52DhYQokiZWeX1PxL/6m2Vvtp1dgHuL2QQU2M5utJVEIEaKuPsXF6mplj99rnUrUZngmlKtw=
X-Received: by 2002:aca:d50f:: with SMTP id m15mr810760oig.54.1588145654121;
 Wed, 29 Apr 2020 00:34:14 -0700 (PDT)
MIME-Version: 1.0
References: <20200428194449.22615-1-willy@infradead.org> <20200428194449.22615-3-willy@infradead.org>
In-Reply-To: <20200428194449.22615-3-willy@infradead.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 29 Apr 2020 09:34:02 +0200
Message-ID: <CAMuHMdUw38VD8WJe5Zbaudnee74ZgLwbfhRwU8Pi9ALitre+_Q@mail.gmail.com>
Subject: Re: [PATCH 2/7] mm: Move pt_mm within struct page
To:     Matthew Wilcox <willy@infradead.org>
Cc:     Linux MM <linux-mm@kvack.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Will Deacon <will@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Russell King <linux@armlinux.org.uk>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Matthew,

On Tue, Apr 28, 2020 at 9:44 PM Matthew Wilcox <willy@infradead.org> wrote:
> From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
> Instead of a per-arch word within struct page, use a formerly reserved
> word.  This word is shared with page->mapping, so it must be cleared
> before being freed as it is checked in free_pages().
>
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>

Thanks for your patch!

> --- a/include/linux/mm_types.h
> +++ b/include/linux/mm_types.h
> @@ -149,11 +149,8 @@ struct page {
>                                         pgtable_t pmd_huge_pte;
>                                 };
>                         };
> -                       unsigned long _pt_pad_2;        /* mapping */
> -                       union {
> -                               struct mm_struct *pt_mm; /* x86 pgds only */
> -                               atomic_t pt_frag_refcount; /* powerpc */
> -                       };
> +                       struct mm_struct *pt_mm;
> +                       atomic_t pt_frag_refcount; /* powerpc */

So here is now an implicit hole on 64-bit platforms, right?
Do we have any where alignof(long) != 8?

>  #if ALLOC_SPLIT_PTLOCKS
>                         spinlock_t *ptl;
>  #else

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
