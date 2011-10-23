From: Finn Thain <fthain@telegraphics.com.au>
Subject: [PATCH 12/16] m68k/mac: fix powerbook 150 adb_type
Date: Mon, 24 Oct 2011 01:11:20 +1100
Message-ID: <20111023141206.348211913@telegraphics.com.au>
References: <20111023141108.856998818@telegraphics.com.au>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from vm4.telegraphics.com.au ([98.124.60.149]:46068 "EHLO
	vps4.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755611Ab1JWOMK (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 23 Oct 2011 10:12:10 -0400
Content-Disposition: inline; filename=pb150-adb_type
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org

The PowerBook 150 is a actually a Duo underneath. Fix the adb_type.

Signed-off-by: Finn Thain <fthain@telegraphics.com.au>

---

The kernel doesn't actually treat MAC_ADB_PB1 any differently to MAC_ADB_PB2 hardware and so the PMU driver doesn't work on "V1" PMU hardware. It does work on the PowerBook 150, as that's actually V2.

Index: linux-m68k/arch/m68k/mac/config.c
===================================================================
--- linux-m68k.orig/arch/m68k/mac/config.c	2011-10-22 23:02:39.000000000 +1100
+++ linux-m68k/arch/m68k/mac/config.c	2011-10-23 00:51:01.000000000 +1100
@@ -674,7 +674,7 @@ static struct mac_model mac_data_table[]
 	}, {
 		.ident		= MAC_MODEL_PB150,
 		.name		= "PowerBook 150",
-		.adb_type	= MAC_ADB_PB1,
+		.adb_type	= MAC_ADB_PB2,
 		.via_type	= MAC_VIA_IIci,
 		.scsi_type	= MAC_SCSI_OLD,
 		.ide_type	= MAC_IDE_PB,
