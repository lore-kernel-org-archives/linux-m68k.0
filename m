Return-Path: <SRS0=9X71=BN=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 686E6C433E0
	for <linux-m68k@archiver.kernel.org>; Mon,  3 Aug 2020 23:40:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 73969206F6
	for <linux-m68k@archiver.kernel.org>; Mon,  3 Aug 2020 23:40:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726370AbgHCXkT (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 3 Aug 2020 19:40:19 -0400
Received: from mail.kernel.org ([198.145.29.99]:46930 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726350AbgHCXkS (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
        Mon, 3 Aug 2020 19:40:18 -0400
Received: from [192.168.0.106] (110-174-24-87.tpgi.com.au [110.174.24.87])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 30D03206D7;
        Mon,  3 Aug 2020 23:40:17 +0000 (UTC)
Subject: Re: [PATCH] m68k: stmark2: enable edma support for dspi
To:     Angelo Dureghello <angelo.dureghello@timesys.com>
Cc:     Linux/m68k <linux-m68k@vger.kernel.org>
References: <20200803182803.193998-1-angelo.dureghello@timesys.com>
 <CALJHbkB+U430LafZ2htODRd-czebu+0xURcN+wtJV3tEfQXZPQ@mail.gmail.com>
From:   Greg Ungerer <gerg@linux-m68k.org>
Message-ID: <12449b68-a940-7d25-bb25-4957bbd415ec@linux-m68k.org>
Date:   Tue, 4 Aug 2020 09:40:15 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CALJHbkB+U430LafZ2htODRd-czebu+0xURcN+wtJV3tEfQXZPQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Angelo,

On 4/8/20 4:32 am, Angelo Dureghello wrote:
> just realized i double-posted this patch.
> You already added it to for-next, so please discard this patch.

Will do.

The changes in m68knommu for-next should be going to Linus some
time in the next few days - for linux-5.9.

Regards
Greg



> On Mon, Aug 3, 2020 at 8:19 PM Angelo Dureghello
> <angelo.dureghello@timesys.com> wrote:
>>
>> Enable dspi edma support for stmark2.
>>
>> Signed-off-by: Angelo Dureghello <angelo.dureghello@timesys.com>
>> ---
>>   arch/m68k/coldfire/stmark2.c | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/arch/m68k/coldfire/stmark2.c b/arch/m68k/coldfire/stmark2.c
>> index a8d2b3d172f9..8b5af9c83244 100644
>> --- a/arch/m68k/coldfire/stmark2.c
>> +++ b/arch/m68k/coldfire/stmark2.c
>> @@ -13,6 +13,7 @@
>>   #include <linux/spi/spi.h>
>>   #include <linux/spi/spi-fsl-dspi.h>
>>   #include <linux/spi/flash.h>
>> +#include <linux/dma-mapping.h>
>>   #include <asm/mcfsim.h>
>>
>>   /*
>> @@ -78,6 +79,8 @@ static struct resource dspi_spi0_resource[] = {
>>          },
>>   };
>>
>> +static u64 stmark2_dspi_mask = DMA_BIT_MASK(32);
>> +
>>   /* SPI controller, id = bus number */
>>   static struct platform_device dspi_spi0_device = {
>>          .name = "fsl-dspi",
>> @@ -86,6 +89,8 @@ static struct platform_device dspi_spi0_device = {
>>          .resource = dspi_spi0_resource,
>>          .dev = {
>>                  .platform_data = &dspi_spi0_info,
>> +               .dma_mask = &stmark2_dspi_mask,
>> +               .coherent_dma_mask = DMA_BIT_MASK(32),
>>          },
>>   };
>>
>> --
>> 2.28.0
>>
> 
> 
