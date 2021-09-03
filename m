Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67B49C433F5
	for <linux-m68k@archiver.kernel.org>; Fri,  3 Sep 2021 14:14:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3AD2C61058
	for <linux-m68k@archiver.kernel.org>; Fri,  3 Sep 2021 14:14:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243495AbhICOP3 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 3 Sep 2021 10:15:29 -0400
Received: from mail-vs1-f51.google.com ([209.85.217.51]:38661 "EHLO
        mail-vs1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235544AbhICOP2 (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Fri, 3 Sep 2021 10:15:28 -0400
Received: by mail-vs1-f51.google.com with SMTP id a25so4465095vso.5
        for <linux-m68k@vger.kernel.org>; Fri, 03 Sep 2021 07:14:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UFJrqCkwEFWmoWQF1ApmVh5dqXjUuusu9uonayiZtz0=;
        b=BsZJtIsObp7D0/DoBm1R6BYNa46ZpmCOu2dzZa8U8zziBrs45a1aa6OJRV/j5Gvg6h
         IbXvU5N0r0+lKN6a01MdSfV1Y2LdEOS1wmM+MgSgbjKJQG3VBEulGR5VJ8sURRXPo0lM
         TlycIatiLliJuRKHJo/oyqr27ol08h20UbRniwipYURetktqB/VjCSZdHsvTudrLWv3E
         xaPcNXaHHboh56CS28t7dPzAkUcnRlXzKIthJcSHQS5WoF1FaZLWe6m4kdM6q4g2uN4A
         pRXaV4aE4/Lu4pFhbznhDJebsqvLhmwmKJpjORYshI7jl/pE4HOsMdbA+2kVQvITKR4y
         jqow==
X-Gm-Message-State: AOAM533f2n9PYb6pWxp9dzM8474a2JT2HW7zsDrP6JXq3oPtzslUb0FZ
        jfVyvuR/BM+zMOc9qfYWFv0QvSq8fhtZs/3FHtg=
X-Google-Smtp-Source: ABdhPJy+x5u9Cg+2Kwk/lEgSQXTXW5xoRNvam3wIYzTvKhgYAiLAEcJDdDzrPsZI6Z9gw2dRV2WQ/YpQBxKhT3BRwTQ=
X-Received: by 2002:a67:cb0a:: with SMTP id b10mr2858173vsl.9.1630678467150;
 Fri, 03 Sep 2021 07:14:27 -0700 (PDT)
MIME-Version: 1.0
References: <1630206710-5954-1-git-send-email-schmitzmic@gmail.com>
 <1630206710-5954-2-git-send-email-schmitzmic@gmail.com> <CAMuHMdV5hWcg=pPZ7=E5QEi5OqM=X4JsqymsL-vHWjMjDvyWQQ@mail.gmail.com>
 <6843c140-7f58-8510-30f2-201d824601df@gmail.com>
In-Reply-To: <6843c140-7f58-8510-30f2-201d824601df@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 3 Sep 2021 16:14:15 +0200
Message-ID: <CAMuHMdUwSMDgQ8Vk9JV4kngJ52Vz1X8fXiTPLow_9sE9OX2tLg@mail.gmail.com>
Subject: Re: [PATCH v7 1/4] m68k: Kconfig - select core PCMCIA support module
 for Amiga PCMCIA
To:     Michael Schmitz <schmitzmic@gmail.com>
Cc:     "Linux/m68k" <linux-m68k@vger.kernel.org>,
        ALeX Kazik <alex@kazik.de>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Michael,

On Fri, Sep 3, 2021 at 4:52 AM Michael Schmitz <schmitzmic@gmail.com> wrote:
> On 03/09/21 00:42, Geert Uytterhoeven wrote:
> > On Sun, Aug 29, 2021 at 5:12 AM Michael Schmitz<schmitzmic@gmail.com>  wrote:
> >> The 16 bit card support test for the apne.c driver needs a whole
> >> lot of hairy parser code which is already present in the core
> >> PCMCIA code - make use of that instead of duplicating it.
> >>
> >> Signed-off-by: Michael Schmitz<schmitzmic@gmail.com>
> > Thanks for your patch!
> >
> >> --- a/arch/m68k/Kconfig.bus
> >> +++ b/arch/m68k/Kconfig.bus
> >> @@ -31,6 +31,8 @@ config ZORRO
> >>   config AMIGA_PCMCIA
> >>          bool "Amiga 1200/600 PCMCIA support"
> > Can this become tristate?
> I suspect it can - though I wonder why it hasn't been made tristate
> before. Ah - pcmcia.c needs a little patch to add a MODULE_LICENSE clause.
> >>          depends on AMIGA
> >> +       select PCCARD
> >> +       select PCMCIA
> > This is now forcing PCCARD and PCMCIA builtin instead of modular
> > in an allmodconfig kernel.
> Thanks, that's what I'd been worried about.
>
> How do I make sure CONFIG_PCMCIA gets selected as module as well? I can
> select this when CONFIG_APNE is set, from
> drivers/net/ethernet/8390/Kconfig, but I'd then have to protect the
> cftable parse hook in amiga/pcmcia.c against the case where CONFIG_APNE
> is not selected.

That will be fixed automatically by making AMIGA_PCMCIA tristate.
Select from a modular symbol will make the target modular, too.

> Not to mention we need to rename amiga/pcmcia.c to avoid a module naming
> conflict.
>
> Just including cistpl.o as a module is not an option unfortunately - too
> many dependencies.
>
> And I don't think we need CONFIG_PCMCIA_PROBE=Y?

No idea if we need that...

-default y if ISA && !ARCH_SA1100 && !PARISC
+default y if ISA && !ARCH_SA1100 && !PARISC && !AMIGA_PCMCIA

(wondering how many platforms that can use PCMCIA are left, and if
 this can be converted into positive logic?)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
