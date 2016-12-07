From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: [PATCH 03/22] m68k/mac: via - Modernize printing of kernel
 messages
Date: Thu, 8 Dec 2016 09:48:22 +1100 (AEDT)
Message-ID: <alpine.LNX.2.00.1612080946340.9219@nippy.intranet>
References: <1481123360-10978-1-git-send-email-geert@linux-m68k.org> <1481123360-10978-4-git-send-email-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1481123360-10978-4-git-send-email-geert@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Greg Ungerer <gerg@linux-m68k.org>, Sam Creasey <sammy@sammy.net>, Joshua Thompson <funaho@jurai.org>, linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org


On Wed, 7 Dec 2016, Geert Uytterhoeven wrote:

>   - Introduce helpers for printing debug messages, incl. dummies for
>     validating format strings when debugging is disabled,
>   - Convert from printk() to pr_*(),
>   - Add missing continuations, to fix user-visible breakage,
>   - Drop superfluous casts.
> 
> Fixes: 4bcc595ccd80decb ("printk: reinstate KERN_CONT for printing continuation lines")
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---
>  arch/m68k/mac/via.c | 54 ++++++++++++++++++++++++++---------------------------
>  1 file changed, 27 insertions(+), 27 deletions(-)
> 
> diff --git a/arch/m68k/mac/via.c b/arch/m68k/mac/via.c
> index 920ff63d4a81d77a..7c53b10d93817d9c 100644
> --- a/arch/m68k/mac/via.c
> +++ b/arch/m68k/mac/via.c
> @@ -36,6 +36,12 @@
>  #include <asm/mac_psc.h>
>  #include <asm/mac_oss.h>
>  
> +#ifdef DEBUG_IRQUSE
> +#define pr_irq(fmt, ...) printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
> +#else
> +#define pr_irq(fmt, ...) no_printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
> +#endif
> +
>  volatile __u8 *via1, *via2;
>  int rbv_present;
>  int via_alt_mapping;

I'd prefer to drop the DEBUG_IRQUSE macro and the debug output it 
controls.

> @@ -168,15 +174,15 @@ void __init via_init(void)
>  			panic("UNKNOWN VIA TYPE");
>  	}
>  
> -	printk(KERN_INFO "VIA1 at %p is a 6522 or clone\n", via1);
> +	pr_info("VIA1 at %p is a 6522 or clone\n", via1);
>  
> -	printk(KERN_INFO "VIA2 at %p is ", via2);
> +	pr_info("VIA2 at %p is ", via2);
>  	if (rbv_present) {
> -		printk("an RBV\n");
> +		pr_cont("an RBV\n");
>  	} else if (oss_present) {
> -		printk("an OSS\n");
> +		pr_cont("an OSS\n");
>  	} else {
> -		printk("a 6522 or clone\n");
> +		pr_cont("a 6522 or clone\n");
>  	}
>  
>  #ifdef DEBUG_VIA
> @@ -299,24 +305,22 @@ void __init via_init_clock(irq_handler_t func)
>  
>  void via_debug_dump(void)
>  {
> -	printk(KERN_DEBUG "VIA1: DDRA = 0x%02X DDRB = 0x%02X ACR = 0x%02X\n",
> -		(uint) via1[vDirA], (uint) via1[vDirB], (uint) via1[vACR]);
> -	printk(KERN_DEBUG "         PCR = 0x%02X  IFR = 0x%02X IER = 0x%02X\n",
> -		(uint) via1[vPCR], (uint) via1[vIFR], (uint) via1[vIER]);
> +	pr_debug("VIA1: DDRA = 0x%02X DDRB = 0x%02X ACR = 0x%02X\n",
> +		 via1[vDirA], via1[vDirB], via1[vACR]);
> +	pr_debug("       PCR = 0x%02X  IFR = 0x%02X IER = 0x%02X\n",
> +		 via1[vPCR], via1[vIFR], via1[vIER]);
>  	if (oss_present) {
> -		printk(KERN_DEBUG "VIA2: <OSS>\n");
> +		pr_debug("VIA2: <OSS>\n");
>  	} else if (rbv_present) {
> -		printk(KERN_DEBUG "VIA2:  IFR = 0x%02X  IER = 0x%02X\n",
> -			(uint) via2[rIFR], (uint) via2[rIER]);
> -		printk(KERN_DEBUG "      SIFR = 0x%02X SIER = 0x%02X\n",
> -			(uint) via2[rSIFR], (uint) via2[rSIER]);
> +		pr_debug("VIA2:  IFR = 0x%02X  IER = 0x%02X\n", via2[rIFR],
> +			 via2[rIER]);
> +		pr_debug("      SIFR = 0x%02X SIER = 0x%02X\n", via2[rSIFR],
> +			 via2[rSIER]);
>  	} else {
> -		printk(KERN_DEBUG "VIA2: DDRA = 0x%02X DDRB = 0x%02X ACR = 0x%02X\n",
> -			(uint) via2[vDirA], (uint) via2[vDirB],
> -			(uint) via2[vACR]);
> -		printk(KERN_DEBUG "         PCR = 0x%02X  IFR = 0x%02X IER = 0x%02X\n",
> -			(uint) via2[vPCR],
> -			(uint) via2[vIFR], (uint) via2[vIER]);
> +		pr_debug("VIA2: DDRA = 0x%02X DDRB = 0x%02X ACR = 0x%02X\n",
> +			 via2[vDirA], via2[vDirB], via2[vACR]);
> +		pr_debug("       PCR = 0x%02X  IFR = 0x%02X IER = 0x%02X\n",
> +			 via2[vPCR], via2[vIFR], via2[vIER]);
>  	}
>  }
>  

I think these should remain printk(KERN_DEBUG, ...).

> @@ -362,7 +366,7 @@ int via_get_cache_disable(void)
>  {
>  	/* Safeguard against being called accidentally */
>  	if (!via2) {
> -		printk(KERN_ERR "via_get_cache_disable called on a non-VIA machine!\n");
> +		pr_err("via_get_cache_disable called on a non-VIA machine!\n");
>  		return 1;
>  	}
>  
> @@ -550,9 +554,7 @@ void via_irq_enable(int irq) {
>  	int irq_src	= IRQ_SRC(irq);
>  	int irq_idx	= IRQ_IDX(irq);
>  
> -#ifdef DEBUG_IRQUSE
> -	printk(KERN_DEBUG "via_irq_enable(%d)\n", irq);
> -#endif
> +	pr_irq("via_irq_enable(%d)\n", irq);
>  
>  	if (irq_src == 1) {
>  		via1[vIER] = IER_SET_BIT(irq_idx);
> @@ -582,9 +584,7 @@ void via_irq_disable(int irq) {
>  	int irq_src	= IRQ_SRC(irq);
>  	int irq_idx	= IRQ_IDX(irq);
>  
> -#ifdef DEBUG_IRQUSE
> -	printk(KERN_DEBUG "via_irq_disable(%d)\n", irq);
> -#endif
> +	pr_irq("via_irq_disable(%d)\n", irq);
>  
>  	if (irq_src == 1) {
>  		via1[vIER] = IER_CLR_BIT(irq_idx);
> 

-- 
