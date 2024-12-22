Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 910EF259484;
	Sun, 22 Dec 2024 14:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734877853; cv=none; b=A6PFkHTy0+z6cD26tN21JVvG4GZFq0LubRals4X5Ze+pFZrhmt3ng1VDPE8BINtuoSqQUEBva41wRDKIDvkyta4iJMZ9EtEk4XfL5xw/RAcYyHsnyMeqoiqV7qdVjue5jP7pLrIvOCRt2kvegfnwXatzsDT00B/VTmjPoLPa/fA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734877853; c=relaxed/simple;
	bh=Ls0EV6Je6lDIV8GWUiSW9Qw1y6N/zISshnI121m7MBs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cuL6OUoKIdls/XpZJAsL5vnBVu2dldTy2AAU3zq0wS0jzNoBaOuPYPNPfuq6b1lOKyGsgEKRcKW49RtbAMSxMkj2mI9b0FkeGcI762ndMFQK/wGaVbsSxhp+aI3D/NHwj46Oc2NdbyxL5u1Gz8gVblF2iAE/ZCX4gfyrWx+fBsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=yoseli.org; spf=none smtp.mailfrom=yoseli.org; dkim=pass (2048-bit key) header.d=yoseli.org header.i=@yoseli.org header.b=giqSmIwB; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=yoseli.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=yoseli.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yoseli.org header.i=@yoseli.org header.b="giqSmIwB"
Received: by mail.gandi.net (Postfix) with ESMTPSA id DD086240002;
	Sun, 22 Dec 2024 14:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yoseli.org; s=gm1;
	t=1734877848;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MoK8IUtYuIjJL+XaZi4/56M7FjQsWapHFqVuUn98EnE=;
	b=giqSmIwB4yqnaht4yfg8ERM7A0xFPpzmvWBjPvjWt0j7FvFSwwctwKQNQVjdfH2jG9NjIf
	aDYIE+Vt1kLXN+FSfKhebgHYxvSJysVxDsk1bEcCrsgbJo1K1WzFSjEmqpQ0bBg5e+ck61
	3uUUR9KAzCp0jZzWgwmlmFxNi3tuiS/Hj9as1GryZ5hjhme1bG1Gk46CKT/riMkP5tN3Pw
	k/FW5464JHsq68xbYeITJ4OUaTmzpGlUjC6VXMyVAwpeWlGmz5bnDk87SZbLvRt16Z5cCX
	uuff2GblSRAQiyTMCMEuW9LovL62kGWLDQ/m4Re2/ARGcHs4B6JcDyXEf6arzg==
Message-ID: <01a229d4-74a0-4e74-bcba-dde95e166ea3@yoseli.org>
Date: Sun, 22 Dec 2024 15:30:47 +0100
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] m68k: m5441x: Add DMA timer support
To: Greg Ungerer <gerg@linux-m68k.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org,
 linux-m68k@vger.kernel.org
References: <20241202-m5441x_dma_tmr-v1-0-94087efe4243@yoseli.org>
 <20241202-m5441x_dma_tmr-v1-2-94087efe4243@yoseli.org>
 <df782716-1eae-4014-890f-c2dbcc4f8c16@linux-m68k.org>
Content-Language: en-US
From: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
In-Reply-To: <df782716-1eae-4014-890f-c2dbcc4f8c16@linux-m68k.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: jeanmichel.hautbois@yoseli.org

Hi Greg,

On 22/12/2024 14:41, Greg Ungerer wrote:
> Hi JM,
> 
> On 2/12/24 19:29, Jean-Michel Hautbois wrote:
>> Introduce support for the DMA Timer (DTIM) modules found in ColdFire
>> processors, covering DTIM0 to DTIM3. These are 32-bits timers with 8ns
>> resolution at 125MHz (fsys/2).
>>
>> We use it as a sched_clock as well.
>>
>> Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
>> ---
>>   MAINTAINERS                         |   6 +
>>   arch/m68k/include/asm/m5441xsim.h   |  18 +++
>>   drivers/clocksource/Kconfig         |   9 ++
>>   drivers/clocksource/Makefile        |   1 +
>>   drivers/clocksource/mcf_dma_timer.c | 240 ++++++++++++++++++++++++++ 
>> ++++++++++
>>   5 files changed, 274 insertions(+)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 
>> 1e930c7a58b13d8bbe6bf133ba7b36aa24c2b5e0..21e8646f29e2ee726798bbb28a31e921bcaf6011 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -9047,6 +9047,12 @@ S:    Maintained
>>   F:    drivers/mmc/host/sdhci-esdhc-mcf.c
>>   F:    include/linux/platform_data/mmc-esdhc-mcf.h
>> +FREESCALE COLDFIRE M5441X DMA TIMER DRIVER
>> +M:    Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
>> +L:    linux-m68k@vger.kernel.org
>> +S:    Maintained
>> +F:    drivers/clocksource/mcf_dma_timer.c
>> +
>>   FREESCALE DIU FRAMEBUFFER DRIVER
>>   M:    Timur Tabi <timur@kernel.org>
>>   L:    linux-fbdev@vger.kernel.org
>> diff --git a/arch/m68k/include/asm/m5441xsim.h b/arch/m68k/include/ 
>> asm/m5441xsim.h
>> index 
>> f48cf63bd7822fd53c33788128f984585c0c421a..c46f874bf4a24137bc45300cb3013cb13b47f5ec 100644
>> --- a/arch/m68k/include/asm/m5441xsim.h
>> +++ b/arch/m68k/include/asm/m5441xsim.h
>> @@ -101,6 +101,24 @@
>>   #define MCFINT2_PIT3        16
>>   #define MCFINT2_RTC        26
>> +/*
>> + * DMA timer module.
>> + */
>> +#define MCFDMATIMER_BASE0    0xFC070000    /* Base address of DMA 
>> timer 0 */
>> +#define MCFDMATIMER_BASE1    0xFC074000    /* Base address of DMA 
>> timer 1 */
>> +#define MCFDMATIMER_BASE2    0xFC078000    /* Base address of DMA 
>> timer 2 */
>> +#define MCFDMATIMER_BASE3    0xFC07C000    /* Base address of DMA 
>> timer 3 */
>> +
>> +#define MCFDMATIMER_IRQ_DTIM0    (MCFINT0_VECBASE + MCFINT0_TIMER0)
>> +#define MCFDMATIMER_IRQ_DTIM1    (MCFINT0_VECBASE + MCFINT0_TIMER1)
>> +#define MCFDMATIMER_IRQ_DTIM2    (MCFINT0_VECBASE + MCFINT0_TIMER2)
>> +#define MCFDMATIMER_IRQ_DTIM3    (MCFINT0_VECBASE + MCFINT0_TIMER3)
>> +
>> +#define MCFDMATIMER_IRQ_PRIO0    (MCFINTC0_ICR0 + MCFINT0_TIMER0)
>> +#define MCFDMATIMER_IRQ_PRIO1    (MCFINTC0_ICR0 + MCFINT0_TIMER1)
>> +#define MCFDMATIMER_IRQ_PRIO2    (MCFINTC0_ICR0 + MCFINT0_TIMER2)
>> +#define MCFDMATIMER_IRQ_PRIO3    (MCFINTC0_ICR0 + MCFINT0_TIMER3)
> 
> None of these are actually used directly in the driver code below.
> Maybe separate them out into a separate patch.

Sure, along with a DMA timer in device.c, this would make more sense I 
suppose ?

> 
>> +
>>   /*
>>    *  PIT timer module.
>>    */
>> diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
>> index 
>> 487c8525996724fbf9c6e9726dabb478d86513b9..3cb3237ef788170f1c2d2bf5db3d47adbeca5664 100644
>> --- a/drivers/clocksource/Kconfig
>> +++ b/drivers/clocksource/Kconfig
>> @@ -763,4 +763,13 @@ config RALINK_TIMER
>>         Enables support for system tick counter present on
>>         Ralink SoCs RT3352 and MT7620.
>> +config COLDFIRE_DMA_TIMERS
>> +    bool "Coldfire DMA timer clocksource"
>> +    depends on M5441x
>> +    select GENERIC_SCHED_CLOCK
>> +    help
>> +      Enables support for the Coldfire M5441x DMA timers as
>> +      a clocksource and a clockevent. It supports oneshot and
>> +      high resolution.
>> +
>>   endmenu
>> diff --git a/drivers/clocksource/Makefile b/drivers/clocksource/Makefile
>> index 
>> 43ef16a4efa6a33bf69ca05a8d66d682826841c9..3a740cd5d52a6f5e68c4e8a0831a2f3306f56941 100644
>> --- a/drivers/clocksource/Makefile
>> +++ b/drivers/clocksource/Makefile
>> @@ -92,3 +92,4 @@ obj-$(CONFIG_GXP_TIMER)            += timer-gxp.o
>>   obj-$(CONFIG_CLKSRC_LOONGSON1_PWM)    += timer-loongson1-pwm.o
>>   obj-$(CONFIG_EP93XX_TIMER)        += timer-ep93xx.o
>>   obj-$(CONFIG_RALINK_TIMER)        += timer-ralink.o
>> +obj-$(CONFIG_COLDFIRE_DMA_TIMERS)    += mcf_dma_timer.o
>> diff --git a/drivers/clocksource/mcf_dma_timer.c b/drivers/ 
>> clocksource/mcf_dma_timer.c
>> new file mode 100644
>> index 
>> 0000000000000000000000000000000000000000..f5cb0f92fcecffcd51a6e73ca38e5a8d8bade0a9
>> --- /dev/null
>> +++ b/drivers/clocksource/mcf_dma_timer.c
>> @@ -0,0 +1,240 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * mcf_dma_timer.c -- Freescale ColdFire DMA Timer.
>> + *
>> + * Copyright (C) 2024, Jean-Michel Hautbois 
>> <jeanmichel.hautbois@yoseli.org>
>> + *
>> + */
>> +
>> +#include <linux/clk.h>
>> +#include <linux/clockchips.h>
>> +#include <linux/clocksource.h>
>> +#include <linux/io.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/sched/clock.h>
>> +#include <linux/sched_clock.h>
>> +
>> +#include <asm/machdep.h>
>> +#include <asm/coldfire.h>
>> +#include <asm/mcfpit.h>
>> +#include <asm/mcfsim.h>
>> +
>> +struct dmatmr_regs {
>> +    u16 *dtmr;
>> +    u8 *dtxmr;
>> +    u8 *dter;
>> +    u32 *dtrr;
>> +    u32 *dtcr;
>> +    u32 *dtcn;
>> +};
>> +
>> +struct dmatmr_priv {
>> +    void __iomem *base;
>> +    struct clk *clk;
>> +    struct platform_device *pdev;
>> +    unsigned long rate;
>> +    raw_spinlock_t lock;
>> +    struct clock_event_device ced;
>> +    struct clocksource cs;
>> +    int id;
>> +    struct dmatmr_regs regs;
>> +};
>> +
>> +static u64 sched_dtim_clk_val;
>> +static void __iomem *dmatmr_sched_clk_counter;
>> +
>> +static struct dmatmr_priv *ced_to_priv(struct clock_event_device *ced)
>> +{
>> +    return container_of(ced, struct dmatmr_priv, ced);
>> +}
>> +
>> +static void sys_dtim_init(struct dmatmr_priv *priv)
>> +{
>> +    __raw_writel((priv->rate / HZ) - 1, priv->regs.dtrr);
>> +    __raw_writew(BIT(4) | BIT(1) | BIT(0), priv->regs.dtmr);
>> +    __raw_writeb(0, priv->regs.dtxmr);
>> +    __raw_writeb(1, priv->regs.dter);
>> +
>> +    dev_info(&priv->pdev->dev, "Initialized for sched_clock at %d 
>> hz", HZ);
>> +}
>> +
>> +static inline u64 notrace read_dtcn(void)
>> +{
>> +    return __raw_readl(dmatmr_sched_clk_counter);
>> +}
>> +
>> +static u64 notrace sys_dtim_read(void)
>> +{
>> +    return sched_dtim_clk_val + read_dtcn();
>> +}
>> +
>> +static u64 cfv4_read_dtimvalue(struct clocksource *cs)
>> +{
>> +    return sys_dtim_read();
>> +}
>> +
>> +static int cfv4_set_next_event(unsigned long delta,
>> +    struct clock_event_device *dev)
>> +{
>> +    struct dmatmr_priv *priv = ced_to_priv(dev);
>> +    unsigned long flags;
>> +
>> +    raw_spin_lock_irqsave(&priv->lock, flags);
>> +    /* read timer value */
>> +    sched_dtim_clk_val += read_dtcn();
>> +    raw_spin_unlock_irqrestore(&priv->lock, flags);
>> +
>> +    /* reset timer with delta cycle */
>> +    __raw_writew(0, priv->regs.dtmr);
>> +    __raw_writel(delta, priv->regs.dtrr);
>> +    __raw_writew(BIT(4) | BIT(1) | BIT(0), priv->regs.dtmr);
>> +
>> +    return 0;
>> +}
>> +
>> +static int cfv4_set_oneshot(struct clock_event_device *dev)
>> +{
>> +    struct dmatmr_priv *priv = ced_to_priv(dev);
>> +    unsigned long flags;
>> +
>> +    /* read timer value */
>> +    raw_spin_lock_irqsave(&priv->lock, flags);
>> +    sched_dtim_clk_val += read_dtcn();
>> +    raw_spin_unlock_irqrestore(&priv->lock, flags);
>> +
>> +    __raw_writew(0, priv->regs.dtmr);
>> +    return 0;
>> +}
>> +
>> +static irqreturn_t coldfire_dtim_clk_irq(int irq, void *dev)
>> +{
>> +    struct dmatmr_priv *priv = dev;
>> +    unsigned long flags;
>> +
>> +    /* acknowledge the IRQ */
>> +    __raw_writeb(BIT(0) | BIT(1), priv->regs.dter);
>> +
>> +    /* read timer value */
>> +    raw_spin_lock_irqsave(&priv->lock, flags);
>> +    sched_dtim_clk_val += read_dtcn();
>> +    raw_spin_unlock_irqrestore(&priv->lock, flags);
>> +
>> +    /* restart counter */
>> +    __raw_writel(0, dmatmr_sched_clk_counter);
>> +
>> +    priv->ced.event_handler(&priv->ced);
>> +
>> +    return IRQ_HANDLED;
>> +}
>> +
>> +static void mcf_dma_register_clocksource(struct dmatmr_priv *priv)
>> +{
>> +    struct clocksource *cs = &priv->cs;
>> +
>> +    cs->name = dev_name(&priv->pdev->dev);
>> +    cs->rating = 250;
>> +    cs->mask = CLOCKSOURCE_MASK(30);
>> +    cs->read = cfv4_read_dtimvalue;
>> +    cs->flags = CLOCK_SOURCE_IS_CONTINUOUS;
>> +
>> +    dev_info(&priv->pdev->dev, "registering clocksource\n");
>> +
>> +    clocksource_register_hz(cs, priv->rate);
>> +}
>> +
>> +static void mcf_dma_register_clockevent(struct dmatmr_priv *priv)
>> +{
>> +    struct clock_event_device *ced = &priv->ced;
>> +
>> +    ced->name = dev_name(&priv->pdev->dev);
>> +    ced->features = CLOCK_EVT_FEAT_ONESHOT;
>> +    ced->rating = 250;
>> +    ced->shift = 20;
>> +    ced->cpumask = cpumask_of(smp_processor_id());
>> +    ced->set_state_oneshot = cfv4_set_oneshot;
>> +    ced->set_next_event = cfv4_set_next_event;
>> +
>> +    dev_info(&priv->pdev->dev, "registering clockevent\n");
>> +
>> +    clockevents_config_and_register(ced, priv->rate, 2, 0xffffffff);
>> +}
>> +
>> +static void mcf_dma_init_registers(struct dmatmr_priv *priv)
>> +{
>> +    struct dmatmr_regs *regs = &priv->regs;
>> +
>> +    regs->dtmr = priv->base + 0x0;
>> +    regs->dtxmr = priv->base + 0x2;
>> +    regs->dter = priv->base + 0x3;
>> +    regs->dtrr = priv->base + 0x4;
>> +    regs->dtcr = priv->base + 0x8;
>> +    regs->dtcn = priv->base + 0xc;
> 
> Why define pointers for each register like this and not define
> the offsets and use those directly with the read/write calls?
> Something like this:
> 
>      #define DTER 3
> 
>      __raw_writeb(BIT(0) | BIT(1), priv->base + DTER)
> 
> For one thing the setup of variables here is losing the "void __iomem *" 
> type.
> I guess you get away with in this case because the __raw_read/__raw_write
> macros force volatile and casting and directly access.

Thanks, I will do that.
I also removed the raw_spin_locks as we always are in a IRQ disabled 
context when I use those. And in
sys_dtim_read() I changed it to:
return READ_ONCE(sched_dtim_clk_val) + read_dtcn();

If it makes sense ?

I sometimes have the issue I mentionned in 
https://lore.kernel.org/linux-m68k/125431ab-e486-43a7-a903-76c831da4985@yoseli.org/ 
: using cyclictest with high prio and short interval with a very high 
cpu usage and network with iperf3 or hping3 I get an unexpected IRQ vector.

I don't know how to debug this, but I think it is related to this 
driver, as I don't think I observed those in another context.

Thanks !
JM

> Regards
> Greg
> 
> 
>> +}
>> +
>> +static int __init mcf_dma_timer_probe(struct platform_device *pdev)
>> +{
>> +    struct dmatmr_priv *priv;
>> +    struct resource *prio_reg;
>> +    int irq, ret;
>> +
>> +    priv = kzalloc(sizeof(*priv), GFP_KERNEL);
>> +    if (!priv)
>> +        return -ENOMEM;
>> +
>> +    priv->pdev = pdev;
>> +    platform_set_drvdata(pdev, priv);
>> +
>> +    irq = platform_get_irq(pdev, 0);
>> +    if (irq < 0)
>> +        return irq;
>> +
>> +    priv->base = devm_platform_ioremap_resource(pdev, 0);
>> +    if (IS_ERR(priv->base))
>> +        return PTR_ERR(priv->base);
>> +
>> +    priv->id = pdev->id;
>> +
>> +    ret = devm_request_irq(&pdev->dev, irq, coldfire_dtim_clk_irq, 
>> IRQF_TIMER,
>> +                   dev_name(&pdev->dev), priv);
>> +    if (ret) {
>> +        dev_err(&pdev->dev, "failed to request irq %d\n", irq);
>> +        return ret;
>> +    }
>> +
>> +    prio_reg = platform_get_resource_byname(pdev, IORESOURCE_REG, 
>> "prio_reg");
>> +    if (prio_reg) {
>> +        /* Enhance the interrupt priority */
>> +        __raw_writeb(5, prio_reg->start);
>> +    }
>> +
>> +    priv->clk = devm_clk_get_enabled(&pdev->dev, NULL);
>> +    if (IS_ERR(priv->clk)) {
>> +        dev_err(&pdev->dev, "failed to get clock\n");
>> +        return PTR_ERR(priv->clk);
>> +    }
>> +
>> +    priv->rate = clk_get_rate(priv->clk);
>> +
>> +    raw_spin_lock_init(&priv->lock);
>> +
>> +    mcf_dma_init_registers(priv);
>> +    dmatmr_sched_clk_counter = priv->regs.dtcn;
>> +
>> +    mcf_dma_register_clockevent(priv);
>> +    mcf_dma_register_clocksource(priv);
>> +
>> +    /* initialize the system timer */
>> +    sys_dtim_init(priv);
>> +
>> +    sched_clock_register(sys_dtim_read, 32, priv->rate);
>> +
>> +    return 0;
>> +}
>> +
>> +static struct platform_driver mcf_platform_driver = {
>> +    .driver        = {
>> +        .name    = "mcftmr",
>> +    },
>> +};
>> +
>> +builtin_platform_driver_probe(mcf_platform_driver, mcf_dma_timer_probe);
>>
> 

