From: Greg Ungerer <gerg@uclinux.org>
Subject: [PATCH 10/10] m68knommu: update defconfig for ColdFire m5475evb
Date: Tue,  7 Jul 2015 16:55:24 +1000
Message-ID: <1436252124-23051-11-git-send-email-gerg@uclinux.org>
References: <1436252124-23051-1-git-send-email-gerg@uclinux.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from nskntmtas01p.mx.bigpond.com ([61.9.168.137]:36350 "EHLO
	nskntmtas01p.mx.bigpond.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1755556AbbGGGyP (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 7 Jul 2015 02:54:15 -0400
In-Reply-To: <1436252124-23051-1-git-send-email-gerg@uclinux.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org
Cc: Greg Ungerer <gerg@uclinux.org>

No change to active configuration settings, updated to match current
Kconfigs only.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/configs/m5475evb_defconfig | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/arch/m68k/configs/m5475evb_defconfig b/arch/m68k/configs/m5475evb_defconfig
index c5018a6..78665b5 100644
--- a/arch/m68k/configs/m5475evb_defconfig
+++ b/arch/m68k/configs/m5475evb_defconfig
@@ -1,11 +1,7 @@
-CONFIG_EXPERIMENTAL=y
 # CONFIG_SWAP is not set
 CONFIG_LOG_BUF_SHIFT=14
-CONFIG_SYSFS_DEPRECATED=y
-CONFIG_SYSFS_DEPRECATED_V2=y
 CONFIG_SYSCTL_SYSCALL=y
 # CONFIG_KALLSYMS is not set
-# CONFIG_HOTPLUG is not set
 # CONFIG_FUTEX is not set
 # CONFIG_EPOLL is not set
 # CONFIG_SIGNALFD is not set
@@ -20,9 +16,6 @@ CONFIG_MODULES=y
 # CONFIG_IOSCHED_DEADLINE is not set
 # CONFIG_IOSCHED_CFQ is not set
 CONFIG_COLDFIRE=y
-CONFIG_M547x=y
-CONFIG_CLOCK_SET=y
-CONFIG_CLOCK_FREQ=266000000
 # CONFIG_4KSTACKS is not set
 CONFIG_RAMBASE=0x0
 CONFIG_RAMSIZE=0x2000000
@@ -32,7 +25,6 @@ CONFIG_KERNELBASE=0x20000
 # CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
 # CONFIG_FW_LOADER is not set
 CONFIG_MTD=y
-CONFIG_MTD_CHAR=y
 CONFIG_MTD_BLOCK=y
 CONFIG_MTD_CFI=y
 CONFIG_MTD_JEDECPROBE=y
-- 
1.9.1
