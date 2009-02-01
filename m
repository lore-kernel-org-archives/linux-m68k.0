From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 1/3] m68k: section mismatch fixes: EtherNAT
Date: Sun, 1 Feb 2009 11:22:25 +0100 (CET)
Message-ID: <Pine.LNX.4.64.0902011116130.20875@anakin>
References: <1b1304130901131349n6b67eac5j1c17f4791dd6718e@mail.gmail.com>
 <20090114003245.GA4419@cynthia.pants.nu> <Pine.LNX.4.64.0901141224080.16246@loopy.telegraphics.com.au>
 <alpine.DEB.1.00.0901170022250.27520@zirkon.biophys.uni-duesseldorf.de>
 <alpine.DEB.1.00.0901170354200.1528@zirkon.biophys.uni-duesseldorf.de>
 <Pine.LNX.4.64.0901171258170.25319@anakin>
 <alpine.DEB.1.00.0901180302190.9820@zirkon.biophys.uni-duesseldorf.de>
 <Pine.LNX.4.64.0901301934430.23582@anakin>
 <alpine.DEB.1.00.0902010110530.2001@zirkon.biophys.uni-duesseldorf.de>
 <Pine.LNX.4.64.0902011049390.20875@anakin>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from wilson.telenet-ops.be ([195.130.132.42]:58944 "EHLO
	wilson.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753681AbZBAKW1 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 1 Feb 2009 05:22:27 -0500
In-Reply-To: <Pine.LNX.4.64.0902011049390.20875@anakin>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>
Cc: linux-m68k@vger.kernel.org

On Sun, 1 Feb 2009, Geert Uytterhoeven wrote:

> On Sun, 1 Feb 2009, Michael Schmitz wrote:
> > > > -static int smc_drv_probe(struct platform_device *pdev)
> > > > +static int __init smc_drv_probe(struct platform_device *pdev)
> > >               ^^^^^^
> > > >  {
> > > >  	struct smc91x_platdata *pd = pdev->dev.platform_data;
> > > >  	struct smc_local *lp;
> > > 
> > > smc_drv_probe() should be marked __devinit, not __init.
> > > And smc_drv_remove() should be marked __devexit.
> > 
> > Yep, only saw that after sending the patch. Do you want to fix that, or shall I 
> > send a new patch? (My git tree is in a rough state after I've started to play 
> > with switching Atari SCSI to NCR5380.c, or at least a fresh clone of that!)
> 
> I'll fix it up.

Fixing it up triggered a few more __init/__devinit issues. Combined result
below...

commit d11918a83d4dc3d43e3f4d1d5905291bdfd0a507
Author: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>
Date:   Sun Jan 18 03:10:55 2009 +0100

    m68k: section mismatch fixes: EtherNAT
    
    add __init annotation
    [geert] Use __dev{in,ex}it
    
    Signed-off-by: Michael Schmitz <schmitz@debian.org>
    Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>

diff --git a/drivers/net/atari_91C111.c b/drivers/net/atari_91C111.c
index c441779..af2d255 100644
--- a/drivers/net/atari_91C111.c
+++ b/drivers/net/atari_91C111.c
@@ -1724,7 +1724,7 @@ static const struct ethtool_ops smc_ethtool_ops = {
  * I just deleted auto_irq.c, since it was never built...
  *   --jgarzik
  */
-static int __init smc_findirq(struct smc_local *lp)
+static int __devinit smc_findirq(struct smc_local *lp)
 {
 	void __iomem *ioaddr = lp->base;
 	int timeout = 20;
@@ -1798,8 +1798,8 @@ static int __init smc_findirq(struct smc_local *lp)
  * o  actually GRAB the irq.
  * o  GRAB the region
  */
-static int __init smc_probe(struct net_device *dev, void __iomem *ioaddr,
-			    unsigned long irq_flags)
+static int __devinit smc_probe(struct net_device *dev, void __iomem *ioaddr,
+			       unsigned long irq_flags)
 {
 	struct smc_local *lp = netdev_priv(dev);
 	static int version_printed = 0;
@@ -2161,7 +2161,7 @@ static void smc_release_datacs(struct platform_device *pdev, struct net_device *
  *	0 --> there is a device
  *	anything else, error
  */
-static int smc_drv_probe(struct platform_device *pdev)
+static int __devinit smc_drv_probe(struct platform_device *pdev)
 {
 	struct smc91x_platdata *pd = pdev->dev.platform_data;
 	struct smc_local *lp;
@@ -2324,7 +2324,7 @@ static int smc_drv_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int smc_drv_remove(struct platform_device *pdev)
+static int __devexit smc_drv_remove(struct platform_device *pdev)
 {
 	struct net_device *ndev = platform_get_drvdata(pdev);
 	struct smc_local *lp = netdev_priv(ndev);
@@ -2389,7 +2389,7 @@ static int smc_drv_resume(struct platform_device *dev)
 
 static struct platform_driver smc_driver = {
 	.probe		= smc_drv_probe,
-	.remove		= smc_drv_remove,
+	.remove		= __devexit_p(smc_drv_remove),
 	.suspend	= smc_drv_suspend,
 	.resume		= smc_drv_resume,
 	.driver		= {

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
