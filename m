From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 02/11] m68k: Atari EtherNAT - convert to dev_pm_ops
Date: Wed, 26 May 2010 19:48:44 +0200
Message-ID: <1274896133-19590-3-git-send-email-geert@linux-m68k.org>
References: <1274896133-19590-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from georges.telenet-ops.be ([195.130.137.68]:34518 "EHLO
	georges.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754822Ab0EZRtR (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 26 May 2010 13:49:17 -0400
In-Reply-To: <1274896133-19590-1-git-send-email-geert@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>
Cc: linux-m68k@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>

Cfr. commit 9f950f72e57fe4bf9b16ace67e4cc5ffcee79d00 ("NET: smc91x: convert to
dev_pm_ops")

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 drivers/net/atari_91C111.c |   18 ++++++++++++------
 1 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/net/atari_91C111.c b/drivers/net/atari_91C111.c
index bb28b19..d902c10 100644
--- a/drivers/net/atari_91C111.c
+++ b/drivers/net/atari_91C111.c
@@ -2365,9 +2365,10 @@ static int __devexit smc_drv_remove(struct platform_device *pdev)
 	return 0;
 }
 
-static int smc_drv_suspend(struct platform_device *dev, pm_message_t state)
+static int smc_drv_suspend(struct device *dev)
 {
-	struct net_device *ndev = platform_get_drvdata(dev);
+	struct platform_device *pdev = to_platform_device(dev);
+	struct net_device *ndev = platform_get_drvdata(pdev);
 
 	if (ndev) {
 		if (netif_running(ndev)) {
@@ -2379,9 +2380,10 @@ static int smc_drv_suspend(struct platform_device *dev, pm_message_t state)
 	return 0;
 }
 
-static int smc_drv_resume(struct platform_device *dev)
+static int smc_drv_resume(struct device *dev)
 {
-	struct net_device *ndev = platform_get_drvdata(dev);
+	struct platform_device *pdev = to_platform_device(dev);
+	struct net_device *ndev = platform_get_drvdata(pdev);
 
 	if (ndev) {
 		struct smc_local *lp = netdev_priv(ndev);
@@ -2397,14 +2399,18 @@ static int smc_drv_resume(struct platform_device *dev)
 	return 0;
 }
 
+static struct dev_pm_ops smc_drv_pm_ops = {
+	.suspend	= smc_drv_suspend,
+	.resume		= smc_drv_resume,
+};
+
 static struct platform_driver smc_driver = {
 	.probe		= smc_drv_probe,
 	.remove		= __devexit_p(smc_drv_remove),
-	.suspend	= smc_drv_suspend,
-	.resume		= smc_drv_resume,
 	.driver		= {
 		.name	= CARDNAME,
 		.owner	= THIS_MODULE,
+		.pm	= &smc_drv_pm_ops,
 	},
 };
 
-- 
1.7.0.4
