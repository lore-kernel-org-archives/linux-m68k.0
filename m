From: Tuomas Vainikka <tuomas.vainikka@aalto.fi>
Subject: watchdog (?) on linux 3.0.0 and 2.6.39.3
Date: Mon, 1 Aug 2011 15:12:36 +0300
Message-ID: <4E369834.9070707@aalto.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Linux/m68k <linux-m68k@lists.linux-m68k.org>

Hello,

This happens with both stable 3.0.0 and 2.6.39.3 kernels:

------------[ cut here ]------------
WARNING: at net/sched/sch_generic.c:255 dev_watchdog+0x1a4/0x1c4()
NETDEV WATCHDOG: eth0 (): transmit queue 0 timed out
Modules linked in: nfsd exportfs ipv6 gayle parport_amiga amiflop 
dmasound_paula ide_core parport dmasound_core amimouse soundcore
Call Trace: [<0001c134>] warn_slowpath_common+0x48/0x6a
  [<0001c142>] warn_slowpath_common+0x56/0x6a
  [<0001c1ce>] warn_slowpath_fmt+0x2a/0x32
  [<001cbff6>] dev_watchdog+0x1a4/0x1c4
  [<001cbff6>] dev_watchdog+0x1a4/0x1c4
  [<00025b9c>] run_timer_softirq+0xce/0x224
  [<0000ffff>] _060_fpsp_effadd+0x83e3/0xd518
  [<00044424>] rcu_bh_qs+0x0/0x2e
  [<0023eb90>] printk+0x0/0x18
  [<000208fc>] __do_softirq+0x88/0xc8
  [<002406b4>] schedule+0x0/0x34e
  [<00020a0c>] do_softirq+0x28/0x2c
  [<000025f0>] ret_from_exception+0x0/0xc
  [<00002892>] default_idle+0x0/0xc
  [<000028e2>] cpu_idle+0x16/0x20
  [<0023eb90>] printk+0x0/0x18
  [<002fefd0>] start_kernel+0x33a/0x348
  [<0000f9a2>] _060_fpsp_effadd+0x7d86/0xd518
  [<0000f9a2>] _060_fpsp_effadd+0x7d86/0xd518
  [<002fe2fc>] _sinittext+0x2fc/0x988

---[ end trace 9649de43a8c19796 ]---

The message above comes only once.

Then, there's a lot of these:

eth0: Tx timed out, lost interrupt? TSR=0x4, ISR=0x15, t=52.
eth0: Tx timed out, lost interrupt? TSR=0x5, ISR=0x3, t=33.
eth0: Tx timed out, lost interrupt? TSR=0x5, ISR=0x3, t=36.

but the PCMCIA network card of mine can also be flakey.

Both kernels have been cross-compiled with gcc 4.6.1.
I'll be happy to provide you with the kernel config and the full dmesg 
output if you need them.

Regards,
Tuomas
