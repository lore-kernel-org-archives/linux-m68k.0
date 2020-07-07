Return-Path: <SRS0=M86Y=AS=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F478C433E0
	for <linux-m68k@archiver.kernel.org>; Tue,  7 Jul 2020 00:04:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 11452206F6
	for <linux-m68k@archiver.kernel.org>; Tue,  7 Jul 2020 00:04:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726805AbgGGAEL (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 6 Jul 2020 20:04:11 -0400
Received: from mail.kernel.org ([198.145.29.99]:44302 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726729AbgGGAEL (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
        Mon, 6 Jul 2020 20:04:11 -0400
Received: from [10.44.0.192] (unknown [103.48.210.53])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8E13F20672;
        Tue,  7 Jul 2020 00:04:10 +0000 (UTC)
Subject: Re: [PATCH] m68k: stmark2: enable edma support for dspi
To:     Angelo Dureghello <angelo.dureghello@timesys.com>
Cc:     linux-m68k@vger.kernel.org
References: <20200702235338.3653602-1-angelo.dureghello@timesys.com>
From:   Greg Ungerer <gerg@linux-m68k.org>
Message-ID: <b4b6b907-2e36-a23d-2c11-24ceec3039ad@linux-m68k.org>
Date:   Tue, 7 Jul 2020 10:04:07 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200702235338.3653602-1-angelo.dureghello@timesys.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Angelo,

On 3/7/20 9:53 am, Angelo Dureghello wrote:
> Enable edma support for stmark2.
> 
> Signed-off-by: Angelo Dureghello <angelo.dureghello@timesys.com>

Thanks. Pushed into the m68knommu git tree, for-next branch.

Regards
Greg


>   arch/m68k/coldfire/stmark2.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/arch/m68k/coldfire/stmark2.c b/arch/m68k/coldfire/stmark2.c
> index a8d2b3d172f9..8b5af9c83244 100644
> --- a/arch/m68k/coldfire/stmark2.c
> +++ b/arch/m68k/coldfire/stmark2.c
> @@ -13,6 +13,7 @@
>   #include <linux/spi/spi.h>
>   #include <linux/spi/spi-fsl-dspi.h>
>   #include <linux/spi/flash.h>
> +#include <linux/dma-mapping.h>
>   #include <asm/mcfsim.h>
>   
>   /*
> @@ -78,6 +79,8 @@ static struct resource dspi_spi0_resource[] = {
>   	},
>   };
>   
> +static u64 stmark2_dspi_mask = DMA_BIT_MASK(32);
> +
>   /* SPI controller, id = bus number */
>   static struct platform_device dspi_spi0_device = {
>   	.name = "fsl-dspi",
> @@ -86,6 +89,8 @@ static struct platform_device dspi_spi0_device = {
>   	.resource = dspi_spi0_resource,
>   	.dev = {
>   		.platform_data = &dspi_spi0_info,
> +		.dma_mask = &stmark2_dspi_mask,
> +		.coherent_dma_mask = DMA_BIT_MASK(32),
>   	},
>   };
>   
> 
