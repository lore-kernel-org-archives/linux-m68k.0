From: Greg Ungerer <gerg@uclinux.org>
Subject: Re: [PATCH] m68k/coldfire: flush cache when creating the signal stack
 frame
Date: Tue, 30 Jul 2013 16:41:43 +1000
Message-ID: <51F76027.604@uclinux.org>
References: <1370432559-31711-1-git-send-email-alexander.stein@systec-electronic.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1370432559-31711-1-git-send-email-alexander.stein@systec-electronic.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Alexander Stein <alexander.stein@systec-electronic.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@lists.linux-m68k.org

Hi Alexander,

On 05/06/13 21:42, Alexander Stein wrote:
> When the signal stack frame is created, it must be flushed in order to
> make sure the cache fetches the correct data.
> Without cache flush the icache might pick up old cached data from an older
> signal stack frame if the signal is raised again very fast.
> In case of copyback the data cache muist be pushed first, but is untested.
> 
> Signed-off-by: Alexander Stein <alexander.stein@systec-electronic.com>

Sorry for the delay.

I haven't been able to actually test it, I can't get the M5475 to
boot in copyback cache mode at the moment. I need to debug it and
figure out why it is broken.

For now I think the best is if I push it into for-next on the
m68knommu git tree.

(Aside it looks like the clear_cf_icache call here is a bit bogus.
It takes cache line number args, not virtual addresses - it works
here because clear_cf_cache invalidates the whole icache... :-(

Regards
Greg


> ---
>  arch/m68k/kernel/signal.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/m68k/kernel/signal.c b/arch/m68k/kernel/signal.c
> index 2a16df3..57fd286 100644
> --- a/arch/m68k/kernel/signal.c
> +++ b/arch/m68k/kernel/signal.c
> @@ -50,6 +50,7 @@
>  #include <asm/pgtable.h>
>  #include <asm/traps.h>
>  #include <asm/ucontext.h>
> +#include <asm/cacheflush.h>
>  
>  #ifdef CONFIG_MMU
>  
> @@ -181,6 +182,13 @@ static inline void push_cache (unsigned long vaddr)
>  		asm volatile ("movec %0,%%caar\n\t"
>  			      "movec %1,%%cacr"
>  			      : : "r" (vaddr + 4), "r" (temp));
> +	} else {
> +		/* CPU_IS_COLDFIRE */
> +#if defined(CONFIG_CACHE_COPYBACK)
> +		flush_cf_dcache(0, DCACHE_MAX_ADDR);
> +#endif
> +		/* Invalidate instruction cache for the pushed bytes */
> +		clear_cf_icache(vaddr, vaddr + 8);
>  	}
>  }
>  
> 
