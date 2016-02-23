From: Ben Hutchings <ben@decadent.org.uk>
Subject: [PATCH 3.2 03/67] timerfd: Handle relative timers with
 CONFIG_TIME_LOW_RES proper
Date: Tue, 23 Feb 2016 21:42:03 +0000
Message-ID: <lsq.1456263723.980860943__15672.6415538744$1456265188$gmane$org@decadent.org.uk>
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
Cc: akpm@linux-foundation.org, Peter Zijlstra <peterz@infradead.org>, linux-m68k@lists.linux-m68k.org, dhowells@redhat.com, Thomas Gleixner <tglx@linutronix.de>, John Stultz <john.stultz@linaro.org>

3.2.78-rc1 review patch.  If anyone has any objections, please let me know.

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
[bwh: Backported to 3.2: adjust context]
Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
---
 fs/timerfd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- a/fs/timerfd.c
+++ b/fs/timerfd.c
@@ -123,7 +123,7 @@ static ktime_t timerfd_get_remaining(str
 {
 	ktime_t remaining;
 
-	remaining = hrtimer_expires_remaining(&ctx->tmr);
+	remaining = hrtimer_expires_remaining_adjusted(&ctx->tmr);
 	return remaining.tv64 < 0 ? ktime_set(0, 0): remaining;
 }
 
