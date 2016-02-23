From: Ben Hutchings <ben@decadent.org.uk>
Subject: [PATCH 3.2 02/67] hrtimer: Handle remaining time proper for
 TIME_LOW_RES
Date: Tue, 23 Feb 2016 21:42:03 +0000
Message-ID: <lsq.1456263723.362668490__38470.1787880205$1456265156$gmane$org@decadent.org.uk>
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
Cc: akpm@linux-foundation.org, John Stultz <john.stultz@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, dhowells@redhat.com, linux-m68k@lists.linux-m68k.org, Peter Zijlstra <peterz@infradead.org>

3.2.78-rc1 review patch.  If anyone has any objections, please let me know.

------------------

From: Thomas Gleixner <tglx@linutronix.de>

commit 203cbf77de59fc8f13502dcfd11350c6d4a5c95f upstream.

If CONFIG_TIME_LOW_RES is enabled we add a jiffie to the relative timeout to
prevent short sleeps, but we do not account for that in interfaces which
retrieve the remaining time.

Helge observed that timerfd can return a remaining time larger than the
relative timeout. That's not expected and breaks userland test programs.

Store the information that the timer was armed relative and provide functions
to adjust the remaining time. To avoid bloating the hrtimer struct make state
a u8, which as a bonus results in better code on x86 at least.

Reported-and-tested-by: Helge Deller <deller@gmx.de>
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: John Stultz <john.stultz@linaro.org>
Cc: linux-m68k@lists.linux-m68k.org
Cc: dhowells@redhat.com
Link: http://lkml.kernel.org/r/20160114164159.273328486@linutronix.de
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
[bwh: Backported to 3.2:
 - Use #ifdef instead of IS_ENABLED() as that doesn't work for config
   symbols that don't exist on the current architecture
 - Use KTIME_LOW_RES directly instead of hrtimer_resolution
 - Use ktime_sub() instead of modifying ktime::tv64 directly
 - Adjust filename, context]
Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
---
 include/linux/hrtimer.h  | 34 +++++++++++++++++++++++++++---
 kernel/hrtimer.c         | 55 ++++++++++++++++++++++++++++++++----------------
 kernel/time/timer_list.c |  2 +-
 3 files changed, 69 insertions(+), 22 deletions(-)

--- a/include/linux/hrtimer.h
+++ b/include/linux/hrtimer.h
@@ -96,6 +96,7 @@ enum hrtimer_restart {
  * @function:	timer expiry callback function
  * @base:	pointer to the timer base (per cpu and per clock)
  * @state:	state information (See bit values above)
+ * @is_rel:	Set if the timer was armed relative
  * @start_site:	timer statistics field to store the site where the timer
  *		was started
  * @start_comm: timer statistics field to store the name of the process which
@@ -110,7 +111,8 @@ struct hrtimer {
 	ktime_t				_softexpires;
 	enum hrtimer_restart		(*function)(struct hrtimer *);
 	struct hrtimer_clock_base	*base;
-	unsigned long			state;
+	u8				state;
+	u8				is_rel;
 #ifdef CONFIG_TIMER_STATS
 	int				start_pid;
 	void				*start_site;
@@ -315,6 +317,29 @@ static inline void clock_was_set_delayed
 
 #endif
 
+static inline ktime_t
+__hrtimer_expires_remaining_adjusted(const struct hrtimer *timer, ktime_t now)
+{
+	ktime_t rem = ktime_sub(timer->node.expires, now);
+
+	/*
+	 * Adjust relative timers for the extra we added in
+	 * hrtimer_start_range_ns() to prevent short timeouts.
+	 */
+#ifdef CONFIG_TIME_LOW_RES
+	if (timer->is_rel)
+		rem = ktime_sub(rem, KTIME_LOW_RES);
+#endif
+	return rem;
+}
+
+static inline ktime_t
+hrtimer_expires_remaining_adjusted(const struct hrtimer *timer)
+{
+	return __hrtimer_expires_remaining_adjusted(timer,
+						    timer->base->get_time());
+}
+
 extern void clock_was_set(void);
 #ifdef CONFIG_TIMERFD
 extern void timerfd_clock_was_set(void);
@@ -383,7 +408,12 @@ static inline int hrtimer_restart(struct
 }
 
 /* Query timers: */
-extern ktime_t hrtimer_get_remaining(const struct hrtimer *timer);
+extern ktime_t __hrtimer_get_remaining(const struct hrtimer *timer, bool adjust);
+
+static inline ktime_t hrtimer_get_remaining(const struct hrtimer *timer)
+{
+	return __hrtimer_get_remaining(timer, false);
+}
 extern int hrtimer_get_res(const clockid_t which_clock, struct timespec *tp);
 
 extern ktime_t hrtimer_get_next_event(void);
--- a/kernel/hrtimer.c
+++ b/kernel/hrtimer.c
@@ -910,7 +910,7 @@ static int enqueue_hrtimer(struct hrtime
  */
 static void __remove_hrtimer(struct hrtimer *timer,
 			     struct hrtimer_clock_base *base,
-			     unsigned long newstate, int reprogram)
+			     u8 newstate, int reprogram)
 {
 	struct timerqueue_node *next_timer;
 	if (!(timer->state & HRTIMER_STATE_ENQUEUED))
@@ -944,7 +944,7 @@ static inline int
 remove_hrtimer(struct hrtimer *timer, struct hrtimer_clock_base *base)
 {
 	if (hrtimer_is_queued(timer)) {
-		unsigned long state;
+		u8 state;
 		int reprogram;
 
 		/*
@@ -970,6 +970,22 @@ remove_hrtimer(struct hrtimer *timer, st
 	return 0;
 }
 
+static inline ktime_t hrtimer_update_lowres(struct hrtimer *timer, ktime_t tim,
+					    const enum hrtimer_mode mode)
+{
+#ifdef CONFIG_TIME_LOW_RES
+	/*
+	 * CONFIG_TIME_LOW_RES indicates that the system has no way to return
+	 * granular time values. For relative timers we add KTIME_LOW_RES
+	 * (i.e. one jiffie) to prevent short timeouts.
+	 */
+	timer->is_rel = mode & HRTIMER_MODE_REL;
+	if (timer->is_rel)
+		tim = ktime_add_safe(tim, KTIME_LOW_RES);
+#endif
+	return tim;
+}
+
 int __hrtimer_start_range_ns(struct hrtimer *timer, ktime_t tim,
 		unsigned long delta_ns, const enum hrtimer_mode mode,
 		int wakeup)
@@ -983,19 +999,10 @@ int __hrtimer_start_range_ns(struct hrti
 	/* Remove an active timer from the queue: */
 	ret = remove_hrtimer(timer, base);
 
-	if (mode & HRTIMER_MODE_REL) {
+	if (mode & HRTIMER_MODE_REL)
 		tim = ktime_add_safe(tim, base->get_time());
-		/*
-		 * CONFIG_TIME_LOW_RES is a temporary way for architectures
-		 * to signal that they simply return xtime in
-		 * do_gettimeoffset(). In this case we want to round up by
-		 * resolution when starting a relative timer, to avoid short
-		 * timeouts. This will go away with the GTOD framework.
-		 */
-#ifdef CONFIG_TIME_LOW_RES
-		tim = ktime_add_safe(tim, base->resolution);
-#endif
-	}
+
+	tim = hrtimer_update_lowres(timer, tim, mode);
 
 	hrtimer_set_expires_range_ns(timer, tim, delta_ns);
 
@@ -1120,19 +1127,25 @@ EXPORT_SYMBOL_GPL(hrtimer_cancel);
 /**
  * hrtimer_get_remaining - get remaining time for the timer
  * @timer:	the timer to read
+ * @adjust:	adjust relative timers when CONFIG_TIME_LOW_RES=y
  */
-ktime_t hrtimer_get_remaining(const struct hrtimer *timer)
+ktime_t __hrtimer_get_remaining(const struct hrtimer *timer, bool adjust)
 {
 	unsigned long flags;
 	ktime_t rem;
 
 	lock_hrtimer_base(timer, &flags);
-	rem = hrtimer_expires_remaining(timer);
+#ifdef CONFIG_TIME_LOW_RES
+	if (adjust)
+		rem = hrtimer_expires_remaining_adjusted(timer);
+	else
+#endif
+		rem = hrtimer_expires_remaining(timer);
 	unlock_hrtimer_base(timer, &flags);
 
 	return rem;
 }
-EXPORT_SYMBOL_GPL(hrtimer_get_remaining);
+EXPORT_SYMBOL_GPL(__hrtimer_get_remaining);
 
 #ifdef CONFIG_NO_HZ
 /**
@@ -1249,6 +1262,15 @@ static void __run_hrtimer(struct hrtimer
 	fn = timer->function;
 
 	/*
+	 * Clear the 'is relative' flag for the TIME_LOW_RES case. If the
+	 * timer is restarted with a period then it becomes an absolute
+	 * timer. If its not restarted it does not matter.
+	 */
+#ifdef CONFIG_TIME_LOW_RES
+	timer->is_rel = false;
+#endif
+
+	/*
 	 * Because we run timers from hardirq context, there is no chance
 	 * they get migrated to another cpu, therefore its safe to unlock
 	 * the timer base.
--- a/kernel/time/timer_list.c
+++ b/kernel/time/timer_list.c
@@ -57,7 +57,7 @@ print_timer(struct seq_file *m, struct h
 	print_name_offset(m, taddr);
 	SEQ_printf(m, ", ");
 	print_name_offset(m, timer->function);
-	SEQ_printf(m, ", S:%02lx", timer->state);
+	SEQ_printf(m, ", S:%02x", timer->state);
 #ifdef CONFIG_TIMER_STATS
 	SEQ_printf(m, ", ");
 	print_name_offset(m, timer->start_site);
