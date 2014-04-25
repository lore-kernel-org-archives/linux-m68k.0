From: Michael Schmitz <schmitzmic@gmail.com>
Subject: Re: [PATCH] m68k: Increase initial mapping to 16MB if possible
Date: Fri, 25 Apr 2014 21:37:52 +1200
Message-ID: <535A2CF0.7000301@gmail.com>
References: <87ppk7m3db.fsf@igel.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pb0-f51.google.com ([209.85.160.51]:63824 "EHLO
	mail-pb0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751028AbaDYJiA (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 25 Apr 2014 05:38:00 -0400
Received: by mail-pb0-f51.google.com with SMTP id uo5so3011729pbc.10
        for <linux-m68k@vger.kernel.org>; Fri, 25 Apr 2014 02:37:59 -0700 (PDT)
In-Reply-To: <87ppk7m3db.fsf@igel.home>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org

Thanks Andreas,
> If the size of the first memory chunk is at least 16MB increase the
> initial mapping to 16MB instead of 4MB.  This makes it possible to map
> more memory in the first node without running out of space for the page
> tables.
>
>   

Minor nit - the Falcon has 14MB, not 16MB. Not sure how large ST-RAM was 
on the TTs - trying for 8MB as well might be safer?

Cheers,

    Michael

> Signed-off-by: Andreas Schwab <schwab@linux-m68k.org>
> ---
>  arch/m68k/kernel/head.S | 9 ++++++++-
>  arch/m68k/mm/motorola.c | 2 +-
>  2 files changed, 9 insertions(+), 2 deletions(-)
>
> diff --git a/arch/m68k/kernel/head.S b/arch/m68k/kernel/head.S
> index ac85f16..23091ea 100644
> --- a/arch/m68k/kernel/head.S
> +++ b/arch/m68k/kernel/head.S
> @@ -941,7 +941,14 @@ L(nocon):
>   *	First map the first 4 MB of kernel code & data
>   */
>  
> -	mmu_map	#PAGE_OFFSET,%pc@(L(phys_kernel_start)),#4*1024*1024,\
> +	get_bi_record BI_MEMCHUNK
> +	movel	%a0@(4),%d0
> +	movel	#16*1024*1024,%d1
> +	cmpl	%d0,%d1
> +	jls	1f
> +	lsrl	#1,%d1
>   
+	cmpl	%d0,%d1
+	jls	1f
+	lsrl	#1,%d1

> +1:
> +	mmu_map	#PAGE_OFFSET,%pc@(L(phys_kernel_start)),%d1,\
>  		%pc@(m68k_supervisor_cachemode)
>  
>  	putc	'C'
> diff --git a/arch/m68k/mm/motorola.c b/arch/m68k/mm/motorola.c
> index 251c543..0e4c3a9 100644
> --- a/arch/m68k/mm/motorola.c
> +++ b/arch/m68k/mm/motorola.c
> @@ -45,7 +45,7 @@ EXPORT_SYMBOL(mm_cachebits);
>  #endif
>  
>  /* size of memory already mapped in head.S */
> -#define INIT_MAPPED_SIZE	(4UL<<20)
> +#define INIT_MAPPED_SIZE	(m68k_memory[0].size >= 16UL<<20 ? 16UL<<20 : 4UL<<20)
>  
>  extern unsigned long availmem;
>  
>   
