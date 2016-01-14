From: Thomas Gleixner <tglx@linutronix.de>
Subject: [patch 3/4] posix-timers: Handle relative timers with
 CONFIG_TIME_LOW_RES proper
Date: Thu, 14 Jan 2016 16:54:47 -0000
Message-ID: <20160114164159.450510905@linutronix.de>
References: <20160114163744.582215466@linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Return-path: <linux-m68k-owner@vger.kernel.org>
Content-Disposition: inline;
 filename=posix-timers--Handle-relative-timers-with-CONFIG_TIME_LOW_RES-proper.patch
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: LKML <linux-kernel@vger.kernel.org>
Cc: Ingo Molnar <mingo@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Helge Deller <deller@gmx.de>, John Stultz <john.stultz@linaro.org>, linux-m68k@lists.linux-m68k.org, dhowells@redhat.com

As Helge reported for timerfd we have the same issue in posix timers. We
return remaining time larger than the programmed relative time to user space
in case of CONFIG_TIME_LOW_RES=y. Use the proper function to adjust the extra
time added in hrtimer_start_range_ns().

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
 kernel/time/posix-timers.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- a/kernel/time/posix-timers.c
+++ b/kernel/time/posix-timers.c
@@ -760,7 +760,7 @@ common_timer_get(struct k_itimer *timr,
 	    (timr->it_sigev_notify & ~SIGEV_THREAD_ID) == SIGEV_NONE))
 		timr->it_overrun += (unsigned int) hrtimer_forward(timer, now, iv);
 
-	remaining = ktime_sub(hrtimer_get_expires(timer), now);
+	remaining = __hrtimer_expires_remaining_adjusted(timer, now);
 	/* Return 0 only, when the timer is expired and not pending */
 	if (remaining.tv64 <= 0) {
 		/*
