Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2C96CDB47E
	for <linux-m68k@archiver.kernel.org>; Fri, 13 Oct 2023 01:48:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229450AbjJMBse (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 12 Oct 2023 21:48:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229441AbjJMBsd (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 12 Oct 2023 21:48:33 -0400
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D9F7C0
        for <linux-m68k@lists.linux-m68k.org>; Thu, 12 Oct 2023 18:48:31 -0700 (PDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
        by sin.source.kernel.org (Postfix) with ESMTP id 4B38BCE2CC9;
        Fri, 13 Oct 2023 01:48:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BD6DC433C8;
        Fri, 13 Oct 2023 01:48:24 +0000 (UTC)
Message-ID: <11354dc7-7f3f-802f-39f5-efbe55f8faf4@linux-m68k.org>
Date:   Fri, 13 Oct 2023 11:48:20 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 5/6] net: fec: use dma_alloc_noncoherent for m532x
Content-Language: en-US
To:     Christoph Hellwig <hch@lst.de>
Cc:     Michael Schmitz <schmitzmic@gmail.com>,
        Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux.dev,
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
 <e16ac0a4-3e4a-4e8c-98ba-7b600a8c6768@linux-m68k.org>
 <20231012140038.GA8513@lst.de>
From:   Greg Ungerer <gerg@linux-m68k.org>
In-Reply-To: <20231012140038.GA8513@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Christoph,

On 13/10/23 00:00, Christoph Hellwig wrote:
> On Thu, Oct 12, 2023 at 11:25:00PM +1000, Greg Ungerer wrote:
>> Not sure I follow. This is the opposite of the case above. The noncoherent alloc
>> and cache flush should be performed if ColdFire and any of CONFIG_HAVE_CACHE_CB,
>> CONFIG_CACHE_D or CONFIG_CACHE_BOTH are set - since that means there is data
>> caching involved.
> 
> FYI, this is what I ended up with this morning:
> 
> http://git.infradead.org/users/hch/misc.git/commitdiff/ea7c8c5ca3f158f88594f4f1c9a52735115f9aca

That looks nice.

> Whole branch:
> 
> http://git.infradead.org/users/hch/misc.git/shortlog/refs/heads/dma-coherent-deps

I'll try and give this some testing next week.

Thanks
Greg


