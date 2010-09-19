From: Vasiliy Kulikov <segooon@gmail.com>
Subject: [PATCH 14/14] zorro: fix device_register() error handling
Date: Sun, 19 Sep 2010 16:55:21 +0400
Message-ID: <1284900921-24814-1-git-send-email-segooon__33333.3463561305$1284901305$gmane$org@gmail.com>
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: kernel-janitors@vger.kernel.org
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Roman Zippel <zippel@linux-m68k.org>, linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org

If device_register() fails then call put_device().
See comment to device_register.

Signed-off-by: Vasiliy Kulikov <segooon@gmail.com>
---
 I cannot compile this driver, so it is not tested at all.

 drivers/zorro/zorro.c |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/drivers/zorro/zorro.c b/drivers/zorro/zorro.c
index 6455f3a..e0c2807 100644
--- a/drivers/zorro/zorro.c
+++ b/drivers/zorro/zorro.c
@@ -142,6 +142,7 @@ static int __init amiga_zorro_probe(struct platform_device *pdev)
 	error = device_register(&bus->dev);
 	if (error) {
 		pr_err("Zorro: Error registering zorro_bus\n");
+		put_device(&bus->dev);
 		kfree(bus);
 		return error;
 	}
@@ -175,6 +176,7 @@ static int __init amiga_zorro_probe(struct platform_device *pdev)
 		if (error) {
 			dev_err(&bus->dev, "Error registering device %s\n",
 				z->name);
+			put_device(&z->dev);
 			continue;
 		}
 		error = zorro_create_sysfs_dev_files(z);
-- 
1.7.0.4
