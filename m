Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78D05C6FA8E
	for <linux-m68k@archiver.kernel.org>; Sun,  5 Mar 2023 16:49:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229622AbjCEQtH convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Sun, 5 Mar 2023 11:49:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229581AbjCEQtG (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sun, 5 Mar 2023 11:49:06 -0500
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 675E8B471
        for <linux-m68k@lists.linux-m68k.org>; Sun,  5 Mar 2023 08:49:05 -0800 (PST)
Received: by mail-qt1-f182.google.com with SMTP id l18so8303769qtp.1
        for <linux-m68k@lists.linux-m68k.org>; Sun, 05 Mar 2023 08:49:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678034944;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=laWnaU7+yvIkdIWbPnbMvJLuXve3O1O7/VL48bFhhYw=;
        b=8I7yY8RzfmMIy+EBqkWiX/9iAM0nv7G3U6uBuM8uiAmXpQ2/nZn1vdOBYg7zgKHdzf
         x1LlJuLO/rNpInYRJx4XA1q9QFM18YD+CQtrG5kkEP2PmxWX8eJWywV02adZM+KPMeOi
         2h/a+JC8wsh3XibxJYfmXU+tYMT3jJH5VlKS4x2wleRVkqcInZO0Tycnc/KIY748LBfc
         1FHNO7rnZufzy6m44X7QjkLrEw5vmF/HNBaqiHhMCjm5DQ1q0AX/AX+jTZJFv2hwJ7zI
         dpjyTcITLBDHPH7T63LTXTGUP6eBTNfTTa3XtiYT+C4t0DtqqHZWC5Dp/gtHnTCVzPVN
         uC/g==
X-Gm-Message-State: AO0yUKW4jEntLSxl9YOasYOl7Bm0BTukAbpM4FqZjKy9L8EtFwljs1Z2
        FmYB5hXgheIQuSkVcIwg7j3d17Kyfy0pdw==
X-Google-Smtp-Source: AK7set8B1cn18P+CWS62UHh9Fjl29LYMw+wu3xtTuaVJSTQGVyQef90mkZ0M7IVTW2DYJXIalP/BAA==
X-Received: by 2002:ac8:5814:0:b0:3b8:6a92:c8d6 with SMTP id g20-20020ac85814000000b003b86a92c8d6mr13982692qtg.60.1678034944173;
        Sun, 05 Mar 2023 08:49:04 -0800 (PST)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com. [209.85.128.173])
        by smtp.gmail.com with ESMTPSA id h20-20020ac846d4000000b003b64f1b1f40sm5919141qto.40.2023.03.05.08.49.03
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Mar 2023 08:49:03 -0800 (PST)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-536cb25982eso140874577b3.13
        for <linux-m68k@lists.linux-m68k.org>; Sun, 05 Mar 2023 08:49:03 -0800 (PST)
X-Received: by 2002:a81:b61d:0:b0:52e:f66d:b70f with SMTP id
 u29-20020a81b61d000000b0052ef66db70fmr4814861ywh.5.1678034943362; Sun, 05 Mar
 2023 08:49:03 -0800 (PST)
MIME-Version: 1.0
References: <20230228213738.272178-1-willy@infradead.org> <20230228213738.272178-14-willy@infradead.org>
 <CAMuHMdW5TtUeZDmtHvxw+DxqUADC-OCW=tHE2Gptcoie62T+4w@mail.gmail.com> <ZAS1Lq6//oO/0PXe@casper.infradead.org>
In-Reply-To: <ZAS1Lq6//oO/0PXe@casper.infradead.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Sun, 5 Mar 2023 17:48:51 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVb+yFOZFK5_KAUpHfq6i3rbqbFqTA0Q4+xLC4v0ot7UA@mail.gmail.com>
Message-ID: <CAMuHMdVb+yFOZFK5_KAUpHfq6i3rbqbFqTA0Q4+xLC4v0ot7UA@mail.gmail.com>
Subject: Re: [PATCH v3 13/34] m68k: Implement the new page table range API
To:     Matthew Wilcox <willy@infradead.org>
Cc:     linux-mm@kvack.org, linux-arch@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Willy,

On Sun, Mar 5, 2023 at 4:28 PM Matthew Wilcox <willy@infradead.org> wrote:
> On Sun, Mar 05, 2023 at 11:16:13AM +0100, Geert Uytterhoeven wrote:
> > > +               while (nr--) {
> > > +                       __asm__ __volatile__("nop\n\t"
> > > +                                            ".chip 68040\n\t"
> > > +                                            "cpushp %%bc,(%0)\n\t"
> > > +                                            ".chip 68k"
> > > +                                            : : "a" (paddr + nr * PAGE_SIZE));
> >
> > As gcc (9.5.0) keeps on calculating "paddr + nr * PAGE_SIZE"
> > inside the loop (albeit using a shift instead of a multiplication),
> > please use "paddr" here, followed by "paddr += PAGE_SIZE;".
>
> Thanks.  So this?
>
> +++ b/arch/m68k/include/asm/cacheflush_mm.h
> @@ -235,13 +235,14 @@ static inline void __flush_pages_to_ram(void *vaddr, unsigned int nr)
>         } else if (CPU_IS_040_OR_060) {
>                 unsigned long paddr = __pa(vaddr);
>
> -               while (nr--) {
> +               do {
>                         __asm__ __volatile__("nop\n\t"
>                                              ".chip 68040\n\t"
>                                              "cpushp %%bc,(%0)\n\t"
>                                              ".chip 68k"
> -                                            : : "a" (paddr + nr * PAGE_SIZE));
> -               }
> +                                            : : "a" (paddr));
> +                       paddr += PAGE_SIZE;
> +               } while (--nr);
>         } else {
>                 unsigned long _tmp;
>                 __asm__ __volatile__("movec %%cacr,%0\n\t"

LGTM. Might be safer to keep the "while (nr--) {", just in case someone
ever passes zero.

> Also, I noticed that I broke sun3.  It puts the PFN in bits 0-n instead
> of 12-n.  New patch coming soon.

Thanks, hadn't noticed (there are no sun3-specific code changes in
this series?)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
