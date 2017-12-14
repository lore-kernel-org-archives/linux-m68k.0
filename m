From: Finn Thain <fthain@telegraphics.com.au>
Subject: [PATCH v4 14/14] nubus: Add support for the driver model
Date: Wed, 13 Dec 2017 22:16:30 -0500 (EST)
Message-ID: <b9d7448ab1b6726d9d057523adf342441dc67e4d.1513220582.git.fthain@telegraphics.com.au>
References: <cover.1513220582.git.fthain@telegraphics.com.au>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1513220582.git.fthain@telegraphics.com.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org, linux-kernel@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
List-Id: linux-m68k@vger.kernel.org

This patch brings basic support for the Linux Driver Model to the
NuBus subsystem.

For flexibility, the matching of boards with drivers is left up to the
drivers. This is also the approach taken by NetBSD. A board may have
many functions, and drivers may have to consider many functional
resources and board resources in order to match a device.

This implementation does not bind drivers to resources (nor does it bind
many drivers to the same board). Apple's NuBus declaration ROM design
is flexible enough to allow that, but I don't see a need to support it
as we don't use the "slot zero" resources (in the main logic board ROM).

Eliminate the global nubus_boards linked list by rewriting the procfs
board iterator around bus_for_each_dev(). Hence the nubus device refcount
can be used to determine the lifespan of board objects.

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Tested-by: Stan Johnson <userm57@yahoo.com>
Signed-off-by: Finn Thain <fthain@telegraphics.com.au>

---
The conversion of Mac network drivers from the Space.c convention to
the Driver Model takes place in a separate patch series, archived at
https://lkml.org/lkml/2017/11/11/25
That series motivates parts of this design, such as the definition of
'for_each_board_func_rsrc'.

Changes since v3:
- Added Reviewed-by tag.
- Moved the SPDX tag in bus.c to the first line of the file.
---
 drivers/nubus/Makefile |   2 +-
 drivers/nubus/bus.c    | 117 +++++++++++++++++++++++++++++++++++++++++++++++++
 drivers/nubus/nubus.c  |  24 +++++-----
 drivers/nubus/proc.c   |  55 +----------------------
 include/linux/nubus.h  |  33 ++++++++++++--
 5 files changed, 161 insertions(+), 70 deletions(-)
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
index 000000000000..b6094b948153
--- /dev/null
+++ b/drivers/nubus/bus.c
@@ -0,0 +1,117 @@
+// SPDX-License-Identifier: GPL-2.0
+//
+// Bus implementation for the NuBus subsystem.
+//
+// Copyright (C) 2017 Finn Thain
+
+#include <linux/device.h>
+#include <linux/list.h>
+#include <linux/nubus.h>
+#include <linux/seq_file.h>
+#include <linux/slab.h>
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
+	if (dev->driver && ndrv->remove)
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
+	err = device_register(&nubus_parent);
+	if (err)
+		return err;
+
+	err = bus_register(&nubus_bus_type);
+	if (!err)
+		return 0;
+
+	device_unregister(&nubus_parent);
+	return err;
+}
+
+static void nubus_device_release(struct device *dev)
+{
+	struct nubus_board *board = to_nubus_board(dev);
+	struct nubus_rsrc *fres, *tmp;
+
+	list_for_each_entry_safe(fres, tmp, &nubus_func_rsrcs, list)
+		if (fres->board == board) {
+			list_del(&fres->list);
+			kfree(fres);
+		}
+	kfree(board);
+}
+
+int nubus_device_register(struct nubus_board *board)
+{
+	board->dev.parent = &nubus_parent;
+	board->dev.release = nubus_device_release;
+	board->dev.bus = &nubus_bus_type;
+	dev_set_name(&board->dev, "slot.%X", board->slot);
+	return device_register(&board->dev);
+}
+
+static int nubus_print_device_name_fn(struct device *dev, void *data)
+{
+	struct nubus_board *board = to_nubus_board(dev);
+	struct seq_file *m = data;
+
+	seq_printf(m, "Slot %X: %s\n", board->slot, board->name);
+	return 0;
+}
+
+int nubus_proc_show(struct seq_file *m, void *data)
+{
+	return bus_for_each_dev(&nubus_bus_type, NULL, m,
+	                        nubus_print_device_name_fn);
+}
diff --git a/drivers/nubus/nubus.c b/drivers/nubus/nubus.c
index 380f320c050f..00329c580506 100644
--- a/drivers/nubus/nubus.c
+++ b/drivers/nubus/nubus.c
@@ -33,7 +33,6 @@
 /* Globals */
 
 LIST_HEAD(nubus_func_rsrcs);
-struct nubus_board *nubus_boards;
 
 /* Meaning of "bytelanes":
 
@@ -713,10 +712,9 @@ static int __init nubus_get_board_resource(struct nubus_board *board, int slot,
 	return 0;
 }
 
-static struct nubus_board * __init nubus_add_board(int slot, int bytelanes)
+static void __init nubus_add_board(int slot, int bytelanes)
 {
 	struct nubus_board *board;
-	struct nubus_board **boardp;
 	unsigned char *rp;
 	unsigned long dpat;
 	struct nubus_dir dir;
@@ -729,7 +727,7 @@ static struct nubus_board * __init nubus_add_board(int slot, int bytelanes)
 
 	/* Actually we should probably panic if this fails */
 	if ((board = kzalloc(sizeof(*board), GFP_ATOMIC)) == NULL)
-		return NULL;
+		return;
 	board->fblock = rp;
 
 	/* Dump the format block for debugging purposes */
@@ -792,7 +790,8 @@ static struct nubus_board * __init nubus_add_board(int slot, int bytelanes)
 	if (nubus_readdir(&dir, &ent) == -1) {
 		/* We can't have this! */
 		pr_err("Slot %X: Board resource not found!\n", slot);
-		return NULL;
+		kfree(board);
+		return;
 	}
 
 	if (ent.type < 1 || ent.type > 127)
@@ -821,14 +820,8 @@ static struct nubus_board * __init nubus_add_board(int slot, int bytelanes)
 		list_add_tail(&fres->list, &nubus_func_rsrcs);
 	}
 
-	/* Put it on the global NuBus board chain. Keep entries in order. */
-	for (boardp = &nubus_boards; *boardp != NULL;
-	     boardp = &((*boardp)->next))
-		/* spin */;
-	*boardp = board;
-	board->next = NULL;
-
-	return board;
+	if (nubus_device_register(board))
+		put_device(&board->dev);
 }
 
 static void __init nubus_probe_slot(int slot)
@@ -874,10 +867,15 @@ static void __init nubus_scan_bus(void)
 
 static int __init nubus_init(void)
 {
+	int err;
+
 	if (!MACH_IS_MAC)
 		return 0;
 
 	nubus_proc_init();
+	err = nubus_bus_register();
+	if (err)
+		return err;
 	nubus_scan_bus();
 	return 0;
 }
diff --git a/drivers/nubus/proc.c b/drivers/nubus/proc.c
index ccaaec4ed291..802d62392b71 100644
--- a/drivers/nubus/proc.c
+++ b/drivers/nubus/proc.c
@@ -199,68 +199,17 @@ void nubus_proc_add_rsrc(struct proc_dir_entry *procdir,
 /*
  * /proc/nubus stuff
  */
-static int nubus_proc_show(struct seq_file *m, void *v)
-{
-	const struct nubus_board *board = v;
-
-	/* Display header on line 1 */
-	if (v == SEQ_START_TOKEN)
-		seq_puts(m, "Nubus devices found:\n");
-	else
-		seq_printf(m, "Slot %X: %s\n", board->slot, board->name);
-	return 0;
-}
-
-static void *nubus_proc_start(struct seq_file *m, loff_t *_pos)
-{
-	struct nubus_board *board;
-	unsigned pos;
-
-	if (*_pos > LONG_MAX)
-		return NULL;
-	pos = *_pos;
-	if (pos == 0)
-		return SEQ_START_TOKEN;
-	for (board = nubus_boards; board; board = board->next)
-		if (--pos == 0)
-			break;
-	return board;
-}
-
-static void *nubus_proc_next(struct seq_file *p, void *v, loff_t *_pos)
-{
-	/* Walk the list of NuBus boards */
-	struct nubus_board *board = v;
-
-	++*_pos;
-	if (v == SEQ_START_TOKEN)
-		board = nubus_boards;
-	else if (board)
-		board = board->next;
-	return board;
-}
-
-static void nubus_proc_stop(struct seq_file *p, void *v)
-{
-}
-
-static const struct seq_operations nubus_proc_seqops = {
-	.start	= nubus_proc_start,
-	.next	= nubus_proc_next,
-	.stop	= nubus_proc_stop,
-	.show	= nubus_proc_show,
-};
 
 static int nubus_proc_open(struct inode *inode, struct file *file)
 {
-	return seq_open(file, &nubus_proc_seqops);
+	return single_open(file, nubus_proc_show, NULL);
 }
 
 static const struct file_operations nubus_proc_fops = {
 	.open		= nubus_proc_open,
 	.read		= seq_read,
 	.llseek		= seq_lseek,
-	.release	= seq_release,
+	.release	= single_release,
 };
 
 void __init nubus_proc_init(void)
diff --git a/include/linux/nubus.h b/include/linux/nubus.h
index aee7c50e9a2e..962149ab3e5a 100644
--- a/include/linux/nubus.h
+++ b/include/linux/nubus.h
@@ -10,6 +10,7 @@
 #ifndef LINUX_NUBUS_H
 #define LINUX_NUBUS_H
 
+#include <linux/device.h>
 #include <asm/nubus.h>
 #include <uapi/linux/nubus.h>
 
@@ -32,7 +33,7 @@ struct nubus_dirent {
 };
 
 struct nubus_board {
-	struct nubus_board *next;
+	struct device dev;
 
 	/* Only 9-E actually exist, though 0-8 are also theoretically
 	   possible, and 0 is a special case which represents the
@@ -81,8 +82,14 @@ struct nubus_rsrc {
 
 /* This is all NuBus functional resources (used to find devices later on) */
 extern struct list_head nubus_func_rsrcs;
-/* This is all NuBus cards */
-extern struct nubus_board *nubus_boards;
+
+struct nubus_driver {
+	struct device_driver driver;
+	int (*probe)(struct nubus_board *board);
+	int (*remove)(struct nubus_board *board);
+};
+
+extern struct bus_type nubus_bus_type;
 
 /* Generic NuBus interface functions, modelled after the PCI interface */
 #ifdef CONFIG_PROC_FS
@@ -119,6 +126,9 @@ struct nubus_rsrc *nubus_next_rsrc_or_null(struct nubus_rsrc *from);
 #define for_each_func_rsrc(f) \
 	for (f = nubus_first_rsrc_or_null(); f; f = nubus_next_rsrc_or_null(f))
 
+#define for_each_board_func_rsrc(b, f) \
+	for_each_func_rsrc(f) if (f->board != b) { } else
+
 /* These are somewhat more NuBus-specific.  They all return 0 for
    success and -1 for failure, as you'd expect. */
 
@@ -152,6 +162,23 @@ void nubus_seq_write_rsrc_mem(struct seq_file *m,
                               unsigned int len);
 unsigned char *nubus_dirptr(const struct nubus_dirent *nd);
 
+/* Declarations relating to driver model objects */
+int nubus_bus_register(void);
+int nubus_device_register(struct nubus_board *board);
+int nubus_driver_register(struct nubus_driver *ndrv);
+void nubus_driver_unregister(struct nubus_driver *ndrv);
+int nubus_proc_show(struct seq_file *m, void *data);
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
