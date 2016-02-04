From: Kamal Mostafa <kamal@canonical.com>
Subject: [PATCH 4.2.y-ckt 14/64] timerfd: Handle relative timers with CONFIG_TIME_LOW_RES proper
Date: Thu,  4 Feb 2016 14:43:57 -0800
Message-ID: <1454625887-18915-15-git-send-email-kamal__30029.2905922563$1454627169$gmane$org@canonical.com>
References: <1454625887-18915-1-git-send-email-kamal@canonical.com>
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1454625887-18915-1-git-send-email-kamal@canonical.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org, kernel-team@lists.ubuntu.com
Cc: Thomas Gleixner <tglx@linutronix.de>, Peter Zijlstra <peterz@infradead.org>, John Stultz <john.stultz@linaro.org>, linux-m68k@lists.linux-m68k.org, dhowells@redhat.com, Kamal Mostafa <kamal@canonical.com>

4.2.8-ckt4 -stable review patch.  If anyone has any objections, please let me know.

---8<------------------------------------------------------------

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
Signed-off-by: Kamal Mostafa <kamal@canonical.com>
---
 fs/timerfd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/timerfd.c b/fs/timerfd.c
index b94fa6c..053818d 100644
--- a/fs/timerfd.c
+++ b/fs/timerfd.c
@@ -153,7 +153,7 @@ static ktime_t timerfd_get_remaining(struct timerfd_ctx *ctx)
 	if (isalarm(ctx))
 		remaining = alarm_expires_remaining(&ctx->t.alarm);
 	else
-		remaining = hrtimer_expires_remaining(&ctx->t.tmr);
+		remaining = hrtimer_expires_remaining_adjusted(&ctx->t.tmr);
 
 	return remaining.tv64 < 0 ? ktime_set(0, 0): remaining;
 }
-- 
1.9.1
