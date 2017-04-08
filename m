From: Finn Thain <fthain@telegraphics.com.au>
Subject: [PATCH 03/10] m68k/mac: Adopt platform_device_register_simple()
Date: Sat,  8 Apr 2017 19:51:15 -0400 (EDT)
Message-ID: <d74e6347357b531e4f7bb0467a41daa2f1926645.1491695243.git.fthain@telegraphics.com.au>
References: <cover.1491695243.git.fthain@telegraphics.com.au>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1491695243.git.fthain@telegraphics.com.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org

These changes save 1014 bytes according to scripts/bloat-o-meter.

Signed-off-by: Finn Thain <fthain@telegraphics.com.au>
---
 arch/m68k/mac/config.c | 49 ++++++++++++-------------------------------------
 1 file changed, 12 insertions(+), 37 deletions(-)

diff --git a/arch/m68k/mac/config.c b/arch/m68k/mac/config.c
index 661892d..22123f7 100644
--- a/arch/m68k/mac/config.c
+++ b/arch/m68k/mac/config.c
@@ -919,15 +919,6 @@ static void mac_get_model(char *str)
 	strcat(str, macintosh_config->name);
 }
 
-static struct resource swim_rsrc = { .flags = IORESOURCE_MEM };
-
-static struct platform_device swim_pdev = {
-	.name		= "swim",
-	.id		= -1,
-	.num_resources	= 1,
-	.resource	= &swim_rsrc,
-};
-
 static const struct resource mac_scsi_iifx_rsrc[] __initconst = {
 	{
 		.flags = IORESOURCE_IRQ,
@@ -992,26 +983,6 @@ static const struct resource mac_scsi_ccl_rsrc[] __initconst = {
 	},
 };
 
-static struct platform_device esp_0_pdev = {
-	.name		= "mac_esp",
-	.id		= 0,
-};
-
-static struct platform_device esp_1_pdev = {
-	.name		= "mac_esp",
-	.id		= 1,
-};
-
-static struct platform_device sonic_pdev = {
-	.name		= "macsonic",
-	.id		= -1,
-};
-
-static struct platform_device mace_pdev = {
-	.name		= "macmace",
-	.id		= -1,
-};
-
 int __init mac_platform_init(void)
 {
 	u8 *swim_base;
@@ -1043,9 +1014,13 @@ int __init mac_platform_init(void)
 	}
 
 	if (swim_base) {
-		swim_rsrc.start = (resource_size_t) swim_base,
-		swim_rsrc.end   = (resource_size_t) swim_base + 0x2000,
-		platform_device_register(&swim_pdev);
+		struct resource swim_rsrc = {
+			.flags = IORESOURCE_MEM,
+			.start = (resource_size_t)swim_base,
+			.end   = (resource_size_t)swim_base + 0x2000,
+		};
+
+		platform_device_register_simple("swim", -1, &swim_rsrc, 1);
 	}
 
 	/*
@@ -1055,13 +1030,13 @@ int __init mac_platform_init(void)
 	switch (macintosh_config->scsi_type) {
 	case MAC_SCSI_QUADRA:
 	case MAC_SCSI_QUADRA3:
-		platform_device_register(&esp_0_pdev);
+		platform_device_register_simple("mac_esp", 0, NULL, 0);
 		break;
 	case MAC_SCSI_QUADRA2:
-		platform_device_register(&esp_0_pdev);
+		platform_device_register_simple("mac_esp", 0, NULL, 0);
 		if ((macintosh_config->ident == MAC_MODEL_Q900) ||
 		    (macintosh_config->ident == MAC_MODEL_Q950))
-			platform_device_register(&esp_1_pdev);
+			platform_device_register_simple("mac_esp", 1, NULL, 0);
 		break;
 	case MAC_SCSI_IIFX:
 		/* Addresses from The Guide to Mac Family Hardware.
@@ -1127,10 +1102,10 @@ int __init mac_platform_init(void)
 
 	switch (macintosh_config->ether_type) {
 	case MAC_ETHER_SONIC:
-		platform_device_register(&sonic_pdev);
+		platform_device_register_simple("macsonic", -1, NULL, 0);
 		break;
 	case MAC_ETHER_MACE:
-		platform_device_register(&mace_pdev);
+		platform_device_register_simple("macmace", -1, NULL, 0);
 		break;
 	}
 
-- 
2.10.2
