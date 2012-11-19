From: <gerg@snapgear.com>
Subject: [PATCH 1/4] m68knommu: create and use a common M53xx ColdFire class of CPUs
Date: Mon, 19 Nov 2012 15:14:05 +1000
Message-ID: <1353302048-924-2-git-send-email-gerg@snapgear.com>
References: <1353302048-924-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mivwsmailout1.mcafee.com ([161.69.47.167]:27398 "EHLO
	MIVWSMAILOUT1.mcafee.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751395Ab2KSFOr (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 19 Nov 2012 00:14:47 -0500
In-Reply-To: <1353302048-924-1-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

The current CONFIG_M532x support definitions are actually common to a larger
set of version 3 ColdFire CPU types. In the future we want to add support for
the 537x family. It is very similar to the 532x internally, and will be able
to use most of the same definitions.

Create a CONFIG_M53xx option that is enabled to support any of the common
532x and 537x CPU types. Convert the current users of CONFIG_M532x to use
CONFIG_M53xx instead.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/Kconfig.cpu                            |    4 ++++
 arch/m68k/include/asm/dma.h                      |    2 +-
 arch/m68k/include/asm/m53xxacr.h                 |    4 ++--
 arch/m68k/include/asm/{m532xsim.h => m53xxsim.h} |   10 +++++-----
 arch/m68k/include/asm/mcfgpio.h                  |   10 +++++-----
 arch/m68k/include/asm/mcfsim.h                   |    4 ++--
 arch/m68k/include/asm/mcftimer.h                 |    2 +-
 arch/m68k/platform/coldfire/timers.c             |    2 +-
 8 files changed, 21 insertions(+), 17 deletions(-)
 rename arch/m68k/include/asm/{m532xsim.h => m53xxsim.h} (99%)

diff --git a/arch/m68k/Kconfig.cpu b/arch/m68k/Kconfig.cpu
index c4eb79e..3610229 100644
--- a/arch/m68k/Kconfig.cpu
+++ b/arch/m68k/Kconfig.cpu
@@ -223,9 +223,13 @@ config M5307
 	help
 	  Motorola ColdFire 5307 processor support.
 
+config M53xx
+	bool
+
 config M532x
 	bool "MCF532x"
 	depends on !MMU
+	select M53xx
 	select HAVE_CACHE_CB
 	help
 	  Freescale (Motorola) ColdFire 532x processor support.
diff --git a/arch/m68k/include/asm/dma.h b/arch/m68k/include/asm/dma.h
index 0ff3fc6..429fe26 100644
--- a/arch/m68k/include/asm/dma.h
+++ b/arch/m68k/include/asm/dma.h
@@ -39,7 +39,7 @@
 #define MAX_M68K_DMA_CHANNELS 4
 #elif defined(CONFIG_M5272)
 #define MAX_M68K_DMA_CHANNELS 1
-#elif defined(CONFIG_M532x)
+#elif defined(CONFIG_M53xx)
 #define MAX_M68K_DMA_CHANNELS 0
 #else
 #define MAX_M68K_DMA_CHANNELS 2
diff --git a/arch/m68k/include/asm/m53xxacr.h b/arch/m68k/include/asm/m53xxacr.h
index cd952b0..3177ce8 100644
--- a/arch/m68k/include/asm/m53xxacr.h
+++ b/arch/m68k/include/asm/m53xxacr.h
@@ -55,8 +55,8 @@
 #define	CACHE_SIZE	0x2000		/* 8k of unified cache */
 #define	ICACHE_SIZE	CACHE_SIZE
 #define	DCACHE_SIZE	CACHE_SIZE
-#elif defined(CONFIG_M532x)
-#define	CACHE_SIZE	0x4000		/* 32k of unified cache */
+#elif defined(CONFIG_M53xx)
+#define	CACHE_SIZE	0x4000		/* 16k of unified cache */
 #define	ICACHE_SIZE	CACHE_SIZE
 #define	DCACHE_SIZE	CACHE_SIZE
 #endif
diff --git a/arch/m68k/include/asm/m532xsim.h b/arch/m68k/include/asm/m53xxsim.h
similarity index 99%
rename from arch/m68k/include/asm/m532xsim.h
rename to arch/m68k/include/asm/m53xxsim.h
index 8668e47..cfa1d35 100644
--- a/arch/m68k/include/asm/m532xsim.h
+++ b/arch/m68k/include/asm/m53xxsim.h
@@ -1,15 +1,15 @@
 /****************************************************************************/
 
 /*
- *	m532xsim.h -- ColdFire 5329 registers
+ *	m53xxsim.h -- ColdFire 5329 registers
  */
 
 /****************************************************************************/
-#ifndef	m532xsim_h
-#define	m532xsim_h
+#ifndef	m53xxsim_h
+#define	m53xxsim_h
 /****************************************************************************/
 
-#define	CPU_NAME		"COLDFIRE(m532x)"
+#define	CPU_NAME		"COLDFIRE(m53xx)"
 #define	CPU_INSTR_PER_JIFFY	3
 #define	MCF_BUSCLK		(MCF_CLK / 3)
 
@@ -1238,4 +1238,4 @@
 #define MCFEPORT_EPFR                 (0xFC094006)
 
 /********************************************************************/
-#endif	/* m532xsim_h */
+#endif	/* m53xxsim_h */
diff --git a/arch/m68k/include/asm/mcfgpio.h b/arch/m68k/include/asm/mcfgpio.h
index fa1059f..c41ebf4 100644
--- a/arch/m68k/include/asm/mcfgpio.h
+++ b/arch/m68k/include/asm/mcfgpio.h
@@ -104,7 +104,7 @@ static inline void gpio_free(unsigned gpio)
 #if defined(CONFIG_M5206) || defined(CONFIG_M5206e) || \
     defined(CONFIG_M520x) || defined(CONFIG_M523x) || \
     defined(CONFIG_M527x) || defined(CONFIG_M528x) || \
-    defined(CONFIG_M532x) || defined(CONFIG_M54xx) || \
+    defined(CONFIG_M53xx) || defined(CONFIG_M54xx) || \
     defined(CONFIG_M5441x)
 
 /* These parts have GPIO organized by 8 bit ports */
@@ -139,7 +139,7 @@ static inline void gpio_free(unsigned gpio)
 
 #if defined(CONFIG_M520x) || defined(CONFIG_M523x) || \
     defined(CONFIG_M527x) || defined(CONFIG_M528x) || \
-    defined(CONFIG_M532x) || defined(CONFIG_M5441x)
+    defined(CONFIG_M53xx) || defined(CONFIG_M5441x)
 /*
  * These parts have an 'Edge' Port module (external interrupt/GPIO) which uses
  * read-modify-write to change an output and a GPIO module which has separate
@@ -195,7 +195,7 @@ static inline u32 __mcfgpio_ppdr(unsigned gpio)
 		return MCFSIM2_GPIO1READ;
 #elif defined(CONFIG_M520x) || defined(CONFIG_M523x) || \
       defined(CONFIG_M527x) || defined(CONFIG_M528x) || \
-      defined(CONFIG_M532x) || defined(CONFIG_M5441x)
+      defined(CONFIG_M53xx) || defined(CONFIG_M5441x)
 #if !defined(CONFIG_M5441x)
 	if (gpio < 8)
 		return MCFEPORT_EPPDR;
@@ -237,7 +237,7 @@ static inline u32 __mcfgpio_podr(unsigned gpio)
 		return MCFSIM2_GPIO1WRITE;
 #elif defined(CONFIG_M520x) || defined(CONFIG_M523x) || \
       defined(CONFIG_M527x) || defined(CONFIG_M528x) || \
-      defined(CONFIG_M532x) || defined(CONFIG_M5441x)
+      defined(CONFIG_M53xx) || defined(CONFIG_M5441x)
 #if !defined(CONFIG_M5441x)
 	if (gpio < 8)
 		return MCFEPORT_EPDR;
@@ -279,7 +279,7 @@ static inline u32 __mcfgpio_pddr(unsigned gpio)
 		return MCFSIM2_GPIO1ENABLE;
 #elif defined(CONFIG_M520x) || defined(CONFIG_M523x) || \
       defined(CONFIG_M527x) || defined(CONFIG_M528x) || \
-      defined(CONFIG_M532x) || defined(CONFIG_M5441x)
+      defined(CONFIG_M53xx) || defined(CONFIG_M5441x)
 #if !defined(CONFIG_M5441x)
 	if (gpio < 8)
 		return MCFEPORT_EPDDR;
diff --git a/arch/m68k/include/asm/mcfsim.h b/arch/m68k/include/asm/mcfsim.h
index a04fd9b..bc867de 100644
--- a/arch/m68k/include/asm/mcfsim.h
+++ b/arch/m68k/include/asm/mcfsim.h
@@ -36,8 +36,8 @@
 #elif defined(CONFIG_M5307)
 #include <asm/m5307sim.h>
 #include <asm/mcfintc.h>
-#elif defined(CONFIG_M532x)
-#include <asm/m532xsim.h>
+#elif defined(CONFIG_M53xx)
+#include <asm/m53xxsim.h>
 #elif defined(CONFIG_M5407)
 #include <asm/m5407sim.h>
 #include <asm/mcfintc.h>
diff --git a/arch/m68k/include/asm/mcftimer.h b/arch/m68k/include/asm/mcftimer.h
index da2fa43..089f0f1 100644
--- a/arch/m68k/include/asm/mcftimer.h
+++ b/arch/m68k/include/asm/mcftimer.h
@@ -19,7 +19,7 @@
 #define	MCFTIMER_TRR		0x04		/* Timer Reference (r/w) */
 #define	MCFTIMER_TCR		0x08		/* Timer Capture reg (r/w) */
 #define	MCFTIMER_TCN		0x0C		/* Timer Counter reg (r/w) */
-#if defined(CONFIG_M532x) || defined(CONFIG_M5441x)
+#if defined(CONFIG_M53xx) || defined(CONFIG_M5441x)
 #define	MCFTIMER_TER		0x03		/* Timer Event reg (r/w) */
 #else
 #define	MCFTIMER_TER		0x11		/* Timer Event reg (r/w) */
diff --git a/arch/m68k/platform/coldfire/timers.c b/arch/m68k/platform/coldfire/timers.c
index 51f6d2a..d06068e 100644
--- a/arch/m68k/platform/coldfire/timers.c
+++ b/arch/m68k/platform/coldfire/timers.c
@@ -36,7 +36,7 @@
  */
 void coldfire_profile_init(void);
 
-#if defined(CONFIG_M532x) || defined(CONFIG_M5441x)
+#if defined(CONFIG_M53xx) || defined(CONFIG_M5441x)
 #define	__raw_readtrr	__raw_readl
 #define	__raw_writetrr	__raw_writel
 #else
-- 
1.7.0.4
