From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: 8390 drivers (was: Re: Debian kernel 2.6.38-5)
Date: Mon, 18 Jul 2011 19:46:37 +1000 (EST)
Message-ID: <alpine.OSX.2.00.1107181901080.145@ibook.local>
References: <BANLkTimG+3jqLiLaA_NVEpGg3LFtvK4bQQ@mail.gmail.com> <20110509213213.GA28675@chumley.earth.sol> <BANLkTik27HjWOF0s5HRqgva5zYzQRis27Q@mail.gmail.com> <20110510072928.GA32679@chumley.earth.sol> <20110523204414.GA10664@chumley.earth.sol>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <20110523204414.GA10664@chumley.earth.sol>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: "Christian T. Steigies" <cts@debian.org>
Cc: Linux/m68k <linux-m68k@lists.linux-m68k.org>


On Mon, 23 May 2011, Christian T. Steigies wrote:

> 
> Here is the output from dmesg for linux-2.6.39 as built from Debian 
> sources. zorro8390.c includes the patch Finn and Geert sent earlier, so 
> the network works, for about 10 minutes. Then this happens (with my 
> earlier built kernel from linux-m68k git with the patch, it seems to 
> work longer, but I did not run a long test series):
>
...
> [   15.000000] eth0: Features changed: 0x00004800 -> 0x00004000
> [   15.020000] eth0: Ariadne II at 0x00e90000, Ethernet Address 00:60:30:00:41:5b
...
> [  536.000000] eth0: trigger_send() called with the transmitter busy.
> [  536.260000] eth0: mismatched read page pointers  1 vs ff.
> [  536.270000] eth0: mismatched read page pointers  1 vs ff.
> [  536.280000] eth0: mismatched read page pointers  1 vs ff.
> [  536.290000] eth0: mismatched read page pointers  1 vs  0.
> [  536.300000] eth0: mismatched read page pointers 1d vs ff.
> [  536.310000] eth0: trigger_send() called with the transmitter busy.
> [  536.330000] eth0: mismatched read page pointers  5 vs ff.
> [  536.340000] eth0: mismatched read page pointers  1 vs 1f.
> [  536.350000] eth0: mismatched read page pointers  5 vs ff.
> [  536.360000] eth0: mismatched read page pointers  1 vs ff.
> [  536.370000] eth0: mismatched read page pointers  1 vs ff.
> [  536.390000] eth0: mismatched read page pointers  5 vs ff.
> [  536.400000] eth0: mismatched read page pointers  1 vs  0.
> [  536.410000] eth0: mismatched read page pointers  5 vs ff.
> [  536.420000] eth0: mismatched read page pointers  1 vs ff.
> [  536.430000] eth0: mismatched read page pointers  1 vs ff.
> [  536.440000] eth0: mismatched read page pointers  1 vs  0.
> [  536.460000] eth0: mismatched read page pointers  1 vs ff.
> [  536.470000] eth0: mismatched read page pointers  1 vs ff.
> [  536.480000] eth0: mismatched read page pointers  5 vs  0.
> [  536.490000] eth0: mismatched read page pointers  1 vs ff.
> ...


For comparison, here are the results from mac8390 (2.6.39). I don't know 
whether this is the same bug or not. I have only tested one 8390 card and 
only in one system (the SONIC in the same system works fine, but that's a 
completely different driver). I've not tested any older kernels yet but 
I'll try that next.


...
mac8390: v0.4 2001-05-15 David Huggins-Daines <dhd@debian.org> and others
mac8390: eth0: Memory length resource for slot E not found, probing
mac8390: eth0: EtherNet card in slot E (type apple)
mac8390: MAC 00:a0:4b:00:e1:2c IRQ 61, 32 KB shared memory at 0xfeed0000, 16-bit access.
...
------------[ cut here ]------------
WARNING: at net/sched/sch_generic.c:256 dev_watchdog+0x1ac/0x1cc()
NETDEV WATCHDOG: eth0 (): transmit queue 0 timed out
Modules linked in:
Call Trace: [<0001db8a>] warn_slowpath_common+0x48/0x6a
 [<0001db98>] warn_slowpath_common+0x56/0x6a
 [<0001dc24>] warn_slowpath_fmt+0x2a/0x32
 [<001e08a6>] dev_watchdog+0x1ac/0x1cc
 [<001e08a6>] dev_watchdog+0x1ac/0x1cc
 [<00026dae>] cascade+0x0/0xb0
 [<0002ce16>] __queue_work+0x8e/0x242
 [<00026dae>] cascade+0x0/0xb0
 [<0002cfea>] delayed_work_timer_fn+0x20/0x3c
 [<00026fca>] run_timer_softirq+0xee/0x272
 [<000495f4>] rcu_bh_qs+0x0/0x5a
 [<0025095a>] printk+0x0/0x1e
 [<00022432>] __do_softirq+0x6e/0xd2
 [<00001000>] kernel_pg_dir+0x0/0x1000
 [<00250c66>] schedule+0x0/0x330
 [<00002000>] _start+0x0/0x8
 [<00022566>] do_softirq+0x28/0x2c
 [<000026d0>] ret_from_exception+0x0/0xc
 [<00001000>] kernel_pg_dir+0x0/0x1000
 [<00002a44>] default_idle+0x0/0xc
 [<00002cf8>] cpu_idle+0x16/0x22
 [<0025095a>] printk+0x0/0x1e
 [<0031dfb4>] start_kernel+0x360/0x36c
 [<00003fe3>] buserr_c+0x621/0x632
 [<00003fe3>] buserr_c+0x621/0x632
 [<0031c3d2>] _sinittext+0x3d2/0xa44

---[ end trace 69dff76f1afe57c6 ]---
eth0: Tx timed out, lost interrupt? TSR=0x1, ISR=0x3, t=71.
eth0: Tx timed out, lost interrupt? TSR=0x1, ISR=0x3, t=65.
eth0: Tx timed out, lost interrupt? TSR=0x5, ISR=0x3, t=94.
eth0: Tx timed out, lost interrupt? TSR=0x5, ISR=0x3, t=96.
eth0: Tx timed out, lost interrupt? TSR=0x1, ISR=0x3, t=100.
eth0: Tx timed out, lost interrupt? TSR=0x1, ISR=0x3, t=99.
eth0: Tx timed out, lost interrupt? TSR=0x1, ISR=0x3, t=100.
eth0: Tx timed out, lost interrupt? TSR=0x5, ISR=0x3, t=99.
eth0: Tx timed out, lost interrupt? TSR=0x5, ISR=0x3, t=99.
eth0: Tx timed out, lost interrupt? TSR=0x1, ISR=0x3, t=100.
eth0: Tx timed out, lost interrupt? TSR=0x1, ISR=0x3, t=100.
eth0: Tx timed out, lost interrupt? TSR=0x1, ISR=0x3, t=99.
eth0: Tx timed out, lost interrupt? TSR=0x5, ISR=0x3, t=100.
eth0: Tx timed out, lost interrupt? TSR=0x1, ISR=0x3, t=100.
eth0: Tx timed out, lost interrupt? TSR=0x1, ISR=0x3, t=100.
eth0: Tx timed out, lost interrupt? TSR=0x1, ISR=0x3, t=99.
eth0: Tx timed out, lost interrupt? TSR=0x5, ISR=0x3, t=98.
eth0: Tx timed out, lost interrupt? TSR=0x1, ISR=0x3, t=99.
last message repeated 2 times
eth0: Tx timed out, lost interrupt? TSR=0x1, ISR=0x3, t=100.
eth0: Tx timed out, lost interrupt? TSR=0x5, ISR=0x3, t=99.
eth0: Tx timed out, lost interrupt? TSR=0x1, ISR=0x3, t=100.
eth0: Tx timed out, lost interrupt? TSR=0x5, ISR=0x3, t=99.
eth0: Tx timed out, lost interrupt? TSR=0x1, ISR=0x3, t=99.
last message repeated 2 times
eth0: Tx timed out, lost interrupt? TSR=0x1, ISR=0x3, t=100.
last message repeated 3 times
eth0: Tx timed out, lost interrupt? TSR=0x1, ISR=0x3, t=99.
eth0: Tx timed out, lost interrupt? TSR=0x1, ISR=0x3, t=99.
eth0: Tx timed out, lost interrupt? TSR=0x1, ISR=0x3, t=100.
eth0: Tx timed out, lost interrupt? TSR=0x1, ISR=0x3, t=99.
eth0: Tx timed out, lost interrupt? TSR=0x1, ISR=0x3, t=99.
eth0: Tx timed out, lost interrupt? TSR=0x5, ISR=0x3, t=99.
eth0: Tx timed out, lost interrupt? TSR=0x1, ISR=0x3, t=100.
eth0: Tx timed out, lost interrupt? TSR=0x5, ISR=0x3, t=99.
eth0: Tx timed out, lost interrupt? TSR=0x1, ISR=0x3, t=40.
eth0: Tx timed out, lost interrupt? TSR=0x1, ISR=0x3, t=40.
eth0: Tx timed out, lost interrupt? TSR=0x1, ISR=0x3, t=39.
eth0: Tx timed out, lost interrupt? TSR=0x1, ISR=0x3, t=76.
eth0: Tx timed out, lost interrupt? TSR=0x1, ISR=0x3, t=100.
last message repeated 2 times
eth0: Tx timed out, lost interrupt? TSR=0x5, ISR=0x3, t=99.
eth0: Tx timed out, lost interrupt? TSR=0x1, ISR=0x3, t=99.
eth0: Tx timed out, lost interrupt? TSR=0x5, ISR=0x3, t=99.
eth0: Tx timed out, lost interrupt? TSR=0x1, ISR=0x3, t=100.
eth0: Tx timed out, lost interrupt? TSR=0x5, ISR=0x3, t=99.
eth0: Tx timed out, lost interrupt? TSR=0x1, ISR=0x3, t=99.
eth0: Tx timed out, lost interrupt? TSR=0x1, ISR=0x3, t=100.
eth0: Tx timed out, lost interrupt? TSR=0x5, ISR=0x3, t=99.
eth0: Tx timed out, lost interrupt? TSR=0x5, ISR=0x3, t=99.
eth0: Tx timed out, lost interrupt? TSR=0x1, ISR=0x3, t=88.
eth0: Tx timed out, lost interrupt? TSR=0x5, ISR=0x3, t=98.
eth0: Tx timed out, lost interrupt? TSR=0x1, ISR=0x3, t=100.
eth0: Tx timed out, lost interrupt? TSR=0x1, ISR=0x3, t=99.
eth0: Tx timed out, lost interrupt? TSR=0x1, ISR=0x3, t=96.
eth0: Tx timed out, lost interrupt? TSR=0x1, ISR=0x3, t=93.
eth0: Tx timed out, lost interrupt? TSR=0x5, ISR=0x3, t=100.
eth0: Tx timed out, lost interrupt? TSR=0x5, ISR=0x3, t=99.
eth0: Tx timed out, lost interrupt? TSR=0x1, ISR=0x3, t=100.
eth0: Tx timed out, lost interrupt? TSR=0x1, ISR=0x3, t=100.
eth0: Tx timed out, lost interrupt? TSR=0x1, ISR=0x3, t=99.
eth0: Tx timed out, lost interrupt? TSR=0x5, ISR=0x3, t=99.
eth0: Tx timed out, lost interrupt? TSR=0x1, ISR=0x3, t=100.
eth0: Tx timed out, lost interrupt? TSR=0x5, ISR=0x3, t=100.
eth0: Tx timed out, lost interrupt? TSR=0x5, ISR=0x3, t=99.
eth0: Tx timed out, lost interrupt? TSR=0x5, ISR=0x3, t=100.
eth0: Tx timed out, lost interrupt? TSR=0x5, ISR=0x3, t=99.
eth0: Tx timed out, lost interrupt? TSR=0x1, ISR=0x3, t=100.
eth0: Tx timed out, lost interrupt? TSR=0x1, ISR=0x3, t=100.
eth0: Tx timed out, lost interrupt? TSR=0x5, ISR=0x3, t=100.
eth0: Tx timed out, lost interrupt? TSR=0x5, ISR=0x3, t=99.
eth0: Tx timed out, lost interrupt? TSR=0x5, ISR=0x3, t=100.
eth0: Tx timed out, lost interrupt? TSR=0x5, ISR=0x3, t=100.
eth0: Tx timed out, lost interrupt? TSR=0x1, ISR=0x3, t=100.
eth0: Tx timed out, lost interrupt? TSR=0x1, ISR=0x3, t=100.
eth0: Tx timed out, lost interrupt? TSR=0x5, ISR=0x3, t=100.
eth0: Tx timed out, lost interrupt? TSR=0x1, ISR=0x3, t=99.
eth0: Tx timed out, lost interrupt? TSR=0x1, ISR=0x3, t=100.
eth0: Tx timed out, lost interrupt? TSR=0x1, ISR=0x3, t=100.
eth0: Tx timed out, lost interrupt? TSR=0x5, ISR=0x3, t=99.
eth0: Tx timed out, lost interrupt? TSR=0x1, ISR=0x3, t=100.
eth0: Tx timed out, lost interrupt? TSR=0x5, ISR=0x3, t=100.
eth0: Tx timed out, lost interrupt? TSR=0x1, ISR=0x3, t=99.
eth0: Tx timed out, lost interrupt? TSR=0x1, ISR=0x3, t=100.
eth0: Tx timed out, lost interrupt? TSR=0x5, ISR=0x3, t=83.
eth0: Tx timed out, lost interrupt? TSR=0x1, ISR=0x3, t=99.
eth0: Tx timed out, lost interrupt? TSR=0x1, ISR=0x3, t=99.
eth0: Tx timed out, lost interrupt? TSR=0x1, ISR=0x3, t=100.
last message repeated 4 times
eth0: Tx timed out, lost interrupt? TSR=0x5, ISR=0x3, t=100.
eth0: Tx timed out, lost interrupt? TSR=0x1, ISR=0x3, t=100.
eth0: Tx timed out, lost interrupt? TSR=0x5, ISR=0x3, t=99.
eth0: Tx timed out, lost interrupt? TSR=0x1, ISR=0x3, t=99.
eth0: Tx timed out, lost interrupt? TSR=0x1, ISR=0x3, t=100.
eth0: Tx timed out, lost interrupt? TSR=0x1, ISR=0x3, t=99.
eth0: Tx timed out, lost interrupt? TSR=0x1, ISR=0x3, t=100.
eth0: Tx timed out, lost interrupt? TSR=0x5, ISR=0x3, t=100.
eth0: Tx timed out, lost interrupt? TSR=0x1, ISR=0x3, t=100.
last message repeated 2 times
eth0: Tx timed out, lost interrupt? TSR=0x1, ISR=0x3, t=99.
eth0: Tx timed out, lost interrupt? TSR=0x1, ISR=0x3, t=100.
eth0: Tx timed out, lost interrupt? TSR=0x1, ISR=0x3, t=100.
eth0: Tx timed out, lost interrupt? TSR=0x5, ISR=0x3, t=99.
eth0: Tx timed out, lost interrupt? TSR=0x1, ISR=0x3, t=100.
eth0: Tx timed out, lost interrupt? TSR=0x1, ISR=0x3, t=100.
eth0: Tx timed out, lost interrupt? TSR=0x5, ISR=0x3, t=100.
eth0: Tx timed out, lost interrupt? TSR=0x5, ISR=0x3, t=100.
eth0: Tx timed out, lost interrupt? TSR=0x1, ISR=0x3, t=100.
eth0: Tx timed out, lost interrupt? TSR=0x5, ISR=0x3, t=100.
eth0: Tx timed out, lost interrupt? TSR=0x1, ISR=0x3, t=99.
eth0: Tx timed out, lost interrupt? TSR=0x1, ISR=0x3, t=100.
eth0: Tx timed out, lost interrupt? TSR=0x1, ISR=0x3, t=99.
eth0: Tx timed out, lost interrupt? TSR=0x5, ISR=0x3, t=100.
eth0: Tx timed out, lost interrupt? TSR=0x5, ISR=0x3, t=99.
eth0: Tx timed out, lost interrupt? TSR=0x5, ISR=0x3, t=100.
eth0: Tx timed out, lost interrupt? TSR=0x1, ISR=0x3, t=100.
eth0: Tx timed out, lost interrupt? TSR=0x5, ISR=0x3, t=99.
eth0: Tx timed out, lost interrupt? TSR=0x1, ISR=0x3, t=99.
eth0: Tx timed out, lost interrupt? TSR=0x5, ISR=0x3, t=100.
eth0: Tx timed out, lost interrupt? TSR=0x1, ISR=0x3, t=99.
eth0: Tx timed out, lost interrupt? TSR=0x5, ISR=0x3, t=100.
eth0: Tx timed out, lost interrupt? TSR=0x5, ISR=0x3, t=100.
eth0: Tx timed out, lost interrupt? TSR=0x1, ISR=0x3, t=99.
eth0: Tx timed out, lost interrupt? TSR=0x5, ISR=0x3, t=100.
eth0: Tx timed out, lost interrupt? TSR=0x1, ISR=0x3, t=100.
eth0: Tx timed out, lost interrupt? TSR=0x1, ISR=0x3, t=100.
eth0: Tx timed out, lost interrupt? TSR=0x5, ISR=0x3, t=100.
eth0: Tx timed out, lost interrupt? TSR=0x1, ISR=0x3, t=100.
eth0: Tx timed out, lost interrupt? TSR=0x5, ISR=0x3, t=100.
eth0: Tx timed out, lost interrupt? TSR=0x5, ISR=0x3, t=100.
eth0: Tx timed out, lost interrupt? TSR=0x1, ISR=0x3, t=100.
last message repeated 2 times
eth0: Tx timed out, lost interrupt? TSR=0x1, ISR=0x3, t=99.
eth0: Tx timed out, lost interrupt? TSR=0x1, ISR=0x3, t=100.
eth0: Tx timed out, lost interrupt? TSR=0x5, ISR=0x3, t=99.
eth0: Tx timed out, lost interrupt? TSR=0x1, ISR=0x3, t=100.
last message repeated 2 times
eth0: Tx timed out, lost interrupt? TSR=0x5, ISR=0x3, t=100.
last message repeated 2 times
eth0: Tx timed out, lost interrupt? TSR=0x1, ISR=0x3, t=100.
eth0: Tx timed out, lost interrupt? TSR=0x1, ISR=0x3, t=100.
eth0: Tx timed out, lost interrupt? TSR=0x5, ISR=0x3, t=100.
eth0: Tx timed out, lost interrupt? TSR=0x5, ISR=0x3, t=100.
eth0: Tx timed out, lost interrupt? TSR=0x1, ISR=0x3, t=100.
last message repeated 2 times
eth0: Tx timed out, lost interrupt? TSR=0x5, ISR=0x3, t=100.
eth0: Tx timed out, lost interrupt? TSR=0x1, ISR=0x3, t=100.
eth0: Tx timed out, lost interrupt? TSR=0x5, ISR=0x3, t=99.
eth0: Tx timed out, lost interrupt? TSR=0x1, ISR=0x3, t=100.
last message repeated 2 times
eth0: Tx timed out, lost interrupt? TSR=0x5, ISR=0x3, t=99.
eth0: Tx timed out, lost interrupt? TSR=0x5, ISR=0x3, t=100.
eth0: Tx timed out, lost interrupt? TSR=0x5, ISR=0x3, t=100.
eth0: Tx timed out, lost interrupt? TSR=0x1, ISR=0x3, t=100.
eth0: Tx timed out, lost interrupt? TSR=0x5, ISR=0x3, t=100.
eth0: Tx timed out, lost interrupt? TSR=0x1, ISR=0x3, t=100.
eth0: Tx timed out, lost interrupt? TSR=0x1, ISR=0x3, t=100.
eth0: Tx timed out, lost interrupt? TSR=0x5, ISR=0x3, t=100.
eth0: Tx timed out, lost interrupt? TSR=0x1, ISR=0x3, t=100.
eth0: Tx timed out, lost interrupt? TSR=0x1, ISR=0x3, t=99.
eth0: Tx timed out, lost interrupt? TSR=0x1, ISR=0x3, t=100.
last message repeated 19 times
eth0: Tx timed out, lost interrupt? TSR=0x5, ISR=0x3, t=99.
eth0: Tx timed out, lost interrupt? TSR=0x1, ISR=0x3, t=100.
eth0: Tx timed out, lost interrupt? TSR=0x5, ISR=0x3, t=100.
eth0: Tx timed out, lost interrupt? TSR=0x1, ISR=0x3, t=100.
eth0: Tx timed out, lost interrupt? TSR=0x1, ISR=0x3, t=99.
eth0: Tx timed out, lost interrupt? TSR=0x1, ISR=0x2, t=73.
eth0: Tx timed out, lost interrupt? TSR=0x5, ISR=0x3, t=97.
eth0: Tx timed out, lost interrupt? TSR=0x1, ISR=0x3, t=99.
last message repeated 2 times
eth0: Tx timed out, lost interrupt? TSR=0x1, ISR=0x3, t=100.
last message repeated 3 times
...
