From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: [PATCH 09/22] m68k/mac: oss - Modernize printing of kernel
 messages
Date: Thu, 8 Dec 2016 10:08:43 +1100 (AEDT)
Message-ID: <alpine.LNX.2.00.1612081006440.9219@nippy.intranet>
References: <1481123360-10978-1-git-send-email-geert@linux-m68k.org> <1481123360-10978-10-git-send-email-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1481123360-10978-10-git-send-email-geert@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Greg Ungerer <gerg@linux-m68k.org>, Sam Creasey <sammy@sammy.net>, Joshua Thompson <funaho@jurai.org>, linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org


On Wed, 7 Dec 2016, Geert Uytterhoeven wrote:

> Convert from printk() to pr_*().
> 
>   - Introduce helpers for printing debug messages, incl. dummies for
>     validating format strings when debugging is disabled,
>   - Convert from printk() to pr_*(),
>   - Drop superfluous casts,
>   - Add linebreaks before opening braces of function bodies.
> 
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---
>  arch/m68k/mac/oss.c | 26 +++++++++++++++-----------
>  1 file changed, 15 insertions(+), 11 deletions(-)
> 
> diff --git a/arch/m68k/mac/oss.c b/arch/m68k/mac/oss.c
> index 55d6592783f55710..e3c22370e9c6ee0d 100644
> --- a/arch/m68k/mac/oss.c
> +++ b/arch/m68k/mac/oss.c
> @@ -26,6 +26,12 @@
>  #include <asm/mac_via.h>
>  #include <asm/mac_oss.h>
>  
> +#ifdef DEBUG_IRQS
> +#define pr_irq(fmt, ...) printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
> +#else
> +#define pr_irq(fmt, ...) no_printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
> +#endif
> +
>  int oss_present;
>  volatile struct mac_oss *oss;
>  

Please just remove the DEBUG_IRQS macro and the related output.

> @@ -72,8 +78,8 @@ static void oss_irq(struct irq_desc *desc)
>  	if ((console_loglevel == 10) && !(events & OSS_IP_SCSI)) {
>  		unsigned int irq = irq_desc_get_irq(desc);
>  
> -		printk("oss_irq: irq %u events = 0x%04X\n", irq,
> -			(int) oss->irq_pending);
> +		pr_irq("oss_irq: irq %u events = 0x%04X\n", irq,
> +		       oss->irq_pending);
>  	}
>  #endif
>  
> @@ -109,7 +115,7 @@ static void oss_nubus_irq(struct irq_desc *desc)
>  
>  #ifdef DEBUG_NUBUS_INT
>  	if (console_loglevel > 7) {
> -		printk("oss_nubus_irq: events = 0x%04X\n", events);
> +		pr_info("oss_nubus_irq: events = 0x%04X\n", events);
>  	}
>  #endif
>  	/* There are only six slots on the OSS, not seven */

Same with DEBUG_NUBUS_INT.

Thanks.

> @@ -162,10 +168,9 @@ void __init oss_register_interrupts(void)
>   * level for that source to nonzero, thus enabling the interrupt.
>   */
>  
> -void oss_irq_enable(int irq) {
> -#ifdef DEBUG_IRQUSE
> -	printk("oss_irq_enable(%d)\n", irq);
> -#endif
> +void oss_irq_enable(int irq)
> +{
> +	pr_irq("oss_irq_enable(%d)\n", irq);
>  	switch(irq) {
>  		case IRQ_MAC_SCC:
>  			oss->irq_level[OSS_IOPSCC] = OSS_IRQLEV_IOPSCC;
> @@ -198,10 +203,9 @@ void oss_irq_enable(int irq) {
>   * to disable the interrupt.
>   */
>  
> -void oss_irq_disable(int irq) {
> -#ifdef DEBUG_IRQUSE
> -	printk("oss_irq_disable(%d)\n", irq);
> -#endif
> +void oss_irq_disable(int irq)
> +{
> +	pr_irq("oss_irq_disable(%d)\n", irq);
>  	switch(irq) {
>  		case IRQ_MAC_SCC:
>  			oss->irq_level[OSS_IOPSCC] = 0;
> 

-- 
