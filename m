From: Finn Thain <fthain@telegraphics.com.au>
Subject: [PATCH 07/10] nubus: Clean up printk calls (from mac68k CVS)
Date: Sat,  8 Apr 2017 19:51:15 -0400 (EDT)
Message-ID: <f984691f6d22cba5bc4ea87911b333dc94371cf6.1491695243.git.fthain@telegraphics.com.au>
References: <cover.1491695243.git.fthain@telegraphics.com.au>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1491695243.git.fthain@telegraphics.com.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org

From: David Huggins-Daines <dhd@debian.org>

Some long forgotten changes from the linux-mac68k CVS:

Fix swapped DrvrSW and DrvrHW values in printk message.
Suppress debug printk messages.
Avoid console_loglevel misuse.

The original commits are these:

http://linux-mac68k.cvs.sourceforge.net/viewvc/linux-mac68k/linux-mac68k/drivers/nubus/nubus.c?r1=1.22.2.1&r2=1.22.2.2&pathrev=linux-2_2
http://linux-mac68k.cvs.sourceforge.net/viewvc/linux-mac68k/linux-mac68k/drivers/nubus/nubus.c?r1=1.21&r2=1.22&pathrev=linux-2_2

The CVS commits fell short of removing all of the misuse of
console_loglevel in nubus_add_board() so I finished the job.
I've also added some missing message severity levels and converted
a printk loop to the MAC address "%pM" format specifier.

Signed-off-by: Finn Thain <fthain@telegraphics.com.au>
---
 drivers/nubus/nubus.c | 149 ++++++++++++++++++++++----------------------------
 1 file changed, 65 insertions(+), 84 deletions(-)

diff --git a/drivers/nubus/nubus.c b/drivers/nubus/nubus.c
index ef3d7d1..1acf31c 100644
--- a/drivers/nubus/nubus.c
+++ b/drivers/nubus/nubus.c
@@ -94,7 +94,7 @@ static void nubus_rewind(unsigned char **ptr, int len, int map)
 
 	/* Sanity check */
 	if(len > 65536)
-		printk(KERN_ERR "rewind of 0x%08x!\n", len);
+		pr_err("rewind of 0x%08x!\n", len);
 	while(len)
 	{
 		do
@@ -111,7 +111,7 @@ static void nubus_advance(unsigned char **ptr, int len, int map)
 {
 	unsigned char *p = *ptr;
 	if(len>65536)
-		printk(KERN_ERR "advance of 0x%08x!\n", len);
+		pr_err("advance of 0x%08x!\n", len);
 	while(len)
 	{
 		while(not_useful(p,map))
@@ -366,14 +366,14 @@ static int __init nubus_show_display_resource(struct nubus_dev* dev,
 {
 	switch (ent->type) {
 	case NUBUS_RESID_GAMMADIR:
-		printk(KERN_INFO "    gamma directory offset: 0x%06x\n", ent->data);
+		pr_info("    gamma directory offset: 0x%06x\n", ent->data);
 		break;
 	case 0x0080 ... 0x0085:
-		printk(KERN_INFO "    mode %02X info offset: 0x%06x\n",
+		pr_info("    mode %02X info offset: 0x%06x\n",
 		       ent->type, ent->data);
 		break;
 	default:
-		printk(KERN_INFO "    unknown resource %02X, data 0x%06x\n",
+		pr_info("    unknown resource %02X, data 0x%06x\n",
 		       ent->type, ent->data);
 	}
 	return 0;
@@ -386,18 +386,13 @@ static int __init nubus_show_network_resource(struct nubus_dev* dev,
 	case NUBUS_RESID_MAC_ADDRESS:
 	{
 		char addr[6];
-		int i;
 		
 		nubus_get_rsrc_mem(addr, ent, 6);
-		printk(KERN_INFO "    MAC address: ");
-		for (i = 0; i < 6; i++)
-			printk("%02x%s", addr[i] & 0xff,
-			       i == 5 ? "" : ":");
-		printk("\n");
+		pr_info("    MAC address: %pM\n", addr);
 		break;
 	}
 	default:
-		printk(KERN_INFO "    unknown resource %02X, data 0x%06x\n",
+		pr_info("    unknown resource %02X, data 0x%06x\n",
 		       ent->type, ent->data);
 	}
 	return 0;
@@ -411,7 +406,7 @@ static int __init nubus_show_cpu_resource(struct nubus_dev* dev,
 	{
 		unsigned long meminfo[2];
 		nubus_get_rsrc_mem(&meminfo, ent, 8);
-		printk(KERN_INFO "    memory: [ 0x%08lx 0x%08lx ]\n",
+		pr_info("    memory: [ 0x%08lx 0x%08lx ]\n",
 		       meminfo[0], meminfo[1]);
 		break;
 	}
@@ -419,12 +414,12 @@ static int __init nubus_show_cpu_resource(struct nubus_dev* dev,
 	{
 		unsigned long rominfo[2];
 		nubus_get_rsrc_mem(&rominfo, ent, 8);
-		printk(KERN_INFO "    ROM:    [ 0x%08lx 0x%08lx ]\n",
+		pr_info("    ROM:    [ 0x%08lx 0x%08lx ]\n",
 		       rominfo[0], rominfo[1]);
 		break;
 	}
 	default:
-		printk(KERN_INFO "    unknown resource %02X, data 0x%06x\n",
+		pr_info("    unknown resource %02X, data 0x%06x\n",
 		       ent->type, ent->data);
 	}
 	return 0;
@@ -444,7 +439,7 @@ static int __init nubus_show_private_resource(struct nubus_dev* dev,
 		nubus_show_cpu_resource(dev, ent);
 		break;
 	default:
-		printk(KERN_INFO "    unknown resource %02X, data 0x%06x\n",
+		pr_info("    unknown resource %02X, data 0x%06x\n",
 		       ent->type, ent->data);
 	}
 	return 0;
@@ -459,12 +454,11 @@ static struct nubus_dev* __init
 	struct nubus_dirent ent;
 	struct nubus_dev*   dev;
 	
-	printk(KERN_INFO "  Function 0x%02x:\n", parent->type);
+	pr_info("  Function 0x%02x:\n", parent->type);
 	nubus_get_subdir(parent, &dir);
 
-	if (console_loglevel >= CONSOLE_LOGLEVEL_DEBUG)
-		printk(KERN_DEBUG "nubus_get_functional_resource: parent is 0x%p, dir is 0x%p\n",
-		       parent->base, dir.base);
+	pr_debug("%s: parent is 0x%p, dir is 0x%p\n",
+	         __func__, parent->base, dir.base);
 
 	/* Actually we should probably panic if this fails */
 	if ((dev = kzalloc(sizeof(*dev), GFP_ATOMIC)) == NULL)
@@ -485,14 +479,14 @@ static struct nubus_dev* __init
 			dev->type     = nbtdata[1];
 			dev->dr_sw    = nbtdata[2];
 			dev->dr_hw    = nbtdata[3];
-			printk(KERN_INFO "    type: [cat 0x%x type 0x%x hw 0x%x sw 0x%x]\n",
-			       nbtdata[0], nbtdata[1], nbtdata[2], nbtdata[3]);
+			pr_info("    type: [cat 0x%x type 0x%x sw 0x%x hw 0x%x]\n",
+			        nbtdata[0], nbtdata[1], nbtdata[2], nbtdata[3]);
 			break;
 		}
 		case NUBUS_RESID_NAME:
 		{
 			nubus_get_rsrc_str(dev->name, &ent, 64);
-			printk(KERN_INFO "    name: %s\n", dev->name);
+			pr_info("    name: %s\n", dev->name);
 			break;
 		}
 		case NUBUS_RESID_DRVRDIR:
@@ -504,8 +498,7 @@ static struct nubus_dev* __init
 			nubus_get_subdir(&ent, &drvr_dir);
 			nubus_readdir(&drvr_dir, &drvr_ent);
 			dev->driver = nubus_dirptr(&drvr_ent);
-			printk(KERN_INFO "    driver at: 0x%p\n",
-			       dev->driver);
+			pr_info("    driver at: 0x%p\n", dev->driver);
 			break;
 		}
 		case NUBUS_RESID_MINOR_BASEOS:
@@ -513,22 +506,20 @@ static struct nubus_dev* __init
 			   multiple framebuffers.  It might be handy
 			   for Ethernet as well */
 			nubus_get_rsrc_mem(&dev->iobase, &ent, 4);
-			printk(KERN_INFO "    memory offset: 0x%08lx\n",
-			       dev->iobase);
+			pr_info("    memory offset: 0x%08lx\n", dev->iobase);
 			break;
 		case NUBUS_RESID_MINOR_LENGTH:
 			/* Ditto */
 			nubus_get_rsrc_mem(&dev->iosize, &ent, 4);
-			printk(KERN_INFO "    memory length: 0x%08lx\n",
-			       dev->iosize);
+			pr_info("    memory length: 0x%08lx\n", dev->iosize);
 			break;			
 		case NUBUS_RESID_FLAGS:
 			dev->flags = ent.data;
-			printk(KERN_INFO "    flags: 0x%06x\n", dev->flags);
+			pr_info("    flags: 0x%06x\n", dev->flags);
 			break;
 		case NUBUS_RESID_HWDEVID:
 			dev->hwdevid = ent.data;
-			printk(KERN_INFO "    hwdevid: 0x%06x\n", dev->hwdevid);
+			pr_info("    hwdevid: 0x%06x\n", dev->hwdevid);
 			break;
 		default:
 			/* Local/Private resources have their own
@@ -555,11 +546,10 @@ static int __init nubus_get_vidnames(struct nubus_board* board,
 		char name[32];
 	};
 
-	printk(KERN_INFO "    video modes supported:\n");
+	pr_info("    video modes supported:\n");
 	nubus_get_subdir(parent, &dir);
-	if (console_loglevel >= CONSOLE_LOGLEVEL_DEBUG)
-		printk(KERN_DEBUG "nubus_get_vidnames: parent is 0x%p, dir is 0x%p\n",
-		       parent->base, dir.base);
+	pr_debug("%s: parent is 0x%p, dir is 0x%p\n",
+	         __func__, parent->base, dir.base);
 
 	while(nubus_readdir(&dir, &ent) != -1)
 	{
@@ -574,7 +564,7 @@ static int __init nubus_get_vidnames(struct nubus_board* board,
 			size = sizeof(mode) - 1;
 		memset(&mode, 0, sizeof(mode));
 		nubus_get_rsrc_mem(&mode, &ent, size);
-		printk (KERN_INFO "      %02X: (%02X) %s\n", ent.type,
+		pr_info("      %02X: (%02X) %s\n", ent.type,
 			mode.id, mode.name);
 	}
 	return 0;
@@ -589,21 +579,21 @@ static int __init nubus_get_icon(struct nubus_board* board,
 	int x, y;
 	
 	nubus_get_rsrc_mem(&icon, ent, 128);
-	printk(KERN_INFO "    icon:\n");
+	pr_info("    icon:\n");
 
 	/* We should actually plot these somewhere in the framebuffer
 	   init.  This is just to demonstrate that they do, in fact,
 	   exist */
 	for (y = 0; y < 32; y++) {
-		printk(KERN_INFO "      ");
+		pr_info("      ");
 		for (x = 0; x < 32; x++) {
 			if (icon[y*4 + x/8]
 			    & (0x80 >> (x%8)))
-				printk("*");
+				pr_cont("*");
 			else
-				printk(" ");
+				pr_cont(" ");
 		}
-		printk("\n");
+		pr_cont("\n");
 	}
 	return 0;
 }
@@ -616,11 +606,10 @@ static int __init nubus_get_vendorinfo(struct nubus_board* board,
 	static char* vendor_fields[6] = {"ID", "serial", "revision",
 					 "part", "date", "unknown field"};
 
-	printk(KERN_INFO "    vendor info:\n");
+	pr_info("    vendor info:\n");
 	nubus_get_subdir(parent, &dir);
-	if (console_loglevel >= CONSOLE_LOGLEVEL_DEBUG)
-		printk(KERN_DEBUG "nubus_get_vendorinfo: parent is 0x%p, dir is 0x%p\n",
-		       parent->base, dir.base);
+	pr_debug("%s: parent is 0x%p, dir is 0x%p\n",
+	         __func__, parent->base, dir.base);
 
 	while(nubus_readdir(&dir, &ent) != -1)
 	{
@@ -630,8 +619,7 @@ static int __init nubus_get_vendorinfo(struct nubus_board* board,
 		nubus_get_rsrc_str(name, &ent, 64);
 		if (ent.type > 5)
 			ent.type = 5;
-		printk(KERN_INFO "    %s: %s\n",
-		       vendor_fields[ent.type-1], name);
+		pr_info("    %s: %s\n", vendor_fields[ent.type - 1], name);
 	}
 	return 0;
 }
@@ -643,9 +631,8 @@ static int __init nubus_get_board_resource(struct nubus_board* board, int slot,
 	struct nubus_dirent ent;
 	
 	nubus_get_subdir(parent, &dir);
-	if (console_loglevel >= CONSOLE_LOGLEVEL_DEBUG)
-		printk(KERN_DEBUG "nubus_get_board_resource: parent is 0x%p, dir is 0x%p\n",
-		       parent->base, dir.base);
+	pr_debug("%s: parent is 0x%p, dir is 0x%p\n",
+	         __func__, parent->base, dir.base);
 
 	while(nubus_readdir(&dir, &ent) != -1)
 	{
@@ -657,38 +644,37 @@ static int __init nubus_get_board_resource(struct nubus_board* board, int slot,
 			   useful except insofar as it tells us that
 			   we really are looking at a board resource. */
 			nubus_get_rsrc_mem(nbtdata, &ent, 8);
-			printk(KERN_INFO "    type: [cat 0x%x type 0x%x hw 0x%x sw 0x%x]\n",
-			       nbtdata[0], nbtdata[1], nbtdata[2],
-			       nbtdata[3]);
+			pr_info("    type: [cat 0x%x type 0x%x sw 0x%x hw 0x%x]\n",
+			        nbtdata[0], nbtdata[1], nbtdata[2], nbtdata[3]);
 			if (nbtdata[0] != 1 || nbtdata[1] != 0 ||
 			    nbtdata[2] != 0 || nbtdata[3] != 0)
-				printk(KERN_ERR "this sResource is not a board resource!\n");
+				pr_err("this sResource is not a board resource!\n");
 			break;
 		}
 		case NUBUS_RESID_NAME:
 			nubus_get_rsrc_str(board->name, &ent, 64);
-			printk(KERN_INFO "    name: %s\n", board->name);
+			pr_info("    name: %s\n", board->name);
 			break;
 		case NUBUS_RESID_ICON:
 			nubus_get_icon(board, &ent);
 			break;
 		case NUBUS_RESID_BOARDID:
-			printk(KERN_INFO "    board id: 0x%x\n", ent.data);
+			pr_info("    board id: 0x%x\n", ent.data);
 			break;
 		case NUBUS_RESID_PRIMARYINIT:
-			printk(KERN_INFO "    primary init offset: 0x%06x\n", ent.data);
+			pr_info("    primary init offset: 0x%06x\n", ent.data);
 			break;
 		case NUBUS_RESID_VENDORINFO:
 			nubus_get_vendorinfo(board, &ent);
 			break;
 		case NUBUS_RESID_FLAGS:
-			printk(KERN_INFO "    flags: 0x%06x\n", ent.data);
+			pr_info("    flags: 0x%06x\n", ent.data);
 			break;
 		case NUBUS_RESID_HWDEVID:
-			printk(KERN_INFO "    hwdevid: 0x%06x\n", ent.data);
+			pr_info("    hwdevid: 0x%06x\n", ent.data);
 			break;
 		case NUBUS_RESID_SECONDINIT:
-			printk(KERN_INFO "    secondary init offset: 0x%06x\n", ent.data);
+			pr_info("    secondary init offset: 0x%06x\n", ent.data);
 			break;
 			/* WTF isn't this in the functional resources? */ 
 		case NUBUS_RESID_VIDNAMES:
@@ -696,11 +682,11 @@ static int __init nubus_get_board_resource(struct nubus_board* board, int slot,
 			break;
 			/* Same goes for this */
 		case NUBUS_RESID_VIDMODES:
-			printk(KERN_INFO "    video mode parameter directory offset: 0x%06x\n",
+			pr_info("    video mode parameter directory offset: 0x%06x\n",
 			       ent.data);
 			break;			
 		default:
-			printk(KERN_INFO "    unknown resource %02X, data 0x%06x\n",
+			pr_info("    unknown resource %02X, data 0x%06x\n",
 			       ent.type, ent.data);
 		}
 	}
@@ -728,21 +714,17 @@ static struct nubus_board* __init nubus_add_board(int slot, int bytelanes)
 	board->fblock = rp;
 
 	/* Dump the format block for debugging purposes */
-	if (console_loglevel >= CONSOLE_LOGLEVEL_DEBUG) {
-		int i;
-		printk(KERN_DEBUG "Slot %X, format block at 0x%p\n",
-		       slot, rp);
-		printk(KERN_DEBUG "Format block: ");
-		for (i = 0; i < FORMAT_BLOCK_SIZE; i += 4) {
-			unsigned short foo, bar;
-			foo = nubus_get_rom(&rp, 2, bytelanes);
-			bar = nubus_get_rom(&rp, 2, bytelanes);
-			printk("%04x %04x  ", foo, bar);
-		}
-		printk("\n");
-		rp = board->fblock;
-	}
-	
+	pr_debug("Slot %X, format block at 0x%p:\n", slot, rp);
+	pr_debug("%02lx\n", nubus_get_rom(&rp, 1, bytelanes));
+	pr_debug("%02lx\n", nubus_get_rom(&rp, 1, bytelanes));
+	pr_debug("%08lx\n", nubus_get_rom(&rp, 4, bytelanes));
+	pr_debug("%02lx\n", nubus_get_rom(&rp, 1, bytelanes));
+	pr_debug("%02lx\n", nubus_get_rom(&rp, 1, bytelanes));
+	pr_debug("%08lx\n", nubus_get_rom(&rp, 4, bytelanes));
+	pr_debug("%08lx\n", nubus_get_rom(&rp, 4, bytelanes));
+	pr_debug("%08lx\n", nubus_get_rom(&rp, 4, bytelanes));
+	rp = board->fblock;
+
 	board->slot = slot;
 	board->slot_addr = (unsigned long) nubus_slot_addr(slot);
 	board->doffset = nubus_get_rom(&rp, 4, bytelanes);
@@ -760,10 +742,10 @@ static struct nubus_board* __init nubus_add_board(int slot, int bytelanes)
 
 	/* Directory offset should be small and negative... */
 	if(!(board->doffset & 0x00FF0000))
-		printk(KERN_WARNING "Dodgy doffset!\n");
+		pr_warn("Dodgy doffset!\n");
 	dpat = nubus_get_rom(&rp, 4, bytelanes);
 	if(dpat != NUBUS_TEST_PATTERN)
-		printk(KERN_WARNING "Wrong test pattern %08lx!\n", dpat);
+		pr_warn("Wrong test pattern %08lx!\n", dpat);
 		
 	/*
 	 *	I wonder how the CRC is meant to work -
@@ -780,7 +762,7 @@ static struct nubus_board* __init nubus_add_board(int slot, int bytelanes)
 	nubus_get_root_dir(board, &dir);	
 
 	/* We're ready to rock */
-	printk(KERN_INFO "Slot %X:\n", slot);
+	pr_info("Slot %X:\n", slot);
 
 	/* Each slot should have one board resource and any number of
 	   functional resources.  So we'll fill in some fields in the
@@ -789,10 +771,10 @@ static struct nubus_board* __init nubus_add_board(int slot, int bytelanes)
 	   for each of them. */
 	if (nubus_readdir(&dir, &ent) == -1) {
 		/* We can't have this! */
-		printk(KERN_ERR "Board resource not found!\n");
+		pr_err("Board resource not found!\n");
 		return NULL;
 	} else {
-		printk(KERN_INFO "  Board resource:\n");
+		pr_info("  Board resource:\n");
 		nubus_get_board_resource(board, slot, &ent);
 	}
 
@@ -839,7 +821,6 @@ void __init nubus_probe_slot(int slot)
 		if (!card_present)
 			continue;
 
-		printk(KERN_DEBUG "Now probing slot %X at %p\n", slot, rp);
 		dp = *rp;
 		if(dp == 0)
 			continue;
@@ -884,7 +865,7 @@ static int __init nubus_init(void)
 	}
 
 	/* And probe */
-	printk("NuBus: Scanning NuBus slots.\n");
+	pr_info("NuBus: Scanning NuBus slots.\n");
 	nubus_devices = NULL;
 	nubus_boards  = NULL;
 	nubus_scan_bus();
-- 
2.10.2
