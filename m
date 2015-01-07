From: Finn Thain <fthain@telegraphics.com.au>
Subject: [PATCH v2] m68k/mac: Fix scsi_type for Mac LC and similar models
Date: Wed, 7 Jan 2015 11:17:35 +1100 (AEDT)
Message-ID: <alpine.LNX.2.00.1501071104260.12963@nippy.intranet>
References: <alpine.LNX.2.00.1501051421480.21732@nippy.intranet>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:38064 "EHLO
	kvm5.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751667AbbAGASB (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 6 Jan 2015 19:18:01 -0500
In-Reply-To: <alpine.LNX.2.00.1501051421480.21732@nippy.intranet>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org

Designing Cards and Drivers for the Macintosh Family, 3rd ed. on page 310
says that the I/O address space for the Mac LC is $50F0 0000 - $50FF FFFF.
The developer notes for the Classic II, LC III and IIvx/IIvi give the same
I/O address space.

That means I've assigned the wrong platform resources to those Mac models. 
Fix the scsi_type initialization for the affected models, to restore the 
SCSI base address to its value prior to Linux 3.18.

Also rename MAC_SCSI_CCL as MAC_SCSI_LC for the sake of correct chronology.

Signed-off-by: Finn Thain <fthain@telegraphics.com.au>

---

The Performa 460 is a rebadged LC III+. The Performa 600 is essentially
equivalent to the Mac IIvx and IIvi.

Based on everything I've read this patch is likely to be correct but I 
can't test it on all of these models. This patch isn't sufficient to make 
mac_scsi work on the affected models, for two reasons. Firstly, aliased 
I/O address space on some hardware means that MAC_SCSI_CCL and 
MAC_SCSI_OLD are probably equivalent, in which case nothing would change 
in practice. Secondly, from my own testing and from reports from another 
user, mac_scsi only ever worked on the Mac IIfx, because all other models 
attempt Pseudo DMA. Having said that, it is possible that v3.18 may have 
caused some kind of regression in mac_scsi (that is, a different failure 
mode on some hardware).

Changes since v1:
- Fix up Mac IIvi, IIvx and Performa 600 also.
- Rename MAC_SCSI_CCL macro.

---
 arch/m68k/include/asm/macintosh.h |    2 +-
 arch/m68k/mac/config.c            |   32 +++++++++++++++++---------------
 2 files changed, 18 insertions(+), 16 deletions(-)

Index: linux/arch/m68k/mac/config.c
===================================================================
--- linux.orig/arch/m68k/mac/config.c	2015-01-07 11:06:39.000000000 +1100
+++ linux/arch/m68k/mac/config.c	2015-01-07 11:06:41.000000000 +1100
@@ -296,7 +296,7 @@ static struct mac_model mac_data_table[]
 		.name		= "IIvi",
 		.adb_type	= MAC_ADB_IISI,
 		.via_type	= MAC_VIA_IICI,
-		.scsi_type	= MAC_SCSI_OLD,
+		.scsi_type	= MAC_SCSI_LC,
 		.scc_type	= MAC_SCC_II,
 		.nubus_type	= MAC_NUBUS,
 		.floppy_type	= MAC_FLOPPY_SWIM_ADDR2,
@@ -305,7 +305,7 @@ static struct mac_model mac_data_table[]
 		.name		= "IIvx",
 		.adb_type	= MAC_ADB_IISI,
 		.via_type	= MAC_VIA_IICI,
-		.scsi_type	= MAC_SCSI_OLD,
+		.scsi_type	= MAC_SCSI_LC,
 		.scc_type	= MAC_SCC_II,
 		.nubus_type	= MAC_NUBUS,
 		.floppy_type	= MAC_FLOPPY_SWIM_ADDR2,
@@ -320,7 +320,7 @@ static struct mac_model mac_data_table[]
 		.name		= "Classic II",
 		.adb_type	= MAC_ADB_IISI,
 		.via_type	= MAC_VIA_IICI,
-		.scsi_type	= MAC_SCSI_OLD,
+		.scsi_type	= MAC_SCSI_LC,
 		.scc_type	= MAC_SCC_II,
 		.nubus_type	= MAC_NUBUS,
 		.floppy_type	= MAC_FLOPPY_SWIM_ADDR2,
@@ -329,7 +329,7 @@ static struct mac_model mac_data_table[]
 		.name		= "Color Classic",
 		.adb_type	= MAC_ADB_CUDA,
 		.via_type	= MAC_VIA_IICI,
-		.scsi_type	= MAC_SCSI_CCL,
+		.scsi_type	= MAC_SCSI_LC,
 		.scc_type	= MAC_SCC_II,
 		.nubus_type	= MAC_NUBUS,
 		.floppy_type	= MAC_FLOPPY_SWIM_ADDR2,
@@ -338,7 +338,7 @@ static struct mac_model mac_data_table[]
 		.name		= "Color Classic II",
 		.adb_type	= MAC_ADB_CUDA,
 		.via_type	= MAC_VIA_IICI,
-		.scsi_type	= MAC_SCSI_CCL,
+		.scsi_type	= MAC_SCSI_LC,
 		.scc_type	= MAC_SCC_II,
 		.nubus_type	= MAC_NUBUS,
 		.floppy_type	= MAC_FLOPPY_SWIM_ADDR2,
@@ -353,7 +353,7 @@ static struct mac_model mac_data_table[]
 		.name		= "LC",
 		.adb_type	= MAC_ADB_IISI,
 		.via_type	= MAC_VIA_IICI,
-		.scsi_type	= MAC_SCSI_OLD,
+		.scsi_type	= MAC_SCSI_LC,
 		.scc_type	= MAC_SCC_II,
 		.nubus_type	= MAC_NUBUS,
 		.floppy_type	= MAC_FLOPPY_SWIM_ADDR2,
@@ -362,7 +362,7 @@ static struct mac_model mac_data_table[]
 		.name		= "LC II",
 		.adb_type	= MAC_ADB_IISI,
 		.via_type	= MAC_VIA_IICI,
-		.scsi_type	= MAC_SCSI_OLD,
+		.scsi_type	= MAC_SCSI_LC,
 		.scc_type	= MAC_SCC_II,
 		.nubus_type	= MAC_NUBUS,
 		.floppy_type	= MAC_FLOPPY_SWIM_ADDR2,
@@ -371,7 +371,7 @@ static struct mac_model mac_data_table[]
 		.name		= "LC III",
 		.adb_type	= MAC_ADB_IISI,
 		.via_type	= MAC_VIA_IICI,
-		.scsi_type	= MAC_SCSI_OLD,
+		.scsi_type	= MAC_SCSI_LC,
 		.scc_type	= MAC_SCC_II,
 		.nubus_type	= MAC_NUBUS,
 		.floppy_type	= MAC_FLOPPY_SWIM_ADDR2,
@@ -499,7 +499,7 @@ static struct mac_model mac_data_table[]
 		.name		= "Performa 460",
 		.adb_type	= MAC_ADB_IISI,
 		.via_type	= MAC_VIA_IICI,
-		.scsi_type	= MAC_SCSI_OLD,
+		.scsi_type	= MAC_SCSI_LC,
 		.scc_type	= MAC_SCC_II,
 		.nubus_type	= MAC_NUBUS,
 		.floppy_type	= MAC_FLOPPY_SWIM_ADDR2,
@@ -526,7 +526,7 @@ static struct mac_model mac_data_table[]
 		.name		= "Performa 520",
 		.adb_type	= MAC_ADB_CUDA,
 		.via_type	= MAC_VIA_IICI,
-		.scsi_type	= MAC_SCSI_CCL,
+		.scsi_type	= MAC_SCSI_LC,
 		.scc_type	= MAC_SCC_II,
 		.nubus_type	= MAC_NUBUS,
 		.floppy_type	= MAC_FLOPPY_SWIM_ADDR2,
@@ -535,7 +535,7 @@ static struct mac_model mac_data_table[]
 		.name		= "Performa 550",
 		.adb_type	= MAC_ADB_CUDA,
 		.via_type	= MAC_VIA_IICI,
-		.scsi_type	= MAC_SCSI_CCL,
+		.scsi_type	= MAC_SCSI_LC,
 		.scc_type	= MAC_SCC_II,
 		.nubus_type	= MAC_NUBUS,
 		.floppy_type	= MAC_FLOPPY_SWIM_ADDR2,
@@ -567,7 +567,7 @@ static struct mac_model mac_data_table[]
 		.name		= "TV",
 		.adb_type	= MAC_ADB_CUDA,
 		.via_type	= MAC_VIA_IICI,
-		.scsi_type	= MAC_SCSI_CCL,
+		.scsi_type	= MAC_SCSI_LC,
 		.scc_type	= MAC_SCC_II,
 		.nubus_type	= MAC_NUBUS,
 		.floppy_type	= MAC_FLOPPY_SWIM_ADDR2,
@@ -576,7 +576,7 @@ static struct mac_model mac_data_table[]
 		.name		= "Performa 600",
 		.adb_type	= MAC_ADB_IISI,
 		.via_type	= MAC_VIA_IICI,
-		.scsi_type	= MAC_SCSI_OLD,
+		.scsi_type	= MAC_SCSI_LC,
 		.scc_type	= MAC_SCC_II,
 		.nubus_type	= MAC_NUBUS,
 		.floppy_type	= MAC_FLOPPY_SWIM_ADDR2,
@@ -1109,8 +1109,10 @@ int __init mac_platform_init(void)
 		platform_device_register_simple("mac_scsi", 0,
 			mac_scsi_late_rsrc, ARRAY_SIZE(mac_scsi_late_rsrc));
 		break;
-	case MAC_SCSI_CCL:
-		/* Addresses from the Color Classic Developer Note.
+	case MAC_SCSI_LC:
+		/* Addresses from Mac LC data in Designing Cards & Drivers 3ed.
+		 * Also from the Developer Notes for Classic II, LC III,
+		 * Color Classic and IIvx.
 		 * $50F0 6000 - $50F0 7FFF: SCSI handshake
 		 * $50F1 0000 - $50F1 1FFF: SCSI
 		 * $50F1 2000 - $50F1 3FFF: SCSI DMA
Index: linux/arch/m68k/include/asm/macintosh.h
===================================================================
--- linux.orig/arch/m68k/include/asm/macintosh.h	2015-01-07 11:06:39.000000000 +1100
+++ linux/arch/m68k/include/asm/macintosh.h	2015-01-07 11:06:41.000000000 +1100
@@ -55,7 +55,7 @@ struct mac_model
 #define MAC_SCSI_QUADRA3	4
 #define MAC_SCSI_IIFX		5
 #define MAC_SCSI_DUO		6
-#define MAC_SCSI_CCL		7
+#define MAC_SCSI_LC		7
 #define MAC_SCSI_LATE		8
 
 #define MAC_IDE_NONE		0
