From: David Huggins-Daines <dhd@debian.org>
Subject: [RFC 1/2] nubus: Remove slot zero probe
Date: Sat, 22 Apr 2017 21:24:16 -0400 (EDT)
Message-ID: <784e96fea94d1cb000d86af9bf8553ddd1adbb97.1492910474.git.fthain@telegraphics.com.au>
References: <cover.1492910474.git.fthain@telegraphics.com.au>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:45230 "EHLO
        kvm5.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1427423AbdDWBYR (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Sat, 22 Apr 2017 21:24:17 -0400
In-Reply-To: <cover.1492910474.git.fthain@telegraphics.com.au>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org

Some long forgotten changes from the linux-mac68k CVS:

Remove the slot 0 (ROM) probing.
Remove the pointless White Screen Of Death crap.

The original commit is here:

http://linux-mac68k.cvs.sourceforge.net/viewvc/linux-mac68k/linux-mac68k/drivers/nubus/nubus.c?r1=1.22.2.1&r2=1.22.2.2&pathrev=linux-2_2

This is mostly dead code removal. It is also a reversion to the
pre-v2.3.17 version. The old code was thoroughly tested in Debian Sarge.

The present code for probing fake slot resources in Apple's on-board
(slot zero) ROMs could be useful if replaced the macintosh_config struct.
But it can't do so and we don't want two mechanisms for identifying
on-board hardware.

Signed-off-by: Finn Thain <fthain@telegraphics.com.au>
---
 drivers/nubus/nubus.c | 111 +++-----------------------------------------------
 1 file changed, 5 insertions(+), 106 deletions(-)

diff --git a/drivers/nubus/nubus.c b/drivers/nubus/nubus.c
index 1742ccc..bb628de 100644
--- a/drivers/nubus/nubus.c
+++ b/drivers/nubus/nubus.c
@@ -13,7 +13,6 @@
 #include <linux/nubus.h>
 #include <linux/errno.h>
 #include <linux/init.h>
-#include <linux/delay.h>
 #include <linux/module.h>
 #include <linux/slab.h>
 #include <asm/setup.h>
@@ -34,14 +33,6 @@ extern void oss_nubus_init(void);
 
 #define NUBUS_TEST_PATTERN 0x5A932BC7
 
-/* Define this if you like to live dangerously - it is known not to
-   work on pretty much every machine except the Quadra 630 and the LC
-   III. */
-#undef I_WANT_TO_PROBE_SLOT_ZERO
-
-/* This sometimes helps combat failure to boot */
-#undef TRY_TO_DODGE_WSOD
-
 /* Globals */
 
 struct nubus_dev *nubus_devices;
@@ -454,10 +445,6 @@ nubus_get_functional_resource(struct nubus_board *board, int slot,
 	pr_info("  Function 0x%02x:\n", parent->type);
 	nubus_get_subdir(parent, &dir);
 
-	/* Apple seems to have botched the ROM on the IIx */
-	if (slot == 0 && (unsigned long)dir.base % 2)
-		dir.base += 1;
-
 	pr_debug("%s: parent is 0x%p, dir is 0x%p\n",
 	         __func__, parent->base, dir.base);
 
@@ -691,83 +678,6 @@ static int __init nubus_get_board_resource(struct nubus_board *board, int slot,
 	return 0;
 }
 
-/* Attempt to bypass the somewhat non-obvious arrangement of
-   sResources in the motherboard ROM */
-static void __init nubus_find_rom_dir(struct nubus_board* board)
-{
-	unsigned char *rp;
-	unsigned char *romdir;
-	struct nubus_dir dir;
-	struct nubus_dirent ent;
-
-	/* Check for the extra directory just under the format block */
-	rp = board->fblock;
-	nubus_rewind(&rp, 4, board->lanes);
-	if (nubus_get_rom(&rp, 4, board->lanes) != NUBUS_TEST_PATTERN) {
-		/* OK, the ROM was telling the truth */
-		board->directory = board->fblock;
-		nubus_move(&board->directory,
-			   nubus_expand32(board->doffset),
-			   board->lanes);
-		return;
-	}
-
-	/* On "slot zero", you have to walk down a few more
-	   directories to get to the equivalent of a real card's root
-	   directory.  We don't know what they were smoking when they
-	   came up with this. */
-	romdir = nubus_rom_addr(board->slot);
-	nubus_rewind(&romdir, ROM_DIR_OFFSET, board->lanes);
-	dir.base = dir.ptr = romdir;
-	dir.done = 0;
-	dir.mask = board->lanes;
-
-	/* This one points to an "Unknown Macintosh" directory */
-	if (nubus_readdir(&dir, &ent) == -1)
-		goto badrom;
-
-	if (console_loglevel >= CONSOLE_LOGLEVEL_DEBUG)
-		printk(KERN_INFO "nubus_get_rom_dir: entry %02x %06x\n", ent.type, ent.data);
-	/* This one takes us to where we want to go. */
-	if (nubus_readdir(&dir, &ent) == -1)
-		goto badrom;
-	if (console_loglevel >= CONSOLE_LOGLEVEL_DEBUG)
-		printk(KERN_DEBUG "nubus_get_rom_dir: entry %02x %06x\n", ent.type, ent.data);
-	nubus_get_subdir(&ent, &dir);
-
-	/* Resource ID 01, also an "Unknown Macintosh" */
-	if (nubus_readdir(&dir, &ent) == -1)
-		goto badrom;
-	if (console_loglevel >= CONSOLE_LOGLEVEL_DEBUG)
-		printk(KERN_DEBUG "nubus_get_rom_dir: entry %02x %06x\n", ent.type, ent.data);
-
-	/* FIXME: the first one is *not* always the right one.  We
-	   suspect this has something to do with the ROM revision.
-	   "The HORROR ROM" (LC-series) uses 0x7e, while "The HORROR
-	   Continues" (Q630) uses 0x7b.  The DAFB Macs evidently use
-	   something else.  Please run "Slots" on your Mac (see
-	   include/linux/nubus.h for where to get this program) and
-	   tell us where the 'SiDirPtr' for Slot 0 is.  If you feel
-	   brave, you should also use MacsBug to walk down the ROM
-	   directories like this function does and try to find the
-	   path to that address... */
-	if (nubus_readdir(&dir, &ent) == -1)
-		goto badrom;
-	if (console_loglevel >= CONSOLE_LOGLEVEL_DEBUG)
-		printk(KERN_DEBUG "nubus_get_rom_dir: entry %02x %06x\n", ent.type, ent.data);
-
-	/* Bwahahahaha... */
-	nubus_get_subdir(&ent, &dir);
-	board->directory = dir.base;
-	return;
-
-	/* Even more evil laughter... */
- badrom:
-	board->directory = board->fblock;
-	nubus_move(&board->directory, nubus_expand32(board->doffset), board->lanes);
-	printk(KERN_ERR "nubus_get_rom_dir: ROM weirdness!  Notify the developers...\n");
-}
-
 /* Add a board (might be many devices) to the list */
 static struct nubus_board * __init nubus_add_board(int slot, int bytelanes)
 {
@@ -828,8 +738,11 @@ static struct nubus_board * __init nubus_add_board(int slot, int bytelanes)
 	 * since the initial Macintosh ROM releases skipped the check.
 	 */
 
-	/* Attempt to work around slot zero weirdness */
-	nubus_find_rom_dir(board);
+	/* Set up the directory pointer */
+	board->directory = board->fblock;
+	nubus_move(&board->directory, nubus_expand32(board->doffset),
+	           board->lanes);
+
 	nubus_get_root_dir(board, &dir);
 
 	/* We're ready to rock */
@@ -849,9 +762,6 @@ static struct nubus_board * __init nubus_add_board(int slot, int bytelanes)
 		nubus_get_board_resource(board, slot, &ent);
 	}
 
-	/* Aaaarrrrgghh!  The LC III motherboard has *two* board
-	   resources.  I have no idea WTF to do about this. */
-
 	while (nubus_readdir(&dir, &ent) != -1) {
 		struct nubus_dev *dev;
 		struct nubus_dev **devp;
@@ -922,10 +832,6 @@ void __init nubus_scan_bus(void)
 {
 	int slot;
 
-	/* This might not work on your machine */
-#ifdef I_WANT_TO_PROBE_SLOT_ZERO
-	nubus_probe_slot(0);
-#endif
 	for (slot = 9; slot < 15; slot++) {
 		nubus_probe_slot(slot);
 	}
@@ -943,13 +849,6 @@ static int __init nubus_init(void)
 		via_nubus_init();
 	}
 
-#ifdef TRY_TO_DODGE_WSOD
-	/* Rogue Ethernet interrupts can kill the machine if we don't
-	   do this.  Obviously this is bogus.  Hopefully the local VIA
-	   gurus can fix the real cause of the problem. */
-	mdelay(1000);
-#endif
-
 	/* And probe */
 	pr_info("NuBus: Scanning NuBus slots.\n");
 	nubus_devices = NULL;
-- 
2.10.2
