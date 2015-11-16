From: Michael Schmitz <schmitzmic@gmail.com>
Subject: [PATCH 8/8] ax88796: use interrupt status callback for XSurf100 driver
Date: Tue, 17 Nov 2015 12:33:17 +1300
Message-ID: <1447716797-20906-9-git-send-email-schmitzmic@gmail.com>
References: <1447716797-20906-1-git-send-email-schmitzmic@gmail.com>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pa0-f66.google.com ([209.85.220.66]:35139 "EHLO
	mail-pa0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752486AbbKPXdq (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 16 Nov 2015 18:33:46 -0500
Received: by padhk6 with SMTP id hk6so26585032pad.2
        for <linux-m68k@vger.kernel.org>; Mon, 16 Nov 2015 15:33:46 -0800 (PST)
In-Reply-To: <1447716797-20906-1-git-send-email-schmitzmic@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org
Cc: geert@linux-m68k.org, debian-68k@lists.debian.org, kernel@mkarcher.dialup.fu-berlin.de, Michael Schmitz <schmitzmic@gmail.com>

Make use of the ax88796 platform data interupt status hook in the
m68k Amiga XSurf100 driver. The XSurf100 interrupt is shared with
other Amiga hardware interrupts so ei_interrupt would otherwise
get called a lot without need.

Signed-off-by: Michael Karcher <kernel@mkarcher.dialup.fu-berlin.de>
Signed-off-by: Michael Schmitz <schmitzmic@gmail.com>
---
 drivers/net/ethernet/8390/xsurf100.c |   42 +++++++++++++++++++++++++++------
 1 files changed, 34 insertions(+), 8 deletions(-)

diff --git a/drivers/net/ethernet/8390/xsurf100.c b/drivers/net/ethernet/8390/xsurf100.c
index 3c34b04..f1b1f62 100644
--- a/drivers/net/ethernet/8390/xsurf100.c
+++ b/drivers/net/ethernet/8390/xsurf100.c
@@ -7,27 +7,49 @@
 
 #define ZORRO_PROD_INDIVIDUAL_COMPUTERS_X_SURF100 ZORRO_ID(INDIVIDUAL_COMPUTERS, 0x64, 0)
 
-#define XS1000_8390_BASE 0x800
+#define XS100_IRQSTATUS_BASE 0x40
+#define XS100_8390_BASE 0x800
+
+struct xsurf100_ax_plat_data {
+	struct ax_plat_data ax;
+	void *base_regs;
+};
+
+static int is_xsurf100_network_irq(struct platform_device *pdev)
+{
+	struct xsurf100_ax_plat_data *xs100 = dev_get_platdata(&pdev->dev);
+	return (readw(xs100->base_regs + XS100_IRQSTATUS_BASE) & 0xaaaa) != 0;
+}
 
 static int xsurf100_probe(struct zorro_dev *zdev, const struct zorro_device_id *ent)
 {
 	struct platform_device *pdev;
-	struct ax_plat_data ax88796_data;
+	struct xsurf100_ax_plat_data ax88796_data;
 	struct resource res[2] = {
 		DEFINE_RES_IRQ(IRQ_AMIGA_PORTS),
-		DEFINE_RES_IO(zdev->resource.start + XS1000_8390_BASE, 4 * 0x20)
+		DEFINE_RES_IO(zdev->resource.start + XS100_8390_BASE, 4 * 0x20)
 	};
 	int reg;
 	u32 reg_offsets[32];
 
+	if (!request_mem_region(zdev->resource.start, 0x100, zdev->name))
+	{
+		dev_err(&zdev->dev, "cannot reserve X-Surf 100 control registers\n");
+		return -ENXIO;
+	}
+
 	for (reg = 0; reg < 0x20; reg++)
 		reg_offsets[reg] = 4;
 
-	ax88796_data.flags = AXFLG_HAS_EEPROM;
-	ax88796_data.wordlength = 2;
-	ax88796_data.dcr_val = 0x48;
-	ax88796_data.rcr_val = 0x40;
-	ax88796_data.reg_offsets = reg_offsets;
+	memset(&ax88796_data, 0, sizeof ax88796_data);
+	ax88796_data.ax.flags = AXFLG_HAS_EEPROM;
+	ax88796_data.ax.wordlength = 2;
+	ax88796_data.ax.dcr_val = 0x48;
+	ax88796_data.ax.rcr_val = 0x40;
+	ax88796_data.ax.reg_offsets = reg_offsets;
+	ax88796_data.ax.check_irq = is_xsurf100_network_irq;
+	ax88796_data.base_regs = ioremap(zdev->resource.start, 0x100);
+
 
 	// TODO: xsurf100 specific accelerated data exchange
 
@@ -44,8 +66,12 @@ static int xsurf100_probe(struct zorro_dev *zdev, const struct zorro_device_id *
 static void xsurf100_remove(struct zorro_dev *zdev)
 {
 	struct platform_device *pdev;
+	struct xsurf100_ax_plat_data *xs100;
 
 	pdev = zorro_get_drvdata(zdev);
+	xs100 = dev_get_platdata(&pdev->dev);
+	iounmap(xs100->base_regs);
+	release_mem_region(zdev->resource.start, 0x100);
 
 	platform_device_unregister(pdev);
 }
-- 
1.7.0.4
