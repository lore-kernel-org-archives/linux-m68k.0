Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9511DCD8C99
	for <linux-m68k@archiver.kernel.org>; Tue, 10 Oct 2023 14:45:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232419AbjJJOpH (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 10 Oct 2023 10:45:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232401AbjJJOpG (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 10 Oct 2023 10:45:06 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48AD699
        for <linux-m68k@lists.linux-m68k.org>; Tue, 10 Oct 2023 07:45:05 -0700 (PDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
        by dfw.source.kernel.org (Postfix) with ESMTP id 3F6E26170D;
        Tue, 10 Oct 2023 14:45:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74AE0C433C8;
        Tue, 10 Oct 2023 14:45:01 +0000 (UTC)
Message-ID: <eedf951d-901c-40d8-91f2-0f13d33b7d4e@linux-m68k.org>
Date:   Wed, 11 Oct 2023 00:44:58 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] net: fec: use dma_alloc_noncoherent for m532x
Content-Language: en-US
To:     Christoph Hellwig <hch@lst.de>, Robin Murphy <robin.murphy@arm.com>
Cc:     iommu@lists.linux.dev, Marek Szyprowski <m.szyprowski@samsung.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Wei Fang <wei.fang@nxp.com>,
        Shenwei Wang <shenwei.wang@nxp.com>,
        Clark Wang <xiaoning.wang@nxp.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-m68k@lists.linux-m68k.org, netdev@vger.kernel.org,
        Jim Quinlan <james.quinlan@broadcom.com>
References: <20231009074121.219686-1-hch@lst.de>
 <20231009074121.219686-6-hch@lst.de>
 <ea608718-8a50-4f87-aecf-fc100d283fe8@arm.com> <20231009125843.GA7272@lst.de>
From:   Greg Ungerer <gerg@linux-m68k.org>
In-Reply-To: <20231009125843.GA7272@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Christoph,

On 9/10/23 22:58, Christoph Hellwig wrote:
> On Mon, Oct 09, 2023 at 11:29:12AM +0100, Robin Murphy wrote:
>> It looks a bit odd that this ends up applying to all of Coldfire, while the
>> associated cache flush only applies to the M532x platform, which implies
>> that we'd now be relying on the non-coherent allocation actually being
>> coherent on other Coldfire platforms.
>>
>> Would it work to do something like this to make sure dma-direct does the
>> right thing on such platforms (which presumably don't have caches?), and
>> then reduce the scope of this FEC hack accordingly, to clean things up even
>> better?
> 
> Probably.  Actually Greg comment something along the lines last
> time, and mentioned something about just instruction vs instruction
> and data cache.

I just elaborated on that point a little in response to Robin's email.

>>
>> diff --git a/arch/m68k/Kconfig.cpu b/arch/m68k/Kconfig.cpu
>> index b826e9c677b2..1851fa3fe077 100644
>> --- a/arch/m68k/Kconfig.cpu
>> +++ b/arch/m68k/Kconfig.cpu
>> @@ -27,6 +27,7 @@ config COLDFIRE
>>   	select CPU_HAS_NO_BITFIELDS
>>   	select CPU_HAS_NO_CAS
>>   	select CPU_HAS_NO_MULDIV64
>> +	select DMA_DEFAULT_COHERENT if !MMU && !M523x
> 
> Although it would probably make more sense to simply not select
> CONFIG_ARCH_HAS_SYNC_DMA_FOR_DEVICE and
> CONFIG_ARCH_HAS_SYNC_DMA_FOR_CPU for these platforms and not
> build the non-coherent code at all.  This should also include
> all coldfire platforms with mmu (M54xx/M548x/M5441x).  Then
> again for many of the coldfire platforms the Kconfig allows
> to select CACHE_WRITETHRU/CACHE_COPYBACK which looks related.
> 
> Greg, any chance you could help out with the caching modes on
> coldfire and legacy m68knommu?

Sure, yep. I am not aware that the legacy 68000 or 68328 had any caches
at all.

The cache modes change a bit through out the various ColdFire family series, but
can be broken down roughly into 2 groups.

1.  Version 2 cores (so everything named 52xx). Early members (5206, 5206e, 5272)
     had instruction cache only. Later members (5208, 5271/5275, 523x, etc) had
     a selectable instruction or data or both cache arrangement. Kconfig lets you
     select which you want - the default is instruction cache only.

2.  Version 3 and 4 cores (so everything named 53xx and 54xx). They have a unified
     instruction and data cache. Data caching can be selected to be write-through
     (the default) or write-back.

Some of the version 4 cores also have an MMU.

The M532x hack in the fec driver is to deal with its unified cache, and it is the
only ColdFire version 3 or 4 SoC that has the fec hardware module (thus no others
listed out there). I suspect if you select data cache on the version 2 cores that have
it would break in the fec driver too.

Regards
Greg


