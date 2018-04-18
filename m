From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 10/10] net: New ax88796 platform driver for Amiga X-Surf
 100 Zorro board (m68k)
Date: Wed, 18 Apr 2018 09:54:11 +0200
Message-ID: <CAMuHMdXADXA8A=Jwwuy+FQoMPpbfJt2XFEbuhnQOmByQVVqWSQ@mail.gmail.com>
References: <1523916285-6057-1-git-send-email-schmitzmic@gmail.com>
 <1523916285-6057-11-git-send-email-schmitzmic@gmail.com> <CAMuHMdUnonyL93AmF3TdPcUPj5ZEuTb59ZgArH5BjLjcx8LcvA@mail.gmail.com>
 <CAOmrzkJVPn+zpaJTGhCpc=sSSZhBtbO_2BTGaVDpmNVm+VzAEg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <CAOmrzkJVPn+zpaJTGhCpc=sSSZhBtbO_2BTGaVDpmNVm+VzAEg@mail.gmail.com>
Sender: netdev-owner@vger.kernel.org
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: netdev <netdev@vger.kernel.org>, Linux/m68k <linux-m68k@vger.kernel.org>, Michael Karcher <Michael.Karcher@fu-berlin.de>, Michael Karcher <kernel@mkarcher.dialup.fu-berlin.de>
List-Id: linux-m68k@vger.kernel.org

Hi Michael,

On Wed, Apr 18, 2018 at 12:35 AM, Michael Schmitz <schmitzmic@gmail.com> wrote:
> On Wed, Apr 18, 2018 at 1:53 AM, Geert Uytterhoeven
> <geert@linux-m68k.org> wrote:
>> On Tue, Apr 17, 2018 at 12:04 AM, Michael Schmitz <schmitzmic@gmail.com> wrote:
>>> Add platform device driver to populate the ax88796 platform data from
>>> information provided by the XSurf100 zorro device driver.
>>> This driver will have to be loaded before loading the ax88796 module,
>>> or compiled as built-in.

>>> --- /dev/null
>>> +++ b/drivers/net/ethernet/8390/xsurf100.c

>>> +static int xsurf100_probe(struct zorro_dev *zdev,
>>> +                         const struct zorro_device_id *ent)
>>> +{
>>
>>> +       /* error handling for ioremap regs */
>>> +       if (!ax88796_data.base_regs) {
>>> +               dev_err(&zdev->dev, "Cannot ioremap area %p (registers)\n",
>>> +                       (void *)zdev->resource.start);
>>
>> Please use %pR to format struct resource.
>> Documentation/core-api/printk-formats.rst
>
> The driver uses ioremap to map two subsections of the mem resource for
> two different purposes - control register access, and ring buffer
> access. The output of %pR may be misleading here (wrong size), and
> even more so below.

Sorry, I missed it's the same resource.

FWIW, if you want to print a phys_addr_t or resource_size_t, you can
use %pa, e.g.

   dev_err(..., "... %pa ...", ... &zdev->resource.start ...);

>>> +       /* error handling for ioremap data */
>>> +       if (!ax88796_data.data_area) {
>>> +               dev_err(&zdev->dev, "Cannot ioremap area %p (32-bit access)\n",
>>> +                       (void *)zdev->resource.start + XS100_8390_DATA32_BASE);
>>
>> %pR
>
> I've added the offset into the mem resource here to clarify what we've
> tried to map.

That's an alternative solution, fine for me.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
