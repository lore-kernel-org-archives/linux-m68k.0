From: Kamal Mostafa <kamal@canonical.com>
Subject: [4.2.y-ckt stable] Patch "itimers: Handle relative timers with CONFIG_TIME_LOW_RES proper" has been added to the 4.2.y-ckt tree
Date: Thu,  4 Feb 2016 14:10:35 -0800
Message-ID: <1454623835-8660-1-git-send-email-kamal@canonical.com>
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Peter Zijlstra <peterz@infradead.org>, Helge Deller <deller@gmx.de>, John Stultz <john.stultz@linaro.org>, linux-m68k@lists.linux-m68k.org, dhowells@redhat.com, Kamal Mostafa <kamal@canonical.com>, kernel-team@lists.ubuntu.com

This is a note to let you know that I have just added a patch titled

    itimers: Handle relative timers with CONFIG_TIME_LOW_RES proper

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

>From f2c55ba9987da96a6b3d5ed74eb6e1890b8c0f7c Mon Sep 17 00:00:00 2001
From: Thomas Gleixner <tglx@linutronix.de>
Date: Thu, 14 Jan 2016 16:54:48 +0000
Subject: itimers: Handle relative timers with CONFIG_TIME_LOW_RES proper

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
Signed-off-by: Kamal Mostafa <kamal@canonical.com>
---
 kernel/time/itimer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/time/itimer.c b/kernel/time/itimer.c
index 8d262b4..1d5c720 100644
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
--
1.9.1
