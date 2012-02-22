From: <gerg@snapgear.com>
Subject: [PATCH 4/5 v2] m68k: merge mmu and non-mmu versions of time.c
Date: Wed, 22 Feb 2012 13:58:55 +1000
Message-ID: <1329883136-9837-4-git-send-email-gerg@snapgear.com>
References: <1329883136-9837-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from dalsmrelay2.nai.com ([205.227.136.216]:50759 "EHLO
	dalsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932123Ab2BVD7c (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 21 Feb 2012 22:59:32 -0500
In-Reply-To: <1329883136-9837-1-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

There is only trivial differences between the mmu time_mm.c and non-mmu
time_no.c files. Merge them back into a single time.c.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/kernel/{time_mm.c => time.c} |    4 ++
 arch/m68k/kernel/time_no.c             |   71 --------------------------------
 2 files changed, 4 insertions(+), 71 deletions(-)
 rename arch/m68k/kernel/{time_mm.c => time.c} (97%)
 delete mode 100644 arch/m68k/kernel/time_no.c

diff --git a/arch/m68k/kernel/time_mm.c b/arch/m68k/kernel/time.c
similarity index 97%
rename from arch/m68k/kernel/time_mm.c
rename to arch/m68k/kernel/time.c
index 18b34ee..adfcefb 100644
--- a/arch/m68k/kernel/time_mm.c
+++ b/arch/m68k/kernel/time.c
@@ -92,6 +92,8 @@ void __init time_init(void)
 	mach_sched_init(timer_interrupt);
 }
 
+#ifdef CONFIG_M68KCLASSIC
+
 u32 arch_gettimeoffset(void)
 {
 	return mach_gettimeoffset() * 1000;
@@ -112,3 +114,5 @@ static int __init rtc_init(void)
 }
 
 module_init(rtc_init);
+
+#endif /* CONFIG_M68KCLASSIC */
diff --git a/arch/m68k/kernel/time_no.c b/arch/m68k/kernel/time_no.c
deleted file mode 100644
index 87c7acd..0000000
--- a/arch/m68k/kernel/time_no.c
+++ /dev/null
@@ -1,71 +0,0 @@
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
-void __init time_init(void)
-{
-	mach_sched_init(timer_interrupt);
-}
-- 
1.7.0.4
