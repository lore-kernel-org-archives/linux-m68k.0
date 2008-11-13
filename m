From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: [PATCH][v4] Add SWIM floppy support for m68k Macs.
Date: Fri, 14 Nov 2008 10:44:32 +1100 (EST)
Message-ID: <Pine.LNX.4.64.0811141042380.18881@loopy.telegraphics.com.au>
References: <A9169170-9D86-420C-B4DB-3049650C77F7@lvivier.info>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from loopy.telegraphics.com.au ([202.45.126.152]:60195 "EHLO
	loopy.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751854AbYKMXoe (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 13 Nov 2008 18:44:34 -0500
In-Reply-To: <A9169170-9D86-420C-B4DB-3049650C77F7@lvivier.info>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Laurent Vivier <laurent@lvivier.info>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Linux/m68k <linux-m68k@vger.kernel.org>


On Thu, 13 Nov 2008, Laurent Vivier wrote:

> +
> +/* IWM registers */
> +
> +#define ph0L		0x0000
> +#define ph0H		0x0200
> +#define ph1L		0x0400
> +#define ph1H		0x0600
> +#define ph2L		0x0800
> +#define ph2H		0x0a00
> +#define ph3L		0x0c00
> +#define ph3H		0x0e00
> +#define mtrOff		0x1000
> +#define mtrOn		0x1200
> +#define intDrive	0x1400
> +#define extDrive	0x1600
> +#define q6L		0x1800
> +#define q6H		0x1a00
> +#define q7L		0x1c00
> +#define q7H		0x1e00

The style guide says macro names should be in uppercase.

>...
> Index: linux-2.6/arch/m68k/mac/config.c
> ===================================================================
> --- linux-2.6.orig/arch/m68k/mac/config.c	2008-11-12 18:17:52.000000000
> +0100
> +++ linux-2.6/arch/m68k/mac/config.c	2008-11-12 18:17:55.000000000 +0100
> @@ -22,6 +22,7 @@
> /* keyb */
> #include <linux/init.h>
> #include <linux/vt_kern.h>
> +#include <linux/platform_device.h>
> 
> #define BOOTINFO_COMPAT_1_0
> #include <asm/setup.h>
> @@ -882,3 +883,42 @@
> 	strcpy(str, "Macintosh ");
> 	strcat(str, macintosh_config->name);
> }
> +
> +static struct resource swim_resources[1];
> +
> +static struct platform_device swim_device = {
> +	.name		= "swim",
> +	.id		= -1,
> +	.num_resources	= ARRAY_SIZE(swim_resources),
> +	.resource	= swim_resources,
> +};
> +
> +static struct platform_device *mac_platform_devices[] __initdata = {
> +	&swim_device
> +};
> +
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
> +	swim_resources[0].flags = IORESOURCE_MEM;
> +
> +	return platform_add_devices(mac_platform_devices,
> +				    ARRAY_SIZE(mac_platform_devices));
> +}
> +
> +arch_initcall(mac_platform_init);
> 

Looks fine to me as long as we can be certain that the arch_initcall 
happens after config_mac() runs...

I guess that the bloat that this approach will cause when we adopt it more 
widely can be dealt with later by dynamically allocating resources and 
devices based on mac model (mac "platform"), and converting 
macintosh_config into init data. No need to do that in this patch though, 
since almost every model can use this driver anyway.

Finn

