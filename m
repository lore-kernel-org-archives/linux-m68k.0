From: Greg Ungerer <gerg@snapgear.com>
Subject: [PATCH] m68k/m68knommu: merge machdep.h files into a single file
Date: Tue, 7 Sep 2010 15:48:43 +1000
Message-ID: <201009070548.o875mhS1008026@goober.internal.moreton.com.au>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from dalsmrelay2.nai.com ([205.227.136.216]:36508 "HELO
	dalsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1751083Ab0IGFsy (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 7 Sep 2010 01:48:54 -0400
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org
Cc: gerg@uclinux.org

m68k/m68knommu: merge machdep.h files into a single file

No need to have separate machdep.h files for each of the MMU and non-MMU
cases. Merge them all into a single file.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/include/asm/{machdep_mm.h => machdep.h} |    9 +++++++
 arch/m68k/include/asm/machdep_no.h                |   26 ---------------------
 2 files changed, 9 insertions(+), 26 deletions(-)
 rename arch/m68k/include/asm/{machdep_mm.h => machdep.h} (77%)
 delete mode 100644 arch/m68k/include/asm/machdep_no.h

diff --git a/arch/m68k/include/asm/machdep_mm.h b/arch/m68k/include/asm/machdep.h
similarity index 77%
rename from arch/m68k/include/asm/machdep_mm.h
rename to arch/m68k/include/asm/machdep.h
index 5637dce..71ad465 100644
--- a/arch/m68k/include/asm/machdep_mm.h
+++ b/arch/m68k/include/asm/machdep.h
@@ -22,6 +22,8 @@ extern unsigned int (*mach_get_ss)(void);
 extern int (*mach_get_rtc_pll)(struct rtc_pll_info *);
 extern int (*mach_set_rtc_pll)(struct rtc_pll_info *);
 extern int (*mach_set_clock_mmss)(unsigned long);
+extern void (*mach_gettod)(int *year, int *mon, int *day, int *hour,
+			    int *min, int *sec);
 extern void (*mach_reset)( void );
 extern void (*mach_halt)( void );
 extern void (*mach_power_off)( void );
@@ -32,4 +34,11 @@ extern void (*mach_heartbeat) (int);
 extern void (*mach_l2_flush) (int);
 extern void (*mach_beep) (unsigned int, unsigned int);
 
+/* Hardware clock functions */
+extern void hw_timer_init(void);
+extern unsigned long hw_timer_offset(void);
+extern irqreturn_t arch_timer_interrupt(int irq, void *dummy);
+
+extern void config_BSP(char *command, int len);
+
 #endif /* _M68K_MACHDEP_H */
diff --git a/arch/m68k/include/asm/machdep_no.h b/arch/m68k/include/asm/machdep_no.h
deleted file mode 100644
index de9f47a..0000000
--- a/arch/m68k/include/asm/machdep_no.h
+++ /dev/null
@@ -1,26 +0,0 @@
-#ifndef _M68KNOMMU_MACHDEP_H
-#define _M68KNOMMU_MACHDEP_H
-
-#include <linux/interrupt.h>
-
-/* Hardware clock functions */
-extern void hw_timer_init(void);
-extern unsigned long hw_timer_offset(void);
-
-extern irqreturn_t arch_timer_interrupt(int irq, void *dummy);
-
-/* Machine dependent time handling */
-extern void (*mach_gettod)(int *year, int *mon, int *day, int *hour,
-			   int *min, int *sec);
-extern int (*mach_set_clock_mmss)(unsigned long);
-
-/* machine dependent power off functions */
-extern void (*mach_reset)( void );
-extern void (*mach_halt)( void );
-extern void (*mach_power_off)( void );
-
-extern void config_BSP(char *command, int len);
-
-extern void do_IRQ(int irq, struct pt_regs *fp);
-
-#endif /* _M68KNOMMU_MACHDEP_H */
-- 
1.6.3.3
