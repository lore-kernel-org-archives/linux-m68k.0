From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 5/8] zorro: Let the driver core handle device enumeration
Date: Wed, 16 Oct 2013 13:03:22 +0200
Message-ID: <1381921405-11206-6-git-send-email-geert__35294.1398429268$1381921562$gmane$org@linux-m68k.org>
References: <1381921405-11206-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1381921405-11206-1-git-send-email-geert@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@lists.linux-m68k.org
Cc: linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>

Filling in dev_name of the Zorro bus type and dev.id of each device allows
the driver core to enumerate devices, so we don't have to do that
ourselves.

This changes the names of devices in sysfs from "%02x" to "zorro%u".

Note that filling in dev.id is also needed to support MFD Zorro devices.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 drivers/zorro/zorro-driver.c |   11 ++++++-----
 drivers/zorro/zorro.c        |    4 ++--
 2 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/zorro/zorro-driver.c b/drivers/zorro/zorro-driver.c
index ac1db7f1bcab..eacae1434b73 100644
--- a/drivers/zorro/zorro-driver.c
+++ b/drivers/zorro/zorro-driver.c
@@ -161,11 +161,12 @@ static int zorro_uevent(struct device *dev, struct kobj_uevent_env *env)
 }
 
 struct bus_type zorro_bus_type = {
-	.name	= "zorro",
-	.match	= zorro_bus_match,
-	.uevent	= zorro_uevent,
-	.probe	= zorro_device_probe,
-	.remove	= zorro_device_remove,
+	.name     = "zorro",
+	.dev_name = "zorro",
+	.match    = zorro_bus_match,
+	.uevent   = zorro_uevent,
+	.probe    = zorro_device_probe,
+	.remove   = zorro_device_remove,
 };
 EXPORT_SYMBOL(zorro_bus_type);
 
diff --git a/drivers/zorro/zorro.c b/drivers/zorro/zorro.c
index 10c7f77aec08..450abf100f06 100644
--- a/drivers/zorro/zorro.c
+++ b/drivers/zorro/zorro.c
@@ -142,7 +142,7 @@ static int __init amiga_zorro_probe(struct platform_device *pdev)
 
 	zorro_autocon = bus->devices;
 	bus->dev.parent = &pdev->dev;
-	dev_set_name(&bus->dev, "zorro");
+	dev_set_name(&bus->dev, zorro_bus_type.name);
 	error = device_register(&bus->dev);
 	if (error) {
 		pr_err("Zorro: Error registering zorro_bus\n");
@@ -180,9 +180,9 @@ static int __init amiga_zorro_probe(struct platform_device *pdev)
 			dev_err(&bus->dev,
 				"Address space collision on device %s %pR\n",
 				z->name, &z->resource);
-		dev_set_name(&z->dev, "%02x", i);
 		z->dev.parent = &bus->dev;
 		z->dev.bus = &zorro_bus_type;
+		z->dev.id = i;
 	}
 
 	/* ... then register them */
-- 
1.7.9.5
