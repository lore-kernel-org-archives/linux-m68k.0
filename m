From: Greg Ungerer <gerg@uclinux.org>
Subject: Re: [PATCH] Fix MC68328.h defines
Date: Mon, 04 Mar 2013 11:16:53 +1000
Message-ID: <5133F605.5060702@uclinux.org>
References: <1361999142-15483-1-git-send-email-ljalvs@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from outbound-mail03.westnet.com.au ([203.10.1.244]:30675 "EHLO
	outbound-mail03.westnet.com.au" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751473Ab3CDBRQ (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 3 Mar 2013 20:17:16 -0500
In-Reply-To: <1361999142-15483-1-git-send-email-ljalvs@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Luis Alves <ljalvs@gmail.com>
Cc: uclinux-dev@uclinux.org, linux-m68k@vger.kernel.org

Hi Luis,

On 28/02/13 07:05, Luis Alves wrote:
> This patch fixes some broken #define's in the MC68328.h file.
> Most of them are whitespaces and one is an incorrect define of TCN.

Thanks. Applied to the m68knommu git tree.

Regards
Greg


> Signed-off-by: Luis Alves <ljalvs@gmail.com>
> ---
>   arch/m68k/include/asm/MC68328.h |   10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/arch/m68k/include/asm/MC68328.h b/arch/m68k/include/asm/MC68328.h
> index a337e56..4ebf098 100644
> --- a/arch/m68k/include/asm/MC68328.h
> +++ b/arch/m68k/include/asm/MC68328.h
> @@ -293,7 +293,7 @@
>   /*
>    * Here go the bitmasks themselves
>    */
> -#define IMR_MSPIM 	(1 << SPIM _IRQ_NUM)	/* Mask SPI Master interrupt */
> +#define IMR_MSPIM 	(1 << SPIM_IRQ_NUM)	/* Mask SPI Master interrupt */
>   #define	IMR_MTMR2	(1 << TMR2_IRQ_NUM)	/* Mask Timer 2 interrupt */
>   #define IMR_MUART	(1 << UART_IRQ_NUM)	/* Mask UART interrupt */	
>   #define	IMR_MWDT	(1 << WDT_IRQ_NUM)	/* Mask Watchdog Timer interrupt */
> @@ -327,7 +327,7 @@
>   #define IWR_ADDR	0xfffff308
>   #define IWR		LONG_REF(IWR_ADDR)
>
> -#define IWR_SPIM 	(1 << SPIM _IRQ_NUM)	/* SPI Master interrupt */
> +#define IWR_SPIM 	(1 << SPIM_IRQ_NUM)	/* SPI Master interrupt */
>   #define	IWR_TMR2	(1 << TMR2_IRQ_NUM)	/* Timer 2 interrupt */
>   #define IWR_UART	(1 << UART_IRQ_NUM)	/* UART interrupt */	
>   #define	IWR_WDT		(1 << WDT_IRQ_NUM)	/* Watchdog Timer interrupt */
> @@ -357,7 +357,7 @@
>   #define ISR_ADDR	0xfffff30c
>   #define ISR		LONG_REF(ISR_ADDR)
>
> -#define ISR_SPIM 	(1 << SPIM _IRQ_NUM)	/* SPI Master interrupt */
> +#define ISR_SPIM 	(1 << SPIM_IRQ_NUM)	/* SPI Master interrupt */
>   #define	ISR_TMR2	(1 << TMR2_IRQ_NUM)	/* Timer 2 interrupt */
>   #define ISR_UART	(1 << UART_IRQ_NUM)	/* UART interrupt */	
>   #define	ISR_WDT		(1 << WDT_IRQ_NUM)	/* Watchdog Timer interrupt */
> @@ -391,7 +391,7 @@
>   #define IPR_ADDR	0xfffff310
>   #define IPR		LONG_REF(IPR_ADDR)
>
> -#define IPR_SPIM 	(1 << SPIM _IRQ_NUM)	/* SPI Master interrupt */
> +#define IPR_SPIM 	(1 << SPIM_IRQ_NUM)	/* SPI Master interrupt */
>   #define	IPR_TMR2	(1 << TMR2_IRQ_NUM)	/* Timer 2 interrupt */
>   #define IPR_UART	(1 << UART_IRQ_NUM)	/* UART interrupt */	
>   #define	IPR_WDT		(1 << WDT_IRQ_NUM)	/* Watchdog Timer interrupt */
> @@ -757,7 +757,7 @@
>
>   /* 'EZ328-compatible definitions */
>   #define TCN_ADDR	TCN1_ADDR
> -#define TCN		TCN
> +#define TCN		TCN1
>
>   /*
>    * Timer Unit 1 and 2 Status Registers
>
