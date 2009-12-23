From: john stultz <johnstul@us.ibm.com>
Subject: [RFC][PATCH 10/14] Convert m68k to read/update_persistent_clock
Date: Tue, 22 Dec 2009 20:11:31 -0800
Message-ID: <1261541491.3508.72.camel@localhost.localdomain>
References: <1261540762.3508.61.camel@localhost.localdomain>
	 <1261540826.3508.62.camel@localhost.localdomain>
	 <1261540902.3508.63.camel@localhost.localdomain>
	 <1261540988.3508.64.camel@localhost.localdomain>
	 <1261541054.3508.65.camel@localhost.localdomain>
	 <1261541130.3508.66.camel@localhost.localdomain>
	 <1261541188.3508.67.camel@localhost.localdomain>
	 <1261541286.3508.69.camel@localhost.localdomain>
	 <1261541342.3508.70.camel@localhost.localdomain>
	 <1261541415.3508.71.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1261541415.3508.71.camel@localhost.localdomain>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: lkml <linux-kernel@vger.kernel.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@lists.linux-m68k.org

This patch converts the m68k architecture to use the generic
read_persistent_clock and update_persistent_clock interfaces, reducing
the amount of arch specific code we have to maintain, and allowing for
further cleanups in the future.

I have not built or tested this patch, so help from arch maintainers
would be appreciated.

Signed-off-by: John Stultz <johnstul@us.ibm.com>
---
 time.c |   11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)


Index: gettimeoffset/arch/m68k/kernel/time.c
===================================================================
--- gettimeoffset.orig/arch/m68k/kernel/time.c	2009-12-22 18:50:54.000000000 -0800
+++ gettimeoffset/arch/m68k/kernel/time.c	2009-12-22 18:51:18.000000000 -0800
@@ -73,21 +73,24 @@ static irqreturn_t timer_interrupt(int i
 	return IRQ_HANDLED;
 }
 
-void __init time_init(void)
+void read_persistent_clock(struct timespec *ts)
 {
 	struct rtc_time time;
+	ts->tv_sec = 0;
+	ts->tv_nsec = 0;
 
 	if (mach_hwclk) {
 		mach_hwclk(0, &time);
 
 		if ((time.tm_year += 1900) < 1970)
 			time.tm_year += 100;
-		xtime.tv_sec = mktime(time.tm_year, time.tm_mon, time.tm_mday,
+		ts->tv_sec = mktime(time.tm_year, time.tm_mon, time.tm_mday,
 				      time.tm_hour, time.tm_min, time.tm_sec);
-		xtime.tv_nsec = 0;
 	}
-	wall_to_monotonic.tv_sec = -xtime.tv_sec;
+}
 
+void __init time_init(void)
+{
 	mach_sched_init(timer_interrupt);
 }
 
