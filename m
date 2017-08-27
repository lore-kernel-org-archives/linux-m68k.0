From: Angelo Dureghello <angelo@sysam.it>
Subject: Re: [PATCH] m68knommu: remove dead code
Date: Sun, 27 Aug 2017 13:22:09 +0200
Message-ID: <363abb76-2001-f072-fd8e-332014ee07e0@sysam.it>
References: <20170824143407.21273-1-alexandre.belloni@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sysam.it ([5.39.81.93]:35291 "EHLO sysam.it"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751329AbdH0LWL (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
        Sun, 27 Aug 2017 07:22:11 -0400
In-Reply-To: <20170824143407.21273-1-alexandre.belloni@free-electrons.com>
Content-Language: en-US
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Alexandre Belloni <alexandre.belloni@free-electrons.com>, Greg Ungerer <gerg@linux-m68k.org>, Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org

Hi,

just to inform you that i have in mind to add spi(soon, at least seems
just a matter con Kconfig changes) and usdhc(later)
drivers/support for stmark2 mcf5441x based board.
But no problem, in case i'll re-add the this code as needed.

On 24/08/2017 16:34, Alexandre Belloni wrote:
> As CONFIG_RTC_DRV_M5441x doesn't exist because the driver never made it
> upstream, there is no device to register. Remove code that is never
> compiled and init_BSP() as it doesn't do anything.
> 
> Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
> ---
>   arch/m68k/coldfire/m5441x.c | 37 -------------------------------------
>   1 file changed, 37 deletions(-)
> 
> diff --git a/arch/m68k/coldfire/m5441x.c b/arch/m68k/coldfire/m5441x.c
> index dc589b039b62..04fd7fde9fb3 100644
> --- a/arch/m68k/coldfire/m5441x.c
> +++ b/arch/m68k/coldfire/m5441x.c
> @@ -222,40 +222,3 @@ void __init config_BSP(char *commandp, int size)
>   	m5441x_uarts_init();
>   	m5441x_fec_init();
>   }
> -
> -
> -#if IS_ENABLED(CONFIG_RTC_DRV_M5441x)
> -static struct resource m5441x_rtc_resources[] = {
> -	{
> -		.start		= MCFRTC_BASE,
> -		.end		= MCFRTC_BASE + MCFRTC_SIZE - 1,
> -		.flags		= IORESOURCE_MEM,
> -	},
> -	{
> -		.start		= MCF_IRQ_RTC,
> -		.end		= MCF_IRQ_RTC,
> -		.flags		= IORESOURCE_IRQ,
> -	},
> -};
> -
> -static struct platform_device m5441x_rtc = {
> -	.name			= "mcfrtc",
> -	.id			= 0,
> -	.resource		= m5441x_rtc_resources,
> -	.num_resources		= ARRAY_SIZE(m5441x_rtc_resources),
> -};
> -#endif
> -
> -static struct platform_device *m5441x_devices[] __initdata = {
> -#if IS_ENABLED(CONFIG_RTC_DRV_M5441x)
> -	&m5441x_rtc,
> -#endif
> -};
> -
> -static int __init init_BSP(void)
> -{
> -	platform_add_devices(m5441x_devices, ARRAY_SIZE(m5441x_devices));
> -	return 0;
> -}
> -
> -arch_initcall(init_BSP);
> 

Regards,
Angelo
