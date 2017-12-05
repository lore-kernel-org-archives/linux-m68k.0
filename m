From: Finn Thain <fthain@telegraphics.com.au>
Subject: [PATCH v3 08/14] nubus: Clean up whitespace
Date: Tue,  5 Dec 2017 01:20:02 -0500 (EST)
Message-ID: <b09e5e22d8d729e7f7ba73a35cef8691c3c40e3e.1512454057.git.fthain@telegraphics.com.au>
References: <cover.1512454057.git.fthain@telegraphics.com.au>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1512454057.git.fthain@telegraphics.com.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org

Tested-by: Stan Johnson <userm57@yahoo.com>
Signed-off-by: Finn Thain <fthain@telegraphics.com.au>
---
 include/linux/nubus.h | 54 +++++++++++++++++++++++++--------------------------
 1 file changed, 27 insertions(+), 27 deletions(-)

diff --git a/include/linux/nubus.h b/include/linux/nubus.h
index 46e4d983feac..84f2e0fa1898 100644
--- a/include/linux/nubus.h
+++ b/include/linux/nubus.h
@@ -28,9 +28,9 @@ struct nubus_dirent {
 };
 
 struct nubus_board {
-	struct nubus_board* next;
-	struct nubus_dev* first_dev;
-	
+	struct nubus_board *next;
+	struct nubus_dev *first_dev;
+
 	/* Only 9-E actually exist, though 0-8 are also theoretically
 	   possible, and 0 is a special case which represents the
 	   motherboard and onboard peripherals (Ethernet, video) */
@@ -39,10 +39,10 @@ struct nubus_board {
 	char name[64];
 
 	/* Format block */
-	unsigned char* fblock;
+	unsigned char *fblock;
 	/* Root directory (does *not* always equal fblock + doffset!) */
-	unsigned char* directory;
-	
+	unsigned char *directory;
+
 	unsigned long slot_addr;
 	/* Offset to root directory (sometimes) */
 	unsigned long doffset;
@@ -60,7 +60,7 @@ struct nubus_board {
 
 struct nubus_dev {
 	/* Next link in device list */
-	struct nubus_dev* next;
+	struct nubus_dev *next;
 
 	/* The functional resource ID of this device */
 	unsigned char resid;
@@ -70,17 +70,17 @@ struct nubus_dev {
 	unsigned short type;
 	unsigned short dr_sw;
 	unsigned short dr_hw;
-	
+
 	/* Functional directory */
-	unsigned char* directory;
+	unsigned char *directory;
 	/* Much of our info comes from here */
-	struct nubus_board* board;
+	struct nubus_board *board;
 };
 
 /* This is all NuBus devices (used to find devices later on) */
-extern struct nubus_dev* nubus_devices;
+extern struct nubus_dev *nubus_devices;
 /* This is all NuBus cards */
-extern struct nubus_board* nubus_boards;
+extern struct nubus_board *nubus_boards;
 
 /* Generic NuBus interface functions, modelled after the PCI interface */
 #ifdef CONFIG_PROC_FS
@@ -91,38 +91,38 @@ static inline void nubus_proc_init(void) {}
 
 int nubus_proc_attach_device(struct nubus_dev *dev);
 /* If we need more precision we can add some more of these */
-struct nubus_dev* nubus_find_type(unsigned short category,
+struct nubus_dev *nubus_find_type(unsigned short category,
 				  unsigned short type,
-				  const struct nubus_dev* from);
+				  const struct nubus_dev *from);
 /* Might have more than one device in a slot, you know... */
-struct nubus_dev* nubus_find_slot(unsigned int slot,
-				  const struct nubus_dev* from);
+struct nubus_dev *nubus_find_slot(unsigned int slot,
+				  const struct nubus_dev *from);
 
 /* These are somewhat more NuBus-specific.  They all return 0 for
    success and -1 for failure, as you'd expect. */
 
 /* The root directory which contains the board and functional
    directories */
-int nubus_get_root_dir(const struct nubus_board* board,
-		       struct nubus_dir* dir);
+int nubus_get_root_dir(const struct nubus_board *board,
+		       struct nubus_dir *dir);
 /* The board directory */
 int nubus_get_board_dir(const struct nubus_board* board,
 			struct nubus_dir* dir);
 /* The functional directory */
-int nubus_get_func_dir(const struct nubus_dev* dev,
-		       struct nubus_dir* dir);
+int nubus_get_func_dir(const struct nubus_dev *dev,
+		       struct nubus_dir *dir);
 
 /* These work on any directory gotten via the above */
-int nubus_readdir(struct nubus_dir* dir,
-		  struct nubus_dirent* ent);
-int nubus_find_rsrc(struct nubus_dir* dir,
+int nubus_readdir(struct nubus_dir *dir,
+		  struct nubus_dirent *ent);
+int nubus_find_rsrc(struct nubus_dir *dir,
 		    unsigned char rsrc_type,
-		    struct nubus_dirent* ent);
-int nubus_rewinddir(struct nubus_dir* dir);
+		    struct nubus_dirent *ent);
+int nubus_rewinddir(struct nubus_dir *dir);
 
 /* Things to do with directory entries */
-int nubus_get_subdir(const struct nubus_dirent* ent,
-		     struct nubus_dir* dir);
+int nubus_get_subdir(const struct nubus_dirent *ent,
+		     struct nubus_dir *dir);
 void nubus_get_rsrc_mem(void *dest, const struct nubus_dirent *dirent,
                         unsigned int len);
 void nubus_get_rsrc_str(char *dest, const struct nubus_dirent *dirent,
-- 
2.13.6
