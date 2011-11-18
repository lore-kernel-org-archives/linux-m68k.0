From: <gerg@snapgear.com>
Subject: [PATCH] m68k: handle presence of 64bit mul/div instructions cleanly
Date: Fri, 18 Nov 2011 16:32:40 +1000
Message-ID: <1321597960-23782-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from dalsmrelay2.nai.com ([205.227.136.216]:31313 "EHLO
	dalsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756701Ab1KRGag (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 18 Nov 2011 01:30:36 -0500
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

The traditional 68000 processors and the newer reduced instruction set
ColdFire processors do not support the 32*32->64 multiply or the 64/32->32
divide instructions. This is not a difference based on the presence of
a hardware MMU or not.

Create a new config symbol to mark that a CPU type doesn't support the
longer multiply/divide instructions. Use this then as a basis for using 
the fast 64bit based divide (in div64.h) and for linking in the extra 
libgcc functions that may be required (mulsi3, divsi3, etc).

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/Kconfig             |    3 +++
 arch/m68k/Kconfig.cpu         |    2 ++
 arch/m68k/include/asm/div64.h |    8 ++++----
 arch/m68k/kernel/m68k_ksyms.c |    2 +-
 arch/m68k/lib/Makefile        |    8 +++-----
 5 files changed, 13 insertions(+), 10 deletions(-)

diff --git a/arch/m68k/Kconfig b/arch/m68k/Kconfig
index 2fe2d63..32fd364 100644
--- a/arch/m68k/Kconfig
+++ b/arch/m68k/Kconfig
@@ -63,6 +63,9 @@ config ZONE_DMA
 config CPU_HAS_NO_BITFIELDS
 	bool
 
+config CPU_HAS_NO_MULDIV64
+	bool
+
 config HZ
 	int
 	default 1000 if CLEOPATRA
diff --git a/arch/m68k/Kconfig.cpu b/arch/m68k/Kconfig.cpu
index 17d37ed..017f4fc 100644
--- a/arch/m68k/Kconfig.cpu
+++ b/arch/m68k/Kconfig.cpu
@@ -3,6 +3,7 @@ comment "Processor Type"
 config M68000
 	bool
 	select CPU_HAS_NO_BITFIELDS
+	select CPU_HAS_NO_MULDIV64
 	select GENERIC_CSUM
 	help
 	  The Freescale (was Motorola) 68000 CPU is the first generation of
@@ -24,6 +25,7 @@ config COLDFIRE
 	select GENERIC_GPIO
 	select ARCH_REQUIRE_GPIOLIB
 	select CPU_HAS_NO_BITFIELDS
+	select CPU_HAS_NO_MULDIV64
 	select GENERIC_CSUM
 	help
 	  The Freescale ColdFire family of processors is a modern derivitive
diff --git a/arch/m68k/include/asm/div64.h b/arch/m68k/include/asm/div64.h
index edb6614..444ea8a 100644
--- a/arch/m68k/include/asm/div64.h
+++ b/arch/m68k/include/asm/div64.h
@@ -1,7 +1,9 @@
 #ifndef _M68K_DIV64_H
 #define _M68K_DIV64_H
 
-#ifdef CONFIG_MMU
+#ifdef CONFIG_CPU_HAS_NO_MULDIV64
+#include <asm-generic/div64.h>
+#else
 
 #include <linux/types.h>
 
@@ -27,8 +29,6 @@
 	__rem;							\
 })
 
-#else
-#include <asm-generic/div64.h>
-#endif /* CONFIG_MMU */
+#endif /* CONFIG_CPU_HAS_NO_MULDIV64 */
 
 #endif /* _M68K_DIV64_H */
diff --git a/arch/m68k/kernel/m68k_ksyms.c b/arch/m68k/kernel/m68k_ksyms.c
index 1b7a14d..774c1bd 100644
--- a/arch/m68k/kernel/m68k_ksyms.c
+++ b/arch/m68k/kernel/m68k_ksyms.c
@@ -14,7 +14,7 @@ EXPORT_SYMBOL(__ashrdi3);
 EXPORT_SYMBOL(__lshrdi3);
 EXPORT_SYMBOL(__muldi3);
 
-#if defined(CONFIG_M68000) || defined(CONFIG_COLDFIRE)
+#if defined(CONFIG_CPU_HAS_NO_MULDIV64)
 /*
  * Simpler 68k and ColdFire parts also need a few other gcc functions.
  */
diff --git a/arch/m68k/lib/Makefile b/arch/m68k/lib/Makefile
index b3b40e4..a9d782d 100644
--- a/arch/m68k/lib/Makefile
+++ b/arch/m68k/lib/Makefile
@@ -6,11 +6,9 @@
 lib-y	:= ashldi3.o ashrdi3.o lshrdi3.o muldi3.o \
 	   memcpy.o memset.o memmove.o
 
-ifdef CONFIG_MMU
-lib-y	+= string.o uaccess.o
-else
-lib-y	+= mulsi3.o divsi3.o udivsi3.o modsi3.o umodsi3.o
-endif
+lib-$(CONFIG_MMU) += string.o uaccess.o
+lib-$(CONFIG_CPU_HAS_NO_MULDIV64) += mulsi3.o divsi3.o udivsi3.o
+lib-$(CONFIG_CPU_HAS_NO_MULDIV64) += modsi3.o umodsi3.o
 
 ifndef CONFIG_GENERIC_CSUM
 lib-y	+= checksum.o
-- 
1.7.0.4
