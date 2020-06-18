Return-Path: <SRS0=LIUq=77=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 007CAC433E1
	for <linux-m68k@archiver.kernel.org>; Thu, 18 Jun 2020 11:48:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D600C20890
	for <linux-m68k@archiver.kernel.org>; Thu, 18 Jun 2020 11:48:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728161AbgFRLsr (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 18 Jun 2020 07:48:47 -0400
Received: from mail.kernel.org ([198.145.29.99]:41220 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727788AbgFRLsr (ORCPT <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 18 Jun 2020 07:48:47 -0400
Received: from [192.168.0.106] (193-116-96-121.tpgi.com.au [193.116.96.121])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8C05220884;
        Thu, 18 Jun 2020 11:48:45 +0000 (UTC)
Subject: Re: [PATCH] m68k: mcfmmu: remove stale part of comment about
 steal_context
To:     Mike Rapoport <rppt@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org, Mike Rapoport <rppt@linux.ibm.com>
References: <20200618081727.4741-1-rppt@kernel.org>
From:   Greg Ungerer <gerg@linux-m68k.org>
Message-ID: <bb70270a-5634-f258-f144-9410e8baf068@linux-m68k.org>
Date:   Thu, 18 Jun 2020 21:48:42 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200618081727.4741-1-rppt@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Mike,

On 18/6/20 6:17 pm, Mike Rapoport wrote:
> From: Mike Rapoport <rppt@linux.ibm.com>
> 
> The comment about steal_context() came from powerpc and a part of it
> addresses differences between powerpc variants that are not really
> relevant to m68k.
> 
> Remove that part of the comment.
> 
> Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>

Acked-by: Greg Ungerer <gerg@linux-m68k.org>

Do you want me to carry that in my m68k (m68knommu) tree for v5.9?

Regards
Greg


> ---
> Hi,
> 
> I've found this by pure chance while grepping for pgalloc.h
> It's been there since 2011, but I don't think it's a stable material, so I
> didn't cc them.
> 
>   arch/m68k/mm/mcfmmu.c | 5 -----
>   1 file changed, 5 deletions(-)
> 
> diff --git a/arch/m68k/mm/mcfmmu.c b/arch/m68k/mm/mcfmmu.c
> index 29f47923aa46..cb9f8675d81b 100644
> --- a/arch/m68k/mm/mcfmmu.c
> +++ b/arch/m68k/mm/mcfmmu.c
> @@ -214,11 +214,6 @@ void __init cf_mmu_context_init(void)
>   
>   /*
>    * Steal a context from a task that has one at the moment.
> - * This is only used on 8xx and 4xx and we presently assume that
> - * they don't do SMP.  If they do then thicfpgalloc.hs will have to check
> - * whether the MM we steal is in use.
> - * We also assume that this is only used on systems that don't
> - * use an MMU hash table - this is true for 8xx and 4xx.
>    * This isn't an LRU system, it just frees up each context in
>    * turn (sort-of pseudo-random replacement :).  This would be the
>    * place to implement an LRU scheme if anyone was motivated to do it.
> 
