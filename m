From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH/RFC] m68k/defconfig: Enable atyfb for Atari
Date: Tue, 26 Nov 2013 11:57:14 +0100
Message-ID: <1385463434-16605-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@lists.linux-m68k.org
Cc: Geert Uytterhoeven <geert@linux-m68k.org>

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
Does anyone find it worthy to re-enable this? It will cost ca. 24 KiB.
IIRC, atyfb was disabled a long time ago when it stopped compiling.
In the mean time, that got fixed.

 arch/m68k/configs/atari_defconfig |    3 +++
 arch/m68k/configs/multi_defconfig |    3 +++
 2 files changed, 6 insertions(+)

diff --git a/arch/m68k/configs/atari_defconfig b/arch/m68k/configs/atari_defconfig
index 12c5e8b09b10..9b90cf349857 100644
--- a/arch/m68k/configs/atari_defconfig
+++ b/arch/m68k/configs/atari_defconfig
@@ -313,6 +313,9 @@ CONFIG_PTP_1588_CLOCK=m
 # CONFIG_HWMON is not set
 CONFIG_FB=y
 CONFIG_FB_ATARI=y
+CONFIG_FB_ATY=y
+# CONFIG_LCD_CLASS_DEVICE is not set
+# CONFIG_BACKLIGHT_GENERIC is not set
 CONFIG_FRAMEBUFFER_CONSOLE=y
 CONFIG_LOGO=y
 CONFIG_SOUND=m
diff --git a/arch/m68k/configs/multi_defconfig b/arch/m68k/configs/multi_defconfig
index ccb5d825bcaf..bf5bc789a15b 100644
--- a/arch/m68k/configs/multi_defconfig
+++ b/arch/m68k/configs/multi_defconfig
@@ -389,6 +389,9 @@ CONFIG_FB_FM2=y
 CONFIG_FB_ATARI=y
 CONFIG_FB_VALKYRIE=y
 CONFIG_FB_MAC=y
+CONFIG_FB_ATY=y
+# CONFIG_LCD_CLASS_DEVICE is not set
+# CONFIG_BACKLIGHT_GENERIC is not set
 CONFIG_FRAMEBUFFER_CONSOLE=y
 CONFIG_LOGO=y
 CONFIG_SOUND=m
-- 
1.7.9.5
