From: Finn Thain <fthain@telegraphics.com.au>
Subject: [PATCH v2 05/13] nubus: Validate slot resource IDs
Date: Fri, 17 Nov 2017 21:30:11 -0500 (EST)
Message-ID: <08a484a876eb07106641b42007b0bbc7b24d85ca.1510960933.git.fthain@telegraphics.com.au>
References: <cover.1510960933.git.fthain@telegraphics.com.au>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1510960933.git.fthain@telegraphics.com.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org

While we are here, include the slot number in the related error messages.

Tested-by: Stan Johnson <userm57@yahoo.com>
Signed-off-by: Finn Thain <fthain@telegraphics.com.au>
---
 drivers/nubus/nubus.c | 25 +++++++++++++++++++------
 1 file changed, 19 insertions(+), 6 deletions(-)

diff --git a/drivers/nubus/nubus.c b/drivers/nubus/nubus.c
index bdf3f4f96705..72536ef28bd7 100644
--- a/drivers/nubus/nubus.c
+++ b/drivers/nubus/nubus.c
@@ -616,7 +616,7 @@ static int __init nubus_get_board_resource(struct nubus_board *board, int slot,
 				nbtdata[0], nbtdata[1], nbtdata[2], nbtdata[3]);
 			if (nbtdata[0] != 1 || nbtdata[1] != 0 ||
 			    nbtdata[2] != 0 || nbtdata[3] != 0)
-				pr_err("this sResource is not a board resource!\n");
+				pr_err("Slot %X: sResource is not a board resource!\n", slot);
 			break;
 		}
 		case NUBUS_RESID_NAME:
@@ -671,6 +671,7 @@ static struct nubus_board * __init nubus_add_board(int slot, int bytelanes)
 	unsigned long dpat;
 	struct nubus_dir dir;
 	struct nubus_dirent ent;
+	int prev_resid = -1;
 
 	/* Move to the start of the format block */
 	rp = nubus_rom_addr(slot);
@@ -710,10 +711,10 @@ static struct nubus_board * __init nubus_add_board(int slot, int bytelanes)
 
 	/* Directory offset should be small and negative... */
 	if (!(board->doffset & 0x00FF0000))
-		pr_warn("Dodgy doffset!\n");
+		pr_warn("Slot %X: Dodgy doffset!\n", slot);
 	dpat = nubus_get_rom(&rp, 4, bytelanes);
 	if (dpat != NUBUS_TEST_PATTERN)
-		pr_warn("Wrong test pattern %08lx!\n", dpat);
+		pr_warn("Slot %X: Wrong test pattern %08lx!\n", slot, dpat);
 
 	/*
 	 *	I wonder how the CRC is meant to work -
@@ -739,12 +740,15 @@ static struct nubus_board * __init nubus_add_board(int slot, int bytelanes)
 	   for each of them. */
 	if (nubus_readdir(&dir, &ent) == -1) {
 		/* We can't have this! */
-		pr_err("Board resource not found!\n");
+		pr_err("Slot %X: Board resource not found!\n", slot);
 		return NULL;
-	} else {
-		nubus_get_board_resource(board, slot, &ent);
 	}
 
+	if (ent.type < 1 || ent.type > 127)
+		pr_warn("Slot %X: Board resource ID is invalid!\n", slot);
+
+	nubus_get_board_resource(board, slot, &ent);
+
 	while (nubus_readdir(&dir, &ent) != -1) {
 		struct nubus_dev *dev;
 		struct nubus_dev **devp;
@@ -753,6 +757,15 @@ static struct nubus_board * __init nubus_add_board(int slot, int bytelanes)
 		if (dev == NULL)
 			continue;
 
+		/* Resources should appear in ascending ID order. This sanity
+		 * check prevents duplicate resource IDs.
+		 */
+		if (dev->resid <= prev_resid) {
+			kfree(dev);
+			continue;
+		}
+		prev_resid = dev->resid;
+
 		/* We zeroed this out above */
 		if (board->first_dev == NULL)
 			board->first_dev = dev;
-- 
2.13.6
