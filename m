From: Finn Thain <fthain@telegraphics.com.au>
Subject: [PATCH 14/16] m68k/mac: cleanup macro case
Date: Mon, 24 Oct 2011 01:11:22 +1100
Message-ID: <20111023141214.958776068@telegraphics.com.au>
References: <20111023141108.856998818@telegraphics.com.au>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from vm4.telegraphics.com.au ([98.124.60.149]:46078 "EHLO
	vps4.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755626Ab1JWOMT (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 23 Oct 2011 10:12:19 -0400
Content-Disposition: inline; filename=fix-macro-case
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org

Code style convention has macro names in uppercase. Change MAC_VIA_IIci to MAC_VIA_IICI.

Also remove an obsolete comment.

Signed-off-by: Finn Thain <fthain@telegraphics.com.au>

Index: linux-m68k/arch/m68k/include/asm/macintosh.h
===================================================================
--- linux-m68k.orig/arch/m68k/include/asm/macintosh.h	2011-10-22 23:02:38.000000000 +1100
+++ linux-m68k/arch/m68k/include/asm/macintosh.h	2011-10-22 23:02:39.000000000 +1100
@@ -42,7 +42,7 @@ struct mac_model
 #define MAC_ADB_IOP		6
 
 #define MAC_VIA_II		1
-#define MAC_VIA_IIci		2
+#define MAC_VIA_IICI		2
 #define MAC_VIA_QUADRA		3
 
 #define MAC_SCSI_NONE		0
Index: linux-m68k/arch/m68k/mac/config.c
===================================================================
--- linux-m68k.orig/arch/m68k/mac/config.c	2011-10-22 23:02:39.000000000 +1100
+++ linux-m68k/arch/m68k/mac/config.c	2011-10-22 23:02:39.000000000 +1100
@@ -221,7 +221,7 @@ void __init config_mac(void)
  * inaccurate, so look here if a new Mac model won't run. Example: if
  * a Mac crashes immediately after the VIA1 registers have been dumped
  * to the screen, it probably died attempting to read DirB on a RBV.
- * Meaning it should have MAC_VIA_IIci here :-)
+ * Meaning it should have MAC_VIA_IICI here :-)
  */
 
 struct mac_model *macintosh_config;
@@ -296,7 +296,7 @@ static struct mac_model mac_data_table[]
 		.ident		= MAC_MODEL_IICI,
 		.name		= "IIci",
 		.adb_type	= MAC_ADB_II,
-		.via_type	= MAC_VIA_IIci,
+		.via_type	= MAC_VIA_IICI,
 		.scsi_type	= MAC_SCSI_OLD,
 		.scc_type	= MAC_SCC_II,
 		.nubus_type	= MAC_NUBUS,
@@ -305,7 +305,7 @@ static struct mac_model mac_data_table[]
 		.ident		= MAC_MODEL_IIFX,
 		.name		= "IIfx",
 		.adb_type	= MAC_ADB_IOP,
-		.via_type	= MAC_VIA_IIci,
+		.via_type	= MAC_VIA_IICI,
 		.scsi_type	= MAC_SCSI_OLD,
 		.scc_type	= MAC_SCC_IOP,
 		.nubus_type	= MAC_NUBUS,
@@ -314,7 +314,7 @@ static struct mac_model mac_data_table[]
 		.ident		= MAC_MODEL_IISI,
 		.name		= "IIsi",
 		.adb_type	= MAC_ADB_IISI,
-		.via_type	= MAC_VIA_IIci,
+		.via_type	= MAC_VIA_IICI,
 		.scsi_type	= MAC_SCSI_OLD,
 		.scc_type	= MAC_SCC_II,
 		.nubus_type	= MAC_NUBUS,
@@ -323,7 +323,7 @@ static struct mac_model mac_data_table[]
 		.ident		= MAC_MODEL_IIVI,
 		.name		= "IIvi",
 		.adb_type	= MAC_ADB_IISI,
-		.via_type	= MAC_VIA_IIci,
+		.via_type	= MAC_VIA_IICI,
 		.scsi_type	= MAC_SCSI_OLD,
 		.scc_type	= MAC_SCC_II,
 		.nubus_type	= MAC_NUBUS,
@@ -332,7 +332,7 @@ static struct mac_model mac_data_table[]
 		.ident		= MAC_MODEL_IIVX,
 		.name		= "IIvx",
 		.adb_type	= MAC_ADB_IISI,
-		.via_type	= MAC_VIA_IIci,
+		.via_type	= MAC_VIA_IICI,
 		.scsi_type	= MAC_SCSI_OLD,
 		.scc_type	= MAC_SCC_II,
 		.nubus_type	= MAC_NUBUS,
@@ -347,7 +347,7 @@ static struct mac_model mac_data_table[]
 		.ident		= MAC_MODEL_CLII,
 		.name		= "Classic II",
 		.adb_type	= MAC_ADB_IISI,
-		.via_type	= MAC_VIA_IIci,
+		.via_type	= MAC_VIA_IICI,
 		.scsi_type	= MAC_SCSI_OLD,
 		.scc_type	= MAC_SCC_II,
 		.nubus_type	= MAC_NUBUS,
@@ -356,7 +356,7 @@ static struct mac_model mac_data_table[]
 		.ident		= MAC_MODEL_CCL,
 		.name		= "Color Classic",
 		.adb_type	= MAC_ADB_CUDA,
-		.via_type	= MAC_VIA_IIci,
+		.via_type	= MAC_VIA_IICI,
 		.scsi_type	= MAC_SCSI_OLD,
 		.scc_type	= MAC_SCC_II,
 		.nubus_type	= MAC_NUBUS,
@@ -365,7 +365,7 @@ static struct mac_model mac_data_table[]
 		.ident		= MAC_MODEL_CCLII,
 		.name		= "Color Classic II",
 		.adb_type	= MAC_ADB_CUDA,
-		.via_type	= MAC_VIA_IIci,
+		.via_type	= MAC_VIA_IICI,
 		.scsi_type	= MAC_SCSI_OLD,
 		.scc_type	= MAC_SCC_II,
 		.nubus_type	= MAC_NUBUS,
@@ -380,7 +380,7 @@ static struct mac_model mac_data_table[]
 		.ident		= MAC_MODEL_LC,
 		.name		= "LC",
 		.adb_type	= MAC_ADB_IISI,
-		.via_type	= MAC_VIA_IIci,
+		.via_type	= MAC_VIA_IICI,
 		.scsi_type	= MAC_SCSI_OLD,
 		.scc_type	= MAC_SCC_II,
 		.nubus_type	= MAC_NUBUS,
@@ -389,7 +389,7 @@ static struct mac_model mac_data_table[]
 		.ident		= MAC_MODEL_LCII,
 		.name		= "LC II",
 		.adb_type	= MAC_ADB_IISI,
-		.via_type	= MAC_VIA_IIci,
+		.via_type	= MAC_VIA_IICI,
 		.scsi_type	= MAC_SCSI_OLD,
 		.scc_type	= MAC_SCC_II,
 		.nubus_type	= MAC_NUBUS,
@@ -398,7 +398,7 @@ static struct mac_model mac_data_table[]
 		.ident		= MAC_MODEL_LCIII,
 		.name		= "LC III",
 		.adb_type	= MAC_ADB_IISI,
-		.via_type	= MAC_VIA_IIci,
+		.via_type	= MAC_VIA_IICI,
 		.scsi_type	= MAC_SCSI_OLD,
 		.scc_type	= MAC_SCC_II,
 		.nubus_type	= MAC_NUBUS,
@@ -526,7 +526,7 @@ static struct mac_model mac_data_table[]
 		.ident		= MAC_MODEL_P460,
 		.name		= "Performa 460",
 		.adb_type	= MAC_ADB_IISI,
-		.via_type	= MAC_VIA_IIci,
+		.via_type	= MAC_VIA_IICI,
 		.scsi_type	= MAC_SCSI_OLD,
 		.scc_type	= MAC_SCC_II,
 		.nubus_type	= MAC_NUBUS,
@@ -553,7 +553,7 @@ static struct mac_model mac_data_table[]
 		.ident		= MAC_MODEL_P520,
 		.name		= "Performa 520",
 		.adb_type	= MAC_ADB_CUDA,
-		.via_type	= MAC_VIA_IIci,
+		.via_type	= MAC_VIA_IICI,
 		.scsi_type	= MAC_SCSI_OLD,
 		.scc_type	= MAC_SCC_II,
 		.nubus_type	= MAC_NUBUS,
@@ -562,7 +562,7 @@ static struct mac_model mac_data_table[]
 		.ident		= MAC_MODEL_P550,
 		.name		= "Performa 550",
 		.adb_type	= MAC_ADB_CUDA,
-		.via_type	= MAC_VIA_IIci,
+		.via_type	= MAC_VIA_IICI,
 		.scsi_type	= MAC_SCSI_OLD,
 		.scc_type	= MAC_SCC_II,
 		.nubus_type	= MAC_NUBUS,
@@ -594,7 +594,7 @@ static struct mac_model mac_data_table[]
 		.ident		= MAC_MODEL_TV,
 		.name		= "TV",
 		.adb_type	= MAC_ADB_CUDA,
-		.via_type	= MAC_VIA_IIci,
+		.via_type	= MAC_VIA_IICI,
 		.scsi_type	= MAC_SCSI_OLD,
 		.scc_type	= MAC_SCC_II,
 		.nubus_type	= MAC_NUBUS,
@@ -603,7 +603,7 @@ static struct mac_model mac_data_table[]
 		.ident		= MAC_MODEL_P600,
 		.name		= "Performa 600",
 		.adb_type	= MAC_ADB_IISI,
-		.via_type	= MAC_VIA_IIci,
+		.via_type	= MAC_VIA_IICI,
 		.scsi_type	= MAC_SCSI_OLD,
 		.scc_type	= MAC_SCC_II,
 		.nubus_type	= MAC_NUBUS,
@@ -675,7 +675,7 @@ static struct mac_model mac_data_table[]
 		.ident		= MAC_MODEL_PB150,
 		.name		= "PowerBook 150",
 		.adb_type	= MAC_ADB_PB2,
-		.via_type	= MAC_VIA_IIci,
+		.via_type	= MAC_VIA_IICI,
 		.scsi_type	= MAC_SCSI_OLD,
 		.ide_type	= MAC_IDE_PB,
 		.scc_type	= MAC_SCC_QUADRA,
@@ -761,17 +761,13 @@ static struct mac_model mac_data_table[]
 	 * PowerBook Duos are pretty much like normal PowerBooks
 	 * All of these probably have onboard SONIC in the Dock which
 	 * means we'll have to probe for it eventually.
-	 *
-	 * Are these really MAC_VIA_IIci? The developer notes for the
-	 * Duos show pretty much the same custom parts as in most of
-	 * the other PowerBooks which would imply MAC_VIA_QUADRA.
 	 */
 
 	{
 		.ident		= MAC_MODEL_PB210,
 		.name		= "PowerBook Duo 210",
 		.adb_type	= MAC_ADB_PB2,
-		.via_type	= MAC_VIA_IIci,
+		.via_type	= MAC_VIA_IICI,
 		.scsi_type	= MAC_SCSI_OLD,
 		.scc_type	= MAC_SCC_QUADRA,
 		.nubus_type	= MAC_NUBUS,
@@ -780,7 +776,7 @@ static struct mac_model mac_data_table[]
 		.ident		= MAC_MODEL_PB230,
 		.name		= "PowerBook Duo 230",
 		.adb_type	= MAC_ADB_PB2,
-		.via_type	= MAC_VIA_IIci,
+		.via_type	= MAC_VIA_IICI,
 		.scsi_type	= MAC_SCSI_OLD,
 		.scc_type	= MAC_SCC_QUADRA,
 		.nubus_type	= MAC_NUBUS,
@@ -789,7 +785,7 @@ static struct mac_model mac_data_table[]
 		.ident		= MAC_MODEL_PB250,
 		.name		= "PowerBook Duo 250",
 		.adb_type	= MAC_ADB_PB2,
-		.via_type	= MAC_VIA_IIci,
+		.via_type	= MAC_VIA_IICI,
 		.scsi_type	= MAC_SCSI_OLD,
 		.scc_type	= MAC_SCC_QUADRA,
 		.nubus_type	= MAC_NUBUS,
@@ -798,7 +794,7 @@ static struct mac_model mac_data_table[]
 		.ident		= MAC_MODEL_PB270C,
 		.name		= "PowerBook Duo 270c",
 		.adb_type	= MAC_ADB_PB2,
-		.via_type	= MAC_VIA_IIci,
+		.via_type	= MAC_VIA_IICI,
 		.scsi_type	= MAC_SCSI_OLD,
 		.scc_type	= MAC_SCC_QUADRA,
 		.nubus_type	= MAC_NUBUS,
@@ -807,7 +803,7 @@ static struct mac_model mac_data_table[]
 		.ident		= MAC_MODEL_PB280,
 		.name		= "PowerBook Duo 280",
 		.adb_type	= MAC_ADB_PB2,
-		.via_type	= MAC_VIA_IIci,
+		.via_type	= MAC_VIA_IICI,
 		.scsi_type	= MAC_SCSI_OLD,
 		.scc_type	= MAC_SCC_QUADRA,
 		.nubus_type	= MAC_NUBUS,
@@ -816,7 +812,7 @@ static struct mac_model mac_data_table[]
 		.ident		= MAC_MODEL_PB280C,
 		.name		= "PowerBook Duo 280c",
 		.adb_type	= MAC_ADB_PB2,
-		.via_type	= MAC_VIA_IIci,
+		.via_type	= MAC_VIA_IICI,
 		.scsi_type	= MAC_SCSI_OLD,
 		.scc_type	= MAC_SCC_QUADRA,
 		.nubus_type	= MAC_NUBUS,
Index: linux-m68k/arch/m68k/mac/via.c
===================================================================
--- linux-m68k.orig/arch/m68k/mac/via.c	2011-10-22 23:02:39.000000000 +1100
+++ linux-m68k/arch/m68k/mac/via.c	2011-10-23 00:50:51.000000000 +1100
@@ -125,7 +125,7 @@ void __init via_init(void)
 
 		/* IIci, IIsi, IIvx, IIvi (P6xx), LC series */
 
-		case MAC_VIA_IIci:
+		case MAC_VIA_IICI:
 			via1 = (void *) VIA1_BASE;
 			if (macintosh_config->ident == MAC_MODEL_IIFX) {
 				via2 = NULL;
@@ -398,7 +398,7 @@ void __init via_nubus_init(void)
 	case MAC_VIA_QUADRA:
 		pr_debug("VIA2 vDirA is 0x%02X\n", via2[vDirA]);
 		break;
-	case MAC_VIA_IIci:
+	case MAC_VIA_IICI:
 		/* RBV. Disable all the slot interrupts. SIER works like IER. */
 		via2[rSIER] = 0x7F;
 		break;
@@ -421,7 +421,7 @@ void via_nubus_irq_startup(int irq)
 			via2[vDirA] &= 0x80 | ~(1 << irq_idx);
 		}
 		/* fall through */
-	case MAC_VIA_IIci:
+	case MAC_VIA_IICI:
 		via_irq_enable(irq);
 		break;
 	}
@@ -435,7 +435,7 @@ void via_nubus_irq_shutdown(int irq)
 		/* Ensure that the umbrella CA1 interrupt remains enabled. */
 		via_irq_enable(irq);
 		break;
-	case MAC_VIA_IIci:
+	case MAC_VIA_IICI:
 		via_irq_disable(irq);
 		break;
 	}
@@ -568,7 +568,7 @@ void via_irq_enable(int irq) {
 			if (!nubus_disabled)
 				via2[gIER] = IER_SET_BIT(1);
 			break;
-		case MAC_VIA_IIci:
+		case MAC_VIA_IICI:
 			/* On RBV, enable the slot interrupt.
 			 * SIER works like IER.
 			 */
@@ -598,7 +598,7 @@ void via_irq_disable(int irq) {
 			if (nubus_disabled)
 				via2[gIER] = IER_CLR_BIT(1);
 			break;
-		case MAC_VIA_IIci:
+		case MAC_VIA_IICI:
 			via2[rSIER] = IER_CLR_BIT(irq_idx);
 			break;
 		}
