From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 10/10] net: New ax88796 platform driver for Amiga X-Surf
 100 Zorro board (m68k)
Date: Tue, 17 Apr 2018 15:53:37 +0200
Message-ID: <CAMuHMdUnonyL93AmF3TdPcUPj5ZEuTb59ZgArH5BjLjcx8LcvA@mail.gmail.com>
References: <1523916285-6057-1-git-send-email-schmitzmic@gmail.com> <1523916285-6057-11-git-send-email-schmitzmic@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <1523916285-6057-11-git-send-email-schmitzmic@gmail.com>
Sender: netdev-owner@vger.kernel.org
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: netdev <netdev@vger.kernel.org>, Linux/m68k <linux-m68k@vger.kernel.org>, Michael.Karcher@fu-berlin.de, Michael Karcher <kernel@mkarcher.dialup.fu-berlin.de>
List-Id: linux-m68k@vger.kernel.org

Hi Michael,

Thanks for your patch!

On Tue, Apr 17, 2018 at 12:04 AM, Michael Schmitz <schmitzmic@gmail.com> wrote:
> Add platform device driver to populate the ax88796 platform data from
> information provided by the XSurf100 zorro device driver.
> This driver will have to be loaded before loading the ax88796 module,
> or compiled as built-in.

Is that really true? The platform device should be probed when both the
device and driver have been registered, but order shouldn't matter.

> Signed-off-by: Michael Karcher <kernel@mkarcher.dialup.fu-berlin.de>

Missing "From: Michael Karcher ..."?

> Signed-off-by: Michael Schmitz <schmitzmic@gmail.com>

> --- a/drivers/net/ethernet/8390/Kconfig
> +++ b/drivers/net/ethernet/8390/Kconfig
> @@ -30,7 +30,7 @@ config PCMCIA_AXNET
>
>  config AX88796
>         tristate "ASIX AX88796 NE2000 clone support"
> -       depends on (ARM || MIPS || SUPERH)
> +       depends on (ARM || MIPS || SUPERH || AMIGA)

s/AMIGA/ZORRO/, for consistency with the below.

>         select CRC32
>         select PHYLIB
>         select MDIO_BITBANG
> @@ -45,6 +45,18 @@ config AX88796_93CX6
>         ---help---
>           Select this if your platform comes with an external 93CX6 eeprom.
>
> +config XSURF100
> +       tristate "Amiga XSurf 100 AX88796/NE2000 clone support"
> +       depends on ZORRO
> +       depends on AX88796

It's a bit unfortunate the user has to enable _two_ config options to enable
this driver.

I see two solutions for that:

1) Hide the XSURF100 symbol, so it gets enabled automatically if AX88796 is
   enabled on a Zorro bus system:

    config XSURF100
            tristate
            depends on ZORRO
            default AX88796

2) Hide the AX88796 symbol, and let it be selected by XSURF100:

    config AX88796
            tristate "ASIX AX88796 NE2000 clone support" if !ZORRO
            depends on ARM || MIPS || SUPERH || ZORRO
            ...

    config XSURF100
            tristate "Amiga XSurf 100 AX88796/NE2000 clone support"
            depends on ZORRO
            select AX88796

> --- /dev/null
> +++ b/drivers/net/ethernet/8390/xsurf100.c
> @@ -0,0 +1,411 @@
> +#include <linux/module.h>
> +#include <linux/netdevice.h>
> +#include <linux/platform_device.h>
> +#include <linux/zorro.h>
> +#include <net/ax88796.h>
> +#include <asm/amigaints.h>
> +
> +#define ZORRO_PROD_INDIVIDUAL_COMPUTERS_X_SURF100 \
> +               ZORRO_ID(INDIVIDUAL_COMPUTERS, 0x64, 0)

Another long define to get rid of? ;-)

> +/* Hard reset the card. This used to pause for the same period that a
> + * 8390 reset command required, but that shouldn't be necessary.
> + */
> +static void ax_reset_8390(struct net_device *dev)
> +{
> +       struct ei_device *ei_local = netdev_priv(dev);
> +       unsigned long reset_start_time = jiffies;
> +       void __iomem *addr = (void __iomem *)dev->base_addr;
> +
> +       netif_dbg(ei_local, hw, dev, "resetting the 8390 t=%ld...\n", jiffies);
> +
> +       ei_outb(ei_inb(addr + NE_RESET), addr + NE_RESET);
> +
> +       ei_local->txing = 0;
> +       ei_local->dmaing = 0;
> +
> +       /* This check _should_not_ be necessary, omit eventually. */
> +       while ((ei_inb(addr + EN0_ISR) & ENISR_RESET) == 0) {
> +               if (time_after(jiffies, reset_start_time + 2 * HZ / 100)) {
> +                       netdev_warn(dev, "%s: did not complete.\n", __func__);
> +                       break;
> +               }

cpu_relax()?

How long does this usually take? If > 1 ms, you can use e.g. msleep(1)
instead of cpu_relax().


> +       }
> +
> +       ei_outb(ENISR_RESET, addr + EN0_ISR);   /* Ack intr. */
> +}

> +       if (ei_local->dmaing) {
> +               netdev_err(dev,
> +                          "DMAing conflict in %s "
> +                          "[DMAstat:%d][irqlock:%d].\n",

Please don't split error messages, as that makes it more difficult to
grep for them.

> +                          __func__,
> +                          ei_local->dmaing, ei_local->irqlock);
> +               return;

> +static int xsurf100_probe(struct zorro_dev *zdev,
> +                         const struct zorro_device_id *ent)
> +{

> +       /* error handling for ioremap regs */
> +       if (!ax88796_data.base_regs) {
> +               dev_err(&zdev->dev, "Cannot ioremap area %p (registers)\n",
> +                       (void *)zdev->resource.start);

Please use %pR to format struct resource.
Documentation/core-api/printk-formats.rst

> +       /* error handling for ioremap data */
> +       if (!ax88796_data.data_area) {
> +               dev_err(&zdev->dev, "Cannot ioremap area %p (32-bit access)\n",
> +                       (void *)zdev->resource.start + XS100_8390_DATA32_BASE);

%pR

> +static void xsurf100_remove(struct zorro_dev *zdev)
> +{
> +       struct platform_device *pdev;
> +       struct xsurf100_ax_plat_data *xs100;
> +
> +       pdev = zorro_get_drvdata(zdev);
> +       xs100 = dev_get_platdata(&pdev->dev);

struct platform_device *pdev = pdev = zorro_get_drvdata(zdev);
struct xsurf100_ax_plat_data *xs100 = dev_get_platdata(&pdev->dev);

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
