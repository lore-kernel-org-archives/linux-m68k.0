Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 253DEC4332F
	for <linux-m68k@archiver.kernel.org>; Tue, 19 Apr 2022 13:42:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352682AbiDSNp2 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 19 Apr 2022 09:45:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352677AbiDSNpJ (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 19 Apr 2022 09:45:09 -0400
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B34E38BC2
        for <linux-m68k@lists.linux-m68k.org>; Tue, 19 Apr 2022 06:41:28 -0700 (PDT)
Received: by mail-qt1-f182.google.com with SMTP id ay11so598683qtb.4
        for <linux-m68k@lists.linux-m68k.org>; Tue, 19 Apr 2022 06:41:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jGm6guTALRSU5+PRnvbVJaHFz19D6EpgjjGAnT9VVE4=;
        b=to/730jctBg0jdw3LAL7GRMGdxnBNbqUqDLr/1oVwjqxcw27kIkYnuYWe3Gk8xzZKs
         SlDTetGw/BsvutqwJ1vMymoOOoaR5sbtZ0apH/hz/diPrR9oJ+8nP18TV5xVgFdNMKtj
         eJtfLYnxnk2AU/eoJGN9qH5Dw1axYqkpyJZaLqqBnLrUxO76t+89PnLB+wBSa/L5k+Xw
         pl3x9bwE7c3e7LHtEnx9UV2GFACLkopLVUE9LNKqDLmAlM7z2KUEg/OiPpOLV+J/++T1
         XevHFquWblW9VZuUx5YKK8VQ8l3TfxSW766+oK9wTuCfzdEQMV+B/N6lNHuTYz0aKttE
         q+7w==
X-Gm-Message-State: AOAM530gc8SexhlE3KXtGe11H+DL+dXFojL8lqw0d00vIpMtBNko0EuN
        vLBRimjLt6oIw6CHqbmU4HWJasrYadGUBw==
X-Google-Smtp-Source: ABdhPJxjfsoyiiDcy5SVrSRHczoCTxUUZBYy/GQUnJqfhOGxEgMzaqARxxvdTbnJ0BZ9t3/eAVq9GQ==
X-Received: by 2002:ac8:5913:0:b0:2f1:f114:6b44 with SMTP id 19-20020ac85913000000b002f1f1146b44mr10337689qty.403.1650375686709;
        Tue, 19 Apr 2022 06:41:26 -0700 (PDT)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com. [209.85.219.169])
        by smtp.gmail.com with ESMTPSA id n73-20020a37a44c000000b0069ebd4a0affsm32070qke.24.2022.04.19.06.41.26
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Apr 2022 06:41:26 -0700 (PDT)
Received: by mail-yb1-f169.google.com with SMTP id t67so31092286ybi.2
        for <linux-m68k@lists.linux-m68k.org>; Tue, 19 Apr 2022 06:41:26 -0700 (PDT)
X-Received: by 2002:a05:6902:724:b0:644:c37b:4e21 with SMTP id
 l4-20020a056902072400b00644c37b4e21mr14534539ybt.6.1650375686021; Tue, 19 Apr
 2022 06:41:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220419132716.1392407-1-arnd@kernel.org>
In-Reply-To: <20220419132716.1392407-1-arnd@kernel.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 19 Apr 2022 15:41:14 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUW+jPUJzdJ-xWQYxDy4SMJ1PDFbFDsBk9Km-+EObgsvA@mail.gmail.com>
Message-ID: <CAMuHMdUW+jPUJzdJ-xWQYxDy4SMJ1PDFbFDsBk9Km-+EObgsvA@mail.gmail.com>
Subject: Re: [PATCH] [v2] m68k: coldfire: drop ISA_DMA_API support
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Greg Ungerer <gerg@linux-m68k.org>, Arnd Bergmann <arnd@arndb.de>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Finn Thain <fthain@linux-m68k.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        ALSA Development Mailing List <alsa-devel@alsa-project.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Tue, Apr 19, 2022 at 3:27 PM Arnd Bergmann <arnd@kernel.org> wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>
> After a build regression report, I took a look at possible users of
> CONFIG_ISA_DMA_API on m68k and found none, which Greg confirmed. The
> CONFIG_GENERIC_ISA_DMA option in turn is only needed to implement
> ISA_DMA_API, and is clearly not used on the platforms with ISA support.
>
> The CONFIG_ISA support for AMIGA_PCMCIA is probably also unneeded,
> but this is less clear. Unlike other PCMCIA implementations, this one
> does not use the drivers/pcmcia subsystem at all and just supports
> the "apne" network driver. When it was first added, one could use
> ISA drivers on it as well, but this probably broke at some point.
>
> With no reason to keep this, let's just drop the corresponding files
> and prevent the remaining ISA drivers that use this from getting built.
>
> The remaining definitions in asm/dma.h are used for PCI support.
>
> Link: https://lore.kernel.org/lkml/9e5ee1c3-ca80-f343-a1f5-66f3dd1c0727@linux-m68k.org/
> Cc: Greg Ungerer <gerg@linux-m68k.org>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
> v2: drop GENERIC_ISA_DMA as well, add some background on CONFIG_ISA.

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
