From: Michael Schmitz <schmitzmic@gmail.com>
Subject: [PATCH 2/8] ax88796: Attach MII bus only when open
Date: Tue, 17 Nov 2015 12:33:11 +1300
Message-ID: <1447716797-20906-3-git-send-email-schmitzmic@gmail.com>
References: <1447716797-20906-1-git-send-email-schmitzmic@gmail.com>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pa0-f65.google.com ([209.85.220.65]:34771 "EHLO
	mail-pa0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752304AbbKPXdk (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 16 Nov 2015 18:33:40 -0500
Received: by pacfl14 with SMTP id fl14so26644633pac.1
        for <linux-m68k@vger.kernel.org>; Mon, 16 Nov 2015 15:33:40 -0800 (PST)
In-Reply-To: <1447716797-20906-1-git-send-email-schmitzmic@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org
Cc: geert@linux-m68k.org, debian-68k@lists.debian.org, kernel@mkarcher.dialup.fu-berlin.de, Michael Karcher <debian@mkarcher.dialup.fu-berlin.de>, Michael Schmitz <schmitzmic@gmail.com>

From: Michael Karcher <debian@mkarcher.dialup.fu-berlin.de>

This is needed to be able to unload the module, as the module is busy
while the MII bus is attached.

Signed-off-by: Michael Karcher <kernel@mkarcher.dialup.fu-berlin.de>
Signed-off-by: Michael Schmitz <schmitzmic@gmail.com>
---
 drivers/net/ethernet/8390/ax88796.c |   14 ++++++++++----
 1 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/8390/ax88796.c b/drivers/net/ethernet/8390/ax88796.c
index 7963e1d..f76753b 100644
--- a/drivers/net/ethernet/8390/ax88796.c
+++ b/drivers/net/ethernet/8390/ax88796.c
@@ -79,6 +79,8 @@ static unsigned char version[] = "ax88796.c: Copyright 2005,2007 Simtec Electron
 
 static u32 ax_msg_enable;
 
+static int ax_mii_init(struct net_device *dev);
+
 /* device private data */
 
 struct ax_device {
@@ -399,6 +401,10 @@ static int ax_open(struct net_device *dev)
 
 	netdev_dbg(dev, "open\n");
 
+	ret = ax_mii_init(dev);
+	if (ret)
+		goto failed_request_irq;
+
 	ret = request_irq(dev->irq, ax_ei_interrupt, ax->irqflags,
 			  dev->name, dev);
 	if (ret)
@@ -445,6 +451,10 @@ static int ax_close(struct net_device *dev)
 	phy_disconnect(ax->phy_dev);
 
 	free_irq(dev->irq, dev);
+
+	mdiobus_unregister(ax->mii_bus);
+	kfree(ax->mii_bus->irq);
+	free_mdio_bitbang(ax->mii_bus);
 	return 0;
 }
 
@@ -790,10 +800,6 @@ static int ax_init_dev(struct net_device *dev)
 	dev->netdev_ops = &ax_netdev_ops;
 	dev->ethtool_ops = &ax_ethtool_ops;
 
-	ret = ax_mii_init(dev);
-	if (ret)
-		goto out_irq;
-
 	ax_NS8390_init(dev, 0);
 
 	ret = register_netdev(dev);
-- 
1.7.0.4
