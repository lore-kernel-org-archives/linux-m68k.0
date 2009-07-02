From: Lanttor <lanttor.guo@freescale.com>
Subject: Interrupt issue on m68k platform and some fix
Date: Thu, 02 Jul 2009 12:07:03 +0800
Message-ID: <4A4C3267.2040705@freescale.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------050303040904090400040501"
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from az33egw02.freescale.net ([192.88.158.103]:43266 "EHLO
	az33egw02.freescale.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750822AbZGBEG1 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 2 Jul 2009 00:06:27 -0400
Received: from de01smr01.freescale.net (de01smr01.freescale.net [10.208.0.31])
	by az33egw02.freescale.net (8.14.3/az33egw02) with ESMTP id n6246RdV016574
	for <linux-m68k@vger.kernel.org>; Wed, 1 Jul 2009 21:06:28 -0700 (MST)
Received: from zch01exm25.fsl.freescale.net (zch01exm25.ap.freescale.net [10.192.129.217])
	by de01smr01.freescale.net (8.13.1/8.13.0) with ESMTP id n6246PFI016805
	for <linux-m68k@vger.kernel.org>; Wed, 1 Jul 2009 23:06:26 -0500 (CDT)
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org
Cc: uClinux development list <uclinux-dev@uclinux.org>

This is a multi-part message in MIME format.
--------------050303040904090400040501
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi,

I find one interrupt issue on my coldfire platform on linux-2.6.29
version (mcf54451evb board, mmu, NFS as rootfs).

After system boot up, I do following test:
on target board, run command: nc -l -p 3333 > /dev/null &
on host PC, run command: dd if=/dev/zero | nc 10.192.208.230 (target ip)
3333

and then I run top command on target board to check, which is shown as
follows:
CPU:  0.5% usr  0.0% sys  0.0% nice  0.0% idle  0.0% io 99.4% irq  0.0%
softirq
Load average: 0.39 0.10 0.03
  PID  PPID USER     STAT   VSZ %MEM %CPU COMMAND
  502   498 root     R     2560  2.0 97.8 nc -l -p 3333
    3     2 root     SW<      0  0.0  1.3 [ksoftirqd/0]
  503   498 root     R     2832  2.2  0.4 top
  492     1 root     S     3952  3.1  0.2 nmbd -s /etc/samba/smb.conf
  495     1 root     S     6144  4.8  0.0 smbd -s /etc/samba/smb.conf
  499   495 root     S     6144  4.8  0.0 smbd -s /etc/samba/smb.conf
  498     1 root     S     3056  2.4  0.0 -/bin/sh
  485     1 root     S     2864  2.2  0.0 /usr/sbin/inetd
    1     0 root     S     2824  2.2  0.0 init      
  468     1 root     S     2824  2.2  0.0 /sbin/syslogd
  470     1 root     S     2824  2.2  0.0 /sbin/klogd
  488     1 nobody   S     2672  2.1  0.0 /usr/sbin/boa -c /etc
  297     1 root     S <   2472  1.9  0.0 udevd --daemon
  282     2 root     SW<      0  0.0  0.0 [rpciod/0]
  143     2 root     SW<      0  0.0  0.0 [nfsiod]
    6     2 root     SW<      0  0.0  0.0 [khelper]
    2     0 root     SW<      0  0.0  0.0 [kthreadd]
    4     2 root     SW<      0  0.0  0.0 [watchdog/0]
    5     2 root     SW<      0  0.0  0.0 [events/0]
   53     2 root     SW<      0  0.0  0.0 [kblockd/0]

The irq time takes up most cpu time, but "softirq" and "sys" time is 0%.

I run /proc/stat to check, which is shown as follows:

[root@freescale /]# cat /proc/stat
cpu  316 0 0 53838 409 14467 0 0 0
cpu0 316 0 0 53838 409 14467 0 0 0
intr 636215 2 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 2 0 0 0 0 0
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 00
ctxt 281405
btime 0
processes 499
procs_running 2
procs_blocked 0

It's indeed that the statistic time number of "sys" and "softirq" is zero.


I tracked the source codes, and find the root cause is in following
codes (the Entry function for interrupt) in the entry.S:

ENTRY(inthandler)
        SAVE_ALL_INT
        GET_CURRENT(%d0)
       * addql   #1,%curptr@(TASK_INFO+TINFO_PREEMPT+1)*
        /* put exception # in d0 */
        movel   %sp@(PT_VECTOR),%d0
        swap    %d0                     /* extract bits 25:18 */
        lsrl    #2,%d0
        andl    #0x0ff,%d0

        movel   %sp,%sp@-
        movel   %d0,%sp@-               /* put vector # on stack */
auto_irqhandler_fixup = . + 2
        jbsr    process_int             /* process the IRQ */
        addql   #8,%sp                  /* pop parameters off stack */
        *subql   #1,%curptr@(TASK_INFO+TINFO_PREEMPT+1)*
        jeq     ret_from_last_interrupt
2:      RESTORE_ALL

        ALIGN
ret_from_last_interrupt:
        moveb   %sp@(PT_SR),%d0
        andl    #(~ALLOWINT>>8)&0xff,%d0
        jne     2b

        /* check if we need to do software interrupts */
        tstl    irq_stat+CPUSTAT_SOFTIRQ_PENDING
        jeq     .Lret_from_exception
        pea     ret_from_exception
        jra     do_softirq

My understanding of "*addql   #1,%curptr@(TASK_INFO+TINFO_PREEMPT+1)*"
is that its meaning is equal to
"current_thread_info()->preempt_count += HARDIRQ_OFFSET", which shows
now it's interrupt context. And the
meaning of "*subql   #1,%curptr@(TASK_INFO+TINFO_PREEMPT+1)*" should be
opposite.

However, it seems these two line codes doesn't take their responsibility
from above test result (I don't know why).
I comment these two lines and add "irq_enter() / irq_exit()" function
pairs into the process_int function (process_int() is the interrupt
handler).

My understanding the function of irq_enter()/irq_exit() is the same as
those two line assembly codes).  Attached is my patch.

Following is my test result with my patch:

on target board, run command: nc -l -p 3333 > /dev/null &
on host PC, run command: dd if=/dev/zero | nc 10.192.208.230 (target ip)
3333
run top command on target:
CPU:  0.9% usr 24.1% sys  0.0% nice  0.0% idle  0.0% io 18.2% irq 56.6%
softirq
Load average: 0.28 0.12 0.06
  PID  PPID USER     STAT   VSZ %MEM %CPU COMMAND
  498   495 root     R     2560  2.0 99.2 nc -l -p 3333
  499   495 root     R     2832  2.2  0.4 top
  489     1 root     S     3952  3.1  0.2 nmbd -s /etc/samba/smb.conf
  492     1 root     S     6144  4.8  0.0 smbd -s /etc/samba/smb.conf
  496   492 root     S     6144  4.8  0.0 smbd -s /etc/samba/smb.conf
  495     1 root     S     3056  2.4  0.0 -/bin/sh
  482     1 root     S     2864  2.2  0.0 /usr/sbin/inetd
    1     0 root     S     2824  2.2  0.0 init      
  465     1 root     S     2824  2.2  0.0 /sbin/syslogd
  467     1 root     S     2824  2.2  0.0 /sbin/klogd
  485     1 nobody   S     2672  2.1  0.0 /usr/sbin/boa -c /etc
  297     1 root     S <   2472  1.9  0.0 udevd --daemon
  282     2 root     SW<      0  0.0  0.0 [rpciod/0]
  143     2 root     SW<      0  0.0  0.0 [nfsiod]
    6     2 root     SW<      0  0.0  0.0 [khelper]
    2     0 root     SW<      0  0.0  0.0 [kthreadd]
    3     2 root     SW<      0  0.0  0.0 [ksoftirqd/0]
    4     2 root     SW<      0  0.0  0.0 [watchdog/0]
    5     2 root     SW<      0  0.0  0.0 [events/0]
   53     2 root     SW<      0  0.0  0.0 [kblockd/0]

run cat /proc/stat on target:
[root@freescale /]# cat /proc/stat
cpu  281 0 3565 34268 475 2597 7452 0 0
cpu0 281 0 3565 34268 475 2597 7452 0 0
intr 522453 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 00
ctxt 18910
btime 0
processes 497
procs_running 2
procs_blocked 0


Any idea for this issue?

Regards,
Lanttor



--------------050303040904090400040501
Content-Type: text/x-diff;
 name="Fix-interrupt-contexting-bug-on-mcf5445x.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="Fix-interrupt-contexting-bug-on-mcf5445x.patch"

diff --git a/arch/m68k/coldfire/entry.S b/arch/m68k/coldfire/entry.S
index 3fc1df8..cfd9349 100644
--- a/arch/m68k/coldfire/entry.S
+++ b/arch/m68k/coldfire/entry.S
@@ -232,7 +232,6 @@ do_delayed_trace:
 ENTRY(inthandler)
 	SAVE_ALL_INT
 	GET_CURRENT(%d0)
-	addql	#1,%curptr@(TASK_INFO+TINFO_PREEMPT+1)
 	/* put exception # in d0 */
 	movel	%sp@(PT_VECTOR),%d0
 	swap	%d0			/* extract bits 25:18 */
@@ -244,7 +243,6 @@ ENTRY(inthandler)
 auto_irqhandler_fixup = . + 2
 	jbsr	process_int		/* process the IRQ */
 	addql	#8,%sp			/* pop parameters off stack */
-	subql	#1,%curptr@(TASK_INFO+TINFO_PREEMPT+1)
 	jeq	ret_from_last_interrupt
 2:	RESTORE_ALL
 
diff --git a/arch/m68k/coldfire/ints.c b/arch/m68k/coldfire/ints.c
index 3316463..85ce27e 100644
--- a/arch/m68k/coldfire/ints.c
+++ b/arch/m68k/coldfire/ints.c
@@ -100,6 +100,7 @@ asmlinkage void process_int(unsigned long vec, struct pt_regs *fp)
 	old_regs = set_irq_regs(fp);
 	kstat_cpu(0).irqs[vec]++;
 
+	irq_enter();
 	node = irq_list[vec];
 	if (!node)
 		handle_badint(fp);
@@ -109,6 +110,7 @@ asmlinkage void process_int(unsigned long vec, struct pt_regs *fp)
 			node = node->next;
 		} while (node);
 	}
+	irq_exit();
 
 	set_irq_regs(old_regs);
 }

--------------050303040904090400040501--
