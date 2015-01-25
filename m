From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 2/6] m68k/defconfig: Enable test modules
Date: Sun, 25 Jan 2015 15:30:35 +0100
Message-ID: <1422196239-30694-3-git-send-email-geert@linux-m68k.org>
References: <1422196239-30694-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1422196239-30694-1-git-send-email-geert@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@lists.linux-m68k.org
Cc: debian-68k@lists.debian.org, Geert Uytterhoeven <geert@linux-m68k.org>

It doesn't hurt to have CONFIG_TEST_* enabled as modules.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 arch/m68k/configs/amiga_defconfig    | 6 ++++++
 arch/m68k/configs/apollo_defconfig   | 6 ++++++
 arch/m68k/configs/atari_defconfig    | 6 ++++++
 arch/m68k/configs/bvme6000_defconfig | 6 ++++++
 arch/m68k/configs/hp300_defconfig    | 6 ++++++
 arch/m68k/configs/mac_defconfig      | 6 ++++++
 arch/m68k/configs/multi_defconfig    | 6 ++++++
 arch/m68k/configs/mvme147_defconfig  | 6 ++++++
 arch/m68k/configs/mvme16x_defconfig  | 6 ++++++
 arch/m68k/configs/q40_defconfig      | 6 ++++++
 arch/m68k/configs/sun3_defconfig     | 6 ++++++
 arch/m68k/configs/sun3x_defconfig    | 6 ++++++
 12 files changed, 72 insertions(+)

diff --git a/arch/m68k/configs/amiga_defconfig b/arch/m68k/configs/amiga_defconfig
index 08f22e2c38606a9a..7163c01a021d12aa 100644
--- a/arch/m68k/configs/amiga_defconfig
+++ b/arch/m68k/configs/amiga_defconfig
@@ -494,6 +494,12 @@ CONFIG_DLM=m
 CONFIG_MAGIC_SYSRQ=y
 CONFIG_ASYNC_RAID6_TEST=m
 CONFIG_TEST_STRING_HELPERS=m
+CONFIG_TEST_KSTRTOX=m
+CONFIG_TEST_LKM=m
+CONFIG_TEST_USER_COPY=m
+CONFIG_TEST_BPF=m
+CONFIG_TEST_FIRMWARE=m
+CONFIG_TEST_UDELAY=m
 CONFIG_ENCRYPTED_KEYS=m
 CONFIG_CRYPTO_MANAGER=y
 CONFIG_CRYPTO_USER=m
diff --git a/arch/m68k/configs/apollo_defconfig b/arch/m68k/configs/apollo_defconfig
index 7ed47366cfa1109d..df57806759e19c55 100644
--- a/arch/m68k/configs/apollo_defconfig
+++ b/arch/m68k/configs/apollo_defconfig
@@ -452,6 +452,12 @@ CONFIG_DLM=m
 CONFIG_MAGIC_SYSRQ=y
 CONFIG_ASYNC_RAID6_TEST=m
 CONFIG_TEST_STRING_HELPERS=m
+CONFIG_TEST_KSTRTOX=m
+CONFIG_TEST_LKM=m
+CONFIG_TEST_USER_COPY=m
+CONFIG_TEST_BPF=m
+CONFIG_TEST_FIRMWARE=m
+CONFIG_TEST_UDELAY=m
 CONFIG_ENCRYPTED_KEYS=m
 CONFIG_CRYPTO_MANAGER=y
 CONFIG_CRYPTO_USER=m
diff --git a/arch/m68k/configs/atari_defconfig b/arch/m68k/configs/atari_defconfig
index 3f2b68db2700852b..f8c0f4bd65dfed6f 100644
--- a/arch/m68k/configs/atari_defconfig
+++ b/arch/m68k/configs/atari_defconfig
@@ -469,6 +469,12 @@ CONFIG_DLM=m
 CONFIG_MAGIC_SYSRQ=y
 CONFIG_ASYNC_RAID6_TEST=m
 CONFIG_TEST_STRING_HELPERS=m
+CONFIG_TEST_KSTRTOX=m
+CONFIG_TEST_LKM=m
+CONFIG_TEST_USER_COPY=m
+CONFIG_TEST_BPF=m
+CONFIG_TEST_FIRMWARE=m
+CONFIG_TEST_UDELAY=m
 CONFIG_ENCRYPTED_KEYS=m
 CONFIG_CRYPTO_MANAGER=y
 CONFIG_CRYPTO_USER=m
diff --git a/arch/m68k/configs/bvme6000_defconfig b/arch/m68k/configs/bvme6000_defconfig
index af746c7f8f16d43a..800f51029a7e80a4 100644
--- a/arch/m68k/configs/bvme6000_defconfig
+++ b/arch/m68k/configs/bvme6000_defconfig
@@ -445,6 +445,12 @@ CONFIG_DLM=m
 CONFIG_MAGIC_SYSRQ=y
 CONFIG_ASYNC_RAID6_TEST=m
 CONFIG_TEST_STRING_HELPERS=m
+CONFIG_TEST_KSTRTOX=m
+CONFIG_TEST_LKM=m
+CONFIG_TEST_USER_COPY=m
+CONFIG_TEST_BPF=m
+CONFIG_TEST_FIRMWARE=m
+CONFIG_TEST_UDELAY=m
 CONFIG_ENCRYPTED_KEYS=m
 CONFIG_CRYPTO_MANAGER=y
 CONFIG_CRYPTO_USER=m
diff --git a/arch/m68k/configs/hp300_defconfig b/arch/m68k/configs/hp300_defconfig
index 24e0a94c2bb73ebf..e2755ff436e4c63f 100644
--- a/arch/m68k/configs/hp300_defconfig
+++ b/arch/m68k/configs/hp300_defconfig
@@ -454,6 +454,12 @@ CONFIG_DLM=m
 CONFIG_MAGIC_SYSRQ=y
 CONFIG_ASYNC_RAID6_TEST=m
 CONFIG_TEST_STRING_HELPERS=m
+CONFIG_TEST_KSTRTOX=m
+CONFIG_TEST_LKM=m
+CONFIG_TEST_USER_COPY=m
+CONFIG_TEST_BPF=m
+CONFIG_TEST_FIRMWARE=m
+CONFIG_TEST_UDELAY=m
 CONFIG_ENCRYPTED_KEYS=m
 CONFIG_CRYPTO_MANAGER=y
 CONFIG_CRYPTO_USER=m
diff --git a/arch/m68k/configs/mac_defconfig b/arch/m68k/configs/mac_defconfig
index 88403f8081366689..1d224d086bf00f87 100644
--- a/arch/m68k/configs/mac_defconfig
+++ b/arch/m68k/configs/mac_defconfig
@@ -476,6 +476,12 @@ CONFIG_DLM=m
 CONFIG_MAGIC_SYSRQ=y
 CONFIG_ASYNC_RAID6_TEST=m
 CONFIG_TEST_STRING_HELPERS=m
+CONFIG_TEST_KSTRTOX=m
+CONFIG_TEST_LKM=m
+CONFIG_TEST_USER_COPY=m
+CONFIG_TEST_BPF=m
+CONFIG_TEST_FIRMWARE=m
+CONFIG_TEST_UDELAY=m
 CONFIG_EARLY_PRINTK=y
 CONFIG_ENCRYPTED_KEYS=m
 CONFIG_CRYPTO_MANAGER=y
diff --git a/arch/m68k/configs/multi_defconfig b/arch/m68k/configs/multi_defconfig
index 712c06e1c67bfcbb..03070f7b8634bece 100644
--- a/arch/m68k/configs/multi_defconfig
+++ b/arch/m68k/configs/multi_defconfig
@@ -552,6 +552,12 @@ CONFIG_DLM=m
 CONFIG_MAGIC_SYSRQ=y
 CONFIG_ASYNC_RAID6_TEST=m
 CONFIG_TEST_STRING_HELPERS=m
+CONFIG_TEST_KSTRTOX=m
+CONFIG_TEST_LKM=m
+CONFIG_TEST_USER_COPY=m
+CONFIG_TEST_BPF=m
+CONFIG_TEST_FIRMWARE=m
+CONFIG_TEST_UDELAY=m
 CONFIG_EARLY_PRINTK=y
 CONFIG_ENCRYPTED_KEYS=m
 CONFIG_CRYPTO_MANAGER=y
diff --git a/arch/m68k/configs/mvme147_defconfig b/arch/m68k/configs/mvme147_defconfig
index f04ec591aaab5100..fd0dc942d28b6867 100644
--- a/arch/m68k/configs/mvme147_defconfig
+++ b/arch/m68k/configs/mvme147_defconfig
@@ -445,6 +445,12 @@ CONFIG_DLM=m
 CONFIG_MAGIC_SYSRQ=y
 CONFIG_ASYNC_RAID6_TEST=m
 CONFIG_TEST_STRING_HELPERS=m
+CONFIG_TEST_KSTRTOX=m
+CONFIG_TEST_LKM=m
+CONFIG_TEST_USER_COPY=m
+CONFIG_TEST_BPF=m
+CONFIG_TEST_FIRMWARE=m
+CONFIG_TEST_UDELAY=m
 CONFIG_ENCRYPTED_KEYS=m
 CONFIG_CRYPTO_MANAGER=y
 CONFIG_CRYPTO_USER=m
diff --git a/arch/m68k/configs/mvme16x_defconfig b/arch/m68k/configs/mvme16x_defconfig
index 2a57c9a1f2a62416..70292d6abfb708d2 100644
--- a/arch/m68k/configs/mvme16x_defconfig
+++ b/arch/m68k/configs/mvme16x_defconfig
@@ -445,6 +445,12 @@ CONFIG_DLM=m
 CONFIG_MAGIC_SYSRQ=y
 CONFIG_ASYNC_RAID6_TEST=m
 CONFIG_TEST_STRING_HELPERS=m
+CONFIG_TEST_KSTRTOX=m
+CONFIG_TEST_LKM=m
+CONFIG_TEST_USER_COPY=m
+CONFIG_TEST_BPF=m
+CONFIG_TEST_FIRMWARE=m
+CONFIG_TEST_UDELAY=m
 CONFIG_EARLY_PRINTK=y
 CONFIG_ENCRYPTED_KEYS=m
 CONFIG_CRYPTO_MANAGER=y
diff --git a/arch/m68k/configs/q40_defconfig b/arch/m68k/configs/q40_defconfig
index b106d8e7bcc47a82..2ea8f7348f61eff5 100644
--- a/arch/m68k/configs/q40_defconfig
+++ b/arch/m68k/configs/q40_defconfig
@@ -467,6 +467,12 @@ CONFIG_DLM=m
 CONFIG_MAGIC_SYSRQ=y
 CONFIG_ASYNC_RAID6_TEST=m
 CONFIG_TEST_STRING_HELPERS=m
+CONFIG_TEST_KSTRTOX=m
+CONFIG_TEST_LKM=m
+CONFIG_TEST_USER_COPY=m
+CONFIG_TEST_BPF=m
+CONFIG_TEST_FIRMWARE=m
+CONFIG_TEST_UDELAY=m
 CONFIG_ENCRYPTED_KEYS=m
 CONFIG_CRYPTO_MANAGER=y
 CONFIG_CRYPTO_USER=m
diff --git a/arch/m68k/configs/sun3_defconfig b/arch/m68k/configs/sun3_defconfig
index 2408b46156c5d9bc..014672ab72916fa7 100644
--- a/arch/m68k/configs/sun3_defconfig
+++ b/arch/m68k/configs/sun3_defconfig
@@ -446,6 +446,12 @@ CONFIG_DLM=m
 CONFIG_MAGIC_SYSRQ=y
 CONFIG_ASYNC_RAID6_TEST=m
 CONFIG_TEST_STRING_HELPERS=m
+CONFIG_TEST_KSTRTOX=m
+CONFIG_TEST_LKM=m
+CONFIG_TEST_USER_COPY=m
+CONFIG_TEST_BPF=m
+CONFIG_TEST_FIRMWARE=m
+CONFIG_TEST_UDELAY=m
 CONFIG_ENCRYPTED_KEYS=m
 CONFIG_CRYPTO_MANAGER=y
 CONFIG_CRYPTO_USER=m
diff --git a/arch/m68k/configs/sun3x_defconfig b/arch/m68k/configs/sun3x_defconfig
index 69b19b904ec58d8e..90a08127304cbc3a 100644
--- a/arch/m68k/configs/sun3x_defconfig
+++ b/arch/m68k/configs/sun3x_defconfig
@@ -446,6 +446,12 @@ CONFIG_DLM=m
 CONFIG_MAGIC_SYSRQ=y
 CONFIG_ASYNC_RAID6_TEST=m
 CONFIG_TEST_STRING_HELPERS=m
+CONFIG_TEST_KSTRTOX=m
+CONFIG_TEST_LKM=m
+CONFIG_TEST_USER_COPY=m
+CONFIG_TEST_BPF=m
+CONFIG_TEST_FIRMWARE=m
+CONFIG_TEST_UDELAY=m
 CONFIG_ENCRYPTED_KEYS=m
 CONFIG_CRYPTO_MANAGER=y
 CONFIG_CRYPTO_USER=m
-- 
1.9.1
