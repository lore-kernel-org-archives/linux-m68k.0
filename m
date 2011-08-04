From: Tuomas Vainikka <tuomas.vainikka@aalto.fi>
Subject: Re: watchdog (?) on linux 3.0.0 and 2.6.39.3
Date: Thu, 4 Aug 2011 19:59:17 +0300
Message-ID: <4E3ACFE5.7020901@aalto.fi>
References: <4E369834.9070707@aalto.fi> <alpine.OSX.2.00.1108021532260.256@ibook.intranet>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <alpine.OSX.2.00.1108021532260.256@ibook.intranet>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: Linux/m68k <linux-m68k@lists.linux-m68k.org>

On 08/02/2011 08:33 AM, Finn Thain wrote:
> On Mon, 1 Aug 2011, Tuomas Vainikka wrote:
>
>> NETDEV WATCHDOG: eth0 (): transmit queue 0 timed out
> ...
>> eth0: Tx timed out, lost interrupt? TSR=0x4, ISR=0x15, t=52.
>> eth0: Tx timed out, lost interrupt? TSR=0x5, ISR=0x3, t=33.
>> eth0: Tx timed out, lost interrupt? TSR=0x5, ISR=0x3, t=36.
> This differs from the earlier bug report, where the kernel complained of
> "mismatched read page pointers". But the timeout is the same.
>
> Perhaps you could build and test a new kernel with no DP8390-based driver
> except apne (probably easiest to disable all ethernet drivers except
> CONFIG_APNE).
>
> Please let us know if that helps, as it may shed some light on the other
> bug too.
>
> Finn

Hello,

The other network drivers were previously compiled as modules, and I 
only had apne built-in.
Now I removed the other drivers being built in any way, but I still get 
an error:

------------[ cut here ]------------
WARNING: at net/sched/sch_generic.c:255 dev_watchdog+0x1a4/0x1c4()
NETDEV WATCHDOG: eth0 (): transmit queue 0 timed out
Modules linked in: parport_amiga(+) gayle(+) dmasound_paula amimouse 
parport ide_core dmasound_core soundcore amiflop
Call Trace: [<0001c134>] warn_slowpath_common+0x48/0x6a
  [<0001c142>] warn_slowpath_common+0x56/0x6a
  [<0001c1ce>] warn_slowpath_fmt+0x2a/0x32
  [<001cefb2>] dev_watchdog+0x1a4/0x1c4
  [<001cefb2>] dev_watchdog+0x1a4/0x1c4
  [<00025b9c>] run_timer_softirq+0xce/0x224
  [<00044b10>] rcu_bh_qs+0x0/0x2e
  [<00241b44>] printk+0x0/0x18
  [<000208fc>] __do_softirq+0x88/0xc8
  [<0006ac22>] kmem_cache_alloc+0x0/0x74
  [<00020a0c>] do_softirq+0x28/0x2c
  [<000025f0>] ret_from_exception+0x0/0xc
  [<00081f2a>] dup_fd+0x24/0x258
  [<0006ac22>] kmem_cache_alloc+0x0/0x74
  [<0001b4c2>] copy_process+0x7de/0xb0c
  [<0001b894>] do_fork+0x8c/0x1f2
  [<00002a3c>] m68k_clone+0x2c/0x34
  [<0000275e>] sys_clone+0xe/0x18
  [<000025be>] syscall+0x8/0xc
  [<0010c00c>] decode_fsinfo+0x2f4/0x460

---[ end trace 29b6452540065c1f ]---

The error is a bit different, and seems to happen at an earlier stage 
than the previously reported one, since parport and gayle are not yet 
inserted.
The end of dmesg output is again:

...
eth0: Tx timed out, lost interrupt? TSR=0x4, ISR=0x15, t=78.
eth0: Tx timed out, lost interrupt? TSR=0x5, ISR=0x3, t=39.
eth0: Tx timed out, lost interrupt? TSR=0x5, ISR=0x3, t=28.
eth0: Tx timed out, lost interrupt? TSR=0x5, ISR=0x3, t=94.
eth0: Tx timed out, lost interrupt? TSR=0x5, ISR=0x17, t=27.
eth0: Tx timed out, lost interrupt? TSR=0x5, ISR=0x3, t=93.

These outputs are from a cross-compiled linux 3.0.0.


Regards,
Tuomas
