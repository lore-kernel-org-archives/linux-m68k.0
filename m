From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] m68k/defconfig: Use ext4 for ext2/ext3 file systems
Date: Thu, 28 Nov 2013 14:03:23 +0100
Message-ID: <1385643803-6297-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@lists.linux-m68k.org
Cc: Geert Uytterhoeven <geert@linux-m68k.org>

This reduces the kernel image size by ca. 160 KiB.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 arch/m68k/configs/amiga_defconfig    |    4 ----
 arch/m68k/configs/apollo_defconfig   |    4 ----
 arch/m68k/configs/atari_defconfig    |    4 ----
 arch/m68k/configs/bvme6000_defconfig |    4 ----
 arch/m68k/configs/hp300_defconfig    |    4 ----
 arch/m68k/configs/mac_defconfig      |    4 ----
 arch/m68k/configs/multi_defconfig    |    4 ----
 arch/m68k/configs/mvme147_defconfig  |    4 ----
 arch/m68k/configs/mvme16x_defconfig  |    4 ----
 arch/m68k/configs/q40_defconfig      |    4 ----
 arch/m68k/configs/sun3_defconfig     |    4 ----
 arch/m68k/configs/sun3x_defconfig    |    4 ----
 12 files changed, 48 deletions(-)

diff --git a/arch/m68k/configs/amiga_defconfig b/arch/m68k/configs/amiga_defconfig
index 2886706abdf5..d99ac22759b2 100644
--- a/arch/m68k/configs/amiga_defconfig
+++ b/arch/m68k/configs/amiga_defconfig
@@ -376,10 +376,6 @@ CONFIG_HEARTBEAT=y
 CONFIG_PROC_HARDWARE=y
 CONFIG_AMIGA_BUILTIN_SERIAL=y
 CONFIG_SERIAL_CONSOLE=y
-CONFIG_EXT2_FS=y
-CONFIG_EXT3_FS=y
-# CONFIG_EXT3_DEFAULTS_TO_ORDERED is not set
-# CONFIG_EXT3_FS_XATTR is not set
 CONFIG_EXT4_FS=y
 CONFIG_REISERFS_FS=m
 CONFIG_JFS_FS=m
diff --git a/arch/m68k/configs/apollo_defconfig b/arch/m68k/configs/apollo_defconfig
index ae1e9b9f7f2f..d486413ed25f 100644
--- a/arch/m68k/configs/apollo_defconfig
+++ b/arch/m68k/configs/apollo_defconfig
@@ -334,10 +334,6 @@ CONFIG_RTC_DRV_GENERIC=m
 # CONFIG_IOMMU_SUPPORT is not set
 CONFIG_HEARTBEAT=y
 CONFIG_PROC_HARDWARE=y
-CONFIG_EXT2_FS=y
-CONFIG_EXT3_FS=y
-# CONFIG_EXT3_DEFAULTS_TO_ORDERED is not set
-# CONFIG_EXT3_FS_XATTR is not set
 CONFIG_EXT4_FS=y
 CONFIG_REISERFS_FS=m
 CONFIG_JFS_FS=m
diff --git a/arch/m68k/configs/atari_defconfig b/arch/m68k/configs/atari_defconfig
index 4c6ab2227c1f..7a15fc001769 100644
--- a/arch/m68k/configs/atari_defconfig
+++ b/arch/m68k/configs/atari_defconfig
@@ -364,10 +364,6 @@ CONFIG_NFETH=y
 CONFIG_ATARI_ETHERNAT=y
 CONFIG_ATARI_ETHERNEC=y
 CONFIG_ATARI_DSP56K=m
-CONFIG_EXT2_FS=y
-CONFIG_EXT3_FS=y
-# CONFIG_EXT3_DEFAULTS_TO_ORDERED is not set
-# CONFIG_EXT3_FS_XATTR is not set
 CONFIG_EXT4_FS=y
 CONFIG_REISERFS_FS=m
 CONFIG_JFS_FS=m
diff --git a/arch/m68k/configs/bvme6000_defconfig b/arch/m68k/configs/bvme6000_defconfig
index 5fd1a1ccdca9..f77b1b6520b3 100644
--- a/arch/m68k/configs/bvme6000_defconfig
+++ b/arch/m68k/configs/bvme6000_defconfig
@@ -327,10 +327,6 @@ CONFIG_RTC_CLASS=y
 CONFIG_RTC_DRV_GENERIC=m
 # CONFIG_IOMMU_SUPPORT is not set
 CONFIG_PROC_HARDWARE=y
-CONFIG_EXT2_FS=y
-CONFIG_EXT3_FS=y
-# CONFIG_EXT3_DEFAULTS_TO_ORDERED is not set
-# CONFIG_EXT3_FS_XATTR is not set
 CONFIG_EXT4_FS=y
 CONFIG_REISERFS_FS=m
 CONFIG_JFS_FS=m
diff --git a/arch/m68k/configs/hp300_defconfig b/arch/m68k/configs/hp300_defconfig
index 5e958c9593d6..d53b06bd0298 100644
--- a/arch/m68k/configs/hp300_defconfig
+++ b/arch/m68k/configs/hp300_defconfig
@@ -336,10 +336,6 @@ CONFIG_RTC_CLASS=y
 CONFIG_RTC_DRV_GENERIC=m
 # CONFIG_IOMMU_SUPPORT is not set
 CONFIG_PROC_HARDWARE=y
-CONFIG_EXT2_FS=y
-CONFIG_EXT3_FS=y
-# CONFIG_EXT3_DEFAULTS_TO_ORDERED is not set
-# CONFIG_EXT3_FS_XATTR is not set
 CONFIG_EXT4_FS=y
 CONFIG_REISERFS_FS=m
 CONFIG_JFS_FS=m
diff --git a/arch/m68k/configs/mac_defconfig b/arch/m68k/configs/mac_defconfig
index 298adf262dd6..6b19b5e7e65e 100644
--- a/arch/m68k/configs/mac_defconfig
+++ b/arch/m68k/configs/mac_defconfig
@@ -358,10 +358,6 @@ CONFIG_RTC_CLASS=y
 CONFIG_RTC_DRV_GENERIC=m
 # CONFIG_IOMMU_SUPPORT is not set
 CONFIG_PROC_HARDWARE=y
-CONFIG_EXT2_FS=y
-CONFIG_EXT3_FS=y
-# CONFIG_EXT3_DEFAULTS_TO_ORDERED is not set
-# CONFIG_EXT3_FS_XATTR is not set
 CONFIG_EXT4_FS=y
 CONFIG_REISERFS_FS=m
 CONFIG_JFS_FS=m
diff --git a/arch/m68k/configs/multi_defconfig b/arch/m68k/configs/multi_defconfig
index ef9c15b19fc4..3194afb2fc06 100644
--- a/arch/m68k/configs/multi_defconfig
+++ b/arch/m68k/configs/multi_defconfig
@@ -440,10 +440,6 @@ CONFIG_ATARI_ETHERNEC=y
 CONFIG_ATARI_DSP56K=m
 CONFIG_AMIGA_BUILTIN_SERIAL=y
 CONFIG_SERIAL_CONSOLE=y
-CONFIG_EXT2_FS=y
-CONFIG_EXT3_FS=y
-# CONFIG_EXT3_DEFAULTS_TO_ORDERED is not set
-# CONFIG_EXT3_FS_XATTR is not set
 CONFIG_EXT4_FS=y
 CONFIG_REISERFS_FS=m
 CONFIG_JFS_FS=m
diff --git a/arch/m68k/configs/mvme147_defconfig b/arch/m68k/configs/mvme147_defconfig
index 7bf520f661c8..224e21c788be 100644
--- a/arch/m68k/configs/mvme147_defconfig
+++ b/arch/m68k/configs/mvme147_defconfig
@@ -327,10 +327,6 @@ CONFIG_RTC_CLASS=y
 CONFIG_RTC_DRV_GENERIC=m
 # CONFIG_IOMMU_SUPPORT is not set
 CONFIG_PROC_HARDWARE=y
-CONFIG_EXT2_FS=y
-CONFIG_EXT3_FS=y
-# CONFIG_EXT3_DEFAULTS_TO_ORDERED is not set
-# CONFIG_EXT3_FS_XATTR is not set
 CONFIG_EXT4_FS=y
 CONFIG_REISERFS_FS=m
 CONFIG_JFS_FS=m
diff --git a/arch/m68k/configs/mvme16x_defconfig b/arch/m68k/configs/mvme16x_defconfig
index 2b4f58288966..23e5ebd81cdc 100644
--- a/arch/m68k/configs/mvme16x_defconfig
+++ b/arch/m68k/configs/mvme16x_defconfig
@@ -327,10 +327,6 @@ CONFIG_RTC_CLASS=y
 CONFIG_RTC_DRV_GENERIC=m
 # CONFIG_IOMMU_SUPPORT is not set
 CONFIG_PROC_HARDWARE=y
-CONFIG_EXT2_FS=y
-CONFIG_EXT3_FS=y
-# CONFIG_EXT3_DEFAULTS_TO_ORDERED is not set
-# CONFIG_EXT3_FS_XATTR is not set
 CONFIG_EXT4_FS=y
 CONFIG_REISERFS_FS=m
 CONFIG_JFS_FS=m
diff --git a/arch/m68k/configs/q40_defconfig b/arch/m68k/configs/q40_defconfig
index ac9a949ea810..bb0d3bb3dd7e 100644
--- a/arch/m68k/configs/q40_defconfig
+++ b/arch/m68k/configs/q40_defconfig
@@ -349,10 +349,6 @@ CONFIG_RTC_DRV_GENERIC=m
 # CONFIG_IOMMU_SUPPORT is not set
 CONFIG_HEARTBEAT=y
 CONFIG_PROC_HARDWARE=y
-CONFIG_EXT2_FS=y
-CONFIG_EXT3_FS=y
-# CONFIG_EXT3_DEFAULTS_TO_ORDERED is not set
-# CONFIG_EXT3_FS_XATTR is not set
 CONFIG_EXT4_FS=y
 CONFIG_REISERFS_FS=m
 CONFIG_JFS_FS=m
diff --git a/arch/m68k/configs/sun3_defconfig b/arch/m68k/configs/sun3_defconfig
index 161331f74269..7e5915ceeb8d 100644
--- a/arch/m68k/configs/sun3_defconfig
+++ b/arch/m68k/configs/sun3_defconfig
@@ -328,10 +328,6 @@ CONFIG_RTC_CLASS=y
 CONFIG_RTC_DRV_GENERIC=m
 # CONFIG_IOMMU_SUPPORT is not set
 CONFIG_PROC_HARDWARE=y
-CONFIG_EXT2_FS=y
-CONFIG_EXT3_FS=y
-# CONFIG_EXT3_DEFAULTS_TO_ORDERED is not set
-# CONFIG_EXT3_FS_XATTR is not set
 CONFIG_EXT4_FS=y
 CONFIG_REISERFS_FS=m
 CONFIG_JFS_FS=m
diff --git a/arch/m68k/configs/sun3x_defconfig b/arch/m68k/configs/sun3x_defconfig
index 289607ac283a..8313075d56dd 100644
--- a/arch/m68k/configs/sun3x_defconfig
+++ b/arch/m68k/configs/sun3x_defconfig
@@ -328,10 +328,6 @@ CONFIG_RTC_CLASS=y
 CONFIG_RTC_DRV_GENERIC=m
 # CONFIG_IOMMU_SUPPORT is not set
 CONFIG_PROC_HARDWARE=y
-CONFIG_EXT2_FS=y
-CONFIG_EXT3_FS=y
-# CONFIG_EXT3_DEFAULTS_TO_ORDERED is not set
-# CONFIG_EXT3_FS_XATTR is not set
 CONFIG_EXT4_FS=y
 CONFIG_REISERFS_FS=m
 CONFIG_JFS_FS=m
-- 
1.7.9.5
