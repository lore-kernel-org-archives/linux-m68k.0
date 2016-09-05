From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] m68k: Use IS_ENABLED() instead of checking for built-in or module
Date: Mon,  5 Sep 2016 13:19:50 +0200
Message-ID: <1473074390-16894-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@lists.linux-m68k.org
Cc: Geert Uytterhoeven <geert@linux-m68k.org>

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 arch/m68k/amiga/config.c    | 2 +-
 arch/m68k/atari/config.c    | 2 +-
 arch/m68k/kernel/setup_mm.c | 2 +-
 arch/m68k/mac/config.c      | 2 +-
 arch/m68k/q40/config.c      | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/m68k/amiga/config.c b/arch/m68k/amiga/config.c
index ec9cc1fdd237dec4..ddb8192a36618df4 100644
--- a/arch/m68k/amiga/config.c
+++ b/arch/m68k/amiga/config.c
@@ -396,7 +396,7 @@ void __init config_amiga(void)
 	mach_max_dma_address = 0xffffffff;
 
 	mach_reset           = amiga_reset;
-#if defined(CONFIG_INPUT_M68K_BEEP) || defined(CONFIG_INPUT_M68K_BEEP_MODULE)
+#if IS_ENABLED(CONFIG_INPUT_M68K_BEEP)
 	mach_beep            = amiga_mksound;
 #endif
 
diff --git a/arch/m68k/atari/config.c b/arch/m68k/atari/config.c
index cbd5991fd49aa875..97a3c38cd1f550cc 100644
--- a/arch/m68k/atari/config.c
+++ b/arch/m68k/atari/config.c
@@ -211,7 +211,7 @@ void __init config_atari(void)
 	arch_gettimeoffset   = atari_gettimeoffset;
 	mach_reset           = atari_reset;
 	mach_max_dma_address = 0xffffff;
-#if defined(CONFIG_INPUT_M68K_BEEP) || defined(CONFIG_INPUT_M68K_BEEP_MODULE)
+#if IS_ENABLED(CONFIG_INPUT_M68K_BEEP)
 	mach_beep          = atari_mksound;
 #endif
 #ifdef CONFIG_HEARTBEAT
diff --git a/arch/m68k/kernel/setup_mm.c b/arch/m68k/kernel/setup_mm.c
index 5b8ec4d5f8e8d79d..50633c38f1e2b0d6 100644
--- a/arch/m68k/kernel/setup_mm.c
+++ b/arch/m68k/kernel/setup_mm.c
@@ -105,7 +105,7 @@ EXPORT_SYMBOL(mach_heartbeat);
 #ifdef CONFIG_M68K_L2_CACHE
 void (*mach_l2_flush) (int);
 #endif
-#if defined(CONFIG_INPUT_M68K_BEEP) || defined(CONFIG_INPUT_M68K_BEEP_MODULE)
+#if IS_ENABLED(CONFIG_INPUT_M68K_BEEP)
 void (*mach_beep)(unsigned int, unsigned int);
 EXPORT_SYMBOL(mach_beep);
 #endif
diff --git a/arch/m68k/mac/config.c b/arch/m68k/mac/config.c
index 1c05727bc7fe81c6..9f2c5d8e5b4346e6 100644
--- a/arch/m68k/mac/config.c
+++ b/arch/m68k/mac/config.c
@@ -162,7 +162,7 @@ void __init config_mac(void)
 	mach_halt = mac_poweroff;
 	mach_power_off = mac_poweroff;
 	mach_max_dma_address = 0xffffffff;
-#if defined(CONFIG_INPUT_M68K_BEEP) || defined(CONFIG_INPUT_M68K_BEEP_MODULE)
+#if IS_ENABLED(CONFIG_INPUT_M68K_BEEP)
 	mach_beep = mac_mksound;
 #endif
 
diff --git a/arch/m68k/q40/config.c b/arch/m68k/q40/config.c
index fcb7f05b60b60a7e..ea89a24f46000e4f 100644
--- a/arch/m68k/q40/config.c
+++ b/arch/m68k/q40/config.c
@@ -180,7 +180,7 @@ void __init config_q40(void)
 	mach_reset = q40_reset;
 	mach_get_model = q40_get_model;
 
-#if defined(CONFIG_INPUT_M68K_BEEP) || defined(CONFIG_INPUT_M68K_BEEP_MODULE)
+#if IS_ENABLED(CONFIG_INPUT_M68K_BEEP)
 	mach_beep = q40_mksound;
 #endif
 #ifdef CONFIG_HEARTBEAT
-- 
1.9.1
