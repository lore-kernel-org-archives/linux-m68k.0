From: Michael Schmitz <schmitzmic@gmail.com>
Subject: [PATCH 4/8] ax88796: Do not free IRQ that did not get requested
Date: Tue, 17 Nov 2015 12:33:13 +1300
Message-ID: <1447716797-20906-5-git-send-email-schmitzmic@gmail.com>
References: <1447716797-20906-1-git-send-email-schmitzmic@gmail.com>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pa0-f65.google.com ([209.85.220.65]:35962 "EHLO
	mail-pa0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752416AbbKPXdn (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 16 Nov 2015 18:33:43 -0500
Received: by pabfh17 with SMTP id fh17so26703031pab.3
        for <linux-m68k@vger.kernel.org>; Mon, 16 Nov 2015 15:33:42 -0800 (PST)
In-Reply-To: <1447716797-20906-1-git-send-email-schmitzmic@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org
Cc: geert@linux-m68k.org, debian-68k@lists.debian.org, kernel@mkarcher.dialup.fu-berlin.de, Michael Karcher <debian@mkarcher.dialup.fu-berlin.de>, Michael Schmitz <schmitzmic@gmail.com>

From: Michael Karcher <debian@mkarcher.dialup.fu-berlin.de>

The irq is request on netdev open time, so do not free it in probe
if something fails.
Also do not free the irq in remove, as it got already freed in close

Signed-off-by: Michael Karcher <kernel@mkarcher.dialup.fu-berlin.de>
Signed-off-by: Michael Schmitz <schmitzmic@gmail.com>
---
 drivers/net/ethernet/8390/ax88796.c |    6 +-----
 1 files changed, 1 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/8390/ax88796.c b/drivers/net/ethernet/8390/ax88796.c
index 544f3ba..6472473 100644
--- a/drivers/net/ethernet/8390/ax88796.c
+++ b/drivers/net/ethernet/8390/ax88796.c
@@ -802,7 +802,7 @@ static int ax_init_dev(struct net_device *dev)
 
 	ret = register_netdev(dev);
 	if (ret)
-		goto out_irq;
+		goto err_out;
 
 	netdev_info(dev, "%dbit, irq %d, %lx, MAC: %pM\n",
 		    ei_local->word16 ? 16 : 8, dev->irq, dev->base_addr,
@@ -810,9 +810,6 @@ static int ax_init_dev(struct net_device *dev)
 
 	return 0;
 
- out_irq:
-	/* cleanup irq */
-	free_irq(dev->irq, dev);
  err_out:
 	return ret;
 }
@@ -825,7 +822,6 @@ static int ax_remove(struct platform_device *pdev)
 	struct resource *mem;
 
 	unregister_netdev(dev);
-	free_irq(dev->irq, dev);
 
 	iounmap(ei_local->mem);
 	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-- 
1.7.0.4
