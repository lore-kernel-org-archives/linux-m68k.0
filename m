From: Greg Ungerer <gregungerer@westnet.com.au>
Subject: Re: [RFC 4/8] m68k: m5441x: add ColdFire 5441x CPU MMU memory init
 code
Date: Wed, 08 Jul 2015 23:45:50 +1000
Message-ID: <559D298E.90009@westnet.com.au>
References: <1436349092-2214-1-git-send-email-yannick.gicquel@gmail.com> <1436349092-2214-5-git-send-email-yannick.gicquel@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from icp-osb-irony-out9.external.iinet.net.au ([203.59.1.226]:58189
	"EHLO icp-osb-irony-out9.external.iinet.net.au" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S932758AbbGHNpy (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 8 Jul 2015 09:45:54 -0400
In-Reply-To: <1436349092-2214-5-git-send-email-yannick.gicquel@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Yannick GICQUEL <yannick.gicquel@open.eurogiciel.org>, linux-m68k@vger.kernel.org

Hi Yannick,

On 08/07/15 19:51, Yannick GICQUEL wrote:
> This is same code as currently present in m54xx.c file which
> was initially integrated in 88be3515.
> This is not very elegant because of source code duplication
> but this do the job.

Perhaps moving into arch/m68k/mm/mcfmmu.c would be better?
No point having two complete copies of the same code.
And none if it is actually specific to the 54xx or 5441xx.

Regards
Greg


> Signed-off-by: Yannick GICQUEL <yannick.gicquel@gmail.com>
> ---
>   arch/m68k/coldfire/m5441x.c | 47 +++++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 47 insertions(+)
>
> diff --git a/arch/m68k/coldfire/m5441x.c b/arch/m68k/coldfire/m5441x.c
> index 98a13cc..5924a21 100644
> --- a/arch/m68k/coldfire/m5441x.c
> +++ b/arch/m68k/coldfire/m5441x.c
> @@ -16,6 +16,13 @@
>   #include <asm/mcfdma.h>
>   #include <asm/mcfclk.h>
>
> +#ifdef CONFIG_MMU
> +#include <linux/mm.h>
> +#include <linux/bootmem.h>
> +#include <asm/pgalloc.h>
> +#include <asm/mmu_context.h>
> +#endif
> +
>   DEFINE_CLK(0, "flexbus", 2, MCF_CLK);
>   DEFINE_CLK(0, "mcfcan.0", 8, MCF_CLK);
>   DEFINE_CLK(0, "mcfcan.1", 9, MCF_CLK);
> @@ -215,8 +222,48 @@ static void __init m5441x_fec_init(void)
>   	__raw_writeb(0x03, MCFGPIO_PAR_FEC);
>   }
>
> +
> +#ifdef CONFIG_MMU
> +
> +unsigned long num_pages;
> +
> +static void __init mcf54xx_bootmem_alloc(void)
> +{
> +	unsigned long start_pfn;
> +	unsigned long memstart;
> +
> +	/* _rambase and _ramend will be naturally page aligned */
> +	m68k_memory[0].addr = _rambase;
> +	m68k_memory[0].size = _ramend - _rambase;
> +
> +	/* compute total pages in system */
> +	num_pages = (_ramend - _rambase) >> PAGE_SHIFT;
> +
> +	/* page numbers */
> +	memstart = PAGE_ALIGN(_ramstart);
> +	min_low_pfn = _rambase >> PAGE_SHIFT;
> +	start_pfn = memstart >> PAGE_SHIFT;
> +	max_low_pfn = _ramend >> PAGE_SHIFT;
> +	high_memory = (void *)_ramend;
> +
> +	m68k_virt_to_node_shift = fls(_ramend - _rambase - 1) - 6;
> +	module_fixup(NULL, __start_fixup, __stop_fixup);
> +
> +	/* setup bootmem data */
> +	m68k_setup_node(0);
> +	memstart += init_bootmem_node(NODE_DATA(0), start_pfn,
> +		min_low_pfn, max_low_pfn);
> +	free_bootmem_node(NODE_DATA(0), memstart, _ramend - memstart);
> +}
> +#endif /* CONFIG_MMU */
> +
> +
>   void __init config_BSP(char *commandp, int size)
>   {
> +#ifdef CONFIG_MMU
> +	mcf54xx_bootmem_alloc();
> +	mmu_context_init();
> +#endif
>   	m5441x_clk_init();
>   	mach_sched_init = hw_timer_init;
>   	m5441x_uarts_init();
>
