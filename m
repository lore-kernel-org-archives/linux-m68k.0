Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A09DFEB64DB
	for <linux-m68k@archiver.kernel.org>; Wed, 14 Jun 2023 09:30:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244061AbjFNJao convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 14 Jun 2023 05:30:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244039AbjFNJaU (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 14 Jun 2023 05:30:20 -0400
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 092501FE2
        for <linux-m68k@lists.linux-m68k.org>; Wed, 14 Jun 2023 02:30:19 -0700 (PDT)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-56d4f50427cso5150247b3.3
        for <linux-m68k@lists.linux-m68k.org>; Wed, 14 Jun 2023 02:30:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686735018; x=1689327018;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sUg4qrNPX3u1L7teHyX+L+B+2nv6pGpY1jj7jQmio6E=;
        b=hqWYJlRss7nHM9JuQsBqi4Gaf4PmL/i8wccNtdYOPap4V3opgKYBPpebCb7aET19xq
         DpE8jqV+B5EPfQQEuxYDXPQaUn7O/8S/CRrjzaPRYpSUOOfBn+AUewRhaaSqlHFdV2If
         BS75mZydxy3Mb/TUHCLeK6G95EqIKr2UKdWDufjG2YPVUg1u/BlhJdn8MZODEmZABgl1
         oLxzTbejPktjdRPDlu29So7k8VA/i98jG5qoP6lFniNuRbtc/IEs93onx8VnmvXgQr4y
         5+cyWu04gBkkXSsBa1L/Mpb2sIqJLGfx4e4ZtztAb9gprTgVMEttvNVRawvSiLKwuZ8X
         Nssw==
X-Gm-Message-State: AC+VfDw4dfZ9KqzeuwZqWuxA+A1VT5uXJyEd9vG0ftZ5Y5Md1RgYjfQ4
        JgogmHZtXcWoTu+tmEKBOwQEwoPn1naHfg==
X-Google-Smtp-Source: ACHHUZ6EZTxBk3+stgG86fNvb5UrmBuHiU+Si9ckwypa7/ui4d4CnryxhzuD0b2gm3h3clx8rOC93A==
X-Received: by 2002:a0d:d8c6:0:b0:55d:cf78:ed20 with SMTP id a189-20020a0dd8c6000000b0055dcf78ed20mr1153092ywe.42.1686735018086;
        Wed, 14 Jun 2023 02:30:18 -0700 (PDT)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com. [209.85.128.172])
        by smtp.gmail.com with ESMTPSA id j133-20020a816e8b000000b005659a869a64sm1902553ywc.43.2023.06.14.02.30.17
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jun 2023 02:30:17 -0700 (PDT)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-57001c0baddso5177107b3.2
        for <linux-m68k@lists.linux-m68k.org>; Wed, 14 Jun 2023 02:30:17 -0700 (PDT)
X-Received: by 2002:a25:6b47:0:b0:ba8:2009:ccbb with SMTP id
 o7-20020a256b47000000b00ba82009ccbbmr1338474ybm.46.1686735017346; Wed, 14 Jun
 2023 02:30:17 -0700 (PDT)
MIME-Version: 1.0
References: <20230612210423.18611-1-vishal.moola@gmail.com>
 <20230612210423.18611-28-vishal.moola@gmail.com> <e52c7a74-da68-08d2-54e2-f95a8c5b52e7@kernel.org>
In-Reply-To: <e52c7a74-da68-08d2-54e2-f95a8c5b52e7@kernel.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 14 Jun 2023 11:30:05 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXPASfLM8St_JZOW3Wke+ickJoo1oDr+orRbTERy=Zgwg@mail.gmail.com>
Message-ID: <CAMuHMdXPASfLM8St_JZOW3Wke+ickJoo1oDr+orRbTERy=Zgwg@mail.gmail.com>
Subject: Re: [PATCH v4 27/34] nios2: Convert __pte_free_tlb() to use ptdescs
To:     Dinh Nguyen <dinguyen@kernel.org>
Cc:     "Vishal Moola (Oracle)" <vishal.moola@gmail.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org,
        linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
        loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
        linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
        linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
        sparclinux@vger.kernel.org, linux-um@lists.infradead.org,
        xen-devel@lists.xenproject.org, kvm@vger.kernel.org,
        Hugh Dickins <hughd@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Dinh,

On Wed, Jun 14, 2023 at 12:17 AM Dinh Nguyen <dinguyen@kernel.org> wrote:
> On 6/12/23 16:04, Vishal Moola (Oracle) wrote:
> > Part of the conversions to replace pgtable constructor/destructors with
> > ptdesc equivalents.
> >
> > Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
> > ---
> >   arch/nios2/include/asm/pgalloc.h | 8 ++++----
> >   1 file changed, 4 insertions(+), 4 deletions(-)
> >
> > diff --git a/arch/nios2/include/asm/pgalloc.h b/arch/nios2/include/asm/pgalloc.h
> > index ecd1657bb2ce..ce6bb8e74271 100644
> > --- a/arch/nios2/include/asm/pgalloc.h
> > +++ b/arch/nios2/include/asm/pgalloc.h
> > @@ -28,10 +28,10 @@ static inline void pmd_populate(struct mm_struct *mm, pmd_t *pmd,
> >
> >   extern pgd_t *pgd_alloc(struct mm_struct *mm);
> >
> > -#define __pte_free_tlb(tlb, pte, addr)                               \
> > -     do {                                                    \
> > -             pgtable_pte_page_dtor(pte);                     \
> > -             tlb_remove_page((tlb), (pte));                  \
> > +#define __pte_free_tlb(tlb, pte, addr)                                       \
> > +     do {                                                            \
> > +             pagetable_pte_dtor(page_ptdesc(pte));                   \
> > +             tlb_remove_page_ptdesc((tlb), (page_ptdesc(pte)));      \
> >       } while (0)
> >
> >   #endif /* _ASM_NIOS2_PGALLOC_H */
>
> Applied!

I don't think you can just apply this patch, as the new functions
were only introduced in [PATCH v4 05/34] of this series.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
