From: Finn Thain <fthain@telegraphics.com.au>
Subject: [PATCH 14/14] nubus: Add support for the driver model
Date: Sat, 11 Nov 2017 01:12:49 -0500 (EST)
Message-ID: <6c64ec1ff338853f8ba34783e70896565f968854.1510377369.git.fthain@telegraphics.com.au>
References: <cover.1510377368.git.fthain@telegraphics.com.au>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1510377368.git.fthain@telegraphics.com.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org, linux-kernel@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
List-Id: linux-m68k@vger.kernel.org

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Tested-by: Stan Johnson <userm57@yahoo.com>
Signed-off-by: Finn Thain <fthain@telegraphics.com.au>
---
 drivers/nubus/Makefile |  2 +-
 drivers/nubus/bus.c    | 87 ++++++++++++++++++++++++++++++++++++++++++++++++++
 drivers/nubus/nubus.c  |  3 ++
 include/linux/nubus.h  | 39 ++++++++++++++++++++++
 4 files changed, 130 insertions(+), 1 deletion(-)
 create mode 100644 drivers/nubus/bus.c

diff --git a/drivers/nubus/Makefile b/drivers/nubus/Makefile
index 21bda2031e7e..6d063cde39d1 100644
--- a/drivers/nubus/Makefile
+++ b/drivers/nubus/Makefile
@@ -2,6 +2,6 @@
 # Makefile for the nubus specific drivers.
 #
 
-obj-y   := nubus.o
+obj-y := nubus.o bus.o
 
 obj-$(CONFIG_PROC_FS) += proc.o
diff --git a/drivers/nubus/bus.c b/drivers/nubus/bus.c
new file mode 100644
index 000000000000..fa44b42ad71f
--- /dev/null
+++ b/drivers/nubus/bus.c
@@ -0,0 +1,87 @@
+/*
+ * Bus implementation for the NuBus subsystem.
+ *
+ * Copyright (C) 2017 Finn Thain
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License, version 2,
+ * as published by the Free Software Foundation.
+ */
+
+#include <linux/nubus.h>
+
+#define to_nubus_board(d)       container_of(d, struct nubus_board, dev)
+#define to_nubus_driver(d)      container_of(d, struct nubus_driver, driver)
+
+static int nubus_bus_match(struct device *dev, struct device_driver *driver)
+{
+	return 1;
+}
+
+static int nubus_device_probe(struct device *dev)
+{
+	struct nubus_driver *ndrv = to_nubus_driver(dev->driver);
+	int err = -ENODEV;
+
+	if (ndrv->probe)
+		err = ndrv->probe(to_nubus_board(dev));
+	return err;
+}
+
+static int nubus_device_remove(struct device *dev)
+{
+	struct nubus_driver *ndrv = to_nubus_driver(dev->driver);
+	int err = -ENODEV;
+
+	if (ndrv->remove)
+		err = ndrv->remove(to_nubus_board(dev));
+	return err;
+}
+
+struct bus_type nubus_bus_type = {
+	.name		= "nubus",
+	.match		= nubus_bus_match,
+	.probe		= nubus_device_probe,
+	.remove		= nubus_device_remove,
+};
+EXPORT_SYMBOL(nubus_bus_type);
+
+int nubus_driver_register(struct nubus_driver *ndrv)
+{
+	ndrv->driver.bus = &nubus_bus_type;
+	return driver_register(&ndrv->driver);
+}
+EXPORT_SYMBOL(nubus_driver_register);
+
+void nubus_driver_unregister(struct nubus_driver *ndrv)
+{
+	driver_unregister(&ndrv->driver);
+}
+EXPORT_SYMBOL(nubus_driver_unregister);
+
+static struct device nubus_parent = {
+	.init_name	= "nubus",
+};
+
+int __init nubus_bus_register(void)
+{
+	int err;
+
+	err = bus_register(&nubus_bus_type);
+	if (err)
+		return err;
+
+	err = device_register(&nubus_parent);
+	if (err)
+		bus_unregister(&nubus_bus_type);
+
+	return err;
+}
+
+int nubus_device_add(struct nubus_board *board)
+{
+	board->dev.parent = &nubus_parent;
+	board->dev.bus = &nubus_bus_type;
+	dev_set_name(&board->dev, "slot.%X", board->slot);
+	return device_register(&board->dev);
+}
diff --git a/drivers/nubus/nubus.c b/drivers/nubus/nubus.c
index cc9dba4b4f01..ac08c23a3bfe 100644
--- a/drivers/nubus/nubus.c
+++ b/drivers/nubus/nubus.c
@@ -855,6 +855,8 @@ static struct nubus_board * __init nubus_add_board(int slot, int bytelanes)
 	*boardp = board;
 	board->next = NULL;
 
+	nubus_device_add(board);
+
 	return board;
 }
 
@@ -908,6 +910,7 @@ static int __init nubus_init(void)
 		return 0;
 
 	nubus_proc_init();
+	nubus_bus_register();
 	nubus_scan_bus();
 	return 0;
 }
diff --git a/include/linux/nubus.h b/include/linux/nubus.h
index ede0727c1cf8..c78e49a3008b 100644
--- a/include/linux/nubus.h
+++ b/include/linux/nubus.h
@@ -9,6 +9,7 @@
 #ifndef LINUX_NUBUS_H
 #define LINUX_NUBUS_H
 
+#include <linux/device.h>
 #include <asm/nubus.h>
 #include <uapi/linux/nubus.h>
 
@@ -34,6 +35,8 @@ struct nubus_board {
 	struct nubus_board *next;
 	struct nubus_functional_resource *first_func_rsrc;
 
+	struct device dev;
+
 	/* Only 9-E actually exist, though 0-8 are also theoretically
 	   possible, and 0 is a special case which represents the
 	   motherboard and onboard peripherals (Ethernet, video) */
@@ -80,6 +83,14 @@ struct nubus_functional_resource {
 	struct nubus_board *board;
 };
 
+struct nubus_driver {
+	struct device_driver driver;
+	int (*probe)(struct nubus_board *board);
+	int (*remove)(struct nubus_board *board);
+};
+
+extern struct bus_type nubus_bus_type;
+
 /* This is all NuBus functional resources (used to find devices later on) */
 extern struct nubus_functional_resource *nubus_func_rsrcs;
 /* This is all NuBus cards */
@@ -156,6 +167,34 @@ void nubus_seq_write_rsrc_mem(struct seq_file *m,
                               const struct nubus_dirent *dirent,
                               unsigned int len);
 
+int nubus_bus_register(void);
+int nubus_device_add(struct nubus_board *board);
+int nubus_driver_register(struct nubus_driver *ndrv);
+void nubus_driver_unregister(struct nubus_driver *ndrv);
+
+#define for_each_board_func_rsrc(b, f) \
+	for (f = b->first_func_rsrc; f; f = nubus_board_next_rsrc(b, f))
+
+static inline struct nubus_functional_resource *
+nubus_board_next_rsrc(struct nubus_board *board,
+                      struct nubus_functional_resource *fres)
+{
+	fres = fres->next;
+	if (fres && fres->board == board)
+		return fres;
+	return NULL;
+}
+
+static inline void nubus_set_drvdata(struct nubus_board *board, void *data)
+{
+	dev_set_drvdata(&board->dev, data);
+}
+
+static inline void *nubus_get_drvdata(struct nubus_board *board)
+{
+	return dev_get_drvdata(&board->dev);
+}
+
 /* Returns a pointer to the "standard" slot space. */
 static inline void *nubus_slot_addr(int slot)
 {
-- 
2.13.6
