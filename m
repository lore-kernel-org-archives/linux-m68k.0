From: Finn Thain <fthain@telegraphics.com.au>
Subject: [PATCH] m68k/mac: Fix scsi_type for Mac LC and similar models
Date: Mon, 5 Jan 2015 14:35:58 +1100 (AEDT)
Message-ID: <alpine.LNX.2.00.1501051421480.21732@nippy.intranet>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:35914 "EHLO
	kvm5.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753102AbbAEDg3 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 4 Jan 2015 22:36:29 -0500
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org

Designing Cards and Drivers for the Macintosh Family 3rd ed., page 310 
says that the I/O address space for the Mac LC is $50F0 0000 - $50FF FFFF.

I'm guessing that the LC II and LC III are the same, which would mean that 
I've assigned the wrong platform resources to these models. For those 
models, restore the SCSI base addresses as per Linux 3.17 and earlier.

Signed-off-by: Finn Thain <fthain@telegraphics.com.au>

---

The Performa 460 is a rebadged LC III+; the Classic II aka Performa 200 is 
equivalent to the Mac LC.

Based on everything I've read this patch is likely to be correct but I 
can't test it on all of these models. In anycase, this patch isn't 
sufficient to make mac_scsi work on the relevant Macs, for two reasons:

Firstly, aliased I/O address space on some hardware means that 
MAC_SCSI_CCL and MAC_SCSI_OLD are probably equivalent anyway. Secondly, 
from my own testing and from reports from another user, mac_scsi only ever 
worked on the Mac IIfx, because all other models attempt Pseudo DMA.

---
 arch/m68k/mac/config.c |   11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

Index: linux/arch/m68k/mac/config.c
===================================================================
--- linux.orig/arch/m68k/mac/config.c	2015-01-04 21:31:00.000000000 +1100
+++ linux/arch/m68k/mac/config.c	2015-01-04 21:46:25.000000000 +1100
@@ -320,7 +320,7 @@ static struct mac_model mac_data_table[]
 		.name		= "Classic II",
 		.adb_type	= MAC_ADB_IISI,
 		.via_type	= MAC_VIA_IICI,
-		.scsi_type	= MAC_SCSI_OLD,
+		.scsi_type	= MAC_SCSI_CCL,
 		.scc_type	= MAC_SCC_II,
 		.nubus_type	= MAC_NUBUS,
 		.floppy_type	= MAC_FLOPPY_SWIM_ADDR2,
@@ -353,7 +353,7 @@ static struct mac_model mac_data_table[]
 		.name		= "LC",
 		.adb_type	= MAC_ADB_IISI,
 		.via_type	= MAC_VIA_IICI,
-		.scsi_type	= MAC_SCSI_OLD,
+		.scsi_type	= MAC_SCSI_CCL,
 		.scc_type	= MAC_SCC_II,
 		.nubus_type	= MAC_NUBUS,
 		.floppy_type	= MAC_FLOPPY_SWIM_ADDR2,
@@ -362,7 +362,7 @@ static struct mac_model mac_data_table[]
 		.name		= "LC II",
 		.adb_type	= MAC_ADB_IISI,
 		.via_type	= MAC_VIA_IICI,
-		.scsi_type	= MAC_SCSI_OLD,
+		.scsi_type	= MAC_SCSI_CCL,
 		.scc_type	= MAC_SCC_II,
 		.nubus_type	= MAC_NUBUS,
 		.floppy_type	= MAC_FLOPPY_SWIM_ADDR2,
@@ -371,7 +371,7 @@ static struct mac_model mac_data_table[]
 		.name		= "LC III",
 		.adb_type	= MAC_ADB_IISI,
 		.via_type	= MAC_VIA_IICI,
-		.scsi_type	= MAC_SCSI_OLD,
+		.scsi_type	= MAC_SCSI_CCL,
 		.scc_type	= MAC_SCC_II,
 		.nubus_type	= MAC_NUBUS,
 		.floppy_type	= MAC_FLOPPY_SWIM_ADDR2,
@@ -499,7 +499,7 @@ static struct mac_model mac_data_table[]
 		.name		= "Performa 460",
 		.adb_type	= MAC_ADB_IISI,
 		.via_type	= MAC_VIA_IICI,
-		.scsi_type	= MAC_SCSI_OLD,
+		.scsi_type	= MAC_SCSI_CCL,
 		.scc_type	= MAC_SCC_II,
 		.nubus_type	= MAC_NUBUS,
 		.floppy_type	= MAC_FLOPPY_SWIM_ADDR2,
@@ -1111,6 +1111,7 @@ int __init mac_platform_init(void)
 		break;
 	case MAC_SCSI_CCL:
 		/* Addresses from the Color Classic Developer Note.
+		 * Also found in Mac LC data in Designing Cards & Drivers 3ed.
 		 * $50F0 6000 - $50F0 7FFF: SCSI handshake
 		 * $50F1 0000 - $50F1 1FFF: SCSI
 		 * $50F1 2000 - $50F1 3FFF: SCSI DMA
