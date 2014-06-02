From: Greg Ungerer <gerg@uclinux.org>
Subject: Re: [RFC/PATCH] m68knommu: refactor mcfgpio.h to check for defines
 instead of CONFIG_ symbols.
Date: Mon, 02 Jun 2014 16:47:52 +1000
Message-ID: <538C1E18.8010600@uclinux.org>
References: <201405301905.37911.sfking@fdwdc.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from icp-osb-irony-out9.external.iinet.net.au ([203.59.1.226]:17363
	"EHLO icp-osb-irony-out9.external.iinet.net.au" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751948AbaFBGrl (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 2 Jun 2014 02:47:41 -0400
In-Reply-To: <201405301905.37911.sfking@fdwdc.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Steven King <sfking@fdwdc.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@vger.kernel.org

Hi Steven,

On 31/05/14 12:05, Steven King wrote:
> While the various Coldfire parts use several different methods for implementing
> GPIO, we can use the common aspects shared between the different parts as
> defined in the m5xxxsim.h files rather than relying on CONFIG_ symbols.  This
> should reduce the clutter and should make it more portable for other Coldfire
> devices.
> 
> Signed-off-by: Steven King <sfking@fdwdc.com>

Thanks for looking at this.

I like that the functions now rely on what the hardware
can do, not on the CONFIG_ family type (even though those
functions have a load of #ifdef paths).

Can I ask that the changes to the m*sim.h files leave the
white space blank likes after the #define and before the /*
comments?

Otherwise it looks ok.

Thanks
Greg


> ---
>  arch/m68k/include/asm/mcfgpio.h   |  208 +++++++++++++++++--------------------
>  arch/m68k/include/asm/m5206sim.h  |    1 +
>  arch/m68k/include/asm/m520xsim.h  |    1 +
>  arch/m68k/include/asm/m523xsim.h  |    2 +-
>  arch/m68k/include/asm/m525xsim.h  |    2 +-
>  arch/m68k/include/asm/m5272sim.h  |    2 +-
>  arch/m68k/include/asm/m527xsim.h  |    2 +-
>  arch/m68k/include/asm/m528xsim.h  |    2 +-
>  arch/m68k/include/asm/m5307sim.h  |    2 +-
>  arch/m68k/include/asm/m53xxsim.h  |    2 +-
>  arch/m68k/include/asm/m5407sim.h  |    2 +-
>  arch/m68k/include/asm/m5441xsim.h |    2 +-
>  arch/m68k/include/asm/m54xxsim.h  |    2 +-
>  13 files changed, 107 insertions(+), 123 deletions(-)
> 
> diff --git a/arch/m68k/include/asm/mcfgpio.h b/arch/m68k/include/asm/mcfgpio.h
> index 66203c3..b06a997 100644
> --- a/arch/m68k/include/asm/mcfgpio.h
> +++ b/arch/m68k/include/asm/mcfgpio.h
> @@ -101,34 +101,27 @@ static inline void gpio_free(unsigned gpio)
>   * This implementation attempts accommodate the differences while presenting
>   * a generic interface that will optimize to as few instructions as possible.
>   */
> -#if defined(CONFIG_M5206) || defined(CONFIG_M5206e) || \
> -    defined(CONFIG_M520x) || defined(CONFIG_M523x) || \
> -    defined(CONFIG_M527x) || defined(CONFIG_M528x) || \
> -    defined(CONFIG_M53xx) || defined(CONFIG_M54xx) || \
> -    defined(CONFIG_M5441x)
> +#if (MCFGPIO_PORTSIZE == 8)
>  
>  /* These parts have GPIO organized by 8 bit ports */
>  
>  #define MCFGPIO_PORTTYPE		u8
> -#define MCFGPIO_PORTSIZE		8
>  #define mcfgpio_read(port)		__raw_readb(port)
>  #define mcfgpio_write(data, port)	__raw_writeb(data, port)
>  
> -#elif defined(CONFIG_M5307) || defined(CONFIG_M5407) || defined(CONFIG_M5272)
> +#elif (MCFGPIO_PORTSIZE == 16)
>  
>  /* These parts have GPIO organized by 16 bit ports */
>  
>  #define MCFGPIO_PORTTYPE		u16
> -#define MCFGPIO_PORTSIZE		16
>  #define mcfgpio_read(port)		__raw_readw(port)
>  #define mcfgpio_write(data, port)	__raw_writew(data, port)
>  
> -#elif defined(CONFIG_M5249) || defined(CONFIG_M525x)
> +#elif (MCFGPIO_PORTSIZE == 32)
>  
>  /* These parts have GPIO organized by 32 bit ports */
>  
>  #define MCFGPIO_PORTTYPE		u32
> -#define MCFGPIO_PORTSIZE		32
>  #define mcfgpio_read(port)		__raw_readl(port)
>  #define mcfgpio_write(data, port)	__raw_writel(data, port)
>  
> @@ -137,26 +130,27 @@ static inline void gpio_free(unsigned gpio)
>  #define mcfgpio_bit(gpio)		(1 << ((gpio) %  MCFGPIO_PORTSIZE))
>  #define mcfgpio_port(gpio)		((gpio) / MCFGPIO_PORTSIZE)
>  
> -#if defined(CONFIG_M520x) || defined(CONFIG_M523x) || \
> -    defined(CONFIG_M527x) || defined(CONFIG_M528x) || \
> -    defined(CONFIG_M53xx) || defined(CONFIG_M54xx) || \
> -    defined(CONFIG_M5441x)
> +#if defined(MCFGPIO_PODR)
>  /*
> - * These parts have an 'Edge' Port module (external interrupt/GPIO) which uses
> - * read-modify-write to change an output and a GPIO module which has separate
> - * set/clr registers to directly change outputs with a single write access.
> + * These parts have a GPIO module which has separate set/clr registers to
> + * directly change outputs with a single write access.
>   */
> -#if defined(CONFIG_M528x)
> +#if defined(MCFGPIO_EPPDR)
> +/*
> + * These parts also have an 'Edge' Port module (external interrupt/GPIO) which
> + * uses read-modify-write to change an output.
> + */
> +#if defined(MCFQADC_PORTQB)
>  /*
>   * The 528x also has GPIOs in other modules (GPT, QADC) which use
>   * read-modify-write as well as those controlled by the EPORT and GPIO modules.
>   */
> -#define MCFGPIO_SCR_START		40
> -#elif defined(CONFIGM5441x)
> -/* The m5441x EPORT doesn't have its own GPIO port, uses PORT C */
> -#define MCFGPIO_SCR_START		0
> +#define MCFGPIO_SCR_START		40 /* EPORT + GPTA + GPTB + QA + QB */
>  #else
> -#define MCFGPIO_SCR_START		8
> +#define MCFGPIO_SCR_START		8 /* EPORT */
> +#endif
> +#else
> +#define MCFGPIO_SCR_START		0 /* no EPORT */
>  #endif
>  
>  #define MCFGPIO_SETR_PORT(gpio)		(MCFGPIO_SETR + \
> @@ -179,41 +173,37 @@ static inline void gpio_free(unsigned gpio)
>  /* return the port pin data register for a gpio */
>  static inline u32 __mcfgpio_ppdr(unsigned gpio)
>  {
> -#if defined(CONFIG_M5206) || defined(CONFIG_M5206e) || \
> -    defined(CONFIG_M5307) || defined(CONFIG_M5407)
> -	return MCFSIM_PADAT;
> -#elif defined(CONFIG_M5272)
> -	if (gpio < 16)
> -		return MCFSIM_PADAT;
> -	else if (gpio < 32)
> -		return MCFSIM_PBDAT;
> -	else
> +#if defined(MCFSIM_PADAT)
> +#if defined(MCFSIM_PCDAT)
> +	if (gpio >= 32)
>  		return MCFSIM_PCDAT;
> -#elif defined(CONFIG_M5249) || defined(CONFIG_M525x)
> -	if (gpio < 32)
> -		return MCFSIM2_GPIOREAD;
> +	else if (gpio >= 16)
> +		return MCFSIM_PBDAT;
>  	else
> +#endif
> +		return MCFSIM_PADAT;
> +#elif defined(MCFSIM2_GPIO1READ)
> +	if (gpio >= 32)
>  		return MCFSIM2_GPIO1READ;
> -#elif defined(CONFIG_M520x) || defined(CONFIG_M523x) || \
> -      defined(CONFIG_M527x) || defined(CONFIG_M528x) || \
> -      defined(CONFIG_M53xx) || defined(CONFIG_M54xx) || \
> -      defined(CONFIG_M5441x)
> -#if !defined(CONFIG_M5441x)
> -	if (gpio < 8)
> -		return MCFEPORT_EPPDR;
> -#if defined(CONFIG_M528x)
> -	else if (gpio < 16)
> -		return MCFGPTA_GPTPORT;
> -	else if (gpio < 24)
> -		return MCFGPTB_GPTPORT;
> -	else if (gpio < 32)
> -		return MCFQADC_PORTQA;
> -	else if (gpio < 40)
> -		return MCFQADC_PORTQB;
> -#endif /* defined(CONFIG_M528x) */
>  	else
> -#endif /* !defined(CONFIG_M5441x) */
> +		return MCFSIM2_GPIOREAD;
> +#elif defined(MCFGPIO_PPDR)
> +	if (gpio >= MCFGPIO_SCR_START)
>  		return MCFGPIO_PPDR + mcfgpio_port(gpio - MCFGPIO_SCR_START);
> +#if defined(MCFEPORT_EPPDR)
> +#if defined(MCFQADC_PORTQB)
> +	else if (gpio >= 32)
> +		return MCFQADC_PORTQB;
> +	else if (gpio >= 24)
> +		return MCFQADC_PORTQA;
> +	else if (gpio >= 18)
> +		return MCFGPTB_GPTPORT;
> +	else if (gpio >= 8)
> +		return MCFGPTA_GPTPORT;
> +#endif
> +	else
> +		return MCFEPORT_EPPDR;
> +#endif
>  #else
>  	return 0;
>  #endif
> @@ -222,41 +212,37 @@ static inline u32 __mcfgpio_ppdr(unsigned gpio)
>  /* return the port output data register for a gpio */
>  static inline u32 __mcfgpio_podr(unsigned gpio)
>  {
> -#if defined(CONFIG_M5206) || defined(CONFIG_M5206e) || \
> -    defined(CONFIG_M5307) || defined(CONFIG_M5407)
> -	return MCFSIM_PADAT;
> -#elif defined(CONFIG_M5272)
> -	if (gpio < 16)
> -		return MCFSIM_PADAT;
> -	else if (gpio < 32)
> -		return MCFSIM_PBDAT;
> -	else
> +#if defined(MCFSIM_PADAT)
> +#if defined(MCFSIM_PCDAT)
> +	if (gpio >= 32)
>  		return MCFSIM_PCDAT;
> -#elif defined(CONFIG_M5249) || defined(CONFIG_M525x)
> -	if (gpio < 32)
> -		return MCFSIM2_GPIOWRITE;
> +	else if (gpio >= 16)
> +		return MCFSIM_PBDAT;
>  	else
> +#endif
> +		return MCFSIM_PADAT;
> +#elif defined(MCFSIM2_GPIO1WRITE)
> +	if (gpio >= 32)
>  		return MCFSIM2_GPIO1WRITE;
> -#elif defined(CONFIG_M520x) || defined(CONFIG_M523x) || \
> -      defined(CONFIG_M527x) || defined(CONFIG_M528x) || \
> -      defined(CONFIG_M53xx) || defined(CONFIG_M54xx) || \
> -      defined(CONFIG_M5441x)
> -#if !defined(CONFIG_M5441x)
> -	if (gpio < 8)
> -		return MCFEPORT_EPDR;
> -#if defined(CONFIG_M528x)
> -	else if (gpio < 16)
> -		return MCFGPTA_GPTPORT;
> -	else if (gpio < 24)
> -		return MCFGPTB_GPTPORT;
> -	else if (gpio < 32)
> -		return MCFQADC_PORTQA;
> -	else if (gpio < 40)
> -		return MCFQADC_PORTQB;
> -#endif /* defined(CONFIG_M528x) */
>  	else
> -#endif /* !defined(CONFIG_M5441x) */
> +		return MCFSIM2_GPIOWRITE;
> +#elif defined(MCFGPIO_PODR)
> +	if (gpio >= MCFGPIO_SCR_START)
>  		return MCFGPIO_PODR + mcfgpio_port(gpio - MCFGPIO_SCR_START);
> +#if defined(MCFEPORT_EPDR)
> +#if defined(MCFQADC_PORTQB)
> +	else if (gpio >= 32)
> +		return MCFQADC_PORTQB;
> +	else if (gpio >= 24)
> +		return MCFQADC_PORTQA;
> +	else if (gpio >= 16)
> +		return MCFGPTB_GPTPORT;
> +	else if (gpio >= 8)
> +		return MCFGPTA_GPTPORT;
> +#endif
> +	else
> +		return MCFEPORT_EPDR;
> +#endif
>  #else
>  	return 0;
>  #endif
> @@ -265,41 +251,37 @@ static inline u32 __mcfgpio_podr(unsigned gpio)
>  /* return the port direction data register for a gpio */
>  static inline u32 __mcfgpio_pddr(unsigned gpio)
>  {
> -#if defined(CONFIG_M5206) || defined(CONFIG_M5206e) || \
> -    defined(CONFIG_M5307) || defined(CONFIG_M5407)
> -	return MCFSIM_PADDR;
> -#elif defined(CONFIG_M5272)
> -	if (gpio < 16)
> -		return MCFSIM_PADDR;
> -	else if (gpio < 32)
> -		return MCFSIM_PBDDR;
> -	else
> +#if defined(MCFSIM_PADDR)
> +#if defined(MCFSIM_PCDDR)
> +	if (gpio >= 32)
>  		return MCFSIM_PCDDR;
> -#elif defined(CONFIG_M5249) || defined(CONFIG_M525x)
> -	if (gpio < 32)
> -		return MCFSIM2_GPIOENABLE;
> +	else if (gpio >= 16)
> +		return MCFSIM_PBDDR;
>  	else
> +#endif
> +		return MCFSIM_PADDR;
> +#elif defined(MCFSIM2_GPIO1ENABLE)
> +	if (gpio >= 32)
>  		return MCFSIM2_GPIO1ENABLE;
> -#elif defined(CONFIG_M520x) || defined(CONFIG_M523x) || \
> -      defined(CONFIG_M527x) || defined(CONFIG_M528x) || \
> -      defined(CONFIG_M53xx) || defined(CONFIG_M54xx) || \
> -      defined(CONFIG_M5441x)
> -#if !defined(CONFIG_M5441x)
> -	if (gpio < 8)
> -		return MCFEPORT_EPDDR;
> -#if defined(CONFIG_M528x)
> -	else if (gpio < 16)
> -		return MCFGPTA_GPTDDR;
> -	else if (gpio < 24)
> -		return MCFGPTB_GPTDDR;
> -	else if (gpio < 32)
> -		return MCFQADC_DDRQA;
> -	else if (gpio < 40)
> -		return MCFQADC_DDRQB;
> -#endif /* defined(CONFIG_M528x) */
>  	else
> -#endif /* !defined(CONFIG_M5441x) */
> +		return MCFSIM2_GPIOENABLE;
> +#elif defined(MCFGPIO_PDDR)
> +	if (gpio >= MCFGPIO_SCR_START)
>  		return MCFGPIO_PDDR + mcfgpio_port(gpio - MCFGPIO_SCR_START);
> +#if defined(MCFEPORT_EPDDR)
> +#if defined(MCFQADC_DDRQB)
> +	else if (gpio >= 32)
> +		return MCFQADC_DDRQB;
> +	else if (gpio >= 24)
> +		return MCFQADC_DDRQA;
> +	else if (gpio >= 16)
> +		return MCFGPTB_GPTDDR;
> +	else if (gpio >= 8)
> +		return MCFGPTA_GPTDDR;
> +#endif
> +	else
> +		return MCFEPORT_EPDDR;
> +#endif
>  #else
>  	return 0;
>  #endif
> diff --git a/arch/m68k/include/asm/m5206sim.h b/arch/m68k/include/asm/m5206sim.h
> index 4cf864f..5d2060c 100644
> --- a/arch/m68k/include/asm/m5206sim.h
> +++ b/arch/m68k/include/asm/m5206sim.h
> @@ -121,6 +121,7 @@
>  #define MCFGPIO_PIN_MAX		8
>  #define MCFGPIO_IRQ_VECBASE	-1
>  #define MCFGPIO_IRQ_MAX		-1
> +#define MCFGPIO_PORTSIZE	8
>  
>  /*
>   *	Some symbol defines for the Parallel Port Pin Assignment Register
> diff --git a/arch/m68k/include/asm/m520xsim.h b/arch/m68k/include/asm/m520xsim.h
> index db3f8ee..2d15358 100644
> --- a/arch/m68k/include/asm/m520xsim.h
> +++ b/arch/m68k/include/asm/m520xsim.h
> @@ -137,6 +137,7 @@
>  #define MCFGPIO_PIN_MAX			80
>  #define MCFGPIO_IRQ_MAX			8
>  #define MCFGPIO_IRQ_VECBASE		MCFINT_VECBASE
> +#define MCFGPIO_PORTSIZE		8
>  
>  #define MCF_GPIO_PAR_UART		0xFC0A4036
>  #define MCF_GPIO_PAR_FECI2C		0xFC0A4033
> diff --git a/arch/m68k/include/asm/m523xsim.h b/arch/m68k/include/asm/m523xsim.h
> index 5e06b4e..c81e98f 100644
> --- a/arch/m68k/include/asm/m523xsim.h
> +++ b/arch/m68k/include/asm/m523xsim.h
> @@ -185,7 +185,7 @@
>  #define MCFGPIO_PIN_MAX		107
>  #define MCFGPIO_IRQ_MAX		8
>  #define MCFGPIO_IRQ_VECBASE	MCFINT_VECBASE
> -
> +#define MCFGPIO_PORTSIZE	8
>  /*
>   * Pin Assignment
>  */
> diff --git a/arch/m68k/include/asm/m525xsim.h b/arch/m68k/include/asm/m525xsim.h
> index e33f5bb..20a9204 100644
> --- a/arch/m68k/include/asm/m525xsim.h
> +++ b/arch/m68k/include/asm/m525xsim.h
> @@ -213,7 +213,7 @@
>  #define MCFGPIO_IRQ_MAX		7
>  #define MCFGPIO_IRQ_VECBASE	MCF_IRQ_GPIO0
>  #endif
> -
> +#define MCFGPIO_PORTSIZE	32
>  /****************************************************************************/
>  
>  #ifdef __ASSEMBLER__
> diff --git a/arch/m68k/include/asm/m5272sim.h b/arch/m68k/include/asm/m5272sim.h
> index 1fb01bb..b335664 100644
> --- a/arch/m68k/include/asm/m5272sim.h
> +++ b/arch/m68k/include/asm/m5272sim.h
> @@ -135,6 +135,6 @@
>  #define MCFGPIO_PIN_MAX		48
>  #define MCFGPIO_IRQ_MAX		-1
>  #define MCFGPIO_IRQ_VECBASE	-1
> -
> +#define MCFGPIO_PORTSIZE	16
>  /****************************************************************************/
>  #endif	/* m5272sim_h */
> diff --git a/arch/m68k/include/asm/m527xsim.h b/arch/m68k/include/asm/m527xsim.h
> index 1bebbe7..86be5b9 100644
> --- a/arch/m68k/include/asm/m527xsim.h
> +++ b/arch/m68k/include/asm/m527xsim.h
> @@ -193,7 +193,7 @@
>  #define MCFGPIO_PIN_MAX		100
>  #define MCFGPIO_IRQ_MAX		8
>  #define MCFGPIO_IRQ_VECBASE	MCFINT_VECBASE
> -
> +#define MCFGPIO_PORTSIZE	8
>  /*
>   * Port Pin Assignment registers.
>   */
> diff --git a/arch/m68k/include/asm/m528xsim.h b/arch/m68k/include/asm/m528xsim.h
> index cf68ca0..39bf6c5 100644
> --- a/arch/m68k/include/asm/m528xsim.h
> +++ b/arch/m68k/include/asm/m528xsim.h
> @@ -232,7 +232,7 @@
>  #define MCFGPIO_IRQ_MAX		8
>  #define MCFGPIO_IRQ_VECBASE	MCFINT_VECBASE
>  #define MCFGPIO_PIN_MAX		180
> -
> +#define MCFGPIO_PORTSIZE	8
>  /*
>   *  Reset Control Unit (relative to IPSBAR).
>   */
> diff --git a/arch/m68k/include/asm/m5307sim.h b/arch/m68k/include/asm/m5307sim.h
> index 5d0bb7e..57dfd63 100644
> --- a/arch/m68k/include/asm/m5307sim.h
> +++ b/arch/m68k/include/asm/m5307sim.h
> @@ -130,7 +130,7 @@
>  #define MCFGPIO_PIN_MAX		16
>  #define MCFGPIO_IRQ_MAX		-1
>  #define MCFGPIO_IRQ_VECBASE	-1
> -
> +#define MCFGPIO_PORTSIZE	16
>  
>  /* Definition offset address for CS2-7  -- old mask 5307 */
>  
> diff --git a/arch/m68k/include/asm/m53xxsim.h b/arch/m68k/include/asm/m53xxsim.h
> index faa1a21..ac06bed 100644
> --- a/arch/m68k/include/asm/m53xxsim.h
> +++ b/arch/m68k/include/asm/m53xxsim.h
> @@ -1099,7 +1099,7 @@
>  #define MCFGPIO_PIN_MAX			136
>  #define MCFGPIO_IRQ_MAX			8
>  #define MCFGPIO_IRQ_VECBASE		MCFINT_VECBASE
> -
> +#define MCFGPIO_PORTSIZE		8
>  /*********************************************************************
>   *
>   * Phase Locked Loop (PLL)
> diff --git a/arch/m68k/include/asm/m5407sim.h b/arch/m68k/include/asm/m5407sim.h
> index a7550bc..0db6d89 100644
> --- a/arch/m68k/include/asm/m5407sim.h
> +++ b/arch/m68k/include/asm/m5407sim.h
> @@ -105,7 +105,7 @@
>  #define MCFGPIO_PIN_MAX		16
>  #define MCFGPIO_IRQ_MAX		-1
>  #define MCFGPIO_IRQ_VECBASE	-1
> -
> +#define MCFGPIO_PORTSIZE	16
>  /*
>   *	Some symbol defines for the above...
>   */
> diff --git a/arch/m68k/include/asm/m5441xsim.h b/arch/m68k/include/asm/m5441xsim.h
> index cc798ab..04cfa50 100644
> --- a/arch/m68k/include/asm/m5441xsim.h
> +++ b/arch/m68k/include/asm/m5441xsim.h
> @@ -272,5 +272,5 @@
>  #define MCFGPIO_IRQ_MAX		24
>  #define MCFGPIO_IRQ_VECBASE	(MCFINT_VECBASE - MCFGPIO_IRQ_MIN)
>  #define MCFGPIO_PIN_MAX		87
> -
> +#define MCFGPIO_PORTSIZE	8
>  #endif /* m5441xsim_h */
> diff --git a/arch/m68k/include/asm/m54xxsim.h b/arch/m68k/include/asm/m54xxsim.h
> index a5fbd17..3f1ecfa 100644
> --- a/arch/m68k/include/asm/m54xxsim.h
> +++ b/arch/m68k/include/asm/m54xxsim.h
> @@ -64,7 +64,7 @@
>  #define MCFGPIO_PIN_MAX		136	/* 128 gpio + 8 eport */
>  #define MCFGPIO_IRQ_MAX		8
>  #define MCFGPIO_IRQ_VECBASE	MCFINT_VECBASE
> -
> +#define MCFGPIO_PORTSIZE	8
>  /*
>   *	EDGE Port support.
>   */
> 
