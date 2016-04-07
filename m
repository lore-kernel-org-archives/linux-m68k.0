From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] m68k/defconfig: Update defconfigs for v4.6-rc2
Date: Thu,  7 Apr 2016 11:36:47 +0200
Message-ID: <1460021807-15572-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@lists.linux-m68k.org
Cc: Geert Uytterhoeven <geert@linux-m68k.org>

To be folded into "m68k/defconfig: Update defconfigs for v4.6-rc1".

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
index dc7bdf9b9f375103..3ee6976f60885e5b 100644
--- a/arch/m68k/configs/amiga_defconfig
+++ b/arch/m68k/configs/amiga_defconfig
@@ -1,7 +1,6 @@
 CONFIG_LOCALVERSION="-amiga"
 CONFIG_SYSVIPC=y
 CONFIG_POSIX_MQUEUE=y
-CONFIG_FHANDLE=y
 CONFIG_BSD_PROCESS_ACCT=y
 CONFIG_BSD_PROCESS_ACCT_V3=y
 CONFIG_LOG_BUF_SHIFT=16
diff --git a/arch/m68k/configs/apollo_defconfig b/arch/m68k/configs/apollo_defconfig
index e541e89c4791d017..e96787ffcbced33f 100644
--- a/arch/m68k/configs/apollo_defconfig
+++ b/arch/m68k/configs/apollo_defconfig
@@ -1,7 +1,6 @@
 CONFIG_LOCALVERSION="-apollo"
 CONFIG_SYSVIPC=y
 CONFIG_POSIX_MQUEUE=y
-CONFIG_FHANDLE=y
 CONFIG_BSD_PROCESS_ACCT=y
 CONFIG_BSD_PROCESS_ACCT_V3=y
 CONFIG_LOG_BUF_SHIFT=16
diff --git a/arch/m68k/configs/atari_defconfig b/arch/m68k/configs/atari_defconfig
index a314e5584c1a5098..b9249ddb88263e98 100644
--- a/arch/m68k/configs/atari_defconfig
+++ b/arch/m68k/configs/atari_defconfig
@@ -1,7 +1,6 @@
 CONFIG_LOCALVERSION="-atari"
 CONFIG_SYSVIPC=y
 CONFIG_POSIX_MQUEUE=y
-CONFIG_FHANDLE=y
 CONFIG_BSD_PROCESS_ACCT=y
 CONFIG_BSD_PROCESS_ACCT_V3=y
 CONFIG_LOG_BUF_SHIFT=16
diff --git a/arch/m68k/configs/bvme6000_defconfig b/arch/m68k/configs/bvme6000_defconfig
index 8b0d50e674e8488d..475130c06dcba04b 100644
--- a/arch/m68k/configs/bvme6000_defconfig
+++ b/arch/m68k/configs/bvme6000_defconfig
@@ -1,7 +1,6 @@
 CONFIG_LOCALVERSION="-bvme6000"
 CONFIG_SYSVIPC=y
 CONFIG_POSIX_MQUEUE=y
-CONFIG_FHANDLE=y
 CONFIG_BSD_PROCESS_ACCT=y
 CONFIG_BSD_PROCESS_ACCT_V3=y
 CONFIG_LOG_BUF_SHIFT=16
diff --git a/arch/m68k/configs/hp300_defconfig b/arch/m68k/configs/hp300_defconfig
index 384e988f4f649851..4339658c200f3eb8 100644
--- a/arch/m68k/configs/hp300_defconfig
+++ b/arch/m68k/configs/hp300_defconfig
@@ -1,7 +1,6 @@
 CONFIG_LOCALVERSION="-hp300"
 CONFIG_SYSVIPC=y
 CONFIG_POSIX_MQUEUE=y
-CONFIG_FHANDLE=y
 CONFIG_BSD_PROCESS_ACCT=y
 CONFIG_BSD_PROCESS_ACCT_V3=y
 CONFIG_LOG_BUF_SHIFT=16
diff --git a/arch/m68k/configs/mac_defconfig b/arch/m68k/configs/mac_defconfig
index 634d3d745d884e55..831cc8c3a2e259f6 100644
--- a/arch/m68k/configs/mac_defconfig
+++ b/arch/m68k/configs/mac_defconfig
@@ -1,7 +1,6 @@
 CONFIG_LOCALVERSION="-mac"
 CONFIG_SYSVIPC=y
 CONFIG_POSIX_MQUEUE=y
-CONFIG_FHANDLE=y
 CONFIG_BSD_PROCESS_ACCT=y
 CONFIG_BSD_PROCESS_ACCT_V3=y
 CONFIG_LOG_BUF_SHIFT=16
diff --git a/arch/m68k/configs/multi_defconfig b/arch/m68k/configs/multi_defconfig
index 952718a18f8536ae..6377afeb522bbb9a 100644
--- a/arch/m68k/configs/multi_defconfig
+++ b/arch/m68k/configs/multi_defconfig
@@ -1,7 +1,6 @@
 CONFIG_LOCALVERSION="-multi"
 CONFIG_SYSVIPC=y
 CONFIG_POSIX_MQUEUE=y
-CONFIG_FHANDLE=y
 CONFIG_BSD_PROCESS_ACCT=y
 CONFIG_BSD_PROCESS_ACCT_V3=y
 CONFIG_LOG_BUF_SHIFT=16
diff --git a/arch/m68k/configs/mvme147_defconfig b/arch/m68k/configs/mvme147_defconfig
index 9f545c82fe0e4128..4304b3d56262bc67 100644
--- a/arch/m68k/configs/mvme147_defconfig
+++ b/arch/m68k/configs/mvme147_defconfig
@@ -1,7 +1,6 @@
 CONFIG_LOCALVERSION="-mvme147"
 CONFIG_SYSVIPC=y
 CONFIG_POSIX_MQUEUE=y
-CONFIG_FHANDLE=y
 CONFIG_BSD_PROCESS_ACCT=y
 CONFIG_BSD_PROCESS_ACCT_V3=y
 CONFIG_LOG_BUF_SHIFT=16
diff --git a/arch/m68k/configs/mvme16x_defconfig b/arch/m68k/configs/mvme16x_defconfig
index 1cfcbc1f8bc99d6f..074bda4094ffd5b0 100644
--- a/arch/m68k/configs/mvme16x_defconfig
+++ b/arch/m68k/configs/mvme16x_defconfig
@@ -1,7 +1,6 @@
 CONFIG_LOCALVERSION="-mvme16x"
 CONFIG_SYSVIPC=y
 CONFIG_POSIX_MQUEUE=y
-CONFIG_FHANDLE=y
 CONFIG_BSD_PROCESS_ACCT=y
 CONFIG_BSD_PROCESS_ACCT_V3=y
 CONFIG_LOG_BUF_SHIFT=16
diff --git a/arch/m68k/configs/q40_defconfig b/arch/m68k/configs/q40_defconfig
index f4328d803a72eb20..07b9fa8d7f2ea71d 100644
--- a/arch/m68k/configs/q40_defconfig
+++ b/arch/m68k/configs/q40_defconfig
@@ -1,7 +1,6 @@
 CONFIG_LOCALVERSION="-q40"
 CONFIG_SYSVIPC=y
 CONFIG_POSIX_MQUEUE=y
-CONFIG_FHANDLE=y
 CONFIG_BSD_PROCESS_ACCT=y
 CONFIG_BSD_PROCESS_ACCT_V3=y
 CONFIG_LOG_BUF_SHIFT=16
diff --git a/arch/m68k/configs/sun3_defconfig b/arch/m68k/configs/sun3_defconfig
index b3f7000943b0981e..36e6fae02d458e2d 100644
--- a/arch/m68k/configs/sun3_defconfig
+++ b/arch/m68k/configs/sun3_defconfig
@@ -1,7 +1,6 @@
 CONFIG_LOCALVERSION="-sun3"
 CONFIG_SYSVIPC=y
 CONFIG_POSIX_MQUEUE=y
-CONFIG_FHANDLE=y
 CONFIG_BSD_PROCESS_ACCT=y
 CONFIG_BSD_PROCESS_ACCT_V3=y
 CONFIG_LOG_BUF_SHIFT=16
diff --git a/arch/m68k/configs/sun3x_defconfig b/arch/m68k/configs/sun3x_defconfig
index 537985a271896c63..903acf929511e506 100644
--- a/arch/m68k/configs/sun3x_defconfig
+++ b/arch/m68k/configs/sun3x_defconfig
@@ -1,7 +1,6 @@
 CONFIG_LOCALVERSION="-sun3x"
 CONFIG_SYSVIPC=y
 CONFIG_POSIX_MQUEUE=y
-CONFIG_FHANDLE=y
 CONFIG_BSD_PROCESS_ACCT=y
 CONFIG_BSD_PROCESS_ACCT_V3=y
 CONFIG_LOG_BUF_SHIFT=16
-- 
1.9.1
