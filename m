From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 5/6] m68k/defconfig: Enable Atari EtherNAT and EtherNEC Ethernet support
Date: Sun, 25 Jan 2015 15:30:38 +0100
Message-ID: <1422196239-30694-6-git-send-email-geert@linux-m68k.org>
References: <1422196239-30694-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1422196239-30694-1-git-send-email-geert@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@lists.linux-m68k.org
Cc: debian-68k@lists.debian.org, Geert Uytterhoeven <geert@linux-m68k.org>

Enable support for Atari EtherNAT (SMC91X) and EtherNEC (NE2000)
Ethernet support in the Atari and multiplatform defconfig files.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 arch/m68k/configs/atari_defconfig | 5 +++++
 arch/m68k/configs/multi_defconfig | 6 +++++-
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/arch/m68k/configs/atari_defconfig b/arch/m68k/configs/atari_defconfig
index c53bd87bd68c3727..776964f25774f617 100644
--- a/arch/m68k/configs/atari_defconfig
+++ b/arch/m68k/configs/atari_defconfig
@@ -31,6 +31,7 @@ CONFIG_M68030=y
 CONFIG_M68040=y
 CONFIG_M68060=y
 CONFIG_ATARI=y
+CONFIG_ATARI_ROM_ISA=y
 # CONFIG_COMPACTION is not set
 CONFIG_CLEANCACHE=y
 CONFIG_ZPOOL=m
@@ -313,10 +314,12 @@ CONFIG_ATARILANCE=y
 # CONFIG_NET_VENDOR_INTEL is not set
 # CONFIG_NET_VENDOR_MARVELL is not set
 # CONFIG_NET_VENDOR_MICREL is not set
+CONFIG_NE2000=y
 # CONFIG_NET_VENDOR_QUALCOMM is not set
 # CONFIG_NET_VENDOR_ROCKER is not set
 # CONFIG_NET_VENDOR_SAMSUNG is not set
 # CONFIG_NET_VENDOR_SEEQ is not set
+CONFIG_SMC91X=y
 # CONFIG_NET_VENDOR_STMICRO is not set
 # CONFIG_NET_VENDOR_VIA is not set
 # CONFIG_NET_VENDOR_WIZNET is not set
@@ -371,6 +374,8 @@ CONFIG_NATFEAT=y
 CONFIG_NFBLOCK=y
 CONFIG_NFCON=y
 CONFIG_NFETH=y
+CONFIG_ATARI_ETHERNAT=y
+CONFIG_ATARI_ETHERNEC=y
 CONFIG_ATARI_DSP56K=m
 CONFIG_EXT4_FS=y
 CONFIG_REISERFS_FS=m
diff --git a/arch/m68k/configs/multi_defconfig b/arch/m68k/configs/multi_defconfig
index a0b539c99ad24a57..80ea4b4da872656b 100644
--- a/arch/m68k/configs/multi_defconfig
+++ b/arch/m68k/configs/multi_defconfig
@@ -39,6 +39,7 @@ CONFIG_SUN3X=y
 CONFIG_Q40=y
 CONFIG_ZORRO=y
 CONFIG_AMIGA_PCMCIA=y
+CONFIG_ATARI_ROM_ISA=y
 CONFIG_ZORRO_NAMES=y
 # CONFIG_COMPACTION is not set
 CONFIG_CLEANCACHE=y
@@ -366,13 +367,14 @@ CONFIG_MVME16x_NET=y
 CONFIG_MACSONIC=y
 CONFIG_HYDRA=y
 CONFIG_MAC8390=y
-CONFIG_NE2000=m
+CONFIG_NE2000=y
 CONFIG_APNE=y
 CONFIG_ZORRO8390=y
 # CONFIG_NET_VENDOR_QUALCOMM is not set
 # CONFIG_NET_VENDOR_ROCKER is not set
 # CONFIG_NET_VENDOR_SAMSUNG is not set
 # CONFIG_NET_VENDOR_SEEQ is not set
+CONFIG_SMC91X=y
 # CONFIG_NET_VENDOR_STMICRO is not set
 # CONFIG_NET_VENDOR_VIA is not set
 # CONFIG_NET_VENDOR_WIZNET is not set
@@ -452,6 +454,8 @@ CONFIG_NATFEAT=y
 CONFIG_NFBLOCK=y
 CONFIG_NFCON=y
 CONFIG_NFETH=y
+CONFIG_ATARI_ETHERNAT=y
+CONFIG_ATARI_ETHERNEC=y
 CONFIG_ATARI_DSP56K=m
 CONFIG_AMIGA_BUILTIN_SERIAL=y
 CONFIG_SERIAL_CONSOLE=y
-- 
1.9.1
