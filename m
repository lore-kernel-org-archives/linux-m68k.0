From: Finn Thain <fthain@telegraphics.com.au>
Subject: [PATCH v5 13/14] nubus: Add expansion_type values for various Mac
 models
Date: Sat, 13 Jan 2018 17:37:13 -0500 (EST)
Message-ID: <aa7f4403a658e1ec128a414d13133cf0d676ad0a.1515814167.git.fthain@telegraphics.com.au>
References: <cover.1515814167.git.fthain@telegraphics.com.au>
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <cover.1515814167.git.fthain@telegraphics.com.au>
Sender: netdev-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org, linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org

Add an expansion slot attribute to allow drivers to properly handle
cards like Comm Slot cards and PDS cards without declaration ROMs.
This clarifies the logic for the Centris 610 model which has no
Comm Slot but has an optional on-board SONIC device.

Cc: "David S. Miller" <davem@davemloft.net>
Tested-by: Stan Johnson <userm57@yahoo.com>
Signed-off-by: Finn Thain <fthain@telegraphics.com.au>
---
 arch/m68k/include/asm/macintosh.h       |   9 ++-
 arch/m68k/mac/config.c                  | 110 +++++++++++++-------------------
 drivers/net/ethernet/natsemi/macsonic.c |   8 +--
 3 files changed, 54 insertions(+), 73 deletions(-)

diff --git a/arch/m68k/include/asm/macintosh.h b/arch/m68k/include/asm/macintosh.h
index f42c27400dbc..9b840c03ebb7 100644
--- a/arch/m68k/include/asm/macintosh.h
+++ b/arch/m68k/include/asm/macintosh.h
@@ -33,7 +33,7 @@ struct mac_model
 	char ide_type;
 	char scc_type;
 	char ether_type;
-	char nubus_type;
+	char expansion_type;
 	char floppy_type;
 };
 
@@ -73,8 +73,11 @@ struct mac_model
 #define MAC_ETHER_SONIC		1
 #define MAC_ETHER_MACE		2
 
-#define MAC_NO_NUBUS		0
-#define MAC_NUBUS		1
+#define MAC_EXP_NONE		0
+#define MAC_EXP_PDS		1 /* Accepts only a PDS card */
+#define MAC_EXP_NUBUS		2 /* Accepts only NuBus card(s) */
+#define MAC_EXP_PDS_NUBUS	3 /* Accepts PDS card and/or NuBus card(s) */
+#define MAC_EXP_PDS_COMM	4 /* Accepts PDS card or Comm Slot card */
 
 #define MAC_FLOPPY_IWM		0
 #define MAC_FLOPPY_SWIM_ADDR1	1
diff --git a/arch/m68k/mac/config.c b/arch/m68k/mac/config.c
index 16cd5cea5207..d3d435248a24 100644
--- a/arch/m68k/mac/config.c
+++ b/arch/m68k/mac/config.c
@@ -212,7 +212,7 @@ static struct mac_model mac_data_table[] = {
 		.via_type	= MAC_VIA_II,
 		.scsi_type	= MAC_SCSI_OLD,
 		.scc_type	= MAC_SCC_II,
-		.nubus_type	= MAC_NUBUS,
+		.expansion_type	= MAC_EXP_NUBUS,
 		.floppy_type	= MAC_FLOPPY_IWM,
 	},
 
@@ -227,7 +227,7 @@ static struct mac_model mac_data_table[] = {
 		.via_type	= MAC_VIA_II,
 		.scsi_type	= MAC_SCSI_OLD,
 		.scc_type	= MAC_SCC_II,
-		.nubus_type	= MAC_NUBUS,
+		.expansion_type	= MAC_EXP_NUBUS,
 		.floppy_type	= MAC_FLOPPY_IWM,
 	}, {
 		.ident		= MAC_MODEL_IIX,
@@ -236,7 +236,7 @@ static struct mac_model mac_data_table[] = {
 		.via_type	= MAC_VIA_II,
 		.scsi_type	= MAC_SCSI_OLD,
 		.scc_type	= MAC_SCC_II,
-		.nubus_type	= MAC_NUBUS,
+		.expansion_type	= MAC_EXP_NUBUS,
 		.floppy_type	= MAC_FLOPPY_SWIM_ADDR2,
 	}, {
 		.ident		= MAC_MODEL_IICX,
@@ -245,7 +245,7 @@ static struct mac_model mac_data_table[] = {
 		.via_type	= MAC_VIA_II,
 		.scsi_type	= MAC_SCSI_OLD,
 		.scc_type	= MAC_SCC_II,
-		.nubus_type	= MAC_NUBUS,
+		.expansion_type	= MAC_EXP_NUBUS,
 		.floppy_type	= MAC_FLOPPY_SWIM_ADDR2,
 	}, {
 		.ident		= MAC_MODEL_SE30,
@@ -254,7 +254,7 @@ static struct mac_model mac_data_table[] = {
 		.via_type	= MAC_VIA_II,
 		.scsi_type	= MAC_SCSI_OLD,
 		.scc_type	= MAC_SCC_II,
-		.nubus_type	= MAC_NUBUS,
+		.expansion_type	= MAC_EXP_PDS,
 		.floppy_type	= MAC_FLOPPY_SWIM_ADDR2,
 	},
 
@@ -272,7 +272,7 @@ static struct mac_model mac_data_table[] = {
 		.via_type	= MAC_VIA_IICI,
 		.scsi_type	= MAC_SCSI_OLD,
 		.scc_type	= MAC_SCC_II,
-		.nubus_type	= MAC_NUBUS,
+		.expansion_type	= MAC_EXP_NUBUS,
 		.floppy_type	= MAC_FLOPPY_SWIM_ADDR2,
 	}, {
 		.ident		= MAC_MODEL_IIFX,
@@ -281,7 +281,7 @@ static struct mac_model mac_data_table[] = {
 		.via_type	= MAC_VIA_IICI,
 		.scsi_type	= MAC_SCSI_IIFX,
 		.scc_type	= MAC_SCC_IOP,
-		.nubus_type	= MAC_NUBUS,
+		.expansion_type	= MAC_EXP_PDS_NUBUS,
 		.floppy_type	= MAC_FLOPPY_SWIM_IOP,
 	}, {
 		.ident		= MAC_MODEL_IISI,
@@ -290,7 +290,7 @@ static struct mac_model mac_data_table[] = {
 		.via_type	= MAC_VIA_IICI,
 		.scsi_type	= MAC_SCSI_OLD,
 		.scc_type	= MAC_SCC_II,
-		.nubus_type	= MAC_NUBUS,
+		.expansion_type	= MAC_EXP_PDS_NUBUS,
 		.floppy_type	= MAC_FLOPPY_SWIM_ADDR2,
 	}, {
 		.ident		= MAC_MODEL_IIVI,
@@ -299,7 +299,7 @@ static struct mac_model mac_data_table[] = {
 		.via_type	= MAC_VIA_IICI,
 		.scsi_type	= MAC_SCSI_LC,
 		.scc_type	= MAC_SCC_II,
-		.nubus_type	= MAC_NUBUS,
+		.expansion_type	= MAC_EXP_NUBUS,
 		.floppy_type	= MAC_FLOPPY_SWIM_ADDR2,
 	}, {
 		.ident		= MAC_MODEL_IIVX,
@@ -308,7 +308,7 @@ static struct mac_model mac_data_table[] = {
 		.via_type	= MAC_VIA_IICI,
 		.scsi_type	= MAC_SCSI_LC,
 		.scc_type	= MAC_SCC_II,
-		.nubus_type	= MAC_NUBUS,
+		.expansion_type	= MAC_EXP_NUBUS,
 		.floppy_type	= MAC_FLOPPY_SWIM_ADDR2,
 	},
 
@@ -323,7 +323,6 @@ static struct mac_model mac_data_table[] = {
 		.via_type	= MAC_VIA_IICI,
 		.scsi_type	= MAC_SCSI_LC,
 		.scc_type	= MAC_SCC_II,
-		.nubus_type	= MAC_NUBUS,
 		.floppy_type	= MAC_FLOPPY_SWIM_ADDR2,
 	}, {
 		.ident		= MAC_MODEL_CCL,
@@ -332,7 +331,7 @@ static struct mac_model mac_data_table[] = {
 		.via_type	= MAC_VIA_IICI,
 		.scsi_type	= MAC_SCSI_LC,
 		.scc_type	= MAC_SCC_II,
-		.nubus_type	= MAC_NUBUS,
+		.expansion_type	= MAC_EXP_PDS,
 		.floppy_type	= MAC_FLOPPY_SWIM_ADDR2,
 	}, {
 		.ident		= MAC_MODEL_CCLII,
@@ -341,7 +340,7 @@ static struct mac_model mac_data_table[] = {
 		.via_type	= MAC_VIA_IICI,
 		.scsi_type	= MAC_SCSI_LC,
 		.scc_type	= MAC_SCC_II,
-		.nubus_type	= MAC_NUBUS,
+		.expansion_type	= MAC_EXP_PDS,
 		.floppy_type	= MAC_FLOPPY_SWIM_ADDR2,
 	},
 
@@ -356,7 +355,7 @@ static struct mac_model mac_data_table[] = {
 		.via_type	= MAC_VIA_IICI,
 		.scsi_type	= MAC_SCSI_LC,
 		.scc_type	= MAC_SCC_II,
-		.nubus_type	= MAC_NUBUS,
+		.expansion_type	= MAC_EXP_PDS,
 		.floppy_type	= MAC_FLOPPY_SWIM_ADDR2,
 	}, {
 		.ident		= MAC_MODEL_LCII,
@@ -365,7 +364,7 @@ static struct mac_model mac_data_table[] = {
 		.via_type	= MAC_VIA_IICI,
 		.scsi_type	= MAC_SCSI_LC,
 		.scc_type	= MAC_SCC_II,
-		.nubus_type	= MAC_NUBUS,
+		.expansion_type	= MAC_EXP_PDS,
 		.floppy_type	= MAC_FLOPPY_SWIM_ADDR2,
 	}, {
 		.ident		= MAC_MODEL_LCIII,
@@ -374,7 +373,7 @@ static struct mac_model mac_data_table[] = {
 		.via_type	= MAC_VIA_IICI,
 		.scsi_type	= MAC_SCSI_LC,
 		.scc_type	= MAC_SCC_II,
-		.nubus_type	= MAC_NUBUS,
+		.expansion_type	= MAC_EXP_PDS,
 		.floppy_type	= MAC_FLOPPY_SWIM_ADDR2,
 	},
 
@@ -395,7 +394,7 @@ static struct mac_model mac_data_table[] = {
 		.via_type	= MAC_VIA_QUADRA,
 		.scsi_type	= MAC_SCSI_QUADRA,
 		.scc_type	= MAC_SCC_QUADRA,
-		.nubus_type	= MAC_NUBUS,
+		.expansion_type	= MAC_EXP_PDS,
 		.floppy_type	= MAC_FLOPPY_SWIM_ADDR1,
 	}, {
 		.ident		= MAC_MODEL_Q605_ACC,
@@ -404,7 +403,7 @@ static struct mac_model mac_data_table[] = {
 		.via_type	= MAC_VIA_QUADRA,
 		.scsi_type	= MAC_SCSI_QUADRA,
 		.scc_type	= MAC_SCC_QUADRA,
-		.nubus_type	= MAC_NUBUS,
+		.expansion_type	= MAC_EXP_PDS,
 		.floppy_type	= MAC_FLOPPY_SWIM_ADDR1,
 	}, {
 		.ident		= MAC_MODEL_Q610,
@@ -414,7 +413,7 @@ static struct mac_model mac_data_table[] = {
 		.scsi_type	= MAC_SCSI_QUADRA,
 		.scc_type	= MAC_SCC_QUADRA,
 		.ether_type	= MAC_ETHER_SONIC,
-		.nubus_type	= MAC_NUBUS,
+		.expansion_type	= MAC_EXP_PDS_NUBUS,
 		.floppy_type	= MAC_FLOPPY_SWIM_ADDR1,
 	}, {
 		.ident		= MAC_MODEL_Q630,
@@ -424,8 +423,7 @@ static struct mac_model mac_data_table[] = {
 		.scsi_type	= MAC_SCSI_QUADRA,
 		.ide_type	= MAC_IDE_QUADRA,
 		.scc_type	= MAC_SCC_QUADRA,
-		.ether_type	= MAC_ETHER_SONIC,
-		.nubus_type	= MAC_NUBUS,
+		.expansion_type	= MAC_EXP_PDS_COMM,
 		.floppy_type	= MAC_FLOPPY_SWIM_ADDR1,
 	}, {
 		.ident		= MAC_MODEL_Q650,
@@ -435,7 +433,7 @@ static struct mac_model mac_data_table[] = {
 		.scsi_type	= MAC_SCSI_QUADRA,
 		.scc_type	= MAC_SCC_QUADRA,
 		.ether_type	= MAC_ETHER_SONIC,
-		.nubus_type	= MAC_NUBUS,
+		.expansion_type	= MAC_EXP_PDS_NUBUS,
 		.floppy_type	= MAC_FLOPPY_SWIM_ADDR1,
 	},
 	/* The Q700 does have a NS Sonic */
@@ -447,7 +445,7 @@ static struct mac_model mac_data_table[] = {
 		.scsi_type	= MAC_SCSI_QUADRA2,
 		.scc_type	= MAC_SCC_QUADRA,
 		.ether_type	= MAC_ETHER_SONIC,
-		.nubus_type	= MAC_NUBUS,
+		.expansion_type	= MAC_EXP_PDS_NUBUS,
 		.floppy_type	= MAC_FLOPPY_SWIM_ADDR1,
 	}, {
 		.ident		= MAC_MODEL_Q800,
@@ -457,7 +455,7 @@ static struct mac_model mac_data_table[] = {
 		.scsi_type	= MAC_SCSI_QUADRA,
 		.scc_type	= MAC_SCC_QUADRA,
 		.ether_type	= MAC_ETHER_SONIC,
-		.nubus_type	= MAC_NUBUS,
+		.expansion_type	= MAC_EXP_PDS_NUBUS,
 		.floppy_type	= MAC_FLOPPY_SWIM_ADDR1,
 	}, {
 		.ident		= MAC_MODEL_Q840,
@@ -467,7 +465,7 @@ static struct mac_model mac_data_table[] = {
 		.scsi_type	= MAC_SCSI_QUADRA3,
 		.scc_type	= MAC_SCC_PSC,
 		.ether_type	= MAC_ETHER_MACE,
-		.nubus_type	= MAC_NUBUS,
+		.expansion_type	= MAC_EXP_NUBUS,
 		.floppy_type	= MAC_FLOPPY_AV,
 	}, {
 		.ident		= MAC_MODEL_Q900,
@@ -477,7 +475,7 @@ static struct mac_model mac_data_table[] = {
 		.scsi_type	= MAC_SCSI_QUADRA2,
 		.scc_type	= MAC_SCC_IOP,
 		.ether_type	= MAC_ETHER_SONIC,
-		.nubus_type	= MAC_NUBUS,
+		.expansion_type	= MAC_EXP_PDS_NUBUS,
 		.floppy_type	= MAC_FLOPPY_SWIM_IOP,
 	}, {
 		.ident		= MAC_MODEL_Q950,
@@ -487,7 +485,7 @@ static struct mac_model mac_data_table[] = {
 		.scsi_type	= MAC_SCSI_QUADRA2,
 		.scc_type	= MAC_SCC_IOP,
 		.ether_type	= MAC_ETHER_SONIC,
-		.nubus_type	= MAC_NUBUS,
+		.expansion_type	= MAC_EXP_PDS_NUBUS,
 		.floppy_type	= MAC_FLOPPY_SWIM_IOP,
 	},
 
@@ -502,7 +500,7 @@ static struct mac_model mac_data_table[] = {
 		.via_type	= MAC_VIA_IICI,
 		.scsi_type	= MAC_SCSI_LC,
 		.scc_type	= MAC_SCC_II,
-		.nubus_type	= MAC_NUBUS,
+		.expansion_type	= MAC_EXP_PDS,
 		.floppy_type	= MAC_FLOPPY_SWIM_ADDR2,
 	}, {
 		.ident		= MAC_MODEL_P475,
@@ -511,7 +509,7 @@ static struct mac_model mac_data_table[] = {
 		.via_type	= MAC_VIA_QUADRA,
 		.scsi_type	= MAC_SCSI_QUADRA,
 		.scc_type	= MAC_SCC_II,
-		.nubus_type	= MAC_NUBUS,
+		.expansion_type	= MAC_EXP_PDS,
 		.floppy_type	= MAC_FLOPPY_SWIM_ADDR1,
 	}, {
 		.ident		= MAC_MODEL_P475F,
@@ -520,7 +518,7 @@ static struct mac_model mac_data_table[] = {
 		.via_type	= MAC_VIA_QUADRA,
 		.scsi_type	= MAC_SCSI_QUADRA,
 		.scc_type	= MAC_SCC_II,
-		.nubus_type	= MAC_NUBUS,
+		.expansion_type	= MAC_EXP_PDS,
 		.floppy_type	= MAC_FLOPPY_SWIM_ADDR1,
 	}, {
 		.ident		= MAC_MODEL_P520,
@@ -529,7 +527,7 @@ static struct mac_model mac_data_table[] = {
 		.via_type	= MAC_VIA_IICI,
 		.scsi_type	= MAC_SCSI_LC,
 		.scc_type	= MAC_SCC_II,
-		.nubus_type	= MAC_NUBUS,
+		.expansion_type	= MAC_EXP_PDS,
 		.floppy_type	= MAC_FLOPPY_SWIM_ADDR2,
 	}, {
 		.ident		= MAC_MODEL_P550,
@@ -538,7 +536,7 @@ static struct mac_model mac_data_table[] = {
 		.via_type	= MAC_VIA_IICI,
 		.scsi_type	= MAC_SCSI_LC,
 		.scc_type	= MAC_SCC_II,
-		.nubus_type	= MAC_NUBUS,
+		.expansion_type	= MAC_EXP_PDS,
 		.floppy_type	= MAC_FLOPPY_SWIM_ADDR2,
 	},
 	/* These have the comm slot, and therefore possibly SONIC ethernet */
@@ -549,8 +547,7 @@ static struct mac_model mac_data_table[] = {
 		.via_type	= MAC_VIA_QUADRA,
 		.scsi_type	= MAC_SCSI_QUADRA,
 		.scc_type	= MAC_SCC_II,
-		.ether_type	= MAC_ETHER_SONIC,
-		.nubus_type	= MAC_NUBUS,
+		.expansion_type	= MAC_EXP_PDS_COMM,
 		.floppy_type	= MAC_FLOPPY_SWIM_ADDR1,
 	}, {
 		.ident		= MAC_MODEL_P588,
@@ -560,8 +557,7 @@ static struct mac_model mac_data_table[] = {
 		.scsi_type	= MAC_SCSI_QUADRA,
 		.ide_type	= MAC_IDE_QUADRA,
 		.scc_type	= MAC_SCC_II,
-		.ether_type	= MAC_ETHER_SONIC,
-		.nubus_type	= MAC_NUBUS,
+		.expansion_type	= MAC_EXP_PDS_COMM,
 		.floppy_type	= MAC_FLOPPY_SWIM_ADDR1,
 	}, {
 		.ident		= MAC_MODEL_TV,
@@ -570,7 +566,6 @@ static struct mac_model mac_data_table[] = {
 		.via_type	= MAC_VIA_IICI,
 		.scsi_type	= MAC_SCSI_LC,
 		.scc_type	= MAC_SCC_II,
-		.nubus_type	= MAC_NUBUS,
 		.floppy_type	= MAC_FLOPPY_SWIM_ADDR2,
 	}, {
 		.ident		= MAC_MODEL_P600,
@@ -579,7 +574,7 @@ static struct mac_model mac_data_table[] = {
 		.via_type	= MAC_VIA_IICI,
 		.scsi_type	= MAC_SCSI_LC,
 		.scc_type	= MAC_SCC_II,
-		.nubus_type	= MAC_NUBUS,
+		.expansion_type	= MAC_EXP_NUBUS,
 		.floppy_type	= MAC_FLOPPY_SWIM_ADDR2,
 	},
 
@@ -596,7 +591,7 @@ static struct mac_model mac_data_table[] = {
 		.scsi_type	= MAC_SCSI_QUADRA,
 		.scc_type	= MAC_SCC_QUADRA,
 		.ether_type	= MAC_ETHER_SONIC,
-		.nubus_type	= MAC_NUBUS,
+		.expansion_type	= MAC_EXP_PDS_NUBUS,
 		.floppy_type	= MAC_FLOPPY_SWIM_ADDR1,
 	}, {
 		.ident		= MAC_MODEL_C650,
@@ -606,7 +601,7 @@ static struct mac_model mac_data_table[] = {
 		.scsi_type	= MAC_SCSI_QUADRA,
 		.scc_type	= MAC_SCC_QUADRA,
 		.ether_type	= MAC_ETHER_SONIC,
-		.nubus_type	= MAC_NUBUS,
+		.expansion_type	= MAC_EXP_PDS_NUBUS,
 		.floppy_type	= MAC_FLOPPY_SWIM_ADDR1,
 	}, {
 		.ident		= MAC_MODEL_C660,
@@ -616,7 +611,7 @@ static struct mac_model mac_data_table[] = {
 		.scsi_type	= MAC_SCSI_QUADRA3,
 		.scc_type	= MAC_SCC_PSC,
 		.ether_type	= MAC_ETHER_MACE,
-		.nubus_type	= MAC_NUBUS,
+		.expansion_type	= MAC_EXP_PDS_NUBUS,
 		.floppy_type	= MAC_FLOPPY_AV,
 	},
 
@@ -633,7 +628,6 @@ static struct mac_model mac_data_table[] = {
 		.via_type	= MAC_VIA_QUADRA,
 		.scsi_type	= MAC_SCSI_OLD,
 		.scc_type	= MAC_SCC_QUADRA,
-		.nubus_type	= MAC_NUBUS,
 		.floppy_type	= MAC_FLOPPY_SWIM_ADDR2,
 	}, {
 		.ident		= MAC_MODEL_PB145,
@@ -642,7 +636,6 @@ static struct mac_model mac_data_table[] = {
 		.via_type	= MAC_VIA_QUADRA,
 		.scsi_type	= MAC_SCSI_OLD,
 		.scc_type	= MAC_SCC_QUADRA,
-		.nubus_type	= MAC_NUBUS,
 		.floppy_type	= MAC_FLOPPY_SWIM_ADDR2,
 	}, {
 		.ident		= MAC_MODEL_PB150,
@@ -652,7 +645,6 @@ static struct mac_model mac_data_table[] = {
 		.scsi_type	= MAC_SCSI_OLD,
 		.ide_type	= MAC_IDE_PB,
 		.scc_type	= MAC_SCC_QUADRA,
-		.nubus_type	= MAC_NUBUS,
 		.floppy_type	= MAC_FLOPPY_SWIM_ADDR2,
 	}, {
 		.ident		= MAC_MODEL_PB160,
@@ -661,7 +653,6 @@ static struct mac_model mac_data_table[] = {
 		.via_type	= MAC_VIA_QUADRA,
 		.scsi_type	= MAC_SCSI_OLD,
 		.scc_type	= MAC_SCC_QUADRA,
-		.nubus_type	= MAC_NUBUS,
 		.floppy_type	= MAC_FLOPPY_SWIM_ADDR2,
 	}, {
 		.ident		= MAC_MODEL_PB165,
@@ -670,7 +661,6 @@ static struct mac_model mac_data_table[] = {
 		.via_type	= MAC_VIA_QUADRA,
 		.scsi_type	= MAC_SCSI_OLD,
 		.scc_type	= MAC_SCC_QUADRA,
-		.nubus_type	= MAC_NUBUS,
 		.floppy_type	= MAC_FLOPPY_SWIM_ADDR2,
 	}, {
 		.ident		= MAC_MODEL_PB165C,
@@ -679,7 +669,6 @@ static struct mac_model mac_data_table[] = {
 		.via_type	= MAC_VIA_QUADRA,
 		.scsi_type	= MAC_SCSI_OLD,
 		.scc_type	= MAC_SCC_QUADRA,
-		.nubus_type	= MAC_NUBUS,
 		.floppy_type	= MAC_FLOPPY_SWIM_ADDR2,
 	}, {
 		.ident		= MAC_MODEL_PB170,
@@ -688,7 +677,6 @@ static struct mac_model mac_data_table[] = {
 		.via_type	= MAC_VIA_QUADRA,
 		.scsi_type	= MAC_SCSI_OLD,
 		.scc_type	= MAC_SCC_QUADRA,
-		.nubus_type	= MAC_NUBUS,
 		.floppy_type	= MAC_FLOPPY_SWIM_ADDR2,
 	}, {
 		.ident		= MAC_MODEL_PB180,
@@ -697,7 +685,6 @@ static struct mac_model mac_data_table[] = {
 		.via_type	= MAC_VIA_QUADRA,
 		.scsi_type	= MAC_SCSI_OLD,
 		.scc_type	= MAC_SCC_QUADRA,
-		.nubus_type	= MAC_NUBUS,
 		.floppy_type	= MAC_FLOPPY_SWIM_ADDR2,
 	}, {
 		.ident		= MAC_MODEL_PB180C,
@@ -706,7 +693,6 @@ static struct mac_model mac_data_table[] = {
 		.via_type	= MAC_VIA_QUADRA,
 		.scsi_type	= MAC_SCSI_OLD,
 		.scc_type	= MAC_SCC_QUADRA,
-		.nubus_type	= MAC_NUBUS,
 		.floppy_type	= MAC_FLOPPY_SWIM_ADDR2,
 	}, {
 		.ident		= MAC_MODEL_PB190,
@@ -716,7 +702,6 @@ static struct mac_model mac_data_table[] = {
 		.scsi_type	= MAC_SCSI_LATE,
 		.ide_type	= MAC_IDE_BABOON,
 		.scc_type	= MAC_SCC_QUADRA,
-		.nubus_type	= MAC_NUBUS,
 		.floppy_type	= MAC_FLOPPY_SWIM_ADDR2,
 	}, {
 		.ident		= MAC_MODEL_PB520,
@@ -726,7 +711,6 @@ static struct mac_model mac_data_table[] = {
 		.scsi_type	= MAC_SCSI_LATE,
 		.scc_type	= MAC_SCC_QUADRA,
 		.ether_type	= MAC_ETHER_SONIC,
-		.nubus_type	= MAC_NUBUS,
 		.floppy_type	= MAC_FLOPPY_SWIM_ADDR2,
 	},
 
@@ -743,7 +727,7 @@ static struct mac_model mac_data_table[] = {
 		.via_type	= MAC_VIA_IICI,
 		.scsi_type	= MAC_SCSI_DUO,
 		.scc_type	= MAC_SCC_QUADRA,
-		.nubus_type	= MAC_NUBUS,
+		.expansion_type	= MAC_EXP_NUBUS,
 		.floppy_type	= MAC_FLOPPY_SWIM_ADDR2,
 	}, {
 		.ident		= MAC_MODEL_PB230,
@@ -752,7 +736,7 @@ static struct mac_model mac_data_table[] = {
 		.via_type	= MAC_VIA_IICI,
 		.scsi_type	= MAC_SCSI_DUO,
 		.scc_type	= MAC_SCC_QUADRA,
-		.nubus_type	= MAC_NUBUS,
+		.expansion_type	= MAC_EXP_NUBUS,
 		.floppy_type	= MAC_FLOPPY_SWIM_ADDR2,
 	}, {
 		.ident		= MAC_MODEL_PB250,
@@ -761,7 +745,7 @@ static struct mac_model mac_data_table[] = {
 		.via_type	= MAC_VIA_IICI,
 		.scsi_type	= MAC_SCSI_DUO,
 		.scc_type	= MAC_SCC_QUADRA,
-		.nubus_type	= MAC_NUBUS,
+		.expansion_type	= MAC_EXP_NUBUS,
 		.floppy_type	= MAC_FLOPPY_SWIM_ADDR2,
 	}, {
 		.ident		= MAC_MODEL_PB270C,
@@ -770,7 +754,7 @@ static struct mac_model mac_data_table[] = {
 		.via_type	= MAC_VIA_IICI,
 		.scsi_type	= MAC_SCSI_DUO,
 		.scc_type	= MAC_SCC_QUADRA,
-		.nubus_type	= MAC_NUBUS,
+		.expansion_type	= MAC_EXP_NUBUS,
 		.floppy_type	= MAC_FLOPPY_SWIM_ADDR2,
 	}, {
 		.ident		= MAC_MODEL_PB280,
@@ -779,7 +763,7 @@ static struct mac_model mac_data_table[] = {
 		.via_type	= MAC_VIA_IICI,
 		.scsi_type	= MAC_SCSI_DUO,
 		.scc_type	= MAC_SCC_QUADRA,
-		.nubus_type	= MAC_NUBUS,
+		.expansion_type	= MAC_EXP_NUBUS,
 		.floppy_type	= MAC_FLOPPY_SWIM_ADDR2,
 	}, {
 		.ident		= MAC_MODEL_PB280C,
@@ -788,7 +772,7 @@ static struct mac_model mac_data_table[] = {
 		.via_type	= MAC_VIA_IICI,
 		.scsi_type	= MAC_SCSI_DUO,
 		.scc_type	= MAC_SCC_QUADRA,
-		.nubus_type	= MAC_NUBUS,
+		.expansion_type	= MAC_EXP_NUBUS,
 		.floppy_type	= MAC_FLOPPY_SWIM_ADDR2,
 	},
 
@@ -1100,14 +1084,12 @@ int __init mac_platform_init(void)
 	 * Ethernet device
 	 */
 
-	switch (macintosh_config->ether_type) {
-	case MAC_ETHER_SONIC:
+	if (macintosh_config->ether_type == MAC_ETHER_SONIC ||
+	    macintosh_config->expansion_type == MAC_EXP_PDS_COMM)
 		platform_device_register_simple("macsonic", -1, NULL, 0);
-		break;
-	case MAC_ETHER_MACE:
+
+	if (macintosh_config->ether_type == MAC_ETHER_MACE)
 		platform_device_register_simple("macmace", -1, NULL, 0);
-		break;
-	}
 
 	return 0;
 }
diff --git a/drivers/net/ethernet/natsemi/macsonic.c b/drivers/net/ethernet/natsemi/macsonic.c
index 313fe5e0184b..b922ab5cedea 100644
--- a/drivers/net/ethernet/natsemi/macsonic.c
+++ b/drivers/net/ethernet/natsemi/macsonic.c
@@ -311,7 +311,7 @@ static int mac_onboard_sonic_probe(struct net_device *dev)
 {
 	struct sonic_local* lp = netdev_priv(dev);
 	int sr;
-	int commslot = 0;
+	bool commslot = macintosh_config->expansion_type == MAC_EXP_PDS_COMM;
 
 	if (!MACH_IS_MAC)
 		return -ENODEV;
@@ -322,10 +322,7 @@ static int mac_onboard_sonic_probe(struct net_device *dev)
 	   Ethernet (BTW, the Ethernet *is* always at the same
 	   address, and nothing else lives there, at least if Apple's
 	   documentation is to be believed) */
-	if (macintosh_config->ident == MAC_MODEL_Q630 ||
-	    macintosh_config->ident == MAC_MODEL_P588 ||
-	    macintosh_config->ident == MAC_MODEL_P575 ||
-	    macintosh_config->ident == MAC_MODEL_C610) {
+	if (commslot || macintosh_config->ident == MAC_MODEL_C610) {
 		int card_present;
 
 		card_present = hwreg_present((void*)ONBOARD_SONIC_REGISTERS);
@@ -333,7 +330,6 @@ static int mac_onboard_sonic_probe(struct net_device *dev)
 			printk("none.\n");
 			return -ENODEV;
 		}
-		commslot = 1;
 	}
 
 	printk("yes\n");
-- 
2.13.6
