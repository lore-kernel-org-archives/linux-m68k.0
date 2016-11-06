From: Finn Thain <fthain@telegraphics.com.au>
Subject: gcc-4.6.3, was Re: Debian on mac68k
Date: Sun, 6 Nov 2016 13:03:41 +1100 (AEDT)
Message-ID: <alpine.LNX.2.00.1611052134280.2870@nippy.intranet>
References: <574C132F.3070404@abbuc.de> <574C15C2.90908@abbuc.de> <ec5ded9d-b3c0-0bba-65b7-1e4d2cc063a2@physik.fu-berlin.de> <574C1792.4030403@abbuc.de> <57557722.5040808@yahoo.com> <alpine.LNX.2.00.1610251358330.443@nippy.intranet> <5810FA8D.4060702@yahoo.com>
 <58114F74.40408@yahoo.com> <alpine.LNX.2.00.1610271244020.21780@nippy.intranet> <5811F96F.3090602@yahoo.com> <58121D46.8060506@yahoo.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:45658 "EHLO
        kvm5.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751058AbcKFCI2 (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Sat, 5 Nov 2016 22:08:28 -0400
In-Reply-To: <58121D46.8060506@yahoo.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: debian-68k@lists.debian.org, linux-m68k@vger.kernel.org


Has anyone else tried the m68k cross-compiler from kernel.org and observed 
strange behaviour from the binaries it produces?

I used that cross-compiler (the i686 one) to build the kernel seen booting 
below. The resulting binary consistently crashes two different systems (LC 
III and LC 475), both during kernel startup. These two machines use 
different drivers and have different failure modes, but the failures are 
completely repeatable. The failures went away when I reverted to my usual 
(patched) gcc-4.4.6.

Perhaps gcc-4.6.3 is more strict than gcc-4.4, in such a way that would 
affect code generation, when presented with incorrect or undefined code? 
Are there any warnings that could be enabled to discover that code?

Is there some way to run the GCC test suite against this cross-compiler?

-- 

On Thu, 27 Oct 2016, Mac User wrote:

> 
> Please see attached for console log of LC III booting 
> "vmlinux-4.1.35-mac_scsi+". [...]
> 
> ABCFGHIJK
> Linux version 4.1.35-mac_scsi+ (fthain@nippy) (gcc version 4.6.3 (GCC) ) #1 Tue6
> Saving 402 bytes of bootinfo
> Detected Macintosh model: 27
> VIA1 at 50f00000 is a 6522 or clone
> VIA2 at 50f26000 is an RBV
> Apple Macintosh LC III
> Built 1 zonelists in Zone order, mobility grouping on.  Total pages: 9135
> Kernel command line: root=/dev/sda6 console=ttyS0 nologo
> PID hash table entries: 256 (order: -2, 1024 bytes)
> Dentry cache hash table entries: 8192 (order: 3, 32768 bytes)
> Inode-cache hash table entries: 4096 (order: 2, 16384 bytes)
> Sorting __ex_table...
> Memory: 32572K/36864K available (2825K kernel code, 247K rwdata, 664K rodata, 1)
> Virtual kernel memory layout:
>     vector  : 0x003879e8 - 0x00387de8   (   1 KiB)
>     kmap    : 0xd0000000 - 0xf0000000   ( 512 MiB)
>     vmalloc : 0x02800000 - 0xd0000000   (3288 MiB)
>     lowmem  : 0x00000000 - 0x02400000   (  36 MiB)
>       .init : 0x003ab000 - 0x003c7000   ( 112 KiB)
>       .text : 0x00001000 - 0x002c3784   (2826 KiB)
>       .data : 0x002c6bf0 - 0x003aaa64   ( 912 KiB)
>       .bss  : 0x00387900 - 0x003aaa64   ( 141 KiB)
> SLUB: HWalign=16, Order=0-3, MinObjects=0, CPUs=1, Nodes=8
> NR_IRQS:72
> Killing onboard sonic... Done.
> WARNING: Persistent clock returned invalid value!
>          Check your CMOS/BIOS settings.
> Console: colour dummy device 80x25
> console [ttyS0] enabled
> Calibrating delay loop... 5.81 BogoMIPS (lpj=29056)
> pid_max: default: 32768 minimum: 301
> Mount-cache hash table entries: 1024 (order: 0, 4096 bytes)
> Mountpoint-cache hash table entries: 1024 (order: 0, 4096 bytes)
> devtmpfs: initialized
> clocksource jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 1911s
> NET: Registered protocol family 16
> NuBus: Scanning NuBus slots.
> Slot E:
>   Board resource:
>     type: [cat 0x1 type 0x0 hw 0x0 sw 0x0]
>     name: Farallon EtherMac LC-TP
>     board id: 0x8
>     vendor info:
>     ID: Farallon
>     revision: 001
>     part: PN 592a-TP
>   Function 0x80:
>     type: [cat 0x4 type 0x1 hw 0x10c sw 0x100]
>     name: Farallon EtherMac LC-TP
>     memory offset: 0x000d0000
>     MAC address: 00:00:c5:43:36:11
> SCSI subsystem initialized
> NET: Registered protocol family 2
> TCP established hash table entries: 1024 (order: 0, 4096 bytes)
> TCP bind hash table entries: 1024 (order: 0, 4096 bytes)
> TCP: Hash tables configured (established 1024 bind 1024)
> UDP hash table entries: 256 (order: 0, 4096 bytes)
> UDP-Lite hash table entries: 256 (order: 0, 4096 bytes)
> NET: Registered protocol family 1
> RPC: Registered named UNIX socket transport module.
> RPC: Registered udp transport module.
> RPC: Registered tcp transport module.
> RPC: Registered tcp NFSv4.1 backchannel transport module.
> futex hash table entries: 256 (order: -1, 3072 bytes)
> NFS: Registering the id_resolver key type
> Key type id_resolver registered
> Key type id_legacy registered
> Block layer SCSI generic (bsg) driver version 0.4 loaded (major 253)
> io scheduler noop registered
> io scheduler deadline registered (default)
> macfb: framebuffer at 0x60b00000, mapped to 0xd0000000, size 507k
> macfb: mode is 832x624x8, linelength=832
> Console: switching to colour frame buffer device 104x39
> fb0: Sonora frame buffer device
> pmac_zilog: 0.6 (Benjamin Herrenschmidt <benh@kernel.crashing.org>)
> scc.0: ttyS0 at MMIO 0x50f04002 (irq = 4, base_baud = 230400) is a Z85c30 ESCC t
> scc.1: ttyS1 at MMIO 0x50f04000 (irq = 4, base_baud = 230400) is a Z85c30 ESCC t
> brd: module loaded
> Warning: no ADB interface detected
> Uniform Multi-Platform E-IDE driver
> ide-gd driver 1.18
> scsi host0: Macintosh NCR5380 SCSI, irq 19, io_port 0x0, base 0x50f10000, can_q 
> scsi 0:0:0:0: Direct-Access     SEAGATE  ST318416N        0010 PQ: 0 ANSI: 3
> kernel BUG at block/deadline-iosched.c:332!
> *** TRAP #7 ***   FORMAT=0
> Current process id is 1
> BAD KERNEL TRAP: 00000000
> Modules linked in:
> PC: [<001882f2>] deadline_merge+0x0/0x8a
> SR: 2000  SP: 02031ba0  a2: 0202c000
> d0: 0000002b    d1: 00000059    d2: 00000000    d3: 00086c86
> d4: 020cb8a8    d5: 00000001    a0: 00373d8e    a1: 00373d92
> Process swapper (pid: 1, task=0202c000)
> Frame format=0 
> Stack from 02031bd4:
>         0032302f 00337762 0000014c 0017392a 0213a200 0211d2c4 0211d0f4 00178d2c
>         0213a200 0211d2e0 0037ba98 0018a144 0211d2c4 0213b014 020cba50 020cb800
>         020cb8a8 001f0dc2 0211d2e0 00000000 00000003 00000002 001f0ccc 020cb8d0
>         020cb8d8 001915c0 0002881e 020cba50 020cb8d8 001f0cc8 001f0ccc 020cba50
>         001cc0f6 020cb8d0 020efcc0 020cb8f4 0037fe28 0018a144 020cb8d8 00000000
>         020cb800 02031cd2 0213b300 001ee63c 020cb8f4 020ce120 ffffffff ffffffff
> Call Trace: [<0017392a>] elevator_exit+0x24/0x40
>  [<00178d2c>] blk_release_queue+0x44/0xce
>  [<0018a144>] kobject_release+0x3a/0x7c
>  [<001f0dc2>] scsi_device_dev_release_usercontext+0xf6/0x134
>  [<001f0ccc>] scsi_device_dev_release_usercontext+0x0/0x134
>  [<001915c0>] memset+0x0/0x8c
>  [<0002881e>] execute_in_process_context+0x52/0x5a
>  [<001f0cc8>] scsi_device_dev_release+0x16/0x1a
>  [<001f0ccc>] scsi_device_dev_release_usercontext+0x0/0x134
>  [<001cc0f6>] device_release+0x26/0xa6
>  [<0018a144>] kobject_release+0x3a/0x7c
>  [<001ee63c>] scsi_probe_and_probe_and_add_lun+0x0/0xb92
>  [<001e5608>] scsi_is_host_device+0x0/0x14
>  [<001cbf80>] put_device+0x0/0x14
>  [<001d32ee>] transx4c4
>  [<002c0920>] mutex_lock+0x0/0x22
>  [<001d119e>] platform_drv_probe+0x16/0x44
>  [<001cff9c>] driver_probe_device+0x17e/0x2
> 
