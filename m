From: sfking@fdwdc.com
Subject: [RFC 15/31] proof of concept merge of m68k and m68knommu
Date: Sun,  6 Sep 2009 22:40:05 -0700
Message-ID: <9132c5b379a84a9b9a8762fc557abcae6e6ca479.1252222134.git.sfking@fdwdc.com>
References: <cover.1252222129.git.sfking@fdwdc.com>
 <cfdcab7374087d5279ec9a1269831e8159d98f2b.1252222133.git.sfking@fdwdc.com>
 <8cb57205150fb96915e9d12c936be301a5e1e1e1.1252222133.git.sfking@fdwdc.com>
 <44c52df23985288bc2f4a819b73b3cc6da0826b9.1252222133.git.sfking@fdwdc.com>
 <6db080fb352e20adab49ed7762d3200831160b0f.1252222133.git.sfking@fdwdc.com>
 <c2e845e94079ee2a24e19456666f571c687f93f7.1252222133.git.sfking@fdwdc.com>
 <afa7a198356e79718b7682ea33cdfeec1933ae3d.1252222133.git.sfking@fdwdc.com>
 <f6625c80e8b3246063209517cccc855c056b2b71.1252222133.git.sfking@fdwdc.com>
 <55335001e487bd208ef4801c9df7e2d38a842ad3.1252222134.git.sfking@fdwdc.com>
 <1960838f2a4476b115b27420dcec29f81f0a15c1.1252222134.git.sfking@fdwdc.com>
 <491494a31232c4ce3a7fb96c3ed9db228f0ec5b4.1252222134.git.sfking@fdwdc.com>
 <b5baa71b2c543432ce8561ef7c18ef73201d47a8.1252222134.git.sfking@fdwdc.com>
 <fa246e049b7bc779d1c85def3f733a540463c3e2.1252222134.git.sfking@fdwdc.com>
 <c90263ddd638105b7df953128fd150d7fafc56ee.1252222134.git.sfking@fdwdc.com>
 <732b3e401d3708f1abf810ff0028e48d63df7e4b.1252222134.git.sfking@fdwdc.com>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from smtp109.biz.mail.mud.yahoo.com ([68.142.201.178]:34428 "HELO
	smtp109.biz.mail.mud.yahoo.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with SMTP id S1758950AbZIGFrP (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 7 Sep 2009 01:47:15 -0400
In-Reply-To: <732b3e401d3708f1abf810ff0028e48d63df7e4b.1252222134.git.sfking@fdwdc.com>
In-Reply-To: <cover.1252222129.git.sfking@fdwdc.com>
References: <cover.1252222129.git.sfking@fdwdc.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: uclinux-dev@uclinux.org
Cc: gerg@snapgear.com, linux-m68k@lists.linux-m68k.org

---
 arch/m68k/kernel/time.c                            |  182 +-------------------
 arch/m68k/kernel/{time.c => time_mm.c}             |    0 
 .../kernel/time.c => m68k/kernel/time_no.c}        |    0 
 3 files changed, 4 insertions(+), 178 deletions(-)
 copy arch/m68k/kernel/{time.c => time_mm.c} (100%)
 copy arch/{m68knommu/kernel/time.c => m68k/kernel/time_no.c} (100%)

diff --git a/arch/m68k/kernel/time.c b/arch/m68k/kernel/time.c
index 54d9807..a5cf40c 100644
--- a/arch/m68k/kernel/time.c
+++ b/arch/m68k/kernel/time.c
@@ -1,179 +1,5 @@
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
- * as well as call the "do_timer()" routine every clocktick
- */
-static irqreturn_t timer_interrupt(int irq, void *dummy)
-{
-	do_timer(1);
-#ifndef CONFIG_SMP
-	update_process_times(user_mode(get_irq_regs()));
+#ifdef CONFIG_MMU
+#include "time_mm.c"
+#else
+#include "time_no.c"
 #endif
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
-void __init time_init(void)
-{
-	struct rtc_time time;
-
-	if (mach_hwclk) {
-		mach_hwclk(0, &time);
-
-		if ((time.tm_year += 1900) < 1970)
-			time.tm_year += 100;
-		xtime.tv_sec = mktime(time.tm_year, time.tm_mon, time.tm_mday,
-				      time.tm_hour, time.tm_min, time.tm_sec);
-		xtime.tv_nsec = 0;
-	}
-	wall_to_monotonic.tv_sec = -xtime.tv_sec;
-
-	mach_sched_init(timer_interrupt);
-}
-
-/*
- * This version of gettimeofday has near microsecond resolution.
- */
-void do_gettimeofday(struct timeval *tv)
-{
-	unsigned long flags;
-	unsigned long seq;
-	unsigned long usec, sec;
-	unsigned long max_ntp_tick = tick_usec - tickadj;
-
-	do {
-		seq = read_seqbegin_irqsave(&xtime_lock, flags);
-
-		usec = mach_gettimeoffset();
-
-		/*
-		 * If time_adjust is negative then NTP is slowing the clock
-		 * so make sure not to go into next possible interval.
-		 * Better to lose some accuracy than have time go backwards..
-		 */
-		if (unlikely(time_adjust < 0))
-			usec = min(usec, max_ntp_tick);
-
-		sec = xtime.tv_sec;
-		usec += xtime.tv_nsec/1000;
-	} while (read_seqretry_irqrestore(&xtime_lock, seq, flags));
-
-
-	while (usec >= 1000000) {
-		usec -= 1000000;
-		sec++;
-	}
-
-	tv->tv_sec = sec;
-	tv->tv_usec = usec;
-}
-
-EXPORT_SYMBOL(do_gettimeofday);
-
-int do_settimeofday(struct timespec *tv)
-{
-	time_t wtm_sec, sec = tv->tv_sec;
-	long wtm_nsec, nsec = tv->tv_nsec;
-
-	if ((unsigned long)tv->tv_nsec >= NSEC_PER_SEC)
-		return -EINVAL;
-
-	write_seqlock_irq(&xtime_lock);
-	/* This is revolting. We need to set the xtime.tv_nsec
-	 * correctly. However, the value in this location is
-	 * is value at the last tick.
-	 * Discover what correction gettimeofday
-	 * would have done, and then undo it!
-	 */
-	nsec -= 1000 * mach_gettimeoffset();
-
-	wtm_sec  = wall_to_monotonic.tv_sec + (xtime.tv_sec - sec);
-	wtm_nsec = wall_to_monotonic.tv_nsec + (xtime.tv_nsec - nsec);
-
-	set_normalized_timespec(&xtime, sec, nsec);
-	set_normalized_timespec(&wall_to_monotonic, wtm_sec, wtm_nsec);
-
-	ntp_clear();
-	write_sequnlock_irq(&xtime_lock);
-	clock_was_set();
-	return 0;
-}
-
-EXPORT_SYMBOL(do_settimeofday);
-
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
diff --git a/arch/m68k/kernel/time.c b/arch/m68k/kernel/time_mm.c
similarity index 100%
copy from arch/m68k/kernel/time.c
copy to arch/m68k/kernel/time_mm.c
diff --git a/arch/m68knommu/kernel/time.c b/arch/m68k/kernel/time_no.c
similarity index 100%
copy from arch/m68knommu/kernel/time.c
copy to arch/m68k/kernel/time_no.c
-- 
1.5.6.5

