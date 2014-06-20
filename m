From: Greg Ungerer <gerg@uclinux.org>
Subject: Re: [PATCH] m68knommu: Correct page_to_phys when PAGE_OFFSET is non-zero.
Date: Fri, 20 Jun 2014 15:16:19 +1000
Message-ID: <53A3C3A3.6040007@uclinux.org>
References: <201406112001.10513.sfking@fdwdc.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from icp-osb-irony-out5.external.iinet.net.au ([203.59.1.221]:51327
	"EHLO icp-osb-irony-out5.external.iinet.net.au" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S933503AbaFTFQX (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>);
	Fri, 20 Jun 2014 01:16:23 -0400
In-Reply-To: <201406112001.10513.sfking@fdwdc.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Steven King <sfking@fdwdc.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@vger.kernel.org


Hi Steven,

On 12/06/14 13:01, Steven King wrote:
> The definition of page_to_phys for nommu produces an incorrect value when
> PAGE_OFFSET is non-zero.  The nommu version of page_to_pfn works correctly
> for non-zero PAGE_OFFSET, so use that instead.
>
> Signed-off-by: Steven King <sfking@fdwdc.com>


Looks good, thanks. Applied to m68knommu git tree, for-next branch.

Regards
Greg



> ---
>   arch/m68k/include/asm/virtconvert.h |    6 +-----
>   1 file changed, 1 insertion(+), 5 deletions(-)
>
> diff --git a/arch/m68k/include/asm/virtconvert.h b/arch/m68k/include/asm/virtconvert.h
> index f35229b..b8a82fb 100644
> --- a/arch/m68k/include/asm/virtconvert.h
> +++ b/arch/m68k/include/asm/virtconvert.h
> @@ -26,16 +26,12 @@ static inline void *phys_to_virt(unsigned long address)
>   }
>
>   /* Permanent address of a page. */
> -#ifdef CONFIG_MMU
> -#ifdef CONFIG_SINGLE_MEMORY_CHUNK
> +#if defined(CONFIG_MMU) && defined(CONFIG_SINGLE_MEMORY_CHUNK)
>   #define page_to_phys(page) \
>   	__pa(PAGE_OFFSET + (((page) - pg_data_map[0].node_mem_map) << PAGE_SHIFT))
>   #else
>   #define page_to_phys(page)	(page_to_pfn(page) << PAGE_SHIFT)
>   #endif
> -#else
> -#define page_to_phys(page)	(((page) - mem_map) << PAGE_SHIFT)
> -#endif
>
>   /*
>    * IO bus memory addresses are 1:1 with the physical address,
>
