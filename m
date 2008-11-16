From: Laurent Vivier <laurent@lvivier.info>
Subject: Re: [PATCH][v5] Add SWIM floppy support for m68k Macs.
Date: Sun, 16 Nov 2008 18:45:07 +0100
Message-ID: <E74B8270-AED1-40B5-AA6A-948F1443328A@lvivier.info>
References: <03320726-C601-4EE0-8337-1821119EF3FF@lvivier.info> <Pine.LNX.4.64.0811161140280.5978@anakin>
Mime-Version: 1.0 (Apple Message framework v929.2)
Content-Type: text/plain; charset=ISO-8859-1;
	format=flowed	delsp=yes
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.126.188]:57992 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752056AbYKPRpY convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 16 Nov 2008 12:45:24 -0500
In-Reply-To: <Pine.LNX.4.64.0811161140280.5978@anakin>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>


Le 16 nov. 08 =E0 11:52, Geert Uytterhoeven a =E9crit :

> On Sat, 15 Nov 2008, Laurent Vivier wrote:
>> It allows to read data from a floppy, but not to write to, and to =20
>> eject the
>> floppy (useful on our Mac without eject button).
>>
>> Changelog:
>> v2- use platform device infrastructure
>> v3- some cleanups, probe if chip supports SWIM mode
>> v4- use platform_device, correct swim_action() and swim_eject()
>>   according swim3 driver.
>> v5- use a structure for IWM registers (like for SWIM ones)
>>
>> Signed-off-by: Laurent Vivier <Laurent@lvivier.info>
>> ---
>
> Typically changelogs should be put here (under the first `---'), =20
> together with
> the diffstat output, as they must not be part of the final commit =20
> message.

OK

>
>
>> arch/m68k/mac/config.c   |   40 +
>> arch/m68k/mac/via.c      |    9
>> drivers/block/Kconfig    |    7
>> drivers/block/Makefile   |    3
>> drivers/block/swim.c     |  997
>> +++++++++++++++++++++++++++++++++++++++++++++++
>
> Oops, severe whitespace damage, also in the body of the patch :-(
> So I had to apply your patch manually.  Please fix your mailer.


Sorry, I'll do better next time.

>
>
>> Index: linux-2.6/drivers/block/swim.c
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> --- /dev/null	1970-01-01 00:00:00.000000000 +0000
>> +++ linux-2.6/drivers/block/swim.c	2008-11-14 09:36:31.000000000 =20
>> +0100
>
>> +#define SWIM_IO_SIZE 0x2000
>
> Move SWIM_IO_SIZE to arch/m68k/mac/config.c, as it's needed to set =20
> up the
> platform device resource only.
>

OK

>> +static inline void set_swim_mode(struct swim *base, int enable)
> 					       ^ __iomem
>> +{
>> +	struct iwm *iwm_base;
>                  ^ __iomem
>
> (cfr. sparse warnings, when building with `make C=3D1')
>

I don't have the command sparse on my system (debian stable).

>> +	unsigned long flags;
>> +
>> +	if (!enable) {
>> +		swim_write(base, mode0, 0xf8);
>> +		return;
>> +	}
>> +
>> +	iwm_base =3D (struct iwm *)base;
>> +	local_save_flags(flags);
>> +	local_irq_disable();
>
> local_save_flags(flags) + local_irq_disable() =3D local_irq_save(flag=
s)
>
> However, to make the driver future-save (we don't have SMP nor =20
> preempt support
> yet), it's better to add a spinlock and use spin_lock_irqsave().
>
>> +	local_irq_restore(flags);
>
> ... and spin_unlock_irqrestore().
>

Is it really needed as this driver will only work on mac m68k and all =20
are uniprocessor ?

>> +static inline int swim_track(struct floppy_state *fs,  int track)
>> +{
>> +	struct swim *base =3D fs->swd->base;
>                   ^ __iomem
>

OK for all following __iomem

>> +static int floppy_eject(struct floppy_state *fs)
>> +{
>> +	struct swim *base =3D fs->swd->base;
>                   ^ __iomem
>
>> +static inline int swim_read_sector(struct floppy_state *fs,
>> +				   int side, int track,
>> +				   int sector, unsigned char *buffer)
>> +{
>> +	struct swim *base =3D fs->swd->base;
>                   ^ __iomem
>
>> +static int floppy_read_sectors(struct floppy_state *fs,
>> +			       int req_sector, int sectors_nb,
>> +			       unsigned char *buffer)
>> +{
>> +	struct swim *base =3D fs->swd->base;
>                   ^ __iomem
>
>> +static int __devinit swim_probe(struct platform_device *dev)
>> +{
>> +	struct resource *res;
>> +	struct swim *swim_base;
>                   & __iomem
>
>> +	struct swim_priv *swd;
>> +	int ret;
>> +
>> +	res =3D platform_get_resource_byname(dev, IORESOURCE_MEM, "swim-=20
>> regs");
>> +	if (!res) {
>> +		ret =3D -ENODEV;
>> +		goto out;
>> +	}
>> +
>> +	if (!request_mem_region(res->start, SWIM_IO_SIZE, CARDNAME)) {
>                                            ^^^^^^^^^^^^
> 					    resource_size(res)

OK

>
>
>> +		ret =3D -EBUSY;
>> +		goto out;
>> +	}
>> +
>> +	swim_base =3D (struct swim *)ioremap(res->start, SWIM_IO_SIZE);
>                    ^^^^^^^^^^^^^^^                    ^^^^^^^^^^^^
> casts from void * are not needed		       resource_size(res)

OKs

>
>
>> +	if (!swim_base) {
>> +		return -ENOMEM;
>> +		goto out_release_io;
>> +	}
>> +
>> +	/* probe device */
>> +
>> +	set_swim_mode(swim_base, 1);
>> +	if (!get_swim_mode(swim_base)) {
>> +		printk(KERN_INFO "SWIM device not found !\n");
>> +		ret =3D -ENODEV;
>> +		goto out_iounmap;
>> +	}
>> +
>> +	/* set platform driver data */
>> +
>> +	swd =3D kzalloc(sizeof(struct swim_priv), GFP_KERNEL);
>> +	if (!swd) {
>> +		ret =3D -ENOMEM;
>> +		goto out_iounmap;
>> +	}
>> +	platform_set_drvdata(dev, swd);
>> +
>> +	swd->base =3D swim_base;
>> +
>> +	ret =3D swim_floppy_init(swd);
>> +	if (ret)
>> +		goto out_kfree;
>> +
>> +	return 0;
>> +
>> +out_kfree:
>> +	platform_set_drvdata(dev, NULL);
>> +	kfree(swd);
>> +out_iounmap:
>> +	iounmap(swim_base);
>> +out_release_io:
>> +	release_mem_region(res->start, SWIM_IO_SIZE);
> 				       ^^^^^^^^^^^^
> 				       resource_size(res)
>
>> +static int __devexit swim_remove(struct platform_device *dev)
>
>> +static struct platform_driver swim_driver =3D {
>> +	.probe  =3D swim_probe,
>> +	.remove =3D swim_remove,
>                  ^^^^^^^^^^^
>
> As swim_remove() is marked __devexit, the `__devexit_p(swim_remove)' =
=20
> in v3 was
> actually correct.

OK

>
>
>> Index: linux-2.6/arch/m68k/mac/config.c
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> --- linux-2.6.orig/arch/m68k/mac/config.c	2008-11-12 =20
>> 18:17:52.000000000
>> +0100
>> +++ linux-2.6/arch/m68k/mac/config.c	2008-11-12 18:17:55.000000000 =20
>> +0100
>
>> +int __init mac_platform_init(void)
>> +{
>> +	u8 *swim_base;
>> +
>> +	switch (macintosh_config->floppy_type) {
>> +	case MAC_FLOPPY_SWIM_ADDR1:
>> +		swim_base =3D (u8 *)(VIA1_BASE + 0x1E000);
>> +		break;
>> +	case MAC_FLOPPY_SWIM_ADDR2:
>> +		swim_base =3D (u8 *)(VIA1_BASE + 0x16000);
>> +		break;
>> +	default:
>> +		return 0;
>> +	}
>> +
>> +	swim_resources[0].name =3D "swim-regs";
>> +	swim_resources[0].start =3D (resource_size_t)swim_base;
>> +	swim_resources[0].end =3D (resource_size_t)(swim_base + 0x2000);
>                                                              ^^^^^^
> 							      SWIM_IO_SIZE

OK

>
>> +	swim_resources[0].flags =3D IORESOURCE_MEM;
>> +
>> +	return platform_add_devices(mac_platform_devices,
>> +				    ARRAY_SIZE(mac_platform_devices));
>> +}
>> +
>> +arch_initcall(mac_platform_init);
>


Thank you.

Laurent
-------------------- laurent@lvivier.info --------------------
"Tout ce qui est impossible reste =E0 accomplir"    Jules Verne
"Things are only impossible until they're not" Jean-Luc Picard

--
To unsubscribe from this list: send the line "unsubscribe linux-m68k" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
