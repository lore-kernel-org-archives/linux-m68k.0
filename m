Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80B79CDB474
	for <linux-m68k@archiver.kernel.org>; Mon, 16 Oct 2023 11:19:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233328AbjJPLTA (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 16 Oct 2023 07:19:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233491AbjJPLS4 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 16 Oct 2023 07:18:56 -0400
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 829C812D
        for <linux-m68k@lists.linux-m68k.org>; Mon, 16 Oct 2023 04:18:49 -0700 (PDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 667561FB;
        Mon, 16 Oct 2023 04:19:28 -0700 (PDT)
Received: from [10.1.196.40] (e121345-lin.cambridge.arm.com [10.1.196.40])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7628A3F5A1;
        Mon, 16 Oct 2023 04:18:45 -0700 (PDT)
Message-ID: <986636cf-5ae8-4b86-bf00-acae8f2680ad@arm.com>
Date:   Mon, 16 Oct 2023 12:18:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/12] dma-direct: add depdenencies to
 CONFIG_DMA_GLOBAL_POOL
Content-Language: en-GB
To:     Christoph Hellwig <hch@lst.de>, Greg Ungerer <gerg@linux-m68k.org>,
        iommu@lists.linux.dev
Cc:     Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Conor Dooley <conor@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Wei Fang <wei.fang@nxp.com>,
        Shenwei Wang <shenwei.wang@nxp.com>,
        Clark Wang <xiaoning.wang@nxp.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-m68k@lists.linux-m68k.org, netdev@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
        Jim Quinlan <james.quinlan@broadcom.com>
References: <20231016054755.915155-1-hch@lst.de>
 <20231016054755.915155-6-hch@lst.de>
From:   Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <20231016054755.915155-6-hch@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On 16/10/2023 6:47 am, Christoph Hellwig wrote:
> CONFIG_DMA_GLOBAL_POOL can't be combined with other DMA coherent
> allocators.  Add dependencies to Kconfig to document this, and make
> kconfig complain about unment dependencies if someone tries.

Reviewed-by: Robin Murphy <robin.murphy@arm.com>

> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>   kernel/dma/Kconfig | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/kernel/dma/Kconfig b/kernel/dma/Kconfig
> index f488997b071712..4524db877eba36 100644
> --- a/kernel/dma/Kconfig
> +++ b/kernel/dma/Kconfig
> @@ -135,6 +135,8 @@ config DMA_COHERENT_POOL
>   
>   config DMA_GLOBAL_POOL
>   	select DMA_DECLARE_COHERENT
> +	depends on !ARCH_HAS_DMA_SET_UNCACHED
> +	depends on !DMA_DIRECT_REMAP
>   	bool
>   
>   config DMA_DIRECT_REMAP
