From: Finn Thain <fthain@telegraphics.com.au>
Subject: [PATCH v3 10/14] nubus: Rework /proc/bus/nubus/s/ implementation
Date: Tue,  5 Dec 2017 01:20:02 -0500 (EST)
Message-ID: <8b335dfd88dbc33cb9fec268eaf0bb4edabfb333.1512454057.git.fthain@telegraphics.com.au>
References: <cover.1512454057.git.fthain@telegraphics.com.au>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1512454057.git.fthain@telegraphics.com.au>
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
in nubus.c. Let's not duplicate that logic in proc.c.

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
 drivers/nubus/nubus.c | 118 ++++++++++++++++++++------
 drivers/nubus/proc.c  | 223 ++++++++++++++++++++++++++++++--------------------
 include/linux/nubus.h |  37 ++++++++-
 3 files changed, 259 insertions(+), 119 deletions(-)

diff --git a/drivers/nubus/nubus.c b/drivers/nubus/nubus.c
index a7b480534a17..b0d8aa721173 100644
--- a/drivers/nubus/nubus.c
+++ b/drivers/nubus/nubus.c
@@ -15,6 +15,7 @@
 #include <linux/errno.h>
 #include <linux/init.h>
 #include <linux/module.h>
+#include <linux/seq_file.h>
 #include <linux/slab.h>
 #include <asm/setup.h>
 #include <asm/page.h>
@@ -146,7 +147,7 @@ static inline void *nubus_rom_addr(int slot)
 	return (void *)(0xF1000000 + (slot << 24));
 }
 
-static unsigned char *nubus_dirptr(const struct nubus_dirent *nd)
+unsigned char *nubus_dirptr(const struct nubus_dirent *nd)
 {
 	unsigned char *p = nd->base;
 
@@ -173,8 +174,8 @@ void nubus_get_rsrc_mem(void *dest, const struct nubus_dirent *dirent,
 }
 EXPORT_SYMBOL(nubus_get_rsrc_mem);
 
-void nubus_get_rsrc_str(char *dest, const struct nubus_dirent *dirent,
-                        unsigned int len)
+unsigned int nubus_get_rsrc_str(char *dest, const struct nubus_dirent *dirent,
+                                unsigned int len)
 {
 	char *t = dest;
 	unsigned char *p = nubus_dirptr(dirent);
@@ -189,9 +190,33 @@ void nubus_get_rsrc_str(char *dest, const struct nubus_dirent *dirent,
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
+
 int nubus_get_root_dir(const struct nubus_board *board,
 		       struct nubus_dir *dir)
 {
@@ -326,35 +351,35 @@ EXPORT_SYMBOL(nubus_find_rsrc);
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
@@ -366,37 +391,42 @@ static int __init nubus_get_display_vidmode(struct nubus_board *board,
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
@@ -406,16 +436,19 @@ static int __init nubus_get_network_resource(struct nubus_dev *dev,
 
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
@@ -426,6 +459,7 @@ static int __init nubus_get_cpu_resource(struct nubus_dev *dev,
 		nubus_get_rsrc_mem(&meminfo, ent, 8);
 		pr_debug("    memory: [ 0x%08lx 0x%08lx ]\n",
 			meminfo[0], meminfo[1]);
+		nubus_proc_add_rsrc_mem(procdir, ent, 8);
 		break;
 	}
 	case NUBUS_RESID_ROMINFO:
@@ -435,31 +469,35 @@ static int __init nubus_get_cpu_resource(struct nubus_dev *dev,
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
@@ -474,6 +512,7 @@ nubus_get_functional_resource(struct nubus_board *board, int slot,
 
 	pr_debug("  Functional resource 0x%02x:\n", parent->type);
 	nubus_get_subdir(parent, &dir);
+	dir.procdir = nubus_proc_add_rsrc_dir(board->procdir, parent, board);
 
 	/* Actually we should probably panic if this fails */
 	if ((dev = kzalloc(sizeof(*dev), GFP_ATOMIC)) == NULL)
@@ -495,14 +534,17 @@ nubus_get_functional_resource(struct nubus_board *board, int slot,
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
+			nubus_proc_add_rsrc_mem(dir.procdir, &ent, len + 1);
 			break;
 		}
 		case NUBUS_RESID_DRVRDIR:
@@ -511,7 +553,7 @@ nubus_get_functional_resource(struct nubus_board *board, int slot,
 			   use this :-) */
 			pr_debug("    driver directory offset: 0x%06x\n",
 				ent.data);
-			nubus_get_block_rsrc_dir(board, &ent);
+			nubus_get_block_rsrc_dir(board, dir.procdir, &ent);
 			break;
 		}
 		case NUBUS_RESID_MINOR_BASEOS:
@@ -523,6 +565,7 @@ nubus_get_functional_resource(struct nubus_board *board, int slot,
 
 			nubus_get_rsrc_mem(&base_offset, &ent, 4);
 			pr_debug("    memory offset: 0x%08x\n", base_offset);
+			nubus_proc_add_rsrc_mem(dir.procdir, &ent, 4);
 			break;
 		}
 		case NUBUS_RESID_MINOR_LENGTH:
@@ -532,18 +575,21 @@ nubus_get_functional_resource(struct nubus_board *board, int slot,
 
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
 
@@ -552,7 +598,8 @@ nubus_get_functional_resource(struct nubus_board *board, int slot,
 
 /* This is *really* cool. */
 static int __init nubus_get_icon(struct nubus_board *board,
-				 const struct nubus_dirent *ent)
+                                 struct proc_dir_entry *procdir,
+                                 const struct nubus_dirent *ent)
 {
 	/* Should be 32x32 if my memory serves me correctly */
 	u32 icon[32];
@@ -564,12 +611,14 @@ static int __init nubus_get_icon(struct nubus_board *board,
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
@@ -578,15 +627,18 @@ static int __init nubus_get_vendorinfo(struct nubus_board *board,
 
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
+		nubus_proc_add_rsrc_mem(dir.procdir, &ent, len + 1);
 	}
 	return 0;
 }
@@ -599,6 +651,7 @@ static int __init nubus_get_board_resource(struct nubus_board *board, int slot,
 
 	pr_debug("  Board resource 0x%02x:\n", parent->type);
 	nubus_get_subdir(parent, &dir);
+	dir.procdir = nubus_proc_add_rsrc_dir(board->procdir, parent, board);
 
 	while (nubus_readdir(&dir, &ent) != -1) {
 		switch (ent.type) {
@@ -614,48 +667,61 @@ static int __init nubus_get_board_resource(struct nubus_board *board, int slot,
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
+			nubus_proc_add_rsrc_mem(dir.procdir, &ent, len + 1);
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
@@ -746,6 +812,8 @@ static struct nubus_board * __init nubus_add_board(int slot, int bytelanes)
 	if (ent.type < 1 || ent.type > 127)
 		pr_warn("Slot %X: Board resource ID is invalid!\n", slot);
 
+	board->procdir = nubus_proc_add_board(board);
+
 	nubus_get_board_resource(board, slot, &ent);
 
 	while (nubus_readdir(&dir, &ent) != -1) {
@@ -833,8 +901,8 @@ static int __init nubus_init(void)
 	if (!MACH_IS_MAC)
 		return 0;
 
-	nubus_scan_bus();
 	nubus_proc_init();
+	nubus_scan_bus();
 	return 0;
 }
 
diff --git a/drivers/nubus/proc.c b/drivers/nubus/proc.c
index 41ec859bdd8b..ad8b0648a6c0 100644
--- a/drivers/nubus/proc.c
+++ b/drivers/nubus/proc.c
@@ -11,24 +11,28 @@
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
@@ -61,96 +65,142 @@ static const struct file_operations nubus_devices_proc_fops = {
 
 static struct proc_dir_entry *proc_bus_nubus_dir;
 
-static const struct file_operations nubus_proc_subdir_fops = {
-#warning Need to set some I/O handlers here
+/*
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
+/* The PDE private data for any directory under /proc/bus/nubus/x/
+ * is the bytelanes value for the board in slot x.
+ */
+
+struct proc_dir_entry *nubus_proc_add_rsrc_dir(struct proc_dir_entry *procdir,
+                                               const struct nubus_dirent *ent,
+                                               struct nubus_board *board)
+{
+	char name[9];
+	int lanes = board->lanes;
+
+	if (!procdir)
+		return NULL;
+	snprintf(name, sizeof(name), "%x", ent->type);
+	return proc_mkdir_data(name, S_IRUGO | S_IXUGO, procdir,
+	                       (void *)lanes);
+}
+
+/* The PDE private data for a file under /proc/bus/nubus/x/ is a pointer to
+ * an instance of the following structure, which gives the location and size
+ * of the resource data in the slot ROM. For slot resources which hold only a
+ * small integer, this integer value is stored directly and size is set to 0.
+ * A NULL private data pointer indicates an unrecognized resource.
+ */
+
+struct nubus_proc_pde_data {
+	unsigned char *res_ptr;
+	unsigned int res_size;
 };
 
-static void nubus_proc_subdir(struct nubus_dev* dev,
-			      struct proc_dir_entry* parent,
-			      struct nubus_dir* dir)
+static struct nubus_proc_pde_data *
+nubus_proc_alloc_pde_data(unsigned char *ptr, unsigned int size)
 {
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
+	struct nubus_proc_pde_data *pde_data;
+
+	pde_data = kmalloc(sizeof(*pde_data), GFP_KERNEL);
+	if (!pde_data)
+		return NULL;
+
+	pde_data->res_ptr = ptr;
+	pde_data->res_size = size;
+	return pde_data;
 }
 
-/* Can't do this recursively since the root directory is structured
-   somewhat differently from the subdirectories */
-static void nubus_proc_populate(struct nubus_dev* dev,
-				struct proc_dir_entry* parent,
-				struct nubus_dir* root)
+static int nubus_proc_rsrc_show(struct seq_file *m, void *v)
 {
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
+	struct inode *inode = m->private;
+	struct nubus_proc_pde_data *pde_data;
+
+	pde_data = PDE_DATA(inode);
+	if (!pde_data)
+		return 0;
+
+	if (pde_data->res_size > m->size)
+		return -EFBIG;
+
+	if (pde_data->res_size) {
+		int lanes = (int)proc_get_parent_data(inode);
+		struct nubus_dirent ent;
+
+		if (!lanes)
+			return 0;
+
+		ent.mask = lanes;
+		ent.base = pde_data->res_ptr;
+		ent.data = 0;
+		nubus_seq_write_rsrc_mem(m, &ent, pde_data->res_size);
+	} else {
+		unsigned int data = (unsigned int)pde_data->res_ptr;
+
+		seq_putc(m, data >> 16);
+		seq_putc(m, data >> 8);
+		seq_putc(m, data >> 0);
 	}
+	return 0;
 }
 
-int nubus_proc_attach_device(struct nubus_dev *dev)
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
+void nubus_proc_add_rsrc_mem(struct proc_dir_entry *procdir,
+                             const struct nubus_dirent *ent,
+                             unsigned int size)
 {
-	struct proc_dir_entry *e;
-	struct nubus_dir root;
 	char name[9];
+	struct nubus_proc_pde_data *pde_data;
 
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
+	if (!procdir)
+		return;
 
-	/* Create a directory */
-	snprintf(name, sizeof(name), "%x", dev->board->slot);
-	e = proc_mkdir(name, proc_bus_nubus_dir);
-	dev->board->procdir = e;
-	if (!e)
-		return -ENOMEM;
+	snprintf(name, sizeof(name), "%x", ent->type);
+	if (size)
+		pde_data = nubus_proc_alloc_pde_data(nubus_dirptr(ent), size);
+	else
+		pde_data = NULL;
+	proc_create_data(name, S_IFREG | S_IRUGO, procdir,
+	                 &nubus_proc_rsrc_fops, pde_data);
+}
 
-	/* Now recursively populate it with files */
-	nubus_get_root_dir(dev->board, &root);
-	nubus_proc_populate(dev, e, &root);
+void nubus_proc_add_rsrc(struct proc_dir_entry *procdir,
+                         const struct nubus_dirent *ent)
+{
+	char name[9];
+	unsigned char *data = (unsigned char *)ent->data;
 
-	return 0;
+	if (!procdir)
+		return;
+
+	snprintf(name, sizeof(name), "%x", ent->type);
+	proc_create_data(name, S_IFREG | S_IRUGO, procdir,
+	                 &nubus_proc_rsrc_fops,
+	                 nubus_proc_alloc_pde_data(data, 0));
 }
-EXPORT_SYMBOL(nubus_proc_attach_device);
 
 /*
  * /proc/nubus stuff
@@ -219,18 +269,11 @@ static const struct file_operations nubus_proc_fops = {
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
+	if (!proc_bus_nubus_dir)
+		return;
 	proc_create("devices", 0, proc_bus_nubus_dir, &nubus_devices_proc_fops);
-	proc_bus_nubus_add_devices();
 }
diff --git a/include/linux/nubus.h b/include/linux/nubus.h
index 84f2e0fa1898..0e40c9d6b977 100644
--- a/include/linux/nubus.h
+++ b/include/linux/nubus.h
@@ -13,11 +13,15 @@
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
@@ -84,12 +88,33 @@ extern struct nubus_board *nubus_boards;
 
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
 
-int nubus_proc_attach_device(struct nubus_dev *dev);
 /* If we need more precision we can add some more of these */
 struct nubus_dev *nubus_find_type(unsigned short category,
 				  unsigned short type,
@@ -125,8 +150,12 @@ int nubus_get_subdir(const struct nubus_dirent *ent,
 		     struct nubus_dir *dir);
 void nubus_get_rsrc_mem(void *dest, const struct nubus_dirent *dirent,
                         unsigned int len);
-void nubus_get_rsrc_str(char *dest, const struct nubus_dirent *dirent,
-                        unsigned int maxlen);
+unsigned int nubus_get_rsrc_str(char *dest, const struct nubus_dirent *dirent,
+                                unsigned int len);
+void nubus_seq_write_rsrc_mem(struct seq_file *m,
+                              const struct nubus_dirent *dirent,
+                              unsigned int len);
+unsigned char *nubus_dirptr(const struct nubus_dirent *nd);
 
 /* Returns a pointer to the "standard" slot space. */
 static inline void *nubus_slot_addr(int slot)
-- 
2.13.6
