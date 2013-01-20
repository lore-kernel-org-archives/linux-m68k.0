From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] m68k/atari: EtherNAT - remove __dev* attributes
Date: Sun, 20 Jan 2013 11:30:16 +0100
Message-ID: <1358677816-13513-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from jacques.telenet-ops.be ([195.130.132.50]:57175 "EHLO
	jacques.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751358Ab3ATKaY (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 20 Jan 2013 05:30:24 -0500
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitz@debian.org>
Cc: linux-m68k@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>

Cfr. commit 1e48fea4805db6766708d9387f8dc1c5d5226263 ("smc91x: remove
__dev* attributes")

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 drivers/net/ethernet/smsc/atari_91C111.c |   12 ++++++------
 1 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/smsc/atari_91C111.c b/drivers/net/ethernet/smsc/atari_91C111.c
index 09be801..2708864 100644
--- a/drivers/net/ethernet/smsc/atari_91C111.c
+++ b/drivers/net/ethernet/smsc/atari_91C111.c
@@ -1736,7 +1736,7 @@ static const struct net_device_ops smc_netdev_ops = {
  * I just deleted auto_irq.c, since it was never built...
  *   --jgarzik
  */
-static int __devinit smc_findirq(struct smc_local *lp)
+static int smc_findirq(struct smc_local *lp)
 {
 	void __iomem *ioaddr = lp->base;
 	int timeout = 20;
@@ -1810,8 +1810,8 @@ static int __devinit smc_findirq(struct smc_local *lp)
  * o  actually GRAB the irq.
  * o  GRAB the region
  */
-static int __devinit smc_probe(struct net_device *dev, void __iomem *ioaddr,
-			       unsigned long irq_flags)
+static int smc_probe(struct net_device *dev, void __iomem *ioaddr,
+		     unsigned long irq_flags)
 {
 	struct smc_local *lp = netdev_priv(dev);
 	static int version_printed = 0;
@@ -2165,7 +2165,7 @@ static void smc_release_datacs(struct platform_device *pdev, struct net_device *
  *	0 --> there is a device
  *	anything else, error
  */
-static int __devinit smc_drv_probe(struct platform_device *pdev)
+static int smc_drv_probe(struct platform_device *pdev)
 {
 	struct smc91x_platdata *pd = pdev->dev.platform_data;
 	struct smc_local *lp;
@@ -2328,7 +2328,7 @@ static int __devinit smc_drv_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int __devexit smc_drv_remove(struct platform_device *pdev)
+static int smc_drv_remove(struct platform_device *pdev)
 {
 	struct net_device *ndev = platform_get_drvdata(pdev);
 	struct smc_local *lp = netdev_priv(ndev);
@@ -2400,7 +2400,7 @@ static struct dev_pm_ops smc_drv_pm_ops = {
 
 static struct platform_driver smc_driver = {
 	.probe		= smc_drv_probe,
-	.remove		= __devexit_p(smc_drv_remove),
+	.remove		= smc_drv_remove,
 	.driver		= {
 		.name	= CARDNAME,
 		.owner	= THIS_MODULE,
-- 
1.7.0.4
