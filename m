From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: [PATCH 07/22] m68k/mac: baboon - Modernize printing of kernel
 messages
Date: Thu, 8 Dec 2016 09:54:34 +1100 (AEDT)
Message-ID: <alpine.LNX.2.00.1612080953460.9219__23515.1664274328$1481151280$gmane$org@nippy.intranet>
References: <1481123360-10978-1-git-send-email-geert@linux-m68k.org> <1481123360-10978-8-git-send-email-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1481123360-10978-8-git-send-email-geert@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Greg Ungerer <gerg@linux-m68k.org>, Sam Creasey <sammy@sammy.net>, Joshua Thompson <funaho@jurai.org>, linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org


On Wed, 7 Dec 2016, Geert Uytterhoeven wrote:

>   - Introduce helpers for printing debug messages, incl. dummies for
>     validating format strings when debugging is disabled,
>   - Convert from printk() to pr_*(),
>   - Drop superfluous casts.
> 
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---
>  arch/m68k/mac/baboon.c | 22 ++++++++++------------
>  1 file changed, 10 insertions(+), 12 deletions(-)
> 
> diff --git a/arch/m68k/mac/baboon.c b/arch/m68k/mac/baboon.c
> index f6f7d42713ec8b95..5dac92227654419b 100644
> --- a/arch/m68k/mac/baboon.c
> +++ b/arch/m68k/mac/baboon.c
> @@ -15,6 +15,11 @@
>  #include <asm/mac_baboon.h>
>  
>  /* #define DEBUG_IRQS */
> +#ifdef DEBUG_IRQS
> +#define pr_irq(fmt, ...) printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
> +#else
> +#define pr_irq(fmt, ...) no_printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
> +#endif
>  

I'd prefer to drop the DEBUG_IRQS printk messages in this file.

Thanks.

>  int baboon_present;
>  static volatile struct baboon *baboon;
> @@ -38,7 +43,7 @@ void __init baboon_init(void)
>  	baboon = (struct baboon *) BABOON_BASE;
>  	baboon_present = 1;
>  
> -	printk("Baboon detected at %p\n", baboon);
> +	pr_info("Baboon detected at %p\n", baboon);
>  }
>  
>  /*
> @@ -50,11 +55,8 @@ static void baboon_irq(struct irq_desc *desc)
>  	int irq_bit, irq_num;
>  	unsigned char events;
>  
> -#ifdef DEBUG_IRQS
> -	printk("baboon_irq: mb_control %02X mb_ifr %02X mb_status %02X\n",
> -		(uint) baboon->mb_control, (uint) baboon->mb_ifr,
> -		(uint) baboon->mb_status);
> -#endif
> +	pr_irq("baboon_irq: mb_control %02X mb_ifr %02X mb_status %02X\n",
> +	       baboon->mb_control, baboon->mb_ifr, baboon->mb_status);
>  
>  	events = baboon->mb_ifr & 0x07;
>  	if (!events)
> @@ -97,18 +99,14 @@ void __init baboon_register_interrupts(void)
>  
>  void baboon_irq_enable(int irq)
>  {
> -#ifdef DEBUG_IRQUSE
> -	printk("baboon_irq_enable(%d)\n", irq);
> -#endif
> +	pr_irq("baboon_irq_enable(%d)\n", irq);
>  
>  	mac_irq_enable(irq_get_irq_data(IRQ_NUBUS_C));
>  }
>  
>  void baboon_irq_disable(int irq)
>  {
> -#ifdef DEBUG_IRQUSE
> -	printk("baboon_irq_disable(%d)\n", irq);
> -#endif
> +	pr_irq("baboon_irq_disable(%d)\n", irq);
>  
>  	mac_irq_disable(irq_get_irq_data(IRQ_NUBUS_C));
>  }
> 

-- 
