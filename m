From: Greg Ungerer <gerg@linux-m68k.org>
Subject: Re: [PATCH] m68knommu: remove dead code
Date: Fri, 25 Aug 2017 11:24:47 +1000
Message-ID: <bb847c96-2a29-d2b7-8513-cb369051c119@linux-m68k.org>
References: <20170824143407.21273-1-alexandre.belloni@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <20170824143407.21273-1-alexandre.belloni@free-electrons.com>
Content-Language: en-US
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Alexandre Belloni <alexandre.belloni@free-electrons.com>, Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org

Hi Alexandre,

On 25/08/17 00:34, Alexandre Belloni wrote:
> As CONFIG_RTC_DRV_M5441x doesn't exist because the driver never made it
> upstream, there is no device to register. Remove code that is never
> compiled and init_BSP() as it doesn't do anything.
> 
> Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>

Looks good, thanks. I have applied to m68knommu git tree, for-next branch.

Regards
Greg



> ---
>  arch/m68k/coldfire/m5441x.c | 37 -------------------------------------
>  1 file changed, 37 deletions(-)
> 
> diff --git a/arch/m68k/coldfire/m5441x.c b/arch/m68k/coldfire/m5441x.c
> index dc589b039b62..04fd7fde9fb3 100644
> --- a/arch/m68k/coldfire/m5441x.c
> +++ b/arch/m68k/coldfire/m5441x.c
> @@ -222,40 +222,3 @@ void __init config_BSP(char *commandp, int size)
>  	m5441x_uarts_init();
>  	m5441x_fec_init();
>  }
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
