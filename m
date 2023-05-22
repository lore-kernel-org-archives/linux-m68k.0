Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECCBCC77B73
	for <linux-m68k@archiver.kernel.org>; Mon, 22 May 2023 10:11:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229890AbjEVKLn convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 22 May 2023 06:11:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229719AbjEVKLm (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 22 May 2023 06:11:42 -0400
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3534EB7
        for <linux-m68k@lists.linux-m68k.org>; Mon, 22 May 2023 03:11:41 -0700 (PDT)
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-babb985f9c8so4130493276.1
        for <linux-m68k@lists.linux-m68k.org>; Mon, 22 May 2023 03:11:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684750300; x=1687342300;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CQATq2c9SwOWOfQ7A10Go9afc2yqePz2ONTwzgTVwBU=;
        b=k+dSawS6MKRiabMdnDG1bznBG57g9pDwN/I5rMrKmHpACxqEM/46yCOr8QKf18pE49
         Mz6jDpPZSHs8er74Ifpb/19CHU8ob+nCMHutEtLobrWnTW0SaOFFwl3i2O2uLcYlM630
         WD3xCpO4J8736sgE/V6qwc5/G9HSfuk2jE6U6g0Gaulwdo5QU68qxwpIx4D9gQgXrUpq
         a5i7vxg4XqtcKF/XaSWWasttNLasNSteWRbvLQQAaYlYUXt6hR9pLK50tqngR7jRUJn8
         k7HJB8hww+1YwMY/4QoyKkqZVEIZWFMaRY9V7PJd21o9ibJOjboQFqR6p3wTH8ssIsHM
         vB1Q==
X-Gm-Message-State: AC+VfDwtiVVYJRDPuLb1DBdU/3PwE3s1X45Z/6IdF6OTfAWZq6P/j84K
        HRY7IAmgclzGfbuLQ8n+ia7GrqS/IWUdUQ==
X-Google-Smtp-Source: ACHHUZ49cZ+Z5h4r9keoiQZl9l40UL6gfM8xD+6IlGLLwQJx/qG7mxodn97LyYlmoLvemQ9wiZQJfg==
X-Received: by 2002:a0d:eb44:0:b0:561:d1b0:3f7e with SMTP id u65-20020a0deb44000000b00561d1b03f7emr10299910ywe.44.1684750299637;
        Mon, 22 May 2023 03:11:39 -0700 (PDT)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com. [209.85.128.170])
        by smtp.gmail.com with ESMTPSA id x21-20020a0dd515000000b00561608bc0dfsm1959305ywd.56.2023.05.22.03.11.38
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 May 2023 03:11:39 -0700 (PDT)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-561f23dc55aso58412067b3.3
        for <linux-m68k@lists.linux-m68k.org>; Mon, 22 May 2023 03:11:38 -0700 (PDT)
X-Received: by 2002:a81:5247:0:b0:561:c5c3:9d79 with SMTP id
 g68-20020a815247000000b00561c5c39d79mr9161977ywb.45.1684750298756; Mon, 22
 May 2023 03:11:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230503-virt-to-pfn-v6-4-rc1-v2-0-0948d38bddab@linaro.org> <20230503-virt-to-pfn-v6-4-rc1-v2-2-0948d38bddab@linaro.org>
In-Reply-To: <20230503-virt-to-pfn-v6-4-rc1-v2-2-0948d38bddab@linaro.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 22 May 2023 12:11:27 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXB1fK_G=QZ59qkJWXhb61TyLRMwH3qo_0sSmW0Cfv8hA@mail.gmail.com>
Message-ID: <CAMuHMdXB1fK_G=QZ59qkJWXhb61TyLRMwH3qo_0sSmW0Cfv8hA@mail.gmail.com>
Subject: Re: [PATCH v2 02/12] m68k: Pass a pointer to virt_to_pfn() virt_to_page()
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Vineet Gupta <vgupta@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Russell King <linux@armlinux.org.uk>,
        Greg Ungerer <gerg@linux-m68k.org>, linux-mm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
        linux-snps-arc@lists.infradead.org, linux-fsdevel@vger.kernel.org,
        linux-cifs@vger.kernel.org, samba-technical@lists.samba.org,
        linux-arm-kernel@lists.infradead.org, linux-arch@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Linus,

On Mon, May 22, 2023 at 9:00 AM Linus Walleij <linus.walleij@linaro.org> wrote:
> Functions that work on a pointer to virtual memory such as
> virt_to_pfn() and users of that function such as
> virt_to_page() are supposed to pass a pointer to virtual
> memory, ideally a (void *) or other pointer. However since
> many architectures implement virt_to_pfn() as a macro,
> this function becomes polymorphic and accepts both a
> (unsigned long) and a (void *).
>
> Fix up the offending calls in arch/m68k with explicit casts.
>
> The page table include <asm/pgtable.h> will include different
> variants of the defines depending on whether you build for
> classic m68k, ColdFire or Sun3, so fix all variants.
>
> Tested-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Thanks for the update!

> ---
> ChangeLog v2->v3:

v3?

> - Fix the sun3 pgtable macro to not cast to unsigned long.
> - Make a similar change to the ColdFire include.

The ColdFire change is not correct, cfr. below...

> ChangeLog v1->v2:
> - Add an extra parens around the page argument to the
>   PD_PTABLE() macro, as is normally required.
> ---
>  arch/m68k/include/asm/mcf_pgtable.h  | 4 ++--
>  arch/m68k/include/asm/sun3_pgtable.h | 4 ++--
>  arch/m68k/mm/mcfmmu.c                | 3 ++-
>  arch/m68k/mm/motorola.c              | 4 ++--
>  arch/m68k/mm/sun3mmu.c               | 2 +-
>  arch/m68k/sun3/dvma.c                | 2 +-
>  arch/m68k/sun3x/dvma.c               | 2 +-
>  7 files changed, 11 insertions(+), 10 deletions(-)
>
> diff --git a/arch/m68k/include/asm/mcf_pgtable.h b/arch/m68k/include/asm/mcf_pgtable.h
> index d97fbb812f63..f67c59336ab4 100644
> --- a/arch/m68k/include/asm/mcf_pgtable.h
> +++ b/arch/m68k/include/asm/mcf_pgtable.h
> @@ -115,8 +115,8 @@ static inline void pgd_set(pgd_t *pgdp, pmd_t *pmdp)
>         pgd_val(*pgdp) = virt_to_phys(pmdp);
>  }
>
> -#define __pte_page(pte)        ((unsigned long) (pte_val(pte) & PAGE_MASK))
> -#define pmd_page_vaddr(pmd)    ((unsigned long) (pmd_val(pmd)))
> +#define __pte_page(pte)        (__va (pte_val(pte) & PAGE_MASK))

I guess "__va(...)" should be "(void *)..." instead?

However, that will cause an issue below, as

    #define pte_pagenr(pte)        ((__pte_page(pte) - PAGE_OFFSET) >>
PAGE_SHIFT)

does depend on __pte_page() returning "unsigned long".
Fortunately pte_pagenr() appears unused, so it can be removed.

So for now, it might be simpler to add the cast to the caller.


> +#define pmd_page_vaddr(pmd)    (__va (pmd_val(pmd)))

This looks bogus, too, as it should return "unsigned long".

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
