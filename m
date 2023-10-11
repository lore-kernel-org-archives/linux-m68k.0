Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EC63CD6E67
	for <linux-m68k@archiver.kernel.org>; Wed, 11 Oct 2023 13:09:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232123AbjJKNJU (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 11 Oct 2023 09:09:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234953AbjJKNJQ (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 11 Oct 2023 09:09:16 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC4F0A7
        for <linux-m68k@lists.linux-m68k.org>; Wed, 11 Oct 2023 06:09:14 -0700 (PDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
        by ams.source.kernel.org (Postfix) with ESMTP id 411F6B81F68;
        Wed, 11 Oct 2023 13:09:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01B1CC433C8;
        Wed, 11 Oct 2023 13:09:09 +0000 (UTC)
Message-ID: <cff2d9f0-4719-4b88-8ed5-68c8093bcebf@linux-m68k.org>
Date:   Wed, 11 Oct 2023 23:09:07 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] net: fec: use dma_alloc_noncoherent for m532x
Content-Language: en-US
To:     Christoph Hellwig <hch@lst.de>
Cc:     Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux.dev,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Wei Fang <wei.fang@nxp.com>,
        Shenwei Wang <shenwei.wang@nxp.com>,
        Clark Wang <xiaoning.wang@nxp.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-m68k@lists.linux-m68k.org, netdev@vger.kernel.org,
        Jim Quinlan <james.quinlan@broadcom.com>
References: <20231009074121.219686-1-hch@lst.de>
 <20231009074121.219686-6-hch@lst.de>
 <ea608718-8a50-4f87-aecf-fc100d283fe8@arm.com>
 <0299895c-24a5-4bd4-b7a4-dc50cc21e3d8@linux-m68k.org>
 <20231011055213.GA1131@lst.de>
From:   Greg Ungerer <gerg@linux-m68k.org>
In-Reply-To: <20231011055213.GA1131@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org


On 11/10/23 15:52, Christoph Hellwig wrote:
> On Wed, Oct 11, 2023 at 12:20:57AM +1000, Greg Ungerer wrote:
>> That should be M532x.
>>
>> I am pretty sure the code as-is today is broken for the case of using
>> the split cache arrangement (so both instruction and data cache) for any
>> of the version 2 cores too (denoted by the HAVE_CACHE_SPLIT option).
>> But that has probably not been picked up because the default on those
>> has always been instruction cache only.
>>
>> The reason for the special case for the M532x series is that it is a version 3
>> core and they have a unified instruction and data cache. The 523x series is the
>> only version 3 core that Linux supports that has the FEC hardware module.
> 
> So what config option should we check for supporting coherent allocations
> and which not having the hack in fec?
> 
> Here is my guesses based on the above:
> 
> in m68k support coherent allocations with no work if
> 
> CONFIG_COLDIFRE is set and neither CONFIG_CACHE_D or CONFIG_CACHE_BOTH
> is set.

I think this needs to be CONFIG_COLDFIRE is set and none of CONFIG_HAVE_CACHE_CB or
CONFIG_CACHE_D or CONFIG_CACHE_BOTH are set.



> in the fec driver do the alloc_noncoherent and global cache flush
> hack if:
> 
> COMFIG_COLDFIRE && (CONFIG_CACHE_D || CONFIG_CACHE_BOTH)

And then this becomes:

CONFIG_COLDFIRE && (CONFIG_HAVE_CACHE_CB || CONFIG_CACHE_D || CONFIG_CACHE_BOTH)
