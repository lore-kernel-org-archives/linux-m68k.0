From: Thomas Gleixner <tglx@linutronix.de>
Subject: [patch 2/4] timerfd: Handle relative timers with CONFIG_TIME_LOW_RES
 proper
Date: Thu, 14 Jan 2016 16:54:46 -0000
Message-ID: <20160114164159.354500742__5810.64882358095$1452790579$gmane$org@linutronix.de>
References: <20160114163744.582215466@linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Return-path: <linux-m68k-owner@vger.kernel.org>
Content-Disposition: inline;
 filename=timerfd--Handle-relative-timers-with-CONFIG_TIME_LOW_RES-proper.patch
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: LKML <linux-kernel@vger.kernel.org>
Cc: Ingo Molnar <mingo@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Helge Deller <deller@gmx.de>, John Stultz <john.stultz@linaro.org>, linux-m68k@lists.linux-m68k.org, dhowells@redhat.com

Helge reported that a relative timer can return a remaining time larger than
the programmed relative time on parisc and other architectures which have
CONFIG_TIME_LOW_RES set. This happens because we add a jiffie to the resulting
expiry time to prevent short timeouts.

Use the new function hrtimer_expires_remaining_adjusted() to calculate the
remaining time. It takes that extra added time into account for relative
timers.

Reported-by: Helge Deller <deller@gmx.de>
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
 fs/timerfd.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- a/fs/timerfd.c
+++ b/fs/timerfd.c
@@ -153,7 +153,7 @@ static ktime_t timerfd_get_remaining(str
 	if (isalarm(ctx))
 		remaining = alarm_expires_remaining(&ctx->t.alarm);
 	else
-		remaining = hrtimer_expires_remaining(&ctx->t.tmr);
+		remaining = hrtimer_expires_remaining_adjusted(&ctx->t.tmr);
 
 	return remaining.tv64 < 0 ? ktime_set(0, 0): remaining;
 }
