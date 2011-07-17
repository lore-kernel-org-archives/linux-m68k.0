From: Jim Rotmalm <jim.rotmalm@gmail.com>
Subject: [PATCH] drivers: zorro: fix four checkpatch warnings
Date: Sun, 17 Jul 2011 23:12:30 +0200
Message-ID: <1310937150-27890-1-git-send-email-jim.rotmalm__33132.4853738353$1310937652$gmane$org@gmail.com>
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: geert@linux-m68k.org
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, Jim Rotmalm <jim.rotmalm@gmail.com>

zorro-driver.c: fix four checkpatch warnings of:
WARNING: EXPORT_SYMBOL(foo); should immediately follow its function/variable

I had a cat. The cat was mine.
His name was Zorro. Amiga is fine.

Signed-off-by: Jim Rotmalm <jim.rotmalm@gmail.com>
---
 drivers/zorro/zorro-driver.c |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/zorro/zorro-driver.c b/drivers/zorro/zorro-driver.c
index 7ee2b6e..229624f 100644
--- a/drivers/zorro/zorro-driver.c
+++ b/drivers/zorro/zorro-driver.c
@@ -37,6 +37,7 @@ zorro_match_device(const struct zorro_device_id *ids,
 	}
 	return NULL;
 }
+EXPORT_SYMBOL(zorro_match_device);
 
 
 static int zorro_device_probe(struct device *dev)
@@ -91,6 +92,7 @@ int zorro_register_driver(struct zorro_driver *drv)
 	/* register with core */
 	return driver_register(&drv->driver);
 }
+EXPORT_SYMBOL(zorro_register_driver);
 
 
     /**
@@ -107,6 +109,7 @@ void zorro_unregister_driver(struct zorro_driver *drv)
 {
 	driver_unregister(&drv->driver);
 }
+EXPORT_SYMBOL(zorro_unregister_driver);
 
 
     /**
@@ -168,6 +171,7 @@ struct bus_type zorro_bus_type = {
 	.probe	= zorro_device_probe,
 	.remove	= zorro_device_remove,
 };
+EXPORT_SYMBOL(zorro_bus_type);
 
 
 static int __init zorro_driver_init(void)
@@ -177,7 +181,3 @@ static int __init zorro_driver_init(void)
 
 postcore_initcall(zorro_driver_init);
 
-EXPORT_SYMBOL(zorro_match_device);
-EXPORT_SYMBOL(zorro_register_driver);
-EXPORT_SYMBOL(zorro_unregister_driver);
-EXPORT_SYMBOL(zorro_bus_type);
-- 
1.7.0.4
