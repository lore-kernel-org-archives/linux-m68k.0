From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 7/8] ax88796: Add X-Surf 100 zorro driver providing an
 ax88796 platform device
Date: Tue, 17 Nov 2015 21:01:16 +0100
Message-ID: <CAMuHMdUM=__4sHx9R0teM3sMncR1pkxozTimhZDrdZZs_DWXnA@mail.gmail.com>
References: <1447716797-20906-1-git-send-email-schmitzmic@gmail.com>
	<1447716797-20906-8-git-send-email-schmitzmic@gmail.com>
	<CAMuHMdWVWP+uQ8iYD4PraCcMiQ4oOyno1CDe64R_p6XJzuJZTg@mail.gmail.com>
	<564B6AF7.3010203@mkarcher.dialup.fu-berlin.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-ob0-f171.google.com ([209.85.214.171]:33899 "EHLO
	mail-ob0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751822AbbKQUBR (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 17 Nov 2015 15:01:17 -0500
Received: by obbbj7 with SMTP id bj7so15851057obb.1
        for <linux-m68k@vger.kernel.org>; Tue, 17 Nov 2015 12:01:16 -0800 (PST)
In-Reply-To: <564B6AF7.3010203@mkarcher.dialup.fu-berlin.de>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Karcher <kernel@mkarcher.dialup.fu-berlin.de>
Cc: Michael Schmitz <schmitzmic@gmail.com>, Linux/m68k <linux-m68k@vger.kernel.org>, Debian m68k <debian-68k@lists.debian.org>

Hi Michael,

On Tue, Nov 17, 2015 at 6:59 PM, Michael Karcher
<kernel@mkarcher.dialup.fu-berlin.de> wrote:
> On 17.11.2015 09:16, Geert Uytterhoeven wrote:
>>> +static int xsurf100_probe(struct zorro_dev *zdev, const struct zorro_device_id *ent)
>>> +{
>>> +       struct platform_device *pdev;
>>> +       struct ax_plat_data ax88796_data;
>>> +       struct resource res[2] = {
>>> +               DEFINE_RES_IRQ(IRQ_AMIGA_PORTS),
>>> +               DEFINE_RES_IO(zdev->resource.start + XS1000_8390_BASE, 4 * 0x20)
>>> +       };
>>> +       int reg;
>>> +       u32 reg_offsets[32];
>>> +
>>> +       for (reg = 0; reg < 0x20; reg++)
>>> +               reg_offsets[reg] = 4;
>>> +
>>> +       ax88796_data.flags = AXFLG_HAS_EEPROM;
>>> +       ax88796_data.wordlength = 2;
>>> +       ax88796_data.dcr_val = 0x48;
>>> +       ax88796_data.rcr_val = 0x40;
>>> +       ax88796_data.reg_offsets = reg_offsets;
>>> +
>>> +       // TODO: xsurf100 specific accelerated data exchange
>>> +
>>> +       pdev = platform_device_register_resndata(
>>> +               &zdev->dev, "ax88796", zdev->slotaddr,
>>> +               res, 2,
>>> +               &ax88796_data, sizeof ax88796_data);
>>> +
>>> +       // TODO: NULL check
>>> +       zorro_set_drvdata(zdev, pdev);
>> This looks a bit strange to me: storing another platform device in the
>> driver-specific data. But I guess it's valid ;-)
> We get a zorro device from the amiga subsystem for each XSurf 100 board
> installed in the machine. I want to bind the platform driver ax88796 to
> a subrange of the address space of the XSurf 100. To get the platform
> driver bound, I think I need to create a platform device (for each XSurf
> 100 Zorro device, so I can't have a static platform device allocated in
> the Zorro driver). If I dynamically create a platform device, I have to
> save the pointer somewhere, so I can remove the platform device when the
> module gets unloaded. For me, the obvious place to store the pointer is
> the driver-specific data of the Zorro device.
> If you have a different suggestion on how to connect the ax88796
> platform driver to a Zorro device that looks less strange to you, I am
> happy to learn a different way.

Sure, I understand why you're doing it.

>> BTW, as most Zorro boards are made of one or more "discrete" devices
>> (e.g. an IDE and Ethernet combo), but only one zorro_driver can bind to it,
>> I started converting Zorro drivers to MFD drivers a few years ago.
> The mfd framework might in fact be the different way I should learn
> about. It feels a bit like the approach I used in xsurf100.c is
> reinventing the mfd stuff, but I still have to find good documentation
> on how to use the mfd framework. I didn't find anything in
> linux/Documentation, and the comments in linux/include/linux/mfd/core.h
> have a quite steep learning curve.

Yeah, it looks quite complex ;-)

But in the end it's just about calling mfd_add_devices(), which will
create the needed platform_device(s) for you from a list of mfd "cells".

>> Unfortunately I still haven't finished that.
>> It would also make it simpler to embed a normal ax88796 platform device.
> I don't see yet how your conversion of present Zorro drivers would help
> for this new xsurf100 driver. On the other hand, if you just meant to
> point out using a mfd driver instead of the "create platform devices by
> hand" approach, *like* you are using for other drivers, I got your point
> and you are likely right.

Yes, that's what the MFD subsystem is about.

I've pushed my work-in-progress to
https://git.kernel.org/cgit/linux/kernel/git/geert/linux-m68k.git/log/?h=zorro-mfd

Please have a look at the various drivers/zorro/*-mfd.c files for inspiration.
drivers/zorro/8390-cell.c is a dummy cell driver, which is basically a
platform device driver. For X-Surf 100 that would be the existing ax88796
driver.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
