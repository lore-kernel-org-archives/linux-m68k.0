From: Angelo Dureghello <angelo@sysam.it>
Subject: Re: [PATCH 2/2] m68k: add coldfire mcf5307 i2c support
Date: Wed, 5 Oct 2016 14:52:44 +0200
Message-ID: <c20fff7d-c0b7-9686-0bf3-07c9183cd2ee@sysam.it>
References: <1475367536-20222-1-git-send-email-angelo@sysam.it>
 <fab8346c-9ae3-ab06-7be3-d6f0b74c0032@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sysam.it ([5.39.81.93]:60120 "EHLO sysam.it"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753229AbcJEMww (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
        Wed, 5 Oct 2016 08:52:52 -0400
In-Reply-To: <fab8346c-9ae3-ab06-7be3-d6f0b74c0032@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Greg Ungerer <gerg@linux-m68k.org>, linux-m68k@vger.kernel.org

Hi Greg,
thanks for the review,

On 05/10/2016 13:47, Greg Ungerer wrote:
> Hi Angelo,
>
> On 02/10/16 10:18, Angelo Dureghello wrote:
>> Add Steven King i2c driver for Coldfire, and reviewed to build
>> and run properly with the actual kernel version.
>
> This won't be able to be merged in this form.
> I can take the m68k/coldfire specific parts - but the i2c
> driver would need to go via the i2c maintainers (so you
> would need a patch to be sent and reveiwed on the i2c
> email list).
>
> I would prefer to merge the existing ColdFire i2c platform
> support I have for all platforms in any case.
>

mainly, i can test things to work properly only on mcf5307,
even i f i am developing some other coldfire boards, they are not
still ready.
Ok i leave i2c/rtc entirely out for now. But i promise to work on it
step by step to have it accepted if board part is accepted,
so at least i have a starting point.

> Regards
> Greg
>
>

Best regards,
Angelo Dureghello

>
>> Signed-off-by: Angelo Dureghello <angelo@sysam.it>
>> ---
>>  arch/m68k/coldfire/device.c      | 191 ++++++++++++++++
>>  arch/m68k/coldfire/m5307.c       |  12 +
>>  arch/m68k/include/asm/m5307sim.h |   8 +
>>  arch/m68k/include/asm/mcfi2c.h   |  29 +++
>>  drivers/i2c/busses/Kconfig       |  12 +
>>  drivers/i2c/busses/Makefile      |   1 +
>>  drivers/i2c/busses/i2c-mcf.c     | 463 +++++++++++++++++++++++++++++++++++++++
>>  7 files changed, 716 insertions(+)
>>  create mode 100644 arch/m68k/include/asm/mcfi2c.h
>>  create mode 100644 drivers/i2c/busses/i2c-mcf.c
>>
>> diff --git a/arch/m68k/coldfire/device.c b/arch/m68k/coldfire/device.c
>> index a0fc0c1..a1ed057 100644
>> --- a/arch/m68k/coldfire/device.c
>> +++ b/arch/m68k/coldfire/device.c
>> @@ -19,6 +19,7 @@
>>  #include <asm/mcfsim.h>
>>  #include <asm/mcfuart.h>
>>  #include <asm/mcfqspi.h>
>> +#include <asm/mcfi2c.h>
>>
>>  /*
>>   *    All current ColdFire parts contain from 2, 3, 4 or 10 UARTS.
>> @@ -327,6 +328,178 @@ static struct platform_device mcf_qspi = {
>>  };
>>  #endif /* IS_ENABLED(CONFIG_SPI_COLDFIRE_QSPI) */
>>
>> +#if IS_ENABLED(CONFIG_I2C_COLDFIRE)
>> +static struct resource mcf_i2c0_resources[] = {
>> +    {
>> +        .start          = MCFI2C_BASE0,
>> +        .end            = MCFI2C_BASE0 + MCFI2C_SIZE0 - 1,
>> +        .flags          = IORESOURCE_MEM,
>> +    },
>> +    {
>> +        .start          = MCF_IRQ_I2C0,
>> +        .end            = MCF_IRQ_I2C0,
>> +        .flags          = IORESOURCE_IRQ,
>> +    },
>> +};
>> +
>> +static struct mcfi2c_platform_data mcf_i2c0_platform_data = {
>> +    .bitrate                = 100000,
>> +};
>> +
>> +static struct platform_device mcf_i2c0 = {
>> +    .name                   = "mcfi2c",
>> +    .id                     = 0,
>> +    .num_resources          = ARRAY_SIZE(mcf_i2c0_resources),
>> +    .resource               = mcf_i2c0_resources,
>> +    .dev.platform_data      = &mcf_i2c0_platform_data,
>> +};
>> +#ifdef MCFI2C_BASE1
>> +
>> +static struct resource mcf_i2c1_resources[] = {
>> +    {
>> +        .start          = MCFI2C_BASE1,
>> +        .end            = MCFI2C_BASE1 + MCFI2C_SIZE1 - 1,
>> +        .flags          = IORESOURCE_MEM,
>> +    },
>> +    {
>> +        .start          = MCF_IRQ_I2C1,
>> +        .end            = MCF_IRQ_I2C1,
>> +        .flags          = IORESOURCE_IRQ,
>> +    },
>> +};
>> +
>> +static struct mcfi2c_platform_data mcf_i2c1_platform_data = {
>> +    .bitrate                = 100000,
>> +};
>> +
>> +static struct platform_device mcf_i2c1 = {
>> +    .name                   = "mcfi2c",
>> +    .id                     = 1,
>> +    .num_resources          = ARRAY_SIZE(mcf_i2c1_resources),
>> +    .resource               = mcf_i2c1_resources,
>> +    .dev.platform_data      = &mcf_i2c1_platform_data,
>> +};
>> +
>> +#endif /* MCFI2C_BASE1 */
>> +
>> +#ifdef MCFI2C_BASE2
>> +
>> +static struct resource mcf_i2c2_resources[] = {
>> +    {
>> +        .start          = MCFI2C_BASE2,
>> +        .end            = MCFI2C_BASE2 + MCFI2C_SIZE2 - 1,
>> +        .flags          = IORESOURCE_MEM,
>> +    },
>> +    {
>> +        .start          = MCF_IRQ_I2C2,
>> +        .end            = MCF_IRQ_I2C2,
>> +        .flags          = IORESOURCE_IRQ,
>> +    },
>> +};
>> +
>> +static struct mcfi2c_platform_data mcf_i2c2_platform_data = {
>> +    .bitrate                = 100000,
>> +};
>> +
>> +static struct platform_device mcf_i2c2 = {
>> +    .name                   = "mcfi2c",
>> +    .id                     = 2,
>> +    .num_resources          = ARRAY_SIZE(mcf_i2c2_resources),
>> +    .resource               = mcf_i2c2_resources,
>> +    .dev.platform_data      = &mcf_i2c2_platform_data,
>> +};
>> +
>> +#endif /* MCFI2C_BASE2 */
>> +
>> +#ifdef MCFI2C_BASE3
>> +
>> +static struct resource mcf_i2c3_resources[] = {
>> +    {
>> +        .start          = MCFI2C_BASE3,
>> +        .end            = MCFI2C_BASE3 + MCFI2C_SIZE3 - 1,
>> +        .flags          = IORESOURCE_MEM,
>> +    },
>> +    {
>> +        .start          = MCF_IRQ_I2C3,
>> +        .end            = MCF_IRQ_I2C3,
>> +        .flags          = IORESOURCE_IRQ,
>> +    },
>> +};
>> +
>> +static struct mcfi2c_platform_data mcf_i2c3_platform_data = {
>> +    .bitrate                = 100000,
>> +};
>> +
>> +static struct platform_device mcf_i2c3 = {
>> +    .name                   = "mcfi2c",
>> +    .id                     = 3,
>> +    .num_resources          = ARRAY_SIZE(mcf_i2c3_resources),
>> +    .resource               = mcf_i2c3_resources,
>> +    .dev.platform_data      = &mcf_i2c3_platform_data,
>> +};
>> +
>> +#endif /* MCFI2C_BASE3 */
>> +
>> +#ifdef MCFI2C_BASE4
>> +
>> +static struct resource mcf_i2c4_resources[] = {
>> +    {
>> +        .start          = MCFI2C_BASE4,
>> +        .end            = MCFI2C_BASE4 + MCFI2C_SIZE4 - 1,
>> +        .flags          = IORESOURCE_MEM,
>> +    },
>> +    {
>> +        .start          = MCF_IRQ_I2C4,
>> +        .end            = MCF_IRQ_I2C4,
>> +        .flags          = IORESOURCE_IRQ,
>> +    },
>> +};
>> +
>> +static struct mcfi2c_platform_data mcf_i2c4_platform_data = {
>> +    .bitrate                = 100000,
>> +};
>> +
>> +static struct platform_device mcf_i2c4 = {
>> +    .name                   = "mcfi2c",
>> +    .id                     = 4,
>> +    .num_resources          = ARRAY_SIZE(mcf_i2c4_resources),
>> +    .resource               = mcf_i2c4_resources,
>> +    .dev.platform_data      = &mcf_i2c4_platform_data,
>> +};
>> +
>> +#endif /* MCFI2C_BASE4 */
>> +
>> +#ifdef MCFI2C_BASE5
>> +
>> +static struct resource mcf_i2c5_resources[] = {
>> +    {
>> +        .start          = MCFI2C_BASE5,
>> +        .end            = MCFI2C_BASE5 + MCFI2C_SIZE5 - 1,
>> +        .flags          = IORESOURCE_MEM,
>> +    },
>> +    {
>> +        .start          = MCF_IRQ_I2C5,
>> +        .end            = MCF_IRQ_I2C5,
>> +        .flags          = IORESOURCE_IRQ,
>> +    },
>> +};
>> +
>> +static struct mcfi2c_platform_data mcf_i2c5_platform_data = {
>> +    .bitrate                = 100000,
>> +};
>> +
>> +static struct platform_device mcf_i2c5 = {
>> +    .name                   = "mcfi2c",
>> +    .id                     = 5,
>> +    .num_resources          = ARRAY_SIZE(mcf_i2c5_resources),
>> +    .resource               = mcf_i2c5_resources,
>> +    .dev.platform_data      = &mcf_i2c5_platform_data,
>> +};
>> +
>> +#endif /* MCFI2C_BASE5 */
>> +
>> +#endif /* IS_ENABLED(CONFIG_I2C_COLDFIRE) */
>> +
>>  static struct platform_device *mcf_devices[] __initdata = {
>>      &mcf_uart,
>>  #if IS_ENABLED(CONFIG_FEC)
>> @@ -338,6 +511,24 @@ static struct platform_device *mcf_devices[] __initdata = {
>>  #if IS_ENABLED(CONFIG_SPI_COLDFIRE_QSPI)
>>      &mcf_qspi,
>>  #endif
>> +#if IS_ENABLED(CONFIG_I2C_COLDFIRE)
>> +    &mcf_i2c0,
>> +#ifdef MCFI2C_BASE1
>> +    &mcf_i2c1,
>> +#endif
>> +#ifdef MCFI2C_BASE2
>> +    &mcf_i2c2,
>> +#endif
>> +#ifdef MCFI2C_BASE3
>> +    &mcf_i2c3,
>> +#endif
>> +#ifdef MCFI2C_BASE4
>> +    &mcf_i2c4,
>> +#endif
>> +#ifdef MCFI2C_BASE5
>> +    &mcf_i2c5,
>> +#endif
>> +#endif
>>  };
>>
>>  /*
>> diff --git a/arch/m68k/coldfire/m5307.c b/arch/m68k/coldfire/m5307.c
>> index 2da1d14..159485e 100644
>> --- a/arch/m68k/coldfire/m5307.c
>> +++ b/arch/m68k/coldfire/m5307.c
>> @@ -35,6 +35,7 @@ DEFINE_CLK(mcftmr0, "mcftmr.0", MCF_BUSCLK);
>>  DEFINE_CLK(mcftmr1, "mcftmr.1", MCF_BUSCLK);
>>  DEFINE_CLK(mcfuart0, "mcfuart.0", MCF_BUSCLK);
>>  DEFINE_CLK(mcfuart1, "mcfuart.1", MCF_BUSCLK);
>> +DEFINE_CLK(mcfi2c0, "mcfi2c.0", MCF_BUSCLK);
>>
>>  struct clk *mcf_clks[] = {
>>      &clk_pll,
>> @@ -43,9 +44,19 @@ struct clk *mcf_clks[] = {
>>      &clk_mcftmr1,
>>      &clk_mcfuart0,
>>      &clk_mcfuart1,
>> +    &clk_mcfi2c0,
>>      NULL
>>  };
>>
>> +static void __init m5307_i2c_init(void)
>> +{
>> +#if IS_ENABLED(CONFIG_I2C_COLDFIRE)
>> +    writeb(MCFSIM_ICR_AUTOVEC | MCFSIM_ICR_LEVEL5 | MCFSIM_ICR_PRI0,
>> +           MCFSIM_I2CICR);
>> +    mcf_mapirq2imr(MCF_IRQ_I2C0, MCFINTC_I2C);
>> +#endif /* IS_ENABLED(CONFIG_I2C_COLDFIRE) */
>> +}
>> +
>>  /***************************************************************************/
>>
>>  void __init config_BSP(char *commandp, int size)
>> @@ -73,6 +84,7 @@ void __init config_BSP(char *commandp, int size)
>>       */
>>      wdebug(MCFDEBUG_CSR, MCFDEBUG_CSR_PSTCLK);
>>  #endif
>> +    m5307_i2c_init();
>>  }
>>
>>  /***************************************************************************/
>> diff --git a/arch/m68k/include/asm/m5307sim.h b/arch/m68k/include/asm/m5307sim.h
>> index 5d0bb7e..608e04c 100644
>> --- a/arch/m68k/include/asm/m5307sim.h
>> +++ b/arch/m68k/include/asm/m5307sim.h
>> @@ -131,6 +131,12 @@
>>  #define MCFGPIO_IRQ_MAX        -1
>>  #define MCFGPIO_IRQ_VECBASE    -1
>>
>> +/*
>> + * I2C module.
>> + */
>> +#define MCFI2C_BASE0        (MCF_MBAR + 0x280)
>> +#define MCFI2C_SIZE0        0x40
>> +
>>
>>  /* Definition offset address for CS2-7  -- old mask 5307 */
>>
>> @@ -148,6 +154,7 @@
>>  #define    MCFSIM_SWDICR        MCFSIM_ICR0    /* Watchdog timer ICR */
>>  #define    MCFSIM_TIMER1ICR    MCFSIM_ICR1    /* Timer 1 ICR */
>>  #define    MCFSIM_TIMER2ICR    MCFSIM_ICR2    /* Timer 2 ICR */
>> +#define MCFSIM_I2CICR        MCFSIM_ICR3    /* I2C ICR */
>>  #define    MCFSIM_UART1ICR        MCFSIM_ICR4    /* UART 1 ICR */
>>  #define    MCFSIM_UART2ICR        MCFSIM_ICR5    /* UART 2 ICR */
>>  #define    MCFSIM_DMA0ICR        MCFSIM_ICR6    /* DMA 0 ICR */
>> @@ -174,6 +181,7 @@
>>  /*
>>   *    Define system peripheral IRQ usage.
>>   */
>> +#define MCF_IRQ_I2C0        29        /* I2C */
>>  #define    MCF_IRQ_TIMER        30        /* Timer0, Level 6 */
>>  #define    MCF_IRQ_PROFILER    31        /* Timer1, Level 7 */
>>  #define    MCF_IRQ_UART0        73        /* UART0 */
>> diff --git a/arch/m68k/include/asm/mcfi2c.h b/arch/m68k/include/asm/mcfi2c.h
>> new file mode 100644
>> index 0000000..a0c69e1
>> --- /dev/null
>> +++ b/arch/m68k/include/asm/mcfi2c.h
>> @@ -0,0 +1,29 @@
>> +/*
>> + * Definitions for Coldfire I2C interface
>> + */
>> +#ifndef mcfi2c_h
>> +#define mcfi2c_h
>> +
>> +#if defined(CONFIG_M5206) || defined(CONFIG_M5206e)
>> +#define MCFI2C_IOBASE  (MCF_MBAR + 0x1e0)
>> +#elif defined(CONFIG_M523x) || defined(CONFIG_M527x) || defined(CONFIG_M528x)
>> +#define MCFI2C_IOBASE  (MCF_IPSBAR + 0x300)
>> +#elif defined(CONFIG_M5249) || defined(CONFIG_M5307) || defined(CONFIG_M5407)
>> +#define MCFI2C_IOBASE  (MCF_MBAR + 0x280)
>> +#ifdef CONFIG_M5249
>> +#define MCFI2C_IOBASE2 (MCF_MBAR2 + 0x440)
>> +#endif
>> +#elif defined(CONFIG_M520x) || defined(CONFIG_M532x) || defined(CONFIG_M5445x)
>> +#define MCFI2C_IOBASE  0xFC058000
>> +#endif
>> +#define MCFI2C_IOSIZE   0x40
>> +
>> +/*
>> + * struct mcfi2c_platform_data - platform data for the coldfire i2c driver
>> + * @bitrate: bitrate to use for this i2c controller.
>> + */
>> +struct mcfi2c_platform_data {
>> +    u32 bitrate;
>> +};
>> +
>> +#endif /* mcfi2c_h */
>> diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
>> index 5c3993b..5c3e326 100644
>> --- a/drivers/i2c/busses/Kconfig
>> +++ b/drivers/i2c/busses/Kconfig
>> @@ -597,6 +597,18 @@ config I2C_IMX
>>        This driver can also be built as a module.  If so, the module
>>        will be called i2c-imx.
>>
>> +config I2C_COLDFIRE
>> +    tristate "Freescale Coldfire I2C driver"
>> +    depends on M5206 || M5206e || M520x || M523x || M5249 || \
>> +           M527x || M528x || M5307 || M532x || M5407
>> +    help
>> +      This driver supports the I2C interface availible on some Freescale
>> +      Coldfire processors (M520x, M523x, M5249, M5271, M5275, M528x,
>> +      M5307, M532x, M5407).
>> +
>> +      This driver can be built as a module.  If so, the module
>> +      will be called i2c-mcf.
>> +
>>  config I2C_IOP3XX
>>      tristate "Intel IOPx3xx and IXP4xx on-chip I2C interface"
>>      depends on ARCH_IOP32X || ARCH_IOP33X || ARCH_IXP4XX || ARCH_IOP13XX
>> diff --git a/drivers/i2c/busses/Makefile b/drivers/i2c/busses/Makefile
>> index 37f2819..17ad0c8 100644
>> --- a/drivers/i2c/busses/Makefile
>> +++ b/drivers/i2c/busses/Makefile
>> @@ -96,6 +96,7 @@ obj-$(CONFIG_I2C_XILINX)    += i2c-xiic.o
>>  obj-$(CONFIG_I2C_XLR)        += i2c-xlr.o
>>  obj-$(CONFIG_I2C_XLP9XX)    += i2c-xlp9xx.o
>>  obj-$(CONFIG_I2C_RCAR)        += i2c-rcar.o
>> +obj-$(CONFIG_I2C_COLDFIRE)      += i2c-mcf.o
>>
>>  # External I2C/SMBus adapter drivers
>>  obj-$(CONFIG_I2C_DIOLAN_U2C)    += i2c-diolan-u2c.o
>> diff --git a/drivers/i2c/busses/i2c-mcf.c b/drivers/i2c/busses/i2c-mcf.c
>> new file mode 100644
>> index 0000000..320531c
>> --- /dev/null
>> +++ b/drivers/i2c/busses/i2c-mcf.c
>> @@ -0,0 +1,463 @@
>> +/*
>> + * Freescale/Motorola Coldfire I2C driver.
>> + *
>> + * Copyright 2010 Steven King <sfking@fdwdc.com>
>> + *
>> + * Updated by Angelo Dureghello <angelo@sysam.it> Sep 2016
>> + *
>> + * This file is subject to the terms and conditions of the GNU General Public
>> + * License.  See the file COPYING in the main directory of this archive
>> + * for more details.
>> + */
>> +
>> +#include <linux/kernel.h>
>> +#include <linux/module.h>
>> +#include <linux/interrupt.h>
>> +#include <linux/errno.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/io.h>
>> +#include <linux/clk.h>
>> +#include <linux/err.h>
>> +#include <linux/i2c.h>
>> +#include <linux/slab.h>
>> +
>> +#include <asm/mcfi2c.h>
>> +
>> +#define DRIVER_NAME "mcfi2c"
>> +
>> +#define MCFI2C_ADR        0x00
>> +#define MCFI2C_FDR        0x04
>> +#define MCFI2C_CR        0x08
>> +#define    MCFI2C_CR_IEN        0x80
>> +#define    MCFI2C_CR_IIEN        0x40
>> +#define    MCFI2C_CR_MSTA        0x20
>> +#define    MCFI2C_CR_MTX        0x10
>> +#define    MCFI2C_CR_TXAK        0x08
>> +#define    MCFI2C_CR_RSTA        0x04
>> +#define MCFI2C_DR        0x10
>> +#define MCFI2C_SR        0x0C
>> +#define    MCFI2C_SR_ICF        0x80
>> +#define    MCFI2C_SR_IAAS        0x40
>> +#define    MCFI2C_SR_IBB        0x20
>> +#define    MCFI2C_SR_IAL        0x10
>> +#define    MCFI2C_SR_SRW        0x04
>> +#define    MCFI2C_SR_IIF        0x02
>> +#define    MCFI2C_SR_RXAK        0x01
>> +
>> +#define DEFAULT_I2C_BUS_SPEED    100000
>> +
>> +struct mcfi2c {
>> +    struct i2c_adapter      adapter;
>> +    void __iomem            *iobase;
>> +    int                     irq;
>> +    struct clk              *clk;
>> +    struct completion       completion;
>> +};
>> +
>> +static u8 mcfi2c_rd_cr(struct mcfi2c *mcfi2c)
>> +{
>> +    return readb(mcfi2c->iobase + MCFI2C_CR);
>> +}
>> +
>> +static void mcfi2c_wr_cr(struct mcfi2c *mcfi2c, u8 val)
>> +{
>> +    writeb(val, mcfi2c->iobase + MCFI2C_CR);
>> +}
>> +
>> +static u8 mcfi2c_rd_sr(struct mcfi2c *mcfi2c)
>> +{
>> +    return readb(mcfi2c->iobase + MCFI2C_SR);
>> +}
>> +
>> +static void mcfi2c_wr_sr(struct mcfi2c *mcfi2c, u8 val)
>> +{
>> +    writeb(val, mcfi2c->iobase + MCFI2C_SR);
>> +}
>> +
>> +static u8 mcfi2c_rd_dr(struct mcfi2c *mcfi2c)
>> +{
>> +    return readb(mcfi2c->iobase + MCFI2C_DR);
>> +}
>> +
>> +static void mcfi2c_wr_dr(struct mcfi2c *mcfi2c, u8 val)
>> +{
>> +    writeb(val, mcfi2c->iobase + MCFI2C_DR);
>> +}
>> +
>> +static void mcfi2c_start(struct mcfi2c *mcfi2c)
>> +{
>> +    mcfi2c_wr_cr(mcfi2c, MCFI2C_CR_IEN | MCFI2C_CR_IIEN | MCFI2C_CR_MSTA |
>> +            MCFI2C_CR_MTX);
>> +}
>> +
>> +static void mcfi2c_repeat_start(struct mcfi2c *mcfi2c)
>> +{
>> +    mcfi2c_wr_cr(mcfi2c, MCFI2C_CR_IEN | MCFI2C_CR_IIEN | MCFI2C_CR_MSTA |
>> +            MCFI2C_CR_MTX | MCFI2C_CR_RSTA);
>> +}
>> +
>> +static void mcfi2c_stop(struct mcfi2c *mcfi2c)
>> +{
>> +    mcfi2c_wr_cr(mcfi2c, MCFI2C_CR_IEN);
>> +}
>> +
>> +static void mcfi2c_tx_ack(struct mcfi2c *mcfi2c)
>> +{
>> +    mcfi2c_wr_cr(mcfi2c, MCFI2C_CR_IEN | MCFI2C_CR_IIEN | MCFI2C_CR_MSTA);
>> +}
>> +
>> +static void mcfi2c_tx_nak(struct mcfi2c *mcfi2c)
>> +{
>> +    mcfi2c_wr_cr(mcfi2c, MCFI2C_CR_IEN | MCFI2C_CR_IIEN | MCFI2C_CR_MSTA |
>> +            MCFI2C_CR_TXAK);
>> +}
>> +
>> +static irqreturn_t mcfi2c_irq_handler(int this_irq, void *dev_id)
>> +{
>> +    struct mcfi2c *mcfi2c = dev_id;
>> +
>> +    /* clear interrupt */
>> +    mcfi2c_wr_sr(mcfi2c, 0);
>> +    complete(&mcfi2c->completion);
>> +
>> +    return IRQ_HANDLED;
>> +}
>> +
>> +static void mcfi2c_reset(struct mcfi2c *mcfi2c)
>> +{
>> +    mcfi2c_wr_cr(mcfi2c, 0);
>> +    mcfi2c_wr_cr(mcfi2c, MCFI2C_CR_IEN | MCFI2C_CR_MSTA);
>> +    mcfi2c_rd_dr(mcfi2c);
>> +    mcfi2c_wr_sr(mcfi2c, 0);
>> +    mcfi2c_wr_cr(mcfi2c, 0);
>> +    mcfi2c_wr_cr(mcfi2c, MCFI2C_CR_IEN);
>> +}
>> +
>> +static void mcfi2c_wait_for_bus_idle(struct mcfi2c *mcfi2c)
>> +{
>> +    if (mcfi2c_rd_sr(mcfi2c) & MCFI2C_SR_IBB) {
>> +        unsigned long timeout = jiffies + HZ / 2;
>> +
>> +        do {
>> +            cond_resched();
>> +            if (time_after(jiffies, timeout)) {
>> +                mcfi2c_reset(mcfi2c);
>> +                break;
>> +            }
>> +        } while (mcfi2c_rd_sr(mcfi2c) & MCFI2C_SR_IBB);
>> +    }
>> +}
>> +
>> +static int mcfi2c_wait_for_bus_busy(struct mcfi2c *mcfi2c)
>> +{
>> +    u8 sr;
>> +
>> +    while (!((sr = mcfi2c_rd_sr(mcfi2c)) & MCFI2C_SR_IBB))
>> +        if (sr & MCFI2C_SR_IAL) {
>> +            mcfi2c_reset(mcfi2c);
>> +            return -EIO;
>> +        }
>> +
>> +    return 0;
>> +}
>> +
>> +static int mcfi2c_xmit(struct mcfi2c *mcfi2c, u16 addr, u16 flags, u8 *buf,
>> +            u16 len, int timeout, int more)
>> +{
>> +    if (!(mcfi2c_rd_cr(mcfi2c) & MCFI2C_CR_MSTA)) {
>> +        mcfi2c_wait_for_bus_idle(mcfi2c);
>> +
>> +        reinit_completion(&mcfi2c->completion);
>> +        mcfi2c_start(mcfi2c);
>> +
>> +        if (mcfi2c_wait_for_bus_busy(mcfi2c))
>> +            return -EIO;
>> +    }
>> +
>> +    mcfi2c_wr_dr(mcfi2c, (addr << 1) | (flags & I2C_M_RD));
>> +
>> +    while (wait_for_completion_timeout(&mcfi2c->completion, timeout)) {
>> +        u8 sr = mcfi2c_rd_sr(mcfi2c);
>> +
>> +        if (sr & MCFI2C_SR_IAL) {
>> +            mcfi2c_wr_sr(mcfi2c, ~MCFI2C_SR_IAL);
>> +            return -EIO;
>> +        } else if (mcfi2c_rd_cr(mcfi2c) & MCFI2C_CR_MTX) {
>> +            if (sr & MCFI2C_SR_RXAK) {
>> +                mcfi2c_stop(mcfi2c);
>> +                return -EIO;
>> +            } else if (flags & I2C_M_RD) {
>> +                if (len > 1)
>> +                    mcfi2c_tx_ack(mcfi2c);
>> +                else
>> +                    mcfi2c_tx_nak(mcfi2c);
>> +                /* dummy read */
>> +                mcfi2c_rd_dr(mcfi2c);
>> +            } else if (len--) {
>> +                mcfi2c_wr_dr(mcfi2c, *buf++);
>> +            } else {
>> +                if (more)
>> +                    mcfi2c_repeat_start(mcfi2c);
>> +                else
>> +                    mcfi2c_stop(mcfi2c);
>> +                return 0;
>> +            }
>> +        } else if (--len) {
>> +            if (!(len > 1))
>> +                mcfi2c_tx_nak(mcfi2c);
>> +            *buf++ = mcfi2c_rd_dr(mcfi2c);
>> +        } else {
>> +            if (more)
>> +                mcfi2c_repeat_start(mcfi2c);
>> +            else
>> +                mcfi2c_stop(mcfi2c);
>> +            *buf++ = mcfi2c_rd_dr(mcfi2c);
>> +            return 0;
>> +        }
>> +    }
>> +
>> +    mcfi2c_stop(mcfi2c);
>> +
>> +    return -ETIMEDOUT;
>> +}
>> +
>> +static int mcfi2c_xfer(struct i2c_adapter *adapter, struct i2c_msg *msgs,
>> +            int num)
>> +{
>> +    struct mcfi2c *mcfi2c = i2c_get_adapdata(adapter);
>> +    int cnt = 0;
>> +    int status;
>> +    int retries;
>> +
>> +    while (num--) {
>> +        retries = adapter->retries;
>> +        if (msgs->flags & ~I2C_M_RD)
>> +            return -EINVAL;
>> +
>> +        do {
>> +            status = mcfi2c_xmit(mcfi2c, msgs->addr, msgs->flags,
>> +                        msgs->buf, msgs->len,
>> +                        adapter->timeout, num);
>> +        } while (status && retries--);
>> +
>> +        if (status)
>> +            return status;
>> +        ++cnt;
>> +        ++msgs;
>> +    }
>> +
>> +    return cnt;
>> +}
>> +
>> +static u32 mcfi2c_func(struct i2c_adapter *adapter)
>> +{
>> +    return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL;
>> +}
>> +
>> +static const struct i2c_algorithm mcfi2c_algo = {
>> +    .master_xfer    = mcfi2c_xfer,
>> +    .functionality  = mcfi2c_func,
>> +};
>> +
>> +static const u16 mcfi2c_fdr[] = {
>> +      28,   30,   34,   40,   44,   48,   56,   68,
>> +      80,   88,  104,  128,  144,  160,  192,  240,
>> +     288,  320,  384,  480,  576,  640,  768,  960,
>> +    1152, 1280, 1536, 1920, 2304, 2560, 3072, 3840,
>> +      20,   22,   24,   26,   28,   32,   36,   40,
>> +      48,   56,   64,   72,   80,   96,  112,  128,
>> +     160,  192,  224,  256,  320,  384,  448,  512,
>> +     640,  768,  896, 1024, 1280, 1536, 1792, 2048
>> +};
>> +
>> +static u8 mcfi2c_calc_fdr(struct mcfi2c *mcfi2c,
>> +                struct mcfi2c_platform_data *pdata)
>> +{
>> +    u32 bitrate = (pdata && pdata->bitrate) ?
>> +            pdata->bitrate : DEFAULT_I2C_BUS_SPEED;
>> +    int div = clk_get_rate(mcfi2c->clk)/bitrate;
>> +    int r = 0, i = 0;
>> +
>> +    do {
>> +        if (abs(mcfi2c_fdr[i] - div) < abs(mcfi2c_fdr[r] - div))
>> +            r = i;
>> +    } while (++i < ARRAY_SIZE(mcfi2c_fdr));
>> +
>> +    return r;
>> +}
>> +
>> +static int mcfi2c_probe(struct platform_device *pdev)
>> +{
>> +    struct mcfi2c *mcfi2c;
>> +    struct resource *res;
>> +    int status;
>> +
>> +    mcfi2c = kzalloc(sizeof(*mcfi2c), GFP_KERNEL);
>> +    if (!mcfi2c)
>> +        return -ENOMEM;
>> +
>> +    res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>> +    if (!res) {
>> +        dev_dbg(&pdev->dev, "platform_get_resource failed\n");
>> +        status = -ENXIO;
>> +        goto fail0;
>> +    }
>> +
>> +    if (!request_mem_region(res->start, resource_size(res), pdev->name)) {
>> +        dev_dbg(&pdev->dev, "request_mem_region failed\n");
>> +        status = -EBUSY;
>> +        goto fail0;
>> +    }
>> +
>> +    mcfi2c->iobase = ioremap(res->start, resource_size(res));
>> +    if (!mcfi2c->iobase) {
>> +        dev_dbg(&pdev->dev, "ioremap failed\n");
>> +        status = -ENOMEM;
>> +        goto fail1;
>> +    }
>> +
>> +    mcfi2c->irq = platform_get_irq(pdev, 0);
>> +    if (mcfi2c->irq < 0) {
>> +        dev_dbg(&pdev->dev, "platform_get_irq failed\n");
>> +        status = -ENXIO;
>> +        goto fail2;
>> +    }
>> +    status = request_irq(mcfi2c->irq, mcfi2c_irq_handler, 0,
>> +                pdev->name, mcfi2c);
>> +    if (status) {
>> +        dev_dbg(&pdev->dev, "request_irq failed\n");
>> +        goto fail2;
>> +    }
>> +
>> +    mcfi2c->clk = clk_get(&pdev->dev, "i2c_clk");
>> +    if (IS_ERR(mcfi2c->clk)) {
>> +        dev_dbg(&pdev->dev, "clk_get failed\n");
>> +        status = PTR_ERR(mcfi2c->clk);
>> +        goto fail3;
>> +    }
>> +    clk_enable(mcfi2c->clk);
>> +
>> +    platform_set_drvdata(pdev, mcfi2c);
>> +
>> +    init_completion(&mcfi2c->completion);
>> +
>> +    writeb(mcfi2c_calc_fdr(mcfi2c, pdev->dev.platform_data),
>> +        mcfi2c->iobase + MCFI2C_FDR);
>> +
>> +    writeb(0x00, mcfi2c->iobase + MCFI2C_ADR);
>> +
>> +    mcfi2c_wr_cr(mcfi2c, MCFI2C_CR_IEN);
>> +
>> +    /* if the bus busy (IBB) is set, reset the controller */
>> +    if (mcfi2c_rd_sr(mcfi2c) & MCFI2C_SR_IBB)
>> +        mcfi2c_reset(mcfi2c);
>> +
>> +    mcfi2c->adapter.algo            = &mcfi2c_algo;
>> +    mcfi2c->adapter.class           = I2C_CLASS_HWMON | I2C_CLASS_SPD;
>> +    mcfi2c->adapter.dev.parent      = &pdev->dev;
>> +    mcfi2c->adapter.nr              = pdev->id;
>> +    mcfi2c->adapter.retries         = 2;
>> +    snprintf(mcfi2c->adapter.name, sizeof(mcfi2c->adapter.name),
>> +            DRIVER_NAME ".%d", pdev->id);
>> +
>> +    i2c_set_adapdata(&mcfi2c->adapter, mcfi2c);
>> +
>> +    status = i2c_add_numbered_adapter(&mcfi2c->adapter);
>> +    if (status < 0) {
>> +        dev_dbg(&pdev->dev, "i2c_add_numbered_adapter failed\n");
>> +        goto fail4;
>> +    }
>> +    dev_info(&pdev->dev, "Coldfire I2C bus driver\n");
>> +
>> +    return 0;
>> +
>> +fail4:
>> +    clk_disable(mcfi2c->clk);
>> +    clk_put(mcfi2c->clk);
>> +fail3:
>> +    free_irq(mcfi2c->irq, mcfi2c);
>> +fail2:
>> +    iounmap(mcfi2c->iobase);
>> +fail1:
>> +    release_mem_region(res->start, resource_size(res));
>> +fail0:
>> +    kfree(mcfi2c);
>> +
>> +    return status;
>> +}
>> +
>> +static int mcfi2c_remove(struct platform_device *pdev)
>> +{
>> +    struct mcfi2c *mcfi2c = platform_get_drvdata(pdev);
>> +    struct resource *res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>> +
>> +    /* disable the hardware */
>> +    mcfi2c_wr_cr(mcfi2c, 0);
>> +
>> +    platform_set_drvdata(pdev, NULL);
>> +    i2c_del_adapter(&mcfi2c->adapter);
>> +    clk_disable(mcfi2c->clk);
>> +    clk_put(mcfi2c->clk);
>> +    free_irq(mcfi2c->irq, mcfi2c);
>> +    iounmap(mcfi2c->iobase);
>> +    release_mem_region(res->start, resource_size(res));
>> +    kfree(mcfi2c);
>> +
>> +    return 0;
>> +}
>> +
>> +#ifdef CONFIG_PM
>> +static int mcfi2c_suspend(struct device *dev)
>> +{
>> +    struct mcfi2c *mcfi2c = platform_get_drvdata(to_platform_device(dev));
>> +
>> +    mcfi2c_wr_cr(mcfi2c, 0);
>> +    clk_disable(mcfi2c->clk);
>> +
>> +    return 0;
>> +}
>> +
>> +static int mcfi2c_resume(struct device *dev)
>> +{
>> +    struct mcfi2c *mcfi2c = platform_get_drvdata(to_platform_device(dev));
>> +
>> +    clk_enable(mcfi2c->clk);
>> +    mcfi2c_wr_cr(mcfi2c, MCFI2C_CR_IEN);
>> +
>> +    return 0;
>> +}
>> +
>> +static const struct dev_pm_ops mcfi2c_dev_pm_ops = {
>> +    .suspend        = mcfi2c_suspend,
>> +    .resume         = mcfi2c_resume,
>> +};
>> +
>> +#define MCFI2C_DEV_PM_OPS (&mcfi2c_dev_pm_ops)
>> +#else
>> +#define MCFI2C_DEV_PM_OPS NULL
>> +#endif
>> +
>> +static struct platform_driver mcfi2c_driver = {
>> +    .driver.name    = DRIVER_NAME,
>> +    .driver.owner   = THIS_MODULE,
>> +    .driver.pm      = MCFI2C_DEV_PM_OPS,
>> +    .remove         = mcfi2c_remove,
>> +};
>> +
>> +static int __init mcfi2c_init(void)
>> +{
>> +    return platform_driver_probe(&mcfi2c_driver, mcfi2c_probe);
>> +}
>> +module_init(mcfi2c_init);
>> +
>> +static void __exit mcfi2c_exit(void)
>> +{
>> +    platform_driver_unregister(&mcfi2c_driver);
>> +}
>> +module_exit(mcfi2c_exit);
>> +
>> +MODULE_AUTHOR("Steven King <sfking@fdwdc.com>");
>> +MODULE_DESCRIPTION("I2C-Bus support for Freescale Coldfire processors");
>> +MODULE_LICENSE("GPL");
>> +MODULE_ALIAS("platform:" DRIVER_NAME);
>> +
>>
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-m68k" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
