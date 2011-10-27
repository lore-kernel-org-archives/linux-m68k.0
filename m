From: Greg Ungerer <gerg@snapgear.com>
Subject: Re: [PATCH] m68k: Fall back to __gpio_to_irq() for non-arch GPIOs
Date: Thu, 27 Oct 2011 14:19:42 +1000
Message-ID: <4EA8DBDE.9070405@snapgear.com>
References: <1319615515-3286-1-git-send-email-broonie@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1319615515-3286-1-git-send-email-broonie@opensource.wolfsonmicro.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Lucas De Marchi <lucas.demarchi@profusion.mobi>, linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org

Hi Mark,

On 26/10/11 17:51, Mark Brown wrote:
> gpiolib provides __gpio_to_irq() to map gpiolib gpios to interrupts - hook
> that up on m68k.
>
> Signed-off-by: Mark Brown<broonie@opensource.wolfsonmicro.com>

I'll take this through the m68knommu git tree, since it is only used
by the ColdFire CPU parts.

Thanks
Greg



>   arch/m68k/include/asm/gpio.h |    3 ++-
>   1 files changed, 2 insertions(+), 1 deletions(-)
>
> diff --git a/arch/m68k/include/asm/gpio.h b/arch/m68k/include/asm/gpio.h
> index b204683..00d0071 100644
> --- a/arch/m68k/include/asm/gpio.h
> +++ b/arch/m68k/include/asm/gpio.h
> @@ -225,7 +225,8 @@ static inline void gpio_set_value(unsigned gpio, int value)
>
>   static inline int gpio_to_irq(unsigned gpio)
>   {
> -	return (gpio<  MCFGPIO_IRQ_MAX) ? gpio + MCFGPIO_IRQ_VECBASE : -EINVAL;
> +	return (gpio<  MCFGPIO_IRQ_MAX) ? gpio + MCFGPIO_IRQ_VECBASE
> +		: __gpio_to_irq(gpio);
>   }
>
>   static inline int irq_to_gpio(unsigned irq)


-- 
------------------------------------------------------------------------
Greg Ungerer  --  Principal Engineer        EMAIL:     gerg@snapgear.com
SnapGear Group, McAfee                      PHONE:       +61 7 3435 2888
8 Gardner Close                             FAX:         +61 7 3217 5323
Milton, QLD, 4064, Australia                WEB: http://www.SnapGear.com
