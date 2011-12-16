From: <gerg@snapgear.com>
Subject: [PATCH 05/35] m68k: add TASK definitions for ColdFires running with MMU
Date: Fri, 16 Dec 2011 22:36:02 +1000
Message-ID: <1324038992-31222-6-git-send-email-gerg@snapgear.com>
References: <1324038992-31222-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:49359 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759110Ab1LPMgi (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 16 Dec 2011 07:36:38 -0500
In-Reply-To: <1324038992-31222-1-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

Add appropriate TASK_SIZE and TASK_UNMAPPED_BASE definitions for running
on ColdFire V4e cores with MMU enabled.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Matt Waddel <mwaddel@yahoo.com>
Acked-by: Kurt Mahan <kmahan@xmission.com>
---
 arch/m68k/include/asm/processor.h |   16 ++++++++++------
 1 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/arch/m68k/include/asm/processor.h b/arch/m68k/include/asm/processor.h
index 7ec0609..46460fa 100644
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
+#define TASK_UNMAPPED_BASE	0x60000000UL
+#elif defined(CONFIG_SUN3)
 #define TASK_UNMAPPED_BASE	0x0A000000UL
+#else
+#define TASK_UNMAPPED_BASE	0xC0000000UL
 #endif
 #define TASK_UNMAPPED_ALIGN(addr, off)	PAGE_ALIGN(addr)
 #else
-- 
1.7.0.4
