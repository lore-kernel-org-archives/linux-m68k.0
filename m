From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 4/6] m68k/defconfig: Enable automounting of devtmpfs at /dev
Date: Sun, 25 Jan 2015 15:30:37 +0100
Message-ID: <1422196239-30694-5-git-send-email-geert@linux-m68k.org>
References: <1422196239-30694-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1422196239-30694-1-git-send-email-geert@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@lists.linux-m68k.org
Cc: debian-68k@lists.debian.org, Geert Uytterhoeven <geert@linux-m68k.org>

Enable CONFIG_DEVTMPFS_MOUNT, as it's useful for initrd-less kernels.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
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
index 8c2f78197e5432b6..c23afcc544580405 100644
--- a/arch/m68k/configs/amiga_defconfig
+++ b/arch/m68k/configs/amiga_defconfig
@@ -244,6 +244,7 @@ CONFIG_NET_MPLS_GSO=m
 # CONFIG_WIRELESS is not set
 # CONFIG_UEVENT_HELPER is not set
 CONFIG_DEVTMPFS=y
+CONFIG_DEVTMPFS_MOUNT=y
 # CONFIG_FIRMWARE_IN_KERNEL is not set
 CONFIG_CONNECTOR=m
 CONFIG_PARPORT=m
diff --git a/arch/m68k/configs/apollo_defconfig b/arch/m68k/configs/apollo_defconfig
index 9139ff7b3279ace0..c72fcbd11a9e6219 100644
--- a/arch/m68k/configs/apollo_defconfig
+++ b/arch/m68k/configs/apollo_defconfig
@@ -242,6 +242,7 @@ CONFIG_NET_MPLS_GSO=m
 # CONFIG_WIRELESS is not set
 # CONFIG_UEVENT_HELPER is not set
 CONFIG_DEVTMPFS=y
+CONFIG_DEVTMPFS_MOUNT=y
 # CONFIG_FIRMWARE_IN_KERNEL is not set
 CONFIG_CONNECTOR=m
 CONFIG_BLK_DEV_LOOP=y
diff --git a/arch/m68k/configs/atari_defconfig b/arch/m68k/configs/atari_defconfig
index de543dbabdf4f7a1..c53bd87bd68c3727 100644
--- a/arch/m68k/configs/atari_defconfig
+++ b/arch/m68k/configs/atari_defconfig
@@ -241,6 +241,7 @@ CONFIG_NET_MPLS_GSO=m
 # CONFIG_WIRELESS is not set
 # CONFIG_UEVENT_HELPER is not set
 CONFIG_DEVTMPFS=y
+CONFIG_DEVTMPFS_MOUNT=y
 # CONFIG_FIRMWARE_IN_KERNEL is not set
 CONFIG_CONNECTOR=m
 CONFIG_PARPORT=m
diff --git a/arch/m68k/configs/bvme6000_defconfig b/arch/m68k/configs/bvme6000_defconfig
index 7ab0a79a68c536c1..41a5a0e60c2a8efa 100644
--- a/arch/m68k/configs/bvme6000_defconfig
+++ b/arch/m68k/configs/bvme6000_defconfig
@@ -240,6 +240,7 @@ CONFIG_NET_MPLS_GSO=m
 # CONFIG_WIRELESS is not set
 # CONFIG_UEVENT_HELPER is not set
 CONFIG_DEVTMPFS=y
+CONFIG_DEVTMPFS_MOUNT=y
 # CONFIG_FIRMWARE_IN_KERNEL is not set
 CONFIG_CONNECTOR=m
 CONFIG_BLK_DEV_LOOP=y
diff --git a/arch/m68k/configs/hp300_defconfig b/arch/m68k/configs/hp300_defconfig
index 263d1d55e5ba54e3..f36a1ac8e5c080ea 100644
--- a/arch/m68k/configs/hp300_defconfig
+++ b/arch/m68k/configs/hp300_defconfig
@@ -242,6 +242,7 @@ CONFIG_NET_MPLS_GSO=m
 # CONFIG_WIRELESS is not set
 # CONFIG_UEVENT_HELPER is not set
 CONFIG_DEVTMPFS=y
+CONFIG_DEVTMPFS_MOUNT=y
 # CONFIG_FIRMWARE_IN_KERNEL is not set
 CONFIG_CONNECTOR=m
 CONFIG_BLK_DEV_LOOP=y
diff --git a/arch/m68k/configs/mac_defconfig b/arch/m68k/configs/mac_defconfig
index 1d224d086bf00f87..b9479aa87f289a0e 100644
--- a/arch/m68k/configs/mac_defconfig
+++ b/arch/m68k/configs/mac_defconfig
@@ -244,6 +244,7 @@ CONFIG_NET_MPLS_GSO=m
 # CONFIG_WIRELESS is not set
 # CONFIG_UEVENT_HELPER is not set
 CONFIG_DEVTMPFS=y
+CONFIG_DEVTMPFS_MOUNT=y
 # CONFIG_FIRMWARE_IN_KERNEL is not set
 CONFIG_CONNECTOR=m
 CONFIG_BLK_DEV_SWIM=m
diff --git a/arch/m68k/configs/multi_defconfig b/arch/m68k/configs/multi_defconfig
index 03070f7b8634bece..a0b539c99ad24a57 100644
--- a/arch/m68k/configs/multi_defconfig
+++ b/arch/m68k/configs/multi_defconfig
@@ -253,6 +253,7 @@ CONFIG_NET_MPLS_GSO=m
 # CONFIG_WIRELESS is not set
 # CONFIG_UEVENT_HELPER is not set
 CONFIG_DEVTMPFS=y
+CONFIG_DEVTMPFS_MOUNT=y
 # CONFIG_FIRMWARE_IN_KERNEL is not set
 CONFIG_CONNECTOR=m
 CONFIG_PARPORT=m
diff --git a/arch/m68k/configs/mvme147_defconfig b/arch/m68k/configs/mvme147_defconfig
index 0f19164df62e8de0..ab657e2a01998b89 100644
--- a/arch/m68k/configs/mvme147_defconfig
+++ b/arch/m68k/configs/mvme147_defconfig
@@ -239,6 +239,7 @@ CONFIG_NET_MPLS_GSO=m
 # CONFIG_WIRELESS is not set
 # CONFIG_UEVENT_HELPER is not set
 CONFIG_DEVTMPFS=y
+CONFIG_DEVTMPFS_MOUNT=y
 # CONFIG_FIRMWARE_IN_KERNEL is not set
 CONFIG_CONNECTOR=m
 CONFIG_BLK_DEV_LOOP=y
diff --git a/arch/m68k/configs/mvme16x_defconfig b/arch/m68k/configs/mvme16x_defconfig
index 70292d6abfb708d2..7d232282e5517ae1 100644
--- a/arch/m68k/configs/mvme16x_defconfig
+++ b/arch/m68k/configs/mvme16x_defconfig
@@ -240,6 +240,7 @@ CONFIG_NET_MPLS_GSO=m
 # CONFIG_WIRELESS is not set
 # CONFIG_UEVENT_HELPER is not set
 CONFIG_DEVTMPFS=y
+CONFIG_DEVTMPFS_MOUNT=y
 # CONFIG_FIRMWARE_IN_KERNEL is not set
 CONFIG_CONNECTOR=m
 CONFIG_BLK_DEV_LOOP=y
diff --git a/arch/m68k/configs/q40_defconfig b/arch/m68k/configs/q40_defconfig
index b60ccfb59bb0123b..4aeedf893913a299 100644
--- a/arch/m68k/configs/q40_defconfig
+++ b/arch/m68k/configs/q40_defconfig
@@ -240,6 +240,7 @@ CONFIG_NET_MPLS_GSO=m
 # CONFIG_WIRELESS is not set
 # CONFIG_UEVENT_HELPER is not set
 CONFIG_DEVTMPFS=y
+CONFIG_DEVTMPFS_MOUNT=y
 # CONFIG_FIRMWARE_IN_KERNEL is not set
 CONFIG_CONNECTOR=m
 CONFIG_PARPORT=m
diff --git a/arch/m68k/configs/sun3_defconfig b/arch/m68k/configs/sun3_defconfig
index 014672ab72916fa7..cfe2f268a6be7b89 100644
--- a/arch/m68k/configs/sun3_defconfig
+++ b/arch/m68k/configs/sun3_defconfig
@@ -237,6 +237,7 @@ CONFIG_NET_MPLS_GSO=m
 # CONFIG_WIRELESS is not set
 # CONFIG_UEVENT_HELPER is not set
 CONFIG_DEVTMPFS=y
+CONFIG_DEVTMPFS_MOUNT=y
 # CONFIG_FIRMWARE_IN_KERNEL is not set
 CONFIG_CONNECTOR=m
 CONFIG_BLK_DEV_LOOP=y
diff --git a/arch/m68k/configs/sun3x_defconfig b/arch/m68k/configs/sun3x_defconfig
index 7f2fe78bc881d219..b867fd133bab6d06 100644
--- a/arch/m68k/configs/sun3x_defconfig
+++ b/arch/m68k/configs/sun3x_defconfig
@@ -237,6 +237,7 @@ CONFIG_NET_MPLS_GSO=m
 # CONFIG_WIRELESS is not set
 # CONFIG_UEVENT_HELPER is not set
 CONFIG_DEVTMPFS=y
+CONFIG_DEVTMPFS_MOUNT=y
 # CONFIG_FIRMWARE_IN_KERNEL is not set
 CONFIG_CONNECTOR=m
 CONFIG_BLK_DEV_LOOP=y
-- 
1.9.1
