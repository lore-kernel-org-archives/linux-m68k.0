Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DE9DC433C1
	for <linux-m68k@archiver.kernel.org>; Thu, 25 Mar 2021 09:46:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BEF7E61A1E
	for <linux-m68k@archiver.kernel.org>; Thu, 25 Mar 2021 09:46:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229934AbhCYJqN (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 25 Mar 2021 05:46:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:42398 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229989AbhCYJp7 (ORCPT <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 25 Mar 2021 05:45:59 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id E4E0A61A0A;
        Thu, 25 Mar 2021 09:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1616665559;
        bh=imUwwKjBBe26NsLwnuU65gnbTUinglj7MTUsG0EZlcw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=n7mbVLtb6lR46mcWi3gJj/ypMZkcTWanN7wlfniujiTDNY4k0gI9tftU14Nw6ETjw
         t0YXsmvBbDwV6dN39YYpL3kPjJP5EGyHHZC8QdCtkGMWlCYMfl12BDUNRrhOKa+qO9
         21UaTlSh6RXmCESoogicaaC0960vO1PZrXrodlt+d+YvW4561kVH++FEyuWYzeKETB
         7U0e2qdOMSz/PB/eVvLFjwyUgCRI2wwvJiYvXQqJKD5rJIEkBDD3HflQBJm/Ljo5mH
         YoOVWFl8Z/KIQqYj/6jIHcIKBCW55F6WyRmCBdCa3BSurolmMkWEw4ss/XvJSs5nHk
         SrwU1dj6gY4tg==
Date:   Thu, 25 Mar 2021 11:45:53 +0200
From:   Mike Rapoport <rppt@kernel.org>
To:     Finn Thain <fthain@telegraphics.com.au>
Cc:     linux-m68k@lists.linux-m68k.org, Stan Johnson <userm57@yahoo.com>
Subject: Re: v5.11 (CONFIG_FLATMEM) boot crash
Message-ID: <YFxb0d94yV/635vT@kernel.org>
References: <25bd53c4-8d29-5457-13a4-2e34011d796@telegraphics.com.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <25bd53c4-8d29-5457-13a4-2e34011d796@telegraphics.com.au>
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Thu, Mar 25, 2021 at 02:03:25PM +1100, Finn Thain wrote:
> Hi All,
> 
> Stan has sent me a series of logs from v5.10 and v5.11 showing a 
> regression apparently caused by the deprecation of CONFIG_DISCONTIGMEM. 
> 
> This v5.11 kernel build has CONFIG_FLATMEM=y and 
> CONFIG_FORCE_MAX_ZONEORDER=11 which is now the default. The 5.10 build has 
> CONFIG_DISCONTIGMEM=y.
> 
> This system is a Mac IIci, which has two RAM banks. Bank A has physical 
> address 0 and bank B has 0x04000000. This model often has two 
> discontiguous RAM chunks. However, installing 64 MB in bank A does avoid 
> that.
> 
> There is a bootloader issue in play here. The bootloader (Penguin) prefers 
> to locate the kernel and initrd in the largest bank. Hence it may fail to 
> choose the lowest bank even when that bank is sufficiently large. When 
> that happens, Linux is unable to use the RAM in bank A.
> 
> Linux has always complained about this situation but now it crashes. This 
> seems to be a regression in v5.11. Can anyone help debug this?

There was a bug in the definition of ARCH_PFN_OFFSET that's quite probably
causes the crashes when the kernel is located in the second memory bank.

The fix was posted a while ago:

https://lore.kernel.org/linux-m68k/20210228190828.392974-1-angelo@kernel-space.org
 
Can you check if this helps?

> These are some of the configurations Stan has tested (figures in MB):
> 
> Bank A    Bank B    v5.10 memory   v5.11 memory
> -----------------------------------------------
>  1        16        16             crash (log below)
> 16         1        17             17 (log below)
> 16        64        64             crash
> 64        16        80             80
> 
> ABCFGHIJK
> [    0.000000] Linux version 5.11.0-mac (fthain@nippy) (m68k-linux-gnu-gcc (btc) 6.4.0, GNU ld (btc) 2.28) #1 Tue Mar 16 16:56:05 AEDT 2021
> [    0.000000] Saving 414 bytes of bootinfo
> [    0.000000] printk: bootconsole [debug0] enabled
> [    0.000000] Detected Macintosh model: 11
> [    0.000000] Apple Macintosh IIci
> [    0.000000] Ignoring memory chunk at 0x0:0x100000 before the first chunk
> [    0.000000] Fix your bootloader or use a memfile to make use of this area!
> [    0.000000] Zone ranges:
> [    0.000000]   DMA      [mem 0x0000000004000000-0x0000004fffffffff]
> [    0.000000]   Normal   empty
> [    0.000000] Movable zone start for each node
> [    0.000000] Early memory node ranges
> [    0.000000]   node   0: [mem 0x0000000004000000-0x0000000004ffffff]
> [    0.000000] Initmem setup node 0 [mem 0x0000000004000000-0x0000000004ffffff]
> [    0.000000] Data write fault at 0x7057c000 in Super Data (pc=0x225f12)
> [    0.000000] BAD KERNEL BUSERR
> [    0.000000] Oops: 00000000
> [    0.000000] Modules linked in:
> [    0.000000] PC: [<00225f12>] memset+0x6a/0x9c
> [    0.000000] SR: 2714  SP: (ptrval)  a2: 00485500
> [    0.000000] d0: 00000000    d1: 00000024    d2: 00000001    d3: 0000ffff
> [    0.000000] d4: 00005000    d5: 004ad0a0    a0: 7057c000    a1: 7057c004
> [    0.000000] Process swapper (pid: 0, task=(ptrval))
> [    0.000000] Frame format=A ssw=070d isc=ffee isb=4242 daddr=7057c000 dobuf=00000000
> [    0.000000] Stack from 00483de4:
> [    0.000000]         00004000 00004000 00483e28 004e14c0 7057c000 00000000 00000024 00005000
> [    0.000000]         00004000 00000000 00483e78 00483e74 000ad4f6 004e250c 00483e70 004e13a4
> [    0.000000]         00005000 00483e7c 004e15ba 00001000 00000000 00000000 00004000 00005000
> [    0.000000]         00000000 00000000 00000001 00001000 00000000 00004000 00000000 00000fdc
> [    0.000000]         003a9ef6 003b7be8 004abe54 00004000 00005000 00000000 00483ee4 004d33e2
> [    0.000000]         00001000 00000000 00000000 00004000 00483f58 003a9ef6 00483f44 00000014
> [    0.000000] Call Trace: [<00004000>] hardware_proc_show+0x4c/0x9e
> [    0.000000]  [<00004000>] hardware_proc_show+0x4c/0x9e
> [    0.000000]  [<004e14c0>] memmap_init_zone+0x11c/0x188
> [    0.000000]  [<00005000>] do_notify_resume+0x482/0x60a
> [    0.000000]  [<00004000>] hardware_proc_show+0x4c/0x9e
> [    0.000000]  [<000ad4f6>] zone_batchsize+0x0/0x5a
> [    0.000000]  [<004e250c>] __next_mem_pfn_range+0x0/0x82
> [    0.000000]  [<004e13a4>] memmap_init_zone+0x0/0x188
> [    0.000000]  [<00005000>] do_notify_resume+0x482/0x60a
> [    0.000000]  [<004e15ba>] memmap_init+0x8e/0xae
> [    0.000000]  [<00001000>] kernel_pg_dir+0x0/0x1000
> [    0.000000]  [<00004000>] hardware_proc_show+0x4c/0x9e
> [    0.000000]  [<00005000>] do_notify_resume+0x482/0x60a
> [    0.000000]  [<00001000>] kernel_pg_dir+0x0/0x1000
> [    0.000000]  [<00004000>] hardware_proc_show+0x4c/0x9e
> [    0.000000]  [<003a9ef6>] printk+0x0/0x16
> [    0.000000]  [<00004000>] hardware_proc_show+0x4c/0x9e
> [    0.000000]  [<00005000>] do_notify_resume+0x482/0x60a
> [    0.000000]  [<004d33e2>] free_area_init_node+0x426/0x444
> [    0.000000]  [<00001000>] kernel_pg_dir+0x0/0x1000
> [    0.000000]  [<00004000>] hardware_proc_show+0x4c/0x9e
> [    0.000000]  [<003a9ef6>] printk+0x0/0x16
> [    0.000000]  [<004d2fbc>] free_area_init_node+0x0/0x444
> [    0.000000]  [<004d3962>] free_area_init+0x466/0x492
> [    0.000000]  [<00001000>] kernel_pg_dir+0x0/0x1000
> [    0.000000]  [<00001000>] kernel_pg_dir+0x0/0x1000
> [    0.000000]  [<00004000>] hardware_proc_show+0x4c/0x9e
> [    0.000000]  [<00005000>] do_notify_resume+0x482/0x60a
> [    0.000000]  [<004d397a>] free_area_init+0x47e/0x492
> [    0.000000]  [<004cced0>] kernel_page_table+0x0/0x84
> [    0.000000]  [<00001000>] kernel_pg_dir+0x0/0x1000
> [    0.000000]  [<000012fc>] kernel_pg_dir+0x2fc/0x1000
> [    0.000000]  [<00001000>] kernel_pg_dir+0x0/0x1000
> [    0.000000]  [<00001000>] kernel_pg_dir+0x0/0x1000
> [    0.000000]  [<00004000>] hardware_proc_show+0x4c/0x9e
> [    0.000000]  [<00005000>] do_notify_resume+0x482/0x60a
> [    0.000000]  [<00004000>] hardware_proc_show+0x4c/0x9e
> [    0.000000]  [<00005000>] do_notify_resume+0x482/0x60a
> [    0.000000]  [<004cd40c>] paging_init+0x416/0x422
> [    0.000000]  [<0021e0ea>] strlcpy+0x0/0x6c
> [    0.000000]  [<004cc916>] setup_arch+0x62/0x1f0
> [    0.000000]  [<004cd79a>] mac_parse_bootinfo+0x0/0xee
> [    0.000000]  [<003a9ef6>] printk+0x0/0x16
> [    0.000000]  [<004cca44>] setup_arch+0x190/0x1f0
> [    0.000000]  [<003a9ef6>] printk+0x0/0x16
> [    0.000000]  [<004ca41e>] start_kernel+0x50/0x486
> [    0.000000]  [<004c9410>] _sinittext+0x410/0xadc
> [    0.000000] 
> [    0.000000] Code: 22c0 22c0 22c0 22c0 22c0 22c0 22c0 22c0 <51ca> ffee 4242 5382 6ae6 0801 0001 6704 3280 5489 0801 0000 6702 1280 2008 241f
> [    0.000000] Disabling lock debugging due to kernel taint
> [    0.000000] Kernel panic - not syncing: Attempted to kill the idle task!
> [    0.000000] ---[ end Kernel panic - not syncing: Attempted to kill the idle task! ]---
> 
> ABCFGHIJK
> [    0.000000] Linux version 5.11.0-mac (fthain@nippy) (m68k-linux-gnu-gcc (btc) 6.4.0, GNU ld (btc) 2.28) #1 Tue Mar 16 16:56:05 AEDT 2021
> [    0.000000] Saving 414 bytes of bootinfo
> [    0.000000] printk: bootconsole [debug0] enabled
> [    0.000000] Detected Macintosh model: 11
> [    0.000000] Apple Macintosh IIci
> [    0.000000] Zone ranges:
> [    0.000000]   DMA      [mem 0x0000000000000000-0x00000040ffffffff]
> [    0.000000]   Normal   empty
> [    0.000000] Movable zone start for each node
> [    0.000000] Early memory node ranges
> [    0.000000]   node   0: [mem 0x0000000000000000-0x0000000000ffffff]
> [    0.000000]   node   0: [mem 0x0000000004000000-0x00000000040fffff]
> [    0.000000] Initmem setup node 0 [mem 0x0000000000000000-0x00000000040fffff]
> [    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 4205
> [    0.000000] Kernel command line: ro init=/start.sh root=/dev/sda5 console=tty0 console=ttyS0 earlyprintk
> [    0.000000] Dentry cache hash table entries: 4096 (order: 2, 16384 bytes, linear)
> [    0.000000] Inode-cache hash table entries: 2048 (order: 1, 8192 bytes, linear)
> [    0.000000] Sorting __ex_table...
> [    0.000000] mem auto-init: stack:off, heap alloc:off, heap free:off
> [    0.000000] Memory: 12128K/17408K available (3777K kernel code, 284K rwdata, 820K rodata, 128K init, 111K bss, 5280K reserved, 0K cma-reserved)
> [    0.000000] SLUB: HWalign=16, Order=0-3, MinObjects=0, CPUs=1, Nodes=1
> [    0.000000] NR_IRQS: 72
> [    0.000000] clocksource: via1: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 2439823894983 ns
> [    0.020000] Console: colour dummy device 80x25
> [    0.080000] printk: console [tty0] enabled
> [    0.090000] printk: console [ttyS0] enabled
> [    0.090000] printk: console [ttyS0] enabled
> [    0.100000] printk: bootconsole [debug0] disabled
> [    0.100000] printk: bootconsole [debug0] disabled
> [    0.110000] Calibrating delay loop... 5.83 BogoMIPS (lpj=29184)
> [    0.260000] pid_max: default: 32768 minimum: 301
> [    0.290000] Mount-cache hash table entries: 1024 (order: 0, 4096 bytes, linear)
> [    0.300000] Mountpoint-cache hash table entries: 1024 (order: 0, 4096 bytes, linear)
> [    0.420000] devtmpfs: initialized
> [    0.530000] random: get_random_u32 called from bucket_table_alloc.isra.27+0x70/0x1a6 with crng_init=0
> [    0.580000] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 19112604462750000 ns
> [    0.590000] futex hash table entries: 256 (order: -1, 3072 bytes, linear)
> [    0.630000] NET: Registered protocol family 16
> [    0.670000] DMA: preallocated 128 KiB GFP_KERNEL pool for atomic allocations
> [    0.690000] DMA: preallocated 128 KiB GFP_KERNEL|GFP_DMA pool for atomic allocations
> [    1.360000] NuBus: Scanning NuBus slots.
> [    1.550000] SCSI subsystem initialized
> [    1.630000] clocksource: Switched to clocksource via1
> [    2.370000] NET: Registered protocol family 2
> [    2.440000] tcp_listen_portaddr_hash hash table entries: 512 (order: 0, 4096 bytes, linear)
> [    2.450000] TCP established hash table entries: 1024 (order: 0, 4096 bytes, linear)
> [    2.460000] TCP bind hash table entries: 1024 (order: 0, 4096 bytes, linear)
> [    2.480000] TCP: Hash tables configured (established 1024 bind 1024)
> [    2.500000] UDP hash table entries: 256 (order: 0, 4096 bytes, linear)
> [    2.510000] UDP-Lite hash table entries: 256 (order: 0, 4096 bytes, linear)
> [    2.530000] NET: Registered protocol family 1
> [    2.560000] random: fast init done
> [    2.580000] RPC: Registered named UNIX socket transport module.
> [    2.590000] RPC: Registered udp transport module.
> [    2.600000] RPC: Registered tcp transport module.
> [    2.610000] RPC: Registered tcp NFSv4.1 backchannel transport module.
> [    2.690000] workingset: timestamp_bits=30 max_order=12 bucket_order=0
> [    3.940000] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 253)
> [    3.950000] io scheduler mq-deadline registered
> [    3.990000] macfb: framebuffer at 0xfee00020, mapped to 0x(ptrval), size 480k
> [    4.000000] macfb: mode is 640x480x8, linelength=1024
> [    4.370000] Console: switching to colour frame buffer device 80x30
> [    4.690000] fb0: Toby frame buffer device
> [    4.710000] pmac_zilog: 0.6 (Benjamin Herrenschmidt <benh@kernel.crashing.org>)
> [    4.720000] scc.0: ttyS0 at MMIO 0x50f04002 (irq = 4, base_baud = 230400) is a Z85c30 ESCC - Serial port
> [    4.760000] scc.1: ttyS1 at MMIO 0x50f04000 (irq = 4, base_baud = 230400) is a Z85c30 ESCC - Serial port
> [    4.800000] Non-volatile memory driver v1.3
> [    4.820000] SWIM floppy driver Version 0.2 (2008-10-30)
> [    5.070000] brd: module loaded
> [    5.080000] adb: Mac II ADB Driver v1.0 for Unified ADB
> [    5.110000] Uniform Multi-Platform E-IDE driver
> [    5.130000] ide-gd driver 1.18
> [    5.460000] scsi host0: Macintosh NCR5380 SCSI, irq 19, io_port 0x0, base 0x50010000, can_queue 16, cmd_per_lun 2, sg_tablesize 1, this_id 7, flags { }
> [    5.530000] scsi 0:0:0:0: Direct-Access      codesrc          SCSI2SD  4.2 PQ: 0 ANSI: 2 CCS
> [    5.760000] Detected ADB keyboard, type ANSI.
> [    5.800000] input: ADB keyboard as /devices/virtual/input/input0
> [    5.980000] input: ADB mouse as /devices/virtual/input/input1
> [    6.150000] scsi 0:0:3:0: CD-ROM            PIONEER  CD-ROM DR-124X   1.05 PQ: 0 ANSI: 2
> [    7.070000] sd 0:0:0:0: [sda] 60556288 512-byte logical blocks: (31.0 GB/28.9 GiB)
> [    7.080000] sr 0:0:3:0: [sr0] scsi3-mmc drive: 4x/4x xa/form2 cdda tray
> [    7.090000] cdrom: Uniform CD-ROM driver Revision: 3.20
> [    7.110000] sd 0:0:0:0: [sda] Write Protect is off
> [    7.150000] sd 0:0:0:0: [sda] Cache data unavailable
> [    7.160000] sd 0:0:0:0: [sda] Assuming drive cache: write through
> [    7.290000] sd 0:0:0:0: Attached scsi generic sg0 type 0
> [    7.340000]  sda: [mac] sda1 sda2 sda3 sda4 sda5 sda6 sda7 sda8 sda9
> [    7.370000] sr 0:0:3:0: Attached scsi generic sg1 type 5
> [    7.390000] mac8390 slot.D: Memory length resource not found, probing
> [    7.400000] mac8390 slot.D: MacCon Ethernet (type asante)
> [    7.410000] mac8390 slot.D: MAC 00:00:94:21:84:9a, IRQ 60, 32 KB shared memory at 0xfddd0000, 16-bit access.
> [    7.750000] aoe: AoE v85 initialised.
> [    7.780000] sd 0:0:0:0: [sda] Attached SCSI disk
> [    7.820000] mousedev: PS/2 mouse device common for all mice
> [    7.870000] rtc-generic rtc-generic: registered as rtc0
> [    7.910000] NET: Registered protocol family 17
> [    7.930000] printk: bootconsole [debug0] disabled
> [    7.990000] EXT4-fs (sda5): mounting ext3 file system using the ext4 subsystem
> [    8.830000] EXT4-fs (sda5): mounted filesystem with ordered data mode. Opts: (null). Quota mode: disabled.
> [    8.860000] VFS: Mounted root (ext3 filesystem) readonly on device 8:5.
> [    8.880000] Freeing unused kernel memory: 128K
> [    8.890000] This architecture does not have kernel memory protection.
> [    8.910000] Run /start.sh as init process
> [   20.830000] random: crng init done
> # cat /proc/meminfo
> MemTotal:          12256 kB
> MemFree:            2636 kB
> MemAvailable:       8652 kB
> Buffers:            2592 kB
> Cached:             4508 kB
> SwapCached:            0 kB
> Active:             4884 kB
> Inactive:           2352 kB
> Active(anon):          8 kB
> Inactive(anon):      124 kB
> Active(file):       4876 kB
> Inactive(file):     2228 kB
> Unevictable:           0 kB
> Mlocked:               0 kB
> SwapTotal:             0 kB
> SwapFree:              0 kB
> Dirty:                 0 kB
> Writeback:             0 kB
> AnonPages:           152 kB
> Mapped:             1200 kB
> Shmem:                 0 kB
> KReclaimable:        232 kB
> Slab:               1680 kB
> SReclaimable:        232 kB
> SUnreclaim:         1448 kB
> KernelStack:         256 kB
> PageTables:            4 kB
> NFS_Unstable:          0 kB
> Bounce:                0 kB
> WritebackTmp:          0 kB
> CommitLimit:        6128 kB
> Committed_AS:        800 kB
> VmallocTotal:    3334144 kB
> VmallocUsed:          64 kB
> VmallocChunk:          0 kB
> Percpu:               32 kB
> # reboot -f
> [   66.740000] reboot: Restarting system
> 

-- 
Sincerely yours,
Mike.
