From: Alexander Stein <alexander.stein@systec-electronic.com>
Subject: Re: [PATCH] m68k/coldfire: flush cache when creating the signal stack frame
Date: Thu, 04 Jul 2013 07:54:51 +0200
Message-ID: <1525076.03WGtcQxAz@ws-stein>
References: <1370432559-31711-1-git-send-email-alexander.stein@systec-electronic.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1370432559-31711-1-git-send-email-alexander.stein@systec-electronic.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Greg Ungerer <gerg@uclinux.org>, linux-m68k@lists.linux-m68k.org

Any feedback on this?

On Wednesday 05 June 2013 13:42:39, Alexander Stein wrote:
> When the signal stack frame is created, it must be flushed in order to
> make sure the cache fetches the correct data.
> Without cache flush the icache might pick up old cached data from an older
> signal stack frame if the signal is raised again very fast.
> In case of copyback the data cache muist be pushed first, but is untested.
> 
> Signed-off-by: Alexander Stein <alexander.stein@systec-electronic.com>
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
-- 
Dipl.-Inf. Alexander Stein

SYS TEC electronic GmbH
Am Windrad 2
08468 Heinsdorfergrund
Tel.: 03765 38600-1156
Fax: 03765 38600-4100
Email: alexander.stein@systec-electronic.com
Website: www.systec-electronic.com
 
Managing Director: Dipl.-Phys. Siegmar Schmidt
Commercial registry: Amtsgericht Chemnitz, HRB 28082
