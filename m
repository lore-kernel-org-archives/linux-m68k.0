From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 1/3] m68k: section mismatch fixes: EtherNAT
Date: Sun, 1 Feb 2009 10:50:11 +0100 (CET)
Message-ID: <Pine.LNX.4.64.0902011049390.20875@anakin>
References: <1b1304130901131349n6b67eac5j1c17f4791dd6718e@mail.gmail.com>
 <20090114003245.GA4419@cynthia.pants.nu> <Pine.LNX.4.64.0901141224080.16246@loopy.telegraphics.com.au>
 <alpine.DEB.1.00.0901170022250.27520@zirkon.biophys.uni-duesseldorf.de>
 <alpine.DEB.1.00.0901170354200.1528@zirkon.biophys.uni-duesseldorf.de>
 <Pine.LNX.4.64.0901171258170.25319@anakin>
 <alpine.DEB.1.00.0901180302190.9820@zirkon.biophys.uni-duesseldorf.de>
 <Pine.LNX.4.64.0901301934430.23582@anakin>
 <alpine.DEB.1.00.0902010110530.2001@zirkon.biophys.uni-duesseldorf.de>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from edna.telenet-ops.be ([195.130.132.58]:55932 "EHLO
	edna.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752396AbZBAJuO (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 1 Feb 2009 04:50:14 -0500
In-Reply-To: <alpine.DEB.1.00.0902010110530.2001@zirkon.biophys.uni-duesseldorf.de>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>
Cc: linux-m68k@vger.kernel.org

On Sun, 1 Feb 2009, Michael Schmitz wrote:
> > > -static int smc_drv_probe(struct platform_device *pdev)
> > > +static int __init smc_drv_probe(struct platform_device *pdev)
> >               ^^^^^^
> > >  {
> > >  	struct smc91x_platdata *pd = pdev->dev.platform_data;
> > >  	struct smc_local *lp;
> > 
> > smc_drv_probe() should be marked __devinit, not __init.
> > And smc_drv_remove() should be marked __devexit.
> 
> Yep, only saw that after sending the patch. Do you want to fix that, or shall I 
> send a new patch? (My git tree is in a rough state after I've started to play 
> with switching Atari SCSI to NCR5380.c, or at least a fresh clone of that!)

I'll fix it up.

> The DMA sound section mismatch I'll double check.

Perhaps it happens with some versions of gcc only?

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
