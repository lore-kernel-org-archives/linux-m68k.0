Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,FAKE_REPLY_A1,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93C8AC433ED
	for <linux-m68k@archiver.kernel.org>; Thu, 22 Apr 2021 22:31:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 53FE061417
	for <linux-m68k@archiver.kernel.org>; Thu, 22 Apr 2021 22:31:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236660AbhDVWbv (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 22 Apr 2021 18:31:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:42084 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235977AbhDVWbu (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
        Thu, 22 Apr 2021 18:31:50 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 77583613ED;
        Thu, 22 Apr 2021 22:31:14 +0000 (UTC)
To:     angelo@kernel-space.org
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Linux/m68k <linux-m68k@vger.kernel.org>
From:   Greg Ungerer <gerg@linux-m68k.org>
Subject: Re: [PATCH v2] m68k: coldfire: fix irq ranges
Message-ID: <61f697da-e42c-4b38-8260-334607fb29f7@linux-m68k.org>
Date:   Fri, 23 Apr 2021 08:31:10 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Angelo,

Sorry for the slow pick up of this. Some email problems caused me
to not get the original emails (saw this in the archives).

Applied to m68knommu git tree, for-next branch.

Regards
Greg


> Working on flexcan0, there was no way to have irq 128 working.
> Fix irq 128 and 196 setup.
> 
> Signed-off-by: Angelo Dureghello <angelo@kernel-space.org>
> ---
> Change for v2:
>   line 85, fix >= into >
> ---
>  arch/m68k/coldfire/intc-simr.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/m68k/coldfire/intc-simr.c b/arch/m68k/coldfire/intc-simr.c
> index 15c4b7a6e38f..f7c2c41b3156 100644
> --- a/arch/m68k/coldfire/intc-simr.c
> +++ b/arch/m68k/coldfire/intc-simr.c
> @@ -68,9 +68,9 @@ static void intc_irq_mask(struct irq_data *d)
>  {
>  	unsigned int irq = d->irq - MCFINT_VECBASE;
>  
> -	if (MCFINTC2_SIMR && (irq > 128))
> +	if (MCFINTC2_SIMR && (irq > 127))
>  		__raw_writeb(irq - 128, MCFINTC2_SIMR);
> -	else if (MCFINTC1_SIMR && (irq > 64))
> +	else if (MCFINTC1_SIMR && (irq > 63))
>  		__raw_writeb(irq - 64, MCFINTC1_SIMR);
>  	else
>  		__raw_writeb(irq, MCFINTC0_SIMR);
> @@ -80,9 +80,9 @@ static void intc_irq_unmask(struct irq_data *d)
>  {
>  	unsigned int irq = d->irq - MCFINT_VECBASE;
>  
> -	if (MCFINTC2_CIMR && (irq > 128))
> +	if (MCFINTC2_CIMR && (irq > 127))
>  		__raw_writeb(irq - 128, MCFINTC2_CIMR);
> -	else if (MCFINTC1_CIMR && (irq > 64))
> +	else if (MCFINTC1_CIMR && (irq > 63))
>  		__raw_writeb(irq - 64, MCFINTC1_CIMR);
>  	else
>  		__raw_writeb(irq, MCFINTC0_CIMR);
> @@ -115,9 +115,9 @@ static unsigned int intc_irq_startup(struct irq_data *d)
>  	}
>  
>  	irq -= MCFINT_VECBASE;
> -	if (MCFINTC2_ICR0 && (irq > 128))
> +	if (MCFINTC2_ICR0 && (irq > 127))
>  		__raw_writeb(5, MCFINTC2_ICR0 + irq - 128);
> -	else if (MCFINTC1_ICR0 && (irq > 64))
> +	else if (MCFINTC1_ICR0 && (irq > 63))
>  		__raw_writeb(5, MCFINTC1_ICR0 + irq - 64);
>  	else
>  		__raw_writeb(5, MCFINTC0_ICR0 + irq);
> -- 
> 2.31.0


