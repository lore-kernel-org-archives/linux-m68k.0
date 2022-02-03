Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E9B5C433EF
	for <linux-m68k@archiver.kernel.org>; Thu,  3 Feb 2022 00:00:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235190AbiBCAA2 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 2 Feb 2022 19:00:28 -0500
Received: from dfw.source.kernel.org ([139.178.84.217]:32972 "EHLO
        dfw.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234065AbiBCAA2 (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Wed, 2 Feb 2022 19:00:28 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D93C2616D2
        for <linux-m68k@vger.kernel.org>; Thu,  3 Feb 2022 00:00:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0458C340EB;
        Thu,  3 Feb 2022 00:00:26 +0000 (UTC)
Subject: Re: [RESEND] m68k: m5441x: remove erroneous clock disable
To:     Angelo Dureghello <angelo.dureghello@timesys.com>
Cc:     linux-m68k@vger.kernel.org
References: <20220202194700.289942-1-angelo.dureghello@timesys.com>
From:   Greg Ungerer <gerg@linux-m68k.org>
Message-ID: <90cd4311-c30d-94b5-f24a-35ff5aba61fe@linux-m68k.org>
Date:   Thu, 3 Feb 2022 10:00:24 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220202194700.289942-1-angelo.dureghello@timesys.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Angelo,

So it is clear for me this is the correct (and only) patch to apply?

Regards
Greg


On 3/2/22 5:47 am, Angelo Dureghello wrote:
> Remove erroneous esdhc clock disable.
> 
> Signed-off-by: Angelo Dureghello <angelo.dureghello@timesys.com>
> ---
>   arch/m68k/coldfire/m5441x.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/arch/m68k/coldfire/m5441x.c b/arch/m68k/coldfire/m5441x.c
> index 02922ced19cb..b13fb3d8a14e 100644
> --- a/arch/m68k/coldfire/m5441x.c
> +++ b/arch/m68k/coldfire/m5441x.c
> @@ -181,7 +181,6 @@ static struct clk * const disable_clks[] __initconst = {
>   	&__clk_0_47, /* ssi.0 */
>   	&__clk_0_49, /* rng */
>   	&__clk_0_50, /* ssi.1 */
> -	&__clk_0_51, /* eSDHC */
>   	&__clk_0_53, /* enet-fec */
>   	&__clk_0_54, /* enet-fec */
>   	&__clk_0_55, /* switch.0 */
> 
