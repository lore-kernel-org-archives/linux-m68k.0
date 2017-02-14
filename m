From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [PATCH] zorro: stop creating attributes by hand
Date: Tue, 14 Feb 2017 12:24:09 -0800
Message-ID: <20170214202409.GA25228@dtor-ws>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org

Instead of creating attributes one by one, define attribute_group array
and attach it to bus->dev_groups, so that all needed attributes are created
automatically when a new device is registered on the bus.

Also switch to using standard DEVICE_ATTR_RO() macros.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---

Not tested.

 drivers/zorro/zorro-driver.c | 15 +++++----
 drivers/zorro/zorro-sysfs.c  | 76 +++++++++++++++++++++++---------------------
 drivers/zorro/zorro.c        |  3 --
 drivers/zorro/zorro.h        |  3 +-
 4 files changed, 50 insertions(+), 47 deletions(-)

diff --git a/drivers/zorro/zorro-driver.c b/drivers/zorro/zorro-driver.c
index eacae1434b73..fa23b7366b98 100644
--- a/drivers/zorro/zorro-driver.c
+++ b/drivers/zorro/zorro-driver.c
@@ -14,6 +14,8 @@
 #include <linux/module.h>
 #include <linux/zorro.h>
 
+#include "zorro.h"
+
 
     /**
      *  zorro_match_device - Tell if a Zorro device structure has a matching
@@ -161,12 +163,13 @@ static int zorro_uevent(struct device *dev, struct kobj_uevent_env *env)
 }
 
 struct bus_type zorro_bus_type = {
-	.name     = "zorro",
-	.dev_name = "zorro",
-	.match    = zorro_bus_match,
-	.uevent   = zorro_uevent,
-	.probe    = zorro_device_probe,
-	.remove   = zorro_device_remove,
+	.name		= "zorro",
+	.dev_name	= "zorro",
+	.dev_groups	= zorro_device_attribute_groups,
+	.match		= zorro_bus_match,
+	.uevent		= zorro_uevent,
+	.probe		= zorro_device_probe,
+	.remove		= zorro_device_remove,
 };
 EXPORT_SYMBOL(zorro_bus_type);
 
diff --git a/drivers/zorro/zorro-sysfs.c b/drivers/zorro/zorro-sysfs.c
index 9282dbf5abdb..3d34dba9bb2d 100644
--- a/drivers/zorro/zorro-sysfs.c
+++ b/drivers/zorro/zorro-sysfs.c
@@ -23,33 +23,33 @@
 
 /* show configuration fields */
 #define zorro_config_attr(name, field, format_string)			\
-static ssize_t								\
-show_##name(struct device *dev, struct device_attribute *attr, char *buf)				\
+static ssize_t name##_show(struct device *dev,				\
+			   struct device_attribute *attr, char *buf)	\
 {									\
 	struct zorro_dev *z;						\
 									\
 	z = to_zorro_dev(dev);						\
 	return sprintf(buf, format_string, z->field);			\
 }									\
-static DEVICE_ATTR(name, S_IRUGO, show_##name, NULL);
+static DEVICE_ATTR_RO(name);
 
 zorro_config_attr(id, id, "0x%08x\n");
 zorro_config_attr(type, rom.er_Type, "0x%02x\n");
 zorro_config_attr(slotaddr, slotaddr, "0x%04x\n");
 zorro_config_attr(slotsize, slotsize, "0x%04x\n");
 
-static ssize_t
-show_serial(struct device *dev, struct device_attribute *attr, char *buf)
+static ssize_t serial_show(struct device *dev, struct device_attribute *attr,
+			   char *buf)
 {
 	struct zorro_dev *z;
 
 	z = to_zorro_dev(dev);
 	return sprintf(buf, "0x%08x\n", be32_to_cpu(z->rom.er_SerialNumber));
 }
+static DEVICE_ATTR_RO(serial);
 
-static DEVICE_ATTR(serial, S_IRUGO, show_serial, NULL);
-
-static ssize_t zorro_show_resource(struct device *dev, struct device_attribute *attr, char *buf)
+static ssize_t resource_show(struct device *dev, struct device_attribute *attr,
+			     char *buf)
 {
 	struct zorro_dev *z = to_zorro_dev(dev);
 
@@ -58,8 +58,27 @@ static ssize_t zorro_show_resource(struct device *dev, struct device_attribute *
 		       (unsigned long)zorro_resource_end(z),
 		       zorro_resource_flags(z));
 }
+static DEVICE_ATTR_RO(resource);
+
+static ssize_t modalias_show(struct device *dev, struct device_attribute *attr,
+			     char *buf)
+{
+	struct zorro_dev *z = to_zorro_dev(dev);
 
-static DEVICE_ATTR(resource, S_IRUGO, zorro_show_resource, NULL);
+	return sprintf(buf, ZORRO_DEVICE_MODALIAS_FMT "\n", z->id);
+}
+static DEVICE_ATTR_RO(modalias);
+
+static struct attribute *zorro_device_attrs[] = {
+	&dev_attr_id.attr,
+	&dev_attr_type.attr,
+	&dev_attr_serial.attr,
+	&dev_attr_slotaddr.attr,
+	&dev_attr_slotsize.attr,
+	&dev_attr_resource.attr,
+	&dev_attr_modalias.attr,
+	NULL
+};
 
 static ssize_t zorro_read_config(struct file *filp, struct kobject *kobj,
 				 struct bin_attribute *bin_attr,
@@ -88,32 +107,17 @@ static struct bin_attribute zorro_config_attr = {
 	.read = zorro_read_config,
 };
 
-static ssize_t modalias_show(struct device *dev, struct device_attribute *attr,
-			     char *buf)
-{
-	struct zorro_dev *z = to_zorro_dev(dev);
-
-	return sprintf(buf, ZORRO_DEVICE_MODALIAS_FMT "\n", z->id);
-}
-
-static DEVICE_ATTR(modalias, S_IRUGO, modalias_show, NULL);
+static struct bin_attribute *zorro_device_bin_attrs[] = {
+	&zorro_config_attr,
+	NULL
+};
 
-int zorro_create_sysfs_dev_files(struct zorro_dev *z)
-{
-	struct device *dev = &z->dev;
-	int error;
-
-	/* current configuration's attributes */
-	if ((error = device_create_file(dev, &dev_attr_id)) ||
-	    (error = device_create_file(dev, &dev_attr_type)) ||
-	    (error = device_create_file(dev, &dev_attr_serial)) ||
-	    (error = device_create_file(dev, &dev_attr_slotaddr)) ||
-	    (error = device_create_file(dev, &dev_attr_slotsize)) ||
-	    (error = device_create_file(dev, &dev_attr_resource)) ||
-	    (error = device_create_file(dev, &dev_attr_modalias)) ||
-	    (error = sysfs_create_bin_file(&dev->kobj, &zorro_config_attr)))
-		return error;
-
-	return 0;
-}
+static const struct attribute_group zorro_device_attr_group = {
+	.attrs		= zorro_device_attrs,
+	.bin_attrs	= zorro_device_bin_attrs,
+};
 
+const struct attribute_group *zorro_device_attribute_groups[] = {
+	&zorro_device_attr_group,
+	NULL
+};
diff --git a/drivers/zorro/zorro.c b/drivers/zorro/zorro.c
index d295d9878dff..cc1b1ac57d61 100644
--- a/drivers/zorro/zorro.c
+++ b/drivers/zorro/zorro.c
@@ -197,9 +197,6 @@ static int __init amiga_zorro_probe(struct platform_device *pdev)
 			put_device(&z->dev);
 			continue;
 		}
-		error = zorro_create_sysfs_dev_files(z);
-		if (error)
-			dev_err(&z->dev, "Error creating sysfs files\n");
 	}
 
 	/* Mark all available Zorro II memory */
diff --git a/drivers/zorro/zorro.h b/drivers/zorro/zorro.h
index 34119fb4e560..4f805c01cfbc 100644
--- a/drivers/zorro/zorro.h
+++ b/drivers/zorro/zorro.h
@@ -5,5 +5,4 @@ extern void zorro_name_device(struct zorro_dev *z);
 static inline void zorro_name_device(struct zorro_dev *dev) { }
 #endif
 
-extern int zorro_create_sysfs_dev_files(struct zorro_dev *z);
-
+extern const struct attribute_group *zorro_device_attribute_groups[];
-- 
2.11.0.483.g087da7b7c-goog


-- 
Dmitry
