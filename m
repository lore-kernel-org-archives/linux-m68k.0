From: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>
Subject: Re: [PATCH] m68k/atari: Call paging_init() before nf_init()
Date: Fri, 18 Oct 2013 20:29:35 +1300
Message-ID: <172f2b40c29a29a470215c14250a559e__29696.0650397979$1382081399$gmane$org@biophys.uni-duesseldorf.de>
References: <1382080184-19115-1-git-send-email-geert@linux-m68k.org>
Mime-Version: 1.0 (Apple Message framework v624)
Content-Type: text/plain; charset=US-ASCII; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1382080184-19115-1-git-send-email-geert@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org

Geert,

does your fiddling with memory blocks in bootinfo now result in kernels 
being possible to boot in FastRAM?

Cheers,

	Michael

> nf_init() uses virt_to_phys(), which depends on m68k_memoffset being 
> set and
> module_fixup() having been called, but this is only done in 
> paging_init().
> Hence call paging_init() before nf_init().
>
> This went unnoticed, as virt_to_phys() is a no-op on Atari, unless you 
> start
> fiddling with the memory blocks in the bootinfo manually.
>
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---
>  arch/m68k/kernel/setup_mm.c |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/m68k/kernel/setup_mm.c b/arch/m68k/kernel/setup_mm.c
> index 99cfe0577ad0..5b8ec4d5f8e8 100644
> --- a/arch/m68k/kernel/setup_mm.c
> +++ b/arch/m68k/kernel/setup_mm.c
> @@ -348,12 +348,12 @@ void __init setup_arch(char **cmdline_p)
>  		panic("No configuration setup");
>  	}
>
> +	paging_init();
> +
>  #ifdef CONFIG_NATFEAT
>  	nf_init();
>  #endif
>
> -	paging_init();
> -
>  #ifndef CONFIG_SUN3
>  	for (i = 1; i < m68k_num_memory; i++)
>  		free_bootmem_node(NODE_DATA(i), m68k_memory[i].addr,
> -- 
> 1.7.9.5
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-m68k" 
> in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
