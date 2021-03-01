Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97718C433DB
	for <linux-m68k@archiver.kernel.org>; Tue,  2 Mar 2021 12:35:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 491E264F0D
	for <linux-m68k@archiver.kernel.org>; Tue,  2 Mar 2021 12:35:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244889AbhCBMYI (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 2 Mar 2021 07:24:08 -0500
Received: from mail.kernel.org ([198.145.29.99]:55120 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1345670AbhCAX1F (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
        Mon, 1 Mar 2021 18:27:05 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 897E960200;
        Mon,  1 Mar 2021 23:26:22 +0000 (UTC)
Subject: Re: [PATCH v2] m68k: fix flatmem memory model setup
To:     Angelo Dureghello <angelo@kernel-space.org>
Cc:     akpm@linux-foundation.org, rppt@linux.ibm.com,
        linux-m68k@vger.kernel.org
References: <20210228190828.392974-1-angelo@kernel-space.org>
From:   Greg Ungerer <gerg@linux-m68k.org>
Message-ID: <6f97d6d2-be58-ed98-43f9-d55327c76f23@linux-m68k.org>
Date:   Tue, 2 Mar 2021 09:26:17 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210228190828.392974-1-angelo@kernel-space.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Angelo,

On 1/3/21 5:08 am, Angelo Dureghello wrote:
> Detected a broken boot on mcf54415, likely introduced from
> 
> commit 4bfc848e0981
> ("m68k/mm: enable use of generic memory_model.h for !DISCONTIGMEM")
> 
> Fix ARCH_PFN_OFFSET to be a pfn.
> 
> Signed-off-by: Angelo Dureghello <angelo@kernel-space.org>

Thanks. I will add to the for-next (and for-linus) branches of
the m68knommu git tree - with Mike's Acked-by.

If no issues show up I'll get this to Linus in the next week
or two.

Thanks
Greg


> ---
> Change for v2:
> - replace PAGE_OFFSET with m68k_memory[0].addr
> ---
>   arch/m68k/include/asm/page_mm.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/m68k/include/asm/page_mm.h b/arch/m68k/include/asm/page_mm.h
> index 8cfc92451711..1c683ce57d48 100644
> --- a/arch/m68k/include/asm/page_mm.h
> +++ b/arch/m68k/include/asm/page_mm.h
> @@ -167,7 +167,7 @@ static inline __attribute_const__ int __virt_to_node_shift(void)
>   	((__p) - pgdat->node_mem_map) + pgdat->node_start_pfn;		\
>   })
>   #else
> -#define ARCH_PFN_OFFSET (m68k_memory[0].addr)
> +#define ARCH_PFN_OFFSET (m68k_memory[0].addr >> PAGE_SHIFT)
>   #include <asm-generic/memory_model.h>
>   #endif
>   
> 

