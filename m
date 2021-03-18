Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB183C433E0
	for <linux-m68k@archiver.kernel.org>; Thu, 18 Mar 2021 03:06:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 89B6861584
	for <linux-m68k@archiver.kernel.org>; Thu, 18 Mar 2021 03:06:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230192AbhCRDFe (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 17 Mar 2021 23:05:34 -0400
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:44562 "EHLO
        kvm5.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229702AbhCRDFd (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 17 Mar 2021 23:05:33 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
        by kvm5.telegraphics.com.au (Postfix) with ESMTP id B924329EA1;
        Wed, 17 Mar 2021 23:05:30 -0400 (EDT)
Date:   Thu, 18 Mar 2021 14:05:33 +1100 (AEDT)
From:   Finn Thain <fthain@telegraphics.com.au>
To:     Mike Pavone <pavone@retrodev.com>
cc:     linux-m68k@lists.linux-m68k.org,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] m68k/mvme16x: Fix timer interrupts
In-Reply-To: <628cb0d0-94af-651f-0d84-f78b966cd8bd@retrodev.com>
Message-ID: <96914f42-e18-29cc-6c5-28b3a2fb360@telegraphics.com.au>
References: <628cb0d0-94af-651f-0d84-f78b966cd8bd@retrodev.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Tue, 16 Mar 2021, Mike Pavone wrote:

> Timer interrupts on MVME16x and MVME17x boards are broken as the CEN and
> COC bits are being inadvertently cleared when clearing the overflow
> counter. This results in no timer interrupts being delivered after the
> first. Initialization then hangs in calibrate_delay as the jiffies counter
> is not updated. OR with current register value to preserve these bits.
> 
> Fixes: 19999a8b8782 ("m68k: mvme16x: Handle timer counter overflow")
> Signed-off-by: Michael Pavone <pavone@retrodev.com>

Sorry about that regression.

Do you think that commit 7529b90d051e ("m68k: mvme147: Handle timer 
counter overflow") has the same problem?

> ---
>  arch/m68k/mvme16x/config.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/m68k/mvme16x/config.c b/arch/m68k/mvme16x/config.c
> index 30357fe4ba6c..949d3e19f79c 100644
> --- a/arch/m68k/mvme16x/config.c
> +++ b/arch/m68k/mvme16x/config.c
> @@ -375,7 +375,7 @@ static irqreturn_t mvme16x_timer_int (int irq, void
> *dev_id)
>   	local_irq_save(flags);
>  	out_8(PCCTIC1, in_8(PCCTIC1) | PCCTIC1_INT_CLR);
> -	out_8(PCCTOVR1, PCCTOVR1_OVR_CLR);
> +	out_8(PCCTOVR1, in_8(PCCTOVR1) | PCCTOVR1_OVR_CLR);
>  	clk_total += PCC_TIMER_CYCLES;
>  	legacy_timer_tick(1);
>  	local_irq_restore(flags);
> 
> 
