From: Michael Schmitz <schmitzmic@gmail.com>
Subject: [PATCH 7/8] ax88796: Add X-Surf 100 zorro driver providing an ax88796 platform device
Date: Tue, 17 Nov 2015 12:33:16 +1300
Message-ID: <1447716797-20906-8-git-send-email-schmitzmic@gmail.com>
References: <1447716797-20906-1-git-send-email-schmitzmic@gmail.com>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pa0-f68.google.com ([209.85.220.68]:33811 "EHLO
	mail-pa0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752460AbbKPXdq (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 16 Nov 2015 18:33:46 -0500
Received: by pacfl14 with SMTP id fl14so26644864pac.1
        for <linux-m68k@vger.kernel.org>; Mon, 16 Nov 2015 15:33:45 -0800 (PST)
In-Reply-To: <1447716797-20906-1-git-send-email-schmitzmic@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org
Cc: geert@linux-m68k.org, debian-68k@lists.debian.org, kernel@mkarcher.dialup.fu-berlin.de, Michael Schmitz <schmitzmic@gmail.com>

Add platform device driver to populate the ax88796 platform data from
information provided by the XSurf100 zorro device driver.
This driver will have to be loaded before loading the ax88796 module,
or compiled as built-in.

Signed-off-by: Michael Karcher <kernel@mkarcher.dialup.fu-berlin.de>
Signed-off-by: Michael Schmitz <schmitzmic@gmail.com>
---
 drivers/net/ethernet/8390/Kconfig    |   10 ++++-
 drivers/net/ethernet/8390/Makefile   |    1 +
 drivers/net/ethernet/8390/xsurf100.c |   71 ++++++++++++++++++++++++++++++++++
 3 files changed, 81 insertions(+), 1 deletions(-)
 create mode 100644 drivers/net/ethernet/8390/xsurf100.c

diff --git a/drivers/net/ethernet/8390/Kconfig b/drivers/net/ethernet/8390/Kconfig
index edf7225..2cb6a32 100644
--- a/drivers/net/ethernet/8390/Kconfig
+++ b/drivers/net/ethernet/8390/Kconfig
@@ -30,7 +30,7 @@ config PCMCIA_AXNET
 
 config AX88796
 	tristate "ASIX AX88796 NE2000 clone support"
-	depends on (ARM || MIPS || SUPERH)
+	depends on (ARM || MIPS || SUPERH || AMIGA)
 	select CRC32
 	select PHYLIB
 	select MDIO_BITBANG
@@ -45,6 +45,14 @@ config AX88796_93CX6
 	---help---
 	  Select this if your platform comes with an external 93CX6 eeprom.
 
+config XSURF100
+	tristate "XSurf 100 support"
+	depends on ZORRO
+	depends on AX88796
+	---help---
+	  This driver is for the Individual Computers X-Surf 100 Ethernet
+          card. If you have such a card, say Y. Otherwise, say N.
+
 config HYDRA
 	tristate "Hydra support"
 	depends on ZORRO
diff --git a/drivers/net/ethernet/8390/Makefile b/drivers/net/ethernet/8390/Makefile
index ff3b318..c2dab5c 100644
--- a/drivers/net/ethernet/8390/Makefile
+++ b/drivers/net/ethernet/8390/Makefile
@@ -15,4 +15,5 @@ obj-$(CONFIG_PCMCIA_PCNET) += pcnet_cs.o 8390.o
 obj-$(CONFIG_STNIC) += stnic.o 8390.o
 obj-$(CONFIG_ULTRA) += smc-ultra.o 8390.o
 obj-$(CONFIG_WD80x3) += wd.o 8390.o
+obj-$(CONFIG_XSURF100) += xsurf100.o
 obj-$(CONFIG_ZORRO8390) += zorro8390.o 8390.o
diff --git a/drivers/net/ethernet/8390/xsurf100.c b/drivers/net/ethernet/8390/xsurf100.c
new file mode 100644
index 0000000..3c34b04
--- /dev/null
+++ b/drivers/net/ethernet/8390/xsurf100.c
@@ -0,0 +1,71 @@
+#include <linux/module.h>
+#include <linux/netdevice.h>
+#include <linux/platform_device.h>
+#include <linux/zorro.h>
+#include <net/ax88796.h>
+#include <asm/amigaints.h>
+
+#define ZORRO_PROD_INDIVIDUAL_COMPUTERS_X_SURF100 ZORRO_ID(INDIVIDUAL_COMPUTERS, 0x64, 0)
+
+#define XS1000_8390_BASE 0x800
+
+static int xsurf100_probe(struct zorro_dev *zdev, const struct zorro_device_id *ent)
+{
+	struct platform_device *pdev;
+	struct ax_plat_data ax88796_data;
+	struct resource res[2] = {
+		DEFINE_RES_IRQ(IRQ_AMIGA_PORTS),
+		DEFINE_RES_IO(zdev->resource.start + XS1000_8390_BASE, 4 * 0x20)
+	};
+	int reg;
+	u32 reg_offsets[32];
+
+	for (reg = 0; reg < 0x20; reg++)
+		reg_offsets[reg] = 4;
+
+	ax88796_data.flags = AXFLG_HAS_EEPROM;
+	ax88796_data.wordlength = 2;
+	ax88796_data.dcr_val = 0x48;
+	ax88796_data.rcr_val = 0x40;
+	ax88796_data.reg_offsets = reg_offsets;
+
+	// TODO: xsurf100 specific accelerated data exchange
+
+	pdev = platform_device_register_resndata(
+		&zdev->dev, "ax88796", zdev->slotaddr,
+		res, 2,
+		&ax88796_data, sizeof ax88796_data);
+
+	// TODO: NULL check
+	zorro_set_drvdata(zdev, pdev);
+	return 0;
+}
+
+static void xsurf100_remove(struct zorro_dev *zdev)
+{
+	struct platform_device *pdev;
+
+	pdev = zorro_get_drvdata(zdev);
+
+	platform_device_unregister(pdev);
+}
+
+static struct zorro_device_id xsurf100_zorro_tbl[] = {
+       { ZORRO_PROD_INDIVIDUAL_COMPUTERS_X_SURF100, },
+       { 0 }
+};
+
+MODULE_DEVICE_TABLE(zorro, xsurf100_zorro_tbl);
+
+static struct zorro_driver xsurf100_driver = {
+       .name           = "xsurf100",
+       .id_table       = xsurf100_zorro_tbl,
+       .probe          = xsurf100_probe,
+       .remove         = xsurf100_remove,
+};
+
+module_driver(xsurf100_driver, zorro_register_driver, zorro_unregister_driver);
+
+MODULE_DESCRIPTION("X-Surf 100 driver");
+MODULE_AUTHOR("Michael Karcher <kernel@mkarcher.dialup.fu-berlin.de>");
+MODULE_LICENSE("GPL v2");
-- 
1.7.0.4
