From: Finn Thain <fthain@telegraphics.com.au>
Subject: [PATCH 5/13] mac68k: move mac_esp platform device
Date: Wed, 4 Nov 2009 00:41:35 +1100 (EST)
Message-ID: <alpine.OSX.2.00.0911031445370.483@silk.local>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from www.telegraphics.com.au ([204.15.192.19]:39908 "EHLO
	mail.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751475AbZKCNlb (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 3 Nov 2009 08:41:31 -0500
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: David Miller <davem@davemloft.net>, linux-m68k@vger.kernel.org

Move platform device code from the driver to the platform init function.

Signed-off-by: Finn Thain <fthain@telegraphics.com.au>

---
 arch/m68k/mac/config.c |   27 +++++++++++++++++++++++
 drivers/scsi/mac_esp.c |   57 ++++---------------------------------------------
 2 files changed, 32 insertions(+), 52 deletions(-)

Index: linux-2.6.31/drivers/scsi/mac_esp.c
===================================================================
--- linux-2.6.31.orig/drivers/scsi/mac_esp.c	2009-11-03 03:23:24.000000000 +1100
+++ linux-2.6.31/drivers/scsi/mac_esp.c	2009-11-03 03:23:42.000000000 +1100
@@ -53,7 +53,6 @@ struct mac_esp_priv {
 	void __iomem *pdma_io;
 	int error;
 };
-static struct platform_device *internal_pdev, *external_pdev;
 static struct esp *esp_chips[2];
 
 #define MAC_ESP_GET_PRIV(esp) ((struct mac_esp_priv *) \
@@ -492,29 +491,12 @@ static int __devinit esp_mac_probe(struc
 	struct Scsi_Host *host;
 	struct esp *esp;
 	int err;
-	int chips_present;
 	struct mac_esp_priv *mep;
 
 	if (!MACH_IS_MAC)
 		return -ENODEV;
 
-	switch (macintosh_config->scsi_type) {
-	case MAC_SCSI_QUADRA:
-	case MAC_SCSI_QUADRA3:
-		chips_present = 1;
-		break;
-	case MAC_SCSI_QUADRA2:
-		if ((macintosh_config->ident == MAC_MODEL_Q900) ||
-		    (macintosh_config->ident == MAC_MODEL_Q950))
-			chips_present = 2;
-		else
-			chips_present = 1;
-		break;
-	default:
-		chips_present = 0;
-	}
-
-	if (dev->id + 1 > chips_present)
+	if (dev->id > 1)
 		return -ENODEV;
 
 	host = scsi_host_alloc(tpnt, sizeof(struct esp));
@@ -639,55 +621,26 @@ static struct platform_driver esp_mac_dr
 	.probe    = esp_mac_probe,
 	.remove   = __devexit_p(esp_mac_remove),
 	.driver   = {
-		.name     = DRV_MODULE_NAME,
+		.name	= DRV_MODULE_NAME,
+		.owner	= THIS_MODULE,
 	},
 };
 
 static int __init mac_esp_init(void)
 {
-	int err;
-
-	err = platform_driver_register(&esp_mac_driver);
-	if (err)
-		return err;
-
-	internal_pdev = platform_device_alloc(DRV_MODULE_NAME, 0);
-	if (internal_pdev && platform_device_add(internal_pdev)) {
-		platform_device_put(internal_pdev);
-		internal_pdev = NULL;
-	}
-	external_pdev = platform_device_alloc(DRV_MODULE_NAME, 1);
-	if (external_pdev && platform_device_add(external_pdev)) {
-		platform_device_put(external_pdev);
-		external_pdev = NULL;
-	}
-
-	if (internal_pdev || external_pdev) {
-		return 0;
-	} else {
-		platform_driver_unregister(&esp_mac_driver);
-		return -ENOMEM;
-	}
+	return platform_driver_register(&esp_mac_driver);
 }
 
 static void __exit mac_esp_exit(void)
 {
 	platform_driver_unregister(&esp_mac_driver);
-
-	if (internal_pdev) {
-		platform_device_unregister(internal_pdev);
-		internal_pdev = NULL;
-	}
-	if (external_pdev) {
-		platform_device_unregister(external_pdev);
-		external_pdev = NULL;
-	}
 }
 
 MODULE_DESCRIPTION("Mac ESP SCSI driver");
 MODULE_AUTHOR("Finn Thain <fthain@telegraphics.com.au>");
 MODULE_LICENSE("GPL v2");
 MODULE_VERSION(DRV_VERSION);
+MODULE_ALIAS("platform:" DRV_MODULE_NAME);
 
 module_init(mac_esp_init);
 module_exit(mac_esp_exit);
Index: linux-2.6.31/arch/m68k/mac/config.c
===================================================================
--- linux-2.6.31.orig/arch/m68k/mac/config.c	2009-11-03 03:23:41.000000000 +1100
+++ linux-2.6.31/arch/m68k/mac/config.c	2009-11-03 03:23:42.000000000 +1100
@@ -911,6 +911,16 @@ static struct platform_device swim_pdev 
 	.resource	= &swim_rsrc,
 };
 
+static struct platform_device esp_0_pdev = {
+	.name		= "mac_esp",
+	.id		= 0,
+};
+
+static struct platform_device esp_1_pdev = {
+	.name		= "mac_esp",
+	.id		= 1,
+};
+
 int __init mac_platform_init(void)
 {
 	u8 *swim_base;
@@ -944,6 +954,23 @@ int __init mac_platform_init(void)
 		platform_device_register(&swim_pdev);
 	}
 
+	/*
+	 * SCSI device(s)
+	 */
+
+	switch (macintosh_config->scsi_type) {
+	case MAC_SCSI_QUADRA:
+	case MAC_SCSI_QUADRA3:
+		platform_device_register(&esp_0_pdev);
+		break;
+	case MAC_SCSI_QUADRA2:
+		platform_device_register(&esp_0_pdev);
+		if ((macintosh_config->ident == MAC_MODEL_Q900) ||
+		    (macintosh_config->ident == MAC_MODEL_Q950))
+			platform_device_register(&esp_1_pdev);
+		break;
+	}
+
 	return 0;
 }
 
