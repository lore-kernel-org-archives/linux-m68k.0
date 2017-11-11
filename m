From: Finn Thain <fthain@telegraphics.com.au>
Subject: [PATCH 11/14] nubus: Repopulate /proc/bus/nubus/s/
Date: Sat, 11 Nov 2017 01:12:48 -0500 (EST)
Message-ID: <51c5a1526bbf522bbb76d6a71040c220e7e72a8a.1510377369.git.fthain@telegraphics.com.au>
References: <cover.1510377368.git.fthain@telegraphics.com.au>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:57840 "EHLO
        kvm5.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752048AbdKKGMu (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Sat, 11 Nov 2017 01:12:50 -0500
In-Reply-To: <cover.1510377368.git.fthain@telegraphics.com.au>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org, linux-kernel@vger.kernel.org

Create the /proc/bus/nubus/s/ inodes while scanning slot s. During
descent through slot resource subdirectories, call the new
nubus_proc_add_foo() functions to create the procfs inodes.

Also add a new function, nubus_seq_write_rsrc_mem(), to write the
contents of a particular slot resource to a given seq_file. This is
used by the procfs file_operations methods, to finally give userspace
access to slot ROM information, such as the available video modes.

Tested-by: Stan Johnson <userm57@yahoo.com>
Signed-off-by: Finn Thain <fthain@telegraphics.com.au>
---
 drivers/nubus/nubus.c | 117 +++++++++++++++++++++++++++-------
 drivers/nubus/proc.c  | 170 +++++++++++++++++++++++++++++++++++++++++++++++---
 include/linux/nubus.h |  35 ++++++++++-
 3 files changed, 288 insertions(+), 34 deletions(-)

diff --git a/drivers/nubus/nubus.c b/drivers/nubus/nubus.c
index ab3400241bf7..16cbdd45dbbc 100644
--- a/drivers/nubus/nubus.c
+++ b/drivers/nubus/nubus.c
@@ -14,6 +14,7 @@
 #include <linux/errno.h>
 #include <linux/init.h>
 #include <linux/module.h>
+#include <linux/seq_file.h>
 #include <linux/slab.h>
 #include <asm/setup.h>
 #include <asm/page.h>
@@ -172,8 +173,8 @@ void nubus_get_rsrc_mem(void *dest, const struct nubus_dirent *dirent,
 }
 EXPORT_SYMBOL(nubus_get_rsrc_mem);
 
-void nubus_get_rsrc_str(char *dest, const struct nubus_dirent *dirent,
-                        unsigned int len)
+unsigned int nubus_get_rsrc_str(char *dest, const struct nubus_dirent *dirent,
+                                unsigned int len)
 {
 	char *t = dest;
 	unsigned char *p = nubus_dirptr(dirent);
@@ -188,9 +189,34 @@ void nubus_get_rsrc_str(char *dest, const struct nubus_dirent *dirent,
 	}
 	if (len > 0)
 		*t = '\0';
+	return t - dest;
 }
 EXPORT_SYMBOL(nubus_get_rsrc_str);
 
+void nubus_seq_write_rsrc_mem(struct seq_file *m,
+                              const struct nubus_dirent *dirent,
+                              unsigned int len)
+{
+	unsigned long buf[32];
+	unsigned int buf_size = sizeof(buf);
+	unsigned char *p = nubus_dirptr(dirent);
+
+	/* If possible, write out full buffers */
+	while (len >= buf_size) {
+		unsigned int i;
+
+		for (i = 0; i < ARRAY_SIZE(buf); i++)
+			buf[i] = nubus_get_rom(&p, sizeof(buf[0]),
+			                       dirent->mask);
+		seq_write(m, buf, buf_size);
+		len -= buf_size;
+	}
+	/* If not, write out individual bytes */
+	while (len--)
+		seq_putc(m, nubus_get_rom(&p, 1, dirent->mask));
+}
+EXPORT_SYMBOL(nubus_seq_write_rsrc_mem);
+
 int nubus_get_root_dir(const struct nubus_board *board,
 		       struct nubus_dir *dir)
 {
@@ -325,35 +351,35 @@ EXPORT_SYMBOL(nubus_find_rsrc);
    looking at, and print out lots and lots of information from the
    resource blocks. */
 
-/* FIXME: A lot of this stuff will eventually be useful after
-   initialization, for intelligently probing Ethernet and video chips,
-   among other things.  The rest of it should go in the /proc code.
-   For now, we just use it to give verbose boot logs. */
-
 static int __init nubus_get_block_rsrc_dir(struct nubus_board *board,
+                                           struct proc_dir_entry *procdir,
                                            const struct nubus_dirent *parent)
 {
 	struct nubus_dir dir;
 	struct nubus_dirent ent;
 
 	nubus_get_subdir(parent, &dir);
+	dir.procdir = nubus_proc_add_rsrc_dir(procdir, parent, board);
 
 	while (nubus_readdir(&dir, &ent) != -1) {
 		u32 size;
 
 		nubus_get_rsrc_mem(&size, &ent, 4);
 		pr_debug("        block (0x%x), size %d\n", ent.type, size);
+		nubus_proc_add_rsrc_mem(dir.procdir, &ent, size);
 	}
 	return 0;
 }
 
 static int __init nubus_get_display_vidmode(struct nubus_board *board,
+                                            struct proc_dir_entry *procdir,
                                             const struct nubus_dirent *parent)
 {
 	struct nubus_dir dir;
 	struct nubus_dirent ent;
 
 	nubus_get_subdir(parent, &dir);
+	dir.procdir = nubus_proc_add_rsrc_dir(procdir, parent, board);
 
 	while (nubus_readdir(&dir, &ent) != -1) {
 		switch (ent.type) {
@@ -365,37 +391,42 @@ static int __init nubus_get_display_vidmode(struct nubus_board *board,
 			nubus_get_rsrc_mem(&size, &ent, 4);
 			pr_debug("        block (0x%x), size %d\n", ent.type,
 				size);
+			nubus_proc_add_rsrc_mem(dir.procdir, &ent, size);
 			break;
 		}
 		default:
 			pr_debug("        unknown resource 0x%02x, data 0x%06x\n",
 				ent.type, ent.data);
+			nubus_proc_add_rsrc_mem(dir.procdir, &ent, 0);
 		}
 	}
 	return 0;
 }
 
 static int __init nubus_get_display_resource(struct nubus_dev *dev,
+                                             struct proc_dir_entry *procdir,
                                              const struct nubus_dirent *ent)
 {
 	switch (ent->type) {
 	case NUBUS_RESID_GAMMADIR:
 		pr_debug("    gamma directory offset: 0x%06x\n", ent->data);
-		nubus_get_block_rsrc_dir(dev->board, ent);
+		nubus_get_block_rsrc_dir(dev->board, procdir, ent);
 		break;
 	case 0x0080 ... 0x0085:
 		pr_debug("    mode 0x%02x info offset: 0x%06x\n",
 			ent->type, ent->data);
-		nubus_get_display_vidmode(dev->board, ent);
+		nubus_get_display_vidmode(dev->board, procdir, ent);
 		break;
 	default:
 		pr_debug("    unknown resource 0x%02x, data 0x%06x\n",
 			ent->type, ent->data);
+		nubus_proc_add_rsrc_mem(procdir, ent, 0);
 	}
 	return 0;
 }
 
 static int __init nubus_get_network_resource(struct nubus_dev *dev,
+                                             struct proc_dir_entry *procdir,
                                              const struct nubus_dirent *ent)
 {
 	switch (ent->type) {
@@ -405,16 +436,19 @@ static int __init nubus_get_network_resource(struct nubus_dev *dev,
 
 		nubus_get_rsrc_mem(addr, ent, 6);
 		pr_debug("    MAC address: %pM\n", addr);
+		nubus_proc_add_rsrc_mem(procdir, ent, 6);
 		break;
 	}
 	default:
 		pr_debug("    unknown resource 0x%02x, data 0x%06x\n",
 			ent->type, ent->data);
+		nubus_proc_add_rsrc_mem(procdir, ent, 0);
 	}
 	return 0;
 }
 
 static int __init nubus_get_cpu_resource(struct nubus_dev *dev,
+                                         struct proc_dir_entry *procdir,
                                          const struct nubus_dirent *ent)
 {
 	switch (ent->type) {
@@ -425,6 +459,7 @@ static int __init nubus_get_cpu_resource(struct nubus_dev *dev,
 		nubus_get_rsrc_mem(&meminfo, ent, 8);
 		pr_debug("    memory: [ 0x%08lx 0x%08lx ]\n",
 			meminfo[0], meminfo[1]);
+		nubus_proc_add_rsrc_mem(procdir, ent, 8);
 		break;
 	}
 	case NUBUS_RESID_ROMINFO:
@@ -434,31 +469,35 @@ static int __init nubus_get_cpu_resource(struct nubus_dev *dev,
 		nubus_get_rsrc_mem(&rominfo, ent, 8);
 		pr_debug("    ROM:    [ 0x%08lx 0x%08lx ]\n",
 			rominfo[0], rominfo[1]);
+		nubus_proc_add_rsrc_mem(procdir, ent, 8);
 		break;
 	}
 	default:
 		pr_debug("    unknown resource 0x%02x, data 0x%06x\n",
 			ent->type, ent->data);
+		nubus_proc_add_rsrc_mem(procdir, ent, 0);
 	}
 	return 0;
 }
 
 static int __init nubus_get_private_resource(struct nubus_dev *dev,
+                                             struct proc_dir_entry *procdir,
                                              const struct nubus_dirent *ent)
 {
 	switch (dev->category) {
 	case NUBUS_CAT_DISPLAY:
-		nubus_get_display_resource(dev, ent);
+		nubus_get_display_resource(dev, procdir, ent);
 		break;
 	case NUBUS_CAT_NETWORK:
-		nubus_get_network_resource(dev, ent);
+		nubus_get_network_resource(dev, procdir, ent);
 		break;
 	case NUBUS_CAT_CPU:
-		nubus_get_cpu_resource(dev, ent);
+		nubus_get_cpu_resource(dev, procdir, ent);
 		break;
 	default:
 		pr_debug("    unknown resource 0x%02x, data 0x%06x\n",
 			ent->type, ent->data);
+		nubus_proc_add_rsrc_mem(procdir, ent, 0);
 	}
 	return 0;
 }
@@ -473,6 +512,7 @@ nubus_get_functional_resource(struct nubus_board *board, int slot,
 
 	pr_debug("  Functional resource 0x%02x:\n", parent->type);
 	nubus_get_subdir(parent, &dir);
+	dir.procdir = nubus_proc_add_rsrc_dir(board->procdir, parent, board);
 
 	/* Actually we should probably panic if this fails */
 	if ((dev = kzalloc(sizeof(*dev), GFP_ATOMIC)) == NULL)
@@ -494,14 +534,17 @@ nubus_get_functional_resource(struct nubus_board *board, int slot,
 			dev->dr_hw    = nbtdata[3];
 			pr_debug("    type: [cat 0x%x type 0x%x sw 0x%x hw 0x%x]\n",
 				nbtdata[0], nbtdata[1], nbtdata[2], nbtdata[3]);
+			nubus_proc_add_rsrc_mem(dir.procdir, &ent, 8);
 			break;
 		}
 		case NUBUS_RESID_NAME:
 		{
 			char name[64];
+			unsigned int len;
 
-			nubus_get_rsrc_str(name, &ent, sizeof(name));
+			len = nubus_get_rsrc_str(name, &ent, sizeof(name));
 			pr_debug("    name: %s\n", name);
+			nubus_proc_add_rsrc_mem(dir.procdir, &ent, len);
 			break;
 		}
 		case NUBUS_RESID_DRVRDIR:
@@ -510,7 +553,7 @@ nubus_get_functional_resource(struct nubus_board *board, int slot,
 			   use this :-) */
 			pr_debug("    driver directory offset: 0x%06x\n",
 				ent.data);
-			nubus_get_block_rsrc_dir(board, &ent);
+			nubus_get_block_rsrc_dir(board, dir.procdir, &ent);
 			break;
 		}
 		case NUBUS_RESID_MINOR_BASEOS:
@@ -522,6 +565,7 @@ nubus_get_functional_resource(struct nubus_board *board, int slot,
 
 			nubus_get_rsrc_mem(&base_offset, &ent, 4);
 			pr_debug("    memory offset: 0x%08x\n", base_offset);
+			nubus_proc_add_rsrc_mem(dir.procdir, &ent, 4);
 			break;
 		}
 		case NUBUS_RESID_MINOR_LENGTH:
@@ -531,18 +575,21 @@ nubus_get_functional_resource(struct nubus_board *board, int slot,
 
 			nubus_get_rsrc_mem(&length, &ent, 4);
 			pr_debug("    memory length: 0x%08x\n", length);
+			nubus_proc_add_rsrc_mem(dir.procdir, &ent, 4);
 			break;
 		}
 		case NUBUS_RESID_FLAGS:
 			pr_debug("    flags: 0x%06x\n", ent.data);
+			nubus_proc_add_rsrc(dir.procdir, &ent);
 			break;
 		case NUBUS_RESID_HWDEVID:
 			pr_debug("    hwdevid: 0x%06x\n", ent.data);
+			nubus_proc_add_rsrc(dir.procdir, &ent);
 			break;
 		default:
 			/* Local/Private resources have their own
 			   function */
-			nubus_get_private_resource(dev, &ent);
+			nubus_get_private_resource(dev, dir.procdir, &ent);
 		}
 	}
 
@@ -551,7 +598,8 @@ nubus_get_functional_resource(struct nubus_board *board, int slot,
 
 /* This is *really* cool. */
 static int __init nubus_get_icon(struct nubus_board *board,
-				 const struct nubus_dirent *ent)
+                                 struct proc_dir_entry *procdir,
+                                 const struct nubus_dirent *ent)
 {
 	/* Should be 32x32 if my memory serves me correctly */
 	u32 icon[32];
@@ -563,12 +611,14 @@ static int __init nubus_get_icon(struct nubus_board *board,
 		pr_debug("        %08x %08x %08x %08x\n",
 			icon[i * 4 + 0], icon[i * 4 + 1],
 			icon[i * 4 + 2], icon[i * 4 + 3]);
+	nubus_proc_add_rsrc_mem(procdir, ent, 128);
 
 	return 0;
 }
 
 static int __init nubus_get_vendorinfo(struct nubus_board *board,
-				       const struct nubus_dirent *parent)
+                                       struct proc_dir_entry *procdir,
+                                       const struct nubus_dirent *parent)
 {
 	struct nubus_dir dir;
 	struct nubus_dirent ent;
@@ -577,15 +627,18 @@ static int __init nubus_get_vendorinfo(struct nubus_board *board,
 
 	pr_debug("    vendor info:\n");
 	nubus_get_subdir(parent, &dir);
+	dir.procdir = nubus_proc_add_rsrc_dir(procdir, parent, board);
 
 	while (nubus_readdir(&dir, &ent) != -1) {
 		char name[64];
+		unsigned int len;
 
 		/* These are all strings, we think */
-		nubus_get_rsrc_str(name, &ent, sizeof(name));
+		len = nubus_get_rsrc_str(name, &ent, sizeof(name));
 		if (ent.type < 1 || ent.type > 5)
 			ent.type = 5;
 		pr_debug("    %s: %s\n", vendor_fields[ent.type - 1], name);
+		nubus_proc_add_rsrc_mem(dir.procdir, &ent, len);
 	}
 	return 0;
 }
@@ -598,6 +651,7 @@ static int __init nubus_get_board_resource(struct nubus_board *board, int slot,
 
 	pr_debug("  Board resource 0x%02x:\n", parent->type);
 	nubus_get_subdir(parent, &dir);
+	dir.procdir = nubus_proc_add_rsrc_dir(board->procdir, parent, board);
 
 	while (nubus_readdir(&dir, &ent) != -1) {
 		switch (ent.type) {
@@ -613,48 +667,61 @@ static int __init nubus_get_board_resource(struct nubus_board *board, int slot,
 			if (nbtdata[0] != 1 || nbtdata[1] != 0 ||
 			    nbtdata[2] != 0 || nbtdata[3] != 0)
 				pr_err("Slot %X: sResource is not a board resource!\n", slot);
+			nubus_proc_add_rsrc_mem(dir.procdir, &ent, 8);
 			break;
 		}
 		case NUBUS_RESID_NAME:
-			nubus_get_rsrc_str(board->name, &ent,
-			                   sizeof(board->name));
+		{
+			unsigned int len;
+
+			len = nubus_get_rsrc_str(board->name, &ent,
+			                         sizeof(board->name));
 			pr_debug("    name: %s\n", board->name);
+			nubus_proc_add_rsrc_mem(dir.procdir, &ent, len);
 			break;
+		}
 		case NUBUS_RESID_ICON:
-			nubus_get_icon(board, &ent);
+			nubus_get_icon(board, dir.procdir, &ent);
 			break;
 		case NUBUS_RESID_BOARDID:
 			pr_debug("    board id: 0x%x\n", ent.data);
+			nubus_proc_add_rsrc(dir.procdir, &ent);
 			break;
 		case NUBUS_RESID_PRIMARYINIT:
 			pr_debug("    primary init offset: 0x%06x\n", ent.data);
+			nubus_proc_add_rsrc(dir.procdir, &ent);
 			break;
 		case NUBUS_RESID_VENDORINFO:
-			nubus_get_vendorinfo(board, &ent);
+			nubus_get_vendorinfo(board, dir.procdir, &ent);
 			break;
 		case NUBUS_RESID_FLAGS:
 			pr_debug("    flags: 0x%06x\n", ent.data);
+			nubus_proc_add_rsrc(dir.procdir, &ent);
 			break;
 		case NUBUS_RESID_HWDEVID:
 			pr_debug("    hwdevid: 0x%06x\n", ent.data);
+			nubus_proc_add_rsrc(dir.procdir, &ent);
 			break;
 		case NUBUS_RESID_SECONDINIT:
 			pr_debug("    secondary init offset: 0x%06x\n", ent.data);
+			nubus_proc_add_rsrc(dir.procdir, &ent);
 			break;
 			/* WTF isn't this in the functional resources? */
 		case NUBUS_RESID_VIDNAMES:
 			pr_debug("    vidnames directory offset: 0x%06x\n",
 				ent.data);
-			nubus_get_block_rsrc_dir(board, &ent);
+			nubus_get_block_rsrc_dir(board, dir.procdir, &ent);
 			break;
 			/* Same goes for this */
 		case NUBUS_RESID_VIDMODES:
 			pr_debug("    video mode parameter directory offset: 0x%06x\n",
 			       ent.data);
+			nubus_proc_add_rsrc(dir.procdir, &ent);
 			break;
 		default:
 			pr_debug("    unknown resource 0x%02x, data 0x%06x\n",
 			       ent.type, ent.data);
+			nubus_proc_add_rsrc_mem(dir.procdir, &ent, 0);
 		}
 	}
 	return 0;
@@ -745,6 +812,8 @@ static struct nubus_board * __init nubus_add_board(int slot, int bytelanes)
 	if (ent.type < 1 || ent.type > 127)
 		pr_warn("Slot %X: Board resource ID is invalid!\n", slot);
 
+	board->procdir = nubus_proc_add_board(board);
+
 	nubus_get_board_resource(board, slot, &ent);
 
 	while (nubus_readdir(&dir, &ent) != -1) {
@@ -835,8 +904,8 @@ static int __init nubus_init(void)
 	if (!MACH_IS_MAC)
 		return 0;
 
-	nubus_scan_bus();
 	nubus_proc_init();
+	nubus_scan_bus();
 	return 0;
 }
 
diff --git a/drivers/nubus/proc.c b/drivers/nubus/proc.c
index 88f6a880adb4..5877f77040f6 100644
--- a/drivers/nubus/proc.c
+++ b/drivers/nubus/proc.c
@@ -10,24 +10,28 @@
    structure in /proc analogous to the structure of the NuBus ROM
    resources.
 
-   Therefore each NuBus device is in fact a directory, which may in
-   turn contain subdirectories.  The "files" correspond to NuBus
-   resource records.  For those types of records which we know how to
-   convert to formats that are meaningful to userspace (mostly just
-   icons) these files will provide "cooked" data.  Otherwise they will
-   simply provide raw access (read-only of course) to the ROM.  */
+   Therefore each board function gets a directory, which may in turn
+   contain subdirectories.  Each slot resource is a file.  Unrecognized
+   resources are empty files, since every resource ID requires a special
+   case (e.g. if the resource ID implies a directory or block, then its
+   value has to be interpreted as a slot ROM pointer etc.).
+ */
 
 #include <linux/types.h>
 #include <linux/kernel.h>
 #include <linux/nubus.h>
 #include <linux/proc_fs.h>
 #include <linux/seq_file.h>
+#include <linux/slab.h>
 #include <linux/init.h>
 #include <linux/module.h>
-
 #include <linux/uaccess.h>
 #include <asm/byteorder.h>
 
+/*
+ * /proc/bus/nubus/devices stuff
+ */
+
 static int
 nubus_devices_proc_show(struct seq_file *m, void *v)
 {
@@ -61,6 +65,156 @@ static const struct file_operations nubus_devices_proc_fops = {
 static struct proc_dir_entry *proc_bus_nubus_dir;
 
 /*
+ * /proc/bus/nubus/x/ stuff
+ */
+
+struct proc_dir_entry *nubus_proc_add_board(struct nubus_board *board)
+{
+	char name[2];
+
+	if (!proc_bus_nubus_dir)
+		return NULL;
+	snprintf(name, sizeof(name), "%x", board->slot);
+	return proc_mkdir(name, proc_bus_nubus_dir);
+}
+
+/* The PDE private data for every directory under /proc/bus/nubus/x/
+ * is a pointer to the struct nubus_board for slot x.
+ */
+
+struct proc_dir_entry *nubus_proc_add_rsrc_dir(struct proc_dir_entry *procdir,
+                                               const struct nubus_dirent *ent,
+                                               struct nubus_board *board)
+{
+	char name[9];
+
+	if (!procdir)
+		return NULL;
+	snprintf(name, sizeof(name), "%x", ent->type);
+	return proc_mkdir_data(name, S_IRUGO | S_IXUGO, procdir, board);
+}
+
+/* The PDE private data for files under /proc/bus/nubus/x/ is a pointer to
+ * an instance of the following structure, which gives the location and size
+ * of the data belonging to a slot resource.
+ */
+
+struct nubus_proc_pde_data {
+	unsigned char *ptr;
+	unsigned int size;
+};
+
+static struct
+nubus_proc_pde_data *nubus_proc_alloc_pde_data(const struct nubus_dirent *ent,
+                                               unsigned int size)
+{
+	struct nubus_dir dir;
+	struct nubus_proc_pde_data *data;
+
+	data = kmalloc(sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return NULL;
+
+	data->size = size;
+	if (!size)
+		return data;
+
+	nubus_get_subdir(ent, &dir);
+	data->ptr = dir.ptr;
+	return data;
+}
+
+static int nubus_proc_sized_rsrc_show(struct seq_file *m, void *v)
+{
+	struct inode *inode = m->private;
+	struct nubus_board *board;
+	struct nubus_proc_pde_data *data;
+	struct nubus_dirent ent;
+
+	board = proc_get_parent_data(inode);
+	if (!board)
+		return 0;
+
+	data = PDE_DATA(inode);
+	if (!data || !data->size)
+		return 0;
+
+	if (data->size > m->size)
+		return -EFBIG;
+
+	ent.mask = board->lanes;
+	ent.base = data->ptr;
+	ent.data = 0;
+	nubus_seq_write_rsrc_mem(m, &ent, data->size);
+	return 0;
+}
+
+static int nubus_proc_sized_rsrc_open(struct inode *inode, struct file *file)
+{
+	return single_open(file, nubus_proc_sized_rsrc_show, inode);
+}
+
+static const struct file_operations nubus_proc_sized_rsrc_fops = {
+	.open		= nubus_proc_sized_rsrc_open,
+	.read		= seq_read,
+	.llseek		= seq_lseek,
+	.release	= single_release,
+};
+
+void nubus_proc_add_rsrc_mem(struct proc_dir_entry *procdir,
+                             const struct nubus_dirent *ent,
+                             unsigned int size)
+{
+	char name[9];
+
+	if (!procdir)
+		return;
+	snprintf(name, sizeof(name), "%x", ent->type);
+	proc_create_data(name, S_IFREG | S_IRUGO, procdir,
+	                 &nubus_proc_sized_rsrc_fops,
+	                 nubus_proc_alloc_pde_data(ent, size));
+}
+
+/* Many slot resources hold only a small integer. For such resources the
+ * PDE private data is this integer value (no size value is needed).
+ */
+
+static int nubus_proc_rsrc_show(struct seq_file *m, void *v)
+{
+	struct inode *inode = m->private;
+	unsigned int data = (unsigned int)PDE_DATA(inode);
+
+	seq_putc(m, data >> 16);
+	seq_putc(m, data >> 8);
+	seq_putc(m, data >> 0);
+	return 0;
+}
+
+static int nubus_proc_rsrc_open(struct inode *inode, struct file *file)
+{
+	return single_open(file, nubus_proc_rsrc_show, inode);
+}
+
+static const struct file_operations nubus_proc_rsrc_fops = {
+	.open		= nubus_proc_rsrc_open,
+	.read		= seq_read,
+	.llseek		= seq_lseek,
+	.release	= single_release,
+};
+
+void nubus_proc_add_rsrc(struct proc_dir_entry *procdir,
+                         const struct nubus_dirent *ent)
+{
+	char name[9];
+
+	if (!procdir)
+		return;
+	snprintf(name, sizeof(name), "%x", ent->type);
+	proc_create_data(name, S_IFREG | S_IRUGO, procdir,
+	                 &nubus_proc_rsrc_fops, (void *)ent->data);
+}
+
+/*
  * /proc/nubus stuff
  */
 static int nubus_proc_show(struct seq_file *m, void *v)
@@ -131,5 +285,7 @@ void __init nubus_proc_init(void)
 {
 	proc_create("nubus", 0, NULL, &nubus_proc_fops);
 	proc_bus_nubus_dir = proc_mkdir("bus/nubus", NULL);
+	if (!proc_bus_nubus_dir)
+		return;
 	proc_create("devices", 0, proc_bus_nubus_dir, &nubus_devices_proc_fops);
 }
diff --git a/include/linux/nubus.h b/include/linux/nubus.h
index 5f6d0eda8673..44576613d4a0 100644
--- a/include/linux/nubus.h
+++ b/include/linux/nubus.h
@@ -12,11 +12,15 @@
 #include <asm/nubus.h>
 #include <uapi/linux/nubus.h>
 
+struct proc_dir_entry;
+struct seq_file;
+
 struct nubus_dir {
 	unsigned char *base;
 	unsigned char *ptr;
 	int done;
 	int mask;
+	struct proc_dir_entry *procdir;
 };
 
 struct nubus_dirent {
@@ -83,9 +87,31 @@ extern struct nubus_board *nubus_boards;
 
 /* Generic NuBus interface functions, modelled after the PCI interface */
 #ifdef CONFIG_PROC_FS
-extern void nubus_proc_init(void);
+void nubus_proc_init(void);
+struct proc_dir_entry *nubus_proc_add_board(struct nubus_board *board);
+struct proc_dir_entry *nubus_proc_add_rsrc_dir(struct proc_dir_entry *procdir,
+                                               const struct nubus_dirent *ent,
+                                               struct nubus_board *board);
+void nubus_proc_add_rsrc_mem(struct proc_dir_entry *procdir,
+                             const struct nubus_dirent *ent,
+                             unsigned int size);
+void nubus_proc_add_rsrc(struct proc_dir_entry *procdir,
+                         const struct nubus_dirent *ent);
 #else
 static inline void nubus_proc_init(void) {}
+static inline
+struct proc_dir_entry *nubus_proc_add_board(struct nubus_board *board)
+{ return NULL; }
+static inline
+struct proc_dir_entry *nubus_proc_add_rsrc_dir(struct proc_dir_entry *procdir,
+                                               const struct nubus_dirent *ent,
+                                               struct nubus_board *board)
+{ return NULL; }
+static inline void nubus_proc_add_rsrc_mem(struct proc_dir_entry *procdir,
+                                           const struct nubus_dirent *ent,
+                                           unsigned int size) {}
+static inline void nubus_proc_add_rsrc(struct proc_dir_entry *procdir,
+                                       const struct nubus_dirent *ent) {}
 #endif
 
 /* If we need more precision we can add some more of these */
@@ -123,8 +149,11 @@ int nubus_get_subdir(const struct nubus_dirent *ent,
 		     struct nubus_dir *dir);
 void nubus_get_rsrc_mem(void *dest, const struct nubus_dirent *dirent,
                         unsigned int len);
-void nubus_get_rsrc_str(char *dest, const struct nubus_dirent *dirent,
-                        unsigned int maxlen);
+unsigned int nubus_get_rsrc_str(char *dest, const struct nubus_dirent *dirent,
+                                unsigned int maxlen);
+void nubus_seq_write_rsrc_mem(struct seq_file *m,
+                              const struct nubus_dirent *dirent,
+                              unsigned int len);
 
 /* Returns a pointer to the "standard" slot space. */
 static inline void *nubus_slot_addr(int slot)
-- 
2.13.6
