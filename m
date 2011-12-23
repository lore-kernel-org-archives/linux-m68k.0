From: <gerg@snapgear.com>
Subject: [PATCH 01/35] m68k: add machine and CPU definitions for ColdFire cores
Date: Fri, 23 Dec 2011 13:15:14 +1000
Message-ID: <1324610148-20666-2-git-send-email-gerg@snapgear.com>
References: <1324610148-20666-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:22238 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754168Ab1LWDOb (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 22 Dec 2011 22:14:31 -0500
In-Reply-To: <1324610148-20666-1-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

Create machine and CPU definitions to support the ColdFire CPU family
members that have a virtual memory management unit.

The ColdFire V4e core contains an MMU, and it is quite different to
any other 68k family members.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Matt Waddel <mwaddel@yahoo.com>
Acked-by: Kurt Mahan <kmahan@xmission.com>
---
 arch/m68k/include/asm/setup.h |   14 ++++++++++++++
 1 files changed, 14 insertions(+), 0 deletions(-)

diff --git a/arch/m68k/include/asm/setup.h b/arch/m68k/include/asm/setup.h
index 4dfb395..00c2c53 100644
--- a/arch/m68k/include/asm/setup.h
+++ b/arch/m68k/include/asm/setup.h
@@ -40,6 +40,7 @@
 #define MACH_HP300    9
 #define MACH_Q40     10
 #define MACH_SUN3X   11
+#define MACH_M54XX   12
 
 #define COMMAND_LINE_SIZE 256
 
@@ -211,23 +212,27 @@ extern unsigned long m68k_machtype;
 #define CPUB_68030     1
 #define CPUB_68040     2
 #define CPUB_68060     3
+#define CPUB_COLDFIRE  4
 
 #define CPU_68020      (1<<CPUB_68020)
 #define CPU_68030      (1<<CPUB_68030)
 #define CPU_68040      (1<<CPUB_68040)
 #define CPU_68060      (1<<CPUB_68060)
+#define CPU_COLDFIRE   (1<<CPUB_COLDFIRE)
 
 #define FPUB_68881     0
 #define FPUB_68882     1
 #define FPUB_68040     2                       /* Internal FPU */
 #define FPUB_68060     3                       /* Internal FPU */
 #define FPUB_SUNFPA    4                       /* Sun-3 FPA */
+#define FPUB_COLDFIRE  5                       /* ColdFire FPU */
 
 #define FPU_68881      (1<<FPUB_68881)
 #define FPU_68882      (1<<FPUB_68882)
 #define FPU_68040      (1<<FPUB_68040)
 #define FPU_68060      (1<<FPUB_68060)
 #define FPU_SUNFPA     (1<<FPUB_SUNFPA)
+#define FPU_COLDFIRE   (1<<FPUB_COLDFIRE)
 
 #define MMUB_68851     0
 #define MMUB_68030     1                       /* Internal MMU */
@@ -235,6 +240,7 @@ extern unsigned long m68k_machtype;
 #define MMUB_68060     3                       /* Internal MMU */
 #define MMUB_APOLLO    4                       /* Custom Apollo */
 #define MMUB_SUN3      5                       /* Custom Sun-3 */
+#define MMUB_COLDFIRE  6                       /* Internal MMU */
 
 #define MMU_68851      (1<<MMUB_68851)
 #define MMU_68030      (1<<MMUB_68030)
@@ -242,6 +248,7 @@ extern unsigned long m68k_machtype;
 #define MMU_68060      (1<<MMUB_68060)
 #define MMU_SUN3       (1<<MMUB_SUN3)
 #define MMU_APOLLO     (1<<MMUB_APOLLO)
+#define MMU_COLDFIRE   (1<<MMUB_COLDFIRE)
 
 #ifdef __KERNEL__
 
@@ -341,6 +348,13 @@ extern int m68k_is040or060;
 #  endif
 #endif
 
+#if !defined(CONFIG_COLDFIRE)
+#  define CPU_IS_COLDFIRE (0)
+#else
+#  define CPU_IS_COLDFIRE (1)
+#  define MMU_IS_COLDFIRE (1)
+#endif
+
 #define CPU_TYPE (m68k_cputype)
 
 #ifdef CONFIG_M68KFPU_EMU
-- 
1.7.0.4
