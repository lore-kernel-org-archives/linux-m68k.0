From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] m68k/defconfig: Update defconfigs for v4.7-rc1
Date: Sun, 29 May 2016 20:09:47 +0200
Message-ID: <1464545387-5364-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@lists.linux-m68k.org
Cc: Geert Uytterhoeven <geert@linux-m68k.org>

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 arch/m68k/configs/amiga_defconfig    | 3 +++
 arch/m68k/configs/apollo_defconfig   | 3 +++
 arch/m68k/configs/atari_defconfig    | 3 +++
 arch/m68k/configs/bvme6000_defconfig | 3 +++
 arch/m68k/configs/hp300_defconfig    | 3 +++
 arch/m68k/configs/mac_defconfig      | 3 +++
 arch/m68k/configs/multi_defconfig    | 3 +++
 arch/m68k/configs/mvme147_defconfig  | 3 +++
 arch/m68k/configs/mvme16x_defconfig  | 3 +++
 arch/m68k/configs/q40_defconfig      | 3 +++
 arch/m68k/configs/sun3_defconfig     | 3 +++
 arch/m68k/configs/sun3x_defconfig    | 3 +++
 12 files changed, 36 insertions(+)

diff --git a/arch/m68k/configs/amiga_defconfig b/arch/m68k/configs/amiga_defconfig
index 3ee6976f60885e5b..2a8f5ee65f763ba5 100644
--- a/arch/m68k/configs/amiga_defconfig
+++ b/arch/m68k/configs/amiga_defconfig
@@ -9,6 +9,7 @@ CONFIG_LOG_BUF_SHIFT=16
 # CONFIG_PID_NS is not set
 # CONFIG_NET_NS is not set
 CONFIG_BLK_DEV_INITRD=y
+CONFIG_CC_OPTIMIZE_FOR_SIZE=y
 CONFIG_USERFAULTFD=y
 CONFIG_SLAB=y
 CONFIG_MODULES=y
@@ -359,6 +360,7 @@ CONFIG_MACVTAP=m
 CONFIG_IPVLAN=m
 CONFIG_VXLAN=m
 CONFIG_GENEVE=m
+CONFIG_GTP=m
 CONFIG_MACSEC=m
 CONFIG_NETCONSOLE=m
 CONFIG_NETCONSOLE_DYNAMIC=y
@@ -554,6 +556,7 @@ CONFIG_TEST_KSTRTOX=m
 CONFIG_TEST_PRINTF=m
 CONFIG_TEST_BITMAP=m
 CONFIG_TEST_RHASHTABLE=m
+CONFIG_TEST_HASH=m
 CONFIG_TEST_LKM=m
 CONFIG_TEST_USER_COPY=m
 CONFIG_TEST_BPF=m
diff --git a/arch/m68k/configs/apollo_defconfig b/arch/m68k/configs/apollo_defconfig
index e96787ffcbced33f..a8e1537b03a9e45e 100644
--- a/arch/m68k/configs/apollo_defconfig
+++ b/arch/m68k/configs/apollo_defconfig
@@ -9,6 +9,7 @@ CONFIG_LOG_BUF_SHIFT=16
 # CONFIG_PID_NS is not set
 # CONFIG_NET_NS is not set
 CONFIG_BLK_DEV_INITRD=y
+CONFIG_CC_OPTIMIZE_FOR_SIZE=y
 CONFIG_USERFAULTFD=y
 CONFIG_SLAB=y
 CONFIG_MODULES=y
@@ -341,6 +342,7 @@ CONFIG_MACVTAP=m
 CONFIG_IPVLAN=m
 CONFIG_VXLAN=m
 CONFIG_GENEVE=m
+CONFIG_GTP=m
 CONFIG_MACSEC=m
 CONFIG_NETCONSOLE=m
 CONFIG_NETCONSOLE_DYNAMIC=y
@@ -513,6 +515,7 @@ CONFIG_TEST_KSTRTOX=m
 CONFIG_TEST_PRINTF=m
 CONFIG_TEST_BITMAP=m
 CONFIG_TEST_RHASHTABLE=m
+CONFIG_TEST_HASH=m
 CONFIG_TEST_LKM=m
 CONFIG_TEST_USER_COPY=m
 CONFIG_TEST_BPF=m
diff --git a/arch/m68k/configs/atari_defconfig b/arch/m68k/configs/atari_defconfig
index e68adc7806fea2e7..8d85823f704d598f 100644
--- a/arch/m68k/configs/atari_defconfig
+++ b/arch/m68k/configs/atari_defconfig
@@ -9,6 +9,7 @@ CONFIG_LOG_BUF_SHIFT=16
 # CONFIG_PID_NS is not set
 # CONFIG_NET_NS is not set
 CONFIG_BLK_DEV_INITRD=y
+CONFIG_CC_OPTIMIZE_FOR_SIZE=y
 CONFIG_USERFAULTFD=y
 CONFIG_SLAB=y
 CONFIG_MODULES=y
@@ -350,6 +351,7 @@ CONFIG_MACVTAP=m
 CONFIG_IPVLAN=m
 CONFIG_VXLAN=m
 CONFIG_GENEVE=m
+CONFIG_GTP=m
 CONFIG_MACSEC=m
 CONFIG_NETCONSOLE=m
 CONFIG_NETCONSOLE_DYNAMIC=y
@@ -541,6 +543,7 @@ CONFIG_TEST_KSTRTOX=m
 CONFIG_TEST_PRINTF=m
 CONFIG_TEST_BITMAP=m
 CONFIG_TEST_RHASHTABLE=m
+CONFIG_TEST_HASH=m
 CONFIG_TEST_LKM=m
 CONFIG_TEST_USER_COPY=m
 CONFIG_TEST_BPF=m
diff --git a/arch/m68k/configs/bvme6000_defconfig b/arch/m68k/configs/bvme6000_defconfig
index 475130c06dcba04b..09a0a9696c0341a1 100644
--- a/arch/m68k/configs/bvme6000_defconfig
+++ b/arch/m68k/configs/bvme6000_defconfig
@@ -9,6 +9,7 @@ CONFIG_LOG_BUF_SHIFT=16
 # CONFIG_PID_NS is not set
 # CONFIG_NET_NS is not set
 CONFIG_BLK_DEV_INITRD=y
+CONFIG_CC_OPTIMIZE_FOR_SIZE=y
 CONFIG_USERFAULTFD=y
 CONFIG_SLAB=y
 CONFIG_MODULES=y
@@ -340,6 +341,7 @@ CONFIG_MACVTAP=m
 CONFIG_IPVLAN=m
 CONFIG_VXLAN=m
 CONFIG_GENEVE=m
+CONFIG_GTP=m
 CONFIG_MACSEC=m
 CONFIG_NETCONSOLE=m
 CONFIG_NETCONSOLE_DYNAMIC=y
@@ -505,6 +507,7 @@ CONFIG_TEST_KSTRTOX=m
 CONFIG_TEST_PRINTF=m
 CONFIG_TEST_BITMAP=m
 CONFIG_TEST_RHASHTABLE=m
+CONFIG_TEST_HASH=m
 CONFIG_TEST_LKM=m
 CONFIG_TEST_USER_COPY=m
 CONFIG_TEST_BPF=m
diff --git a/arch/m68k/configs/hp300_defconfig b/arch/m68k/configs/hp300_defconfig
index 4339658c200f3eb8..84570670e47aad6f 100644
--- a/arch/m68k/configs/hp300_defconfig
+++ b/arch/m68k/configs/hp300_defconfig
@@ -9,6 +9,7 @@ CONFIG_LOG_BUF_SHIFT=16
 # CONFIG_PID_NS is not set
 # CONFIG_NET_NS is not set
 CONFIG_BLK_DEV_INITRD=y
+CONFIG_CC_OPTIMIZE_FOR_SIZE=y
 CONFIG_USERFAULTFD=y
 CONFIG_SLAB=y
 CONFIG_MODULES=y
@@ -341,6 +342,7 @@ CONFIG_MACVTAP=m
 CONFIG_IPVLAN=m
 CONFIG_VXLAN=m
 CONFIG_GENEVE=m
+CONFIG_GTP=m
 CONFIG_MACSEC=m
 CONFIG_NETCONSOLE=m
 CONFIG_NETCONSOLE_DYNAMIC=y
@@ -515,6 +517,7 @@ CONFIG_TEST_KSTRTOX=m
 CONFIG_TEST_PRINTF=m
 CONFIG_TEST_BITMAP=m
 CONFIG_TEST_RHASHTABLE=m
+CONFIG_TEST_HASH=m
 CONFIG_TEST_LKM=m
 CONFIG_TEST_USER_COPY=m
 CONFIG_TEST_BPF=m
diff --git a/arch/m68k/configs/mac_defconfig b/arch/m68k/configs/mac_defconfig
index 831cc8c3a2e259f6..2c70dd21a14a1941 100644
--- a/arch/m68k/configs/mac_defconfig
+++ b/arch/m68k/configs/mac_defconfig
@@ -9,6 +9,7 @@ CONFIG_LOG_BUF_SHIFT=16
 # CONFIG_PID_NS is not set
 # CONFIG_NET_NS is not set
 CONFIG_BLK_DEV_INITRD=y
+CONFIG_CC_OPTIMIZE_FOR_SIZE=y
 CONFIG_USERFAULTFD=y
 CONFIG_SLAB=y
 CONFIG_MODULES=y
@@ -357,6 +358,7 @@ CONFIG_MACVTAP=m
 CONFIG_IPVLAN=m
 CONFIG_VXLAN=m
 CONFIG_GENEVE=m
+CONFIG_GTP=m
 CONFIG_MACSEC=m
 CONFIG_NETCONSOLE=m
 CONFIG_NETCONSOLE_DYNAMIC=y
@@ -537,6 +539,7 @@ CONFIG_TEST_KSTRTOX=m
 CONFIG_TEST_PRINTF=m
 CONFIG_TEST_BITMAP=m
 CONFIG_TEST_RHASHTABLE=m
+CONFIG_TEST_HASH=m
 CONFIG_TEST_LKM=m
 CONFIG_TEST_USER_COPY=m
 CONFIG_TEST_BPF=m
diff --git a/arch/m68k/configs/multi_defconfig b/arch/m68k/configs/multi_defconfig
index 6377afeb522bbb9a..63764afbacbd0690 100644
--- a/arch/m68k/configs/multi_defconfig
+++ b/arch/m68k/configs/multi_defconfig
@@ -9,6 +9,7 @@ CONFIG_LOG_BUF_SHIFT=16
 # CONFIG_PID_NS is not set
 # CONFIG_NET_NS is not set
 CONFIG_BLK_DEV_INITRD=y
+CONFIG_CC_OPTIMIZE_FOR_SIZE=y
 CONFIG_USERFAULTFD=y
 CONFIG_SLAB=y
 CONFIG_MODULES=y
@@ -390,6 +391,7 @@ CONFIG_MACVTAP=m
 CONFIG_IPVLAN=m
 CONFIG_VXLAN=m
 CONFIG_GENEVE=m
+CONFIG_GTP=m
 CONFIG_MACSEC=m
 CONFIG_NETCONSOLE=m
 CONFIG_NETCONSOLE_DYNAMIC=y
@@ -617,6 +619,7 @@ CONFIG_TEST_KSTRTOX=m
 CONFIG_TEST_PRINTF=m
 CONFIG_TEST_BITMAP=m
 CONFIG_TEST_RHASHTABLE=m
+CONFIG_TEST_HASH=m
 CONFIG_TEST_LKM=m
 CONFIG_TEST_USER_COPY=m
 CONFIG_TEST_BPF=m
diff --git a/arch/m68k/configs/mvme147_defconfig b/arch/m68k/configs/mvme147_defconfig
index 4304b3d56262bc67..bc03811152018e36 100644
--- a/arch/m68k/configs/mvme147_defconfig
+++ b/arch/m68k/configs/mvme147_defconfig
@@ -9,6 +9,7 @@ CONFIG_LOG_BUF_SHIFT=16
 # CONFIG_PID_NS is not set
 # CONFIG_NET_NS is not set
 CONFIG_BLK_DEV_INITRD=y
+CONFIG_CC_OPTIMIZE_FOR_SIZE=y
 CONFIG_USERFAULTFD=y
 CONFIG_SLAB=y
 CONFIG_MODULES=y
@@ -339,6 +340,7 @@ CONFIG_MACVTAP=m
 CONFIG_IPVLAN=m
 CONFIG_VXLAN=m
 CONFIG_GENEVE=m
+CONFIG_GTP=m
 CONFIG_MACSEC=m
 CONFIG_NETCONSOLE=m
 CONFIG_NETCONSOLE_DYNAMIC=y
@@ -505,6 +507,7 @@ CONFIG_TEST_KSTRTOX=m
 CONFIG_TEST_PRINTF=m
 CONFIG_TEST_BITMAP=m
 CONFIG_TEST_RHASHTABLE=m
+CONFIG_TEST_HASH=m
 CONFIG_TEST_LKM=m
 CONFIG_TEST_USER_COPY=m
 CONFIG_TEST_BPF=m
diff --git a/arch/m68k/configs/mvme16x_defconfig b/arch/m68k/configs/mvme16x_defconfig
index 074bda4094ffd5b0..41834a7a75e21b72 100644
--- a/arch/m68k/configs/mvme16x_defconfig
+++ b/arch/m68k/configs/mvme16x_defconfig
@@ -9,6 +9,7 @@ CONFIG_LOG_BUF_SHIFT=16
 # CONFIG_PID_NS is not set
 # CONFIG_NET_NS is not set
 CONFIG_BLK_DEV_INITRD=y
+CONFIG_CC_OPTIMIZE_FOR_SIZE=y
 CONFIG_USERFAULTFD=y
 CONFIG_SLAB=y
 CONFIG_MODULES=y
@@ -340,6 +341,7 @@ CONFIG_MACVTAP=m
 CONFIG_IPVLAN=m
 CONFIG_VXLAN=m
 CONFIG_GENEVE=m
+CONFIG_GTP=m
 CONFIG_MACSEC=m
 CONFIG_NETCONSOLE=m
 CONFIG_NETCONSOLE_DYNAMIC=y
@@ -505,6 +507,7 @@ CONFIG_TEST_KSTRTOX=m
 CONFIG_TEST_PRINTF=m
 CONFIG_TEST_BITMAP=m
 CONFIG_TEST_RHASHTABLE=m
+CONFIG_TEST_HASH=m
 CONFIG_TEST_LKM=m
 CONFIG_TEST_USER_COPY=m
 CONFIG_TEST_BPF=m
diff --git a/arch/m68k/configs/q40_defconfig b/arch/m68k/configs/q40_defconfig
index 07b9fa8d7f2ea71d..91f80c651a9ffdcf 100644
--- a/arch/m68k/configs/q40_defconfig
+++ b/arch/m68k/configs/q40_defconfig
@@ -9,6 +9,7 @@ CONFIG_LOG_BUF_SHIFT=16
 # CONFIG_PID_NS is not set
 # CONFIG_NET_NS is not set
 CONFIG_BLK_DEV_INITRD=y
+CONFIG_CC_OPTIMIZE_FOR_SIZE=y
 CONFIG_USERFAULTFD=y
 CONFIG_SLAB=y
 CONFIG_MODULES=y
@@ -346,6 +347,7 @@ CONFIG_MACVTAP=m
 CONFIG_IPVLAN=m
 CONFIG_VXLAN=m
 CONFIG_GENEVE=m
+CONFIG_GTP=m
 CONFIG_MACSEC=m
 CONFIG_NETCONSOLE=m
 CONFIG_NETCONSOLE_DYNAMIC=y
@@ -528,6 +530,7 @@ CONFIG_TEST_KSTRTOX=m
 CONFIG_TEST_PRINTF=m
 CONFIG_TEST_BITMAP=m
 CONFIG_TEST_RHASHTABLE=m
+CONFIG_TEST_HASH=m
 CONFIG_TEST_LKM=m
 CONFIG_TEST_USER_COPY=m
 CONFIG_TEST_BPF=m
diff --git a/arch/m68k/configs/sun3_defconfig b/arch/m68k/configs/sun3_defconfig
index 36e6fae02d458e2d..7c9ca70af640a331 100644
--- a/arch/m68k/configs/sun3_defconfig
+++ b/arch/m68k/configs/sun3_defconfig
@@ -9,6 +9,7 @@ CONFIG_LOG_BUF_SHIFT=16
 # CONFIG_PID_NS is not set
 # CONFIG_NET_NS is not set
 CONFIG_BLK_DEV_INITRD=y
+CONFIG_CC_OPTIMIZE_FOR_SIZE=y
 CONFIG_USERFAULTFD=y
 CONFIG_SLAB=y
 CONFIG_MODULES=y
@@ -337,6 +338,7 @@ CONFIG_MACVTAP=m
 CONFIG_IPVLAN=m
 CONFIG_VXLAN=m
 CONFIG_GENEVE=m
+CONFIG_GTP=m
 CONFIG_MACSEC=m
 CONFIG_NETCONSOLE=m
 CONFIG_NETCONSOLE_DYNAMIC=y
@@ -507,6 +509,7 @@ CONFIG_TEST_KSTRTOX=m
 CONFIG_TEST_PRINTF=m
 CONFIG_TEST_BITMAP=m
 CONFIG_TEST_RHASHTABLE=m
+CONFIG_TEST_HASH=m
 CONFIG_TEST_LKM=m
 CONFIG_TEST_USER_COPY=m
 CONFIG_TEST_BPF=m
diff --git a/arch/m68k/configs/sun3x_defconfig b/arch/m68k/configs/sun3x_defconfig
index 903acf929511e506..95147e158282add6 100644
--- a/arch/m68k/configs/sun3x_defconfig
+++ b/arch/m68k/configs/sun3x_defconfig
@@ -9,6 +9,7 @@ CONFIG_LOG_BUF_SHIFT=16
 # CONFIG_PID_NS is not set
 # CONFIG_NET_NS is not set
 CONFIG_BLK_DEV_INITRD=y
+CONFIG_CC_OPTIMIZE_FOR_SIZE=y
 CONFIG_USERFAULTFD=y
 CONFIG_SLAB=y
 CONFIG_MODULES=y
@@ -337,6 +338,7 @@ CONFIG_MACVTAP=m
 CONFIG_IPVLAN=m
 CONFIG_VXLAN=m
 CONFIG_GENEVE=m
+CONFIG_GTP=m
 CONFIG_MACSEC=m
 CONFIG_NETCONSOLE=m
 CONFIG_NETCONSOLE_DYNAMIC=y
@@ -507,6 +509,7 @@ CONFIG_TEST_KSTRTOX=m
 CONFIG_TEST_PRINTF=m
 CONFIG_TEST_BITMAP=m
 CONFIG_TEST_RHASHTABLE=m
+CONFIG_TEST_HASH=m
 CONFIG_TEST_LKM=m
 CONFIG_TEST_USER_COPY=m
 CONFIG_TEST_BPF=m
-- 
1.9.1
