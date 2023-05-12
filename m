Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9B1AC7EE24
	for <linux-m68k@archiver.kernel.org>; Fri, 12 May 2023 10:28:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240424AbjELK2U convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 12 May 2023 06:28:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240561AbjELK2B (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 12 May 2023 06:28:01 -0400
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71F1D14E6A
        for <linux-m68k@lists.linux-m68k.org>; Fri, 12 May 2023 03:26:58 -0700 (PDT)
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-ba6e90e9199so1464024276.0
        for <linux-m68k@lists.linux-m68k.org>; Fri, 12 May 2023 03:26:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683887188; x=1686479188;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t7oE+wnAwx9lWj1Dzx32p5gbR9ZsZdOiJLOsGIhtwMM=;
        b=fEDQR7fYclw0nCbWVCoxLjl4p75nScZDmEkHjZmf61AA5/p3Wo2+HqaRczxRNgw3yZ
         wUi1sxUmYfDFYCUHsiYat+9jL+nNPw2+3g0mPQlb/Y9c8MQVfc48v2uv7/OY6sYQpqVz
         sibXq2AYt6BI7WfYyznXlGwELZX1rP70dDcdcml9+Tb6+ax03Wuv9cxbKx4m0oaLGRfR
         nmm7iUZyesjLobZoX35CWY7+RrbXz75HdlU/HqvT4zjDOUYie3D9Uvk44AgXIh3IIVn6
         0y0n4pQNypGlKB7J0eSZEVbuYuJiVokTtibMp9JjAqKNByp+vR53LcKbP0dbbsRgOGe7
         6fsQ==
X-Gm-Message-State: AC+VfDxFWlDY79FYbsCi9JsDwH6rPvjgMgTn6UUh5s9wiFUTymO/NJf2
        bn0b7E9AtdG76PTNpYmAo6Afyh2VzeLKcw==
X-Google-Smtp-Source: ACHHUZ4QABSaOfOpYEDeJviAF3/CajFhFG6hkUINIGNe8RUkrlLdTtSHBih17j0ixC0Wx+7Kyh7pFA==
X-Received: by 2002:a25:aa51:0:b0:ba7:29ab:92ab with SMTP id s75-20020a25aa51000000b00ba729ab92abmr430526ybi.59.1683887188093;
        Fri, 12 May 2023 03:26:28 -0700 (PDT)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com. [209.85.128.174])
        by smtp.gmail.com with ESMTPSA id b4-20020a252e44000000b00ba6388faed9sm1837830ybn.9.2023.05.12.03.26.26
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 May 2023 03:26:26 -0700 (PDT)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-559de1d36a9so140726237b3.1
        for <linux-m68k@lists.linux-m68k.org>; Fri, 12 May 2023 03:26:26 -0700 (PDT)
X-Received: by 2002:a0d:c281:0:b0:536:cb48:9059 with SMTP id
 e123-20020a0dc281000000b00536cb489059mr25024547ywd.50.1683887185987; Fri, 12
 May 2023 03:26:25 -0700 (PDT)
MIME-Version: 1.0
References: <20230503-virt-to-pfn-v6-4-rc1-v1-0-6c4698dcf9c8@linaro.org>
 <20230503-virt-to-pfn-v6-4-rc1-v1-2-6c4698dcf9c8@linaro.org> <CAMuHMdVJjjo9TMeow1-i27ybpQOu9-VZYnTkY5p8p_Cm6sW_GA@mail.gmail.com>
In-Reply-To: <CAMuHMdVJjjo9TMeow1-i27ybpQOu9-VZYnTkY5p8p_Cm6sW_GA@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 12 May 2023 12:26:14 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV5Aukxx+XyC-s2=CDa2BYqvc3uRvWBhD6ri5j09tXj3A@mail.gmail.com>
Message-ID: <CAMuHMdV5Aukxx+XyC-s2=CDa2BYqvc3uRvWBhD6ri5j09tXj3A@mail.gmail.com>
Subject: Re: [PATCH 02/12] m68k: Pass a pointer to virt_to_pfn() virt_to_page()
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Vineet Gupta <vgupta@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Russell King <linux@armlinux.org.uk>,
        Greg Ungerer <gerg@linux-m68k.org>,
        linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
        linux-snps-arc@lists.infradead.org, linux-fsdevel@vger.kernel.org,
        linux-cifs@vger.kernel.org, samba-technical@lists.samba.org,
        linux-arm-kernel@lists.infradead.org, linux-arch@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Fri, May 12, 2023 at 11:55 AM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> On Thu, May 11, 2023 at 1:59 PM Linus Walleij <linus.walleij@linaro.org> wrote:
> > Functions that work on a pointer to virtual memory such as
> > virt_to_pfn() and users of that function such as
> > virt_to_page() are supposed to pass a pointer to virtual
> > memory, ideally a (void *) or other pointer. However since
> > many architectures implement virt_to_pfn() as a macro,
> > this function becomes polymorphic and accepts both a
> > (unsigned long) and a (void *).
> >
> > Fix up the offending calls in arch/m68k with explicit casts.
> >
> > Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> > ---
> > ChangeLog v1->v2:
> > - Add an extra parens around the page argument to the
> >   PD_PTABLE() macro, as is normally required.
>
> Thanks for the update!
>
> To build sun3_defconfig and m5475evb_defconfig cleanly, you need to
> include the (Gmail-whitespace-damaged) changes below.
> These were compile-tested only.

> --- a/arch/m68k/include/asm/sun3_pgtable.h
> +++ b/arch/m68k/include/asm/sun3_pgtable.h
> @@ -109,9 +109,9 @@ static inline void pte_clear (struct mm_struct
> *mm, unsigned long addr, pte_t *p
>  #define pfn_pte(pfn, pgprot) \
>  ({ pte_t __pte; pte_val(__pte) = pfn | pgprot_val(pgprot); __pte; })
>
> -#define pte_page(pte)          virt_to_page(__pte_page(pte))
> +#define pte_page(pte)          virt_to_page((void *)__pte_page(pte))

Much simpler to drop the cast in __pte_page() instead:

@@ -91,7 +91,7 @@ static inline pte_t pte_modify(pte_t pte, pgprot_t newprot)
 #define pmd_set(pmdp,ptep) do {} while (0)

 #define __pte_page(pte) \
-((unsigned long) __va ((pte_val (pte) & SUN3_PAGE_PGNUM_MASK) << PAGE_SHIFT))
+        (__va ((pte_val (pte) & SUN3_PAGE_PGNUM_MASK) << PAGE_SHIFT))

 static inline unsigned long pmd_page_vaddr(pmd_t pmd)
 {

>  #define pmd_pfn(pmd)           (pmd_val(pmd) >> PAGE_SHIFT)
> -#define pmd_page(pmd)          virt_to_page(pmd_page_vaddr(pmd))
> +#define pmd_page(pmd)          virt_to_page((void *)pmd_page_vaddr(pmd))

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
