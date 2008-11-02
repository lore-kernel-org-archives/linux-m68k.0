From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: [PATCH] Add SWIM floppy support for m68k Macs.
Date: Sun, 2 Nov 2008 17:00:33 +1100 (EST)
Message-ID: <Pine.LNX.4.64.0811021504530.29476@loopy.telegraphics.com.au>
References: <12255325912043-git-send-email-Laurent@lvivier.info>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from loopy.telegraphics.com.au ([202.45.126.152]:44423 "EHLO
	loopy.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751909AbYKBGAf (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 2 Nov 2008 01:00:35 -0500
In-Reply-To: <12255325912043-git-send-email-Laurent@lvivier.info>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Laurent Vivier <Laurent@lvivier.info>
Cc: geert@linux-m68k.org, linux-m68k@vger.kernel.org


Nice work!

Critique follows.

On Sat, 1 Nov 2008, Laurent@lvivier.info wrote:

> Index: linux-2.6/arch/m68k/mac/config.c
> ===================================================================
> --- linux-2.6.orig/arch/m68k/mac/config.c	2008-11-01 06:13:53.000000000 +0100
> +++ linux-2.6/arch/m68k/mac/config.c	2008-11-01 06:14:39.000000000 +0100
> @@ -70,6 +70,7 @@
>  extern void oss_init(void);
>  extern void psc_init(void);
>  extern void baboon_init(void);
> +extern void swim_init(void);
>  
>  extern void mac_mksound(unsigned int, unsigned int);
>  
> @@ -815,6 +816,7 @@
>  	oss_init();
>  	psc_init();
>  	baboon_init();
> +	swim_init();
>  }

It would reduce coupling if config.c didn't need to know about the floppy 
drive... I suspect that the initialisation can be simplified with 
device_initcall.

>  static void __init mac_report_hardware(void)
> Index: linux-2.6/arch/m68k/mac/swim.c
> ===================================================================
> --- /dev/null	1970-01-01 00:00:00.000000000 +0000
> +++ linux-2.6/arch/m68k/mac/swim.c	2008-11-01 06:14:39.000000000 +0100
...
> +#define writePhase	*(SWIMBase + 0x0800)
> +#define readPhase	*(SWIMBase + 0x1800)

These are unused.

...
> +	default:
> +		SWIMBase = NULL;
> +		printk("SWIM: unknown Macintosh: report to maintainer !\n");

If macintosh_config->ident is not in mac_data_table, config.c prints 
"Detected Macintosh model: Unknown", so there's no need to repeat it here.

...
> Index: linux-2.6/drivers/block/swim.c
> ===================================================================
> --- /dev/null	1970-01-01 00:00:00.000000000 +0000
> +++ linux-2.6/drivers/block/swim.c	2008-11-01 10:36:05.000000000 +0100
> @@ -0,0 +1,886 @@
> +/*
> + * Driver for SWIM (Sander. Woz Integrated Machine) floppy controller

Sander Woz Integrated Machine, also known as Super Woz Integrated Machine.

...
> +
> +/* bits in mode register */
> +
> +#define CLFIFO		0x01
> +#define ENBL1		0x02
> +#define ENBL2		0x04
> +#define ACTION		0x08
> +#define	WRITE_MODE	0x10
> +#define	HEDSEL		0x20
> +#define	MOTON		0x80

Extra tabs. HEAD_SEL? MOTOR_ON?

...
> +
> +static inline void swim_head(head_t head)
> +{
> +	/* FIXME: IWM reads bits SEL, CA2, CA1 to wait drive ready... */

By SEL, do you mean VIA1A_vHeadSel or the chip register? I wonder if CA1 
and CA2 were used for the floppy on 68000 macs... CA1 and CA2 are timers 
on the Macs we support. Guide to Mac Family hardware might be able to 
clarify this a bit.

> +
> +	/* wait drive is ready */
> +
> +	if (head == UPPER_HEAD)
> +		swim_select(READ_DATA_1);
> +	else if (head == LOWER_HEAD)
> +		swim_select(READ_DATA_0);
> +}
> +
> +static inline int swim_step(void)
> +{
> +	int wait;
> +
> +	swim_action(STEP);
> +
> +	for (wait = 0; wait < 80; wait++) {

Should this loop counter be referred to HZ too?

>...
> +
> +static struct floppy_struct floppy_type[4] = {
> +	{    0, 0,0, 0,0,0x00,0x00,0x00,0x00,NULL },	/*  0 no testing    */
> +	{  720, 9,1,80,0,0x2A,0x02,0xDF,0x50,NULL },	/*  3 360KB SS 3.5" */
> +	{ 1440, 9,2,80,0,0x2A,0x02,0xDF,0x50,NULL },	/*  4 720KB 3.5"    */
> +	{ 2880,18,2,80,0,0x1B,0x00,0xCF,0x6C,NULL },    /*  7 1.44MB 3.5"   */
> +};

The last 3 entries are unused...

> +
> +static int get_floppy_geometry(int drive, int type, struct floppy_struct **g)
> +{
> +	struct floppy_state *fs;
> +	fs = &unit[drive];
> +
> +	if (drive > floppy_count)
> +		return -ENODEV;
> +
> +	if (type >= ARRAY_SIZE(floppy_type))
> +		return -EINVAL;
> +
> +	if (type)
> +		*g = &floppy_type[type];
> +	else if (fs->type == HD_MEDIA) /* High-Density media */
> +		*g = &floppy_type[3];
> +	else if (fs->head_number == 2) /* double-sided */
> +		*g = &floppy_type[2];
> +	else
> +		*g = &floppy_type[1];

...since type is always 0. I wonder how we should deal with 400K and 800K 
floppies. It's academic I guess.

...
> +
> +static int __init swim_init(void)
> +{
> +	printk(KERN_INFO "Inserting SWIM floppy driver\n");

Is this for debugging purposes? I'd prefer to avoid the log spam.

> +
> +	if (base) {
> +		printk(KERN_INFO "SWIM: Setting SWIMBase to 0x%p\n", base);
> +		SWIMBase = (struct swim *)base;
> +	}
> +
> +	return swim_floppy_init();
> +}
> +module_init(swim_init)

Can we elimiate the additions to arch/m68k/mac and merge the init routine 
from arch/m68k/mac/swim.c with this one by making it a device_initcall?

Regards,
Finn
