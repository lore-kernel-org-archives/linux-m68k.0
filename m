Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4C1AC43334
	for <linux-m68k@archiver.kernel.org>; Mon, 13 Jun 2022 05:10:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231576AbiFMFKL (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 13 Jun 2022 01:10:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233222AbiFMFKC (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 13 Jun 2022 01:10:02 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 525212612B
        for <linux-m68k@lists.linux-m68k.org>; Sun, 12 Jun 2022 22:09:59 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id BDF236119C;
        Mon, 13 Jun 2022 05:09:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F19C3C34114;
        Mon, 13 Jun 2022 05:09:56 +0000 (UTC)
Message-ID: <eb17d321-c16f-5c03-40c3-3ad5f523827f@linux-m68k.org>
Date:   Mon, 13 Jun 2022 15:09:54 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH -next] m68k: coldfire: make symbol m523x_clk_lookup static
Content-Language: en-US
To:     Wang Jingjin <wangjingjin1@huawei.com>, geert@linux-m68k.org,
        linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
Cc:     zhengbin13@huawei.com, gaochao49@huawei.com
References: <20220610020755.187733-1-wangjingjin1@huawei.com>
From:   Greg Ungerer <gerg@linux-m68k.org>
In-Reply-To: <20220610020755.187733-1-wangjingjin1@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Wang,

On 10/6/22 12:07, Wang Jingjin wrote:
> Fix sparse warnings:
> 
> arch/m68k/coldfire/m523x.c:31:19: sparse: sparse: symbol 'm523x_clk_lookup' was not declared. Should it be static?
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Wang Jingjin <wangjingjin1@huawei.com>

Thanks. Added to the m68knommu git tree, for-next branch.

Regards
Greg


> ---
>   arch/m68k/coldfire/m523x.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/m68k/coldfire/m523x.c b/arch/m68k/coldfire/m523x.c
> index 193c178162c1..83a997313393 100644
> --- a/arch/m68k/coldfire/m523x.c
> +++ b/arch/m68k/coldfire/m523x.c
> @@ -28,7 +28,7 @@
>   DEFINE_CLK(pll, "pll.0", MCF_CLK);
>   DEFINE_CLK(sys, "sys.0", MCF_BUSCLK);
> 
> -struct clk_lookup m523x_clk_lookup[] = {
> +static struct clk_lookup m523x_clk_lookup[] = {
>   	CLKDEV_INIT(NULL, "pll.0", &clk_pll),
>   	CLKDEV_INIT(NULL, "sys.0", &clk_sys),
>   	CLKDEV_INIT("mcfpit.0", NULL, &clk_pll),
> --
> 2.25.1
> 
