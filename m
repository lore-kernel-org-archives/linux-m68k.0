Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D80AC433E9
	for <linux-m68k@archiver.kernel.org>; Tue, 26 Jan 2021 06:02:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5EF9122AAC
	for <linux-m68k@archiver.kernel.org>; Tue, 26 Jan 2021 06:02:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728856AbhAZGCC (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 26 Jan 2021 01:02:02 -0500
Received: from mail.kernel.org ([198.145.29.99]:45212 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728739AbhAYNZt (ORCPT <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 25 Jan 2021 08:25:49 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id C084822E03;
        Mon, 25 Jan 2021 13:24:48 +0000 (UTC)
Subject: Re: [PATCH] m68k: let clk_enable() return immediately if clk is NULL
To:     Defang Bo <bodefang@126.com>, geert@linux-m68k.org
Cc:     linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
References: <1609121265-207018-1-git-send-email-bodefang@126.com>
From:   Greg Ungerer <gerg@linux-m68k.org>
Message-ID: <963a69d9-34ac-085b-3756-95cc376fb7ca@linux-m68k.org>
Date:   Mon, 25 Jan 2021 23:24:45 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1609121265-207018-1-git-send-email-bodefang@126.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Defang,

On 28/12/20 12:07 pm, Defang Bo wrote:
> Similar to commit<742859adc721>("m68k: let clk_disable() return immediately if clk is NULL").
> there should be a check for clk to prevent NULL pointer dereference.
> 
> Signed-off-by: Defang Bo <bodefang@126.com>

I have applied this to the m68knommu git tree, for-next branch -
with blank line added as per Geert's suggestion.

Regards
Greg



> ---
>   arch/m68k/coldfire/clk.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/arch/m68k/coldfire/clk.c b/arch/m68k/coldfire/clk.c
> index 7bc666e..6decd11 100644
> --- a/arch/m68k/coldfire/clk.c
> +++ b/arch/m68k/coldfire/clk.c
> @@ -90,6 +90,9 @@ EXPORT_SYMBOL(clk_get);
>   int clk_enable(struct clk *clk)
>   {
>   	unsigned long flags;
> +	if (!clk)
> +		return -EINVAL;
> +
>   	spin_lock_irqsave(&clk_lock, flags);
>   	if ((clk->enabled++ == 0) && clk->clk_ops)
>   		clk->clk_ops->enable(clk);
> 
