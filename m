From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 1/2] m68k/defconfig: Disable experimental CONFIG_DM_CACHE
Date: Mon,  6 Jul 2015 15:54:39 +0200
Message-ID: <1436190880-8434-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@lists.linux-m68k.org
Cc: Geert Uytterhoeven <geert@linux-m68k.org>

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 arch/m68k/configs/amiga_defconfig    | 1 -
 arch/m68k/configs/apollo_defconfig   | 1 -
 arch/m68k/configs/atari_defconfig    | 1 -
 arch/m68k/configs/bvme6000_defconfig | 1 -
 arch/m68k/configs/hp300_defconfig    | 1 -
 arch/m68k/configs/mac_defconfig      | 1 -
 arch/m68k/configs/multi_defconfig    | 1 -
 arch/m68k/configs/mvme147_defconfig  | 1 -
 arch/m68k/configs/mvme16x_defconfig  | 1 -
 arch/m68k/configs/q40_defconfig      | 1 -
 arch/m68k/configs/sun3_defconfig     | 1 -
 arch/m68k/configs/sun3x_defconfig    | 1 -
 12 files changed, 12 deletions(-)

diff --git a/arch/m68k/configs/amiga_defconfig b/arch/m68k/configs/amiga_defconfig
index 753a6237f99a30a8..446d431fd4ceff79 100644
--- a/arch/m68k/configs/amiga_defconfig
+++ b/arch/m68k/configs/amiga_defconfig
@@ -320,7 +320,6 @@ CONFIG_BLK_DEV_DM=m
 CONFIG_DM_CRYPT=m
 CONFIG_DM_SNAPSHOT=m
 CONFIG_DM_THIN_PROVISIONING=m
-CONFIG_DM_CACHE=m
 CONFIG_DM_ERA=m
 CONFIG_DM_MIRROR=m
 CONFIG_DM_RAID=m
diff --git a/arch/m68k/configs/apollo_defconfig b/arch/m68k/configs/apollo_defconfig
index 1f93dcaf02e51471..feaa7282b938142c 100644
--- a/arch/m68k/configs/apollo_defconfig
+++ b/arch/m68k/configs/apollo_defconfig
@@ -302,7 +302,6 @@ CONFIG_BLK_DEV_DM=m
 CONFIG_DM_CRYPT=m
 CONFIG_DM_SNAPSHOT=m
 CONFIG_DM_THIN_PROVISIONING=m
-CONFIG_DM_CACHE=m
 CONFIG_DM_ERA=m
 CONFIG_DM_MIRROR=m
 CONFIG_DM_RAID=m
diff --git a/arch/m68k/configs/atari_defconfig b/arch/m68k/configs/atari_defconfig
index 0a670d14c820cfea..f61a09027d7a6e98 100644
--- a/arch/m68k/configs/atari_defconfig
+++ b/arch/m68k/configs/atari_defconfig
@@ -311,7 +311,6 @@ CONFIG_BLK_DEV_DM=m
 CONFIG_DM_CRYPT=m
 CONFIG_DM_SNAPSHOT=m
 CONFIG_DM_THIN_PROVISIONING=m
-CONFIG_DM_CACHE=m
 CONFIG_DM_ERA=m
 CONFIG_DM_MIRROR=m
 CONFIG_DM_RAID=m
diff --git a/arch/m68k/configs/bvme6000_defconfig b/arch/m68k/configs/bvme6000_defconfig
index 91fd187c16d59f6e..dc92ab3527a92691 100644
--- a/arch/m68k/configs/bvme6000_defconfig
+++ b/arch/m68k/configs/bvme6000_defconfig
@@ -301,7 +301,6 @@ CONFIG_BLK_DEV_DM=m
 CONFIG_DM_CRYPT=m
 CONFIG_DM_SNAPSHOT=m
 CONFIG_DM_THIN_PROVISIONING=m
-CONFIG_DM_CACHE=m
 CONFIG_DM_ERA=m
 CONFIG_DM_MIRROR=m
 CONFIG_DM_RAID=m
diff --git a/arch/m68k/configs/hp300_defconfig b/arch/m68k/configs/hp300_defconfig
index 9d4934f1d2c3b8c9..592ae86b67160269 100644
--- a/arch/m68k/configs/hp300_defconfig
+++ b/arch/m68k/configs/hp300_defconfig
@@ -302,7 +302,6 @@ CONFIG_BLK_DEV_DM=m
 CONFIG_DM_CRYPT=m
 CONFIG_DM_SNAPSHOT=m
 CONFIG_DM_THIN_PROVISIONING=m
-CONFIG_DM_CACHE=m
 CONFIG_DM_ERA=m
 CONFIG_DM_MIRROR=m
 CONFIG_DM_RAID=m
diff --git a/arch/m68k/configs/mac_defconfig b/arch/m68k/configs/mac_defconfig
index 72bc187ca995ad59..1381eed7702d5a74 100644
--- a/arch/m68k/configs/mac_defconfig
+++ b/arch/m68k/configs/mac_defconfig
@@ -311,7 +311,6 @@ CONFIG_BLK_DEV_DM=m
 CONFIG_DM_CRYPT=m
 CONFIG_DM_SNAPSHOT=m
 CONFIG_DM_THIN_PROVISIONING=m
-CONFIG_DM_CACHE=m
 CONFIG_DM_ERA=m
 CONFIG_DM_MIRROR=m
 CONFIG_DM_RAID=m
diff --git a/arch/m68k/configs/multi_defconfig b/arch/m68k/configs/multi_defconfig
index 8fb65535597fd13f..c67248174e5619b2 100644
--- a/arch/m68k/configs/multi_defconfig
+++ b/arch/m68k/configs/multi_defconfig
@@ -344,7 +344,6 @@ CONFIG_BLK_DEV_DM=m
 CONFIG_DM_CRYPT=m
 CONFIG_DM_SNAPSHOT=m
 CONFIG_DM_THIN_PROVISIONING=m
-CONFIG_DM_CACHE=m
 CONFIG_DM_ERA=m
 CONFIG_DM_MIRROR=m
 CONFIG_DM_RAID=m
diff --git a/arch/m68k/configs/mvme147_defconfig b/arch/m68k/configs/mvme147_defconfig
index f34491ec01269ceb..fcc7f4488d438208 100644
--- a/arch/m68k/configs/mvme147_defconfig
+++ b/arch/m68k/configs/mvme147_defconfig
@@ -300,7 +300,6 @@ CONFIG_BLK_DEV_DM=m
 CONFIG_DM_CRYPT=m
 CONFIG_DM_SNAPSHOT=m
 CONFIG_DM_THIN_PROVISIONING=m
-CONFIG_DM_CACHE=m
 CONFIG_DM_ERA=m
 CONFIG_DM_MIRROR=m
 CONFIG_DM_RAID=m
diff --git a/arch/m68k/configs/mvme16x_defconfig b/arch/m68k/configs/mvme16x_defconfig
index 3d3614d1b041d047..474429471e214c63 100644
--- a/arch/m68k/configs/mvme16x_defconfig
+++ b/arch/m68k/configs/mvme16x_defconfig
@@ -301,7 +301,6 @@ CONFIG_BLK_DEV_DM=m
 CONFIG_DM_CRYPT=m
 CONFIG_DM_SNAPSHOT=m
 CONFIG_DM_THIN_PROVISIONING=m
-CONFIG_DM_CACHE=m
 CONFIG_DM_ERA=m
 CONFIG_DM_MIRROR=m
 CONFIG_DM_RAID=m
diff --git a/arch/m68k/configs/q40_defconfig b/arch/m68k/configs/q40_defconfig
index 643e9c93bea72697..9e4d382161fa6b7d 100644
--- a/arch/m68k/configs/q40_defconfig
+++ b/arch/m68k/configs/q40_defconfig
@@ -307,7 +307,6 @@ CONFIG_BLK_DEV_DM=m
 CONFIG_DM_CRYPT=m
 CONFIG_DM_SNAPSHOT=m
 CONFIG_DM_THIN_PROVISIONING=m
-CONFIG_DM_CACHE=m
 CONFIG_DM_ERA=m
 CONFIG_DM_MIRROR=m
 CONFIG_DM_RAID=m
diff --git a/arch/m68k/configs/sun3_defconfig b/arch/m68k/configs/sun3_defconfig
index 8fecc5aa166c3ea7..e55d15f8cded0337 100644
--- a/arch/m68k/configs/sun3_defconfig
+++ b/arch/m68k/configs/sun3_defconfig
@@ -298,7 +298,6 @@ CONFIG_BLK_DEV_DM=m
 CONFIG_DM_CRYPT=m
 CONFIG_DM_SNAPSHOT=m
 CONFIG_DM_THIN_PROVISIONING=m
-CONFIG_DM_CACHE=m
 CONFIG_DM_ERA=m
 CONFIG_DM_MIRROR=m
 CONFIG_DM_RAID=m
diff --git a/arch/m68k/configs/sun3x_defconfig b/arch/m68k/configs/sun3x_defconfig
index 9902c5bfbdc87685..6f204857babd2cd8 100644
--- a/arch/m68k/configs/sun3x_defconfig
+++ b/arch/m68k/configs/sun3x_defconfig
@@ -298,7 +298,6 @@ CONFIG_BLK_DEV_DM=m
 CONFIG_DM_CRYPT=m
 CONFIG_DM_SNAPSHOT=m
 CONFIG_DM_THIN_PROVISIONING=m
-CONFIG_DM_CACHE=m
 CONFIG_DM_ERA=m
 CONFIG_DM_MIRROR=m
 CONFIG_DM_RAID=m
-- 
1.9.1
