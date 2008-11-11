From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: [PATCH] Add SWIM floppy support for m68k Macs.
Date: Tue, 11 Nov 2008 20:43:22 +1100 (EST)
Message-ID: <Pine.LNX.4.64.0811112020340.26755@loopy.telegraphics.com.au>
References: <12255325912043-git-send-email-Laurent@lvivier.info>
 <Pine.LNX.4.64.0811020947320.5281@anakin> <AC634DD2-CE12-4975-BB8E-B564C7DFDC06@lvivier.info>
 <20081102212852.GA8162@cynthia.pants.nu> <Pine.LNX.4.64.0811031102090.10345@loopy.telegraphics.com.au>
 <Pine.LNX.4.64.0811091711150.19341@anakin> <Pine.LNX.4.64.0811101041560.365@loopy.telegraphics.com.au>
 <Pine.LNX.4.64.0811110937580.19341@anakin>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from loopy.telegraphics.com.au ([202.45.126.152]:43393 "EHLO
	loopy.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754731AbYKKJnZ (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 11 Nov 2008 04:43:25 -0500
In-Reply-To: <Pine.LNX.4.64.0811110937580.19341@anakin>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Brad Boyer <flar@allandria.com>, Laurent Vivier <Laurent@lvivier.info>, linux-m68k@vger.kernel.org



On Tue, 11 Nov 2008, Geert Uytterhoeven wrote:

> On Mon, 10 Nov 2008, Finn Thain wrote:
> > On Sun, 9 Nov 2008, Geert Uytterhoeven wrote:
> > > On Mon, 3 Nov 2008, Finn Thain wrote:
> > > > I agree with Geert. Ignore my comment about device_initcall -- I 
> > > > was looking at via-cuda.c but that is not a good example. 
> > > > drivers/scsi/mac_esp.c is a better example.
> > > > 
> > > > esp_mac_probe checks the macintosh_config entry. That and 
> > > > esp_mac_remove are the platform device entry points Geert referred 
> > > > to. The module entry points are mac_esp_init and mac_esp_exit. I 
> > > > think you could use either of the platform device probe routine or 
> > > > the module init routine to set the base address.
> > > 
> > > Ideally, the _probe() routine should not look at the bits in 
> > > macintosh_config, but only at the platform device and its resources.
> > 
> > Makes sense.
> > 
> > > The creation of the platform device should be moved to 
> > > arch/m68k/mac/config
> > 
> > That means adding #if CONFIG_BLK_DEV_SWIM to config.c.
> 
> No, its creation code should not depend on any config option (except 
> CONFIG_MAC :-). This means the platform device will always be created 
> when the physical hardware is present.

So we create a global platform device pointer for every possible mac 
device regardless of whether they're enabled in Kconfig or not?

(Not that I'm not going to complain about a few bytes if the benefit 
outweighs the disadvantages. I'm just trying to understand both.)

> > It also makes drivers/block/swim.c less cohesive.
> 
> When the device framework was introduced, platform devices and platform 
> drivers were handled in the driver (source file) itself. Later it was 
> realized this was actually a mistake, and the platform devices and 
> platform drivers were separated.

I've heard that "mistake" mentioned before, but I've never heard an 
explanation (i.e. why this might be a problem for say, macmace, mac_sonic 
or mac_esp -- or swim).

> > > which would create the platform device, and only if the bits in 
> > > macintosh_config indicate that the hardware is present. The actual 
> > > value of swim_base can be stored in a struct resource linked to the 
> > > platform device.
> > 
> > I'm probably missing something here, but I can see some benefit in 
> > doing this only in the absence of a global macintosh_config.
> > 
> > But if you didn't have a global macintosh_config, several parts of 
> > macintosh_config (especially macintosh_config->ident) would end up 
> > duplicated in each of the struct resources for the platform devices, 
> > no?
> 
> You need some logic to device whether to create a platform device or 
> not. On Mac, the logical way is to look in the macintosh_config table.

Well, I can some the benefit as long as that logic doesn't leak out of 
config.c, as it does now.

> On Amiga, you would use
> 
>     if (AMIGAHW_PRESENT(AMI_XXX))
> 	platform_device_register{,_simple}(...);
> 
> Converting the existing Amiga drivers is somewhere on my todo-list 
> (since a just way too long time)...

I guess there must be an example somewhere I can look at to try to 
understand this?

> > Would you explain it is we gain from moving platform init routines 
> > into config.c? I can only see disadvantages.
> 
> The device framework is the recommended way to handle devices and 
> drivers across all Linux platforms.
> 
> All existing platform devices show up under /sys/devices/platform/. 
> Based on this information, the device entry in /dev can be created 
> automatically, and the corresponding platform driver loadable kernel 
> modules can be loaded automatically.
> 
> E.g. you no longer have to specify in /etc/modules.conf which floppy driver
> to load. Currently you have to choose one of:
> 
>     alias block-major-2 amiflop
>     alias block-major-2 ataflop
>     alias block-major-2 swim3

Fair enough, but doesn't the patch you objected to already do that?

Finn

> Gr{oetje,eeting}s,
> 
> 						Geert
> 
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
> 							    -- Linus Torvalds
> 
