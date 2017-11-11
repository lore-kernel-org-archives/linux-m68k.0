From: Finn Thain <fthain@telegraphics.com.au>
Subject: [PATCH 04/14] nubus: Fix log spam
Date: Sat, 11 Nov 2017 01:12:48 -0500 (EST)
Message-ID: <0c2f94698a76d320786aac770d2db006fd4e5764.1510377368.git.fthain@telegraphics.com.au>
References: <cover.1510377368.git.fthain@telegraphics.com.au>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1510377368.git.fthain@telegraphics.com.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org

Testing shows that a single Radius PrecisionColor 24X display board,
which has 95 functional resources, produces over a thousand lines of
log messages. Suppress these messages with pr_debug().
Remove some redundant messages relating to nubus_get_subdir() calls.
Fix the format block debug messages which has the sequence of entries
backwards (my bad).
Move the "Scanning slots" message to its proper location.

Fixes: 71ae40e4cf33 ("nubus: Clean up printk calls")
Tested-by: Stan Johnson <userm57@yahoo.com>
Signed-off-by: Finn Thain <fthain@telegraphics.com.au>
---
 drivers/nubus/nubus.c | 124 +++++++++++++++++++++-----------------------------
 1 file changed, 53 insertions(+), 71 deletions(-)

diff --git a/drivers/nubus/nubus.c b/drivers/nubus/nubus.c
index 8272d5a5d769..5607e58d5ca2 100644
--- a/drivers/nubus/nubus.c
+++ b/drivers/nubus/nubus.c
@@ -352,15 +352,15 @@ static int __init nubus_show_display_resource(struct nubus_dev *dev,
 {
 	switch (ent->type) {
 	case NUBUS_RESID_GAMMADIR:
-		pr_info("    gamma directory offset: 0x%06x\n", ent->data);
+		pr_debug("    gamma directory offset: 0x%06x\n", ent->data);
 		break;
 	case 0x0080 ... 0x0085:
-		pr_info("    mode %02X info offset: 0x%06x\n",
-		       ent->type, ent->data);
+		pr_debug("    mode 0x%02x info offset: 0x%06x\n",
+			ent->type, ent->data);
 		break;
 	default:
-		pr_info("    unknown resource %02X, data 0x%06x\n",
-		       ent->type, ent->data);
+		pr_debug("    unknown resource 0x%02x, data 0x%06x\n",
+			ent->type, ent->data);
 	}
 	return 0;
 }
@@ -374,12 +374,12 @@ static int __init nubus_show_network_resource(struct nubus_dev *dev,
 		char addr[6];
 
 		nubus_get_rsrc_mem(addr, ent, 6);
-		pr_info("    MAC address: %pM\n", addr);
+		pr_debug("    MAC address: %pM\n", addr);
 		break;
 	}
 	default:
-		pr_info("    unknown resource %02X, data 0x%06x\n",
-		       ent->type, ent->data);
+		pr_debug("    unknown resource 0x%02x, data 0x%06x\n",
+			ent->type, ent->data);
 	}
 	return 0;
 }
@@ -393,8 +393,8 @@ static int __init nubus_show_cpu_resource(struct nubus_dev *dev,
 		unsigned long meminfo[2];
 
 		nubus_get_rsrc_mem(&meminfo, ent, 8);
-		pr_info("    memory: [ 0x%08lx 0x%08lx ]\n",
-		       meminfo[0], meminfo[1]);
+		pr_debug("    memory: [ 0x%08lx 0x%08lx ]\n",
+			meminfo[0], meminfo[1]);
 		break;
 	}
 	case NUBUS_RESID_ROMINFO:
@@ -402,13 +402,13 @@ static int __init nubus_show_cpu_resource(struct nubus_dev *dev,
 		unsigned long rominfo[2];
 
 		nubus_get_rsrc_mem(&rominfo, ent, 8);
-		pr_info("    ROM:    [ 0x%08lx 0x%08lx ]\n",
-		       rominfo[0], rominfo[1]);
+		pr_debug("    ROM:    [ 0x%08lx 0x%08lx ]\n",
+			rominfo[0], rominfo[1]);
 		break;
 	}
 	default:
-		pr_info("    unknown resource %02X, data 0x%06x\n",
-		       ent->type, ent->data);
+		pr_debug("    unknown resource 0x%02x, data 0x%06x\n",
+			ent->type, ent->data);
 	}
 	return 0;
 }
@@ -427,8 +427,8 @@ static int __init nubus_show_private_resource(struct nubus_dev *dev,
 		nubus_show_cpu_resource(dev, ent);
 		break;
 	default:
-		pr_info("    unknown resource %02X, data 0x%06x\n",
-		       ent->type, ent->data);
+		pr_debug("    unknown resource 0x%02x, data 0x%06x\n",
+			ent->type, ent->data);
 	}
 	return 0;
 }
@@ -441,12 +441,9 @@ nubus_get_functional_resource(struct nubus_board *board, int slot,
 	struct nubus_dirent ent;
 	struct nubus_dev *dev;
 
-	pr_info("  Function 0x%02x:\n", parent->type);
+	pr_debug("  Functional resource 0x%02x:\n", parent->type);
 	nubus_get_subdir(parent, &dir);
 
-	pr_debug("%s: parent is 0x%p, dir is 0x%p\n",
-	         __func__, parent->base, dir.base);
-
 	/* Actually we should probably panic if this fails */
 	if ((dev = kzalloc(sizeof(*dev), GFP_ATOMIC)) == NULL)
 		return NULL;
@@ -465,14 +462,14 @@ nubus_get_functional_resource(struct nubus_board *board, int slot,
 			dev->type     = nbtdata[1];
 			dev->dr_sw    = nbtdata[2];
 			dev->dr_hw    = nbtdata[3];
-			pr_info("    type: [cat 0x%x type 0x%x sw 0x%x hw 0x%x]\n",
-			        nbtdata[0], nbtdata[1], nbtdata[2], nbtdata[3]);
+			pr_debug("    type: [cat 0x%x type 0x%x sw 0x%x hw 0x%x]\n",
+				nbtdata[0], nbtdata[1], nbtdata[2], nbtdata[3]);
 			break;
 		}
 		case NUBUS_RESID_NAME:
 		{
 			nubus_get_rsrc_str(dev->name, &ent, sizeof(dev->name));
-			pr_info("    name: %s\n", dev->name);
+			pr_debug("    name: %s\n", dev->name);
 			break;
 		}
 		case NUBUS_RESID_DRVRDIR:
@@ -485,7 +482,7 @@ nubus_get_functional_resource(struct nubus_board *board, int slot,
 			nubus_get_subdir(&ent, &drvr_dir);
 			nubus_readdir(&drvr_dir, &drvr_ent);
 			dev->driver = nubus_dirptr(&drvr_ent);
-			pr_info("    driver at: 0x%p\n", dev->driver);
+			pr_debug("    driver at: 0x%p\n", dev->driver);
 			break;
 		}
 		case NUBUS_RESID_MINOR_BASEOS:
@@ -493,20 +490,20 @@ nubus_get_functional_resource(struct nubus_board *board, int slot,
 			   multiple framebuffers.  It might be handy
 			   for Ethernet as well */
 			nubus_get_rsrc_mem(&dev->iobase, &ent, 4);
-			pr_info("    memory offset: 0x%08lx\n", dev->iobase);
+			pr_debug("    memory offset: 0x%08lx\n", dev->iobase);
 			break;
 		case NUBUS_RESID_MINOR_LENGTH:
 			/* Ditto */
 			nubus_get_rsrc_mem(&dev->iosize, &ent, 4);
-			pr_info("    memory length: 0x%08lx\n", dev->iosize);
+			pr_debug("    memory length: 0x%08lx\n", dev->iosize);
 			break;
 		case NUBUS_RESID_FLAGS:
 			dev->flags = ent.data;
-			pr_info("    flags: 0x%06x\n", dev->flags);
+			pr_debug("    flags: 0x%06x\n", dev->flags);
 			break;
 		case NUBUS_RESID_HWDEVID:
 			dev->hwdevid = ent.data;
-			pr_info("    hwdevid: 0x%06x\n", dev->hwdevid);
+			pr_debug("    hwdevid: 0x%06x\n", dev->hwdevid);
 			break;
 		default:
 			/* Local/Private resources have their own
@@ -534,10 +531,8 @@ static int __init nubus_get_vidnames(struct nubus_board *board,
 		char name[36];
 	};
 
-	pr_info("    video modes supported:\n");
+	pr_debug("    video modes supported:\n");
 	nubus_get_subdir(parent, &dir);
-	pr_debug("%s: parent is 0x%p, dir is 0x%p\n",
-	         __func__, parent->base, dir.base);
 
 	while (nubus_readdir(&dir, &ent) != -1) {
 		struct vidmode mode;
@@ -551,7 +546,7 @@ static int __init nubus_get_vidnames(struct nubus_board *board,
 			size = sizeof(mode) - 1;
 		memset(&mode, 0, sizeof(mode));
 		nubus_get_rsrc_mem(&mode, &ent, size);
-		pr_info("      %02X: (%02X) %s\n", ent.type,
+		pr_debug("      0x%02x: 0x%04x %s\n", ent.type,
 			mode.id, mode.name);
 	}
 	return 0;
@@ -562,25 +557,16 @@ static int __init nubus_get_icon(struct nubus_board *board,
 				 const struct nubus_dirent *ent)
 {
 	/* Should be 32x32 if my memory serves me correctly */
-	unsigned char icon[128];
-	int x, y;
+	u32 icon[32];
+	int i;
 
 	nubus_get_rsrc_mem(&icon, ent, 128);
-	pr_info("    icon:\n");
-
-	/* We should actually plot these somewhere in the framebuffer
-	   init.  This is just to demonstrate that they do, in fact,
-	   exist */
-	for (y = 0; y < 32; y++) {
-		pr_info("      ");
-		for (x = 0; x < 32; x++) {
-			if (icon[y * 4 + x / 8] & (0x80 >> (x % 8)))
-				pr_cont("*");
-			else
-				pr_cont(" ");
-		}
-		pr_cont("\n");
-	}
+	pr_debug("    icon:\n");
+	for (i = 0; i < 8; i++)
+		pr_debug("        %08x %08x %08x %08x\n",
+			icon[i * 4 + 0], icon[i * 4 + 1],
+			icon[i * 4 + 2], icon[i * 4 + 3]);
+
 	return 0;
 }
 
@@ -592,10 +578,8 @@ static int __init nubus_get_vendorinfo(struct nubus_board *board,
 	static char *vendor_fields[6] = { "ID", "serial", "revision",
 	                                  "part", "date", "unknown field" };
 
-	pr_info("    vendor info:\n");
+	pr_debug("    vendor info:\n");
 	nubus_get_subdir(parent, &dir);
-	pr_debug("%s: parent is 0x%p, dir is 0x%p\n",
-	         __func__, parent->base, dir.base);
 
 	while (nubus_readdir(&dir, &ent) != -1) {
 		char name[64];
@@ -604,7 +588,7 @@ static int __init nubus_get_vendorinfo(struct nubus_board *board,
 		nubus_get_rsrc_str(name, &ent, sizeof(name));
 		if (ent.type < 1 || ent.type > 5)
 			ent.type = 5;
-		pr_info("    %s: %s\n", vendor_fields[ent.type - 1], name);
+		pr_debug("    %s: %s\n", vendor_fields[ent.type - 1], name);
 	}
 	return 0;
 }
@@ -615,9 +599,8 @@ static int __init nubus_get_board_resource(struct nubus_board *board, int slot,
 	struct nubus_dir dir;
 	struct nubus_dirent ent;
 
+	pr_debug("  Board resource 0x%02x:\n", parent->type);
 	nubus_get_subdir(parent, &dir);
-	pr_debug("%s: parent is 0x%p, dir is 0x%p\n",
-	         __func__, parent->base, dir.base);
 
 	while (nubus_readdir(&dir, &ent) != -1) {
 		switch (ent.type) {
@@ -628,8 +611,8 @@ static int __init nubus_get_board_resource(struct nubus_board *board, int slot,
 			   useful except insofar as it tells us that
 			   we really are looking at a board resource. */
 			nubus_get_rsrc_mem(nbtdata, &ent, 8);
-			pr_info("    type: [cat 0x%x type 0x%x sw 0x%x hw 0x%x]\n",
-			        nbtdata[0], nbtdata[1], nbtdata[2], nbtdata[3]);
+			pr_debug("    type: [cat 0x%x type 0x%x sw 0x%x hw 0x%x]\n",
+				nbtdata[0], nbtdata[1], nbtdata[2], nbtdata[3]);
 			if (nbtdata[0] != 1 || nbtdata[1] != 0 ||
 			    nbtdata[2] != 0 || nbtdata[3] != 0)
 				pr_err("this sResource is not a board resource!\n");
@@ -638,28 +621,28 @@ static int __init nubus_get_board_resource(struct nubus_board *board, int slot,
 		case NUBUS_RESID_NAME:
 			nubus_get_rsrc_str(board->name, &ent,
 			                   sizeof(board->name));
-			pr_info("    name: %s\n", board->name);
+			pr_debug("    name: %s\n", board->name);
 			break;
 		case NUBUS_RESID_ICON:
 			nubus_get_icon(board, &ent);
 			break;
 		case NUBUS_RESID_BOARDID:
-			pr_info("    board id: 0x%x\n", ent.data);
+			pr_debug("    board id: 0x%x\n", ent.data);
 			break;
 		case NUBUS_RESID_PRIMARYINIT:
-			pr_info("    primary init offset: 0x%06x\n", ent.data);
+			pr_debug("    primary init offset: 0x%06x\n", ent.data);
 			break;
 		case NUBUS_RESID_VENDORINFO:
 			nubus_get_vendorinfo(board, &ent);
 			break;
 		case NUBUS_RESID_FLAGS:
-			pr_info("    flags: 0x%06x\n", ent.data);
+			pr_debug("    flags: 0x%06x\n", ent.data);
 			break;
 		case NUBUS_RESID_HWDEVID:
-			pr_info("    hwdevid: 0x%06x\n", ent.data);
+			pr_debug("    hwdevid: 0x%06x\n", ent.data);
 			break;
 		case NUBUS_RESID_SECONDINIT:
-			pr_info("    secondary init offset: 0x%06x\n", ent.data);
+			pr_debug("    secondary init offset: 0x%06x\n", ent.data);
 			break;
 			/* WTF isn't this in the functional resources? */
 		case NUBUS_RESID_VIDNAMES:
@@ -667,11 +650,11 @@ static int __init nubus_get_board_resource(struct nubus_board *board, int slot,
 			break;
 			/* Same goes for this */
 		case NUBUS_RESID_VIDMODES:
-			pr_info("    video mode parameter directory offset: 0x%06x\n",
+			pr_debug("    video mode parameter directory offset: 0x%06x\n",
 			       ent.data);
 			break;
 		default:
-			pr_info("    unknown resource %02X, data 0x%06x\n",
+			pr_debug("    unknown resource 0x%02x, data 0x%06x\n",
 			       ent.type, ent.data);
 		}
 	}
@@ -699,14 +682,14 @@ static struct nubus_board * __init nubus_add_board(int slot, int bytelanes)
 
 	/* Dump the format block for debugging purposes */
 	pr_debug("Slot %X, format block at 0x%p:\n", slot, rp);
+	pr_debug("%08lx\n", nubus_get_rom(&rp, 4, bytelanes));
+	pr_debug("%08lx\n", nubus_get_rom(&rp, 4, bytelanes));
+	pr_debug("%08lx\n", nubus_get_rom(&rp, 4, bytelanes));
 	pr_debug("%02lx\n", nubus_get_rom(&rp, 1, bytelanes));
 	pr_debug("%02lx\n", nubus_get_rom(&rp, 1, bytelanes));
 	pr_debug("%08lx\n", nubus_get_rom(&rp, 4, bytelanes));
 	pr_debug("%02lx\n", nubus_get_rom(&rp, 1, bytelanes));
 	pr_debug("%02lx\n", nubus_get_rom(&rp, 1, bytelanes));
-	pr_debug("%08lx\n", nubus_get_rom(&rp, 4, bytelanes));
-	pr_debug("%08lx\n", nubus_get_rom(&rp, 4, bytelanes));
-	pr_debug("%08lx\n", nubus_get_rom(&rp, 4, bytelanes));
 	rp = board->fblock;
 
 	board->slot = slot;
@@ -746,7 +729,7 @@ static struct nubus_board * __init nubus_add_board(int slot, int bytelanes)
 	nubus_get_root_dir(board, &dir);
 
 	/* We're ready to rock */
-	pr_info("Slot %X:\n", slot);
+	pr_debug("Slot %X:\n", slot);
 
 	/* Each slot should have one board resource and any number of
 	   functional resources.  So we'll fill in some fields in the
@@ -758,7 +741,6 @@ static struct nubus_board * __init nubus_add_board(int slot, int bytelanes)
 		pr_err("Board resource not found!\n");
 		return NULL;
 	} else {
-		pr_info("  Board resource:\n");
 		nubus_get_board_resource(board, slot, &ent);
 	}
 
@@ -830,6 +812,7 @@ static void __init nubus_scan_bus(void)
 {
 	int slot;
 
+	pr_info("NuBus: Scanning NuBus slots.\n");
 	for (slot = 9; slot < 15; slot++) {
 		nubus_probe_slot(slot);
 	}
@@ -840,7 +823,6 @@ static int __init nubus_init(void)
 	if (!MACH_IS_MAC)
 		return 0;
 
-	pr_info("NuBus: Scanning NuBus slots.\n");
 	nubus_devices = NULL;
 	nubus_boards = NULL;
 	nubus_scan_bus();
-- 
2.13.6
