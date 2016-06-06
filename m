From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] m68k/defconfig: Update defconfigs for v4.7-rc2
Date: Mon,  6 Jun 2016 09:45:38 +0200
Message-ID: <1465199138-22805-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@lists.linux-m68k.org
Cc: Geert Uytterhoeven <geert@linux-m68k.org>

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
To be folded into m68k/defconfig: Update defconfigs for v4.7-rc1
---
 arch/m68k/configs/amiga_defconfig    | 1 +
 arch/m68k/configs/apollo_defconfig   | 1 +
 arch/m68k/configs/atari_defconfig    | 1 +
 arch/m68k/configs/bvme6000_defconfig | 1 +
 arch/m68k/configs/hp300_defconfig    | 1 +
 arch/m68k/configs/mac_defconfig      | 1 +
 arch/m68k/configs/multi_defconfig    | 1 +
 arch/m68k/configs/mvme147_defconfig  | 1 +
 arch/m68k/configs/mvme16x_defconfig  | 1 +
 arch/m68k/configs/q40_defconfig      | 1 +
 arch/m68k/configs/sun3_defconfig     | 1 +
 arch/m68k/configs/sun3x_defconfig    | 1 +
 12 files changed, 12 insertions(+)

diff --git a/arch/m68k/configs/amiga_defconfig b/arch/m68k/configs/amiga_defconfig
index 2a8f5ee65f763ba5..8f5b6f7dd1366024 100644
--- a/arch/m68k/configs/amiga_defconfig
+++ b/arch/m68k/configs/amiga_defconfig
@@ -555,6 +555,7 @@ CONFIG_TEST_STRING_HELPERS=m
 CONFIG_TEST_KSTRTOX=m
 CONFIG_TEST_PRINTF=m
 CONFIG_TEST_BITMAP=m
+CONFIG_TEST_UUID=m
 CONFIG_TEST_RHASHTABLE=m
 CONFIG_TEST_HASH=m
 CONFIG_TEST_LKM=m
diff --git a/arch/m68k/configs/apollo_defconfig b/arch/m68k/configs/apollo_defconfig
index a8e1537b03a9e45e..31bded9c83d45f3a 100644
--- a/arch/m68k/configs/apollo_defconfig
+++ b/arch/m68k/configs/apollo_defconfig
@@ -514,6 +514,7 @@ CONFIG_TEST_STRING_HELPERS=m
 CONFIG_TEST_KSTRTOX=m
 CONFIG_TEST_PRINTF=m
 CONFIG_TEST_BITMAP=m
+CONFIG_TEST_UUID=m
 CONFIG_TEST_RHASHTABLE=m
 CONFIG_TEST_HASH=m
 CONFIG_TEST_LKM=m
diff --git a/arch/m68k/configs/atari_defconfig b/arch/m68k/configs/atari_defconfig
index c513d49b6ac3e175..44be88dfdd1baa79 100644
--- a/arch/m68k/configs/atari_defconfig
+++ b/arch/m68k/configs/atari_defconfig
@@ -545,6 +545,7 @@ CONFIG_TEST_STRING_HELPERS=m
 CONFIG_TEST_KSTRTOX=m
 CONFIG_TEST_PRINTF=m
 CONFIG_TEST_BITMAP=m
+CONFIG_TEST_UUID=m
 CONFIG_TEST_RHASHTABLE=m
 CONFIG_TEST_HASH=m
 CONFIG_TEST_LKM=m
diff --git a/arch/m68k/configs/bvme6000_defconfig b/arch/m68k/configs/bvme6000_defconfig
index 09a0a9696c0341a1..2cbb5c465fec0348 100644
--- a/arch/m68k/configs/bvme6000_defconfig
+++ b/arch/m68k/configs/bvme6000_defconfig
@@ -506,6 +506,7 @@ CONFIG_TEST_STRING_HELPERS=m
 CONFIG_TEST_KSTRTOX=m
 CONFIG_TEST_PRINTF=m
 CONFIG_TEST_BITMAP=m
+CONFIG_TEST_UUID=m
 CONFIG_TEST_RHASHTABLE=m
 CONFIG_TEST_HASH=m
 CONFIG_TEST_LKM=m
diff --git a/arch/m68k/configs/hp300_defconfig b/arch/m68k/configs/hp300_defconfig
index 84570670e47aad6f..96102a42c156ee2d 100644
--- a/arch/m68k/configs/hp300_defconfig
+++ b/arch/m68k/configs/hp300_defconfig
@@ -516,6 +516,7 @@ CONFIG_TEST_STRING_HELPERS=m
 CONFIG_TEST_KSTRTOX=m
 CONFIG_TEST_PRINTF=m
 CONFIG_TEST_BITMAP=m
+CONFIG_TEST_UUID=m
 CONFIG_TEST_RHASHTABLE=m
 CONFIG_TEST_HASH=m
 CONFIG_TEST_LKM=m
diff --git a/arch/m68k/configs/mac_defconfig b/arch/m68k/configs/mac_defconfig
index 2c70dd21a14a1941..97d88f7dc5a7bd60 100644
--- a/arch/m68k/configs/mac_defconfig
+++ b/arch/m68k/configs/mac_defconfig
@@ -538,6 +538,7 @@ CONFIG_TEST_STRING_HELPERS=m
 CONFIG_TEST_KSTRTOX=m
 CONFIG_TEST_PRINTF=m
 CONFIG_TEST_BITMAP=m
+CONFIG_TEST_UUID=m
 CONFIG_TEST_RHASHTABLE=m
 CONFIG_TEST_HASH=m
 CONFIG_TEST_LKM=m
diff --git a/arch/m68k/configs/multi_defconfig b/arch/m68k/configs/multi_defconfig
index 63764afbacbd0690..be25ef208f0f6237 100644
--- a/arch/m68k/configs/multi_defconfig
+++ b/arch/m68k/configs/multi_defconfig
@@ -618,6 +618,7 @@ CONFIG_TEST_STRING_HELPERS=m
 CONFIG_TEST_KSTRTOX=m
 CONFIG_TEST_PRINTF=m
 CONFIG_TEST_BITMAP=m
+CONFIG_TEST_UUID=m
 CONFIG_TEST_RHASHTABLE=m
 CONFIG_TEST_HASH=m
 CONFIG_TEST_LKM=m
diff --git a/arch/m68k/configs/mvme147_defconfig b/arch/m68k/configs/mvme147_defconfig
index bc03811152018e36..a008344360c91611 100644
--- a/arch/m68k/configs/mvme147_defconfig
+++ b/arch/m68k/configs/mvme147_defconfig
@@ -506,6 +506,7 @@ CONFIG_TEST_STRING_HELPERS=m
 CONFIG_TEST_KSTRTOX=m
 CONFIG_TEST_PRINTF=m
 CONFIG_TEST_BITMAP=m
+CONFIG_TEST_UUID=m
 CONFIG_TEST_RHASHTABLE=m
 CONFIG_TEST_HASH=m
 CONFIG_TEST_LKM=m
diff --git a/arch/m68k/configs/mvme16x_defconfig b/arch/m68k/configs/mvme16x_defconfig
index 41834a7a75e21b72..6735a25f36d446f3 100644
--- a/arch/m68k/configs/mvme16x_defconfig
+++ b/arch/m68k/configs/mvme16x_defconfig
@@ -506,6 +506,7 @@ CONFIG_TEST_STRING_HELPERS=m
 CONFIG_TEST_KSTRTOX=m
 CONFIG_TEST_PRINTF=m
 CONFIG_TEST_BITMAP=m
+CONFIG_TEST_UUID=m
 CONFIG_TEST_RHASHTABLE=m
 CONFIG_TEST_HASH=m
 CONFIG_TEST_LKM=m
diff --git a/arch/m68k/configs/q40_defconfig b/arch/m68k/configs/q40_defconfig
index 91f80c651a9ffdcf..780c6e9f6cf9113d 100644
--- a/arch/m68k/configs/q40_defconfig
+++ b/arch/m68k/configs/q40_defconfig
@@ -529,6 +529,7 @@ CONFIG_TEST_STRING_HELPERS=m
 CONFIG_TEST_KSTRTOX=m
 CONFIG_TEST_PRINTF=m
 CONFIG_TEST_BITMAP=m
+CONFIG_TEST_UUID=m
 CONFIG_TEST_RHASHTABLE=m
 CONFIG_TEST_HASH=m
 CONFIG_TEST_LKM=m
diff --git a/arch/m68k/configs/sun3_defconfig b/arch/m68k/configs/sun3_defconfig
index 7c9ca70af640a331..44693cf361e5df9c 100644
--- a/arch/m68k/configs/sun3_defconfig
+++ b/arch/m68k/configs/sun3_defconfig
@@ -508,6 +508,7 @@ CONFIG_TEST_STRING_HELPERS=m
 CONFIG_TEST_KSTRTOX=m
 CONFIG_TEST_PRINTF=m
 CONFIG_TEST_BITMAP=m
+CONFIG_TEST_UUID=m
 CONFIG_TEST_RHASHTABLE=m
 CONFIG_TEST_HASH=m
 CONFIG_TEST_LKM=m
diff --git a/arch/m68k/configs/sun3x_defconfig b/arch/m68k/configs/sun3x_defconfig
index 95147e158282add6..ef0071d611583465 100644
--- a/arch/m68k/configs/sun3x_defconfig
+++ b/arch/m68k/configs/sun3x_defconfig
@@ -508,6 +508,7 @@ CONFIG_TEST_STRING_HELPERS=m
 CONFIG_TEST_KSTRTOX=m
 CONFIG_TEST_PRINTF=m
 CONFIG_TEST_BITMAP=m
+CONFIG_TEST_UUID=m
 CONFIG_TEST_RHASHTABLE=m
 CONFIG_TEST_HASH=m
 CONFIG_TEST_LKM=m
-- 
1.9.1
