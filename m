From: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>
Subject: Re: [PATCH 1/3] m68k: section mismatch fixes: EtherNAT
Date: Sun, 01 Feb 2009 01:14:19 +0100 (CET)
Message-ID: <alpine.DEB.1.00.0902010110530.2001@zirkon.biophys.uni-duesseldorf.de>
References: <1b1304130901131349n6b67eac5j1c17f4791dd6718e@mail.gmail.com>
 <20090114003245.GA4419@cynthia.pants.nu>
 <Pine.LNX.4.64.0901141224080.16246@loopy.telegraphics.com.au>
 <alpine.DEB.1.00.0901170022250.27520@zirkon.biophys.uni-duesseldorf.de>
 <alpine.DEB.1.00.0901170354200.1528@zirkon.biophys.uni-duesseldorf.de>
 <Pine.LNX.4.64.0901171258170.25319@anakin>
 <alpine.DEB.1.00.0901180302190.9820@zirkon.biophys.uni-duesseldorf.de>
 <Pine.LNX.4.64.0901301934430.23582@anakin>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mailout-venus.uni-duesseldorf.de ([134.99.128.32]:32892 "EHLO
	mail.rz.uni-duesseldorf.de" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1751797AbZBAAOW (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>);
	Sat, 31 Jan 2009 19:14:22 -0500
Received: from pmxchannel-daemon.mail.rz.uni-duesseldorf.de by
 mail.rz.uni-duesseldorf.de
 (Sun Java(tm) System Messaging Server 6.3-6.03 (built Mar 14 2008; 32bit))
 id <0KED003001ZVF100@mail.rz.uni-duesseldorf.de> for
 linux-m68k@vger.kernel.org; Sun, 01 Feb 2009 01:14:20 +0100 (MET)
In-reply-to: <Pine.LNX.4.64.0901301934430.23582@anakin>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org

Hi Geert,

> > -static int smc_drv_probe(struct platform_device *pdev)
> > +static int __init smc_drv_probe(struct platform_device *pdev)
>               ^^^^^^
> >  {
> >  	struct smc91x_platdata *pd = pdev->dev.platform_data;
> >  	struct smc_local *lp;
> 
> smc_drv_probe() should be marked __devinit, not __init.
> And smc_drv_remove() should be marked __devexit.

Yep, only saw that after sending the patch. Do you want to fix that, or shall I 
send a new patch? (My git tree is in a rough state after I've started to play 
with switching Atari SCSI to NCR5380.c, or at least a fresh clone of that!)

The DMA sound section mismatch I'll double check.

Cheers,

	Michael

