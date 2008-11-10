From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: [PATCH] Add SWIM floppy support for m68k Macs.
Date: Mon, 10 Nov 2008 11:15:02 +1100 (EST)
Message-ID: <Pine.LNX.4.64.0811101041560.365@loopy.telegraphics.com.au>
References: <12255325912043-git-send-email-Laurent@lvivier.info>
 <Pine.LNX.4.64.0811020947320.5281@anakin> <AC634DD2-CE12-4975-BB8E-B564C7DFDC06@lvivier.info>
 <20081102212852.GA8162@cynthia.pants.nu> <Pine.LNX.4.64.0811031102090.10345@loopy.telegraphics.com.au>
 <Pine.LNX.4.64.0811091711150.19341@anakin>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from loopy.telegraphics.com.au ([202.45.126.152]:53641 "EHLO
	loopy.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756245AbYKJAPF (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 9 Nov 2008 19:15:05 -0500
In-Reply-To: <Pine.LNX.4.64.0811091711150.19341@anakin>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Brad Boyer <flar@allandria.com>, Laurent Vivier <Laurent@lvivier.info>, linux-m68k@vger.kernel.org



On Sun, 9 Nov 2008, Geert Uytterhoeven wrote:

> On Mon, 3 Nov 2008, Finn Thain wrote:
> > 
> > I agree with Geert. Ignore my comment about device_initcall -- I was 
> > looking at via-cuda.c but that is not a good example. 
> > drivers/scsi/mac_esp.c is a better example.
> > 
> > esp_mac_probe checks the macintosh_config entry. That and 
> > esp_mac_remove are the platform device entry points Geert referred to. 
> > The module entry points are mac_esp_init and mac_esp_exit. I think you 
> > could use either of the platform device probe routine or the module 
> > init routine to set the base address.
> 
> Ideally, the _probe() routine should not look at the bits in 
> macintosh_config, but only at the platform device and its resources.

Makes sense.

> The creation of the platform device should be moved to 
> arch/m68k/mac/config

That means adding #if CONFIG_BLK_DEV_SWIM to config.c.

It also makes drivers/block/swim.c less cohesive.

> which would create the platform device, and only if the bits in 
> macintosh_config indicate that the hardware is present. The actual value 
> of swim_base can be stored in a struct resource linked to the platform 
> device.

I'm probably missing something here, but I can see some benefit in doing 
this only in the absence of a global macintosh_config.

But if you didn't have a global macintosh_config, several parts of 
macintosh_config (especially macintosh_config->ident) would end up 
duplicated in each of the struct resources for the platform devices, no? 

Would you explain it is we gain from moving platform init routines into 
config.c? I can only see disadvantages.

Finn
 
> So far the only platform device for m68k (not in mainline) is Michael's 
> EtherNAT driver, cfr. arch/m68k/atari/config.c. Note that that one 
> registers the platform device unconditionally, as there's no magic 
> predictor for its presence in the firmware or machine tables.
> 
> Gr{oetje,eeting}s,
> 
> 						Geert
> 
