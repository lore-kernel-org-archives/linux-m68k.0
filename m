Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59B00C636CC
	for <linux-m68k@archiver.kernel.org>; Thu, 16 Feb 2023 07:57:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229718AbjBPH5F (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 16 Feb 2023 02:57:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229760AbjBPH45 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 16 Feb 2023 02:56:57 -0500
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB89E42BE2
        for <linux-m68k@lists.linux-m68k.org>; Wed, 15 Feb 2023 23:56:24 -0800 (PST)
Received: by mail-qt1-f178.google.com with SMTP id h24so1275547qta.12
        for <linux-m68k@lists.linux-m68k.org>; Wed, 15 Feb 2023 23:56:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VhDO2MK0kPOmCAUzaTEIi3IbK3jHyOtFPMZslsdD/VM=;
        b=5IreMo5AsK+FjPGtH0a/ktKIVEcs6FKPjUptyFaFF5lSNIe+esJLX1qcd1uJtvOx7y
         9UsbUr+/0VsHTZZrkGpy0qKK8f1OZKFOabwIl8EqvvRLEEJKcbAVc6EkamHwxU7yaD68
         mP1zM8irqulR4TmdU8qTiZ8O+31cGomdARmByBLw8tP+Ys23oGnOr1jnWQqzz7OR2Kk6
         necbore+kkhpB/Vh7aNEW9aVgJk6yRwB8eDm9vTGhh/nna4r4CHkviXnDsiT8t2NzWAD
         7zTLbeYEyxGE457tmkHdp59KBwapRBi/mIQVU3qOHXEMQA26+vHv50RPMXjTDoaAluT/
         w3FA==
X-Gm-Message-State: AO0yUKXaiyoP+uC5Mde81P4tTulZLsS/qpLDng3VxAr6X7T8z9ZirDXk
        aCW6WMXbk1yF6waJeOuReUv5NxM/PFVErQ==
X-Google-Smtp-Source: AK7set9u+Bb2dRA2nqkaa2NJVv6OEJSpsD3UTrGtplzC2aL+n9KLQ7b4tOuhk7cx3hDivNTM1+YZcA==
X-Received: by 2002:ac8:5b0e:0:b0:3b8:26a7:d608 with SMTP id m14-20020ac85b0e000000b003b826a7d608mr8933398qtw.19.1676534139621;
        Wed, 15 Feb 2023 23:55:39 -0800 (PST)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com. [209.85.128.182])
        by smtp.gmail.com with ESMTPSA id 5-20020a05620a048500b00706c1f7a608sm699848qkr.89.2023.02.15.23.55.39
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Feb 2023 23:55:39 -0800 (PST)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-4c24993965eso13467407b3.12
        for <linux-m68k@lists.linux-m68k.org>; Wed, 15 Feb 2023 23:55:39 -0800 (PST)
X-Received: by 2002:a81:73c4:0:b0:52e:ec16:6f19 with SMTP id
 o187-20020a8173c4000000b0052eec166f19mr791610ywc.33.1676534138884; Wed, 15
 Feb 2023 23:55:38 -0800 (PST)
MIME-Version: 1.0
References: <20230215000446.1655635-1-willy@infradead.org> <20230215200920.1849567-1-willy@infradead.org>
 <20230215200920.1849567-2-willy@infradead.org> <84c923f7-c60b-068d-bb06-48aea1412f53@gmail.com>
 <Y+2wdSxVgS6HmFRy@casper.infradead.org>
In-Reply-To: <Y+2wdSxVgS6HmFRy@casper.infradead.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 16 Feb 2023 08:55:27 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUtjetsA8_cZAmyTR07CD5SbyV8aSymjd4wL5+TgW2Jgg@mail.gmail.com>
Message-ID: <CAMuHMdUtjetsA8_cZAmyTR07CD5SbyV8aSymjd4wL5+TgW2Jgg@mail.gmail.com>
Subject: Re: [PATCH 15/17] m68k: Implement the new page table range API
To:     Matthew Wilcox <willy@infradead.org>
Cc:     Michael Schmitz <schmitzmic@gmail.com>, linux-mm@kvack.org,
        linux-m68k@lists.linux-m68k.org, linux-arch@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Matthew,

On Thu, Feb 16, 2023 at 5:26 AM Matthew Wilcox <willy@infradead.org> wrote:
> On Thu, Feb 16, 2023 at 01:59:44PM +1300, Michael Schmitz wrote:
> > On 16/02/23 09:09, Matthew Wilcox (Oracle) wrote:
> > > Add set_ptes(), update_mmu_cache_range(), flush_icache_pages() and
> > > flush_dcache_folio().  I'm not entirely certain that the 040/060 case
> > > in __flush_pages_to_ram() is correct.
> >
> > I'm pretty sure you need to iterate to hit each of the pages - the code as
> > is will only push cache entries for the first page.
> >
> > Quoting the 040 UM:
> >
> > "Both instructions [cinv, cpush] allow operation on a single cache line, all
> > cache lines in a specific page, or an entire cache, and can select one or
> > both caches for the operation. For line and page operations, a physical
> > address in an address register specifies the memory address."
>
> I actually found that!  What I didn't find was how to tell if this
> cpush insn is the one which is operating on a single cache line,
> a single page, or the entire cache.

cpushl (line), cpushp (page), cpusha (all).
Same for cinv.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
