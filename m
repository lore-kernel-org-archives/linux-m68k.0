From: <gerg@snapgear.com>
Subject: [PATCH 3/3] m68k: merge mmu and non-mmu versions of time.c
Date: Tue, 7 Feb 2012 13:09:50 +1000
Message-ID: <1328584190-30827-3-git-send-email-gerg@snapgear.com>
References: <1328584190-30827-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from dalsmrelay2.nai.com ([205.227.136.216]:64178 "EHLO
	dalsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755782Ab2BGDLU (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 6 Feb 2012 22:11:20 -0500
In-Reply-To: <1328584190-30827-1-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

There is only trivial differences between the mmu time_mm.c and non-mmu
time_no.c files. Merge them back into a single time.c.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/kernel/time.c    |  128 ++++++++++++++++++++++++++++++++++++++++++--
 arch/m68k/kernel/time_mm.c |  114 ---------------------------------------
 arch/m68k/kernel/time_no.c |   76 --------------------------
 3 files changed, 123 insertions(+), 195 deletions(-)
 delete mode 100644 arch/m68k/kernel/time_mm.c
 delete mode 100644 arch/m68k/kernel/time_no.c

diff --git a/arch/m68k/kernel/time.c b/arch/m68k/kernel/time.c
index 75ab79b..1bb9ddf 100644
--- a/arch/m68k/kernel/time.c
+++ b/arch/m68k/kernel/time.c
@@ -1,5 +1,123 @@
-#if defined(CONFIG_MMU) && !defined(CONFIG_COLDFIRE)
-#include "time_mm.c"
-#else
-#include "time_no.c"
-#endif
+/*
+ *  linux/arch/m68k/kernel/time.c
+ *
+ *  Copyright (C) 1991, 1992, 1995  Linus Torvalds
+ *
+ * This file contains the m68k-specific time handling details.
+ * Most of the stuff is located in the machine specific files.
+ *
+ * 1997-09-10	Updated NTP code according to technical memorandum Jan '96
+ *		"A Kernel Model for Precision Timekeeping" by Dave Mills
+ */
+
+#include <linux/errno.h>
+#include <linux/module.h>
+#include <linux/sched.h>
+#include <linux/kernel.h>
+#include <linux/param.h>
+#include <linux/string.h>
+#include <linux/mm.h>
+#include <linux/rtc.h>
+#include <linux/platform_device.h>
+
+#include <asm/machdep.h>
+#include <asm/io.h>
+#include <asm/irq_regs.h>
+
+#include <linux/time.h>
+#include <linux/timex.h>
+#include <linux/profile.h>
+
+static inline int set_rtc_mmss(unsigned long nowtime)
+{
+  if (mach_set_clock_mmss)
+    return mach_set_clock_mmss (nowtime);
+  return -1;
+}
+
+/*
+ * timer_interrupt() needs to keep up the real-time clock,
+ * as well as call the "xtime_update()" routine every clocktick
+ */
+static irqreturn_t timer_interrupt(int irq, void *dummy)
+{
+	xtime_update(1);
+	update_process_times(user_mode(get_irq_regs()));
+	profile_tick(CPU_PROFILING);
+
+#ifdef CONFIG_HEARTBEAT
+	/* use power LED as a heartbeat instead -- much more useful
+	   for debugging -- based on the version for PReP by Cort */
+	/* acts like an actual heart beat -- ie thump-thump-pause... */
+	if (mach_heartbeat) {
+	    static unsigned cnt = 0, period = 0, dist = 0;
+
+	    if (cnt == 0 || cnt == dist)
+		mach_heartbeat( 1 );
+	    else if (cnt == 7 || cnt == dist+7)
+		mach_heartbeat( 0 );
+
+	    if (++cnt > period) {
+		cnt = 0;
+		/* The hyperbolic function below modifies the heartbeat period
+		 * length in dependency of the current (5min) load. It goes
+		 * through the points f(0)=126, f(1)=86, f(5)=51,
+		 * f(inf)->30. */
+		period = ((672<<FSHIFT)/(5*avenrun[0]+(7<<FSHIFT))) + 30;
+		dist = period / 4;
+	    }
+	}
+#endif /* CONFIG_HEARTBEAT */
+	return IRQ_HANDLED;
+}
+
+void read_persistent_clock(struct timespec *ts)
+{
+	struct rtc_time time;
+	ts->tv_sec = 0;
+	ts->tv_nsec = 0;
+
+	if (mach_hwclk) {
+		mach_hwclk(0, &time);
+
+		if ((time.tm_year += 1900) < 1970)
+			time.tm_year += 100;
+		ts->tv_sec = mktime(time.tm_year, time.tm_mon, time.tm_mday,
+				      time.tm_hour, time.tm_min, time.tm_sec);
+	}
+}
+
+int update_persistent_clock(struct timespec now)
+{
+	return set_rtc_mmss(now.tv_sec);
+}
+
+void __init time_init(void)
+{
+	mach_sched_init(timer_interrupt);
+}
+
+#ifdef CONFIG_M68KCLASSIC
+
+u32 arch_gettimeoffset(void)
+{
+	return mach_gettimeoffset() * 1000;
+}
+
+static int __init rtc_init(void)
+{
+	struct platform_device *pdev;
+
+	if (!mach_hwclk)
+		return -ENODEV;
+
+	pdev = platform_device_register_simple("rtc-generic", -1, NULL, 0);
+	if (IS_ERR(pdev))
+		return PTR_ERR(pdev);
+
+	return 0;
+}
+
+module_init(rtc_init);
+
+#endif /* CONFIG_M68KCLASSIC */
diff --git a/arch/m68k/kernel/time_mm.c b/arch/m68k/kernel/time_mm.c
deleted file mode 100644
index 18b34ee..0000000
--- a/arch/m68k/kernel/time_mm.c
+++ /dev/null
@@ -1,114 +0,0 @@
-/*
- *  linux/arch/m68k/kernel/time.c
- *
- *  Copyright (C) 1991, 1992, 1995  Linus Torvalds
- *
- * This file contains the m68k-specific time handling details.
- * Most of the stuff is located in the machine specific files.
- *
- * 1997-09-10	Updated NTP code according to technical memorandum Jan '96
- *		"A Kernel Model for Precision Timekeeping" by Dave Mills
- */
-
-#include <linux/errno.h>
-#include <linux/module.h>
-#include <linux/sched.h>
-#include <linux/kernel.h>
-#include <linux/param.h>
-#include <linux/string.h>
-#include <linux/mm.h>
-#include <linux/rtc.h>
-#include <linux/platform_device.h>
-
-#include <asm/machdep.h>
-#include <asm/io.h>
-#include <asm/irq_regs.h>
-
-#include <linux/time.h>
-#include <linux/timex.h>
-#include <linux/profile.h>
-
-static inline int set_rtc_mmss(unsigned long nowtime)
-{
-  if (mach_set_clock_mmss)
-    return mach_set_clock_mmss (nowtime);
-  return -1;
-}
-
-/*
- * timer_interrupt() needs to keep up the real-time clock,
- * as well as call the "xtime_update()" routine every clocktick
- */
-static irqreturn_t timer_interrupt(int irq, void *dummy)
-{
-	xtime_update(1);
-	update_process_times(user_mode(get_irq_regs()));
-	profile_tick(CPU_PROFILING);
-
-#ifdef CONFIG_HEARTBEAT
-	/* use power LED as a heartbeat instead -- much more useful
-	   for debugging -- based on the version for PReP by Cort */
-	/* acts like an actual heart beat -- ie thump-thump-pause... */
-	if (mach_heartbeat) {
-	    static unsigned cnt = 0, period = 0, dist = 0;
-
-	    if (cnt == 0 || cnt == dist)
-		mach_heartbeat( 1 );
-	    else if (cnt == 7 || cnt == dist+7)
-		mach_heartbeat( 0 );
-
-	    if (++cnt > period) {
-		cnt = 0;
-		/* The hyperbolic function below modifies the heartbeat period
-		 * length in dependency of the current (5min) load. It goes
-		 * through the points f(0)=126, f(1)=86, f(5)=51,
-		 * f(inf)->30. */
-		period = ((672<<FSHIFT)/(5*avenrun[0]+(7<<FSHIFT))) + 30;
-		dist = period / 4;
-	    }
-	}
-#endif /* CONFIG_HEARTBEAT */
-	return IRQ_HANDLED;
-}
-
-void read_persistent_clock(struct timespec *ts)
-{
-	struct rtc_time time;
-	ts->tv_sec = 0;
-	ts->tv_nsec = 0;
-
-	if (mach_hwclk) {
-		mach_hwclk(0, &time);
-
-		if ((time.tm_year += 1900) < 1970)
-			time.tm_year += 100;
-		ts->tv_sec = mktime(time.tm_year, time.tm_mon, time.tm_mday,
-				      time.tm_hour, time.tm_min, time.tm_sec);
-	}
-}
-
-void __init time_init(void)
-{
-	mach_sched_init(timer_interrupt);
-}
-
-u32 arch_gettimeoffset(void)
-{
-	return mach_gettimeoffset() * 1000;
-}
-
-static int __init rtc_init(void)
-{
-	struct platform_device *pdev;
-
-	if (!mach_hwclk)
-		return -ENODEV;
-
-	pdev = platform_device_register_simple("rtc-generic", -1, NULL, 0);
-	if (IS_ERR(pdev))
-		return PTR_ERR(pdev);
-
-	return 0;
-}
-
-module_init(rtc_init);
diff --git a/arch/m68k/kernel/time_no.c b/arch/m68k/kernel/time_no.c
deleted file mode 100644
index 5fa42f1..0000000
--- a/arch/m68k/kernel/time_no.c
+++ /dev/null
@@ -1,76 +0,0 @@
-/*
- *  linux/arch/m68knommu/kernel/time.c
- *
- *  Copyright (C) 1991, 1992, 1995  Linus Torvalds
- *
- * This file contains the m68k-specific time handling details.
- * Most of the stuff is located in the machine specific files.
- *
- * 1997-09-10	Updated NTP code according to technical memorandum Jan '96
- *		"A Kernel Model for Precision Timekeeping" by Dave Mills
- */
-
-#include <linux/errno.h>
-#include <linux/module.h>
-#include <linux/sched.h>
-#include <linux/kernel.h>
-#include <linux/param.h>
-#include <linux/string.h>
-#include <linux/mm.h>
-#include <linux/profile.h>
-#include <linux/time.h>
-#include <linux/timex.h>
-#include <linux/rtc.h>
-
-#include <asm/machdep.h>
-#include <asm/irq_regs.h>
-
-static inline int set_rtc_mmss(unsigned long nowtime)
-{
-	if (mach_set_clock_mmss)
-		return mach_set_clock_mmss (nowtime);
-	return -1;
-}
-
-/*
- * timer_interrupt() needs to keep up the real-time clock,
- * as well as call the "xtime_update()" routine every clocktick
- */
-static irqreturn_t timer_interrupt(int irq, void *dummy)
-{
-
-	if (current->pid)
-		profile_tick(CPU_PROFILING);
-
-	xtime_update(1);
-
-	update_process_times(user_mode(get_irq_regs()));
-
-	return(IRQ_HANDLED);
-}
-
-void read_persistent_clock(struct timespec *ts)
-{
-	struct rtc_time time;
-	ts->tv_sec = 0;
-	ts->tv_nsec = 0;
-
-	if (mach_hwclk) {
-		mach_hwclk(0, &time);
-
-		if ((time.tm_year += 1900) < 1970)
-			time.tm_year += 100;
-		ts->tv_sec = mktime(time.tm_year, time.tm_mon, time.tm_mday,
-			time.tm_hour, time.tm_min, time.tm_sec);
-	}
-}
-
-int update_persistent_clock(struct timespec now)
-{
-	return set_rtc_mmss(now.tv_sec);
-}
-
-void __init time_init(void)
-{
-	mach_sched_init(timer_interrupt);
-}
-- 
1.7.0.4
