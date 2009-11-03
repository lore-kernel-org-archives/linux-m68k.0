From: Finn Thain <fthain@telegraphics.com.au>
Subject: [PATCH 6/13] mac68k: move macsonic and macmace platform devices
Date: Wed, 4 Nov 2009 00:42:02 +1100 (EST)
Message-ID: <alpine.OSX.2.00.0911031447110.483@silk.local>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from www.telegraphics.com.au ([204.15.192.19]:39927 "EHLO
	mail.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751264AbZKCNl5 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 3 Nov 2009 08:41:57 -0500
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: David Miller <davem@davemloft.net>, linux-m68k@vger.kernel.org

Move platform device code from the drivers to the platform init function.

Signed-off-by: Finn Thain <fthain@telegraphics.com.au>

---
 arch/m68k/mac/config.c |   23 +++++++++++++++++++++++
 drivers/net/macmace.c  |   33 ++++-----------------------------
 drivers/net/macsonic.c |   33 ++++-----------------------------
 3 files changed, 31 insertions(+), 58 deletions(-)

Index: linux-2.6.31/drivers/net/macmace.c
===================================================================
--- linux-2.6.31.orig/drivers/net/macmace.c	2009-11-03 03:23:24.000000000 +1100
+++ linux-2.6.31/drivers/net/macmace.c	2009-11-03 03:23:42.000000000 +1100
@@ -39,7 +39,6 @@
 #include "mace.h"
 
 static char mac_mace_string[] = "macmace";
-static struct platform_device *mac_mace_device;
 
 #define N_TX_BUFF_ORDER	0
 #define N_TX_RING	(1 << N_TX_BUFF_ORDER)
@@ -752,6 +751,7 @@ static irqreturn_t mace_dma_intr(int irq
 
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("Macintosh MACE ethernet driver");
+MODULE_ALIAS("platform:macmace");
 
 static int __devexit mac_mace_device_remove (struct platform_device *pdev)
 {
@@ -777,47 +777,22 @@ static struct platform_driver mac_mace_d
 	.probe  = mace_probe,
 	.remove = __devexit_p(mac_mace_device_remove),
 	.driver	= {
-		.name = mac_mace_string,
+		.name	= mac_mace_string,
+		.owner	= THIS_MODULE,
 	},
 };
 
 static int __init mac_mace_init_module(void)
 {
-	int err;
-
 	if (!MACH_IS_MAC)
 		return -ENODEV;
 
-	if ((err = platform_driver_register(&mac_mace_driver))) {
-		printk(KERN_ERR "Driver registration failed\n");
-		return err;
-	}
-
-	mac_mace_device = platform_device_alloc(mac_mace_string, 0);
-	if (!mac_mace_device)
-		goto out_unregister;
-
-	if (platform_device_add(mac_mace_device)) {
-		platform_device_put(mac_mace_device);
-		mac_mace_device = NULL;
-	}
-
-	return 0;
-
-out_unregister:
-	platform_driver_unregister(&mac_mace_driver);
-
-	return -ENOMEM;
+	return platform_driver_register(&mac_mace_driver);
 }
 
 static void __exit mac_mace_cleanup_module(void)
 {
 	platform_driver_unregister(&mac_mace_driver);
-
-	if (mac_mace_device) {
-		platform_device_unregister(mac_mace_device);
-		mac_mace_device = NULL;
-	}
 }
 
 module_init(mac_mace_init_module);
Index: linux-2.6.31/drivers/net/macsonic.c
===================================================================
--- linux-2.6.31.orig/drivers/net/macsonic.c	2009-11-03 03:23:24.000000000 +1100
+++ linux-2.6.31/drivers/net/macsonic.c	2009-11-03 03:23:42.000000000 +1100
@@ -62,7 +62,6 @@
 #include <asm/mac_via.h>
 
 static char mac_sonic_string[] = "macsonic";
-static struct platform_device *mac_sonic_device;
 
 #include "sonic.h"
 
@@ -604,6 +603,7 @@ out:
 MODULE_DESCRIPTION("Macintosh SONIC ethernet driver");
 module_param(sonic_debug, int, 0);
 MODULE_PARM_DESC(sonic_debug, "macsonic debug level (1-4)");
+MODULE_ALIAS("platform:macsonic");
 
 #include "sonic.c"
 
@@ -624,44 +624,19 @@ static struct platform_driver mac_sonic_
 	.probe  = mac_sonic_probe,
 	.remove = __devexit_p(mac_sonic_device_remove),
 	.driver	= {
-		.name = mac_sonic_string,
+		.name	= mac_sonic_string,
+		.owner	= THIS_MODULE,
 	},
 };
 
 static int __init mac_sonic_init_module(void)
 {
-	int err;
-
-	if ((err = platform_driver_register(&mac_sonic_driver))) {
-		printk(KERN_ERR "Driver registration failed\n");
-		return err;
-	}
-
-	mac_sonic_device = platform_device_alloc(mac_sonic_string, 0);
-	if (!mac_sonic_device)
-		goto out_unregister;
-
-	if (platform_device_add(mac_sonic_device)) {
-		platform_device_put(mac_sonic_device);
-		mac_sonic_device = NULL;
-	}
-
-	return 0;
-
-out_unregister:
-	platform_driver_unregister(&mac_sonic_driver);
-
-	return -ENOMEM;
+	return platform_driver_register(&mac_sonic_driver);
 }
 
 static void __exit mac_sonic_cleanup_module(void)
 {
 	platform_driver_unregister(&mac_sonic_driver);
-
-	if (mac_sonic_device) {
-		platform_device_unregister(mac_sonic_device);
-		mac_sonic_device = NULL;
-	}
 }
 
 module_init(mac_sonic_init_module);
Index: linux-2.6.31/arch/m68k/mac/config.c
===================================================================
--- linux-2.6.31.orig/arch/m68k/mac/config.c	2009-11-03 03:23:42.000000000 +1100
+++ linux-2.6.31/arch/m68k/mac/config.c	2009-11-03 03:23:42.000000000 +1100
@@ -921,6 +921,16 @@ static struct platform_device esp_1_pdev
 	.id		= 1,
 };
 
+static struct platform_device sonic_pdev = {
+	.name		= "macsonic",
+	.id		= -1,
+};
+
+static struct platform_device mace_pdev = {
+	.name		= "macmace",
+	.id		= -1,
+};
+
 int __init mac_platform_init(void)
 {
 	u8 *swim_base;
@@ -971,6 +981,19 @@ int __init mac_platform_init(void)
 		break;
 	}
 
+	/*
+	 * Ethernet device
+	 */
+
+	switch (macintosh_config->ether_type) {
+	case MAC_ETHER_SONIC:
+		platform_device_register(&sonic_pdev);
+		break;
+	case MAC_ETHER_MACE:
+		platform_device_register(&mace_pdev);
+		break;
+	}
+
 	return 0;
 }
 
