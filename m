From: Laurent Vivier <laurent@lvivier.info>
Subject: [PATCH 1/2] Add a new entry in mac_model to identify the floppy controller type.
Date: Tue,  4 Nov 2008 14:42:16 +0100
Message-ID: <12258061372635-git-send-email-laurent@lvivier.info>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from smtp6-g19.free.fr ([212.27.42.36]:42554 "EHLO smtp6-g19.free.fr"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751978AbYKDNmu (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
	Tue, 4 Nov 2008 08:42:50 -0500
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: geert@linux-m68k.org
Cc: linux-m68k@vger.kernel.org, Laurent Vivier <Laurent@lvivier.info>

From: Laurent Vivier <Laurent@lvivier.info>

This patch adds a field "floppy_type" which can take the following values:

MAC_FLOPPY_IWM for an IWM based mac
MAC_FLOPPY_SWIM_ADDR1 for a SWIM based mac with controller at VIA1 + 0x1E000
MAC_FLOPPY_SWIM_ADDR2 for a SWIM based mac with controller at VIA1 + 0x16000
MAC_FLOPPY_IOP for an IOP based mac
MAC_FLOPPY_AV for an AV based mac

Signed-off-by: Laurent Vivier <Laurent@lvivier.info>
---
 arch/m68k/mac/config.c       |  163 ++++++++++++++++++++++++++++--------------
 include/asm-m68k/macintosh.h |    7 ++
 2 files changed, 116 insertions(+), 54 deletions(-)

diff --git a/arch/m68k/mac/config.c b/arch/m68k/mac/config.c
index c45e184..8bcfef1 100644
--- a/arch/m68k/mac/config.c
+++ b/arch/m68k/mac/config.c
@@ -235,7 +235,8 @@ static struct mac_model mac_data_table[] = {
 		.via_type	= MAC_VIA_II,
 		.scsi_type	= MAC_SCSI_OLD,
 		.scc_type	= MAC_SCC_II,
-		.nubus_type	= MAC_NUBUS
+		.nubus_type	= MAC_NUBUS,
+		.floppy_type	= MAC_FLOPPY_IWM
 	},
 
 	/*
@@ -250,7 +251,8 @@ static struct mac_model mac_data_table[] = {
 		.via_type	= MAC_VIA_II,
 		.scsi_type	= MAC_SCSI_OLD,
 		.scc_type	= MAC_SCC_II,
-		.nubus_type	= MAC_NUBUS
+		.nubus_type	= MAC_NUBUS,
+		.floppy_type	= MAC_FLOPPY_IWM
 	}, {
 		.ident		= MAC_MODEL_IIX,
 		.name		= "IIx",
@@ -258,7 +260,8 @@ static struct mac_model mac_data_table[] = {
 		.via_type	= MAC_VIA_II,
 		.scsi_type	= MAC_SCSI_OLD,
 		.scc_type	= MAC_SCC_II,
-		.nubus_type	= MAC_NUBUS
+		.nubus_type	= MAC_NUBUS,
+		.floppy_type	= MAC_FLOPPY_SWIM_ADDR2
 	}, {
 		.ident		= MAC_MODEL_IICX,
 		.name		= "IIcx",
@@ -266,7 +269,8 @@ static struct mac_model mac_data_table[] = {
 		.via_type	= MAC_VIA_II,
 		.scsi_type	= MAC_SCSI_OLD,
 		.scc_type	= MAC_SCC_II,
-		.nubus_type	= MAC_NUBUS
+		.nubus_type	= MAC_NUBUS,
+		.floppy_type    = MAC_FLOPPY_SWIM_ADDR2
 	}, {
 		.ident		= MAC_MODEL_SE30,
 		.name		= "SE/30",
@@ -274,7 +278,8 @@ static struct mac_model mac_data_table[] = {
 		.via_type	= MAC_VIA_II,
 		.scsi_type	= MAC_SCSI_OLD,
 		.scc_type	= MAC_SCC_II,
-		.nubus_type	= MAC_NUBUS
+		.nubus_type	= MAC_NUBUS,
+		.floppy_type    = MAC_FLOPPY_SWIM_ADDR2
 	},
 
 	/*
@@ -291,7 +296,8 @@ static struct mac_model mac_data_table[] = {
 		.via_type	= MAC_VIA_IIci,
 		.scsi_type	= MAC_SCSI_OLD,
 		.scc_type	= MAC_SCC_II,
-		.nubus_type	= MAC_NUBUS
+		.nubus_type	= MAC_NUBUS,
+		.floppy_type    = MAC_FLOPPY_SWIM_ADDR2
 	}, {
 		.ident		= MAC_MODEL_IIFX,
 		.name		= "IIfx",
@@ -299,7 +305,8 @@ static struct mac_model mac_data_table[] = {
 		.via_type	= MAC_VIA_IIci,
 		.scsi_type	= MAC_SCSI_OLD,
 		.scc_type	= MAC_SCC_IOP,
-		.nubus_type	= MAC_NUBUS
+		.nubus_type	= MAC_NUBUS,
+		.floppy_type    = MAC_FLOPPY_SWIM_IOP
 	}, {
 		.ident		= MAC_MODEL_IISI,
 		.name		= "IIsi",
@@ -307,7 +314,8 @@ static struct mac_model mac_data_table[] = {
 		.via_type	= MAC_VIA_IIci,
 		.scsi_type	= MAC_SCSI_OLD,
 		.scc_type	= MAC_SCC_II,
-		.nubus_type	= MAC_NUBUS
+		.nubus_type	= MAC_NUBUS,
+		.floppy_type    = MAC_FLOPPY_SWIM_ADDR2
 	}, {
 		.ident		= MAC_MODEL_IIVI,
 		.name		= "IIvi",
@@ -315,7 +323,8 @@ static struct mac_model mac_data_table[] = {
 		.via_type	= MAC_VIA_IIci,
 		.scsi_type	= MAC_SCSI_OLD,
 		.scc_type	= MAC_SCC_II,
-		.nubus_type	= MAC_NUBUS
+		.nubus_type	= MAC_NUBUS,
+		.floppy_type    = MAC_FLOPPY_SWIM_ADDR2
 	}, {
 		.ident		= MAC_MODEL_IIVX,
 		.name		= "IIvx",
@@ -323,7 +332,8 @@ static struct mac_model mac_data_table[] = {
 		.via_type	= MAC_VIA_IIci,
 		.scsi_type	= MAC_SCSI_OLD,
 		.scc_type	= MAC_SCC_II,
-		.nubus_type	= MAC_NUBUS
+		.nubus_type	= MAC_NUBUS,
+		.floppy_type    = MAC_FLOPPY_SWIM_ADDR2
 	},
 
 	/*
@@ -337,7 +347,8 @@ static struct mac_model mac_data_table[] = {
 		.via_type	= MAC_VIA_IIci,
 		.scsi_type	= MAC_SCSI_OLD,
 		.scc_type	= MAC_SCC_II,
-		.nubus_type	= MAC_NUBUS
+		.nubus_type	= MAC_NUBUS,
+		.floppy_type    = MAC_FLOPPY_SWIM_ADDR2
 	}, {
 		.ident		= MAC_MODEL_CCL,
 		.name		= "Color Classic",
@@ -345,7 +356,9 @@ static struct mac_model mac_data_table[] = {
 		.via_type	= MAC_VIA_IIci,
 		.scsi_type	= MAC_SCSI_OLD,
 		.scc_type	= MAC_SCC_II,
-		.nubus_type	= MAC_NUBUS},
+		.nubus_type	= MAC_NUBUS,
+		.floppy_type    = MAC_FLOPPY_SWIM_ADDR2
+	},
 
 	/*
 	 *	Some Mac LC machines. Basically the same as the IIci, ADB like IIsi
@@ -358,7 +371,8 @@ static struct mac_model mac_data_table[] = {
 		.via_type	= MAC_VIA_IIci,
 		.scsi_type	= MAC_SCSI_OLD,
 		.scc_type	= MAC_SCC_II,
-		.nubus_type	= MAC_NUBUS
+		.nubus_type	= MAC_NUBUS,
+		.floppy_type    = MAC_FLOPPY_SWIM_ADDR2
 	}, {
 		.ident		= MAC_MODEL_LCII,
 		.name		= "LC II",
@@ -366,7 +380,8 @@ static struct mac_model mac_data_table[] = {
 		.via_type	= MAC_VIA_IIci,
 		.scsi_type	= MAC_SCSI_OLD,
 		.scc_type	= MAC_SCC_II,
-		.nubus_type	= MAC_NUBUS
+		.nubus_type	= MAC_NUBUS,
+		.floppy_type    = MAC_FLOPPY_SWIM_ADDR2
 	}, {
 		.ident		= MAC_MODEL_LCIII,
 		.name		= "LC III",
@@ -374,7 +389,8 @@ static struct mac_model mac_data_table[] = {
 		.via_type	= MAC_VIA_IIci,
 		.scsi_type	= MAC_SCSI_OLD,
 		.scc_type	= MAC_SCC_II,
-		.nubus_type	= MAC_NUBUS
+		.nubus_type	= MAC_NUBUS,
+		.floppy_type    = MAC_FLOPPY_SWIM_ADDR2
 	},
 
 	/*
@@ -394,7 +410,8 @@ static struct mac_model mac_data_table[] = {
 		.via_type	= MAC_VIA_QUADRA,
 		.scsi_type	= MAC_SCSI_QUADRA,
 		.scc_type	= MAC_SCC_QUADRA,
-		.nubus_type	= MAC_NUBUS
+		.nubus_type	= MAC_NUBUS,
+		.floppy_type	= MAC_FLOPPY_SWIM_ADDR1
 	}, {
 		.ident		= MAC_MODEL_Q605_ACC,
 		.name		= "Quadra 605",
@@ -402,7 +419,8 @@ static struct mac_model mac_data_table[] = {
 		.via_type	= MAC_VIA_QUADRA,
 		.scsi_type	= MAC_SCSI_QUADRA,
 		.scc_type	= MAC_SCC_QUADRA,
-		.nubus_type	= MAC_NUBUS
+		.nubus_type	= MAC_NUBUS,
+		.floppy_type	= MAC_FLOPPY_SWIM_ADDR1
 	}, {
 		.ident		= MAC_MODEL_Q610,
 		.name		= "Quadra 610",
@@ -411,7 +429,8 @@ static struct mac_model mac_data_table[] = {
 		.scsi_type	= MAC_SCSI_QUADRA,
 		.scc_type	= MAC_SCC_QUADRA,
 		.ether_type	= MAC_ETHER_SONIC,
-		.nubus_type	= MAC_NUBUS
+		.nubus_type	= MAC_NUBUS,
+		.floppy_type	= MAC_FLOPPY_SWIM_ADDR1
 	}, {
 		.ident		= MAC_MODEL_Q630,
 		.name		= "Quadra 630",
@@ -421,7 +440,8 @@ static struct mac_model mac_data_table[] = {
 		.ide_type	= MAC_IDE_QUADRA,
 		.scc_type	= MAC_SCC_QUADRA,
 		.ether_type	= MAC_ETHER_SONIC,
-		.nubus_type	= MAC_NUBUS
+		.nubus_type	= MAC_NUBUS,
+		.floppy_type	= MAC_FLOPPY_SWIM_ADDR1
 	}, {
 		.ident		= MAC_MODEL_Q650,
 		.name		= "Quadra 650",
@@ -430,7 +450,8 @@ static struct mac_model mac_data_table[] = {
 		.scsi_type	= MAC_SCSI_QUADRA,
 		.scc_type	= MAC_SCC_QUADRA,
 		.ether_type	= MAC_ETHER_SONIC,
-		.nubus_type	= MAC_NUBUS
+		.nubus_type	= MAC_NUBUS,
+		.floppy_type	= MAC_FLOPPY_SWIM_ADDR1
 	},
 	/*	The Q700 does have a NS Sonic */
 	{
@@ -441,7 +462,8 @@ static struct mac_model mac_data_table[] = {
 		.scsi_type	= MAC_SCSI_QUADRA2,
 		.scc_type	= MAC_SCC_QUADRA,
 		.ether_type	= MAC_ETHER_SONIC,
-		.nubus_type	= MAC_NUBUS
+		.nubus_type	= MAC_NUBUS,
+		.floppy_type	= MAC_FLOPPY_SWIM_ADDR1
 	}, {
 		.ident		= MAC_MODEL_Q800,
 		.name		= "Quadra 800",
@@ -450,7 +472,8 @@ static struct mac_model mac_data_table[] = {
 		.scsi_type	= MAC_SCSI_QUADRA,
 		.scc_type	= MAC_SCC_QUADRA,
 		.ether_type	= MAC_ETHER_SONIC,
-		.nubus_type	= MAC_NUBUS
+		.nubus_type	= MAC_NUBUS,
+		.floppy_type	= MAC_FLOPPY_SWIM_ADDR1
 	}, {
 		.ident		= MAC_MODEL_Q840,
 		.name		= "Quadra 840AV",
@@ -459,7 +482,8 @@ static struct mac_model mac_data_table[] = {
 		.scsi_type	= MAC_SCSI_QUADRA3,
 		.scc_type	= MAC_SCC_PSC,
 		.ether_type	= MAC_ETHER_MACE,
-		.nubus_type	= MAC_NUBUS
+		.nubus_type	= MAC_NUBUS,
+		.floppy_type    = MAC_FLOPPY_AV
 	}, {
 		.ident		= MAC_MODEL_Q900,
 		.name		= "Quadra 900",
@@ -468,7 +492,8 @@ static struct mac_model mac_data_table[] = {
 		.scsi_type	= MAC_SCSI_QUADRA2,
 		.scc_type	= MAC_SCC_IOP,
 		.ether_type	= MAC_ETHER_SONIC,
-		.nubus_type	= MAC_NUBUS
+		.nubus_type	= MAC_NUBUS,
+		.floppy_type    = MAC_FLOPPY_SWIM_IOP
 	}, {
 		.ident		= MAC_MODEL_Q950,
 		.name		= "Quadra 950",
@@ -477,7 +502,8 @@ static struct mac_model mac_data_table[] = {
 		.scsi_type	= MAC_SCSI_QUADRA2,
 		.scc_type	= MAC_SCC_IOP,
 		.ether_type	= MAC_ETHER_SONIC,
-		.nubus_type	= MAC_NUBUS
+		.nubus_type	= MAC_NUBUS,
+		.floppy_type    = MAC_FLOPPY_SWIM_IOP
 	},
 
 	/*
@@ -491,7 +517,8 @@ static struct mac_model mac_data_table[] = {
 		.via_type	= MAC_VIA_IIci,
 		.scsi_type	= MAC_SCSI_OLD,
 		.scc_type	= MAC_SCC_II,
-		.nubus_type	= MAC_NUBUS
+		.nubus_type	= MAC_NUBUS,
+		.floppy_type    = MAC_FLOPPY_SWIM_ADDR2
 	}, {
 		.ident		= MAC_MODEL_P475,
 		.name		=  "Performa 475",
@@ -499,7 +526,8 @@ static struct mac_model mac_data_table[] = {
 		.via_type	= MAC_VIA_QUADRA,
 		.scsi_type	= MAC_SCSI_QUADRA,
 		.scc_type	= MAC_SCC_II,
-		.nubus_type	= MAC_NUBUS
+		.nubus_type	= MAC_NUBUS,
+		.floppy_type	= MAC_FLOPPY_SWIM_ADDR1
 	}, {
 		.ident		= MAC_MODEL_P475F,
 		.name		=  "Performa 475",
@@ -507,7 +535,8 @@ static struct mac_model mac_data_table[] = {
 		.via_type	= MAC_VIA_QUADRA,
 		.scsi_type	= MAC_SCSI_QUADRA,
 		.scc_type	= MAC_SCC_II,
-		.nubus_type	= MAC_NUBUS
+		.nubus_type	= MAC_NUBUS,
+		.floppy_type	= MAC_FLOPPY_SWIM_ADDR1
 	}, {
 		.ident		= MAC_MODEL_P520,
 		.name		=  "Performa 520",
@@ -515,7 +544,8 @@ static struct mac_model mac_data_table[] = {
 		.via_type	= MAC_VIA_IIci,
 		.scsi_type	= MAC_SCSI_OLD,
 		.scc_type	= MAC_SCC_II,
-		.nubus_type	= MAC_NUBUS
+		.nubus_type	= MAC_NUBUS,
+		.floppy_type    = MAC_FLOPPY_SWIM_ADDR2
 	}, {
 		.ident		= MAC_MODEL_P550,
 		.name		=  "Performa 550",
@@ -523,7 +553,8 @@ static struct mac_model mac_data_table[] = {
 		.via_type	= MAC_VIA_IIci,
 		.scsi_type	= MAC_SCSI_OLD,
 		.scc_type	= MAC_SCC_II,
-		.nubus_type	= MAC_NUBUS
+		.nubus_type	= MAC_NUBUS,
+		.floppy_type    = MAC_FLOPPY_SWIM_ADDR2
 	},
 	/* These have the comm slot, and therefore the possibility of SONIC ethernet */
 	{
@@ -534,7 +565,8 @@ static struct mac_model mac_data_table[] = {
 		.scsi_type	= MAC_SCSI_QUADRA,
 		.scc_type	= MAC_SCC_II,
 		.ether_type	= MAC_ETHER_SONIC,
-		.nubus_type	= MAC_NUBUS
+		.nubus_type	= MAC_NUBUS,
+		.floppy_type	= MAC_FLOPPY_SWIM_ADDR1
 	}, {
 		.ident		= MAC_MODEL_P588,
 		.name		= "Performa 588",
@@ -544,7 +576,8 @@ static struct mac_model mac_data_table[] = {
 		.ide_type	= MAC_IDE_QUADRA,
 		.scc_type	= MAC_SCC_II,
 		.ether_type	= MAC_ETHER_SONIC,
-		.nubus_type	= MAC_NUBUS
+		.nubus_type	= MAC_NUBUS,
+		.floppy_type	= MAC_FLOPPY_SWIM_ADDR1
 	}, {
 		.ident		= MAC_MODEL_TV,
 		.name		= "TV",
@@ -552,7 +585,8 @@ static struct mac_model mac_data_table[] = {
 		.via_type	= MAC_VIA_QUADRA,
 		.scsi_type	= MAC_SCSI_OLD,
 		.scc_type	= MAC_SCC_II,
-		.nubus_type	= MAC_NUBUS
+		.nubus_type	= MAC_NUBUS,
+		.floppy_type    = MAC_FLOPPY_SWIM_ADDR2
 	}, {
 		.ident		= MAC_MODEL_P600,
 		.name		= "Performa 600",
@@ -560,7 +594,8 @@ static struct mac_model mac_data_table[] = {
 		.via_type	= MAC_VIA_IIci,
 		.scsi_type	= MAC_SCSI_OLD,
 		.scc_type	= MAC_SCC_II,
-		.nubus_type	= MAC_NUBUS
+		.nubus_type	= MAC_NUBUS,
+		.floppy_type    = MAC_FLOPPY_SWIM_ADDR2
 	},
 
 	/*
@@ -576,7 +611,8 @@ static struct mac_model mac_data_table[] = {
 		.scsi_type	= MAC_SCSI_QUADRA,
 		.scc_type	= MAC_SCC_QUADRA,
 		.ether_type	= MAC_ETHER_SONIC,
-		.nubus_type	= MAC_NUBUS
+		.nubus_type	= MAC_NUBUS,
+		.floppy_type    = MAC_FLOPPY_SWIM_ADDR1
 	}, {
 		.ident		= MAC_MODEL_C650,
 		.name		= "Centris 650",
@@ -585,7 +621,8 @@ static struct mac_model mac_data_table[] = {
 		.scsi_type	= MAC_SCSI_QUADRA,
 		.scc_type	= MAC_SCC_QUADRA,
 		.ether_type	= MAC_ETHER_SONIC,
-		.nubus_type	= MAC_NUBUS
+		.nubus_type	= MAC_NUBUS,
+		.floppy_type    = MAC_FLOPPY_SWIM_ADDR1
 	}, {
 		.ident		= MAC_MODEL_C660,
 		.name		= "Centris 660AV",
@@ -594,7 +631,8 @@ static struct mac_model mac_data_table[] = {
 		.scsi_type	= MAC_SCSI_QUADRA3,
 		.scc_type	= MAC_SCC_PSC,
 		.ether_type	= MAC_ETHER_MACE,
-		.nubus_type	= MAC_NUBUS
+		.nubus_type	= MAC_NUBUS,
+		.floppy_type    = MAC_FLOPPY_AV
 	},
 
 	/*
@@ -610,7 +648,8 @@ static struct mac_model mac_data_table[] = {
 		.via_type	= MAC_VIA_QUADRA,
 		.scsi_type	= MAC_SCSI_OLD,
 		.scc_type	= MAC_SCC_QUADRA,
-		.nubus_type	= MAC_NUBUS
+		.nubus_type	= MAC_NUBUS,
+		.floppy_type    = MAC_FLOPPY_SWIM_ADDR2
 	}, {
 		.ident		= MAC_MODEL_PB145,
 		.name		= "PowerBook 145",
@@ -618,7 +657,8 @@ static struct mac_model mac_data_table[] = {
 		.via_type	= MAC_VIA_QUADRA,
 		.scsi_type	= MAC_SCSI_OLD,
 		.scc_type	= MAC_SCC_QUADRA,
-		.nubus_type	= MAC_NUBUS
+		.nubus_type	= MAC_NUBUS,
+		.floppy_type    = MAC_FLOPPY_SWIM_ADDR2
 	}, {
 		.ident		= MAC_MODEL_PB150,
 		.name		= "PowerBook 150",
@@ -627,7 +667,8 @@ static struct mac_model mac_data_table[] = {
 		.scsi_type	= MAC_SCSI_OLD,
 		.ide_type	= MAC_IDE_PB,
 		.scc_type	= MAC_SCC_QUADRA,
-		.nubus_type	= MAC_NUBUS
+		.nubus_type	= MAC_NUBUS,
+		.floppy_type    = MAC_FLOPPY_SWIM_ADDR2
 	}, {
 		.ident		= MAC_MODEL_PB160,
 		.name		= "PowerBook 160",
@@ -635,7 +676,8 @@ static struct mac_model mac_data_table[] = {
 		.via_type	= MAC_VIA_QUADRA,
 		.scsi_type	= MAC_SCSI_OLD,
 		.scc_type	= MAC_SCC_QUADRA,
-		.nubus_type	= MAC_NUBUS
+		.nubus_type	= MAC_NUBUS,
+		.floppy_type    = MAC_FLOPPY_SWIM_ADDR2
 	}, {
 		.ident		= MAC_MODEL_PB165,
 		.name		= "PowerBook 165",
@@ -643,7 +685,8 @@ static struct mac_model mac_data_table[] = {
 		.via_type	= MAC_VIA_QUADRA,
 		.scsi_type	= MAC_SCSI_OLD,
 		.scc_type	= MAC_SCC_QUADRA,
-		.nubus_type	= MAC_NUBUS
+		.nubus_type	= MAC_NUBUS,
+		.floppy_type    = MAC_FLOPPY_SWIM_ADDR2
 	}, {
 		.ident		= MAC_MODEL_PB165C,
 		.name		= "PowerBook 165c",
@@ -651,7 +694,8 @@ static struct mac_model mac_data_table[] = {
 		.via_type	= MAC_VIA_QUADRA,
 		.scsi_type	= MAC_SCSI_OLD,
 		.scc_type	= MAC_SCC_QUADRA,
-		.nubus_type	= MAC_NUBUS
+		.nubus_type	= MAC_NUBUS,
+		.floppy_type    = MAC_FLOPPY_SWIM_ADDR2
 	}, {
 		.ident		= MAC_MODEL_PB170,
 		.name		= "PowerBook 170",
@@ -659,7 +703,8 @@ static struct mac_model mac_data_table[] = {
 		.via_type	= MAC_VIA_QUADRA,
 		.scsi_type	= MAC_SCSI_OLD,
 		.scc_type	= MAC_SCC_QUADRA,
-		.nubus_type	= MAC_NUBUS
+		.nubus_type	= MAC_NUBUS,
+		.floppy_type    = MAC_FLOPPY_SWIM_ADDR2
 	}, {
 		.ident		= MAC_MODEL_PB180,
 		.name		= "PowerBook 180",
@@ -667,7 +712,8 @@ static struct mac_model mac_data_table[] = {
 		.via_type	= MAC_VIA_QUADRA,
 		.scsi_type	= MAC_SCSI_OLD,
 		.scc_type	= MAC_SCC_QUADRA,
-		.nubus_type	= MAC_NUBUS
+		.nubus_type	= MAC_NUBUS,
+		.floppy_type    = MAC_FLOPPY_SWIM_ADDR2
 	}, {
 		.ident		= MAC_MODEL_PB180C,
 		.name		= "PowerBook 180c",
@@ -675,7 +721,8 @@ static struct mac_model mac_data_table[] = {
 		.via_type	= MAC_VIA_QUADRA,
 		.scsi_type	= MAC_SCSI_OLD,
 		.scc_type	= MAC_SCC_QUADRA,
-		.nubus_type	= MAC_NUBUS
+		.nubus_type	= MAC_NUBUS,
+		.floppy_type    = MAC_FLOPPY_SWIM_ADDR2
 	}, {
 		.ident		= MAC_MODEL_PB190,
 		.name		= "PowerBook 190",
@@ -684,7 +731,8 @@ static struct mac_model mac_data_table[] = {
 		.scsi_type	= MAC_SCSI_OLD,
 		.ide_type	= MAC_IDE_BABOON,
 		.scc_type	= MAC_SCC_QUADRA,
-		.nubus_type	= MAC_NUBUS
+		.nubus_type	= MAC_NUBUS,
+		.floppy_type    = MAC_FLOPPY_SWIM_ADDR2
 	}, {
 		.ident		= MAC_MODEL_PB520,
 		.name		= "PowerBook 520",
@@ -693,7 +741,8 @@ static struct mac_model mac_data_table[] = {
 		.scsi_type	= MAC_SCSI_OLD,
 		.scc_type	= MAC_SCC_QUADRA,
 		.ether_type	= MAC_ETHER_SONIC,
-		.nubus_type	= MAC_NUBUS
+		.nubus_type	= MAC_NUBUS,
+		.floppy_type    = MAC_FLOPPY_SWIM_ADDR2
 	},
 
 	/*
@@ -713,7 +762,8 @@ static struct mac_model mac_data_table[] = {
 		.via_type	= MAC_VIA_IIci,
 		.scsi_type	= MAC_SCSI_OLD,
 		.scc_type	= MAC_SCC_QUADRA,
-		.nubus_type	= MAC_NUBUS
+		.nubus_type	= MAC_NUBUS,
+		.floppy_type    = MAC_FLOPPY_SWIM_ADDR2
 	}, {
 		.ident		= MAC_MODEL_PB230,
 		.name		= "PowerBook Duo 230",
@@ -721,7 +771,8 @@ static struct mac_model mac_data_table[] = {
 		.via_type	= MAC_VIA_IIci,
 		.scsi_type	= MAC_SCSI_OLD,
 		.scc_type	= MAC_SCC_QUADRA,
-		.nubus_type	= MAC_NUBUS
+		.nubus_type	= MAC_NUBUS,
+		.floppy_type    = MAC_FLOPPY_SWIM_ADDR2
 	}, {
 		.ident		= MAC_MODEL_PB250,
 		.name		= "PowerBook Duo 250",
@@ -729,7 +780,8 @@ static struct mac_model mac_data_table[] = {
 		.via_type	= MAC_VIA_IIci,
 		.scsi_type	= MAC_SCSI_OLD,
 		.scc_type	= MAC_SCC_QUADRA,
-		.nubus_type	= MAC_NUBUS
+		.nubus_type	= MAC_NUBUS,
+		.floppy_type    = MAC_FLOPPY_SWIM_ADDR2
 	}, {
 		.ident		= MAC_MODEL_PB270C,
 		.name		= "PowerBook Duo 270c",
@@ -737,7 +789,8 @@ static struct mac_model mac_data_table[] = {
 		.via_type	= MAC_VIA_IIci,
 		.scsi_type	= MAC_SCSI_OLD,
 		.scc_type	= MAC_SCC_QUADRA,
-		.nubus_type	= MAC_NUBUS
+		.nubus_type	= MAC_NUBUS,
+		.floppy_type    = MAC_FLOPPY_SWIM_ADDR2
 	}, {
 		.ident		= MAC_MODEL_PB280,
 		.name		= "PowerBook Duo 280",
@@ -745,7 +798,8 @@ static struct mac_model mac_data_table[] = {
 		.via_type	= MAC_VIA_IIci,
 		.scsi_type	= MAC_SCSI_OLD,
 		.scc_type	= MAC_SCC_QUADRA,
-		.nubus_type	= MAC_NUBUS
+		.nubus_type	= MAC_NUBUS,
+		.floppy_type    = MAC_FLOPPY_SWIM_ADDR2
 	}, {
 		.ident		= MAC_MODEL_PB280C,
 		.name		= "PowerBook Duo 280c",
@@ -753,7 +807,8 @@ static struct mac_model mac_data_table[] = {
 		.via_type	= MAC_VIA_IIci,
 		.scsi_type	= MAC_SCSI_OLD,
 		.scc_type	= MAC_SCC_QUADRA,
-		.nubus_type	= MAC_NUBUS
+		.nubus_type	= MAC_NUBUS,
+		.floppy_type    = MAC_FLOPPY_SWIM_ADDR2
 	},
 
 	/*
diff --git a/include/asm-m68k/macintosh.h b/include/asm-m68k/macintosh.h
index 05309f7..50db359 100644
--- a/include/asm-m68k/macintosh.h
+++ b/include/asm-m68k/macintosh.h
@@ -34,6 +34,7 @@ struct mac_model
 	char scc_type;
 	char ether_type;
 	char nubus_type;
+	char floppy_type;
 };
 
 #define MAC_ADB_NONE		0
@@ -71,6 +72,12 @@ struct mac_model
 #define MAC_NO_NUBUS		0
 #define MAC_NUBUS		1
 
+#define MAC_FLOPPY_IWM		0
+#define MAC_FLOPPY_SWIM_ADDR1	1
+#define MAC_FLOPPY_SWIM_ADDR2	2
+#define MAC_FLOPPY_SWIM_IOP	3
+#define MAC_FLOPPY_AV		4
+
 /*
  *	Gestalt numbers
  */
-- 
1.4.4.4

