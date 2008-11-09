From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 2/2][v3] Add SWIM floppy support for m68k Macs.
Date: Sun, 9 Nov 2008 17:19:27 +0100 (CET)
Message-ID: <Pine.LNX.4.64.0811091716590.19341@anakin>
References: <12260012691527-git-send-email-laurent@lvivier.info>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from wilson.telenet-ops.be ([195.130.132.42]:51810 "EHLO
	wilson.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755168AbYKIQT3 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 9 Nov 2008 11:19:29 -0500
In-Reply-To: <12260012691527-git-send-email-laurent@lvivier.info>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Laurent Vivier <laurent@lvivier.info>
Cc: linux-m68k@vger.kernel.org, 0001-Add-a-new-entry-in-mac_model-to-identify-the-floppy-controller-type.txt@lvivier.info

On Thu, 6 Nov 2008, Laurent Vivier wrote:
> --- /dev/null
> +++ b/drivers/block/swim.c

> +static struct platform_device *swim_device;

One global instance?

> +static int __devinit swim_probe(struct platform_device *dev)
> +{
> +	struct swim *swim_base;
> +	struct swim_priv *swd;
> +
> +	if (!MACH_IS_MAC)
> +		return -ENODEV;
> +
> +	switch (macintosh_config->floppy_type) {
> +	case MAC_FLOPPY_SWIM_ADDR1:
> +		swim_base = (struct swim *)(VIA1_BASE + 0x1E000);
> +		break;
> +	case MAC_FLOPPY_SWIM_ADDR2:
> +		swim_base = (struct swim *)(VIA1_BASE + 0x16000);
> +		break;
> +	default:
> +		swim_base = (struct swim *)base;
> +		break;
> +	}
> +
> +	if (swim_base == NULL)
> +		return -ENODEV;
> +
> +	printk(KERN_INFO "SWIM base adress 0x%p\n", swim_base);
> +
> +	/* probe device */
> +
> +	set_swim_mode(swim_base, 1);
> +	if (!get_swim_mode(swim_base)) {

get_swim_mode() is also written in assembly. Is plain C not fast enough?
If speed matters, what about disabling interrupts here?

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
