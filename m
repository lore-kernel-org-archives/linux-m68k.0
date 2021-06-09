Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D80D4C47095
	for <linux-m68k@archiver.kernel.org>; Wed,  9 Jun 2021 06:31:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B521D61040
	for <linux-m68k@archiver.kernel.org>; Wed,  9 Jun 2021 06:31:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236167AbhFIGdO (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 9 Jun 2021 02:33:14 -0400
Received: from mail-vs1-f45.google.com ([209.85.217.45]:35751 "EHLO
        mail-vs1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235954AbhFIGdN (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 9 Jun 2021 02:33:13 -0400
Received: by mail-vs1-f45.google.com with SMTP id j15so12284548vsf.2
        for <linux-m68k@lists.linux-m68k.org>; Tue, 08 Jun 2021 23:31:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AXXJVR5Kvh9DfRAdNlNbcwWy6ZK6zdovOov80Vu519Q=;
        b=JkWCkiHml2XE82NRCFr6KTn6ELSfbUzG8iZINyRTYax7qLDsRxYhTsxS+eJMMablSp
         yXik9kZbBikw51LxX1Z4S6sb75bgJLVL51ov2+quKgPeugtuqf06Yr3NuLILzs65Eo8K
         oZcsMVKq62vHzQv+P3oZU7WBKkReOHRIDVfxp4Vd7++3Q0NPSLIlqsI74K3O4bG3eiCl
         xQhegkqM3iVbgsgMfTiqAjq8JN2GoxVYmUsQlytSuyuU/WhAHTmKqLILgqPA6Y6B5Bir
         qdCIVQQ3KNiYnr0dcSi7f6FF/Kmlo+ztYdFhqxWPImdbw7WpXB1Y5yjvGWzPZk5HIyIE
         nwGw==
X-Gm-Message-State: AOAM531pwF4gv/PsmeFdVddH6ngYIwMG0QTzuvsrpGFQPBewdLcHBcig
        7vkiWcbz/aUhCpy/4dgSPFRkVT5HUdEArt9/cbw=
X-Google-Smtp-Source: ABdhPJytskfX8RUZ+4NhknMctxOwBSUBELeh6tvFA09PULcHxmJwYO2ANDAZkYVxZDa/Or7kb9nCfGg8yyfm0oSnUI0=
X-Received: by 2002:a67:3c2:: with SMTP id 185mr3441670vsd.42.1623220266397;
 Tue, 08 Jun 2021 23:31:06 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1623131194.git.fthain@linux-m68k.org> <e781c54ae2c837c3c15b2505c5cde19b8b340a59.1623131194.git.fthain@linux-m68k.org>
In-Reply-To: <e781c54ae2c837c3c15b2505c5cde19b8b340a59.1623131194.git.fthain@linux-m68k.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 9 Jun 2021 08:30:55 +0200
Message-ID: <CAMuHMdVXPfV20TQgpczGVGELFQ4gcqhgX=K=Hb1k-7Ph6j4jZg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] m68k/q40: Replace q40ide driver with pata_falcon
 and falconide
To:     Finn Thain <fthain@linux-m68k.org>
Cc:     Jens Axboe <axboe@kernel.dk>,
        "David S. Miller" <davem@davemloft.net>,
        Michael Schmitz <schmitzmic@gmail.com>,
        Richard Zidlicky <rz@linux-m68k.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-ide@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Tue, Jun 8, 2021 at 8:04 AM Finn Thain <fthain@linux-m68k.org> wrote:
> This allows m68k q40 systems to switch from the deprecated IDE subsystem
> to libata.
>
> Enhance the byte-swapping falconide and pata_falcon platform drivers to
> accept an irq resource, for use on q40. Atari ST-DMA IRQ arrangements seem
> to co-exist with q40 IRQ arrangements without too much mess.
>
> The new IO resources were added solely for the purpose of making
> request_region() reservations identical to those made by q40ide: these
> regions aren't used for actual IO.
>
> Cc: Michael Schmitz <schmitzmic@gmail.com>
> Cc: Richard Zidlicky <rz@linux-m68k.org>
> Reviewed-and-tested-by: Michael Schmitz <schmitzmic@gmail.com>
> Signed-off-by: Finn Thain <fthain@linux-m68k.org>

Thanks for your patch!

>  arch/m68k/atari/config.c          |  12 +--
>  arch/m68k/configs/multi_defconfig |   1 -
>  arch/m68k/configs/q40_defconfig   |   2 +-
>  arch/m68k/q40/config.c            |  37 +++++--
>  drivers/ata/Kconfig               |   6 +-
>  drivers/ata/pata_falcon.c         |  62 ++++++++---
>  drivers/ide/Kconfig               |  18 +---
>  drivers/ide/Makefile              |   1 -
>  drivers/ide/falconide.c           |  75 ++++++++-----
>  drivers/ide/q40ide.c              | 168 ------------------------------
>  10 files changed, 137 insertions(+), 245 deletions(-)
>  delete mode 100644 drivers/ide/q40ide.c

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
