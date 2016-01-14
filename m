From: Thomas Gleixner <tglx@linutronix.de>
Subject: [patch 0/4] hrtimers: Handle remaining time correctly for
 CONFIG_TIME_LOW_RES=y
Date: Thu, 14 Jan 2016 16:54:45 -0000
Message-ID: <20160114163744.582215466@linutronix.de>
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: LKML <linux-kernel@vger.kernel.org>
Cc: Ingo Molnar <mingo@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Helge Deller <deller@gmx.de>, John Stultz <john.stultz@linaro.org>, linux-m68k@lists.linux-m68k.org, dhowells@redhat.com

Helge reported, that timerfd returns occasionally remaining time larger than
the relative time which was used to arm the timer. This is caused by the extra
jiffy which we add in hrtimer_start_range_ns() if CONFIG_TIME_LOW_RES=y.

This is not only an issue for timerfd. We have the same problem in
posix-timers and itimers.

This series adds infrastructure to the core to handle that cases and converts
the users over to it.

Thanks,

	tglx
---
 fs/timerfd.c               |    2 -
 include/linux/hrtimer.h    |   34 +++++++++++++++++++++++++--
 kernel/time/hrtimer.c      |   55 ++++++++++++++++++++++++++++++---------------
 kernel/time/itimer.c       |    2 -
 kernel/time/posix-timers.c |    2 -
 kernel/time/timer_list.c   |    2 -
 6 files changed, 72 insertions(+), 25 deletions(-)
