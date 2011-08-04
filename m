From: Michael Schmitz <schmitzmic@googlemail.com>
Subject: Re: watchdog (?) on linux 3.0.0 and 2.6.39.3
Date: Fri, 5 Aug 2011 08:45:12 +1200
Message-ID: <CAOmrzkL1ZaWBtYG6uyotwgGzoZLEdafrUCh6qfq-_siNZ9vvdQ@mail.gmail.com>
References: <4E369834.9070707@aalto.fi>
	<alpine.OSX.2.00.1108021532260.256@ibook.intranet>
	<4E3ACFE5.7020901@aalto.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <4E3ACFE5.7020901@aalto.fi>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Tuomas Vainikka <tuomas.vainikka@aalto.fi>
Cc: Finn Thain <fthain@telegraphics.com.au>, Linux/m68k <linux-m68k@lists.linux-m68k.org>

On Fri, Aug 5, 2011 at 4:59 AM, Tuomas Vainikka
<tuomas.vainikka@aalto.fi> wrote:
> Hello,
>
> The other network drivers were previously compiled as modules, and I =
only
> had apne built-in.
> Now I removed the other drivers being built in any way, but I still g=
et an
> error:

Is there a way to get timestamps logged with each of the entries in
the call trace below (i.e. could we rig some profiling code for that)?
Would be interesting to know where exactly the kernel was spinning
when the watchdog fired. But maybe that's obvious to someone.

Are there potential deadlocks with printk called from softirq context
(I think not ...)? What is the message printed immediately after the
trace?

Last - has anyone ever tried to bisect this?

Cheers,

  Michael


>
> ------------[ cut here ]------------
> WARNING: at net/sched/sch_generic.c:255 dev_watchdog+0x1a4/0x1c4()
> NETDEV WATCHDOG: eth0 (): transmit queue 0 timed out
> Modules linked in: parport_amiga(+) gayle(+) dmasound_paula amimouse =
parport
> ide_core dmasound_core soundcore amiflop
> Call Trace: [<0001c134>] warn_slowpath_common+0x48/0x6a
> =A0[<0001c142>] warn_slowpath_common+0x56/0x6a
> =A0[<0001c1ce>] warn_slowpath_fmt+0x2a/0x32
> =A0[<001cefb2>] dev_watchdog+0x1a4/0x1c4
> =A0[<001cefb2>] dev_watchdog+0x1a4/0x1c4
> =A0[<00025b9c>] run_timer_softirq+0xce/0x224
> =A0[<00044b10>] rcu_bh_qs+0x0/0x2e
> =A0[<00241b44>] printk+0x0/0x18
> =A0[<000208fc>] __do_softirq+0x88/0xc8
> =A0[<0006ac22>] kmem_cache_alloc+0x0/0x74
> =A0[<00020a0c>] do_softirq+0x28/0x2c
> =A0[<000025f0>] ret_from_exception+0x0/0xc
> =A0[<00081f2a>] dup_fd+0x24/0x258
> =A0[<0006ac22>] kmem_cache_alloc+0x0/0x74
> =A0[<0001b4c2>] copy_process+0x7de/0xb0c
> =A0[<0001b894>] do_fork+0x8c/0x1f2
> =A0[<00002a3c>] m68k_clone+0x2c/0x34
> =A0[<0000275e>] sys_clone+0xe/0x18
> =A0[<000025be>] syscall+0x8/0xc
> =A0[<0010c00c>] decode_fsinfo+0x2f4/0x460
>
> ---[ end trace 29b6452540065c1f ]---
>
> The error is a bit different, and seems to happen at an earlier stage=
 than
> the previously reported one, since parport and gayle are not yet inse=
rted.
> The end of dmesg output is again:
>
> ...
> eth0: Tx timed out, lost interrupt? TSR=3D0x4, ISR=3D0x15, t=3D78.
> eth0: Tx timed out, lost interrupt? TSR=3D0x5, ISR=3D0x3, t=3D39.
> eth0: Tx timed out, lost interrupt? TSR=3D0x5, ISR=3D0x3, t=3D28.
> eth0: Tx timed out, lost interrupt? TSR=3D0x5, ISR=3D0x3, t=3D94.
> eth0: Tx timed out, lost interrupt? TSR=3D0x5, ISR=3D0x17, t=3D27.
> eth0: Tx timed out, lost interrupt? TSR=3D0x5, ISR=3D0x3, t=3D93.
>
> These outputs are from a cross-compiled linux 3.0.0.
>
>
> Regards,
> Tuomas
> --
> To unsubscribe from this list: send the line "unsubscribe linux-m68k"=
 in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
