From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 7/8] ax88796: Add X-Surf 100 zorro driver providing an
 ax88796 platform device
Date: Tue, 17 Nov 2015 09:16:48 +0100
Message-ID: <CAMuHMdWVWP+uQ8iYD4PraCcMiQ4oOyno1CDe64R_p6XJzuJZTg@mail.gmail.com>
References: <1447716797-20906-1-git-send-email-schmitzmic@gmail.com>
	<1447716797-20906-8-git-send-email-schmitzmic@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-oi0-f51.google.com ([209.85.218.51]:33328 "EHLO
	mail-oi0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751438AbbKQIQt (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 17 Nov 2015 03:16:49 -0500
Received: by oixx65 with SMTP id x65so726691oix.0
        for <linux-m68k@vger.kernel.org>; Tue, 17 Nov 2015 00:16:48 -0800 (PST)
In-Reply-To: <1447716797-20906-8-git-send-email-schmitzmic@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>, Debian m68k <debian-68k@lists.debian.org>, Michael Karcher <kernel@mkarcher.dialup.fu-berlin.de>

Hi Michael,

On Tue, Nov 17, 2015 at 12:33 AM, Michael Schmitz <schmitzmic@gmail.com> wrote:
> --- /dev/null
> +++ b/drivers/net/ethernet/8390/xsurf100.c
> @@ -0,0 +1,71 @@

> +static int xsurf100_probe(struct zorro_dev *zdev, const struct zorro_device_id *ent)
> +{
> +       struct platform_device *pdev;
> +       struct ax_plat_data ax88796_data;
> +       struct resource res[2] = {
> +               DEFINE_RES_IRQ(IRQ_AMIGA_PORTS),
> +               DEFINE_RES_IO(zdev->resource.start + XS1000_8390_BASE, 4 * 0x20)
> +       };
> +       int reg;
> +       u32 reg_offsets[32];
> +
> +       for (reg = 0; reg < 0x20; reg++)
> +               reg_offsets[reg] = 4;
> +
> +       ax88796_data.flags = AXFLG_HAS_EEPROM;
> +       ax88796_data.wordlength = 2;
> +       ax88796_data.dcr_val = 0x48;
> +       ax88796_data.rcr_val = 0x40;
> +       ax88796_data.reg_offsets = reg_offsets;
> +
> +       // TODO: xsurf100 specific accelerated data exchange
> +
> +       pdev = platform_device_register_resndata(
> +               &zdev->dev, "ax88796", zdev->slotaddr,
> +               res, 2,
> +               &ax88796_data, sizeof ax88796_data);
> +
> +       // TODO: NULL check
> +       zorro_set_drvdata(zdev, pdev);

This looks a bit strange to me: storing another platform device in the
driver-specific data. But I guess it's valid ;-)

BTW, as most Zorro boards are made of one or more "discrete" devices
(e.g. an IDE and Ethernet combo), but only one zorro_driver can bind to it,
I started converting Zorro drivers to MFD drivers a few years ago.
Unfortunately I still haven't finished that.
It would also make it simpler to embed a normal ax88796 platform device.

> +       return 0;
> +}

> +static struct zorro_device_id xsurf100_zorro_tbl[] = {

const

> +       { ZORRO_PROD_INDIVIDUAL_COMPUTERS_X_SURF100, },
> +       { 0 }
> +};

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
