Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2869DC76195
	for <linux-m68k@archiver.kernel.org>; Thu, 16 Mar 2023 16:32:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230281AbjCPQcq convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 16 Mar 2023 12:32:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230298AbjCPQcn (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 16 Mar 2023 12:32:43 -0400
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3B38E4877
        for <linux-m68k@lists.linux-m68k.org>; Thu, 16 Mar 2023 09:32:34 -0700 (PDT)
Received: by mail-qt1-f175.google.com with SMTP id s12so2329086qtq.11
        for <linux-m68k@lists.linux-m68k.org>; Thu, 16 Mar 2023 09:32:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678984353;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jgcdy0Q2UM92NkuqSo6yI/I4/kIvBnyOPq4TXfCrfno=;
        b=jlPQZVf/Adqc5mKtYDC04payCsq0h/NX0NJRgUVKDI8DM/3Dmhdj2wkrbncnEB3uGg
         pvKTNreCd3MuUcYeA/gh94yYHznItJsQQZiWQqjxHM//CoPeKLaE/hTavzMVPHN6ubJZ
         eeu6YBkPQas4GF9nVEwyMHlzVdmvamdwcGe7hs3BrfSkU9HOqCR/uVKHlNyNYk9beu+u
         8xuh3W4G5tylZCko1lrTOirWVzmNzyxaNq9OXE9+ZKxRAWpIzPG29u0/6rBdTvjp7mjX
         ZG3z6A9u3saOohNByAWgYuGzl8AzM57PRx8B8OU/BQW09YF5WaTW3PN85gcK3NLzueoC
         UY/w==
X-Gm-Message-State: AO0yUKUJ5PV5imMzjbvWhBQDDarDJPPMtnyyIZ3FxRNXGaLJ/kflILyX
        CoogQ5KvwvCPjROPgrv8YWjuZCLzVJG62A==
X-Google-Smtp-Source: AK7set/SMjDg4Q1+eQ8eiMSe9Lli7eEKF1zZP7o7HxVPykBl46sTVSkNQR41GrdPGN0vqbaNoQuGMA==
X-Received: by 2002:ac8:5803:0:b0:3bf:ba58:52aa with SMTP id g3-20020ac85803000000b003bfba5852aamr6722354qtg.15.1678984353066;
        Thu, 16 Mar 2023 09:32:33 -0700 (PDT)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com. [209.85.128.179])
        by smtp.gmail.com with ESMTPSA id y5-20020ac87045000000b003bfaff2a6b9sm6059313qtm.10.2023.03.16.09.32.32
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Mar 2023 09:32:32 -0700 (PDT)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-5445009c26bso42231547b3.8
        for <linux-m68k@lists.linux-m68k.org>; Thu, 16 Mar 2023 09:32:32 -0700 (PDT)
X-Received: by 2002:a81:ae5e:0:b0:541:a17f:c779 with SMTP id
 g30-20020a81ae5e000000b00541a17fc779mr2625005ywk.4.1678984352328; Thu, 16 Mar
 2023 09:32:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230315051444.3229621-1-willy@infradead.org> <20230315051444.3229621-15-willy@infradead.org>
 <CAMuHMdULvhry_pGap0J0FLH8TMXG1smanQjUNzPoyKsWh1FZBQ@mail.gmail.com>
In-Reply-To: <CAMuHMdULvhry_pGap0J0FLH8TMXG1smanQjUNzPoyKsWh1FZBQ@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 16 Mar 2023 17:32:21 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX__7r=ZcJtTAOZeYkzc7Ls+M+n3vuSY1=_HVCf5Y_twA@mail.gmail.com>
Message-ID: <CAMuHMdX__7r=ZcJtTAOZeYkzc7Ls+M+n3vuSY1=_HVCf5Y_twA@mail.gmail.com>
Subject: Re: [PATCH v4 14/36] m68k: Implement the new page table range API
To:     "Matthew Wilcox (Oracle)" <willy@infradead.org>
Cc:     linux-arch@vger.kernel.org, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Wed, Mar 15, 2023 at 8:43 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Wed, Mar 15, 2023 at 6:14 AM Matthew Wilcox (Oracle)
> <willy@infradead.org> wrote:
> > Add PFN_PTE_SHIFT, update_mmu_cache_range(), flush_icache_pages() and
> > flush_dcache_folio().
> >
> > Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
>
> Thanks for your patch!
>
> > --- a/arch/m68k/include/asm/cacheflush_mm.h
> > +++ b/arch/m68k/include/asm/cacheflush_mm.h
> > @@ -220,24 +220,29 @@ static inline void flush_cache_page(struct vm_area_struct *vma, unsigned long vm
> >
> >  /* Push the page at kernel virtual address and clear the icache */
> >  /* RZ: use cpush %bc instead of cpush %dc, cinv %ic */
> > -static inline void __flush_page_to_ram(void *vaddr)
> > +static inline void __flush_pages_to_ram(void *vaddr, unsigned int nr)
> >  {
> >         if (CPU_IS_COLDFIRE) {
> >                 unsigned long addr, start, end;
> >                 addr = ((unsigned long) vaddr) & ~(PAGE_SIZE - 1);
> >                 start = addr & ICACHE_SET_MASK;
> > -               end = (addr + PAGE_SIZE - 1) & ICACHE_SET_MASK;
> > +               end = (addr + nr * PAGE_SIZE - 1) & ICACHE_SET_MASK;
> >                 if (start > end) {
> >                         flush_cf_bcache(0, end);
> >                         end = ICACHE_MAX_ADDR;
> >                 }
> >                 flush_cf_bcache(start, end);
> >         } else if (CPU_IS_040_OR_060) {
> > -               __asm__ __volatile__("nop\n\t"
> > -                                    ".chip 68040\n\t"
> > -                                    "cpushp %%bc,(%0)\n\t"
> > -                                    ".chip 68k"
> > -                                    : : "a" (__pa(vaddr)));
> > +               unsigned long paddr = __pa(vaddr);
> > +
> > +               do {
> > +                       __asm__ __volatile__("nop\n\t"
> > +                                            ".chip 68040\n\t"
> > +                                            "cpushp %%bc,(%0)\n\t"
> > +                                            ".chip 68k"
> > +                                            : : "a" (paddr));
> > +                       paddr += PAGE_SIZE;
> > +               } while (--nr);
>
> Please use "while (nr--) { ... }", to protect against anyone ever
> calling this with nr == 0.
>
> The rest LGTM, I'll give it a try shortly...

Still working fine on ARAnyM, so
Tested-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
