From: Michael Schmitz <schmitzmic@gmail.com>
Subject: [PATCH 07/10] net: ax88796: unregister mdiobus on ax_mii_init() fail
Date: Tue, 17 Apr 2018 10:04:42 +1200
Message-ID: <1523916285-6057-8-git-send-email-schmitzmic@gmail.com>
References: <1523916285-6057-1-git-send-email-schmitzmic@gmail.com>
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <1523916285-6057-1-git-send-email-schmitzmic@gmail.com>
Sender: netdev-owner@vger.kernel.org
To: netdev@vger.kernel.org
Cc: linux-m68k@vger.kernel.org, Michael.Karcher@fu-berlin.de, Michael Schmitz <schmitz@debian.org>, Michael Karcher <kernel@mkarcher.dialup.fu-berlin.de>, Michael Schmitz <schmitzmic@gmail.com>
List-Id: linux-m68k@vger.kernel.org

From: Michael Schmitz <schmitz@debian.org>

Unregister and free up mdiobus resources if ax_mii_init() failed.

Signed-off-by: Michael Karcher <kernel@mkarcher.dialup.fu-berlin.de>
Signed-off-by: Michael Schmitz <schmitzmic@gmail.com>
---
 drivers/net/ethernet/8390/ax88796.c |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/drivers/net/ethernet/8390/ax88796.c b/drivers/net/ethernet/8390/ax88796.c
index b09cdc6..6af9aca 100644
--- a/drivers/net/ethernet/8390/ax88796.c
+++ b/drivers/net/ethernet/8390/ax88796.c
@@ -415,7 +415,7 @@ static int ax_open(struct net_device *dev)
 
 	ret = ax_mii_init(dev);
 	if (ret)
-		goto failed_request_irq;
+		goto failed_mii;
 
 	if (ax->plat->check_irq)
 		ret = request_irq(dev->irq, ax_ei_interrupt_filtered,
@@ -448,6 +448,10 @@ static int ax_open(struct net_device *dev)
 	ax_phy_switch(dev, 0);
 	free_irq(dev->irq, dev);
  failed_request_irq:
+	/* unregister mdiobus */
+	mdiobus_unregister(ax->mii_bus);
+	free_mdio_bitbang(ax->mii_bus);
+ failed_mii:
 	return ret;
 }
 
-- 
1.7.0.4
