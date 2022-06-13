Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28D9AC43334
	for <linux-m68k@archiver.kernel.org>; Mon, 13 Jun 2022 05:11:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229638AbiFMFLH (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 13 Jun 2022 01:11:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229787AbiFMFLE (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 13 Jun 2022 01:11:04 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B763719FAB
        for <linux-m68k@lists.linux-m68k.org>; Sun, 12 Jun 2022 22:11:03 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 2FD996119C;
        Mon, 13 Jun 2022 05:11:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 919C4C34114;
        Mon, 13 Jun 2022 05:11:01 +0000 (UTC)
Message-ID: <6fe2468a-9664-30f7-7f17-9093289eb4b6@linux-m68k.org>
Date:   Mon, 13 Jun 2022 15:10:59 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2] m68k: Fix syntax errors in comments
Content-Language: en-US
To:     Xiang wangx <wangxiang@cdjrlc.com>, geert@linux-m68k.org
Cc:     funaho@jurai.org, linux-m68k@lists.linux-m68k.org,
        linux-kernel@vger.kernel.org
References: <20220610083420.30214-1-wangxiang@cdjrlc.com>
From:   Greg Ungerer <gerg@linux-m68k.org>
In-Reply-To: <20220610083420.30214-1-wangxiang@cdjrlc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org


Hi Xiang,

On 10/6/22 18:34, Xiang wangx wrote:
> comments "the the" should be replaced by "of the" instead.
> 
> Signed-off-by: Xiang wangx <wangxiang@cdjrlc.com>

Thanks. Added to the m68knommu git tree, for-next branch.

Regards
Greg


> ---
> Changes since v1
> *Change comments "the the" to "of the"
> 
>   arch/m68k/coldfire/intc-2.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/m68k/coldfire/intc-2.c b/arch/m68k/coldfire/intc-2.c
> index 995093357c59..f74f0e473119 100644
> --- a/arch/m68k/coldfire/intc-2.c
> +++ b/arch/m68k/coldfire/intc-2.c
> @@ -7,7 +7,7 @@
>    * family, the 5270, 5271, 5274, 5275, and the 528x family which have two such
>    * controllers, and the 547x and 548x families which have only one of them.
>    *
> - * The external 7 fixed interrupts are part the the Edge Port unit of these
> + * The external 7 fixed interrupts are part of the Edge Port unit of these
>    * ColdFire parts. They can be configured as level or edge triggered.
>    *
>    * (C) Copyright 2009-2011, Greg Ungerer <gerg@snapgear.com>
