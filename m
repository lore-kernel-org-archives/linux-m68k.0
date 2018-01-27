From: Finn Thain <fthain@telegraphics.com.au>
Subject: [PATCH] m68k/mac: Enable PDMA support for PowerBook 190
Date: Sat, 27 Jan 2018 18:51:40 -0500 (EST)
Message-ID: <20180127235140.D559728CE0__25625.8618705489$1517097027$gmane$org@kvm5.telegraphics.com.au>
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org

Stan's tests showed that PDMA improves sequential read performance by
a factor of 5 on a PowerBook 190. Last time I tried this on a
PowerBook 520 it didn't work, so let's not enable it there until
it can be tested with the present mac_scsi driver.

Tested-by: Stan Johnson <userm57@yahoo.com>
Signed-off-by: Finn Thain <fthain@telegraphics.com.au>
---
 arch/m68k/mac/config.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/m68k/mac/config.c b/arch/m68k/mac/config.c
index 16cd5cea5207..95d548d8cc8a 100644
--- a/arch/m68k/mac/config.c
+++ b/arch/m68k/mac/config.c
@@ -713,7 +713,7 @@ static struct mac_model mac_data_table[] = {
 		.name		= "PowerBook 190",
 		.adb_type	= MAC_ADB_PB2,
 		.via_type	= MAC_VIA_QUADRA,
-		.scsi_type	= MAC_SCSI_LATE,
+		.scsi_type	= MAC_SCSI_OLD,
 		.ide_type	= MAC_IDE_BABOON,
 		.scc_type	= MAC_SCC_QUADRA,
 		.nubus_type	= MAC_NUBUS,
@@ -1077,9 +1077,7 @@ int __init mac_platform_init(void)
 			mac_scsi_old_rsrc, ARRAY_SIZE(mac_scsi_old_rsrc));
 		break;
 	case MAC_SCSI_LATE:
-		/* PDMA logic in 68040 PowerBooks is somehow different to
-		 * '030 models. It's probably more like Quadras (see mac_esp).
-		 */
+		/* XXX PDMA support for PowerBook 500 series needs testing */
 		platform_device_register_simple("mac_scsi", 0,
 			mac_scsi_late_rsrc, ARRAY_SIZE(mac_scsi_late_rsrc));
 		break;
-- 
2.13.6
