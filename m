From: Finn Thain <fthain@telegraphics.com.au>
Subject: [PATCH 10/14] nubus: Depopulate /proc/bus/nubus/s/
Date: Sat, 11 Nov 2017 01:12:48 -0500 (EST)
Message-ID: <f23c955122aad41f7f858919e10e93e454ebebef.1510377368.git.fthain@telegraphics.com.au>
References: <cover.1510377368.git.fthain@telegraphics.com.au>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1510377368.git.fthain@telegraphics.com.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org

The /proc/bus/nubus/s/ directory tree for any slot s is missing a lot
of information. The struct file_operations methods have long been left
unimplemented (hence the familiar compile-time warning, "Need to set
some I/O handlers here").

Slot resources have a complex structure which varies depending on board
function. The logic for interpreting these ROM data structures is found
in nubus.c. Let's not duplicate it in proc.c.

Remove this code so it can be replaced with a better approach (see
following patch) which does not depend on a stored representation of
slot resource data.

Tested-by: Stan Johnson <userm57@yahoo.com>
Signed-off-by: Finn Thain <fthain@telegraphics.com.au>
---
 drivers/nubus/proc.c  | 100 --------------------------------------------------
 include/linux/nubus.h |   1 -
 2 files changed, 101 deletions(-)

diff --git a/drivers/nubus/proc.c b/drivers/nubus/proc.c
index c05662931b6c..88f6a880adb4 100644
--- a/drivers/nubus/proc.c
+++ b/drivers/nubus/proc.c
@@ -60,97 +60,6 @@ static const struct file_operations nubus_devices_proc_fops = {
 
 static struct proc_dir_entry *proc_bus_nubus_dir;
 
-static const struct file_operations nubus_proc_subdir_fops = {
-#warning Need to set some I/O handlers here
-};
-
-static void nubus_proc_subdir(struct nubus_dev* dev,
-			      struct proc_dir_entry* parent,
-			      struct nubus_dir* dir)
-{
-	struct nubus_dirent ent;
-
-	/* Some of these are directories, others aren't */
-	while (nubus_readdir(dir, &ent) != -1) {
-		char name[9];
-		struct proc_dir_entry* e;
-		
-		snprintf(name, sizeof(name), "%x", ent.type);
-		e = proc_create(name, S_IFREG | S_IRUGO | S_IWUSR, parent,
-				&nubus_proc_subdir_fops);
-		if (!e)
-			return;
-	}
-}
-
-/* Can't do this recursively since the root directory is structured
-   somewhat differently from the subdirectories */
-static void nubus_proc_populate(struct nubus_dev* dev,
-				struct proc_dir_entry* parent,
-				struct nubus_dir* root)
-{
-	struct nubus_dirent ent;
-
-	/* We know these are all directories (board resource + one or
-	   more functional resources) */
-	while (nubus_readdir(root, &ent) != -1) {
-		char name[9];
-		struct proc_dir_entry* e;
-		struct nubus_dir dir;
-		
-		snprintf(name, sizeof(name), "%x", ent.type);
-		e = proc_mkdir(name, parent);
-		if (!e) return;
-
-		/* And descend */
-		if (nubus_get_subdir(&ent, &dir) == -1) {
-			/* This shouldn't happen */
-			printk(KERN_ERR "NuBus root directory node %x:%x has no subdir!\n",
-			       dev->board->slot, ent.type);
-			continue;
-		} else {
-			nubus_proc_subdir(dev, e, &dir);
-		}
-	}
-}
-
-int nubus_proc_attach_device(struct nubus_dev *dev)
-{
-	struct proc_dir_entry *e;
-	struct nubus_dir root;
-	char name[9];
-
-	if (dev == NULL) {
-		printk(KERN_ERR
-		       "NULL pointer in nubus_proc_attach_device, shoot the programmer!\n");
-		return -1;
-	}
-		
-	if (dev->board == NULL) {
-		printk(KERN_ERR
-		       "NULL pointer in nubus_proc_attach_device, shoot the programmer!\n");
-		printk("dev = %p, dev->board = %p\n", dev, dev->board);
-		return -1;
-	}
-		
-	if (dev->board->procdir)
-		return 0;
-
-	/* Create a directory */
-	snprintf(name, sizeof(name), "%x", dev->board->slot);
-	e = proc_mkdir(name, proc_bus_nubus_dir);
-	dev->board->procdir = e;
-	if (!e)
-		return -ENOMEM;
-
-	/* Now recursively populate it with files */
-	nubus_get_root_dir(dev->board, &root);
-	nubus_proc_populate(dev, e, &root);
-
-	return 0;
-}
-EXPORT_SYMBOL(nubus_proc_attach_device);
-
 /*
  * /proc/nubus stuff
  */
@@ -218,18 +127,9 @@ static const struct file_operations nubus_proc_fops = {
 	.release	= seq_release,
 };
 
-void __init proc_bus_nubus_add_devices(void)
-{
-	struct nubus_dev *dev;
-	
-	for(dev = nubus_devices; dev; dev = dev->next)
-		nubus_proc_attach_device(dev);
-}
-
 void __init nubus_proc_init(void)
 {
 	proc_create("nubus", 0, NULL, &nubus_proc_fops);
 	proc_bus_nubus_dir = proc_mkdir("bus/nubus", NULL);
 	proc_create("devices", 0, proc_bus_nubus_dir, &nubus_devices_proc_fops);
-	proc_bus_nubus_add_devices();
 }
diff --git a/include/linux/nubus.h b/include/linux/nubus.h
index cddfed466bee..5f6d0eda8673 100644
--- a/include/linux/nubus.h
+++ b/include/linux/nubus.h
@@ -88,7 +88,6 @@ extern void nubus_proc_init(void);
 static inline void nubus_proc_init(void) {}
 #endif
 
-int nubus_proc_attach_device(struct nubus_dev *dev);
 /* If we need more precision we can add some more of these */
 struct nubus_dev *nubus_find_type(unsigned short category,
 				  unsigned short type,
-- 
2.13.6
