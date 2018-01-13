From: Finn Thain <fthain@telegraphics.com.au>
Subject: [PATCH v5 07/14] nubus: Remove redundant code
Date: Sat, 13 Jan 2018 17:37:13 -0500 (EST)
Message-ID: <1c5afcdeeccedae82022c075cd526b8cc6b70c66.1515814167.git.fthain@telegraphics.com.au>
References: <cover.1515814167.git.fthain@telegraphics.com.au>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:43806 "EHLO
        kvm5.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753953AbeAMWhP (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Sat, 13 Jan 2018 17:37:15 -0500
In-Reply-To: <cover.1515814167.git.fthain@telegraphics.com.au>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org, linux-kernel@vger.kernel.org

Eliminate unused values from struct nubus_dev to save wasted memory
(a Radius PrecisionColor 24X card has about 95 functional resources
and up to six such cards may be fitted). Also remove redundant static
variable initialization, an unreachable !MACH_IS_MAC conditional,
the unused nubus_find_device() function, the bogus get_nubus_list()
prototype and the pointless card_present temporary variable.

Tested-by: Stan Johnson <userm57@yahoo.com>
Signed-off-by: Finn Thain <fthain@telegraphics.com.au>
---
 drivers/nubus/nubus.c | 57 ++++++++++++++++++++-------------------------------
 drivers/nubus/proc.c  |  2 --
 include/linux/nubus.h | 17 +--------------
 3 files changed, 23 insertions(+), 53 deletions(-)

diff --git a/drivers/nubus/nubus.c b/drivers/nubus/nubus.c
index e7c7e49a074a..4ae5c420f13f 100644
--- a/drivers/nubus/nubus.c
+++ b/drivers/nubus/nubus.c
@@ -282,23 +282,6 @@ EXPORT_SYMBOL(nubus_rewinddir);
 /* Driver interface functions, more or less like in pci.c */
 
 struct nubus_dev*
-nubus_find_device(unsigned short category, unsigned short type,
-		  unsigned short dr_hw, unsigned short dr_sw,
-		  const struct nubus_dev *from)
-{
-	struct nubus_dev *itor = from ? from->next : nubus_devices;
-
-	while (itor) {
-		if (itor->category == category && itor->type == type &&
-		    itor->dr_hw == dr_hw && itor->dr_sw == dr_sw)
-			return itor;
-		itor = itor->next;
-	}
-	return NULL;
-}
-EXPORT_SYMBOL(nubus_find_device);
-
-struct nubus_dev*
 nubus_find_type(unsigned short category, unsigned short type,
 		const struct nubus_dev *from)
 {
@@ -469,8 +452,10 @@ nubus_get_functional_resource(struct nubus_board *board, int slot,
 		}
 		case NUBUS_RESID_NAME:
 		{
-			nubus_get_rsrc_str(dev->name, &ent, sizeof(dev->name));
-			pr_debug("    name: %s\n", dev->name);
+			char name[64];
+
+			nubus_get_rsrc_str(name, &ent, sizeof(name));
+			pr_debug("    name: %s\n", name);
 			break;
 		}
 		case NUBUS_RESID_DRVRDIR:
@@ -479,32 +464,39 @@ nubus_get_functional_resource(struct nubus_board *board, int slot,
 			   use this :-) */
 			struct nubus_dir drvr_dir;
 			struct nubus_dirent drvr_ent;
+			unsigned char *driver;
 
 			nubus_get_subdir(&ent, &drvr_dir);
 			nubus_readdir(&drvr_dir, &drvr_ent);
-			dev->driver = nubus_dirptr(&drvr_ent);
-			pr_debug("    driver at: 0x%p\n", dev->driver);
+			driver = nubus_dirptr(&drvr_ent);
+			pr_debug("    driver at: 0x%p\n", driver);
 			break;
 		}
 		case NUBUS_RESID_MINOR_BASEOS:
+		{
 			/* We will need this in order to support
 			   multiple framebuffers.  It might be handy
 			   for Ethernet as well */
-			nubus_get_rsrc_mem(&dev->iobase, &ent, 4);
-			pr_debug("    memory offset: 0x%08lx\n", dev->iobase);
+			u32 base_offset;
+
+			nubus_get_rsrc_mem(&base_offset, &ent, 4);
+			pr_debug("    memory offset: 0x%08x\n", base_offset);
 			break;
+		}
 		case NUBUS_RESID_MINOR_LENGTH:
+		{
 			/* Ditto */
-			nubus_get_rsrc_mem(&dev->iosize, &ent, 4);
-			pr_debug("    memory length: 0x%08lx\n", dev->iosize);
+			u32 length;
+
+			nubus_get_rsrc_mem(&length, &ent, 4);
+			pr_debug("    memory length: 0x%08x\n", length);
 			break;
+		}
 		case NUBUS_RESID_FLAGS:
-			dev->flags = ent.data;
-			pr_debug("    flags: 0x%06x\n", dev->flags);
+			pr_debug("    flags: 0x%06x\n", ent.data);
 			break;
 		case NUBUS_RESID_HWDEVID:
-			dev->hwdevid = ent.data;
-			pr_debug("    hwdevid: 0x%06x\n", dev->hwdevid);
+			pr_debug("    hwdevid: 0x%06x\n", ent.data);
 			break;
 		default:
 			/* Local/Private resources have their own
@@ -798,11 +790,8 @@ static void __init nubus_probe_slot(int slot)
 
 	rp = nubus_rom_addr(slot);
 	for (i = 4; i; i--) {
-		int card_present;
-
 		rp--;
-		card_present = hwreg_present(rp);
-		if (!card_present)
+		if (!hwreg_present(rp))
 			continue;
 
 		dp = *rp;
@@ -839,8 +828,6 @@ static int __init nubus_init(void)
 	if (!MACH_IS_MAC)
 		return 0;
 
-	nubus_devices = NULL;
-	nubus_boards = NULL;
 	nubus_scan_bus();
 	nubus_proc_init();
 	return 0;
diff --git a/drivers/nubus/proc.c b/drivers/nubus/proc.c
index 91211192f36f..41ec859bdd8b 100644
--- a/drivers/nubus/proc.c
+++ b/drivers/nubus/proc.c
@@ -230,8 +230,6 @@ void __init proc_bus_nubus_add_devices(void)
 void __init nubus_proc_init(void)
 {
 	proc_create("nubus", 0, NULL, &nubus_proc_fops);
-	if (!MACH_IS_MAC)
-		return;
 	proc_bus_nubus_dir = proc_mkdir("bus/nubus", NULL);
 	proc_create("devices", 0, proc_bus_nubus_dir, &nubus_devices_proc_fops);
 	proc_bus_nubus_add_devices();
diff --git a/include/linux/nubus.h b/include/linux/nubus.h
index 2245430e1357..3c7b236074b3 100644
--- a/include/linux/nubus.h
+++ b/include/linux/nubus.h
@@ -70,16 +70,6 @@ struct nubus_dev {
 	unsigned short type;
 	unsigned short dr_sw;
 	unsigned short dr_hw;
-	/* This is the device's name rather than the board's.
-	   Sometimes they are different.  Usually the board name is
-	   more correct. */
-	char name[64];
-	/* MacOS driver (I kid you not) */
-	unsigned char* driver;
-	/* Actually this is an offset */
-	unsigned long iobase;
-	unsigned long iosize;
-	unsigned char flags, hwdevid;
 	
 	/* Functional directory */
 	unsigned char* directory;
@@ -98,14 +88,9 @@ extern void nubus_proc_init(void);
 #else
 static inline void nubus_proc_init(void) {}
 #endif
-int get_nubus_list(char *buf);
+
 int nubus_proc_attach_device(struct nubus_dev *dev);
 /* If we need more precision we can add some more of these */
-struct nubus_dev* nubus_find_device(unsigned short category,
-				    unsigned short type,
-				    unsigned short dr_hw,
-				    unsigned short dr_sw,
-				    const struct nubus_dev* from);
 struct nubus_dev* nubus_find_type(unsigned short category,
 				  unsigned short type,
 				  const struct nubus_dev* from);
-- 
2.13.6
