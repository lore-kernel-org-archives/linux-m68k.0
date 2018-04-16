From: Michael Schmitz <schmitzmic@gmail.com>
Subject: [PATCH 02/10] net: ax88796: Attach MII bus only when open
Date: Tue, 17 Apr 2018 10:04:37 +1200
Message-ID: <1523916285-6057-3-git-send-email-schmitzmic@gmail.com>
References: <1523916285-6057-1-git-send-email-schmitzmic@gmail.com>
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <1523916285-6057-1-git-send-email-schmitzmic@gmail.com>
Sender: netdev-owner@vger.kernel.org
To: netdev@vger.kernel.org
Cc: linux-m68k@vger.kernel.org, Michael.Karcher@fu-berlin.de, Michael Karcher <debian@mkarcher.dialup.fu-berlin.de>, Michael Karcher <kernel@mkarcher.dialup.fu-berlin.de>, Michael Schmitz <schmitzmic@gmail.com>
List-Id: linux-m68k@vger.kernel.org

From: Michael Karcher <debian@mkarcher.dialup.fu-berlin.de>

Call ax_mii_init in ax_open(), and unregister/remove mdiobus resources
in ax_close().

This is needed to be able to unload the module, as the module is busy
while the MII bus is attached.

Signed-off-by: Michael Karcher <kernel@mkarcher.dialup.fu-berlin.de>
Signed-off-by: Michael Schmitz <schmitzmic@gmail.com>
---
 drivers/net/ethernet/8390/ax88796.c |   13 +++++++++----
 1 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/8390/ax88796.c b/drivers/net/ethernet/8390/ax88796.c
index 2a256aa..f7b8911 100644
--- a/drivers/net/ethernet/8390/ax88796.c
+++ b/drivers/net/ethernet/8390/ax88796.c
@@ -79,6 +79,8 @@
 
 static u32 ax_msg_enable;
 
+static int ax_mii_init(struct net_device *dev);
+
 /* device private data */
 
 struct ax_device {
@@ -396,6 +398,10 @@ static int ax_open(struct net_device *dev)
 
 	netdev_dbg(dev, "open\n");
 
+	ret = ax_mii_init(dev);
+	if (ret)
+		goto failed_request_irq;
+
 	ret = request_irq(dev->irq, ax_ei_interrupt, ax->irqflags,
 			  dev->name, dev);
 	if (ret)
@@ -442,6 +448,9 @@ static int ax_close(struct net_device *dev)
 	phy_disconnect(dev->phydev);
 
 	free_irq(dev->irq, dev);
+
+	mdiobus_unregister(ax->mii_bus);
+	free_mdio_bitbang(ax->mii_bus);
 	return 0;
 }
 
@@ -758,10 +767,6 @@ static int ax_init_dev(struct net_device *dev)
 	dev->netdev_ops = &ax_netdev_ops;
 	dev->ethtool_ops = &ax_ethtool_ops;
 
-	ret = ax_mii_init(dev);
-	if (ret)
-		goto err_out;
-
 	ax_NS8390_init(dev, 0);
 
 	ret = register_netdev(dev);
-- 
1.7.0.4
