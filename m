From: Michael Schmitz <schmitzmic@gmail.com>
Subject: [PATCH v4 1/9] net-next: phy: new Asix Electronics PHY driver
Date: Thu, 19 Apr 2018 14:05:18 +1200
Message-ID: <1524103526-12240-2-git-send-email-schmitzmic@gmail.com>
References: <1524025616-3722-1-git-send-email-schmitzmic@gmail.com>
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <1524025616-3722-1-git-send-email-schmitzmic@gmail.com>
Sender: netdev-owner@vger.kernel.org
To: netdev@vger.kernel.org
Cc: andrew@lunn.ch, fthain@telegraphics.com.au, geert@linux-m68k.org, f.fainelli@gmail.com, linux-m68k@vger.kernel.org, Michael.Karcher@fu-berlin.de, Michael Schmitz <schmitzmic@gmail.com>
List-Id: linux-m68k@vger.kernel.org

The Asix Electronics PHY found on the X-Surf 100 Amiga Zorro network
card by Individual Computers is buggy, and needs the reset bit toggled
as workaround to make a PHY soft reset succeed.

Add workaround driver just for this special case.

Suggested in xsurf100 patch series review by Andrew Lunn <andrew@lunn.ch>

Signed-off-by: Michael Schmitz <schmitzmic@gmail.com>

---

Changes in v4:

Andrew Lunn:
- don't duplicate genphy_soft_reset, just call after writing zero
  to control register
---
 drivers/net/phy/Kconfig  |    6 ++++
 drivers/net/phy/Makefile |    1 +
 drivers/net/phy/asix.c   |   63 ++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 70 insertions(+), 0 deletions(-)
 create mode 100644 drivers/net/phy/asix.c

diff --git a/drivers/net/phy/Kconfig b/drivers/net/phy/Kconfig
index bdfbabb..edb8b9a 100644
--- a/drivers/net/phy/Kconfig
+++ b/drivers/net/phy/Kconfig
@@ -218,6 +218,12 @@ config AQUANTIA_PHY
 	---help---
 	  Currently supports the Aquantia AQ1202, AQ2104, AQR105, AQR405
 
+config ASIX_PHY
+	tristate "Asix PHYs"
+	help
+	  Currently supports the Asix Electronics PHY found in the X-Surf 100
+	  AX88796B package.
+
 config AT803X_PHY
 	tristate "AT803X PHYs"
 	---help---
diff --git a/drivers/net/phy/Makefile b/drivers/net/phy/Makefile
index 01acbcb..701ca0b 100644
--- a/drivers/net/phy/Makefile
+++ b/drivers/net/phy/Makefile
@@ -45,6 +45,7 @@ obj-y				+= $(sfp-obj-y) $(sfp-obj-m)
 
 obj-$(CONFIG_AMD_PHY)		+= amd.o
 obj-$(CONFIG_AQUANTIA_PHY)	+= aquantia.o
+obj-$(CONFIG_ASIX_PHY)		+= asix.o
 obj-$(CONFIG_AT803X_PHY)	+= at803x.o
 obj-$(CONFIG_BCM63XX_PHY)	+= bcm63xx.o
 obj-$(CONFIG_BCM7XXX_PHY)	+= bcm7xxx.o
diff --git a/drivers/net/phy/asix.c b/drivers/net/phy/asix.c
new file mode 100644
index 0000000..8ebe7f5
--- /dev/null
+++ b/drivers/net/phy/asix.c
@@ -0,0 +1,63 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Driver for Asix PHYs
+ *
+ * Author: Michael Schmitz <schmitzmic@gmail.com>
+ *
+ * This program is free software; you can redistribute  it and/or modify it
+ * under  the terms of  the GNU General  Public License as published by the
+ * Free Software Foundation;  either version 2 of the  License, or (at your
+ * option) any later version.
+ *
+ */
+#include <linux/kernel.h>
+#include <linux/errno.h>
+#include <linux/init.h>
+#include <linux/module.h>
+#include <linux/mii.h>
+#include <linux/phy.h>
+
+#define PHY_ID_ASIX_AX88796B		0x003b1841
+
+MODULE_DESCRIPTION("Asix PHY driver");
+MODULE_AUTHOR("Michael Schmitz <schmitzmic@gmail.com>");
+MODULE_LICENSE("GPL");
+
+/**
+ * asix_soft_reset - software reset the PHY via BMCR_RESET bit
+ * @phydev: target phy_device struct
+ *
+ * Description: Perform a software PHY reset using the standard
+ * BMCR_RESET bit and poll for the reset bit to be cleared.
+ * Toggle BMCR_RESET bit off to accommodate broken AX8796B PHY implementation
+ * such as used on the Individual Computers' X-Surf 100 Zorro card.
+ *
+ * Returns: 0 on success, < 0 on failure
+ */
+static int asix_soft_reset(struct phy_device *phydev)
+{
+	int ret;
+
+	/* Asix PHY won't reset unless reset bit toggles */
+	ret = phy_write(phydev, MII_BMCR, 0);
+	if (ret < 0)
+		return ret;
+
+	return genphy_soft_reset(phydev);
+}
+
+static struct phy_driver asix_driver[] = { {
+	.phy_id		= PHY_ID_ASIX_AX88796B,
+	.name		= "Asix Electronics AX88796B",
+	.phy_id_mask	= 0xfffffff0,
+	.features	= PHY_BASIC_FEATURES,
+	.soft_reset	= asix_soft_reset,
+} };
+
+module_phy_driver(asix_driver);
+
+static struct mdio_device_id __maybe_unused asix_tbl[] = {
+	{ PHY_ID_ASIX_AX88796B, 0xfffffff0 },
+	{ }
+};
+
+MODULE_DEVICE_TABLE(mdio, asix_tbl);
-- 
1.7.0.4
