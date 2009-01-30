From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 1/3] m68k: section mismatch fixes: EtherNAT
Date: Fri, 30 Jan 2009 19:35:27 +0100 (CET)
Message-ID: <Pine.LNX.4.64.0901301934430.23582@anakin>
References: <1b1304130901131349n6b67eac5j1c17f4791dd6718e@mail.gmail.com>
 <20090114003245.GA4419@cynthia.pants.nu> <Pine.LNX.4.64.0901141224080.16246@loopy.telegraphics.com.au>
 <alpine.DEB.1.00.0901170022250.27520@zirkon.biophys.uni-duesseldorf.de>
 <alpine.DEB.1.00.0901170354200.1528@zirkon.biophys.uni-duesseldorf.de>
 <Pine.LNX.4.64.0901171258170.25319@anakin>
 <alpine.DEB.1.00.0901180302190.9820@zirkon.biophys.uni-duesseldorf.de>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from nelson.telenet-ops.be ([195.130.133.66]:43136 "EHLO
	nelson.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754955AbZA3Sfa (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 30 Jan 2009 13:35:30 -0500
In-Reply-To: <alpine.DEB.1.00.0901180302190.9820@zirkon.biophys.uni-duesseldorf.de>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>
Cc: linux-m68k@vger.kernel.org

On Sun, 18 Jan 2009, Michael Schmitz wrote:
> commit 9418e1ee384d69065c5251d310be97f431668ddb
> Author: Michael Schmitz <schmitz@xplor.waratah.dyndns.org>
> Date:   Fri Jan 2 08:04:23 2009 +0100
> 
>     [m68k] section mismatch fixes: add __init annotation
>     
>     Signed-off-by: Michael Schmitz <schmitz@debian.org>
> ---
> diff --git a/drivers/net/atari_91C111.c b/drivers/net/atari_91C111.c
> index c441779..4d4bf61 100644
> --- a/drivers/net/atari_91C111.c
> +++ b/drivers/net/atari_91C111.c
> @@ -2161,7 +2161,7 @@ static void smc_release_datacs(struct platform_device *pdev, struct net_device *
>   *	0 --> there is a device
>   *	anything else, error
>   */
> -static int smc_drv_probe(struct platform_device *pdev)
> +static int __init smc_drv_probe(struct platform_device *pdev)
              ^^^^^^
>  {
>  	struct smc91x_platdata *pd = pdev->dev.platform_data;
>  	struct smc_local *lp;

smc_drv_probe() should be marked __devinit, not __init.
And smc_drv_remove() should be marked __devexit.

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
