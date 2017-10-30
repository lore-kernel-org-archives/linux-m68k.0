From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] m68k/defconfig: Update defconfigs for v4.14-rc7
Date: Mon, 30 Oct 2017 10:33:12 +0100
Message-ID: <1509355992-28471-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@lists.linux-m68k.org
Cc: Geert Uytterhoeven <geert@linux-m68k.org>

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
To be combined with "m68k/defconfig: Update defconfigs for v4.14-rc1"
---
 arch/m68k/configs/amiga_defconfig    | 2 --
 arch/m68k/configs/apollo_defconfig   | 2 --
 arch/m68k/configs/atari_defconfig    | 2 --
 arch/m68k/configs/bvme6000_defconfig | 2 --
 arch/m68k/configs/hp300_defconfig    | 2 --
 arch/m68k/configs/mac_defconfig      | 2 --
 arch/m68k/configs/multi_defconfig    | 2 --
 arch/m68k/configs/mvme147_defconfig  | 2 --
 arch/m68k/configs/mvme16x_defconfig  | 2 --
 arch/m68k/configs/q40_defconfig      | 2 --
 arch/m68k/configs/sun3_defconfig     | 2 --
 arch/m68k/configs/sun3x_defconfig    | 2 --
 12 files changed, 24 deletions(-)

diff --git a/arch/m68k/configs/amiga_defconfig b/arch/m68k/configs/amiga_defconfig
index 455205a98b30ac7a..5b5fa9831b4d1f1d 100644
--- a/arch/m68k/configs/amiga_defconfig
+++ b/arch/m68k/configs/amiga_defconfig
@@ -611,12 +611,10 @@ CONFIG_CRYPTO_USER=m
 CONFIG_CRYPTO_CRYPTD=m
 CONFIG_CRYPTO_MCRYPTD=m
 CONFIG_CRYPTO_TEST=m
-CONFIG_CRYPTO_CCM=m
 CONFIG_CRYPTO_CHACHA20POLY1305=m
 CONFIG_CRYPTO_LRW=m
 CONFIG_CRYPTO_PCBC=m
 CONFIG_CRYPTO_KEYWRAP=m
-CONFIG_CRYPTO_CMAC=m
 CONFIG_CRYPTO_XCBC=m
 CONFIG_CRYPTO_VMAC=m
 CONFIG_CRYPTO_MICHAEL_MIC=m
diff --git a/arch/m68k/configs/apollo_defconfig b/arch/m68k/configs/apollo_defconfig
index 2c0c018382c7467f..72a7764b74edfd7f 100644
--- a/arch/m68k/configs/apollo_defconfig
+++ b/arch/m68k/configs/apollo_defconfig
@@ -570,12 +570,10 @@ CONFIG_CRYPTO_USER=m
 CONFIG_CRYPTO_CRYPTD=m
 CONFIG_CRYPTO_MCRYPTD=m
 CONFIG_CRYPTO_TEST=m
-CONFIG_CRYPTO_CCM=m
 CONFIG_CRYPTO_CHACHA20POLY1305=m
 CONFIG_CRYPTO_LRW=m
 CONFIG_CRYPTO_PCBC=m
 CONFIG_CRYPTO_KEYWRAP=m
-CONFIG_CRYPTO_CMAC=m
 CONFIG_CRYPTO_XCBC=m
 CONFIG_CRYPTO_VMAC=m
 CONFIG_CRYPTO_MICHAEL_MIC=m
diff --git a/arch/m68k/configs/atari_defconfig b/arch/m68k/configs/atari_defconfig
index 1341d646339d59ff..4f06da723023cee5 100644
--- a/arch/m68k/configs/atari_defconfig
+++ b/arch/m68k/configs/atari_defconfig
@@ -599,12 +599,10 @@ CONFIG_CRYPTO_USER=m
 CONFIG_CRYPTO_CRYPTD=m
 CONFIG_CRYPTO_MCRYPTD=m
 CONFIG_CRYPTO_TEST=m
-CONFIG_CRYPTO_CCM=m
 CONFIG_CRYPTO_CHACHA20POLY1305=m
 CONFIG_CRYPTO_LRW=m
 CONFIG_CRYPTO_PCBC=m
 CONFIG_CRYPTO_KEYWRAP=m
-CONFIG_CRYPTO_CMAC=m
 CONFIG_CRYPTO_XCBC=m
 CONFIG_CRYPTO_VMAC=m
 CONFIG_CRYPTO_MICHAEL_MIC=m
diff --git a/arch/m68k/configs/bvme6000_defconfig b/arch/m68k/configs/bvme6000_defconfig
index 465a4dc3b9162206..fcfa60d31499bce4 100644
--- a/arch/m68k/configs/bvme6000_defconfig
+++ b/arch/m68k/configs/bvme6000_defconfig
@@ -562,12 +562,10 @@ CONFIG_CRYPTO_USER=m
 CONFIG_CRYPTO_CRYPTD=m
 CONFIG_CRYPTO_MCRYPTD=m
 CONFIG_CRYPTO_TEST=m
-CONFIG_CRYPTO_CCM=m
 CONFIG_CRYPTO_CHACHA20POLY1305=m
 CONFIG_CRYPTO_LRW=m
 CONFIG_CRYPTO_PCBC=m
 CONFIG_CRYPTO_KEYWRAP=m
-CONFIG_CRYPTO_CMAC=m
 CONFIG_CRYPTO_XCBC=m
 CONFIG_CRYPTO_VMAC=m
 CONFIG_CRYPTO_MICHAEL_MIC=m
diff --git a/arch/m68k/configs/hp300_defconfig b/arch/m68k/configs/hp300_defconfig
index 5b1707a257e9a8f5..9d597bbbbbfe6b26 100644
--- a/arch/m68k/configs/hp300_defconfig
+++ b/arch/m68k/configs/hp300_defconfig
@@ -572,12 +572,10 @@ CONFIG_CRYPTO_USER=m
 CONFIG_CRYPTO_CRYPTD=m
 CONFIG_CRYPTO_MCRYPTD=m
 CONFIG_CRYPTO_TEST=m
-CONFIG_CRYPTO_CCM=m
 CONFIG_CRYPTO_CHACHA20POLY1305=m
 CONFIG_CRYPTO_LRW=m
 CONFIG_CRYPTO_PCBC=m
 CONFIG_CRYPTO_KEYWRAP=m
-CONFIG_CRYPTO_CMAC=m
 CONFIG_CRYPTO_XCBC=m
 CONFIG_CRYPTO_VMAC=m
 CONFIG_CRYPTO_MICHAEL_MIC=m
diff --git a/arch/m68k/configs/mac_defconfig b/arch/m68k/configs/mac_defconfig
index 31bf1f7279c2d5de..45da20d1286ceb6a 100644
--- a/arch/m68k/configs/mac_defconfig
+++ b/arch/m68k/configs/mac_defconfig
@@ -594,12 +594,10 @@ CONFIG_CRYPTO_USER=m
 CONFIG_CRYPTO_CRYPTD=m
 CONFIG_CRYPTO_MCRYPTD=m
 CONFIG_CRYPTO_TEST=m
-CONFIG_CRYPTO_CCM=m
 CONFIG_CRYPTO_CHACHA20POLY1305=m
 CONFIG_CRYPTO_LRW=m
 CONFIG_CRYPTO_PCBC=m
 CONFIG_CRYPTO_KEYWRAP=m
-CONFIG_CRYPTO_CMAC=m
 CONFIG_CRYPTO_XCBC=m
 CONFIG_CRYPTO_VMAC=m
 CONFIG_CRYPTO_MICHAEL_MIC=m
diff --git a/arch/m68k/configs/multi_defconfig b/arch/m68k/configs/multi_defconfig
index 1d60dadbf63c6ea3..fda880c1086156a2 100644
--- a/arch/m68k/configs/multi_defconfig
+++ b/arch/m68k/configs/multi_defconfig
@@ -674,12 +674,10 @@ CONFIG_CRYPTO_USER=m
 CONFIG_CRYPTO_CRYPTD=m
 CONFIG_CRYPTO_MCRYPTD=m
 CONFIG_CRYPTO_TEST=m
-CONFIG_CRYPTO_CCM=m
 CONFIG_CRYPTO_CHACHA20POLY1305=m
 CONFIG_CRYPTO_LRW=m
 CONFIG_CRYPTO_PCBC=m
 CONFIG_CRYPTO_KEYWRAP=m
-CONFIG_CRYPTO_CMAC=m
 CONFIG_CRYPTO_XCBC=m
 CONFIG_CRYPTO_VMAC=m
 CONFIG_CRYPTO_MICHAEL_MIC=m
diff --git a/arch/m68k/configs/mvme147_defconfig b/arch/m68k/configs/mvme147_defconfig
index 386318f4ef43edcf..7d5e4863efec03bd 100644
--- a/arch/m68k/configs/mvme147_defconfig
+++ b/arch/m68k/configs/mvme147_defconfig
@@ -562,12 +562,10 @@ CONFIG_CRYPTO_USER=m
 CONFIG_CRYPTO_CRYPTD=m
 CONFIG_CRYPTO_MCRYPTD=m
 CONFIG_CRYPTO_TEST=m
-CONFIG_CRYPTO_CCM=m
 CONFIG_CRYPTO_CHACHA20POLY1305=m
 CONFIG_CRYPTO_LRW=m
 CONFIG_CRYPTO_PCBC=m
 CONFIG_CRYPTO_KEYWRAP=m
-CONFIG_CRYPTO_CMAC=m
 CONFIG_CRYPTO_XCBC=m
 CONFIG_CRYPTO_VMAC=m
 CONFIG_CRYPTO_MICHAEL_MIC=m
diff --git a/arch/m68k/configs/mvme16x_defconfig b/arch/m68k/configs/mvme16x_defconfig
index a58cd07cb04aa641..7763b71a9c4973e8 100644
--- a/arch/m68k/configs/mvme16x_defconfig
+++ b/arch/m68k/configs/mvme16x_defconfig
@@ -562,12 +562,10 @@ CONFIG_CRYPTO_USER=m
 CONFIG_CRYPTO_CRYPTD=m
 CONFIG_CRYPTO_MCRYPTD=m
 CONFIG_CRYPTO_TEST=m
-CONFIG_CRYPTO_CCM=m
 CONFIG_CRYPTO_CHACHA20POLY1305=m
 CONFIG_CRYPTO_LRW=m
 CONFIG_CRYPTO_PCBC=m
 CONFIG_CRYPTO_KEYWRAP=m
-CONFIG_CRYPTO_CMAC=m
 CONFIG_CRYPTO_XCBC=m
 CONFIG_CRYPTO_VMAC=m
 CONFIG_CRYPTO_MICHAEL_MIC=m
diff --git a/arch/m68k/configs/q40_defconfig b/arch/m68k/configs/q40_defconfig
index 7f597f58384b1aa1..17eaebfa3e198f11 100644
--- a/arch/m68k/configs/q40_defconfig
+++ b/arch/m68k/configs/q40_defconfig
@@ -585,12 +585,10 @@ CONFIG_CRYPTO_USER=m
 CONFIG_CRYPTO_CRYPTD=m
 CONFIG_CRYPTO_MCRYPTD=m
 CONFIG_CRYPTO_TEST=m
-CONFIG_CRYPTO_CCM=m
 CONFIG_CRYPTO_CHACHA20POLY1305=m
 CONFIG_CRYPTO_LRW=m
 CONFIG_CRYPTO_PCBC=m
 CONFIG_CRYPTO_KEYWRAP=m
-CONFIG_CRYPTO_CMAC=m
 CONFIG_CRYPTO_XCBC=m
 CONFIG_CRYPTO_VMAC=m
 CONFIG_CRYPTO_MICHAEL_MIC=m
diff --git a/arch/m68k/configs/sun3_defconfig b/arch/m68k/configs/sun3_defconfig
index 37f914140afa8383..d1cb7a04ae1d3835 100644
--- a/arch/m68k/configs/sun3_defconfig
+++ b/arch/m68k/configs/sun3_defconfig
@@ -563,12 +563,10 @@ CONFIG_CRYPTO_USER=m
 CONFIG_CRYPTO_CRYPTD=m
 CONFIG_CRYPTO_MCRYPTD=m
 CONFIG_CRYPTO_TEST=m
-CONFIG_CRYPTO_CCM=m
 CONFIG_CRYPTO_CHACHA20POLY1305=m
 CONFIG_CRYPTO_LRW=m
 CONFIG_CRYPTO_PCBC=m
 CONFIG_CRYPTO_KEYWRAP=m
-CONFIG_CRYPTO_CMAC=m
 CONFIG_CRYPTO_XCBC=m
 CONFIG_CRYPTO_VMAC=m
 CONFIG_CRYPTO_MICHAEL_MIC=m
diff --git a/arch/m68k/configs/sun3x_defconfig b/arch/m68k/configs/sun3x_defconfig
index 119be8d6c27a3e2f..ea3a331c62d5b1c9 100644
--- a/arch/m68k/configs/sun3x_defconfig
+++ b/arch/m68k/configs/sun3x_defconfig
@@ -564,12 +564,10 @@ CONFIG_CRYPTO_USER=m
 CONFIG_CRYPTO_CRYPTD=m
 CONFIG_CRYPTO_MCRYPTD=m
 CONFIG_CRYPTO_TEST=m
-CONFIG_CRYPTO_CCM=m
 CONFIG_CRYPTO_CHACHA20POLY1305=m
 CONFIG_CRYPTO_LRW=m
 CONFIG_CRYPTO_PCBC=m
 CONFIG_CRYPTO_KEYWRAP=m
-CONFIG_CRYPTO_CMAC=m
 CONFIG_CRYPTO_XCBC=m
 CONFIG_CRYPTO_VMAC=m
 CONFIG_CRYPTO_MICHAEL_MIC=m
-- 
2.7.4
