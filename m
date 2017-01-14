From: Angelo Dureghello <angelo@sysam.it>
Subject: [PATCH v2] m68k/defconfig: amcore board defconfig tuning
Date: Sat, 14 Jan 2017 01:20:24 +0100
Message-ID: <1484353225-15974-1-git-send-email-angelo@sysam.it>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sysam.it ([5.39.81.93]:57513 "EHLO sysam.it"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750713AbdANAUb (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
        Fri, 13 Jan 2017 19:20:31 -0500
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org
Cc: gregungerer@westnet.com.au, Angelo Dureghello <angelo@sysam.it>

Changes to amcore board default config, as:
- diet to reduce kernel size
- enable sysfs gpio
- enable CONFIG_SYN_COOKIES protection

Signed-off-by: Angelo Dureghello <angelo@sysam.it>
---
 arch/m68k/configs/amcore_defconfig | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/arch/m68k/configs/amcore_defconfig b/arch/m68k/configs/amcore_defconfig
index f108dd1..131b410 100644
--- a/arch/m68k/configs/amcore_defconfig
+++ b/arch/m68k/configs/amcore_defconfig
@@ -1,19 +1,20 @@
-CONFIG_LOCALVERSION="amcore-001"
+CONFIG_LOCALVERSION="amcore-002"
 CONFIG_DEFAULT_HOSTNAME="amcore"
 CONFIG_SYSVIPC=y
 # CONFIG_FHANDLE is not set
 # CONFIG_USELIB is not set
 CONFIG_LOG_BUF_SHIFT=14
-CONFIG_NAMESPACES=y
 CONFIG_CC_OPTIMIZE_FOR_SIZE=y
 # CONFIG_AIO is not set
 # CONFIG_ADVISE_SYSCALLS is not set
 # CONFIG_MEMBARRIER is not set
 CONFIG_EMBEDDED=y
 # CONFIG_VM_EVENT_COUNTERS is not set
+# CONFIG_SLUB_DEBUG is not set
 # CONFIG_COMPAT_BRK is not set
 # CONFIG_LBDAF is not set
 # CONFIG_BLK_DEV_BSG is not set
+# CONFIG_IOSCHED_CFQ is not set
 # CONFIG_MMU is not set
 CONFIG_M5307=y
 CONFIG_AMCORE=y
@@ -27,13 +28,14 @@ CONFIG_NET=y
 CONFIG_PACKET=y
 CONFIG_UNIX=y
 CONFIG_INET=y
+CONFIG_SYN_COOKIES=y
 # CONFIG_INET_XFRM_MODE_TRANSPORT is not set
 # CONFIG_INET_XFRM_MODE_TUNNEL is not set
 # CONFIG_INET_XFRM_MODE_BEET is not set
 # CONFIG_IPV6 is not set
 # CONFIG_WIRELESS is not set
 # CONFIG_UEVENT_HELPER is not set
-CONFIG_FW_LOADER_USER_HELPER_FALLBACK=y
+# CONFIG_FW_LOADER is not set
 # CONFIG_ALLOW_DEV_COREDUMP is not set
 CONFIG_CONNECTOR=y
 CONFIG_MTD=y
@@ -53,6 +55,7 @@ CONFIG_MTD_UCLINUX=y
 CONFIG_MTD_PLATRAM=y
 CONFIG_BLK_DEV_RAM=y
 CONFIG_NETDEVICES=y
+# CONFIG_NET_VENDOR_AMAZON is not set
 # CONFIG_NET_VENDOR_ARC is not set
 # CONFIG_NET_CADENCE is not set
 # CONFIG_NET_VENDOR_BROADCOM is not set
@@ -89,14 +92,12 @@ CONFIG_I2C=y
 CONFIG_I2C_CHARDEV=y
 # CONFIG_I2C_HELPER_AUTO is not set
 CONFIG_I2C_IMX=y
-CONFIG_PPS=y
+CONFIG_GPIO_SYSFS=y
 # CONFIG_HWMON is not set
 # CONFIG_USB_SUPPORT is not set
 CONFIG_RTC_CLASS=y
 # CONFIG_RTC_SYSTOHC is not set
 CONFIG_RTC_DRV_DS1307=y
-CONFIG_EXT2_FS=y
-CONFIG_EXT2_FS_XATTR=y
 # CONFIG_FILE_LOCKING is not set
 # CONFIG_DNOTIFY is not set
 # CONFIG_INOTIFY_USER is not set
@@ -108,6 +109,7 @@ CONFIG_ROMFS_BACKED_BY_BOTH=y
 # CONFIG_NETWORK_FILESYSTEMS is not set
 CONFIG_PRINTK_TIME=y
 # CONFIG_ENABLE_WARN_DEPRECATED is not set
+# CONFIG_ENABLE_MUST_CHECK is not set
 # CONFIG_SECTION_MISMATCH_WARN_ONLY is not set
 CONFIG_PANIC_ON_OOPS=y
 # CONFIG_SCHED_DEBUG is not set
-- 
2.8.1
