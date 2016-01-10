From: Helge Deller <deller@gmx.de>
Subject: [PATCH parisc,frv,m68k] timerfd: Fix timeout values with
 CONFIG_TIME_LOW_RES=y
Date: Sun, 10 Jan 2016 21:57:39 +0100
Message-ID: <20160110205739.GA21713@p100.box>
References: <20160104222757.GA969@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160104222757.GA969@p100.box>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-parisc@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, linux-m68k@lists.linux-m68k.org, dhowells@redhat.com, linux-kernel@vger.kernel.org

On architectures where CONFIG_TIME_LOW_RES is set (currently parisc,
m68k, frv) calling timerfd_settime() to set a timeout and directly
afterwards calling timerfd_gettime() to get the remaining time shows a
behaviour that the remaining time can be higher than the originally set
timeout.

Here is an example showing the problem, that the nsec value of it_value
is higher than the set nsec value: 
  timerfd_settime: interval (sec=0, nsec=100000000) it_value (sec=0, nsec=100000000) 
  timerfd_gettime: interval (sec=0, nsec=100000000) it_value (sec=0, nsec=103029949) 

This happens because in hrtimer_start_range_ns() the expiry time is
rounded to the next jiffies period to avoid short timeouts. When running
with HZ=250 this is 4ms which can be seen in the example above.

This behaviour confuses userspace programs. For example, the debian
liblinux-fd-perl and libnanomsg-raw-perl packges fail to build because
the timeout is higher than expected.

Fix this problem by subtracting the value added by
hrtimer_start_range_ns() before returning the timeout back to userspace.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/fs/timerfd.c b/fs/timerfd.c
index b94fa6c..098ac0a 100644
--- a/fs/timerfd.c
+++ b/fs/timerfd.c
@@ -152,8 +152,17 @@ static ktime_t timerfd_get_remaining(struct timerfd_ctx *ctx)
 
 	if (isalarm(ctx))
 		remaining = alarm_expires_remaining(&ctx->t.alarm);
-	else
+	else {
 		remaining = hrtimer_expires_remaining(&ctx->t.tmr);
+#ifdef CONFIG_TIME_LOW_RES
+		/* Expiry time was rounded up in hrtimer_start_range_ns()
+		 * to the next jiffies period to avoid short timeouts.
+		 * Subtract it here again to avoid userspace seeing higher
+		 * values than originally programmed. */
+		if (!(ctx->settime_flags & TFD_TIMER_ABSTIME))
+			remaining.tv64 -= hrtimer_resolution;
+#endif
+	}
 
 	return remaining.tv64 < 0 ? ktime_set(0, 0): remaining;
 }
