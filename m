From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 4.4 133/137] timerfd: Handle relative timers with CONFIG_TIME_LOW_RES proper
Date: Tue, 23 Feb 2016 19:34:24 -0800
Message-ID: <20160224033421.623897691__45500.4285941415$1456288270$gmane$org@linuxfoundation.org>
References: <20160224033417.270530882@linuxfoundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <20160224033417.270530882@linuxfoundation.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Peter Zijlstra <peterz@infradead.org>, John Stultz <john.stultz@linaro.org>, linux-m68k@lists.linux-m68k.org, dhowells@redhat.com

4.4-stable review patch.  If anyone has any objections, please let me know.

------------------

From: Thomas Gleixner <tglx@linutronix.de>

commit b62526ed11a1fe3861ab98d40b7fdab8981d788a upstream.

Helge reported that a relative timer can return a remaining time larger than
the programmed relative time on parisc and other architectures which have
CONFIG_TIME_LOW_RES set. This happens because we add a jiffie to the resulting
expiry time to prevent short timeouts.

Use the new function hrtimer_expires_remaining_adjusted() to calculate the
remaining time. It takes that extra added time into account for relative
timers.

Reported-and-tested-by: Helge Deller <deller@gmx.de>
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: John Stultz <john.stultz@linaro.org>
Cc: linux-m68k@lists.linux-m68k.org
Cc: dhowells@redhat.com
Link: http://lkml.kernel.org/r/20160114164159.354500742@linutronix.de
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

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
