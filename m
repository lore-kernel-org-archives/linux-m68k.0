Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 835E6C4332F
	for <linux-m68k@archiver.kernel.org>; Fri,  2 Dec 2022 07:02:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232462AbiLBHCa (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 2 Dec 2022 02:02:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230163AbiLBHC3 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 2 Dec 2022 02:02:29 -0500
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF5A49E440
        for <linux-m68k@lists.linux-m68k.org>; Thu,  1 Dec 2022 23:02:28 -0800 (PST)
Received: by verein.lst.de (Postfix, from userid 2407)
        id 9F54E68AA6; Fri,  2 Dec 2022 08:02:24 +0100 (CET)
Date:   Fri, 2 Dec 2022 08:02:23 +0100
From:   Christoph Hellwig <hch@lst.de>
To:     Greg Ungerer <gerg@linux-m68k.org>
Cc:     Christoph Hellwig <hch@lst.de>,
        Joakim Zhang <qiangqing.zhang@nxp.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        linux-m68k@lists.linux-m68k.org, uclinux-dev@uclinux.org,
        netdev@vger.kernel.org
Subject: Re: [PATCH 1/2] net: fec: use dma_alloc_noncoherent for m532x
Message-ID: <20221202070223.GA12459@lst.de>
References: <20221121095631.216209-1-hch@lst.de> <20221121095631.216209-2-hch@lst.de> <d87264fe-b3e2-39fe-66d2-8201ce81319b@linux-m68k.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d87264fe-b3e2-39fe-66d2-8201ce81319b@linux-m68k.org>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Thu, Dec 01, 2022 at 03:41:34PM +1000, Greg Ungerer wrote:
>>     #ifdef CONFIG_M532x
>> +	/*
>> +	 * Hacky flush of all caches instead of using the DMA API for the TSO
>> +	 * headers.
>> +	 */
>>   	flush_cache_all();
>
> Even with this corrected this will now end up failing on all other ColdFire types
> with the FEC hardware module (all the non-M532x types) once the arch_dma_alloc()
> returns NULL.
>
> Did you mean "ifndef CONFIG_COLDFIRE" here?

How did these work before given that the cache flush is conditional
on CONFIG_M532x?

>> +#else
>> +		/* m68knommu manually flushes all caches in fec_enet_rx_queue */
>> +		txq->tso_hdrs = dma_alloc_noncoherent(&fep->pdev->dev,
>> +					txq->bd.ring_size * TSO_HEADER_SIZE,
>> +					&txq->tso_hdrs_dma, DMA_BIDIRECTIONAL,
>> +					GFP_KERNEL);
>> +#endif
>>   		if (!txq->tso_hdrs) {
>>   			ret = -ENOMEM;
>>   			goto alloc_failed;
>
> And what about the dmam_alloc_coherent() call in fec_enet_init()?
> Does that need changing too?

If that's actually use by the FEC implementations on coldire: yes.
But maybe I need even more help on how the cache flushing is suppoѕed
to actually work here.
