From: <gerg@snapgear.com>
Subject: [PATCH 05/35] m68k: add TASK definitions for ColdFires running with MMU
Date: Fri, 25 Nov 2011 13:40:50 +1000
Message-ID: <1322192480-22822-6-git-send-email-gerg@snapgear.com>
References: <1322192480-22822-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from dalsmrelay2.nai.com ([205.227.136.216]:16486 "EHLO
	dalsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751458Ab1KYDjG (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 24 Nov 2011 22:39:06 -0500
In-Reply-To: <1322192480-22822-1-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

Add appropriate TASK_SIZE and TASK_UNMAPPED_BASE definitions for running
on ColdFire V4e cores with MMU enabled.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 arch/m68k/include/asm/processor.h |   16 ++++++++++------
 1 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/arch/m68k/include/asm/processor.h b/arch/m68k/include/asm/processor.h
index 7ec0609..0a84b79 100644
--- a/arch/m68k/include/asm/processor.h
+++ b/arch/m68k/include/asm/processor.h
@@ -48,10 +48,12 @@ static inline void wrusp(unsigned long usp)
  * so don't change it unless you know what you are doing.
  */
 #ifdef CONFIG_MMU
-#ifndef CONFIG_SUN3
-#define TASK_SIZE	(0xF0000000UL)
-#else
+#if defined(CONFIG_COLDFIRE)
+#define TASK_SIZE	(0xC0000000UL)
+#elif defined(CONFIG_SUN3)
 #define TASK_SIZE	(0x0E000000UL)
+#else
+#define TASK_SIZE	(0xF0000000UL)
 #endif
 #else
 #define TASK_SIZE	(0xFFFFFFFFUL)
@@ -66,10 +68,12 @@ static inline void wrusp(unsigned long usp)
  * space during mmap's.
  */
 #ifdef CONFIG_MMU
-#ifndef CONFIG_SUN3
-#define TASK_UNMAPPED_BASE	0xC0000000UL
-#else
+#if defined(CONFIG_COLDFIRE)
+#define TASK_UNMAPPED_BASE	0x80000000UL
+#elif defined(CONFIG_SUN3)
 #define TASK_UNMAPPED_BASE	0x0A000000UL
+#else
+#define TASK_UNMAPPED_BASE	0xC0000000UL
 #endif
 #define TASK_UNMAPPED_ALIGN(addr, off)	PAGE_ALIGN(addr)
 #else
-- 
1.7.0.4
