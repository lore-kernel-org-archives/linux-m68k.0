Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52A3EC433F5
	for <linux-m68k@archiver.kernel.org>; Fri, 25 Feb 2022 09:03:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238868AbiBYJDc (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 25 Feb 2022 04:03:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238889AbiBYJDa (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 25 Feb 2022 04:03:30 -0500
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4ABE98CDB5
        for <linux-m68k@lists.linux-m68k.org>; Fri, 25 Feb 2022 01:02:58 -0800 (PST)
Received: by mail-ua1-f45.google.com with SMTP id 10so2133488uar.9
        for <linux-m68k@lists.linux-m68k.org>; Fri, 25 Feb 2022 01:02:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=F2yPQQkyfifzSb4UKUP/UBnBQil6yFEzzS1VsqjkII0=;
        b=a/RYkorgtwiK03Sou9UPAxVKG9qTZPBm8GHpcowRm7HYjG2FP6IYhy+pAmPM4n93Vw
         75RrEHCixSYL6F1QDIX2hc04kxArEpK98xS+BZiTeIE84q5Cg6QIgXZRNJVTYs9TDMor
         Tln0R4HFHRQFS/JL43iHNaAACgsp5nR2YfZgFws25sRySKaT7UyiXTrNxrYal8pa3vSG
         pFuFp50A4339epZO00Zh2iMqy/FogpxFMGkruxi/i7EwvJGukytrHdfgE37PmXeE+TGF
         ShWIWqktXJ+mHHGP8ODrxCWw4QQ3YqEQyfjnVm7zDjrPRKwdWMMa9g7F1m1orKhtDlau
         4KOA==
X-Gm-Message-State: AOAM532llYACwBhDNtz4FniGmKes/bZ8x18Bq10Sc2Ya0qfbJzYkeiJn
        ilWuNufNTBoywMbtITJ14w1rYCudb6L/JQ==
X-Google-Smtp-Source: ABdhPJxDMJXrJGlH3ruR+HhkmY6AmkvaCawCeYK1wJwxjuXiCeOTDB9v93Gy4KU37meF0BQ5apVpDQ==
X-Received: by 2002:ab0:6897:0:b0:341:f244:f174 with SMTP id t23-20020ab06897000000b00341f244f174mr2934843uar.130.1645779777149;
        Fri, 25 Feb 2022 01:02:57 -0800 (PST)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com. [209.85.217.54])
        by smtp.gmail.com with ESMTPSA id q191-20020a1f43c8000000b00318a53909f0sm267299vka.6.2022.02.25.01.02.56
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Feb 2022 01:02:56 -0800 (PST)
Received: by mail-vs1-f54.google.com with SMTP id q9so4879844vsg.2
        for <linux-m68k@lists.linux-m68k.org>; Fri, 25 Feb 2022 01:02:56 -0800 (PST)
X-Received: by 2002:a67:e113:0:b0:30e:303d:d1d6 with SMTP id
 d19-20020a67e113000000b0030e303dd1d6mr2782888vsl.38.1645779776278; Fri, 25
 Feb 2022 01:02:56 -0800 (PST)
MIME-Version: 1.0
References: <1645425519-9034-1-git-send-email-anshuman.khandual@arm.com>
 <1645425519-9034-9-git-send-email-anshuman.khandual@arm.com> <CAMuHMdUrA4u5BTRuqTSn++vXFNn0w=HRmp9ZD_8SNZ1wMUKwwQ@mail.gmail.com>
In-Reply-To: <CAMuHMdUrA4u5BTRuqTSn++vXFNn0w=HRmp9ZD_8SNZ1wMUKwwQ@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 25 Feb 2022 10:02:45 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXRO5dph1m21=V3bVyniVvKfhDLbMoEHQzwPgvSesXj6A@mail.gmail.com>
Message-ID: <CAMuHMdXRO5dph1m21=V3bVyniVvKfhDLbMoEHQzwPgvSesXj6A@mail.gmail.com>
Subject: Re: [PATCH V2 08/30] m68k/mm: Enable ARCH_HAS_VM_GET_PAGE_PROT
To:     Anshuman Khandual <anshuman.khandual@arm.com>,
        Andrew Morton <akpm@linux-foundation.org>
Cc:     Linux MM <linux-mm@kvack.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Christoph Hellwig <hch@infradead.org>,
        Linux-Arch <linux-arch@vger.kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Anshuman, Andrew,

On Mon, Feb 21, 2022 at 12:54 PM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> On Mon, Feb 21, 2022 at 9:45 AM Anshuman Khandual
> <anshuman.khandual@arm.com> wrote:
> > This defines and exports a platform specific custom vm_get_page_prot() via
> > subscribing ARCH_HAS_VM_GET_PAGE_PROT. Subsequently all __SXXX and __PXXX
> > macros can be dropped which are no longer needed.
> >
> > Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> > Cc: linux-m68k@lists.linux-m68k.org
> > Cc: linux-kernel@vger.kernel.org
> > Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
>
> Thanks for your patch!
>
> > --- a/arch/m68k/mm/init.c
> > +++ b/arch/m68k/mm/init.c
> > @@ -128,3 +128,107 @@ void __init mem_init(void)
> >         memblock_free_all();
> >         init_pointer_tables();
> >  }
> > +
> > +#ifdef CONFIG_COLDFIRE
> > +/*
> > + * Page protections for initialising protection_map. See mm/mmap.c
> > + * for use. In general, the bit positions are xwr, and P-items are
> > + * private, the S-items are shared.
> > + */
> > +pgprot_t vm_get_page_prot(unsigned long vm_flags)
>
> Wouldn't it make more sense to add this to arch/m68k/mm/mcfmmu.c?

It's not just about sense, but also about correctness.
The CF_PAGE_* definitions below exist only if CONFIG_MMU=y,
thus causing breakage for cfnommu in today's linux-next.
http://kisskb.ellerman.id.au/kisskb/buildresult/14701640/

>
> > +{
> > +       switch (vm_flags & (VM_READ | VM_WRITE | VM_EXEC | VM_SHARED)) {
> > +       case VM_NONE:
> > +               return PAGE_NONE;
> > +       case VM_READ:
> > +               return __pgprot(CF_PAGE_VALID | CF_PAGE_ACCESSED |
> > +                               CF_PAGE_READABLE);

> > +               BUILD_BUG();
> > +       }
> > +}
> > +#endif
> > +EXPORT_SYMBOL(vm_get_page_prot);

Having this outside the #ifdef means we now get ...

> > --- a/arch/m68k/mm/motorola.c
> > +++ b/arch/m68k/mm/motorola.c

> > +}
> > +EXPORT_SYMBOL(vm_get_page_prot);

... two of them in normal m68k builds.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
