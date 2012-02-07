From: <gerg@snapgear.com>
Subject: [PATCH 1/3] m68knommu: make persistent clock code consistent with m68k
Date: Tue, 7 Feb 2012 13:09:48 +1000
Message-ID: <1328584190-30827-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from dalsmrelay2.nai.com ([205.227.136.216]:64172 "EHLO
	dalsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755782Ab2BGDLR (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 6 Feb 2012 22:11:17 -0500
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

The read_persistent_clock() code is different on m68knommu, for really no
reason. With a few changes to support function names and some code
re-organization the code can be made the same.

This will make it easier to merge the arch/m68k/kernel/time.c for m68k and
m68knommu in a future patch.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/include/asm/machdep.h     |    2 -
 arch/m68k/kernel/setup_no.c         |    2 +
 arch/m68k/kernel/time_no.c          |   36 +++++++++++-----------------------
 arch/m68k/platform/68328/config.c   |    5 ++-
 arch/m68k/platform/68328/timers.c   |   18 ++++++++++------
 arch/m68k/platform/68360/config.c   |    8 +------
 arch/m68k/platform/68EZ328/config.c |    5 ++-
 arch/m68k/platform/68VZ328/config.c |    5 ++-
 8 files changed, 35 insertions(+), 46 deletions(-)

diff --git a/arch/m68k/include/asm/machdep.h b/arch/m68k/include/asm/machdep.h
index 789f3b2..3bfa7df 100644
--- a/arch/m68k/include/asm/machdep.h
+++ b/arch/m68k/include/asm/machdep.h
@@ -22,8 +22,6 @@ extern unsigned int (*mach_get_ss)(void);
 extern int (*mach_get_rtc_pll)(struct rtc_pll_info *);
 extern int (*mach_set_rtc_pll)(struct rtc_pll_info *);
 extern int (*mach_set_clock_mmss)(unsigned long);
-extern void (*mach_gettod)(int *year, int *mon, int *day, int *hour,
-			    int *min, int *sec);
 extern void (*mach_reset)( void );
 extern void (*mach_halt)( void );
 extern void (*mach_power_off)( void );
diff --git a/arch/m68k/kernel/setup_no.c b/arch/m68k/kernel/setup_no.c
index ca3df0d..8394b56 100644
--- a/arch/m68k/kernel/setup_no.c
+++ b/arch/m68k/kernel/setup_no.c
@@ -31,6 +31,7 @@
 #include <linux/init.h>
 #include <linux/initrd.h>
 #include <linux/root_dev.h>
+#include <linux/rtc.h>
 
 #include <asm/setup.h>
 #include <asm/irq.h>
@@ -48,6 +49,7 @@ char __initdata command_line[COMMAND_LINE_SIZE];
 
 /* machine dependent timer functions */
 int (*mach_set_clock_mmss)(unsigned long);
+int (*mach_hwclk) (int, struct rtc_time*);
 
 /* machine dependent reboot functions */
 void (*mach_reset)(void);
diff --git a/arch/m68k/kernel/time_no.c b/arch/m68k/kernel/time_no.c
index 3ef0f77..ca3b3b4 100644
--- a/arch/m68k/kernel/time_no.c
+++ b/arch/m68k/kernel/time_no.c
@@ -20,15 +20,11 @@
 #include <linux/profile.h>
 #include <linux/time.h>
 #include <linux/timex.h>
+#include <linux/rtc.h>
 
 #include <asm/machdep.h>
 #include <asm/irq_regs.h>
 
-#define	TICK_SIZE (tick_nsec / 1000)
-
-/* machine dependent timer functions */
-void (*mach_gettod)(int*, int*, int*, int*, int*, int*);
-
 static inline int set_rtc_mmss(unsigned long nowtime)
 {
 	if (mach_set_clock_mmss)
@@ -55,28 +51,20 @@ irqreturn_t arch_timer_interrupt(int irq, void *dummy)
 }
 #endif
 
-static unsigned long read_rtc_mmss(void)
-{
-	unsigned int year, mon, day, hour, min, sec;
-
-	if (mach_gettod) {
-		mach_gettod(&year, &mon, &day, &hour, &min, &sec);
-		if ((year += 1900) < 1970)
-			year += 100;
-	} else {
-		year = 1970;
-		mon = day = 1;
-		hour = min = sec = 0;
-	}
-
-
-	return  mktime(year, mon, day, hour, min, sec);
-}
-
 void read_persistent_clock(struct timespec *ts)
 {
-	ts->tv_sec = read_rtc_mmss();
+	struct rtc_time time;
+	ts->tv_sec = 0;
 	ts->tv_nsec = 0;
+
+	if (mach_hwclk) {
+		mach_hwclk(0, &time);
+
+		if ((time.tm_year += 1900) < 1970)
+			time.tm_year += 100;
+		ts->tv_sec = mktime(time.tm_year, time.tm_mon, time.tm_mday,
+			time.tm_hour, time.tm_min, time.tm_sec);
+	}
 }
 
 int update_persistent_clock(struct timespec now)
diff --git a/arch/m68k/platform/68328/config.c b/arch/m68k/platform/68328/config.c
index d70bf26..44b8665 100644
--- a/arch/m68k/platform/68328/config.c
+++ b/arch/m68k/platform/68328/config.c
@@ -17,6 +17,7 @@
 
 #include <linux/types.h>
 #include <linux/kernel.h>
+#include <linux/rtc.h>
 #include <asm/system.h>
 #include <asm/machdep.h>
 #include <asm/MC68328.h>
@@ -26,7 +27,7 @@
 
 /***************************************************************************/
 
-void m68328_timer_gettod(int *year, int *mon, int *day, int *hour, int *min, int *sec);
+int m68328_hwclk(int set, struct rtc_time *t);
 
 /***************************************************************************/
 
@@ -48,7 +49,7 @@ void config_BSP(char *command, int len)
   printk(KERN_INFO "68328 support Kenneth Albanowski <kjahds@kjshds.com>\n");
   printk(KERN_INFO "68328/Pilot support Bernhard Kuhn <kuhn@lpr.e-technik.tu-muenchen.de>\n");
 
-  mach_gettod = m68328_timer_gettod;
+  mach_hwclk = m68328_hwclk;
   mach_reset = m68328_reset;
 }
 
diff --git a/arch/m68k/platform/68328/timers.c b/arch/m68k/platform/68328/timers.c
index f267886..b15ddef 100644
--- a/arch/m68k/platform/68328/timers.c
+++ b/arch/m68k/platform/68328/timers.c
@@ -20,6 +20,7 @@
 #include <linux/interrupt.h>
 #include <linux/irq.h>
 #include <linux/clocksource.h>
+#include <linux/rtc.h>
 #include <asm/setup.h>
 #include <asm/system.h>
 #include <asm/pgtable.h>
@@ -119,14 +120,17 @@ void hw_timer_init(void)
 
 /***************************************************************************/
 
-void m68328_timer_gettod(int *year, int *mon, int *day, int *hour, int *min, int *sec)
+int m68328_hwclk(int set, struct rtc_time *t)
 {
-	long now = RTCTIME;
-
-	*year = *mon = *day = 1;
-	*hour = (now >> 24) % 24;
-	*min = (now >> 16) % 60;
-	*sec = now % 60;
+	if (!set) {
+		long now = RTCTIME;
+		t->tm_year = t->tm_mon = t->tm_mday = 1;
+		t->tm_hour = (now >> 24) % 24;
+		t->tm_min = (now >> 16) % 60;
+		t->tm_sec = now % 60;
+	}
+
+	return 0;
 }
 
 /***************************************************************************/
diff --git a/arch/m68k/platform/68360/config.c b/arch/m68k/platform/68360/config.c
index 9dd5bca..599a594 100644
--- a/arch/m68k/platform/68360/config.c
+++ b/arch/m68k/platform/68360/config.c
@@ -103,11 +103,6 @@ void hw_timer_init(void)
   pquicc->timer_tgcr  = tgcr_save;
 }
 
-void BSP_gettod (int *yearp, int *monp, int *dayp,
-		   int *hourp, int *minp, int *secp)
-{
-}
-
 int BSP_set_clock_mmss(unsigned long nowtime)
 {
 #if 0
@@ -181,6 +176,5 @@ void config_BSP(char *command, int len)
   scc1_hwaddr = "\00\01\02\03\04\05";
 #endif
  
-  mach_gettod          = BSP_gettod;
-  mach_reset           = BSP_reset;
+  mach_reset = BSP_reset;
 }
diff --git a/arch/m68k/platform/68EZ328/config.c b/arch/m68k/platform/68EZ328/config.c
index 1be1a16..dd2c535 100644
--- a/arch/m68k/platform/68EZ328/config.c
+++ b/arch/m68k/platform/68EZ328/config.c
@@ -15,6 +15,7 @@
 
 #include <linux/types.h>
 #include <linux/kernel.h>
+#include <linux/rtc.h>
 #include <asm/system.h>
 #include <asm/pgtable.h>
 #include <asm/machdep.h>
@@ -25,7 +26,7 @@
 
 /***************************************************************************/
 
-void m68328_timer_gettod(int *year, int *mon, int *day, int *hour, int *min, int *sec);
+int m68328_hwclk(int set, struct rtc_time *t);
 
 /***************************************************************************/
 
@@ -69,7 +70,7 @@ void config_BSP(char *command, int len)
   else command[0] = 0;
 #endif
  
-  mach_gettod = m68328_timer_gettod;
+  mach_hwclk = m68328_hwclk;
   mach_reset = m68ez328_reset;
 }
 
diff --git a/arch/m68k/platform/68VZ328/config.c b/arch/m68k/platform/68VZ328/config.c
index eabaabe..25ec673 100644
--- a/arch/m68k/platform/68VZ328/config.c
+++ b/arch/m68k/platform/68VZ328/config.c
@@ -20,6 +20,7 @@
 #include <linux/netdevice.h>
 #include <linux/interrupt.h>
 #include <linux/irq.h>
+#include <linux/rtc.h>
 
 #include <asm/system.h>
 #include <asm/pgtable.h>
@@ -33,7 +34,7 @@
 
 /***************************************************************************/
 
-void m68328_timer_gettod(int *year, int *mon, int *day, int *hour, int *min, int *sec);
+int m68328_hwclk(int set, struct rtc_time *t);
 
 /***************************************************************************/
 /*                        Init Drangon Engine hardware                     */
@@ -181,7 +182,7 @@ void config_BSP(char *command, int size)
 
 	init_hardware(command, size);
 
-	mach_gettod = m68328_timer_gettod;
+	mach_hwclk = m68328_hwclk;
 	mach_reset = m68vz328_reset;
 }
 
-- 
1.7.0.4
