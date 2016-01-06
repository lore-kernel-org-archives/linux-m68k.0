From: Geliang Tang <geliangtang@163.com>
Subject: [PATCH] zorro: use kobj_to_dev()
Date: Wed,  6 Jan 2016 23:28:39 +0800
Message-ID: <c7cde940d70112539785968854715fd55af63ecd.1452094082.git.geliangtang@163.com>
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Geliang Tang <geliangtang@163.com>, linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org

Use kobj_to_dev() instead of open-coding it.

Signed-off-by: Geliang Tang <geliangtang@163.com>
---
 drivers/zorro/zorro-sysfs.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/zorro/zorro-sysfs.c b/drivers/zorro/zorro-sysfs.c
index 36b210f..9282dbf 100644
--- a/drivers/zorro/zorro-sysfs.c
+++ b/drivers/zorro/zorro-sysfs.c
@@ -65,8 +65,7 @@ static ssize_t zorro_read_config(struct file *filp, struct kobject *kobj,
 				 struct bin_attribute *bin_attr,
 				 char *buf, loff_t off, size_t count)
 {
-	struct zorro_dev *z = to_zorro_dev(container_of(kobj, struct device,
-					   kobj));
+	struct zorro_dev *z = to_zorro_dev(kobj_to_dev(kobj));
 	struct ConfigDev cd;
 
 	/* Construct a ConfigDev */
-- 
2.5.0
