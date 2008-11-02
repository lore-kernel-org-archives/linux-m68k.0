From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] Add SWIM floppy support for m68k Macs.
Date: Sun, 2 Nov 2008 09:54:04 +0100 (CET)
Message-ID: <Pine.LNX.4.64.0811020947320.5281@anakin>
References: <12255325912043-git-send-email-Laurent@lvivier.info>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from nelson.telenet-ops.be ([195.130.133.66]:33919 "EHLO
	nelson.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752824AbYKBIyK (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 2 Nov 2008 03:54:10 -0500
In-Reply-To: <12255325912043-git-send-email-Laurent@lvivier.info>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Laurent Vivier <Laurent@lvivier.info>
Cc: linux-m68k@vger.kernel.org

On Sat, 1 Nov 2008, Laurent@lvivier.info wrote:
> From: Laurent Vivier <Laurent@lvivier.info>
> 
> This patch is a port of the driver I wrote for kernel 2.2.

Please run scripts/checkpatch.pl on your patch and fix the errors/warnings.

> --- /dev/null	1970-01-01 00:00:00.000000000 +0000
> +++ linux-2.6/arch/m68k/mac/swim.c	2008-11-01 06:14:39.000000000 +0100
> @@ -0,0 +1,111 @@
> +/*
> + * Driver for SWIM (Sander. Woz Integrated Machine) floppy controller
> + *
> + * Copyright (C) 2004,2008 Laurent Vivier <Laurent@lvivier.info>
> + *
> + * based on netBSD IWM driver (c) 1997, 1998 Hauke Fath.
> + * based  on Alastair Bridgewater SWIM analysis, 2001
> + *
> + * This program is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU General Public License
> + * as published by the Free Software Foundation; either version
> + * 2 of the License, or (at your option) any later version.
> + *
> + * 2004-09-02 (lv) - Initial implementation
> + * 2008-10-30 (lv) - Port to kernel 2.6
> + */
> +
> +#include <linux/types.h>
> +#include <linux/kernel.h>
> +#include <linux/mm.h>
> +#include <linux/init.h>
> +#include <linux/module.h>
> +
> +#include <asm/macintosh.h>
> +#include <asm/mac_via.h>
> +
> +volatile __u8 *SWIMBase;
> +EXPORT_SYMBOL(SWIMBase);
> +
> +#define writePhase	*(SWIMBase + 0x0800)
> +#define readPhase	*(SWIMBase + 0x1800)

These two definitions are not used in this file?

> +/*
> + * According to IWM netBSD driver, there are four kinds of SWIM:
> + *
> + * - QUADRA, QUADRA2, P580 -> SWIM base address is VIA1 + 0x1E000;
> + * - II, PB, LC		   -> SWIM base address is VIA1 + 0x16000;
> + * - IIfx, Q900, Q950	   -> managed by IOP driver
> + * - AV			   -> not managed
> + *
> + */
> +
> +void __init swim_init(void)
> +{
> +	switch(macintosh_config->ident)
> +	{
> +	case MAC_MODEL_Q700:
> +	case MAC_MODEL_Q800:
> +	case MAC_MODEL_Q650:
> +	case MAC_MODEL_Q605:
> +	case MAC_MODEL_Q605_ACC:
> +	case MAC_MODEL_Q610:
> +	case MAC_MODEL_Q630:
> +	case MAC_MODEL_P475:
> +	case MAC_MODEL_P475F:
> +	case MAC_MODEL_P575:
> +	case MAC_MODEL_P588:
> +		SWIMBase =  (__u8*)(VIA1_BASE + 0x1E000);
> +		break;
> +	case MAC_MODEL_II:
> +	case MAC_MODEL_IIX:
> +	case MAC_MODEL_IICX:
> +	case MAC_MODEL_SE30:
> +	case MAC_MODEL_PB140:
> +	case MAC_MODEL_PB145:
> +	case MAC_MODEL_PB160:
> +	case MAC_MODEL_PB165:
> +	case MAC_MODEL_PB165C:
> +	case MAC_MODEL_PB170:
> +	case MAC_MODEL_PB180:
> +	case MAC_MODEL_PB180C:
> +	case MAC_MODEL_PB190:
> +	case MAC_MODEL_PB520:
> +	case MAC_MODEL_PB150:
> +	case MAC_MODEL_PB210:
> +	case MAC_MODEL_PB230:
> +	case MAC_MODEL_PB250:
> +	case MAC_MODEL_PB270C:
> +	case MAC_MODEL_PB280:
> +	case MAC_MODEL_PB280C:
> +	case MAC_MODEL_IICI:
> +	case MAC_MODEL_IISI:
> +	case MAC_MODEL_IIVI:
> +	case MAC_MODEL_IIVX:
> +	case MAC_MODEL_P600:
> +	case MAC_MODEL_P460:
> +	case MAC_MODEL_P550:
> +	case MAC_MODEL_TV:
> +	case MAC_MODEL_LCII:
> +	case MAC_MODEL_LCIII:
> +	case MAC_MODEL_P520:
> +	case MAC_MODEL_CLII:
> +	case MAC_MODEL_CCL:
> +		SWIMBase =  (__u8*)(VIA1_BASE + 0x16000);
> +		break;
> +	case MAC_MODEL_IIFX:
> +	case MAC_MODEL_Q900:
> +	case MAC_MODEL_Q950:
> +		SWIMBase = NULL;
> +		break;
> +	default:
> +		SWIMBase = NULL;
> +		printk("SWIM: unknown Macintosh: report to maintainer !\n");
> +		break;
> +	}
> +
> +	if (SWIMBase == NULL)
> +		return;
> +
> +	printk("SWIM floppy controller base at 0x%p\n", SWIMBase);
> +}

The preferred way to do this these days is to create a platform device with a
struct resource that points to the SWIMBase.

> --- /dev/null	1970-01-01 00:00:00.000000000 +0000
> +++ linux-2.6/drivers/block/swim.c	2008-11-01 10:36:05.000000000 +0100

> +static int __init swim_floppy_init(void)
> +{
> +	int err;
> +	int drive;
> +
> +	if (SWIMBase == NULL)
> +		return 0;

And the actual driver should become a platform driver, that is bound
automatically to the platform device, if it exists.

> ===================================================================
> --- /dev/null	1970-01-01 00:00:00.000000000 +0000
> +++ linux-2.6/drivers/block/swim_asm.S	2008-11-01 06:14:39.000000000 +0100
> @@ -0,0 +1,295 @@
> +/*
> + * low-level functions for the SWIM floppy controller
> + *
> + * needs assembly language because is very timing dependent
> + * this controller exists only on macintosh 680x0 based

Do you still need this to be written in assembly?

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
