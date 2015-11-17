From: Michael Karcher <kernel@mkarcher.dialup.fu-berlin.de>
Subject: Re: [PATCH 7/8] ax88796: Add X-Surf 100 zorro driver providing an
 ax88796 platform device
Date: Tue, 17 Nov 2015 18:59:19 +0100
Message-ID: <564B6AF7.3010203@mkarcher.dialup.fu-berlin.de>
References: <1447716797-20906-1-git-send-email-schmitzmic@gmail.com>	<1447716797-20906-8-git-send-email-schmitzmic@gmail.com> <CAMuHMdWVWP+uQ8iYD4PraCcMiQ4oOyno1CDe64R_p6XJzuJZTg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66]:42826 "EHLO
	outpost1.zedat.fu-berlin.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751701AbbKQSG4 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>);
	Tue, 17 Nov 2015 13:06:56 -0500
In-Reply-To: <CAMuHMdWVWP+uQ8iYD4PraCcMiQ4oOyno1CDe64R_p6XJzuJZTg@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>, Michael Schmitz <schmitzmic@gmail.com>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>, Debian m68k <debian-68k@lists.debian.org>

Hello Geert,

thanks for your comments!

On 17.11.2015 09:16, Geert Uytterhoeven wrote:
>> +static int xsurf100_probe(struct zorro_dev *zdev, const struct zorro_device_id *ent)
>> +{
>> +       struct platform_device *pdev;
>> +       struct ax_plat_data ax88796_data;
>> +       struct resource res[2] = {
>> +               DEFINE_RES_IRQ(IRQ_AMIGA_PORTS),
>> +               DEFINE_RES_IO(zdev->resource.start + XS1000_8390_BASE, 4 * 0x20)
>> +       };
>> +       int reg;
>> +       u32 reg_offsets[32];
>> +
>> +       for (reg = 0; reg < 0x20; reg++)
>> +               reg_offsets[reg] = 4;
>> +
>> +       ax88796_data.flags = AXFLG_HAS_EEPROM;
>> +       ax88796_data.wordlength = 2;
>> +       ax88796_data.dcr_val = 0x48;
>> +       ax88796_data.rcr_val = 0x40;
>> +       ax88796_data.reg_offsets = reg_offsets;
>> +
>> +       // TODO: xsurf100 specific accelerated data exchange
>> +
>> +       pdev = platform_device_register_resndata(
>> +               &zdev->dev, "ax88796", zdev->slotaddr,
>> +               res, 2,
>> +               &ax88796_data, sizeof ax88796_data);
>> +
>> +       // TODO: NULL check
>> +       zorro_set_drvdata(zdev, pdev);
> This looks a bit strange to me: storing another platform device in the
> driver-specific data. But I guess it's valid ;-)
We get a zorro device from the amiga subsystem for each XSurf 100 board
installed in the machine. I want to bind the platform driver ax88796 to
a subrange of the address space of the XSurf 100. To get the platform
driver bound, I think I need to create a platform device (for each XSurf
100 Zorro device, so I can't have a static platform device allocated in
the Zorro driver). If I dynamically create a platform device, I have to
save the pointer somewhere, so I can remove the platform device when the
module gets unloaded. For me, the obvious place to store the pointer is
the driver-specific data of the Zorro device.
If you have a different suggestion on how to connect the ax88796
platform driver to a Zorro device that looks less strange to you, I am
happy to learn a different way.

> BTW, as most Zorro boards are made of one or more "discrete" devices
> (e.g. an IDE and Ethernet combo), but only one zorro_driver can bind to it,
> I started converting Zorro drivers to MFD drivers a few years ago.
The mfd framework might in fact be the different way I should learn
about. It feels a bit like the approach I used in xsurf100.c is
reinventing the mfd stuff, but I still have to find good documentation
on how to use the mfd framework. I didn't find anything in
linux/Documentation, and the comments in linux/include/linux/mfd/core.h
have a quite steep learning curve.

> Unfortunately I still haven't finished that.
> It would also make it simpler to embed a normal ax88796 platform device.
I don't see yet how your conversion of present Zorro drivers would help
for this new xsurf100 driver. On the other hand, if you just meant to
point out using a mfd driver instead of the "create platform devices by
hand" approach, *like* you are using for other drivers, I got your point
and you are likely right.
>> +static struct zorro_device_id xsurf100_zorro_tbl[] = {
> const
Of course. Thanks for pointing it out.

BTW: for me, the patch-set was trivially forward-ported by git rebasing
to 4.4-rc1

Kind regards,
  Michael Karcher
