From: Greg Ungerer <gerg@uclinux.org>
Subject: Re: [PATCH v2] m68k/coldfire: use PFN_DOWN macro
Date: Thu, 13 Aug 2015 10:27:38 +1000
Message-ID: <55CBE47A.5020003@uclinux.org>
References: <1439363699-1803-1-git-send-email-kuleshovmail@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1439363699-1803-1-git-send-email-kuleshovmail@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Alexander Kuleshov <kuleshovmail@gmail.com>, Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org

Hi Alexander,

On 12/08/15 17:14, Alexander Kuleshov wrote:
> Replace ((x) >> PAGE_SHIFT) with the predefined PFN_DOWN macro.
> 
> Signed-off-by: Alexander Kuleshov <kuleshovmail@gmail.com>

This one looks good. Applied to m68knommu git tree (for-next branch).

Thanks
Greg


> ---
>  arch/m68k/coldfire/m54xx.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/m68k/coldfire/m54xx.c b/arch/m68k/coldfire/m54xx.c
> index 075aaab..f7836c6 100644
> --- a/arch/m68k/coldfire/m54xx.c
> +++ b/arch/m68k/coldfire/m54xx.c
> @@ -25,6 +25,7 @@
>  #include <asm/m54xxgpt.h>
>  #ifdef CONFIG_MMU
>  #include <asm/mmu_context.h>
> +#include <linux/pfn.h>
>  #endif
>  
>  /***************************************************************************/
> @@ -91,13 +92,13 @@ static void __init mcf54xx_bootmem_alloc(void)
>  	m68k_memory[0].size = _ramend - _rambase;
>  
>  	/* compute total pages in system */
> -	num_pages = (_ramend - _rambase) >> PAGE_SHIFT;
> +	num_pages = PFN_DOWN(_ramend - _rambase);
>  
>  	/* page numbers */
>  	memstart = PAGE_ALIGN(_ramstart);
> -	min_low_pfn = _rambase >> PAGE_SHIFT;
> -	start_pfn = memstart >> PAGE_SHIFT;
> -	max_low_pfn = _ramend >> PAGE_SHIFT;
> +	min_low_pfn = PFN_DOWN(_rambase);
> +	start_pfn = PFN_DOWN(memstart);
> +	max_low_pfn = PFN_DOWN(_ramend);
>  	high_memory = (void *)_ramend;
>  
>  	m68k_virt_to_node_shift = fls(_ramend - _rambase - 1) - 6;
> 
