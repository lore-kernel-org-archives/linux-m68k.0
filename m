From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: Boot crash on 68030, was Re: [PATCH][M68K] implement futex.h to
 support userspace robust futexes and PI mutexes
Date: Tue, 10 Dec 2013 11:54:12 +1100 (EST)
Message-ID: <alpine.LNX.2.00.1312101141250.17926@nippy.intranet>
References: <20793.61385.652975.797741@pilspetsen.it.uu.se> <alpine.LNX.2.00.1312101000250.10258@nippy.intranet> <87iouxzju3.fsf@igel.home>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:59846 "EHLO
	kvm5.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750707Ab3LJAyR (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 9 Dec 2013 19:54:17 -0500
In-Reply-To: <87iouxzju3.fsf@igel.home>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org, Mikael Pettersson <mikpelinux@gmail.com>


On Tue, 10 Dec 2013, Andreas Schwab wrote:

> Finn Thain <fthain@telegraphics.com.au> writes:
> 
> > Data read fault at 0x00000000 in Super Data (pc=0x3afec)
> > BAD KERNEL BUSERR
> > Oops: 00000000
> > Modules linked in:
> > PC: [<0003afec>] cmpxchg_futex_value_locked+0x14/0x4a
> 
> What does it do here?

What happens next is that swapper dies leading to panic (see below).

It appears that the call graph looks like this,

futex_init()
  cmpxchg_futex_value_locked(&curval, NULL, 0, 0)
    pagefault_disable();
    futex_atomic_cmpxchg_inatomic(curval, NULL, 0, 0)
      get_user(val, NULL)

That is, futex_init() passes a NULL pointer expecting it to fault, as 
described in the comments in kernel/futex.c. Clearly the fault is not 
expected to be fatal.

Finn


MacLinux

 vidaddr: 60040000
  _stext: 00001000
bootinfo: 002CC000
   cpuid: 00000000
 sccbase: 50F04000

ABCFGHIJK
Linux version 3.10.0-rc2-mac-111606-ge4f2dfb (fthain@nippy) (gcc version 
4.4.6 (GCC) ) #14 Tue Dec 10 11:31:21 EST 2013
bootconsole [early0] enabled
Detected Macintosh model: 33
VIA1 at 50f00000 is a 6522 or clone
VIA2 at 50f02000 is a 6522 or clone
Apple Macintosh PowerBook 180
Built 1 zonelists in Zone order, mobility grouping off.  Total pages: 3045
Kernel command line: console=ttyS0
PID hash table entries: 64 (order: -4, 256 bytes)
Dentry cache hash table entries: 2048 (order: 1, 8192 bytes)
Inode-cache hash table entries: 1024 (order: 0, 4096 bytes)
Sorting __ex_table...
Memory: 9252k/9252k available (1948k kernel code, 984k data, 104k init)
Virtual kernel memory layout:
    vector  : 0x0029318c - 0x0029358c   (   1 KiB)
    kmap    : 0xd0000000 - 0xf0000000   ( 512 MiB)
    vmalloc : 0x01000000 - 0xd0000000   (3312 MiB)
    lowmem  : 0x00000000 - 0x00c00000   (  12 MiB)
      .init : 0x002b2000 - 0x002cc000   ( 104 KiB)
      .text : 0x00001000 - 0x001e71aa   (1945 KiB)
      .data : 0x001e9d60 - 0x002b11d0   ( 798 KiB)
      .bss  : 0x00292f80 - 0x002b11d0   ( 121 KiB)
SLUB: HWalign=16, Order=0-3, MinObjects=0, CPUs=1, Nodes=8
NR_IRQS:72
Killing onboard sonic... Done.
WARNING: Persistent clock returned invalid value!
         Check your CMOS/BIOS settings.
Console: colour dummy device 80x25
console [ttyS0] enabled, bootconsole disabled
console [ttyS0] enabled, bootconsole disabled
Calibrating delay loop... 7.83 BogoMIPS (lpj=39168)
pid_max: default: 32768 minimum: 301
Mount-cache hash table entries: 512
devtmpfs: initialized
NET: Registered protocol family 16
bio: create slab <bio-0> at 0
NuBus: Scanning NuBus slots.
SCSI subsystem initialized
NET: Registered protocol family 2
TCP established hash table entries: 512 (order: 0, 4096 bytes)
TCP bind hash table entries: 512 (order: -1, 2048 bytes)
TCP: Hash tables configured (established 512 bind 512)
TCP: reno registered
UDP hash table entries: 256 (order: 0, 4096 bytes)
UDP-Lite hash table entries: 256 (order: 0, 4096 bytes)
NET: Registered protocol family 1
RPC: Registered named UNIX socket transport module.
RPC: Registered udp transport module.
RPC: Registered tcp transport module.
RPC: Registered tcp NFSv4.1 backchannel transport module.
Data read fault at 0x00000000 in Super Data (pc=0x3afec)
BAD KERNEL BUSERR
Oops: 00000000
Modules linked in:
PC: [<0003afec>] cmpxchg_futex_value_locked+0x14/0x4a
SR: 2004  SP: 0082fed4  a2: 0082c000
d0: 00000000    d1: 00000001    d2: 00000018    d3: 00000000
d4: 00000061    d5: 00001000    a0: 00000000    a1: 0082e000
Process swapper (pid: 1, task=0082c000)
Frame format=B ssw=074d isc=4a80 isb=661c daddr=00000000 dobuf=00000001
baddr=0003aff2 dibuf=00000000 ver=f
Stack from 0082ff5c:
        002b8cb8 0082ff70 00000000 00000000 00000000 00000000 00000000 000020ac
        00000018 00000007 00000061 00001000 00000000 00000000 002cab50 00002008
        002b3a56 002b8ca4 0082c3f0 00000000 0082c53c 001e316a 00000000 00000000
        001e3172 001e316a 000025d4 00000000 00000000 00000000 00000000 00000000
        00000000 00000000 00000000 00000000 00000000 00000000 00000000 20000000
        00000000
Call Trace: [<002b8cb8>] futex_init+0x14/0x54
 [<000020ac>] do_one_initcall+0xa4/0x144
 [<00001000>] kernel_pg_dir+0x0/0x1000
 [<00002008>] do_one_initcall+0x0/0x144
 [<002b3a56>] kernel_init_freeable+0xca/0x152
 [<002b8ca4>] futex_init+0x0/0x54
 [<001e316a>] kernel_init+0x0/0xc8
 [<001e3172>] kernel_init+0x8/0xc8
 [<001e316a>] kernel_init+0x0/0xc8
 [<000025d4>] ret_from_kernel_thread+0xc/0x14

Code: 200f 0280 ffff e000 2240 52a9 0010 4280 <0e90> 1000 4a80 661c b2af 
000c 660c 226f 0010 0e90 9800 4a80 660a 206f 0004 2081
Disabling lock debugging due to kernel taint
note: swapper[1] exited with preempt_count 1
Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
