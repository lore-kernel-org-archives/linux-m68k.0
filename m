From: Kamal Mostafa <kamal@canonical.com>
Subject: [4.2.y-ckt stable] Patch "timerfd: Handle relative timers with CONFIG_TIME_LOW_RES proper" has been added to the 4.2.y-ckt tree
Date: Thu,  4 Feb 2016 14:10:32 -0800
Message-ID: <1454623832-8569-1-git-send-email-kamal@canonical.com>
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Peter Zijlstra <peterz@infradead.org>, John Stultz <john.stultz@linaro.org>, linux-m68k@lists.linux-m68k.org, dhowells@redhat.com, Kamal Mostafa <kamal@canonical.com>, kernel-team@lists.ubuntu.com

This is a note to let you know that I have just added a patch titled

    timerfd: Handle relative timers with CONFIG_TIME_LOW_RES proper

to the linux-4.2.y-queue branch of the 4.2.y-ckt extended stable tree 
which can be found at:

    http://kernel.ubuntu.com/git/ubuntu/linux.git/log/?h=linux-4.2.y-queue

This patch is scheduled to be released in version 4.2.8-ckt4.

If you, or anyone else, feels it should not be added to this tree, please 
reply to this email.

For more information about the 4.2.y-ckt tree, see
https://wiki.ubuntu.com/Kernel/Dev/ExtendedStable

Thanks.
-Kamal

---8<------------------------------------------------------------

>From 29fa3c106967ccf964baa80b84eae2e4c4690d5d Mon Sep 17 00:00:00 2001
From: Thomas Gleixner <tglx@linutronix.de>
Date: Thu, 14 Jan 2016 16:54:46 +0000
Subject: timerfd: Handle relative timers with CONFIG_TIME_LOW_RES proper

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
