Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FDCDC43217
	for <linux-m68k@archiver.kernel.org>; Thu,  1 Dec 2022 05:41:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229519AbiLAFlr (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 1 Dec 2022 00:41:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229503AbiLAFlq (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 1 Dec 2022 00:41:46 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 709F4A280E
        for <linux-m68k@lists.linux-m68k.org>; Wed, 30 Nov 2022 21:41:45 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 41883B81D17;
        Thu,  1 Dec 2022 05:41:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B74E2C433D6;
        Thu,  1 Dec 2022 05:41:37 +0000 (UTC)
Message-ID: <d87264fe-b3e2-39fe-66d2-8201ce81319b@linux-m68k.org>
Date:   Thu, 1 Dec 2022 15:41:34 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 1/2] net: fec: use dma_alloc_noncoherent for m532x
Content-Language: en-US
To:     Christoph Hellwig <hch@lst.de>,
        Joakim Zhang <qiangqing.zhang@nxp.com>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        linux-m68k@lists.linux-m68k.org, uclinux-dev@uclinux.org,
        netdev@vger.kernel.org
References: <20221121095631.216209-1-hch@lst.de>
 <20221121095631.216209-2-hch@lst.de>
From:   Greg Ungerer <gerg@linux-m68k.org>
In-Reply-To: <20221121095631.216209-2-hch@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Christoph,

On 21/11/22 19:56, Christoph Hellwig wrote:
> The m532x coldfire platforms can't properly implement dma_alloc_coherent
> and currently just return noncoherent memory from it.  The fec driver
> than works around this with a flush of all caches in the receive path.
> Make this hack a little less bad by using the explicit
> dma_alloc_noncoherent API and documenting the hacky cache flushes.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>   drivers/net/ethernet/freescale/fec_main.c | 19 +++++++++++++++++++
>   1 file changed, 19 insertions(+)
> 
> diff --git a/drivers/net/ethernet/freescale/fec_main.c b/drivers/net/ethernet/freescale/fec_main.c
> index 28ef4d3c18789..5230698310b5e 100644
> --- a/drivers/net/ethernet/freescale/fec_main.c
> +++ b/drivers/net/ethernet/freescale/fec_main.c
> @@ -1580,6 +1580,10 @@ fec_enet_rx_queue(struct net_device *ndev, int budget, u16 queue_id)
>   	struct page *page;
>   
>   #ifdef CONFIG_M532x
> +	/*
> +	 * Hacky flush of all caches instead of using the DMA API for the TSO
> +	 * headers.
> +	 */
>   	flush_cache_all();
>   #endif
>   	rxq = fep->rx_queue[queue_id];
> @@ -3123,10 +3127,17 @@ static void fec_enet_free_queue(struct net_device *ndev)
>   	for (i = 0; i < fep->num_tx_queues; i++)
>   		if (fep->tx_queue[i] && fep->tx_queue[i]->tso_hdrs) {
>   			txq = fep->tx_queue[i];
> +#ifdef CONFIG_M532x
>   			dma_free_coherent(&fep->pdev->dev,
>   					  txq->bd.ring_size * TSO_HEADER_SIZE,
>   					  txq->tso_hdrs,
>   					  txq->tso_hdrs_dma);
> +#else
> +			dma_free_noncoherent(&fep->pdev->dev,
> +					  txq->bd.ring_size * TSO_HEADER_SIZE,
> +					  txq->tso_hdrs, txq->tso_hdrs_dma,
> +					  DMA_BIDIRECTIONAL);
> +#endif
>   		}
>   
>   	for (i = 0; i < fep->num_rx_queues; i++)
> @@ -3157,10 +3168,18 @@ static int fec_enet_alloc_queue(struct net_device *ndev)
>   		txq->tx_wake_threshold =
>   			(txq->bd.ring_size - txq->tx_stop_threshold) / 2;
>   
> +#ifdef CONFIG_M532x
>   		txq->tso_hdrs = dma_alloc_coherent(&fep->pdev->dev,
>   					txq->bd.ring_size * TSO_HEADER_SIZE,
>   					&txq->tso_hdrs_dma,
>   					GFP_KERNEL);

Even with this corrected this will now end up failing on all other ColdFire types
with the FEC hardware module (all the non-M532x types) once the arch_dma_alloc()
returns NULL.

Did you mean "ifndef CONFIG_COLDFIRE" here?


> +#else
> +		/* m68knommu manually flushes all caches in fec_enet_rx_queue */
> +		txq->tso_hdrs = dma_alloc_noncoherent(&fep->pdev->dev,
> +					txq->bd.ring_size * TSO_HEADER_SIZE,
> +					&txq->tso_hdrs_dma, DMA_BIDIRECTIONAL,
> +					GFP_KERNEL);
> +#endif
>   		if (!txq->tso_hdrs) {
>   			ret = -ENOMEM;
>   			goto alloc_failed;

And what about the dmam_alloc_coherent() call in fec_enet_init()?
Does that need changing too?

Regards
Greg

