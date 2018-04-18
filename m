From: Michael Schmitz <schmitzmic@gmail.com>
Subject: [PATCH v3 1/9] net: phy: new Asix Electronics PHY driver
Date: Wed, 18 Apr 2018 16:26:48 +1200
Message-ID: <1524025616-3722-2-git-send-email-schmitzmic@gmail.com>
References: <1523930895-6973-1-git-send-email-schmitzmic@gmail.com>
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <1523930895-6973-1-git-send-email-schmitzmic@gmail.com>
Sender: netdev-owner@vger.kernel.org
To: netdev@vger.kernel.org
Cc: andrew@lunn.ch, fthain@telegraphics.com.au, geert@linux-m68k.org, f.fainelli@gmail.com, linux-m68k@vger.kernel.org, Michael.Karcher@fu-berlin.de, Michael Schmitz <schmitzmic@gmail.com>
List-Id: linux-m68k@vger.kernel.org

The Asix Electronics PHY found on the X-Surf 100 Amiga Zorro network
card by Individual Computers is buggy, and needs the reset bit toggled
as workaround to make a PHY soft reset succed.

Add workaround driver just for this special case. Export phy_poll_reset()
from core phy_device driver to avoid code duplication.

Signed-off-by: Michael Schmitz <schmitzmic@gmail.com>
---
 drivers/net/phy/Kconfig      |    6 ++++
 drivers/net/phy/Makefile     |    1 +
 drivers/net/phy/asix.c       |   65 ++++++++++++++++++++++++++++++++++++++++++
 drivers/net/phy/phy_device.c |    3 +-
 include/linux/phy.h          |    1 +
 5 files changed, 75 insertions(+), 1 deletions(-)
 create mode 100644 drivers/net/phy/asix.c

diff --git a/drivers/net/phy/Kconfig b/drivers/net/phy/Kconfig
index bdfbabb..f5b484c 100644
--- a/drivers/net/phy/Kconfig
+++ b/drivers/net/phy/Kconfig
@@ -218,6 +218,12 @@ config AQUANTIA_PHY
 	---help---
 	  Currently supports the Aquantia AQ1202, AQ2104, AQR105, AQR405
 
+config ASIX_PHY
+	tristate "Asix PHYs"
+	---help---
+	  Currently supports the Asix Electronics PHY found in the X-Surf 100
+	  AX88796 package.
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
index 0000000..15e8a0e
--- /dev/null
+++ b/drivers/net/phy/asix.c
@@ -0,0 +1,65 @@
+/*
+ * Driver for Asix PHYs
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
+#define PHY_ID_ASIX		0x003b1841
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
+ * Toggle BMCR_RESET bit off to accomodate broken PHY implementations
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
+	phy_write(phydev, MII_BMCR, BMCR_RESET);
+
+	return phy_poll_reset(phydev);
+}
+
+static struct phy_driver asix_driver[] = { {
+	.phy_id		= PHY_ID_ASIX,
+	.name		= "Asix Electronics",
+	.phy_id_mask	= 0xfffffff0,
+	.features	= PHY_BASIC_FEATURES,
+	.soft_reset	= asix_soft_reset,
+} };
+
+module_phy_driver(asix_driver);
+
+static struct mdio_device_id __maybe_unused asix_tbl[] = {
+	{ PHY_ID_ASIX, 0xfffffff0 },
+	{ }
+};
+
+MODULE_DEVICE_TABLE(mdio, asix_tbl);
diff --git a/drivers/net/phy/phy_device.c b/drivers/net/phy/phy_device.c
index 777912b..fb8c13b 100644
--- a/drivers/net/phy/phy_device.c
+++ b/drivers/net/phy/phy_device.c
@@ -833,7 +833,7 @@ void phy_disconnect(struct phy_device *phydev)
  *   standard phy_init_hw() which will zero all the other bits in the BMCR
  *   and reapply all driver-specific and board-specific fixups.
  */
-static int phy_poll_reset(struct phy_device *phydev)
+int phy_poll_reset(struct phy_device *phydev)
 {
 	/* Poll until the reset bit clears (50ms per retry == 0.6 sec) */
 	unsigned int retries = 12;
@@ -854,6 +854,7 @@ static int phy_poll_reset(struct phy_device *phydev)
 	msleep(1);
 	return 0;
 }
+EXPORT_SYMBOL(phy_poll_reset);
 
 int phy_init_hw(struct phy_device *phydev)
 {
diff --git a/include/linux/phy.h b/include/linux/phy.h
index 7c4c237..fa0c4fd 100644
--- a/include/linux/phy.h
+++ b/include/linux/phy.h
@@ -980,6 +980,7 @@ void phy_attached_print(struct phy_device *phydev, const char *fmt, ...)
 int genphy_resume(struct phy_device *phydev);
 int genphy_loopback(struct phy_device *phydev, bool enable);
 int genphy_soft_reset(struct phy_device *phydev);
+int phy_poll_reset(struct phy_device *phydev);
 static inline int genphy_no_soft_reset(struct phy_device *phydev)
 {
 	return 0;
-- 
1.7.0.4
