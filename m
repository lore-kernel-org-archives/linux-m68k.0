From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] m68k/defconfig: Update defconfigs for v4.0-rc1
Date: Mon, 23 Feb 2015 11:23:15 +0100
Message-ID: <1424686995-30697-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@lists.linux-m68k.org
Cc: Geert Uytterhoeven <geert@linux-m68k.org>

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
Updates for later releases may be squashed into this one later.
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
index 1a10a08ebec7474f..ed1643b4c67893b6 100644
--- a/arch/m68k/configs/amiga_defconfig
+++ b/arch/m68k/configs/amiga_defconfig
@@ -521,8 +521,10 @@ CONFIG_NLS_MAC_TURKISH=m
 CONFIG_DLM=m
 CONFIG_MAGIC_SYSRQ=y
 CONFIG_ASYNC_RAID6_TEST=m
+CONFIG_TEST_HEXDUMP=m
 CONFIG_TEST_STRING_HELPERS=m
 CONFIG_TEST_KSTRTOX=m
+CONFIG_TEST_RHASHTABLE=m
 CONFIG_TEST_LKM=m
 CONFIG_TEST_USER_COPY=m
 CONFIG_TEST_BPF=m
@@ -573,5 +575,6 @@ CONFIG_CRYPTO_DRBG_HASH=y
 CONFIG_CRYPTO_DRBG_CTR=y
 CONFIG_CRYPTO_USER_API_HASH=m
 CONFIG_CRYPTO_USER_API_SKCIPHER=m
+CONFIG_CRYPTO_USER_API_RNG=m
 # CONFIG_CRYPTO_HW is not set
 CONFIG_XZ_DEC_TEST=m
diff --git a/arch/m68k/configs/apollo_defconfig b/arch/m68k/configs/apollo_defconfig
index 7859a738c81ead67..d38822b1847ee272 100644
--- a/arch/m68k/configs/apollo_defconfig
+++ b/arch/m68k/configs/apollo_defconfig
@@ -479,8 +479,10 @@ CONFIG_NLS_MAC_TURKISH=m
 CONFIG_DLM=m
 CONFIG_MAGIC_SYSRQ=y
 CONFIG_ASYNC_RAID6_TEST=m
+CONFIG_TEST_HEXDUMP=m
 CONFIG_TEST_STRING_HELPERS=m
 CONFIG_TEST_KSTRTOX=m
+CONFIG_TEST_RHASHTABLE=m
 CONFIG_TEST_LKM=m
 CONFIG_TEST_USER_COPY=m
 CONFIG_TEST_BPF=m
@@ -531,5 +533,6 @@ CONFIG_CRYPTO_DRBG_HASH=y
 CONFIG_CRYPTO_DRBG_CTR=y
 CONFIG_CRYPTO_USER_API_HASH=m
 CONFIG_CRYPTO_USER_API_SKCIPHER=m
+CONFIG_CRYPTO_USER_API_RNG=m
 # CONFIG_CRYPTO_HW is not set
 CONFIG_XZ_DEC_TEST=m
diff --git a/arch/m68k/configs/atari_defconfig b/arch/m68k/configs/atari_defconfig
index 19e310d52917cb24..cdcfa080047cb8f0 100644
--- a/arch/m68k/configs/atari_defconfig
+++ b/arch/m68k/configs/atari_defconfig
@@ -511,8 +511,10 @@ CONFIG_NLS_MAC_TURKISH=m
 CONFIG_DLM=m
 CONFIG_MAGIC_SYSRQ=y
 CONFIG_ASYNC_RAID6_TEST=m
+CONFIG_TEST_HEXDUMP=m
 CONFIG_TEST_STRING_HELPERS=m
 CONFIG_TEST_KSTRTOX=m
+CONFIG_TEST_RHASHTABLE=m
 CONFIG_TEST_LKM=m
 CONFIG_TEST_USER_COPY=m
 CONFIG_TEST_BPF=m
@@ -563,5 +565,6 @@ CONFIG_CRYPTO_DRBG_HASH=y
 CONFIG_CRYPTO_DRBG_CTR=y
 CONFIG_CRYPTO_USER_API_HASH=m
 CONFIG_CRYPTO_USER_API_SKCIPHER=m
+CONFIG_CRYPTO_USER_API_RNG=m
 # CONFIG_CRYPTO_HW is not set
 CONFIG_XZ_DEC_TEST=m
diff --git a/arch/m68k/configs/bvme6000_defconfig b/arch/m68k/configs/bvme6000_defconfig
index f3bd35e76ea4823d..9b880371d6421ec9 100644
--- a/arch/m68k/configs/bvme6000_defconfig
+++ b/arch/m68k/configs/bvme6000_defconfig
@@ -472,8 +472,10 @@ CONFIG_NLS_MAC_TURKISH=m
 CONFIG_DLM=m
 CONFIG_MAGIC_SYSRQ=y
 CONFIG_ASYNC_RAID6_TEST=m
+CONFIG_TEST_HEXDUMP=m
 CONFIG_TEST_STRING_HELPERS=m
 CONFIG_TEST_KSTRTOX=m
+CONFIG_TEST_RHASHTABLE=m
 CONFIG_TEST_LKM=m
 CONFIG_TEST_USER_COPY=m
 CONFIG_TEST_BPF=m
@@ -524,5 +526,6 @@ CONFIG_CRYPTO_DRBG_HASH=y
 CONFIG_CRYPTO_DRBG_CTR=y
 CONFIG_CRYPTO_USER_API_HASH=m
 CONFIG_CRYPTO_USER_API_SKCIPHER=m
+CONFIG_CRYPTO_USER_API_RNG=m
 # CONFIG_CRYPTO_HW is not set
 CONFIG_XZ_DEC_TEST=m
diff --git a/arch/m68k/configs/hp300_defconfig b/arch/m68k/configs/hp300_defconfig
index 9f9793fb2b73dac7..49ae3376e993a50f 100644
--- a/arch/m68k/configs/hp300_defconfig
+++ b/arch/m68k/configs/hp300_defconfig
@@ -481,8 +481,10 @@ CONFIG_NLS_MAC_TURKISH=m
 CONFIG_DLM=m
 CONFIG_MAGIC_SYSRQ=y
 CONFIG_ASYNC_RAID6_TEST=m
+CONFIG_TEST_HEXDUMP=m
 CONFIG_TEST_STRING_HELPERS=m
 CONFIG_TEST_KSTRTOX=m
+CONFIG_TEST_RHASHTABLE=m
 CONFIG_TEST_LKM=m
 CONFIG_TEST_USER_COPY=m
 CONFIG_TEST_BPF=m
@@ -533,5 +535,6 @@ CONFIG_CRYPTO_DRBG_HASH=y
 CONFIG_CRYPTO_DRBG_CTR=y
 CONFIG_CRYPTO_USER_API_HASH=m
 CONFIG_CRYPTO_USER_API_SKCIPHER=m
+CONFIG_CRYPTO_USER_API_RNG=m
 # CONFIG_CRYPTO_HW is not set
 CONFIG_XZ_DEC_TEST=m
diff --git a/arch/m68k/configs/mac_defconfig b/arch/m68k/configs/mac_defconfig
index 89f225c01a0b6745..ee143a57058cb93e 100644
--- a/arch/m68k/configs/mac_defconfig
+++ b/arch/m68k/configs/mac_defconfig
@@ -503,8 +503,10 @@ CONFIG_NLS_MAC_TURKISH=m
 CONFIG_DLM=m
 CONFIG_MAGIC_SYSRQ=y
 CONFIG_ASYNC_RAID6_TEST=m
+CONFIG_TEST_HEXDUMP=m
 CONFIG_TEST_STRING_HELPERS=m
 CONFIG_TEST_KSTRTOX=m
+CONFIG_TEST_RHASHTABLE=m
 CONFIG_TEST_LKM=m
 CONFIG_TEST_USER_COPY=m
 CONFIG_TEST_BPF=m
@@ -555,5 +557,6 @@ CONFIG_CRYPTO_DRBG_HASH=y
 CONFIG_CRYPTO_DRBG_CTR=y
 CONFIG_CRYPTO_USER_API_HASH=m
 CONFIG_CRYPTO_USER_API_SKCIPHER=m
+CONFIG_CRYPTO_USER_API_RNG=m
 # CONFIG_CRYPTO_HW is not set
 CONFIG_XZ_DEC_TEST=m
diff --git a/arch/m68k/configs/multi_defconfig b/arch/m68k/configs/multi_defconfig
index d3cdb5447a2ca7e5..c777aa05048f0bad 100644
--- a/arch/m68k/configs/multi_defconfig
+++ b/arch/m68k/configs/multi_defconfig
@@ -583,8 +583,10 @@ CONFIG_NLS_MAC_TURKISH=m
 CONFIG_DLM=m
 CONFIG_MAGIC_SYSRQ=y
 CONFIG_ASYNC_RAID6_TEST=m
+CONFIG_TEST_HEXDUMP=m
 CONFIG_TEST_STRING_HELPERS=m
 CONFIG_TEST_KSTRTOX=m
+CONFIG_TEST_RHASHTABLE=m
 CONFIG_TEST_LKM=m
 CONFIG_TEST_USER_COPY=m
 CONFIG_TEST_BPF=m
@@ -635,5 +637,6 @@ CONFIG_CRYPTO_DRBG_HASH=y
 CONFIG_CRYPTO_DRBG_CTR=y
 CONFIG_CRYPTO_USER_API_HASH=m
 CONFIG_CRYPTO_USER_API_SKCIPHER=m
+CONFIG_CRYPTO_USER_API_RNG=m
 # CONFIG_CRYPTO_HW is not set
 CONFIG_XZ_DEC_TEST=m
diff --git a/arch/m68k/configs/mvme147_defconfig b/arch/m68k/configs/mvme147_defconfig
index b4c76640973eca3f..a7628a85e260ddab 100644
--- a/arch/m68k/configs/mvme147_defconfig
+++ b/arch/m68k/configs/mvme147_defconfig
@@ -472,8 +472,10 @@ CONFIG_NLS_MAC_TURKISH=m
 CONFIG_DLM=m
 CONFIG_MAGIC_SYSRQ=y
 CONFIG_ASYNC_RAID6_TEST=m
+CONFIG_TEST_HEXDUMP=m
 CONFIG_TEST_STRING_HELPERS=m
 CONFIG_TEST_KSTRTOX=m
+CONFIG_TEST_RHASHTABLE=m
 CONFIG_TEST_LKM=m
 CONFIG_TEST_USER_COPY=m
 CONFIG_TEST_BPF=m
@@ -524,5 +526,6 @@ CONFIG_CRYPTO_DRBG_HASH=y
 CONFIG_CRYPTO_DRBG_CTR=y
 CONFIG_CRYPTO_USER_API_HASH=m
 CONFIG_CRYPTO_USER_API_SKCIPHER=m
+CONFIG_CRYPTO_USER_API_RNG=m
 # CONFIG_CRYPTO_HW is not set
 CONFIG_XZ_DEC_TEST=m
diff --git a/arch/m68k/configs/mvme16x_defconfig b/arch/m68k/configs/mvme16x_defconfig
index 0d4a26f9b58c5596..ebaa68268a4a5f35 100644
--- a/arch/m68k/configs/mvme16x_defconfig
+++ b/arch/m68k/configs/mvme16x_defconfig
@@ -472,8 +472,10 @@ CONFIG_NLS_MAC_TURKISH=m
 CONFIG_DLM=m
 CONFIG_MAGIC_SYSRQ=y
 CONFIG_ASYNC_RAID6_TEST=m
+CONFIG_TEST_HEXDUMP=m
 CONFIG_TEST_STRING_HELPERS=m
 CONFIG_TEST_KSTRTOX=m
+CONFIG_TEST_RHASHTABLE=m
 CONFIG_TEST_LKM=m
 CONFIG_TEST_USER_COPY=m
 CONFIG_TEST_BPF=m
@@ -524,5 +526,6 @@ CONFIG_CRYPTO_DRBG_HASH=y
 CONFIG_CRYPTO_DRBG_CTR=y
 CONFIG_CRYPTO_USER_API_HASH=m
 CONFIG_CRYPTO_USER_API_SKCIPHER=m
+CONFIG_CRYPTO_USER_API_RNG=m
 # CONFIG_CRYPTO_HW is not set
 CONFIG_XZ_DEC_TEST=m
diff --git a/arch/m68k/configs/q40_defconfig b/arch/m68k/configs/q40_defconfig
index 7518746c708912c6..2c16853aedd350b8 100644
--- a/arch/m68k/configs/q40_defconfig
+++ b/arch/m68k/configs/q40_defconfig
@@ -494,8 +494,10 @@ CONFIG_NLS_MAC_TURKISH=m
 CONFIG_DLM=m
 CONFIG_MAGIC_SYSRQ=y
 CONFIG_ASYNC_RAID6_TEST=m
+CONFIG_TEST_HEXDUMP=m
 CONFIG_TEST_STRING_HELPERS=m
 CONFIG_TEST_KSTRTOX=m
+CONFIG_TEST_RHASHTABLE=m
 CONFIG_TEST_LKM=m
 CONFIG_TEST_USER_COPY=m
 CONFIG_TEST_BPF=m
@@ -546,5 +548,6 @@ CONFIG_CRYPTO_DRBG_HASH=y
 CONFIG_CRYPTO_DRBG_CTR=y
 CONFIG_CRYPTO_USER_API_HASH=m
 CONFIG_CRYPTO_USER_API_SKCIPHER=m
+CONFIG_CRYPTO_USER_API_RNG=m
 # CONFIG_CRYPTO_HW is not set
 CONFIG_XZ_DEC_TEST=m
diff --git a/arch/m68k/configs/sun3_defconfig b/arch/m68k/configs/sun3_defconfig
index c6b49a4a887cab5e..e3056bf0f65bdea7 100644
--- a/arch/m68k/configs/sun3_defconfig
+++ b/arch/m68k/configs/sun3_defconfig
@@ -473,8 +473,10 @@ CONFIG_NLS_MAC_TURKISH=m
 CONFIG_DLM=m
 CONFIG_MAGIC_SYSRQ=y
 CONFIG_ASYNC_RAID6_TEST=m
+CONFIG_TEST_HEXDUMP=m
 CONFIG_TEST_STRING_HELPERS=m
 CONFIG_TEST_KSTRTOX=m
+CONFIG_TEST_RHASHTABLE=m
 CONFIG_TEST_LKM=m
 CONFIG_TEST_USER_COPY=m
 CONFIG_TEST_BPF=m
@@ -524,5 +526,6 @@ CONFIG_CRYPTO_DRBG_HASH=y
 CONFIG_CRYPTO_DRBG_CTR=y
 CONFIG_CRYPTO_USER_API_HASH=m
 CONFIG_CRYPTO_USER_API_SKCIPHER=m
+CONFIG_CRYPTO_USER_API_RNG=m
 # CONFIG_CRYPTO_HW is not set
 CONFIG_XZ_DEC_TEST=m
diff --git a/arch/m68k/configs/sun3x_defconfig b/arch/m68k/configs/sun3x_defconfig
index b65785eaff8dc52f..73c36b7a000978cf 100644
--- a/arch/m68k/configs/sun3x_defconfig
+++ b/arch/m68k/configs/sun3x_defconfig
@@ -473,8 +473,10 @@ CONFIG_NLS_MAC_TURKISH=m
 CONFIG_DLM=m
 CONFIG_MAGIC_SYSRQ=y
 CONFIG_ASYNC_RAID6_TEST=m
+CONFIG_TEST_HEXDUMP=m
 CONFIG_TEST_STRING_HELPERS=m
 CONFIG_TEST_KSTRTOX=m
+CONFIG_TEST_RHASHTABLE=m
 CONFIG_TEST_LKM=m
 CONFIG_TEST_USER_COPY=m
 CONFIG_TEST_BPF=m
@@ -525,5 +527,6 @@ CONFIG_CRYPTO_DRBG_HASH=y
 CONFIG_CRYPTO_DRBG_CTR=y
 CONFIG_CRYPTO_USER_API_HASH=m
 CONFIG_CRYPTO_USER_API_SKCIPHER=m
+CONFIG_CRYPTO_USER_API_RNG=m
 # CONFIG_CRYPTO_HW is not set
 CONFIG_XZ_DEC_TEST=m
-- 
1.9.1
