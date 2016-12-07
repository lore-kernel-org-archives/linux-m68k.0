From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: [PATCH 18/22] m68k/mm: kmap - Modernize printing of kernel
 messages
Date: Thu, 8 Dec 2016 10:26:11 +1100 (AEDT)
Message-ID: <alpine.LNX.2.00.1612081022280.9219__40168.4585529894$1481153191$gmane$org@nippy.intranet>
References: <1481123360-10978-1-git-send-email-geert@linux-m68k.org> <1481123360-10978-19-git-send-email-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1481123360-10978-19-git-send-email-geert@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Greg Ungerer <gerg@linux-m68k.org>, Sam Creasey <sammy@sammy.net>, Joshua Thompson <funaho@jurai.org>, linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org


On Wed, 7 Dec 2016, Geert Uytterhoeven wrote:

>   - Convert from printk() to pr_*(),
>   - Add missing continuations,
>   - Remove #undef DEBUG.
> 
> Note that "#ifdef DEBUG" is sometimes retained because pr_cont() is not
> optimized away when debugging is disabled.
> 

I think that argues for using printk(KERN_DEBUG ...) and print(KERN_CONT 
...) inside #ifdef DEBUG, which would need no explanation.

If instead you use a combination of pr_debug and pr_cont and #ifdef DEBUG, 
perhaps the explanation should be moved from the commit log to a comment 
in the code?

-- 

> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---
>  arch/m68k/mm/kmap.c | 26 ++++++++++++--------------
>  1 file changed, 12 insertions(+), 14 deletions(-)
> 
> diff --git a/arch/m68k/mm/kmap.c b/arch/m68k/mm/kmap.c
> index 6e4955bc542bfc59..ce4773461651656a 100644
> --- a/arch/m68k/mm/kmap.c
> +++ b/arch/m68k/mm/kmap.c
> @@ -21,8 +21,6 @@
>  #include <asm/pgalloc.h>
>  #include <asm/io.h>
>  
> -#undef DEBUG
> -
>  #define PTRTREESIZE	(256*1024)
>  
>  /*
> @@ -125,9 +123,7 @@ void __iomem *__ioremap(unsigned long physaddr, unsigned long size, int cachefla
>  	}
>  #endif
>  
> -#ifdef DEBUG
> -	printk("ioremap: 0x%lx,0x%lx(%d) - ", physaddr, size, cacheflag);
> -#endif
> +	pr_debug("ioremap: 0x%lx,0x%lx(%d) - ", physaddr, size, cacheflag);
>  	/*
>  	 * Mappings have to be aligned
>  	 */
> @@ -145,7 +141,7 @@ void __iomem *__ioremap(unsigned long physaddr, unsigned long size, int cachefla
>  	virtaddr = (unsigned long)area->addr;
>  	retaddr = virtaddr + offset;
>  #ifdef DEBUG
> -	printk("0x%lx,0x%lx,0x%lx", physaddr, virtaddr, retaddr);
> +	pr_cont("0x%lx,0x%lx,0x%lx", physaddr, virtaddr, retaddr);
>  #endif
>  
>  	/*
> @@ -187,12 +183,12 @@ void __iomem *__ioremap(unsigned long physaddr, unsigned long size, int cachefla
>  	while ((long)size > 0) {
>  #ifdef DEBUG
>  		if (!(virtaddr & (PTRTREESIZE-1)))
> -			printk ("\npa=%#lx va=%#lx ", physaddr, virtaddr);
> +			pr_info("\npa=%#lx va=%#lx ", physaddr, virtaddr);
>  #endif
>  		pgd_dir = pgd_offset_k(virtaddr);
>  		pmd_dir = pmd_alloc(&init_mm, pgd_dir, virtaddr);
>  		if (!pmd_dir) {
> -			printk("ioremap: no mem for pmd_dir\n");
> +			pr_err("ioremap: no mem for pmd_dir\n");
>  			return NULL;
>  		}
>  
> @@ -204,7 +200,7 @@ void __iomem *__ioremap(unsigned long physaddr, unsigned long size, int cachefla
>  		} else {
>  			pte_dir = pte_alloc_kernel(pmd_dir, virtaddr);
>  			if (!pte_dir) {
> -				printk("ioremap: no mem for pte_dir\n");
> +				pr_err("ioremap: no mem for pte_dir\n");
>  				return NULL;
>  			}
>  
> @@ -215,7 +211,7 @@ void __iomem *__ioremap(unsigned long physaddr, unsigned long size, int cachefla
>  		}
>  	}
>  #ifdef DEBUG
> -	printk("\n");
> +	pr_cont("\n");
>  #endif
>  	flush_tlb_all();
>  
> @@ -254,7 +250,7 @@ void __iounmap(void *addr, unsigned long size)
>  	while ((long)size > 0) {
>  		pgd_dir = pgd_offset_k(virtaddr);
>  		if (pgd_bad(*pgd_dir)) {
> -			printk("iounmap: bad pgd(%08lx)\n", pgd_val(*pgd_dir));
> +			pr_err("iounmap: bad pgd(%08lx)\n", pgd_val(*pgd_dir));
>  			pgd_clear(pgd_dir);
>  			return;
>  		}
> @@ -274,7 +270,7 @@ void __iounmap(void *addr, unsigned long size)
>  		}
>  
>  		if (pmd_bad(*pmd_dir)) {
> -			printk("iounmap: bad pmd (%08lx)\n", pmd_val(*pmd_dir));
> +			pr_err("iounmap: bad pmd (%08lx)\n", pmd_val(*pmd_dir));
>  			pmd_clear(pmd_dir);
>  			return;
>  		}
> @@ -332,7 +328,8 @@ void kernel_set_cachemode(void *addr, unsigned long size, int cmode)
>  	while ((long)size > 0) {
>  		pgd_dir = pgd_offset_k(virtaddr);
>  		if (pgd_bad(*pgd_dir)) {
> -			printk("iocachemode: bad pgd(%08lx)\n", pgd_val(*pgd_dir));
> +			pr_err("iocachemode: bad pgd(%08lx)\n",
> +			       pgd_val(*pgd_dir));
>  			pgd_clear(pgd_dir);
>  			return;
>  		}
> @@ -351,7 +348,8 @@ void kernel_set_cachemode(void *addr, unsigned long size, int cmode)
>  		}
>  
>  		if (pmd_bad(*pmd_dir)) {
> -			printk("iocachemode: bad pmd (%08lx)\n", pmd_val(*pmd_dir));
> +			pr_err("iocachemode: bad pmd (%08lx)\n",
> +			       pmd_val(*pmd_dir));
>  			pmd_clear(pmd_dir);
>  			return;
>  		}
> 
