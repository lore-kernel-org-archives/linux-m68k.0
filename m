From: Finn Thain <fthain@telegraphics.com.au>
Subject: [PATCH v2 09/13] nubus: Generalize block resource handling
Date: Fri, 17 Nov 2017 21:30:11 -0500 (EST)
Message-ID: <837be075ddaded2440637def8de567acc0286ca6.1510960933.git.fthain@telegraphics.com.au>
References: <cover.1510960933.git.fthain@telegraphics.com.au>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:34562 "EHLO
        kvm5.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1161403AbdKRCaN (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Fri, 17 Nov 2017 21:30:13 -0500
In-Reply-To: <cover.1510960933.git.fthain@telegraphics.com.au>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org, linux-kernel@vger.kernel.org

Scrap the specialized code to unpack video mode name resources and
driver resources. It isn't useful.
Instead, add a re-usable function to handle lists of block resources of
any kind, and descend into the mode table resource directory.
Rename callers as nubus_get_foo(), consistent with their purpose and
with related functions in the same file.

Tested-by: Stan Johnson <userm57@yahoo.com>
Signed-off-by: Finn Thain <fthain@telegraphics.com.au>
---
 drivers/nubus/nubus.c | 123 ++++++++++++++++++++++++++------------------------
 1 file changed, 65 insertions(+), 58 deletions(-)

diff --git a/drivers/nubus/nubus.c b/drivers/nubus/nubus.c
index 7a0af37e52b8..0ca8a7a9be2b 100644
--- a/drivers/nubus/nubus.c
+++ b/drivers/nubus/nubus.c
@@ -331,16 +331,63 @@ EXPORT_SYMBOL(nubus_find_rsrc);
    among other things.  The rest of it should go in the /proc code.
    For now, we just use it to give verbose boot logs. */
 
-static int __init nubus_show_display_resource(struct nubus_dev *dev,
-					      const struct nubus_dirent *ent)
+static int __init nubus_get_block_rsrc_dir(struct nubus_board *board,
+                                           const struct nubus_dirent *parent)
+{
+	struct nubus_dir dir;
+	struct nubus_dirent ent;
+
+	nubus_get_subdir(parent, &dir);
+
+	while (nubus_readdir(&dir, &ent) != -1) {
+		u32 size;
+
+		nubus_get_rsrc_mem(&size, &ent, 4);
+		pr_debug("        block (0x%x), size %d\n", ent.type, size);
+	}
+	return 0;
+}
+
+static int __init nubus_get_display_vidmode(struct nubus_board *board,
+                                            const struct nubus_dirent *parent)
+{
+	struct nubus_dir dir;
+	struct nubus_dirent ent;
+
+	nubus_get_subdir(parent, &dir);
+
+	while (nubus_readdir(&dir, &ent) != -1) {
+		switch (ent.type) {
+		case 1: /* mVidParams */
+		case 2: /* mTable */
+		{
+			u32 size;
+
+			nubus_get_rsrc_mem(&size, &ent, 4);
+			pr_debug("        block (0x%x), size %d\n", ent.type,
+				size);
+			break;
+		}
+		default:
+			pr_debug("        unknown resource 0x%02x, data 0x%06x\n",
+				ent.type, ent.data);
+		}
+	}
+	return 0;
+}
+
+static int __init nubus_get_display_resource(struct nubus_dev *dev,
+                                             const struct nubus_dirent *ent)
 {
 	switch (ent->type) {
 	case NUBUS_RESID_GAMMADIR:
 		pr_debug("    gamma directory offset: 0x%06x\n", ent->data);
+		nubus_get_block_rsrc_dir(dev->board, ent);
 		break;
 	case 0x0080 ... 0x0085:
 		pr_debug("    mode 0x%02x info offset: 0x%06x\n",
 			ent->type, ent->data);
+		nubus_get_display_vidmode(dev->board, ent);
 		break;
 	default:
 		pr_debug("    unknown resource 0x%02x, data 0x%06x\n",
@@ -349,8 +396,8 @@ static int __init nubus_show_display_resource(struct nubus_dev *dev,
 	return 0;
 }
 
-static int __init nubus_show_network_resource(struct nubus_dev *dev,
-					      const struct nubus_dirent *ent)
+static int __init nubus_get_network_resource(struct nubus_dev *dev,
+                                             const struct nubus_dirent *ent)
 {
 	switch (ent->type) {
 	case NUBUS_RESID_MAC_ADDRESS:
@@ -368,8 +415,8 @@ static int __init nubus_show_network_resource(struct nubus_dev *dev,
 	return 0;
 }
 
-static int __init nubus_show_cpu_resource(struct nubus_dev *dev,
-					  const struct nubus_dirent *ent)
+static int __init nubus_get_cpu_resource(struct nubus_dev *dev,
+                                         const struct nubus_dirent *ent)
 {
 	switch (ent->type) {
 	case NUBUS_RESID_MEMINFO:
@@ -397,18 +444,18 @@ static int __init nubus_show_cpu_resource(struct nubus_dev *dev,
 	return 0;
 }
 
-static int __init nubus_show_private_resource(struct nubus_dev *dev,
-					      const struct nubus_dirent *ent)
+static int __init nubus_get_private_resource(struct nubus_dev *dev,
+                                             const struct nubus_dirent *ent)
 {
 	switch (dev->category) {
 	case NUBUS_CAT_DISPLAY:
-		nubus_show_display_resource(dev, ent);
+		nubus_get_display_resource(dev, ent);
 		break;
 	case NUBUS_CAT_NETWORK:
-		nubus_show_network_resource(dev, ent);
+		nubus_get_network_resource(dev, ent);
 		break;
 	case NUBUS_CAT_CPU:
-		nubus_show_cpu_resource(dev, ent);
+		nubus_get_cpu_resource(dev, ent);
 		break;
 	default:
 		pr_debug("    unknown resource 0x%02x, data 0x%06x\n",
@@ -462,14 +509,9 @@ nubus_get_functional_resource(struct nubus_board *board, int slot,
 		{
 			/* MacOS driver.  If we were NetBSD we might
 			   use this :-) */
-			struct nubus_dir drvr_dir;
-			struct nubus_dirent drvr_ent;
-			unsigned char *driver;
-
-			nubus_get_subdir(&ent, &drvr_dir);
-			nubus_readdir(&drvr_dir, &drvr_ent);
-			driver = nubus_dirptr(&drvr_ent);
-			pr_debug("    driver at: 0x%p\n", driver);
+			pr_debug("    driver directory offset: 0x%06x\n",
+				ent.data);
+			nubus_get_block_rsrc_dir(board, &ent);
 			break;
 		}
 		case NUBUS_RESID_MINOR_BASEOS:
@@ -501,50 +543,13 @@ nubus_get_functional_resource(struct nubus_board *board, int slot,
 		default:
 			/* Local/Private resources have their own
 			   function */
-			nubus_show_private_resource(dev, &ent);
+			nubus_get_private_resource(dev, &ent);
 		}
 	}
 
 	return dev;
 }
 
-/* This is cool. */
-static int __init nubus_get_vidnames(struct nubus_board *board,
-				     const struct nubus_dirent *parent)
-{
-	struct nubus_dir dir;
-	struct nubus_dirent ent;
-
-	/* FIXME: obviously we want to put this in a header file soon */
-	struct vidmode {
-		u32 size;
-		/* Don't know what this is yet */
-		u16 id;
-		/* Longest one I've seen so far is 26 characters */
-		char name[36];
-	};
-
-	pr_debug("    video modes supported:\n");
-	nubus_get_subdir(parent, &dir);
-
-	while (nubus_readdir(&dir, &ent) != -1) {
-		struct vidmode mode;
-		u32 size;
-
-		/* First get the length */
-		nubus_get_rsrc_mem(&size, &ent, 4);
-
-		/* Now clobber the whole thing */
-		if (size > sizeof(mode) - 1)
-			size = sizeof(mode) - 1;
-		memset(&mode, 0, sizeof(mode));
-		nubus_get_rsrc_mem(&mode, &ent, size);
-		pr_debug("      0x%02x: 0x%04x %s\n", ent.type,
-			mode.id, mode.name);
-	}
-	return 0;
-}
-
 /* This is *really* cool. */
 static int __init nubus_get_icon(struct nubus_board *board,
 				 const struct nubus_dirent *ent)
@@ -639,7 +644,9 @@ static int __init nubus_get_board_resource(struct nubus_board *board, int slot,
 			break;
 			/* WTF isn't this in the functional resources? */
 		case NUBUS_RESID_VIDNAMES:
-			nubus_get_vidnames(board, &ent);
+			pr_debug("    vidnames directory offset: 0x%06x\n",
+				ent.data);
+			nubus_get_block_rsrc_dir(board, &ent);
 			break;
 			/* Same goes for this */
 		case NUBUS_RESID_VIDMODES:
-- 
2.13.6
