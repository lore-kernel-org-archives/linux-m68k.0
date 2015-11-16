From: Michael Schmitz <schmitzmic@gmail.com>
Subject: [PATCH 3/8] ax88796: Move mii support functions upwards to prevent need of forward declaration
Date: Tue, 17 Nov 2015 12:33:12 +1300
Message-ID: <1447716797-20906-4-git-send-email-schmitzmic@gmail.com>
References: <1447716797-20906-1-git-send-email-schmitzmic@gmail.com>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pa0-f66.google.com ([209.85.220.66]:34788 "EHLO
	mail-pa0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752416AbbKPXdm (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 16 Nov 2015 18:33:42 -0500
Received: by pacfl14 with SMTP id fl14so26644697pac.1
        for <linux-m68k@vger.kernel.org>; Mon, 16 Nov 2015 15:33:41 -0800 (PST)
In-Reply-To: <1447716797-20906-1-git-send-email-schmitzmic@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org
Cc: geert@linux-m68k.org, debian-68k@lists.debian.org, kernel@mkarcher.dialup.fu-berlin.de, Michael Schmitz <schmitzmic@gmail.com>

From: Michael Karcher <kernel@mkarcher.dialup.fu-berlin.de>

This commit contains nothing but moving of code lines inside ax88796.c

Signed-off-by: Michael Karcher <kernel@mkarcher.dialup.fu-berlin.de>
Signed-off-by: Michael Schmitz <schmitzmic@gmail.com>
---
 drivers/net/ethernet/8390/ax88796.c |  192 +++++++++++++++++------------------
 1 files changed, 95 insertions(+), 97 deletions(-)

diff --git a/drivers/net/ethernet/8390/ax88796.c b/drivers/net/ethernet/8390/ax88796.c
index f76753b..544f3ba 100644
--- a/drivers/net/ethernet/8390/ax88796.c
+++ b/drivers/net/ethernet/8390/ax88796.c
@@ -79,8 +79,6 @@ static unsigned char version[] = "ax88796.c: Copyright 2005,2007 Simtec Electron
 
 static u32 ax_msg_enable;
 
-static int ax_mii_init(struct net_device *dev);
-
 /* device private data */
 
 struct ax_device {
@@ -319,6 +317,101 @@ static void ax_block_output(struct net_device *dev, int count,
 #define AX_MEMR_EEO		BIT(6)
 #define AX_MEMR_EECLK		BIT(7)
 
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
+static struct mdiobb_ops bb_ops = {
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
+	int err, i;
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
+	ax->mii_bus->irq = kmalloc(sizeof(int) * PHY_MAX_ADDR, GFP_KERNEL);
+	if (!ax->mii_bus->irq) {
+		err = -ENOMEM;
+		goto out_free_mdio_bitbang;
+	}
+
+	for (i = 0; i < PHY_MAX_ADDR; i++)
+		ax->mii_bus->irq[i] = PHY_POLL;
+
+	err = mdiobus_register(ax->mii_bus);
+	if (err)
+		goto out_free_irq;
+
+	return 0;
+
+ out_free_irq:
+	kfree(ax->mii_bus->irq);
+ out_free_mdio_bitbang:
+	free_mdio_bitbang(ax->mii_bus);
+ out:
+	return err;
+}
+
 static void ax_handle_link_change(struct net_device *dev)
 {
 	struct ax_device  *ax = to_ax_dev(dev);
@@ -578,103 +671,8 @@ static const struct net_device_ops ax_netdev_ops = {
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
-static struct mdiobb_ops bb_ops = {
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
-	int err, i;
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
-	ax->mii_bus->irq = kmalloc(sizeof(int) * PHY_MAX_ADDR, GFP_KERNEL);
-	if (!ax->mii_bus->irq) {
-		err = -ENOMEM;
-		goto out_free_mdio_bitbang;
-	}
-
-	for (i = 0; i < PHY_MAX_ADDR; i++)
-		ax->mii_bus->irq[i] = PHY_POLL;
-
-	err = mdiobus_register(ax->mii_bus);
-	if (err)
-		goto out_free_irq;
-
-	return 0;
-
- out_free_irq:
-	kfree(ax->mii_bus->irq);
- out_free_mdio_bitbang:
-	free_mdio_bitbang(ax->mii_bus);
- out:
-	return err;
-}
-
 static void ax_initial_setup(struct net_device *dev, struct ei_device *ei_local)
 {
 	void __iomem *ioaddr = ei_local->mem;
-- 
1.7.0.4
