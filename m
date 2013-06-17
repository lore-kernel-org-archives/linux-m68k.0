From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 2/2] m68k/q40: Enable PC parallel port in defconfig
Date: Mon, 17 Jun 2013 21:07:31 +0200
Message-ID: <1371496051-16566-2-git-send-email-geert@linux-m68k.org>
References: <1371496051-16566-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1371496051-16566-1-git-send-email-geert@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Thorsten Glaser <tg@debian.org>, Richard Zidlicky <rz@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org, Geert Uytterhoeven <geert@linux-m68k.org>

Enable the PC parallel port and other related options in the Q40-specific
and multi-platform defconfigs.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 arch/m68k/configs/multi_defconfig |    2 ++
 arch/m68k/configs/q40_defconfig   |    6 ++++++
 2 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/arch/m68k/configs/multi_defconfig b/arch/m68k/configs/multi_defconfig
index 0609daf..94c59e0 100644
--- a/arch/m68k/configs/multi_defconfig
+++ b/arch/m68k/configs/multi_defconfig
@@ -216,6 +216,7 @@ CONFIG_DEVTMPFS=y
 # CONFIG_FW_LOADER_USER_HELPER is not set
 CONFIG_CONNECTOR=m
 CONFIG_PARPORT=m
+CONFIG_PARPORT_PC=m
 CONFIG_PARPORT_AMIGA=m
 CONFIG_PARPORT_MFC3=m
 CONFIG_PARPORT_ATARI=m
@@ -329,6 +330,7 @@ CONFIG_ZORRO8390=y
 # CONFIG_NET_VENDOR_SEEQ is not set
 # CONFIG_NET_VENDOR_STMICRO is not set
 # CONFIG_NET_VENDOR_WIZNET is not set
+CONFIG_PLIP=m
 CONFIG_PPP=m
 CONFIG_PPP_BSDCOMP=m
 CONFIG_PPP_DEFLATE=m
diff --git a/arch/m68k/configs/q40_defconfig b/arch/m68k/configs/q40_defconfig
index 1a3fcb4..593ae5c 100644
--- a/arch/m68k/configs/q40_defconfig
+++ b/arch/m68k/configs/q40_defconfig
@@ -201,6 +201,9 @@ CONFIG_DEVTMPFS=y
 # CONFIG_FIRMWARE_IN_KERNEL is not set
 # CONFIG_FW_LOADER_USER_HELPER is not set
 CONFIG_CONNECTOR=m
+CONFIG_PARPORT=m
+CONFIG_PARPORT_PC=m
+CONFIG_PARPORT_1284=y
 CONFIG_BLK_DEV_LOOP=y
 CONFIG_BLK_DEV_CRYPTOLOOP=m
 CONFIG_BLK_DEV_DRBD=m
@@ -271,6 +274,7 @@ CONFIG_NE2000=m
 # CONFIG_NET_VENDOR_SMSC is not set
 # CONFIG_NET_VENDOR_STMICRO is not set
 # CONFIG_NET_VENDOR_WIZNET is not set
+CONFIG_PLIP=m
 CONFIG_PPP=m
 CONFIG_PPP_BSDCOMP=m
 CONFIG_PPP_DEFLATE=m
@@ -296,9 +300,11 @@ CONFIG_SERIO_Q40KBD=y
 CONFIG_VT_HW_CONSOLE_BINDING=y
 # CONFIG_LEGACY_PTYS is not set
 # CONFIG_DEVKMEM is not set
+CONFIG_PRINTER=m
 # CONFIG_HW_RANDOM is not set
 CONFIG_NTP_PPS=y
 CONFIG_PPS_CLIENT_LDISC=m
+CONFIG_PPS_CLIENT_PARPORT=m
 CONFIG_PTP_1588_CLOCK=m
 # CONFIG_HWMON is not set
 CONFIG_FB=y
-- 
1.7.0.4
