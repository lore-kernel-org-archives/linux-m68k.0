From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 3/6] m68k/defconfig: Enable early printk support
Date: Sun, 25 Jan 2015 15:30:36 +0100
Message-ID: <1422196239-30694-4-git-send-email-geert@linux-m68k.org>
References: <1422196239-30694-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1422196239-30694-1-git-send-email-geert@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@lists.linux-m68k.org
Cc: debian-68k@lists.debian.org, Geert Uytterhoeven <geert@linux-m68k.org>

Enable CONFIG_EARLY_PRINTK on all platforms where it's available (all
but Sun-3) and not yet enabled.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 arch/m68k/configs/amiga_defconfig    | 1 +
 arch/m68k/configs/apollo_defconfig   | 1 +
 arch/m68k/configs/atari_defconfig    | 1 +
 arch/m68k/configs/bvme6000_defconfig | 1 +
 arch/m68k/configs/hp300_defconfig    | 1 +
 arch/m68k/configs/mvme147_defconfig  | 1 +
 arch/m68k/configs/q40_defconfig      | 1 +
 arch/m68k/configs/sun3x_defconfig    | 1 +
 8 files changed, 8 insertions(+)

diff --git a/arch/m68k/configs/amiga_defconfig b/arch/m68k/configs/amiga_defconfig
index 7163c01a021d12aa..8c2f78197e5432b6 100644
--- a/arch/m68k/configs/amiga_defconfig
+++ b/arch/m68k/configs/amiga_defconfig
@@ -500,6 +500,7 @@ CONFIG_TEST_USER_COPY=m
 CONFIG_TEST_BPF=m
 CONFIG_TEST_FIRMWARE=m
 CONFIG_TEST_UDELAY=m
+CONFIG_EARLY_PRINTK=y
 CONFIG_ENCRYPTED_KEYS=m
 CONFIG_CRYPTO_MANAGER=y
 CONFIG_CRYPTO_USER=m
diff --git a/arch/m68k/configs/apollo_defconfig b/arch/m68k/configs/apollo_defconfig
index df57806759e19c55..9139ff7b3279ace0 100644
--- a/arch/m68k/configs/apollo_defconfig
+++ b/arch/m68k/configs/apollo_defconfig
@@ -458,6 +458,7 @@ CONFIG_TEST_USER_COPY=m
 CONFIG_TEST_BPF=m
 CONFIG_TEST_FIRMWARE=m
 CONFIG_TEST_UDELAY=m
+CONFIG_EARLY_PRINTK=y
 CONFIG_ENCRYPTED_KEYS=m
 CONFIG_CRYPTO_MANAGER=y
 CONFIG_CRYPTO_USER=m
diff --git a/arch/m68k/configs/atari_defconfig b/arch/m68k/configs/atari_defconfig
index f8c0f4bd65dfed6f..de543dbabdf4f7a1 100644
--- a/arch/m68k/configs/atari_defconfig
+++ b/arch/m68k/configs/atari_defconfig
@@ -475,6 +475,7 @@ CONFIG_TEST_USER_COPY=m
 CONFIG_TEST_BPF=m
 CONFIG_TEST_FIRMWARE=m
 CONFIG_TEST_UDELAY=m
+CONFIG_EARLY_PRINTK=y
 CONFIG_ENCRYPTED_KEYS=m
 CONFIG_CRYPTO_MANAGER=y
 CONFIG_CRYPTO_USER=m
diff --git a/arch/m68k/configs/bvme6000_defconfig b/arch/m68k/configs/bvme6000_defconfig
index 800f51029a7e80a4..7ab0a79a68c536c1 100644
--- a/arch/m68k/configs/bvme6000_defconfig
+++ b/arch/m68k/configs/bvme6000_defconfig
@@ -451,6 +451,7 @@ CONFIG_TEST_USER_COPY=m
 CONFIG_TEST_BPF=m
 CONFIG_TEST_FIRMWARE=m
 CONFIG_TEST_UDELAY=m
+CONFIG_EARLY_PRINTK=y
 CONFIG_ENCRYPTED_KEYS=m
 CONFIG_CRYPTO_MANAGER=y
 CONFIG_CRYPTO_USER=m
diff --git a/arch/m68k/configs/hp300_defconfig b/arch/m68k/configs/hp300_defconfig
index e2755ff436e4c63f..263d1d55e5ba54e3 100644
--- a/arch/m68k/configs/hp300_defconfig
+++ b/arch/m68k/configs/hp300_defconfig
@@ -460,6 +460,7 @@ CONFIG_TEST_USER_COPY=m
 CONFIG_TEST_BPF=m
 CONFIG_TEST_FIRMWARE=m
 CONFIG_TEST_UDELAY=m
+CONFIG_EARLY_PRINTK=y
 CONFIG_ENCRYPTED_KEYS=m
 CONFIG_CRYPTO_MANAGER=y
 CONFIG_CRYPTO_USER=m
diff --git a/arch/m68k/configs/mvme147_defconfig b/arch/m68k/configs/mvme147_defconfig
index fd0dc942d28b6867..0f19164df62e8de0 100644
--- a/arch/m68k/configs/mvme147_defconfig
+++ b/arch/m68k/configs/mvme147_defconfig
@@ -451,6 +451,7 @@ CONFIG_TEST_USER_COPY=m
 CONFIG_TEST_BPF=m
 CONFIG_TEST_FIRMWARE=m
 CONFIG_TEST_UDELAY=m
+CONFIG_EARLY_PRINTK=y
 CONFIG_ENCRYPTED_KEYS=m
 CONFIG_CRYPTO_MANAGER=y
 CONFIG_CRYPTO_USER=m
diff --git a/arch/m68k/configs/q40_defconfig b/arch/m68k/configs/q40_defconfig
index 2ea8f7348f61eff5..b60ccfb59bb0123b 100644
--- a/arch/m68k/configs/q40_defconfig
+++ b/arch/m68k/configs/q40_defconfig
@@ -473,6 +473,7 @@ CONFIG_TEST_USER_COPY=m
 CONFIG_TEST_BPF=m
 CONFIG_TEST_FIRMWARE=m
 CONFIG_TEST_UDELAY=m
+CONFIG_EARLY_PRINTK=y
 CONFIG_ENCRYPTED_KEYS=m
 CONFIG_CRYPTO_MANAGER=y
 CONFIG_CRYPTO_USER=m
diff --git a/arch/m68k/configs/sun3x_defconfig b/arch/m68k/configs/sun3x_defconfig
index 90a08127304cbc3a..7f2fe78bc881d219 100644
--- a/arch/m68k/configs/sun3x_defconfig
+++ b/arch/m68k/configs/sun3x_defconfig
@@ -452,6 +452,7 @@ CONFIG_TEST_USER_COPY=m
 CONFIG_TEST_BPF=m
 CONFIG_TEST_FIRMWARE=m
 CONFIG_TEST_UDELAY=m
+CONFIG_EARLY_PRINTK=y
 CONFIG_ENCRYPTED_KEYS=m
 CONFIG_CRYPTO_MANAGER=y
 CONFIG_CRYPTO_USER=m
-- 
1.9.1
