From: Ben Hutchings <ben@decadent.org.uk>
Subject: [PATCH 3.2 05/67] itimers: Handle relative timers with
 CONFIG_TIME_LOW_RES proper
Date: Tue, 23 Feb 2016 21:42:03 +0000
Message-ID: <lsq.1456263723.703762025__42421.5984800414$1456265315$gmane$org@decadent.org.uk>
References: <lsq.1456263722.390955919@decadent.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <lsq.1456263722.390955919@decadent.org.uk>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc: akpm@linux-foundation.org, dhowells@redhat.com, linux-m68k@lists.linux-m68k.org, Peter Zijlstra <peterz@infradead.org>, Helge Deller <deller@gmx.de>, John Stultz <john.stultz@linaro.org>, Thomas Gleixner <tglx@linutronix.de>

3.2.78-rc1 review patch.  If anyone has any objections, please let me know.

------------------

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
[bwh: Backported to 3.2: adjust filename]
Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
---
 kernel/itimer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- a/kernel/itimer.c
+++ b/kernel/itimer.c
@@ -26,7 +26,7 @@
  */
 static struct timeval itimer_get_remtime(struct hrtimer *timer)
 {
-	ktime_t rem = hrtimer_get_remaining(timer);
+	ktime_t rem = __hrtimer_get_remaining(timer, true);
 
 	/*
 	 * Racy but safe: if the itimer expires after the above
