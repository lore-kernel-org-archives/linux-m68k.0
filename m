Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A56A6C2B9F4
	for <linux-m68k@archiver.kernel.org>; Fri, 25 Jun 2021 07:31:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 80ABA6141E
	for <linux-m68k@archiver.kernel.org>; Fri, 25 Jun 2021 07:31:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229764AbhFYHd7 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 25 Jun 2021 03:33:59 -0400
Received: from mail-vk1-f180.google.com ([209.85.221.180]:36515 "EHLO
        mail-vk1-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229616AbhFYHd6 (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Fri, 25 Jun 2021 03:33:58 -0400
Received: by mail-vk1-f180.google.com with SMTP id c17so1892461vke.3
        for <linux-m68k@vger.kernel.org>; Fri, 25 Jun 2021 00:31:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=R0Gg6JHEF4hnRdpG2OoC677oqIVFs57WAZV9zpZY39A=;
        b=Mg9j4FUoVhUxNncNTXLz/eFr6SLRft2Pii0m9mn3WWGa6ycOuWrVaM+zNeVzZiCFW5
         utSDzCSLP80RPTGfV7LNWEAlTj9lAmWOH2sq2WTH+kUVVtJ9PKrPqt6aQNU8t+g+x/1S
         VCBwB6CjHLLglZXGicakMj/otsCa+0+Q9TX5EmzINDe1cELF29PmJgvlJ2f83vcsYsZ2
         dM6o/0Ia6Ji+MdOanu4liBlY2CkkfSxDAVnMSVT6cfphXlD9z2MMbMISeJiCNFvWYQs/
         QPeufDcdQ98QUCE/cmLwXGjXeBEOWuS/Nhzp2Jbuhx2PuDdzOheWR0ZcnkrJ/MeumkLh
         6pMw==
X-Gm-Message-State: AOAM530MV38QelZNjzsWob88kdVVoHDjMK6d0JhwIhqR+BBHa/+SuhS1
        o9B7t6pzA+dGl2EQq+5yDii9yVIP0BuVAYGCBtdAafB7qGUV2g==
X-Google-Smtp-Source: ABdhPJxY1wz7MxWjPVJmULjs+WbZCEd3NdkcXYHfnS7hZC/7DxiL17gDXAGjDcyY1UY3AbSJ3+I5oDNokgbNdkH1Gow=
X-Received: by 2002:a1f:9505:: with SMTP id x5mr6545921vkd.6.1624606297683;
 Fri, 25 Jun 2021 00:31:37 -0700 (PDT)
MIME-Version: 1.0
References: <1623908361-29837-1-git-send-email-schmitzmic@gmail.com>
 <1623908361-29837-2-git-send-email-schmitzmic@gmail.com> <CAMuHMdX-JBTAWDvFQg7nVGwwxu8o6sX1GYVF0ha6JpZxOxuG8g@mail.gmail.com>
 <78dee109-3714-073c-110b-3d023f66f815@gmail.com>
In-Reply-To: <78dee109-3714-073c-110b-3d023f66f815@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 25 Jun 2021 09:31:26 +0200
Message-ID: <CAMuHMdVtyTyC0L-LZPZCdNsaaxqcVLXky4dsd3m8uyyLUm9drg@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] m68k: add kernel seccomp support
To:     Michael Schmitz <schmitzmic@gmail.com>
Cc:     "Linux/m68k" <linux-m68k@vger.kernel.org>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        Andreas Schwab <schwab@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Michael,

On Thu, Jun 24, 2021 at 11:20 PM Michael Schmitz <schmitzmic@gmail.com> wrote:
> On 23/06/21 7:35 pm, Geert Uytterhoeven wrote:
> > BTW, there was also "[PATCH] [WIP] selftests/seccomp: Add m68k support"
> > https://lore.kernel.org/linux-m68k/alpine.DEB.2.21.2008261315050.25325@ramsan.of.borg/
> >
> > I kept on up-porting it, but haven't exercised it recently.
>
> See attached for test results on my ARAnyM image (Laurent's qemu image,
> essentially).
>
> Is that any different from what you got in your earlier tests?

Fortunately lore has a better memory than I do ;-)

https://lore.kernel.org/linux-m68k/alpine.DEB.2.21.2008261612360.2926@ramsan.of.borg/

mine: FAILED: 35 / 86 tests passed
yours: FAILED: 35 / 87 tests passed

So one new test, and it fails?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
