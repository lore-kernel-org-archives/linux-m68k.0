Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14568C433DB
	for <linux-m68k@archiver.kernel.org>; Fri,  5 Mar 2021 12:18:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BE9F364F23
	for <linux-m68k@archiver.kernel.org>; Fri,  5 Mar 2021 12:18:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229528AbhCEMSH (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 5 Mar 2021 07:18:07 -0500
Received: from mail.kernel.org ([198.145.29.99]:57202 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229517AbhCEMSH (ORCPT <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 5 Mar 2021 07:18:07 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3350B64FED;
        Fri,  5 Mar 2021 12:18:04 +0000 (UTC)
Subject: Re: [PATCH v2] m68k: Fix virt_addr_valid() W=1 compiler warnings
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-m68k@lists.linux-m68k.org
Cc:     Lee Jones <lee.jones@linaro.org>, Arnd Bergmann <arnd@arndb.de>
References: <20210305084122.4118826-1-geert@linux-m68k.org>
From:   Greg Ungerer <gerg@linux-m68k.org>
Message-ID: <cddee974-5d88-57cf-b039-439292e542bf@linux-m68k.org>
Date:   Fri, 5 Mar 2021 22:18:02 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210305084122.4118826-1-geert@linux-m68k.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org


On 5/3/21 6:41 pm, Geert Uytterhoeven wrote:
> If CONFIG_DEBUG_SG=y, and CONFIG_MMU=y:
> 
>      include/linux/scatterlist.h: In function ‘sg_set_buf’:
>      arch/m68k/include/asm/page_mm.h:174:49: warning: ordered comparison of pointer with null pointer [-Wextra]
>        174 | #define virt_addr_valid(kaddr) ((void *)(kaddr) >= (void *)PAGE_OFFSET && (void *)(kaddr) < high_memory)
> 	  |                                                 ^~
> 
> or CONFIG_MMU=n:
> 
>      include/linux/scatterlist.h: In function ‘sg_set_buf’:
>      arch/m68k/include/asm/page_no.h:33:50: warning: ordered comparison of pointer with null pointer [-Wextra]
>         33 | #define virt_addr_valid(kaddr) (((void *)(kaddr) >= (void *)PAGE_OFFSET) && \
> 	  |                                                  ^~
> 
> Fix this by doing the comparison in the "unsigned long" instead of the
> "void *" domain.
> 
> Note that for now this is only seen when compiling btrfs, due to commit
> e9aa7c285d20a69c ("btrfs: enable W=1 checks for btrfs"), but as people
> are doing more W=1 compile testing, it will start to show up elsewhere,
> too.
> 
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>

Acked-by: Greg Ungerer <gerg@linux-m68k.org>


> ---
> To be queued as a fix for v5.12.
> 
> v2:
>    - Fix bracing in MMU version.
> ---
>   arch/m68k/include/asm/page_mm.h | 2 +-
>   arch/m68k/include/asm/page_no.h | 4 ++--
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/m68k/include/asm/page_mm.h b/arch/m68k/include/asm/page_mm.h
> index 7f5912af2a52ea0a..9e8f0cc30a2ccb9d 100644
> --- a/arch/m68k/include/asm/page_mm.h
> +++ b/arch/m68k/include/asm/page_mm.h
> @@ -171,7 +171,7 @@ static inline __attribute_const__ int __virt_to_node_shift(void)
>   #include <asm-generic/memory_model.h>
>   #endif
>   
> -#define virt_addr_valid(kaddr)	((void *)(kaddr) >= (void *)PAGE_OFFSET && (void *)(kaddr) < high_memory)
> +#define virt_addr_valid(kaddr)	((unsigned long)(kaddr) >= PAGE_OFFSET && (unsigned long)(kaddr) < (unsigned long)high_memory)
>   #define pfn_valid(pfn)		virt_addr_valid(pfn_to_virt(pfn))
>   
>   #endif /* __ASSEMBLY__ */
> diff --git a/arch/m68k/include/asm/page_no.h b/arch/m68k/include/asm/page_no.h
> index 6bbe52025de3c5c6..8d0f862ee9d79532 100644
> --- a/arch/m68k/include/asm/page_no.h
> +++ b/arch/m68k/include/asm/page_no.h
> @@ -30,8 +30,8 @@ extern unsigned long memory_end;
>   #define page_to_pfn(page)	virt_to_pfn(page_to_virt(page))
>   #define pfn_valid(pfn)	        ((pfn) < max_mapnr)
>   
> -#define	virt_addr_valid(kaddr)	(((void *)(kaddr) >= (void *)PAGE_OFFSET) && \
> -				((void *)(kaddr) < (void *)memory_end))
> +#define	virt_addr_valid(kaddr)	(((unsigned long)(kaddr) >= PAGE_OFFSET) && \
> +				((unsigned long)(kaddr) < memory_end))
>   
>   #endif /* __ASSEMBLY__ */
>   
> 
