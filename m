Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF28EC47095
	for <linux-m68k@archiver.kernel.org>; Wed,  9 Jun 2021 06:27:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 99C84610A1
	for <linux-m68k@archiver.kernel.org>; Wed,  9 Jun 2021 06:27:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236691AbhFIG3F (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 9 Jun 2021 02:29:05 -0400
Received: from mail-ua1-f50.google.com ([209.85.222.50]:35765 "EHLO
        mail-ua1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232540AbhFIG3E (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 9 Jun 2021 02:29:04 -0400
Received: by mail-ua1-f50.google.com with SMTP id n61so12504327uan.2
        for <linux-m68k@lists.linux-m68k.org>; Tue, 08 Jun 2021 23:27:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4fj15iHDE4EFRmdRKw+InwfdANDxyy1h2Pcw1pJ7br4=;
        b=GbqmCBVoxdX3ugsaz85yojOHGinzTkuIZAIco6I/r8pkZpQBuv3UHkA1dKkHBh6fHu
         USsR4cMycqhU4im/zzef0t3f4jIWIkXLfUqw8yug62I92MIsZfrm7oKeT6EogNwc7aWp
         8rVjNfdFw3H/U+maQTr3rbAl7rfRWYicc6N0+nFtC1t4NNCXmAr7JPanazvFlx9TneDN
         b53fIM4fjspF60lt0omOngz+zdf/YWdT0GYwd7fyO/P5iy8UeAcue32CfyIfM6OIcYGl
         /IsAS5GNedJ+OYpMs+zIOhjam5rhB+F3NmS4ITqvLyb3XOUJgP5chd7nT60bWf3rvNgR
         gW6g==
X-Gm-Message-State: AOAM5335RJgIuKVEPO7D882RSOywB/tKzEtZU0aGw/U1TmlQbksOVF2Y
        Dw+V3ipnzBxohQwuvYeV48wIGqp6qKx/p8GSw5Q=
X-Google-Smtp-Source: ABdhPJxOT1OQWZmJ0L718G4ODcg41DXYgKnREAhbxodoTZAVg+J1tMSfO4J0OJrSKInRNpUlS+s+kLY88BqtDrhoGjM=
X-Received: by 2002:ab0:63d9:: with SMTP id i25mr14918511uap.106.1623220030058;
 Tue, 08 Jun 2021 23:27:10 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1623131194.git.fthain@linux-m68k.org> <8ec3037e69f5ec9f7dbbafc642638f03eff29927.1623131194.git.fthain@linux-m68k.org>
In-Reply-To: <8ec3037e69f5ec9f7dbbafc642638f03eff29927.1623131194.git.fthain@linux-m68k.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 9 Jun 2021 08:26:58 +0200
Message-ID: <CAMuHMdUXtnzMOBxR_c+i1OomxwV3xC6k9PGLHkQueFaxudQd_w@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] m68k/mac: Replace macide driver with generic
 platform drivers
To:     Finn Thain <fthain@linux-m68k.org>
Cc:     Jens Axboe <axboe@kernel.dk>,
        "David S. Miller" <davem@davemloft.net>,
        Michael Schmitz <schmitzmic@gmail.com>,
        Joshua Thompson <funaho@jurai.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-ide@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Tue, Jun 8, 2021 at 8:04 AM Finn Thain <fthain@linux-m68k.org> wrote:
> This allows m68k mac systems to switch from the deprecated IDE subsystem
> to libata.
>
> This was tested on my Quadra 630. I haven't tested it on my PowerBook 150
> because I don't have a RAM adapter board for it. It appears that the
> hardware I tested doesn't need macide_clear_irq() or macide_test_irq().
> If it did, the generic driver would not have worked. It's possible that
> those routines are needed for the PowerBook 150 but we can cross that
> bridge if and when we come to it.
>
> BTW, macide_clear_irq() appears to suffer from a race condition. The write
> to the interrupt flags register could have unintended side effects as it
> may alter other flag bits. Fortunately, all of the other bits are unused
> by Linux. When tested on my Quadra 630, the assignment *ide_ifr &= ~0x20
> was observed to have no effect on bit 5, so it may be redundant anyway.
>
> Cc: Michael Schmitz <schmitzmic@gmail.com>
> Cc: Joshua Thompson <funaho@jurai.org>
> Reviewed-by: Michael Schmitz <schmitzmic@gmail.com>
> Signed-off-by: Finn Thain <fthain@linux-m68k.org>

Thanks for your patch!

>  arch/m68k/configs/mac_defconfig   |   1 -
>  arch/m68k/configs/multi_defconfig |   1 -
>  arch/m68k/mac/config.c            |  24 +++--
>  drivers/ide/Kconfig               |  14 ---
>  drivers/ide/Makefile              |   1 -
>  drivers/ide/macide.c              | 161 ------------------------------
>  6 files changed, 14 insertions(+), 188 deletions(-)
>  delete mode 100644 drivers/ide/macide.c

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
