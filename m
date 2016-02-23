From: Ben Hutchings <ben@decadent.org.uk>
Subject: [PATCH 3.2 04/67] posix-timers: Handle relative timers with
 CONFIG_TIME_LOW_RES proper
Date: Tue, 23 Feb 2016 21:42:03 +0000
Message-ID: <lsq.1456263723.184636852__35095.0140193619$1456265144$gmane$org@decadent.org.uk>
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
Cc: akpm@linux-foundation.org, Thomas Gleixner <tglx@linutronix.de>, Helge Deller <deller@gmx.de>, John Stultz <john.stultz@linaro.org>, Peter Zijlstra <peterz@infradead.org>, linux-m68k@lists.linux-m68k.org, dhowells@redhat.com

3.2.78-rc1 review patch.  If anyone has any objections, please let me know.

------------------

From: Thomas Gleixner <tglx@linutronix.de>

commit 572c39172684c3711e4a03c9a7380067e2b0661c upstream.

As Helge reported for timerfd we have the same issue in posix timers. We
return remaining time larger than the programmed relative time to user space
in case of CONFIG_TIME_LOW_RES=y. Use the proper function to adjust the extra
time added in hrtimer_start_range_ns().

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Helge Deller <deller@gmx.de>
Cc: John Stultz <john.stultz@linaro.org>
Cc: linux-m68k@lists.linux-m68k.org
Cc: dhowells@redhat.com
Link: http://lkml.kernel.org/r/20160114164159.450510905@linutronix.de
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
[bwh: Backported to 3.2: adjust filename]
Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
---
 kernel/posix-timers.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- a/kernel/posix-timers.c
+++ b/kernel/posix-timers.c
@@ -706,7 +706,7 @@ common_timer_get(struct k_itimer *timr,
 	    (timr->it_sigev_notify & ~SIGEV_THREAD_ID) == SIGEV_NONE))
 		timr->it_overrun += (unsigned int) hrtimer_forward(timer, now, iv);
 
-	remaining = ktime_sub(hrtimer_get_expires(timer), now);
+	remaining = __hrtimer_expires_remaining_adjusted(timer, now);
 	/* Return 0 only, when the timer is expired and not pending */
 	if (remaining.tv64 <= 0) {
 		/*
