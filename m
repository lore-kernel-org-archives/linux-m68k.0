From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] m68k/defconfig: Update defconfigs for v4.8-rc1
Date: Mon, 22 Aug 2016 09:57:51 +0200
Message-ID: <1471852671-16087-1-git-send-email-geert@linux-m68k.org>
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
index 8f5b6f7dd1366024..55be7e3ff109056e 100644
--- a/arch/m68k/configs/amiga_defconfig
+++ b/arch/m68k/configs/amiga_defconfig
@@ -566,6 +566,8 @@ CONFIG_TEST_UDELAY=m
 CONFIG_TEST_STATIC_KEYS=m
 CONFIG_EARLY_PRINTK=y
 CONFIG_CRYPTO_RSA=m
+CONFIG_CRYPTO_DH=m
+CONFIG_CRYPTO_ECDH=m
 CONFIG_CRYPTO_MANAGER=y
 CONFIG_CRYPTO_USER=m
 CONFIG_CRYPTO_CRYPTD=m
@@ -584,6 +586,7 @@ CONFIG_CRYPTO_RMD160=m
 CONFIG_CRYPTO_RMD256=m
 CONFIG_CRYPTO_RMD320=m
 CONFIG_CRYPTO_SHA512=m
+CONFIG_CRYPTO_SHA3=m
 CONFIG_CRYPTO_TGR192=m
 CONFIG_CRYPTO_WP512=m
 CONFIG_CRYPTO_ANUBIS=m
diff --git a/arch/m68k/configs/apollo_defconfig b/arch/m68k/configs/apollo_defconfig
index 31bded9c83d45f3a..365dda66b0e669a4 100644
--- a/arch/m68k/configs/apollo_defconfig
+++ b/arch/m68k/configs/apollo_defconfig
@@ -525,6 +525,8 @@ CONFIG_TEST_UDELAY=m
 CONFIG_TEST_STATIC_KEYS=m
 CONFIG_EARLY_PRINTK=y
 CONFIG_CRYPTO_RSA=m
+CONFIG_CRYPTO_DH=m
+CONFIG_CRYPTO_ECDH=m
 CONFIG_CRYPTO_MANAGER=y
 CONFIG_CRYPTO_USER=m
 CONFIG_CRYPTO_CRYPTD=m
@@ -543,6 +545,7 @@ CONFIG_CRYPTO_RMD160=m
 CONFIG_CRYPTO_RMD256=m
 CONFIG_CRYPTO_RMD320=m
 CONFIG_CRYPTO_SHA512=m
+CONFIG_CRYPTO_SHA3=m
 CONFIG_CRYPTO_TGR192=m
 CONFIG_CRYPTO_WP512=m
 CONFIG_CRYPTO_ANUBIS=m
diff --git a/arch/m68k/configs/atari_defconfig b/arch/m68k/configs/atari_defconfig
index ee2057e66207385a..933dce74b913d336 100644
--- a/arch/m68k/configs/atari_defconfig
+++ b/arch/m68k/configs/atari_defconfig
@@ -553,6 +553,8 @@ CONFIG_TEST_UDELAY=m
 CONFIG_TEST_STATIC_KEYS=m
 CONFIG_EARLY_PRINTK=y
 CONFIG_CRYPTO_RSA=m
+CONFIG_CRYPTO_DH=m
+CONFIG_CRYPTO_ECDH=m
 CONFIG_CRYPTO_MANAGER=y
 CONFIG_CRYPTO_USER=m
 CONFIG_CRYPTO_CRYPTD=m
@@ -571,6 +573,7 @@ CONFIG_CRYPTO_RMD160=m
 CONFIG_CRYPTO_RMD256=m
 CONFIG_CRYPTO_RMD320=m
 CONFIG_CRYPTO_SHA512=m
+CONFIG_CRYPTO_SHA3=m
 CONFIG_CRYPTO_TGR192=m
 CONFIG_CRYPTO_WP512=m
 CONFIG_CRYPTO_ANUBIS=m
diff --git a/arch/m68k/configs/bvme6000_defconfig b/arch/m68k/configs/bvme6000_defconfig
index 2cbb5c465fec0348..8db496a9797d2dd1 100644
--- a/arch/m68k/configs/bvme6000_defconfig
+++ b/arch/m68k/configs/bvme6000_defconfig
@@ -517,6 +517,8 @@ CONFIG_TEST_UDELAY=m
 CONFIG_TEST_STATIC_KEYS=m
 CONFIG_EARLY_PRINTK=y
 CONFIG_CRYPTO_RSA=m
+CONFIG_CRYPTO_DH=m
+CONFIG_CRYPTO_ECDH=m
 CONFIG_CRYPTO_MANAGER=y
 CONFIG_CRYPTO_USER=m
 CONFIG_CRYPTO_CRYPTD=m
@@ -535,6 +537,7 @@ CONFIG_CRYPTO_RMD160=m
 CONFIG_CRYPTO_RMD256=m
 CONFIG_CRYPTO_RMD320=m
 CONFIG_CRYPTO_SHA512=m
+CONFIG_CRYPTO_SHA3=m
 CONFIG_CRYPTO_TGR192=m
 CONFIG_CRYPTO_WP512=m
 CONFIG_CRYPTO_ANUBIS=m
diff --git a/arch/m68k/configs/hp300_defconfig b/arch/m68k/configs/hp300_defconfig
index 96102a42c156ee2d..8314156f71490d2b 100644
--- a/arch/m68k/configs/hp300_defconfig
+++ b/arch/m68k/configs/hp300_defconfig
@@ -527,6 +527,8 @@ CONFIG_TEST_UDELAY=m
 CONFIG_TEST_STATIC_KEYS=m
 CONFIG_EARLY_PRINTK=y
 CONFIG_CRYPTO_RSA=m
+CONFIG_CRYPTO_DH=m
+CONFIG_CRYPTO_ECDH=m
 CONFIG_CRYPTO_MANAGER=y
 CONFIG_CRYPTO_USER=m
 CONFIG_CRYPTO_CRYPTD=m
@@ -545,6 +547,7 @@ CONFIG_CRYPTO_RMD160=m
 CONFIG_CRYPTO_RMD256=m
 CONFIG_CRYPTO_RMD320=m
 CONFIG_CRYPTO_SHA512=m
+CONFIG_CRYPTO_SHA3=m
 CONFIG_CRYPTO_TGR192=m
 CONFIG_CRYPTO_WP512=m
 CONFIG_CRYPTO_ANUBIS=m
diff --git a/arch/m68k/configs/mac_defconfig b/arch/m68k/configs/mac_defconfig
index 97d88f7dc5a7bd60..6600270b9622a2ba 100644
--- a/arch/m68k/configs/mac_defconfig
+++ b/arch/m68k/configs/mac_defconfig
@@ -549,6 +549,8 @@ CONFIG_TEST_UDELAY=m
 CONFIG_TEST_STATIC_KEYS=m
 CONFIG_EARLY_PRINTK=y
 CONFIG_CRYPTO_RSA=m
+CONFIG_CRYPTO_DH=m
+CONFIG_CRYPTO_ECDH=m
 CONFIG_CRYPTO_MANAGER=y
 CONFIG_CRYPTO_USER=m
 CONFIG_CRYPTO_CRYPTD=m
@@ -567,6 +569,7 @@ CONFIG_CRYPTO_RMD160=m
 CONFIG_CRYPTO_RMD256=m
 CONFIG_CRYPTO_RMD320=m
 CONFIG_CRYPTO_SHA512=m
+CONFIG_CRYPTO_SHA3=m
 CONFIG_CRYPTO_TGR192=m
 CONFIG_CRYPTO_WP512=m
 CONFIG_CRYPTO_ANUBIS=m
diff --git a/arch/m68k/configs/multi_defconfig b/arch/m68k/configs/multi_defconfig
index be25ef208f0f6237..90abfe9eabba159f 100644
--- a/arch/m68k/configs/multi_defconfig
+++ b/arch/m68k/configs/multi_defconfig
@@ -629,6 +629,8 @@ CONFIG_TEST_UDELAY=m
 CONFIG_TEST_STATIC_KEYS=m
 CONFIG_EARLY_PRINTK=y
 CONFIG_CRYPTO_RSA=m
+CONFIG_CRYPTO_DH=m
+CONFIG_CRYPTO_ECDH=m
 CONFIG_CRYPTO_MANAGER=y
 CONFIG_CRYPTO_USER=m
 CONFIG_CRYPTO_CRYPTD=m
@@ -647,6 +649,7 @@ CONFIG_CRYPTO_RMD160=m
 CONFIG_CRYPTO_RMD256=m
 CONFIG_CRYPTO_RMD320=m
 CONFIG_CRYPTO_SHA512=m
+CONFIG_CRYPTO_SHA3=m
 CONFIG_CRYPTO_TGR192=m
 CONFIG_CRYPTO_WP512=m
 CONFIG_CRYPTO_ANUBIS=m
diff --git a/arch/m68k/configs/mvme147_defconfig b/arch/m68k/configs/mvme147_defconfig
index a008344360c91611..0d502c2f73d5c6be 100644
--- a/arch/m68k/configs/mvme147_defconfig
+++ b/arch/m68k/configs/mvme147_defconfig
@@ -517,6 +517,8 @@ CONFIG_TEST_UDELAY=m
 CONFIG_TEST_STATIC_KEYS=m
 CONFIG_EARLY_PRINTK=y
 CONFIG_CRYPTO_RSA=m
+CONFIG_CRYPTO_DH=m
+CONFIG_CRYPTO_ECDH=m
 CONFIG_CRYPTO_MANAGER=y
 CONFIG_CRYPTO_USER=m
 CONFIG_CRYPTO_CRYPTD=m
@@ -535,6 +537,7 @@ CONFIG_CRYPTO_RMD160=m
 CONFIG_CRYPTO_RMD256=m
 CONFIG_CRYPTO_RMD320=m
 CONFIG_CRYPTO_SHA512=m
+CONFIG_CRYPTO_SHA3=m
 CONFIG_CRYPTO_TGR192=m
 CONFIG_CRYPTO_WP512=m
 CONFIG_CRYPTO_ANUBIS=m
diff --git a/arch/m68k/configs/mvme16x_defconfig b/arch/m68k/configs/mvme16x_defconfig
index 6735a25f36d446f3..5930e91fc710cfa1 100644
--- a/arch/m68k/configs/mvme16x_defconfig
+++ b/arch/m68k/configs/mvme16x_defconfig
@@ -517,6 +517,8 @@ CONFIG_TEST_UDELAY=m
 CONFIG_TEST_STATIC_KEYS=m
 CONFIG_EARLY_PRINTK=y
 CONFIG_CRYPTO_RSA=m
+CONFIG_CRYPTO_DH=m
+CONFIG_CRYPTO_ECDH=m
 CONFIG_CRYPTO_MANAGER=y
 CONFIG_CRYPTO_USER=m
 CONFIG_CRYPTO_CRYPTD=m
@@ -535,6 +537,7 @@ CONFIG_CRYPTO_RMD160=m
 CONFIG_CRYPTO_RMD256=m
 CONFIG_CRYPTO_RMD320=m
 CONFIG_CRYPTO_SHA512=m
+CONFIG_CRYPTO_SHA3=m
 CONFIG_CRYPTO_TGR192=m
 CONFIG_CRYPTO_WP512=m
 CONFIG_CRYPTO_ANUBIS=m
diff --git a/arch/m68k/configs/q40_defconfig b/arch/m68k/configs/q40_defconfig
index 780c6e9f6cf9113d..74e3ad82eca9e509 100644
--- a/arch/m68k/configs/q40_defconfig
+++ b/arch/m68k/configs/q40_defconfig
@@ -540,6 +540,8 @@ CONFIG_TEST_UDELAY=m
 CONFIG_TEST_STATIC_KEYS=m
 CONFIG_EARLY_PRINTK=y
 CONFIG_CRYPTO_RSA=m
+CONFIG_CRYPTO_DH=m
+CONFIG_CRYPTO_ECDH=m
 CONFIG_CRYPTO_MANAGER=y
 CONFIG_CRYPTO_USER=m
 CONFIG_CRYPTO_CRYPTD=m
@@ -558,6 +560,7 @@ CONFIG_CRYPTO_RMD160=m
 CONFIG_CRYPTO_RMD256=m
 CONFIG_CRYPTO_RMD320=m
 CONFIG_CRYPTO_SHA512=m
+CONFIG_CRYPTO_SHA3=m
 CONFIG_CRYPTO_TGR192=m
 CONFIG_CRYPTO_WP512=m
 CONFIG_CRYPTO_ANUBIS=m
diff --git a/arch/m68k/configs/sun3_defconfig b/arch/m68k/configs/sun3_defconfig
index 44693cf361e5df9c..4ba8606a4e697c16 100644
--- a/arch/m68k/configs/sun3_defconfig
+++ b/arch/m68k/configs/sun3_defconfig
@@ -518,6 +518,8 @@ CONFIG_TEST_FIRMWARE=m
 CONFIG_TEST_UDELAY=m
 CONFIG_TEST_STATIC_KEYS=m
 CONFIG_CRYPTO_RSA=m
+CONFIG_CRYPTO_DH=m
+CONFIG_CRYPTO_ECDH=m
 CONFIG_CRYPTO_MANAGER=y
 CONFIG_CRYPTO_USER=m
 CONFIG_CRYPTO_CRYPTD=m
@@ -536,6 +538,7 @@ CONFIG_CRYPTO_RMD160=m
 CONFIG_CRYPTO_RMD256=m
 CONFIG_CRYPTO_RMD320=m
 CONFIG_CRYPTO_SHA512=m
+CONFIG_CRYPTO_SHA3=m
 CONFIG_CRYPTO_TGR192=m
 CONFIG_CRYPTO_WP512=m
 CONFIG_CRYPTO_ANUBIS=m
diff --git a/arch/m68k/configs/sun3x_defconfig b/arch/m68k/configs/sun3x_defconfig
index ef0071d611583465..c6f49726a6c911d8 100644
--- a/arch/m68k/configs/sun3x_defconfig
+++ b/arch/m68k/configs/sun3x_defconfig
@@ -519,6 +519,8 @@ CONFIG_TEST_UDELAY=m
 CONFIG_TEST_STATIC_KEYS=m
 CONFIG_EARLY_PRINTK=y
 CONFIG_CRYPTO_RSA=m
+CONFIG_CRYPTO_DH=m
+CONFIG_CRYPTO_ECDH=m
 CONFIG_CRYPTO_MANAGER=y
 CONFIG_CRYPTO_USER=m
 CONFIG_CRYPTO_CRYPTD=m
@@ -537,6 +539,7 @@ CONFIG_CRYPTO_RMD160=m
 CONFIG_CRYPTO_RMD256=m
 CONFIG_CRYPTO_RMD320=m
 CONFIG_CRYPTO_SHA512=m
+CONFIG_CRYPTO_SHA3=m
 CONFIG_CRYPTO_TGR192=m
 CONFIG_CRYPTO_WP512=m
 CONFIG_CRYPTO_ANUBIS=m
-- 
1.9.1
