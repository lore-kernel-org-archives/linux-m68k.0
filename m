From: Greg Ungerer <gerg@snapgear.com>
Subject: Re: [PATCH] m68knommu: Clean up printing of sections
Date: Fri, 1 Jun 2012 16:01:10 +1000
Message-ID: <4FC85AA6.5050308__25274.2797522389$1338530801$gmane$org@snapgear.com>
References: <1338495834-2468-1-git-send-email-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1338495834-2468-1-git-send-email-geert@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Greg Ungerer <gerg@uclinux.org>, linux-m68k@lists.linux-m68k.org, uclinux-dev@uclinux.org

Hi Geert,

On 01/06/12 06:23, Geert Uytterhoeven wrote:
>    - Remove casts and unneeded address-of ('&') operators,
>    - Use %p to format pointers, %lx to format unsigned longs.
>
> Signed-off-by: Geert Uytterhoeven<geert@linux-m68k.org>

Looks good. Compile and run tested, all ok.

Acked-by: Greg Ungerer <gerg@uclinux.org>

Regards
Greg


> ---
> Not even compile tested
>
>   arch/m68k/kernel/setup_no.c |   11 ++++-------
>   1 files changed, 4 insertions(+), 7 deletions(-)
>
> diff --git a/arch/m68k/kernel/setup_no.c b/arch/m68k/kernel/setup_no.c
> index 7dc186b..8a624ec 100644
> --- a/arch/m68k/kernel/setup_no.c
> +++ b/arch/m68k/kernel/setup_no.c
> @@ -218,13 +218,10 @@ void __init setup_arch(char **cmdline_p)
>   	printk(KERN_INFO "Motorola M5235EVB support (C)2005 Syn-tech Systems, Inc. (Jate Sujjavanich)\n");
>   #endif
>
> -	pr_debug("KERNEL ->  TEXT=0x%06x-0x%06x DATA=0x%06x-0x%06x "
> -		 "BSS=0x%06x-0x%06x\n", (int)&_stext, (int)&_etext,
> -		 (int)&_sdata, (int)&_edata,
> -		 (int)&_sbss, (int)&_ebss);
> -	pr_debug("MEMORY ->  ROMFS=0x%06x-0x%06x MEM=0x%06x-0x%06x\n ",
> -		 (int)&_ebss, (int) memory_start,
> -		 (int) memory_start, (int) memory_end);
> +	pr_debug("KERNEL ->  TEXT=0x%p-0x%p DATA=0x%p-0x%p BSS=0x%p-0x%p\n",
> +		 _stext, _etext, _sdata, _edata, _sbss, _ebss);
> +	pr_debug("MEMORY ->  ROMFS=0x%p-0x%06lx MEM=0x%06lx-0x%06lx\n ",
> +		 _ebss, memory_start, memory_start, memory_end);
>
>   	/* Keep a copy of command line */
>   	*cmdline_p =&command_line[0];


-- 
------------------------------------------------------------------------
Greg Ungerer  --  Principal Engineer        EMAIL:     gerg@snapgear.com
SnapGear Group, McAfee                      PHONE:       +61 7 3435 2888
8 Gardner Close                             FAX:         +61 7 3217 5323
Milton, QLD, 4064, Australia                WEB: http://www.SnapGear.com
