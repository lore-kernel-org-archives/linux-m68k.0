Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87783CDB46E
	for <linux-m68k@archiver.kernel.org>; Thu, 12 Oct 2023 13:25:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378843AbjJLNZK (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 12 Oct 2023 09:25:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1378679AbjJLNZJ (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 12 Oct 2023 09:25:09 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 152DC94
        for <linux-m68k@lists.linux-m68k.org>; Thu, 12 Oct 2023 06:25:08 -0700 (PDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
        by ams.source.kernel.org (Postfix) with ESMTP id 92B99B8244B;
        Thu, 12 Oct 2023 13:25:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39833C433C8;
        Thu, 12 Oct 2023 13:25:03 +0000 (UTC)
Message-ID: <e16ac0a4-3e4a-4e8c-98ba-7b600a8c6768@linux-m68k.org>
Date:   Thu, 12 Oct 2023 23:25:00 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] net: fec: use dma_alloc_noncoherent for m532x
Content-Language: en-US
To:     Michael Schmitz <schmitzmic@gmail.com>,
        Christoph Hellwig <hch@lst.de>
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
 <cff2d9f0-4719-4b88-8ed5-68c8093bcebf@linux-m68k.org>
 <12c7b0db-938c-9ca4-7861-dd703a83389a@gmail.com>
From:   Greg Ungerer <gerg@linux-m68k.org>
In-Reply-To: <12c7b0db-938c-9ca4-7861-dd703a83389a@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Michael,

On 12/10/23 04:21, Michael Schmitz wrote:
> Hi Greg,
> 
> On 12/10/23 02:09, Greg Ungerer wrote:
>>
>> I think this needs to be CONFIG_COLDFIRE is set and none of CONFIG_HAVE_CACHE_CB or
>> CONFIG_CACHE_D or CONFIG_CACHE_BOTH are set.
>>
>>
>>
>>> in the fec driver do the alloc_noncoherent and global cache flush
>>> hack if:
>>>
>>> COMFIG_COLDFIRE && (CONFIG_CACHE_D || CONFIG_CACHE_BOTH)
>>
>> And then this becomes:
>>
>> CONFIG_COLDFIRE && (CONFIG_HAVE_CACHE_CB || CONFIG_CACHE_D || CONFIG_CACHE_BOTH)
> 
> You appear to have dropped a '!' there ...

Not sure I follow. This is the opposite of the case above. The noncoherent alloc
and cache flush should be performed if ColdFire and any of CONFIG_HAVE_CACHE_CB,
CONFIG_CACHE_D or CONFIG_CACHE_BOTH are set - since that means there is data
caching involved.

Regards
Greg

