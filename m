From: Kamal Mostafa <kamal@canonical.com>
Subject: [4.2.y-ckt stable] Patch "posix-timers: Handle relative timers with CONFIG_TIME_LOW_RES proper" has been added to the 4.2.y-ckt tree
Date: Thu,  4 Feb 2016 14:10:33 -0800
Message-ID: <1454623833-8610-1-git-send-email-kamal@canonical.com>
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Peter Zijlstra <peterz@infradead.org>, Helge Deller <deller@gmx.de>, John Stultz <john.stultz@linaro.org>, linux-m68k@lists.linux-m68k.org, dhowells@redhat.com, Kamal Mostafa <kamal@canonical.com>, kernel-team@lists.ubuntu.com

This is a note to let you know that I have just added a patch titled

    posix-timers: Handle relative timers with CONFIG_TIME_LOW_RES proper

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

>From b922fc5f79535400d0bedc7c36e14f392d250e83 Mon Sep 17 00:00:00 2001
From: Thomas Gleixner <tglx@linutronix.de>
Date: Thu, 14 Jan 2016 16:54:47 +0000
Subject: posix-timers: Handle relative timers with CONFIG_TIME_LOW_RES proper

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
Signed-off-by: Kamal Mostafa <kamal@canonical.com>
---
 kernel/time/posix-timers.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/time/posix-timers.c b/kernel/time/posix-timers.c
index 31d11ac..f2826c3 100644
--- a/kernel/time/posix-timers.c
+++ b/kernel/time/posix-timers.c
@@ -760,7 +760,7 @@ common_timer_get(struct k_itimer *timr, struct itimerspec *cur_setting)
 	    (timr->it_sigev_notify & ~SIGEV_THREAD_ID) == SIGEV_NONE))
 		timr->it_overrun += (unsigned int) hrtimer_forward(timer, now, iv);

-	remaining = ktime_sub(hrtimer_get_expires(timer), now);
+	remaining = __hrtimer_expires_remaining_adjusted(timer, now);
 	/* Return 0 only, when the timer is expired and not pending */
 	if (remaining.tv64 <= 0) {
 		/*
--
1.9.1
