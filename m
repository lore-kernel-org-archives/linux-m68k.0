From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: [PATCH 06/22] m68k/coldfire: Modernize printing of kernel
 messages
Date: Thu, 8 Dec 2016 09:53:08 +1100 (AEDT)
Message-ID: <alpine.LNX.2.00.1612080949540.9219__21085.4663899683$1481151194$gmane$org@nippy.intranet>
References: <1481123360-10978-1-git-send-email-geert@linux-m68k.org> <1481123360-10978-7-git-send-email-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1481123360-10978-7-git-send-email-geert@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Greg Ungerer <gerg@linux-m68k.org>, Sam Creasey <sammy@sammy.net>, Joshua Thompson <funaho@jurai.org>, linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org


On Wed, 7 Dec 2016, Geert Uytterhoeven wrote:

>   - Introduce helpers for printing debug messages, incl. dummies for
>     validating format strings when debugging is disabled,
>   - Convert from printk() to pr_*(),
>   - Correct printf()-style format specifiers,
>   - Drop superfluous casts,
> 
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---
>  arch/m68k/coldfire/m528x.c          |  4 +-
>  arch/m68k/coldfire/sltimers.c       |  4 +-
>  arch/m68k/coldfire/timers.c         |  4 +-
>  arch/m68k/coldfire/vectors.c        |  2 +-
>  arch/m68k/include/asm/dma.h         | 98 +++++++++++++------------------------
>  arch/m68k/include/asm/mcf_pgtable.h |  9 ++--
>  6 files changed, 44 insertions(+), 77 deletions(-)
> 
> diff --git a/arch/m68k/coldfire/m528x.c b/arch/m68k/coldfire/m528x.c
> index 12f9e370d8dde8d8..fcdf6b3d427c3ca0 100644
> --- a/arch/m68k/coldfire/m528x.c
> +++ b/arch/m68k/coldfire/m528x.c
> @@ -99,7 +99,7 @@ void wildfire_halt(void)
>  #ifdef CONFIG_WILDFIREMOD
>  void wildfiremod_halt(void)
>  {
> -	printk(KERN_INFO "WildFireMod hibernating...\n");
> +	pr_info("WildFireMod hibernating...\n");
>  
>  	/* Set portE.5 to Digital IO */
>  	writew(readw(MCFGPIO_PEPAR) & ~(1 << (5 * 2)), MCFGPIO_PEPAR);
> @@ -111,7 +111,7 @@ void wildfiremod_halt(void)
>  	writeb(readb(MCFGPIO_PODR_E) & ~(1 << 5), MCFGPIO_PODR_E);
>  	writeb(readb(MCFGPIO_PODR_E) | (1 << 5), MCFGPIO_PODR_E);
>  
> -	printk(KERN_EMERG "Failed to hibernate. Halting!\n");
> +	pr_emerg("Failed to hibernate. Halting!\n");
>  }
>  #endif
>  
> diff --git a/arch/m68k/coldfire/sltimers.c b/arch/m68k/coldfire/sltimers.c
> index 831a08cf6f40d7e6..e1c66a4a53d2d285 100644
> --- a/arch/m68k/coldfire/sltimers.c
> +++ b/arch/m68k/coldfire/sltimers.c
> @@ -57,8 +57,8 @@ irqreturn_t mcfslt_profile_tick(int irq, void *dummy)
>  
>  void mcfslt_profile_init(void)
>  {
> -	printk(KERN_INFO "PROFILE: lodging TIMER 1 @ %dHz as profile timer\n",
> -	       PROFILEHZ);
> +	pr_info("PROFILE: lodging TIMER 1 @ %dHz as profile timer\n",
> +		PROFILEHZ);
>  
>  	setup_irq(MCF_IRQ_PROFILER, &mcfslt_profile_irq);
>  
> diff --git a/arch/m68k/coldfire/timers.c b/arch/m68k/coldfire/timers.c
> index cd496a20fcc7ced7..b849e40c97b1a408 100644
> --- a/arch/m68k/coldfire/timers.c
> +++ b/arch/m68k/coldfire/timers.c
> @@ -177,8 +177,8 @@ irqreturn_t coldfire_profile_tick(int irq, void *dummy)
>  
>  void coldfire_profile_init(void)
>  {
> -	printk(KERN_INFO "PROFILE: lodging TIMER2 @ %dHz as profile timer\n",
> -	       PROFILEHZ);
> +	pr_info("PROFILE: lodging TIMER2 @ %dHz as profile timer\n",
> +		PROFILEHZ);
>  
>  	/* Set up TIMER 2 as high speed profile clock */
>  	__raw_writew(MCFTIMER_TMR_DISABLE, PA(MCFTIMER_TMR));
> diff --git a/arch/m68k/coldfire/vectors.c b/arch/m68k/coldfire/vectors.c
> index 08923fe600e013d9..a185df5963d4ae50 100644
> --- a/arch/m68k/coldfire/vectors.c
> +++ b/arch/m68k/coldfire/vectors.c
> @@ -24,7 +24,7 @@
>  asmlinkage void dbginterrupt_c(struct frame *fp)
>  {
>  	extern void dump(struct pt_regs *fp);
> -	printk(KERN_DEBUG "%s(%d): BUS ERROR TRAP\n", __FILE__, __LINE__);
> +	pr_debug("%s(%d): BUS ERROR TRAP\n", __FILE__, __LINE__);
>  	dump((struct pt_regs *) fp);
>  	asm("halt");
>  }

This file also seems to lack #define DEBUG, so you and Greg might want to 
check this change.

-- 
