Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D364AC47089
	for <linux-m68k@archiver.kernel.org>; Mon,  5 Dec 2022 14:09:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230294AbiLEOJU (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 5 Dec 2022 09:09:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229982AbiLEOJS (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 5 Dec 2022 09:09:18 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C780D6552
        for <linux-m68k@lists.linux-m68k.org>; Mon,  5 Dec 2022 06:09:17 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 5A690B81061;
        Mon,  5 Dec 2022 14:09:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCBF9C433C1;
        Mon,  5 Dec 2022 14:09:12 +0000 (UTC)
Message-ID: <8a4ba165-69ec-9c0a-8fc8-b41fd965290b@linux-m68k.org>
Date:   Tue, 6 Dec 2022 00:09:10 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 1/2] net: fec: use dma_alloc_noncoherent for m532x
Content-Language: en-US
To:     Christoph Hellwig <hch@lst.de>
Cc:     Joakim Zhang <qiangqing.zhang@nxp.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        linux-m68k@lists.linux-m68k.org, uclinux-dev@uclinux.org,
        netdev@vger.kernel.org
References: <20221121095631.216209-1-hch@lst.de>
 <20221121095631.216209-2-hch@lst.de>
 <d87264fe-b3e2-39fe-66d2-8201ce81319b@linux-m68k.org>
 <20221202070223.GA12459@lst.de>
From:   Greg Ungerer <gerg@linux-m68k.org>
In-Reply-To: <20221202070223.GA12459@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org


On 2/12/22 17:02, Christoph Hellwig wrote:
> On Thu, Dec 01, 2022 at 03:41:34PM +1000, Greg Ungerer wrote:
>>>      #ifdef CONFIG_M532x
>>> +	/*
>>> +	 * Hacky flush of all caches instead of using the DMA API for the TSO
>>> +	 * headers.
>>> +	 */
>>>    	flush_cache_all();
>>
>> Even with this corrected this will now end up failing on all other ColdFire types
>> with the FEC hardware module (all the non-M532x types) once the arch_dma_alloc()
>> returns NULL.
>>
>> Did you mean "ifndef CONFIG_COLDFIRE" here?
> 
> How did these work before given that the cache flush is conditional
> on CONFIG_M532x?

The case for the 5272 is that it only has instruction cache, no data cache.
That was the first supported part, and the one I have used the most over
the years (though not so much recently). So it should be ok.

I am not convinced about the other version 2 cores either. They all have
both instruction and data cache - they can be flexibily configured to be
all instruction, or a mix of instruction and data - but the default is
both.

I don't have a 532x platform, so I have never done any work on that.
The flush_cache_all() for that seems dubious to me.


>>> +#else
>>> +		/* m68knommu manually flushes all caches in fec_enet_rx_queue */
>>> +		txq->tso_hdrs = dma_alloc_noncoherent(&fep->pdev->dev,
>>> +					txq->bd.ring_size * TSO_HEADER_SIZE,
>>> +					&txq->tso_hdrs_dma, DMA_BIDIRECTIONAL,
>>> +					GFP_KERNEL);
>>> +#endif
>>>    		if (!txq->tso_hdrs) {
>>>    			ret = -ENOMEM;
>>>    			goto alloc_failed;
>>
>> And what about the dmam_alloc_coherent() call in fec_enet_init()?
>> Does that need changing too?
> 
> If that's actually use by the FEC implementations on coldire: yes.

It is. Testing these changes failed at boot without changing this one too.


> But maybe I need even more help on how the cache flushing is suppoѕed
> to actually work here.

Regards
Greg
