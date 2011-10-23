From: Finn Thain <fthain@telegraphics.com.au>
Subject: [PATCH 08/16] m68k/mac: enable via_alt_mapping on performa 580
Date: Mon, 24 Oct 2011 01:11:16 +1100
Message-ID: <20111023141147.908762775@telegraphics.com.au>
References: <20111023141108.856998818@telegraphics.com.au>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from vm4.telegraphics.com.au ([98.124.60.149]:46049 "EHLO
	vps4.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755582Ab1JWOLw (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 23 Oct 2011 10:11:52 -0400
Content-Disposition: inline; filename=via_alt_mapping
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org

Enable via_alt_mapping on the Performa 588 and tidy up related documentation.

I'm betting that remapped IRQs work just fine on the Performa 580 series since it works on the LC 630 and the logic board part numbers are reputedly the same.

And the consensus seems to be that the Mac TV is essentially a Performa 550, not dissimilar to the Performa 520, so set the via_type accordingly.

Signed-off-by: Finn Thain <fthain@telegraphics.com.au>

Index: linux-m68k/arch/m68k/mac/macints.c
===================================================================
--- linux-m68k.orig/arch/m68k/mac/macints.c	2011-10-22 23:02:38.000000000 +1100
+++ linux-m68k/arch/m68k/mac/macints.c	2011-10-23 00:51:06.000000000 +1100
@@ -42,6 +42,18 @@
  *
  *	6	- off switch (?)
  *
+ * Machines with Quadra-like VIA hardware, except PSC and PMU machines, support
+ * an alternate interrupt mapping, as used by A/UX. It spreads ethernet and
+ * sound out to their own autovector IRQs and gives VIA1 a higher priority:
+ *
+ *	1	- unused (?)
+ *
+ *	3	- on-board SONIC
+ *
+ *	5	- Apple Sound Chip (ASC)
+ *
+ *	6	- VIA1
+ *
  * For OSS Macintoshes (IIfx only at this point):
  *
  *	3	- Nubus interrupt
Index: linux-m68k/arch/m68k/mac/config.c
===================================================================
--- linux-m68k.orig/arch/m68k/mac/config.c	2011-10-22 23:02:38.000000000 +1100
+++ linux-m68k/arch/m68k/mac/config.c	2011-10-23 00:51:05.000000000 +1100
@@ -594,7 +594,7 @@ static struct mac_model mac_data_table[]
 		.ident		= MAC_MODEL_TV,
 		.name		= "TV",
 		.adb_type	= MAC_ADB_CUDA,
-		.via_type	= MAC_VIA_QUADRA,
+		.via_type	= MAC_VIA_IIci,
 		.scsi_type	= MAC_SCSI_OLD,
 		.scc_type	= MAC_SCC_II,
 		.nubus_type	= MAC_NUBUS,
Index: linux-m68k/arch/m68k/mac/via.c
===================================================================
--- linux-m68k.orig/arch/m68k/mac/via.c	2011-10-22 23:02:38.000000000 +1100
+++ linux-m68k/arch/m68k/mac/via.c	2011-10-23 00:51:06.000000000 +1100
@@ -193,38 +193,17 @@ void __init via_init(void)
 	if (oss_present)
 		return;
 
-	/* Some machines support an alternate IRQ mapping that spreads  */
-	/* Ethernet and Sound out to their own autolevel IRQs and moves */
-	/* VIA1 to level 6. A/UX uses this mapping and we do too.  Note */
-	/* that the IIfx emulates this alternate mapping using the OSS. */
-
-	via_alt_mapping = 0;
-	if (macintosh_config->via_type == MAC_VIA_QUADRA)
-		switch (macintosh_config->ident) {
-		case MAC_MODEL_C660:
-		case MAC_MODEL_Q840:
-			/* not applicable */
-			break;
-		case MAC_MODEL_P588:
-		case MAC_MODEL_TV:
-		case MAC_MODEL_PB140:
-		case MAC_MODEL_PB145:
-		case MAC_MODEL_PB160:
-		case MAC_MODEL_PB165:
-		case MAC_MODEL_PB165C:
-		case MAC_MODEL_PB170:
-		case MAC_MODEL_PB180:
-		case MAC_MODEL_PB180C:
-		case MAC_MODEL_PB190:
-		case MAC_MODEL_PB520:
-			/* not yet tested */
-			break;
-		default:
-			via_alt_mapping = 1;
-			via1[vDirB] |= 0x40;
-			via1[vBufB] &= ~0x40;
-			break;
-		}
+	if ((macintosh_config->via_type == MAC_VIA_QUADRA) &&
+	    (macintosh_config->adb_type != MAC_ADB_PB1) &&
+	    (macintosh_config->adb_type != MAC_ADB_PB2) &&
+	    (macintosh_config->ident    != MAC_MODEL_C660) &&
+	    (macintosh_config->ident    != MAC_MODEL_Q840)) {
+		via_alt_mapping = 1;
+		via1[vDirB] |= 0x40;
+		via1[vBufB] &= ~0x40;
+	} else {
+		via_alt_mapping = 0;
+	}
 
 	/*
 	 * Now initialize VIA2. For RBV we just kill all interrupts;
