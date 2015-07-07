From: Greg Ungerer <gerg@uclinux.org>
Subject: [PATCH 05/10] m68knommu: update defconfig for ColdFire m5249evb
Date: Tue,  7 Jul 2015 16:55:19 +1000
Message-ID: <1436252124-23051-6-git-send-email-gerg@uclinux.org>
References: <1436252124-23051-1-git-send-email-gerg@uclinux.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from nskntmtas05p.mx.bigpond.com ([61.9.168.149]:27151 "EHLO
	nskntmtas05p.mx.bigpond.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1755475AbbGGGyN (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 7 Jul 2015 02:54:13 -0400
In-Reply-To: <1436252124-23051-1-git-send-email-gerg@uclinux.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org
Cc: Greg Ungerer <gerg@uclinux.org>

No change to active configuration settings, updated to match current
Kconfigs only.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/configs/m5249evb_defconfig | 17 ++---------------
 1 file changed, 2 insertions(+), 15 deletions(-)

diff --git a/arch/m68k/configs/m5249evb_defconfig b/arch/m68k/configs/m5249evb_defconfig
index 0cd4b39..a782f36 100644
--- a/arch/m68k/configs/m5249evb_defconfig
+++ b/arch/m68k/configs/m5249evb_defconfig
@@ -1,10 +1,6 @@
-# CONFIG_MMU is not set
-CONFIG_EXPERIMENTAL=y
 CONFIG_LOG_BUF_SHIFT=14
-# CONFIG_CC_OPTIMIZE_FOR_SIZE is not set
 CONFIG_EXPERT=y
 # CONFIG_KALLSYMS is not set
-# CONFIG_HOTPLUG is not set
 # CONFIG_FUTEX is not set
 # CONFIG_EPOLL is not set
 # CONFIG_SIGNALFD is not set
@@ -16,10 +12,8 @@ CONFIG_EXPERT=y
 # CONFIG_BLK_DEV_BSG is not set
 # CONFIG_IOSCHED_DEADLINE is not set
 # CONFIG_IOSCHED_CFQ is not set
+# CONFIG_MMU is not set
 CONFIG_M5249=y
-CONFIG_CLOCK_SET=y
-CONFIG_CLOCK_FREQ=140000000
-CONFIG_CLOCK_DIV=2
 CONFIG_M5249C3=y
 CONFIG_RAMBASE=0x00000000
 CONFIG_RAMSIZE=0x00800000
@@ -38,23 +32,18 @@ CONFIG_INET=y
 # CONFIG_IPV6 is not set
 # CONFIG_FW_LOADER is not set
 CONFIG_MTD=y
-CONFIG_MTD_CHAR=y
 CONFIG_MTD_BLOCK=y
 CONFIG_MTD_RAM=y
 CONFIG_MTD_UCLINUX=y
 CONFIG_BLK_DEV_RAM=y
-# CONFIG_MISC_DEVICES is not set
 CONFIG_NETDEVICES=y
-CONFIG_NET_ETHERNET=y
-# CONFIG_NETDEV_1000 is not set
-# CONFIG_NETDEV_10000 is not set
 CONFIG_PPP=y
 # CONFIG_INPUT is not set
 # CONFIG_SERIO is not set
 # CONFIG_VT is not set
+# CONFIG_UNIX98_PTYS is not set
 CONFIG_SERIAL_MCF=y
 CONFIG_SERIAL_MCF_CONSOLE=y
-# CONFIG_UNIX98_PTYS is not set
 # CONFIG_HWMON is not set
 # CONFIG_USB_SUPPORT is not set
 CONFIG_EXT2_FS=y
@@ -62,7 +51,5 @@ CONFIG_EXT2_FS=y
 CONFIG_ROMFS_FS=y
 CONFIG_ROMFS_BACKED_BY_MTD=y
 # CONFIG_NETWORK_FILESYSTEMS is not set
-# CONFIG_RCU_CPU_STALL_DETECTOR is not set
 CONFIG_BOOTPARAM=y
 CONFIG_BOOTPARAM_STRING="root=/dev/mtdblock0"
-# CONFIG_CRC32 is not set
-- 
1.9.1
