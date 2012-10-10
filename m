From: <gregkh@linuxfoundation.org>
Subject: Patch "m68k: Add missing RCU idle APIs on idle loop" has been added to the 3.5-stable tree
Date: Wed, 10 Oct 2012 09:25:16 +0900
Message-ID: <13498287161081@kroah.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ASCII
Content-Transfer-Encoding: 8bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: fweisbec@gmail.com, geert@linux-m68k.org, gregkh@linuxfoundation.org, josh@joshtriplett.org, linux-m68k@lists.linux-m68k.org, paulmck@linux.vnet.ibm.com
Cc: stable@vger.kernel.org, stable-commits@vger.kernel.org


This is a note to let you know that I've just added the patch titled

    m68k: Add missing RCU idle APIs on idle loop

to the 3.5-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     m68k-add-missing-rcu-idle-apis-on-idle-loop.patch
and it can be found in the queue-3.5 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


>From 5b57ba37e82a15f345a6a2eb8c01a2b2d94c5eeb Mon Sep 17 00:00:00 2001
From: Frederic Weisbecker <fweisbec@gmail.com>
Date: Wed, 22 Aug 2012 17:27:34 +0200
Subject: m68k: Add missing RCU idle APIs on idle loop

From: Frederic Weisbecker <fweisbec@gmail.com>

commit 5b57ba37e82a15f345a6a2eb8c01a2b2d94c5eeb upstream.

In the old times, the whole idle task was considered
as an RCU quiescent state. But as RCU became more and
more successful overtime, some RCU read side critical
section have been added even in the code of some
architectures idle tasks, for tracing for example.

So nowadays, rcu_idle_enter() and rcu_idle_exit() must
be called by the architecture to tell RCU about the part
in the idle loop that doesn't make use of rcu read side
critical sections, typically the part that puts the CPU
in low power mode.

This is necessary for RCU to find the quiescent states in
idle in order to complete grace periods.

Add this missing pair of calls in the m68k's idle loop.

Reported-by: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
Signed-off-by: Frederic Weisbecker <fweisbec@gmail.com>
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: m68k <linux-m68k@lists.linux-m68k.org>
Signed-off-by: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
Reviewed-by: Josh Triplett <josh@joshtriplett.org>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

---
 arch/m68k/kernel/process.c |    3 +++
 1 file changed, 3 insertions(+)

--- a/arch/m68k/kernel/process.c
+++ b/arch/m68k/kernel/process.c
@@ -25,6 +25,7 @@
 #include <linux/reboot.h>
 #include <linux/init_task.h>
 #include <linux/mqueue.h>
+#include <linux/rcupdate.h>
 
 #include <asm/uaccess.h>
 #include <asm/traps.h>
@@ -75,8 +76,10 @@ void cpu_idle(void)
 {
 	/* endless idle loop with no priority at all */
 	while (1) {
+		rcu_idle_enter();
 		while (!need_resched())
 			idle();
+		rcu_idle_exit();
 		schedule_preempt_disabled();
 	}
 }


Patches currently in stable-queue which might be from fweisbec@gmail.com are

queue-3.5/frv-add-missing-rcu-idle-apis-on-idle-loop.patch
queue-3.5/cris-add-missing-rcu-idle-apis-on-idle-loop.patch
queue-3.5/m68k-add-missing-rcu-idle-apis-on-idle-loop.patch
queue-3.5/alpha-add-missing-rcu-idle-apis-on-idle-loop.patch
queue-3.5/h8300-add-missing-rcu-idle-apis-on-idle-loop.patch
queue-3.5/parisc-add-missing-rcu-idle-apis-on-idle-loop.patch
queue-3.5/m32r-add-missing-rcu-idle-apis-on-idle-loop.patch
queue-3.5/score-add-missing-rcu-idle-apis-on-idle-loop.patch
queue-3.5/mn10300-add-missing-rcu-idle-apis-on-idle-loop.patch
queue-3.5/xtensa-add-missing-rcu-idle-apis-on-idle-loop.patch
