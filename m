From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 4.4 135/137] itimers: Handle relative timers with CONFIG_TIME_LOW_RES proper
Date: Tue, 23 Feb 2016 19:34:26 -0800
Message-ID: <20160224033421.692692620__41270.5634058968$1456288236$gmane$org@linuxfoundation.org>
References: <20160224033417.270530882@linuxfoundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <20160224033417.270530882@linuxfoundation.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Peter Zijlstra <peterz@infradead.org>, Helge Deller <deller@gmx.de>, John Stultz <john.stultz@linaro.org>, linux-m68k@lists.linux-m68k.org, dhowells@redhat.com

4.4-stable review patch.  If anyone has any objections, please let me know.

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
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

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
