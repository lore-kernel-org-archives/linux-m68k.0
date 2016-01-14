From: Thomas Gleixner <tglx@linutronix.de>
Subject: [patch 4/4] itimers: Handle relative timers with CONFIG_TIME_LOW_RES
 proper
Date: Thu, 14 Jan 2016 16:54:48 -0000
Message-ID: <20160114164159.528222587__22932.5709901334$1452790599$gmane$org@linutronix.de>
References: <20160114163744.582215466@linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Return-path: <linux-m68k-owner@vger.kernel.org>
Content-Disposition: inline;
 filename=itimers--Handle-relative-timers-with-CONFIG_TIME_LOW_RES-proper.patch
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: LKML <linux-kernel@vger.kernel.org>
Cc: Ingo Molnar <mingo@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Helge Deller <deller@gmx.de>, John Stultz <john.stultz@linaro.org>, linux-m68k@lists.linux-m68k.org, dhowells@redhat.com

As Helge reported for timerfd we have the same issue in itimers. We return
remaining time larger than the programmed relative time to user space in case
of CONFIG_TIME_LOW_RES=y. Use the proper function to adjust the extra time
added in hrtimer_start_range_ns().

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
 kernel/time/itimer.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- a/kernel/time/itimer.c
+++ b/kernel/time/itimer.c
@@ -26,7 +26,7 @@
  */
 static struct timeval itimer_get_remtime(struct hrtimer *timer)
 {
-	ktime_t rem = hrtimer_get_remaining(timer);
+	ktime_t rem = __hrtimer_get_remaining(timer, true);
 
 	/*
 	 * Racy but safe: if the itimer expires after the above
