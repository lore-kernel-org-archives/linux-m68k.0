From: Michael Schmitz <schmitzmic@gmail.com>
Subject: [PATCH v3 3/9] net: ax88796: Attach MII bus only when open
Date: Wed, 18 Apr 2018 16:26:50 +1200
Message-ID: <1524025616-3722-4-git-send-email-schmitzmic@gmail.com>
References: <1523930895-6973-1-git-send-email-schmitzmic@gmail.com>
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <1523930895-6973-1-git-send-email-schmitzmic@gmail.com>
Sender: netdev-owner@vger.kernel.org
To: netdev@vger.kernel.org
Cc: andrew@lunn.ch, fthain@telegraphics.com.au, geert@linux-m68k.org, f.fainelli@gmail.com, linux-m68k@vger.kernel.org, Michael.Karcher@fu-berlin.de, Michael Karcher <kernel@mkarcher.dialup.fu-berlin.de>, Michael Schmitz <schmitzmic@gmail.com>
List-Id: linux-m68k@vger.kernel.org

From: Michael Karcher <kernel@mkarcher.dialup.fu-berlin.de>

Call ax_mii_init in ax_open(), and unregister/remove mdiobus resources
in ax_close().

This is needed to be able to unload the module, as the module is busy
while the MII bus is attached.

Signed-off-by: Michael Karcher <kernel@mkarcher.dialup.fu-berlin.de>
Signed-off-by: Michael Schmitz <schmitzmic@gmail.com>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
---
 drivers/net/ethernet/8390/ax88796.c |  183 ++++++++++++++++++-----------------
 1 files changed, 95 insertions(+), 88 deletions(-)

diff --git a/drivers/net/ethernet/8390/ax88796.c b/drivers/net/ethernet/8390/ax88796.c
index 2a256aa..83e59ae 100644
--- a/drivers/net/ethernet/8390/ax88796.c
+++ b/drivers/net/ethernet/8390/ax88796.c
@@ -389,6 +389,90 @@ static void ax_phy_switch(struct net_device *dev, int on)
 	ei_outb(reg_gpoc, ei_local->mem + EI_SHIFT(0x17));
 }
 
+static void ax_bb_mdc(struct mdiobb_ctrl *ctrl, int level)
+{
+	struct ax_device *ax = container_of(ctrl, struct ax_device, bb_ctrl);
+
+	if (level)
+		ax->reg_memr |= AX_MEMR_MDC;
+	else
+		ax->reg_memr &= ~AX_MEMR_MDC;
+
+	ei_outb(ax->reg_memr, ax->addr_memr);
+}
+
+static void ax_bb_dir(struct mdiobb_ctrl *ctrl, int output)
+{
+	struct ax_device *ax = container_of(ctrl, struct ax_device, bb_ctrl);
+
+	if (output)
+		ax->reg_memr &= ~AX_MEMR_MDIR;
+	else
+		ax->reg_memr |= AX_MEMR_MDIR;
+
+	ei_outb(ax->reg_memr, ax->addr_memr);
+}
+
+static void ax_bb_set_data(struct mdiobb_ctrl *ctrl, int value)
+{
+	struct ax_device *ax = container_of(ctrl, struct ax_device, bb_ctrl);
+
+	if (value)
+		ax->reg_memr |= AX_MEMR_MDO;
+	else
+		ax->reg_memr &= ~AX_MEMR_MDO;
+
+	ei_outb(ax->reg_memr, ax->addr_memr);
+}
+
+static int ax_bb_get_data(struct mdiobb_ctrl *ctrl)
+{
+	struct ax_device *ax = container_of(ctrl, struct ax_device, bb_ctrl);
+	int reg_memr = ei_inb(ax->addr_memr);
+
+	return reg_memr & AX_MEMR_MDI ? 1 : 0;
+}
+
+static const struct mdiobb_ops bb_ops = {
+	.owner = THIS_MODULE,
+	.set_mdc = ax_bb_mdc,
+	.set_mdio_dir = ax_bb_dir,
+	.set_mdio_data = ax_bb_set_data,
+	.get_mdio_data = ax_bb_get_data,
+};
+
+static int ax_mii_init(struct net_device *dev)
+{
+	struct platform_device *pdev = to_platform_device(dev->dev.parent);
+	struct ei_device *ei_local = netdev_priv(dev);
+	struct ax_device *ax = to_ax_dev(dev);
+	int err;
+
+	ax->bb_ctrl.ops = &bb_ops;
+	ax->addr_memr = ei_local->mem + AX_MEMR;
+	ax->mii_bus = alloc_mdio_bitbang(&ax->bb_ctrl);
+	if (!ax->mii_bus) {
+		err = -ENOMEM;
+		goto out;
+	}
+
+	ax->mii_bus->name = "ax88796_mii_bus";
+	ax->mii_bus->parent = dev->dev.parent;
+	snprintf(ax->mii_bus->id, MII_BUS_ID_SIZE, "%s-%x",
+		pdev->name, pdev->id);
+
+	err = mdiobus_register(ax->mii_bus);
+	if (err)
+		goto out_free_mdio_bitbang;
+
+	return 0;
+
+ out_free_mdio_bitbang:
+	free_mdio_bitbang(ax->mii_bus);
+ out:
+	return err;
+}
+
 static int ax_open(struct net_device *dev)
 {
 	struct ax_device *ax = to_ax_dev(dev);
@@ -396,6 +480,10 @@ static int ax_open(struct net_device *dev)
 
 	netdev_dbg(dev, "open\n");
 
+	ret = ax_mii_init(dev);
+	if (ret)
+		goto failed_mii;
+
 	ret = request_irq(dev->irq, ax_ei_interrupt, ax->irqflags,
 			  dev->name, dev);
 	if (ret)
@@ -423,6 +511,10 @@ static int ax_open(struct net_device *dev)
 	ax_phy_switch(dev, 0);
 	free_irq(dev->irq, dev);
  failed_request_irq:
+	/* unregister mdiobus */
+	mdiobus_unregister(ax->mii_bus);
+	free_mdio_bitbang(ax->mii_bus);
+ failed_mii:
 	return ret;
 }
 
@@ -442,6 +534,9 @@ static int ax_close(struct net_device *dev)
 	phy_disconnect(dev->phydev);
 
 	free_irq(dev->irq, dev);
+
+	mdiobus_unregister(ax->mii_bus);
+	free_mdio_bitbang(ax->mii_bus);
 	return 0;
 }
 
@@ -541,92 +636,8 @@ static void ax_eeprom_register_write(struct eeprom_93cx6 *eeprom)
 #endif
 };
 
-static void ax_bb_mdc(struct mdiobb_ctrl *ctrl, int level)
-{
-	struct ax_device *ax = container_of(ctrl, struct ax_device, bb_ctrl);
-
-	if (level)
-		ax->reg_memr |= AX_MEMR_MDC;
-	else
-		ax->reg_memr &= ~AX_MEMR_MDC;
-
-	ei_outb(ax->reg_memr, ax->addr_memr);
-}
-
-static void ax_bb_dir(struct mdiobb_ctrl *ctrl, int output)
-{
-	struct ax_device *ax = container_of(ctrl, struct ax_device, bb_ctrl);
-
-	if (output)
-		ax->reg_memr &= ~AX_MEMR_MDIR;
-	else
-		ax->reg_memr |= AX_MEMR_MDIR;
-
-	ei_outb(ax->reg_memr, ax->addr_memr);
-}
-
-static void ax_bb_set_data(struct mdiobb_ctrl *ctrl, int value)
-{
-	struct ax_device *ax = container_of(ctrl, struct ax_device, bb_ctrl);
-
-	if (value)
-		ax->reg_memr |= AX_MEMR_MDO;
-	else
-		ax->reg_memr &= ~AX_MEMR_MDO;
-
-	ei_outb(ax->reg_memr, ax->addr_memr);
-}
-
-static int ax_bb_get_data(struct mdiobb_ctrl *ctrl)
-{
-	struct ax_device *ax = container_of(ctrl, struct ax_device, bb_ctrl);
-	int reg_memr = ei_inb(ax->addr_memr);
-
-	return reg_memr & AX_MEMR_MDI ? 1 : 0;
-}
-
-static const struct mdiobb_ops bb_ops = {
-	.owner = THIS_MODULE,
-	.set_mdc = ax_bb_mdc,
-	.set_mdio_dir = ax_bb_dir,
-	.set_mdio_data = ax_bb_set_data,
-	.get_mdio_data = ax_bb_get_data,
-};
-
 /* setup code */
 
-static int ax_mii_init(struct net_device *dev)
-{
-	struct platform_device *pdev = to_platform_device(dev->dev.parent);
-	struct ei_device *ei_local = netdev_priv(dev);
-	struct ax_device *ax = to_ax_dev(dev);
-	int err;
-
-	ax->bb_ctrl.ops = &bb_ops;
-	ax->addr_memr = ei_local->mem + AX_MEMR;
-	ax->mii_bus = alloc_mdio_bitbang(&ax->bb_ctrl);
-	if (!ax->mii_bus) {
-		err = -ENOMEM;
-		goto out;
-	}
-
-	ax->mii_bus->name = "ax88796_mii_bus";
-	ax->mii_bus->parent = dev->dev.parent;
-	snprintf(ax->mii_bus->id, MII_BUS_ID_SIZE, "%s-%x",
-		pdev->name, pdev->id);
-
-	err = mdiobus_register(ax->mii_bus);
-	if (err)
-		goto out_free_mdio_bitbang;
-
-	return 0;
-
- out_free_mdio_bitbang:
-	free_mdio_bitbang(ax->mii_bus);
- out:
-	return err;
-}
-
 static void ax_initial_setup(struct net_device *dev, struct ei_device *ei_local)
 {
 	void __iomem *ioaddr = ei_local->mem;
@@ -758,10 +769,6 @@ static int ax_init_dev(struct net_device *dev)
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
