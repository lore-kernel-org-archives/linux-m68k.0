From: Kamal Mostafa <kamal@canonical.com>
Subject: [PATCH 4.2.y-ckt 16/64] itimers: Handle relative timers with CONFIG_TIME_LOW_RES proper
Date: Thu,  4 Feb 2016 14:43:59 -0800
Message-ID: <1454625887-18915-17-git-send-email-kamal@canonical.com>
References: <1454625887-18915-1-git-send-email-kamal@canonical.com>
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1454625887-18915-1-git-send-email-kamal@canonical.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org, kernel-team@lists.ubuntu.com
Cc: Thomas Gleixner <tglx@linutronix.de>, Peter Zijlstra <peterz@infradead.org>, Helge Deller <deller@gmx.de>, John Stultz <john.stultz@linaro.org>, linux-m68k@lists.linux-m68k.org, dhowells@redhat.com, Kamal Mostafa <kamal@canonical.com>

4.2.8-ckt4 -stable review patch.  If anyone has any objections, please let me know.

---8<------------------------------------------------------------

From: Thomas Gleixner <tglx@linutronix.de>

commit 51cbb5242a41700a3f250ecfb48dcfb7e4375ea4 upstream.

As Helge reported for timerfd we have the same issue in itimers. We return
remaining time larger than the programmed relative time to user space in case
of CONFIG_TIME_LOW_RES=y. Use the proper function to adjust the extra time
added in hrtimer_start_range_ns().

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Helge Deller <deller@gmx.de>
Cc: John Stultz <john.stultz@linaro.org>
Cc: linux-m68k@lists.linux-m68k.org
Cc: dhowells@redhat.com
Link: http://lkml.kernel.org/r/20160114164159.528222587@linutronix.de
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: Kamal Mostafa <kamal@canonical.com>
---
 kernel/time/itimer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/time/itimer.c b/kernel/time/itimer.c
index 8d262b4..1d5c720 100644
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
-- 
1.9.1
