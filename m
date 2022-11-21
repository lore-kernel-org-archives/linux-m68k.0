Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DE73C433FE
	for <linux-m68k@archiver.kernel.org>; Mon, 21 Nov 2022 10:24:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231391AbiKUKYr (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 21 Nov 2022 05:24:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231368AbiKUKYp (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 21 Nov 2022 05:24:45 -0500
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED2F42182A
        for <linux-m68k@lists.linux-m68k.org>; Mon, 21 Nov 2022 02:24:44 -0800 (PST)
Received: by mail-qv1-f47.google.com with SMTP id cz18so1385294qvb.13
        for <linux-m68k@lists.linux-m68k.org>; Mon, 21 Nov 2022 02:24:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tuz4GXSuMABf7djgSVIWhgWtMsICfYMb1in6u5g4o1Y=;
        b=bHTZ6A6zj3TDXd+p2QjwuFqAGgPrMC7NWDA/UCm4mCsD1fhsSzrDIzjADF/GQDTLIV
         GOM/PTC9dL1MiuFjg9Er/cta7Pco7DVSVOfGFh/CmO0bHmLVHm/i37Hq6do1ij8WgZBp
         4zOW0S71e5/4gTqRNm4aXj2sLti+8ZrzQS9dyzcu3XLN5L3Lp70Zum7Oh/cbV3y+QXFL
         l3vyaATrpyHyMEMkkf/y09Rfg4nH/kmpXquIMuDDjkRmDt7PwOxr/9/DUgSGcQ6EVFNg
         ueBtvUVCJoAV5eeaMewzknPHFNvdIxJoyH5cYR8mh86Oqyk72TSNsbbg3Kqz+C1o74FE
         1hzg==
X-Gm-Message-State: ANoB5pnjAXGDVsqHLzPNFI5DR6wp3RVmQJtGfwDAX9lUL2ru6m1ZV1dU
        naYaIQ3edRfpUCTw270/+f5nUxV2fhM6eQ==
X-Google-Smtp-Source: AA0mqf5sTHjkvyy3CCHEWNXfBRuSbX4VcgP3Qtp6L2pZMz/pvPw5Cj3f8y3/EDDrmNDgwHAaUY8Uzw==
X-Received: by 2002:a05:6214:5cb:b0:4c6:a4af:9d96 with SMTP id t11-20020a05621405cb00b004c6a4af9d96mr805352qvz.125.1669026283764;
        Mon, 21 Nov 2022 02:24:43 -0800 (PST)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com. [209.85.219.182])
        by smtp.gmail.com with ESMTPSA id br35-20020a05620a462300b006cfc01b4461sm7984969qkb.118.2022.11.21.02.24.40
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Nov 2022 02:24:42 -0800 (PST)
Received: by mail-yb1-f182.google.com with SMTP id f201so13024027yba.12
        for <linux-m68k@lists.linux-m68k.org>; Mon, 21 Nov 2022 02:24:40 -0800 (PST)
X-Received: by 2002:a25:ad8b:0:b0:6de:6c43:3991 with SMTP id
 z11-20020a25ad8b000000b006de6c433991mr15252917ybi.604.1669026280531; Mon, 21
 Nov 2022 02:24:40 -0800 (PST)
MIME-Version: 1.0
References: <20221121095631.216209-1-hch@lst.de> <20221121095631.216209-2-hch@lst.de>
In-Reply-To: <20221121095631.216209-2-hch@lst.de>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 21 Nov 2022 11:24:29 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVWjDYEAXqWuYYEOb=C-phYjS7wYNPSyZYweR0WhzSZ+A@mail.gmail.com>
Message-ID: <CAMuHMdVWjDYEAXqWuYYEOb=C-phYjS7wYNPSyZYweR0WhzSZ+A@mail.gmail.com>
Subject: Re: [PATCH 1/2] net: fec: use dma_alloc_noncoherent for m532x
To:     Christoph Hellwig <hch@lst.de>
Cc:     Greg Ungerer <gerg@linux-m68k.org>,
        Joakim Zhang <qiangqing.zhang@nxp.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        linux-m68k@lists.linux-m68k.org, uclinux-dev@uclinux.org,
        netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Christoph,

On Mon, Nov 21, 2022 at 10:56 AM Christoph Hellwig <hch@lst.de> wrote:
> The m532x coldfire platforms can't properly implement dma_alloc_coherent
> and currently just return noncoherent memory from it.  The fec driver
> than works around this with a flush of all caches in the receive path.
> Make this hack a little less bad by using the explicit
> dma_alloc_noncoherent API and documenting the hacky cache flushes.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Thanks for your patch!

> --- a/drivers/net/ethernet/freescale/fec_main.c
> +++ b/drivers/net/ethernet/freescale/fec_main.c
> @@ -1580,6 +1580,10 @@ fec_enet_rx_queue(struct net_device *ndev, int budget, u16 queue_id)
>         struct page *page;
>
>  #ifdef CONFIG_M532x
> +       /*
> +        * Hacky flush of all caches instead of using the DMA API for the TSO
> +        * headers.
> +        */
>         flush_cache_all();
>  #endif
>         rxq = fep->rx_queue[queue_id];
> @@ -3123,10 +3127,17 @@ static void fec_enet_free_queue(struct net_device *ndev)
>         for (i = 0; i < fep->num_tx_queues; i++)
>                 if (fep->tx_queue[i] && fep->tx_queue[i]->tso_hdrs) {
>                         txq = fep->tx_queue[i];
> +#ifdef CONFIG_M532x

Shouldn't this be the !CONFIG_M532x path?

>                         dma_free_coherent(&fep->pdev->dev,
>                                           txq->bd.ring_size * TSO_HEADER_SIZE,
>                                           txq->tso_hdrs,
>                                           txq->tso_hdrs_dma);
> +#else
> +                       dma_free_noncoherent(&fep->pdev->dev,
> +                                         txq->bd.ring_size * TSO_HEADER_SIZE,
> +                                         txq->tso_hdrs, txq->tso_hdrs_dma,
> +                                         DMA_BIDIRECTIONAL);
> +#endif
>                 }
>
>         for (i = 0; i < fep->num_rx_queues; i++)
> @@ -3157,10 +3168,18 @@ static int fec_enet_alloc_queue(struct net_device *ndev)
>                 txq->tx_wake_threshold =
>                         (txq->bd.ring_size - txq->tx_stop_threshold) / 2;
>
> +#ifdef CONFIG_M532x

Likewise

>                 txq->tso_hdrs = dma_alloc_coherent(&fep->pdev->dev,
>                                         txq->bd.ring_size * TSO_HEADER_SIZE,
>                                         &txq->tso_hdrs_dma,
>                                         GFP_KERNEL);
> +#else
> +               /* m68knommu manually flushes all caches in fec_enet_rx_queue */
> +               txq->tso_hdrs = dma_alloc_noncoherent(&fep->pdev->dev,
> +                                       txq->bd.ring_size * TSO_HEADER_SIZE,
> +                                       &txq->tso_hdrs_dma, DMA_BIDIRECTIONAL,
> +                                       GFP_KERNEL);
> +#endif
>                 if (!txq->tso_hdrs) {
>                         ret = -ENOMEM;
>                         goto alloc_failed;

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
