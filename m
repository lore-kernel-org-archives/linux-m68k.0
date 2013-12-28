From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] m68k/defconfig: Disable /sbin/hotplug fork-bomb by default
Date: Sat, 28 Dec 2013 20:15:45 +0100
Message-ID: <1388258145-26888-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@lists.linux-m68k.org
Cc: Geert Uytterhoeven <geert@linux-m68k.org>

Cfr. commit 7934779a69f1184f29d786b89e77dd14519bd226 ("Driver-Core: disable
/sbin/hotplug by default").

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 arch/m68k/configs/amiga_defconfig    |    1 -
 arch/m68k/configs/apollo_defconfig   |    1 -
 arch/m68k/configs/atari_defconfig    |    1 -
 arch/m68k/configs/bvme6000_defconfig |    1 -
 arch/m68k/configs/hp300_defconfig    |    1 -
 arch/m68k/configs/mac_defconfig      |    1 -
 arch/m68k/configs/multi_defconfig    |    1 -
 arch/m68k/configs/mvme147_defconfig  |    1 -
 arch/m68k/configs/mvme16x_defconfig  |    1 -
 arch/m68k/configs/q40_defconfig      |    1 -
 arch/m68k/configs/sun3_defconfig     |    1 -
 arch/m68k/configs/sun3x_defconfig    |    1 -
 12 files changed, 12 deletions(-)

diff --git a/arch/m68k/configs/amiga_defconfig b/arch/m68k/configs/amiga_defconfig
index d99ac22759b2..559ff3af8ff7 100644
--- a/arch/m68k/configs/amiga_defconfig
+++ b/arch/m68k/configs/amiga_defconfig
@@ -227,7 +227,6 @@ CONFIG_BATMAN_ADV_NC=y
 CONFIG_NETLINK_DIAG=m
 CONFIG_NET_MPLS_GSO=m
 # CONFIG_WIRELESS is not set
-CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
 CONFIG_DEVTMPFS=y
 # CONFIG_FIRMWARE_IN_KERNEL is not set
 # CONFIG_FW_LOADER_USER_HELPER is not set
diff --git a/arch/m68k/configs/apollo_defconfig b/arch/m68k/configs/apollo_defconfig
index d486413ed25f..cb1f55df69b6 100644
--- a/arch/m68k/configs/apollo_defconfig
+++ b/arch/m68k/configs/apollo_defconfig
@@ -225,7 +225,6 @@ CONFIG_BATMAN_ADV_NC=y
 CONFIG_NETLINK_DIAG=m
 CONFIG_NET_MPLS_GSO=m
 # CONFIG_WIRELESS is not set
-CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
 CONFIG_DEVTMPFS=y
 # CONFIG_FIRMWARE_IN_KERNEL is not set
 # CONFIG_FW_LOADER_USER_HELPER is not set
diff --git a/arch/m68k/configs/atari_defconfig b/arch/m68k/configs/atari_defconfig
index 7a15fc001769..b6a86b8f1bf3 100644
--- a/arch/m68k/configs/atari_defconfig
+++ b/arch/m68k/configs/atari_defconfig
@@ -225,7 +225,6 @@ CONFIG_BATMAN_ADV_NC=y
 CONFIG_NETLINK_DIAG=m
 CONFIG_NET_MPLS_GSO=m
 # CONFIG_WIRELESS is not set
-CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
 CONFIG_DEVTMPFS=y
 # CONFIG_FIRMWARE_IN_KERNEL is not set
 # CONFIG_FW_LOADER_USER_HELPER is not set
diff --git a/arch/m68k/configs/bvme6000_defconfig b/arch/m68k/configs/bvme6000_defconfig
index f77b1b6520b3..4aa4f45e52a8 100644
--- a/arch/m68k/configs/bvme6000_defconfig
+++ b/arch/m68k/configs/bvme6000_defconfig
@@ -223,7 +223,6 @@ CONFIG_BATMAN_ADV_NC=y
 CONFIG_NETLINK_DIAG=m
 CONFIG_NET_MPLS_GSO=m
 # CONFIG_WIRELESS is not set
-CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
 CONFIG_DEVTMPFS=y
 # CONFIG_FIRMWARE_IN_KERNEL is not set
 # CONFIG_FW_LOADER_USER_HELPER is not set
diff --git a/arch/m68k/configs/hp300_defconfig b/arch/m68k/configs/hp300_defconfig
index d53b06bd0298..7cd9d9f456fb 100644
--- a/arch/m68k/configs/hp300_defconfig
+++ b/arch/m68k/configs/hp300_defconfig
@@ -225,7 +225,6 @@ CONFIG_BATMAN_ADV_NC=y
 CONFIG_NETLINK_DIAG=m
 CONFIG_NET_MPLS_GSO=m
 # CONFIG_WIRELESS is not set
-CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
 CONFIG_DEVTMPFS=y
 # CONFIG_FIRMWARE_IN_KERNEL is not set
 # CONFIG_FW_LOADER_USER_HELPER is not set
diff --git a/arch/m68k/configs/mac_defconfig b/arch/m68k/configs/mac_defconfig
index 6b19b5e7e65e..31f5bd061d14 100644
--- a/arch/m68k/configs/mac_defconfig
+++ b/arch/m68k/configs/mac_defconfig
@@ -227,7 +227,6 @@ CONFIG_BATMAN_ADV_NC=y
 CONFIG_NETLINK_DIAG=m
 CONFIG_NET_MPLS_GSO=m
 # CONFIG_WIRELESS is not set
-CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
 CONFIG_DEVTMPFS=y
 # CONFIG_FIRMWARE_IN_KERNEL is not set
 # CONFIG_FW_LOADER_USER_HELPER is not set
diff --git a/arch/m68k/configs/multi_defconfig b/arch/m68k/configs/multi_defconfig
index 3194afb2fc06..975c1a036036 100644
--- a/arch/m68k/configs/multi_defconfig
+++ b/arch/m68k/configs/multi_defconfig
@@ -237,7 +237,6 @@ CONFIG_BATMAN_ADV_NC=y
 CONFIG_NETLINK_DIAG=m
 CONFIG_NET_MPLS_GSO=m
 # CONFIG_WIRELESS is not set
-CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
 CONFIG_DEVTMPFS=y
 # CONFIG_FIRMWARE_IN_KERNEL is not set
 # CONFIG_FW_LOADER_USER_HELPER is not set
diff --git a/arch/m68k/configs/mvme147_defconfig b/arch/m68k/configs/mvme147_defconfig
index 224e21c788be..02cdbac5565e 100644
--- a/arch/m68k/configs/mvme147_defconfig
+++ b/arch/m68k/configs/mvme147_defconfig
@@ -222,7 +222,6 @@ CONFIG_BATMAN_ADV_NC=y
 CONFIG_NETLINK_DIAG=m
 CONFIG_NET_MPLS_GSO=m
 # CONFIG_WIRELESS is not set
-CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
 CONFIG_DEVTMPFS=y
 # CONFIG_FIRMWARE_IN_KERNEL is not set
 # CONFIG_FW_LOADER_USER_HELPER is not set
diff --git a/arch/m68k/configs/mvme16x_defconfig b/arch/m68k/configs/mvme16x_defconfig
index 23e5ebd81cdc..05a990a9dbd4 100644
--- a/arch/m68k/configs/mvme16x_defconfig
+++ b/arch/m68k/configs/mvme16x_defconfig
@@ -223,7 +223,6 @@ CONFIG_BATMAN_ADV_NC=y
 CONFIG_NETLINK_DIAG=m
 CONFIG_NET_MPLS_GSO=m
 # CONFIG_WIRELESS is not set
-CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
 CONFIG_DEVTMPFS=y
 # CONFIG_FIRMWARE_IN_KERNEL is not set
 # CONFIG_FW_LOADER_USER_HELPER is not set
diff --git a/arch/m68k/configs/q40_defconfig b/arch/m68k/configs/q40_defconfig
index bb0d3bb3dd7e..568e2a98f976 100644
--- a/arch/m68k/configs/q40_defconfig
+++ b/arch/m68k/configs/q40_defconfig
@@ -223,7 +223,6 @@ CONFIG_BATMAN_ADV_NC=y
 CONFIG_NETLINK_DIAG=m
 CONFIG_NET_MPLS_GSO=m
 # CONFIG_WIRELESS is not set
-CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
 CONFIG_DEVTMPFS=y
 # CONFIG_FIRMWARE_IN_KERNEL is not set
 # CONFIG_FW_LOADER_USER_HELPER is not set
diff --git a/arch/m68k/configs/sun3_defconfig b/arch/m68k/configs/sun3_defconfig
index 7e5915ceeb8d..60b0aeac5742 100644
--- a/arch/m68k/configs/sun3_defconfig
+++ b/arch/m68k/configs/sun3_defconfig
@@ -220,7 +220,6 @@ CONFIG_BATMAN_ADV_NC=y
 CONFIG_NETLINK_DIAG=m
 CONFIG_NET_MPLS_GSO=m
 # CONFIG_WIRELESS is not set
-CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
 CONFIG_DEVTMPFS=y
 # CONFIG_FIRMWARE_IN_KERNEL is not set
 # CONFIG_FW_LOADER_USER_HELPER is not set
diff --git a/arch/m68k/configs/sun3x_defconfig b/arch/m68k/configs/sun3x_defconfig
index 8313075d56dd..21bda331eebb 100644
--- a/arch/m68k/configs/sun3x_defconfig
+++ b/arch/m68k/configs/sun3x_defconfig
@@ -220,7 +220,6 @@ CONFIG_BATMAN_ADV_NC=y
 CONFIG_NETLINK_DIAG=m
 CONFIG_NET_MPLS_GSO=m
 # CONFIG_WIRELESS is not set
-CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
 CONFIG_DEVTMPFS=y
 # CONFIG_FIRMWARE_IN_KERNEL is not set
 # CONFIG_FW_LOADER_USER_HELPER is not set
-- 
1.7.9.5
