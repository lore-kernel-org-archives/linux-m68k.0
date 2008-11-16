From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH][v5] Add SWIM floppy support for m68k Macs.
Date: Sun, 16 Nov 2008 11:52:50 +0100 (CET)
Message-ID: <Pine.LNX.4.64.0811161140280.5978@anakin>
References: <03320726-C601-4EE0-8337-1821119EF3FF@lvivier.info>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from monty.telenet-ops.be ([195.130.132.56]:50203 "EHLO
	monty.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752264AbYKPKwx (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 16 Nov 2008 05:52:53 -0500
In-Reply-To: <03320726-C601-4EE0-8337-1821119EF3FF@lvivier.info>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Laurent Vivier <laurent@lvivier.info>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>

On Sat, 15 Nov 2008, Laurent Vivier wrote:
> It allows to read data from a floppy, but not to write to, and to eject the
> floppy (useful on our Mac without eject button).
> 
> Changelog:
> v2- use platform device infrastructure
> v3- some cleanups, probe if chip supports SWIM mode
> v4- use platform_device, correct swim_action() and swim_eject()
>    according swim3 driver.
> v5- use a structure for IWM registers (like for SWIM ones)
> 
> Signed-off-by: Laurent Vivier <Laurent@lvivier.info>
> ---

Typically changelogs should be put here (under the first `---'), together with
the diffstat output, as they must not be part of the final commit message.

> arch/m68k/mac/config.c   |   40 +
> arch/m68k/mac/via.c      |    9
> drivers/block/Kconfig    |    7
> drivers/block/Makefile   |    3
> drivers/block/swim.c     |  997
> +++++++++++++++++++++++++++++++++++++++++++++++

Oops, severe whitespace damage, also in the body of the patch :-(
So I had to apply your patch manually.  Please fix your mailer.

> Index: linux-2.6/drivers/block/swim.c
> ===================================================================
> --- /dev/null	1970-01-01 00:00:00.000000000 +0000
> +++ linux-2.6/drivers/block/swim.c	2008-11-14 09:36:31.000000000 +0100

> +#define SWIM_IO_SIZE 0x2000

Move SWIM_IO_SIZE to arch/m68k/mac/config.c, as it's needed to set up the
platform device resource only.

> +static inline void set_swim_mode(struct swim *base, int enable)
					       ^ __iomem
> +{
> +	struct iwm *iwm_base;
                  ^ __iomem

(cfr. sparse warnings, when building with `make C=1')

> +	unsigned long flags;
> +
> +	if (!enable) {
> +		swim_write(base, mode0, 0xf8);
> +		return;
> +	}
> +
> +	iwm_base = (struct iwm *)base;
> +	local_save_flags(flags);
> +	local_irq_disable();

local_save_flags(flags) + local_irq_disable() = local_irq_save(flags)

However, to make the driver future-save (we don't have SMP nor preempt support
yet), it's better to add a spinlock and use spin_lock_irqsave().

> +	local_irq_restore(flags);

... and spin_unlock_irqrestore().

> +static inline int swim_track(struct floppy_state *fs,  int track)
> +{
> +	struct swim *base = fs->swd->base;
                   ^ __iomem

> +static int floppy_eject(struct floppy_state *fs)
> +{
> +	struct swim *base = fs->swd->base;
                   ^ __iomem

> +static inline int swim_read_sector(struct floppy_state *fs,
> +				   int side, int track,
> +				   int sector, unsigned char *buffer)
> +{
> +	struct swim *base = fs->swd->base;
                   ^ __iomem

> +static int floppy_read_sectors(struct floppy_state *fs,
> +			       int req_sector, int sectors_nb,
> +			       unsigned char *buffer)
> +{
> +	struct swim *base = fs->swd->base;
                   ^ __iomem

> +static int __devinit swim_probe(struct platform_device *dev)
> +{
> +	struct resource *res;
> +	struct swim *swim_base;
                   & __iomem

> +	struct swim_priv *swd;
> +	int ret;
> +
> +	res = platform_get_resource_byname(dev, IORESOURCE_MEM, "swim-regs");
> +	if (!res) {
> +		ret = -ENODEV;
> +		goto out;
> +	}
> +
> +	if (!request_mem_region(res->start, SWIM_IO_SIZE, CARDNAME)) {
                                            ^^^^^^^^^^^^
					    resource_size(res)

> +		ret = -EBUSY;
> +		goto out;
> +	}
> +
> +	swim_base = (struct swim *)ioremap(res->start, SWIM_IO_SIZE);
                    ^^^^^^^^^^^^^^^                    ^^^^^^^^^^^^
casts from void * are not needed		       resource_size(res)

> +	if (!swim_base) {
> +		return -ENOMEM;
> +		goto out_release_io;
> +	}
> +
> +	/* probe device */
> +
> +	set_swim_mode(swim_base, 1);
> +	if (!get_swim_mode(swim_base)) {
> +		printk(KERN_INFO "SWIM device not found !\n");
> +		ret = -ENODEV;
> +		goto out_iounmap;
> +	}
> +
> +	/* set platform driver data */
> +
> +	swd = kzalloc(sizeof(struct swim_priv), GFP_KERNEL);
> +	if (!swd) {
> +		ret = -ENOMEM;
> +		goto out_iounmap;
> +	}
> +	platform_set_drvdata(dev, swd);
> +
> +	swd->base = swim_base;
> +
> +	ret = swim_floppy_init(swd);
> +	if (ret)
> +		goto out_kfree;
> +
> +	return 0;
> +
> +out_kfree:
> +	platform_set_drvdata(dev, NULL);
> +	kfree(swd);
> +out_iounmap:
> +	iounmap(swim_base);
> +out_release_io:
> +	release_mem_region(res->start, SWIM_IO_SIZE);
				       ^^^^^^^^^^^^
				       resource_size(res)

> +static int __devexit swim_remove(struct platform_device *dev)

> +static struct platform_driver swim_driver = {
> +	.probe  = swim_probe,
> +	.remove = swim_remove,
                  ^^^^^^^^^^^

As swim_remove() is marked __devexit, the `__devexit_p(swim_remove)' in v3 was
actually correct.

> Index: linux-2.6/arch/m68k/mac/config.c
> ===================================================================
> --- linux-2.6.orig/arch/m68k/mac/config.c	2008-11-12 18:17:52.000000000
> +0100
> +++ linux-2.6/arch/m68k/mac/config.c	2008-11-12 18:17:55.000000000 +0100

> +int __init mac_platform_init(void)
> +{
> +	u8 *swim_base;
> +
> +	switch (macintosh_config->floppy_type) {
> +	case MAC_FLOPPY_SWIM_ADDR1:
> +		swim_base = (u8 *)(VIA1_BASE + 0x1E000);
> +		break;
> +	case MAC_FLOPPY_SWIM_ADDR2:
> +		swim_base = (u8 *)(VIA1_BASE + 0x16000);
> +		break;
> +	default:
> +		return 0;
> +	}
> +
> +	swim_resources[0].name = "swim-regs";
> +	swim_resources[0].start = (resource_size_t)swim_base;
> +	swim_resources[0].end = (resource_size_t)(swim_base + 0x2000);
                                                              ^^^^^^
							      SWIM_IO_SIZE
> +	swim_resources[0].flags = IORESOURCE_MEM;
> +
> +	return platform_add_devices(mac_platform_devices,
> +				    ARRAY_SIZE(mac_platform_devices));
> +}
> +
> +arch_initcall(mac_platform_init);

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
