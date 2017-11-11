From: Finn Thain <fthain@telegraphics.com.au>
Subject: [PATCH 01/14] nubus: Avoid array underflow and overflow
Date: Sat, 11 Nov 2017 01:12:48 -0500 (EST)
Message-ID: <3ca0bf9d20a869575107b25ce16f70916a50bcbe.1510377368.git.fthain@telegraphics.com.au>
References: <cover.1510377368.git.fthain@telegraphics.com.au>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1510377368.git.fthain@telegraphics.com.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org

Check array indices. Avoid sprintf. Use buffers of sufficient size.
Use appropriate types for the parameters to nubus_get_rsrc_{mem,str}()
functions.

Tested-by: Stan Johnson <userm57@yahoo.com>
Signed-off-by: Finn Thain <fthain@telegraphics.com.au>
---
 drivers/nubus/nubus.c | 29 +++++++++++++++++------------
 drivers/nubus/proc.c  | 12 ++++++------
 include/linux/nubus.h | 10 ++++------
 3 files changed, 27 insertions(+), 24 deletions(-)

diff --git a/drivers/nubus/nubus.c b/drivers/nubus/nubus.c
index 4f50f30650cd..afbea40512a3 100644
--- a/drivers/nubus/nubus.c
+++ b/drivers/nubus/nubus.c
@@ -160,7 +160,7 @@ static unsigned char *nubus_dirptr(const struct nubus_dirent *nd)
    pointed to with offsets) out of the card ROM. */
 
 void nubus_get_rsrc_mem(void *dest, const struct nubus_dirent *dirent,
-			int len)
+                        unsigned int len)
 {
 	unsigned char *t = (unsigned char *)dest;
 	unsigned char *p = nubus_dirptr(dirent);
@@ -172,18 +172,22 @@ void nubus_get_rsrc_mem(void *dest, const struct nubus_dirent *dirent,
 }
 EXPORT_SYMBOL(nubus_get_rsrc_mem);
 
-void nubus_get_rsrc_str(void *dest, const struct nubus_dirent *dirent,
-			int len)
+void nubus_get_rsrc_str(char *dest, const struct nubus_dirent *dirent,
+                        unsigned int len)
 {
-	unsigned char *t = (unsigned char *)dest;
+	char *t = dest;
 	unsigned char *p = nubus_dirptr(dirent);
 
-	while (len) {
-		*t = nubus_get_rom(&p, 1, dirent->mask);
-		if (!*t++)
+	while (len > 1) {
+		unsigned char c = nubus_get_rom(&p, 1, dirent->mask);
+
+		if (!c)
 			break;
+		*t++ = c;
 		len--;
 	}
+	if (len > 0)
+		*t = '\0';
 }
 EXPORT_SYMBOL(nubus_get_rsrc_str);
 
@@ -467,7 +471,7 @@ nubus_get_functional_resource(struct nubus_board *board, int slot,
 		}
 		case NUBUS_RESID_NAME:
 		{
-			nubus_get_rsrc_str(dev->name, &ent, 64);
+			nubus_get_rsrc_str(dev->name, &ent, sizeof(dev->name));
 			pr_info("    name: %s\n", dev->name);
 			break;
 		}
@@ -527,7 +531,7 @@ static int __init nubus_get_vidnames(struct nubus_board *board,
 		/* Don't know what this is yet */
 		u16 id;
 		/* Longest one I've seen so far is 26 characters */
-		char name[32];
+		char name[36];
 	};
 
 	pr_info("    video modes supported:\n");
@@ -597,8 +601,8 @@ static int __init nubus_get_vendorinfo(struct nubus_board *board,
 		char name[64];
 
 		/* These are all strings, we think */
-		nubus_get_rsrc_str(name, &ent, 64);
-		if (ent.type > 5)
+		nubus_get_rsrc_str(name, &ent, sizeof(name));
+		if (ent.type < 1 || ent.type > 5)
 			ent.type = 5;
 		pr_info("    %s: %s\n", vendor_fields[ent.type - 1], name);
 	}
@@ -632,7 +636,8 @@ static int __init nubus_get_board_resource(struct nubus_board *board, int slot,
 			break;
 		}
 		case NUBUS_RESID_NAME:
-			nubus_get_rsrc_str(board->name, &ent, 64);
+			nubus_get_rsrc_str(board->name, &ent,
+			                   sizeof(board->name));
 			pr_info("    name: %s\n", board->name);
 			break;
 		case NUBUS_RESID_ICON:
diff --git a/drivers/nubus/proc.c b/drivers/nubus/proc.c
index e8f68f5732f1..a74e713a4f7f 100644
--- a/drivers/nubus/proc.c
+++ b/drivers/nubus/proc.c
@@ -72,10 +72,10 @@ static void nubus_proc_subdir(struct nubus_dev* dev,
 
 	/* Some of these are directories, others aren't */
 	while (nubus_readdir(dir, &ent) != -1) {
-		char name[8];
+		char name[9];
 		struct proc_dir_entry* e;
 		
-		sprintf(name, "%x", ent.type);
+		snprintf(name, sizeof(name), "%x", ent.type);
 		e = proc_create(name, S_IFREG | S_IRUGO | S_IWUSR, parent,
 				&nubus_proc_subdir_fops);
 		if (!e)
@@ -94,11 +94,11 @@ static void nubus_proc_populate(struct nubus_dev* dev,
 	/* We know these are all directories (board resource + one or
 	   more functional resources) */
 	while (nubus_readdir(root, &ent) != -1) {
-		char name[8];
+		char name[9];
 		struct proc_dir_entry* e;
 		struct nubus_dir dir;
 		
-		sprintf(name, "%x", ent.type);
+		snprintf(name, sizeof(name), "%x", ent.type);
 		e = proc_mkdir(name, parent);
 		if (!e) return;
 
@@ -118,7 +118,7 @@ int nubus_proc_attach_device(struct nubus_dev *dev)
 {
 	struct proc_dir_entry *e;
 	struct nubus_dir root;
-	char name[8];
+	char name[9];
 
 	if (dev == NULL) {
 		printk(KERN_ERR
@@ -134,7 +134,7 @@ int nubus_proc_attach_device(struct nubus_dev *dev)
 	}
 		
 	/* Create a directory */
-	sprintf(name, "%x", dev->board->slot);
+	snprintf(name, sizeof(name), "%x", dev->board->slot);
 	e = dev->procdir = proc_mkdir(name, proc_bus_nubus_dir);
 	if (!e)
 		return -ENOMEM;
diff --git a/include/linux/nubus.h b/include/linux/nubus.h
index 6165b2c62040..b5c4683737e3 100644
--- a/include/linux/nubus.h
+++ b/include/linux/nubus.h
@@ -125,10 +125,8 @@ int nubus_rewinddir(struct nubus_dir* dir);
 /* Things to do with directory entries */
 int nubus_get_subdir(const struct nubus_dirent* ent,
 		     struct nubus_dir* dir);
-void nubus_get_rsrc_mem(void* dest,
-			const struct nubus_dirent *dirent,
-			int len);
-void nubus_get_rsrc_str(void* dest,
-			const struct nubus_dirent *dirent,
-			int maxlen);
+void nubus_get_rsrc_mem(void *dest, const struct nubus_dirent *dirent,
+                        unsigned int len);
+void nubus_get_rsrc_str(char *dest, const struct nubus_dirent *dirent,
+                        unsigned int maxlen);
 #endif /* LINUX_NUBUS_H */
-- 
2.13.6
