From: Finn Thain <fthain@telegraphics.com.au>
Subject: [PATCH 10/10] nubus: Add MVC and VSC video card definitions
Date: Sat,  8 Apr 2017 19:51:15 -0400 (EDT)
Message-ID: <065b855844f6676bda1b366500ce3d0b40ac1657.1491695243.git.fthain@telegraphics.com.au>
References: <cover.1491695243.git.fthain@telegraphics.com.au>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1491695243.git.fthain@telegraphics.com.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org

Also move the NUBUS_DRHW_APPLE_JET definition, for numerical order.

Signed-off-by: Finn Thain <fthain@telegraphics.com.au>
---
 include/uapi/linux/nubus.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/include/uapi/linux/nubus.h b/include/uapi/linux/nubus.h
index 77513d2..ac51606 100644
--- a/include/uapi/linux/nubus.h
+++ b/include/uapi/linux/nubus.h
@@ -113,13 +113,15 @@ enum nubus_drhw {
 	NUBUS_DRHW_SIGMA_CLRMAX   = 0x0007, /* Sigma Design ColorMax */
 	NUBUS_DRHW_APPLE_SE30     = 0x0009, /* Apple SE/30 video */
 	NUBUS_DRHW_APPLE_HRVC     = 0x0013, /* Mac II High-Res Video Card */
+	NUBUS_DRHW_APPLE_MVC      = 0x0014, /* Mac II Monochrome Video Card */
 	NUBUS_DRHW_APPLE_PVC      = 0x0017, /* Mac II Portrait Video Card */
 	NUBUS_DRHW_APPLE_RBV1     = 0x0018, /* IIci RBV video */
 	NUBUS_DRHW_APPLE_MDC      = 0x0019, /* Macintosh Display Card */
+	NUBUS_DRHW_APPLE_VSC      = 0x0020, /* Duo MiniDock ViSC framebuffer */
 	NUBUS_DRHW_APPLE_SONORA   = 0x0022, /* Sonora built-in video */
+	NUBUS_DRHW_APPLE_JET      = 0x0029, /* Jet framebuffer (DuoDock) */
 	NUBUS_DRHW_APPLE_24AC     = 0x002b, /* Mac 24AC Video Card */
 	NUBUS_DRHW_APPLE_VALKYRIE = 0x002e,
-	NUBUS_DRHW_APPLE_JET      = 0x0029, /* Jet framebuffer (DuoDock) */
 	NUBUS_DRHW_SMAC_GFX       = 0x0105, /* SuperMac GFX */
 	NUBUS_DRHW_RASTER_CB264   = 0x013B, /* RasterOps ColorBoard 264 */
 	NUBUS_DRHW_MICRON_XCEED   = 0x0146, /* Micron Exceed color */
-- 
2.10.2
