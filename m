Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30BC3C4167B
	for <linux-m68k@archiver.kernel.org>; Mon, 19 Dec 2022 12:33:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231679AbiLSMdm (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 19 Dec 2022 07:33:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231785AbiLSMdE (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 19 Dec 2022 07:33:04 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2A13E08F
        for <linux-m68k@lists.linux-m68k.org>; Mon, 19 Dec 2022 04:33:01 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id A04BCB80DE4;
        Mon, 19 Dec 2022 12:33:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C655FC433D2;
        Mon, 19 Dec 2022 12:32:58 +0000 (UTC)
Message-ID: <4c17e3cb-43a2-f3a7-d713-71093367eac5@linux-m68k.org>
Date:   Mon, 19 Dec 2022 22:32:56 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] m68k: nommu: Fix misspellings of "DragonEngine"
Content-Language: en-US
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
References: <8e823d669284abb9b5174f25a4abfc4cd35b1652.1670919535.git.geert@linux-m68k.org>
From:   Greg Ungerer <gerg@linux-m68k.org>
In-Reply-To: <8e823d669284abb9b5174f25a4abfc4cd35b1652.1670919535.git.geert@linux-m68k.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Geert,

On 13/12/22 18:19, Geert Uytterhoeven wrote:
> Exys produced the "DragonEngine II" board.
> 
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>

At least the misspelling was used consistently ;-)
See arch/m68k/68000/dragen2.c!

Do you want me to push through the m68knommu git tree?

Regards
Greg


> ---
> The printed message:
> 
>      arch/m68k/kernel/setup_no.c:    pr_info("DragonEngine II board support by Georges Menie\n");
> 
> matches Georges' website:
> 
>      https://www.menie.org/georges/DragonEngine/
> ---
>   arch/m68k/Kconfig.machine | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/m68k/Kconfig.machine b/arch/m68k/Kconfig.machine
> index b7a70297fbc1a5a6..e2f961208f18bec5 100644
> --- a/arch/m68k/Kconfig.machine
> +++ b/arch/m68k/Kconfig.machine
> @@ -199,11 +199,11 @@ config UCDIMM
>   	  Support for the Arcturus Networks uCdimm module.
>   
>   config DRAGEN2
> -	bool "DragenEngine II board support"
> +	bool "DragonEngine II board support"
>   	depends on !MMU
>   	select M68VZ328
>   	help
> -	  Support for the DragenEngine II board.
> +	  Support for the DragonEngine II board.
>   
>   config DIRECT_IO_ACCESS
>   	bool "Allow user to access IO directly"
