From: "Christian T. Steigies" <cts@debian.org>
Subject: Re: kullervo with bigram
Date: Sun, 18 Jan 2015 12:53:55 +0100
Message-ID: <20150118115355.GA20168@guido.earth.sol>
References: <54BACEB6.6060805@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <54BACEB6.6060805@debian.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Linux/m68k <linux-m68k@lists.linux-m68k.org>, Debian m68k <debian-68k@lists.debian.org>

Sending this again, without large attachments. Systtem.map, config and dmesg
are here:

https://people.debian.org/~cts/kernel/

On Sat, Jan 17, 2015 at 10:05:58PM +0100, Christian T. Steigies wrote:
> Hi,
> we installed a new buster and bigram in kullervo today. With the
> 3.16 kernel from Debian (which was running fine before installing
> bigram) we get a kernel panic, see the attached dmesg.
> 
> Christian

dmesg:

> Searching for SAVEKMSG magic...
> Found 7122 bytes at 0x001e0010
> >>>>>>>>>>>>>>>>>>>>
> [    0.000000] Initializing cgroup subsys cpuset
> [    0.000000] Initializing cgroup subsys cpu
> [    0.000000] Initializing cgroup subsys cpuacct
> [    0.000000] Linux version 3.16.0-4-m68k (debian-kernel@lists.debian.org) (gcc version 4.8.3 (Debian 4.8.3-16) ) #1 Debian 3.16.7-ckt2-1 (2014-12-08)
> [    0.000000] Enabling workaround for errata I14
> [    0.000000] console [debug0] enabled
> [    0.000000] Amiga hardware found: [A3000] VIDEO BLITTER AMBER_FF AUDIO FLOPPY A3000_SCSI KEYBOARD MOUSE SERIAL PARALLEL A3000_CLK CHIP_RAM PAULA DENISE_HR AGNUS_HR_PAL MAGIC_REKICK ZORRO3 
> [    0.000000] Ignoring memory chunk at 0x7000000:0x1000000 before the first chunk
> [    0.000000] Fix your bootloader or use a memfile to make use of this area!
> [    0.000000] On node 0 totalpages: 28672
> [    0.000000] free_area_init_node: node 0, pgdat 002f7320, node_mem_map 003aa000
> [    0.000000]   DMA zone: 252 pages used for memmap
> [    0.000000]   DMA zone: 0 pages reserved
> [    0.000000]   DMA zone: 28672 pages, LIFO batch:7
> [    0.000000] On node 1 totalpages: 65536
> [    0.000000] free_area_init_node: node 1, pgdat 002f7c20, node_mem_map 004a6410
> [    0.000000]   DMA zone: 576 pages used for memmap
> [    0.000000]   DMA zone: 0 pages reserved
> [    0.000000]   DMA zone: 65536 pages, LIFO batch:15
> [    0.000000] initrd: 06b9325b - 07000000
> [    0.000000] pcpu-alloc: s0 r0 d32768 u32768 alloc=1*32768
> [    0.000000] pcpu-alloc: [0] 0 
> [    0.000000] Built 2 zonelists in Zone order, mobility grouping on.  Total pages: 93380
> [    0.000000] Kernel command line: root=/dev/sda5 fb=false video=amifb:ntsc-lace debug=mem BOOT_IMAGE=Work:linux/kernel/vmlinux-3.16.0-4-m68k
> [    0.000000] PID hash table entries: 2048 (order: 1, 8192 bytes)
> [    0.000000] Dentry cache hash table entries: 65536 (order: 6, 262144 bytes)
> [    0.000000] Inode-cache hash table entries: 32768 (order: 5, 131072 bytes)
> [    0.000000] Sorting __ex_table...
> [    0.000000] Memory: 364812K/376832K available (2139K kernel code, 358K rwdata, 684K rodata, 144K init, 161K bss, 12020K reserved)
> [    0.000000] Virtual kernel memory layout:
> [    0.000000]     vector  : 0x002f6e18 - 0x002f7218   (   1 KiB)
> [    0.000000]     kmap    : 0xd0000000 - 0xf0000000   ( 512 MiB)
> [    0.000000]     vmalloc : 0x48800000 - 0xd0000000   (2168 MiB)
> [    0.000000]     lowmem  : 0x00000000 - 0x48000000   (1152 MiB)
> [    0.000000]       .init : 0x00320000 - 0x00344000   ( 144 KiB)
> [    0.000000]       .text : 0x00001000 - 0x00217fb0   (2140 KiB)
> [    0.000000]       .data : 0x0021a938 - 0x0031f420   (1043 KiB)
> [    0.000000]       .bss  : 0x002f6d20 - 0x0031f420   ( 162 KiB)
> [    0.000000] NR_IRQS:200
> [    0.000000] Console: colour dummy device 80x25
> [    0.010000] console [tty0] enabled
> [    0.010000] Calibrating delay loop... 98.71 BogoMIPS (lpj=493568)
> [    0.100000] pid_max: default: 32768 minimum: 301
> [    0.100000] Mount-cache hash table entries: 1024 (order: 0, 4096 bytes)
> [    0.100000] Mountpoint-cache hash table entries: 1024 (order: 0, 4096 bytes)
> [    0.120000] Initializing cgroup subsys memory
> [    0.120000] Initializing cgroup subsys devices
> [    0.120000] Initializing cgroup subsys freezer
> [    0.120000] Initializing cgroup subsys net_cls
> [    0.120000] Initializing cgroup subsys blkio
> [    0.120000] Initializing cgroup subsys net_prio
> [    0.150000] devtmpfs: initialized
> [    0.180000] NET: Registered protocol family 16
> [    0.290000] SCSI subsystem initialized
> [    0.520000] NET: Registered protocol family 2
> [    0.540000] TCP established hash table entries: 4096 (order: 2, 16384 bytes)
> [    0.540000] TCP bind hash table entries: 4096 (order: 2, 16384 bytes)
> [    0.540000] TCP: Hash tables configured (established 4096 bind 4096)
> [    0.540000] TCP: reno registered
> [    0.540000] UDP hash table entries: 256 (order: 0, 4096 bytes)
> [    0.540000] UDP-Lite hash table entries: 256 (order: 0, 4096 bytes)
> [    0.550000] NET: Registered protocol family 1
> [    0.560000] Unpacking initramfs...
> [    9.700000] Freeing initrd memory: 4528K (06b94000 - 07000000)
> [    9.710000] futex hash table entries: 256 (order: -1, 3072 bytes)
> [    9.720000] zbud: loaded
> [    9.730000] VFS: Disk quotas dquot_6.5.2
> [    9.730000] Dquot-cache hash table entries: 1024 (order 0, 4096 bytes)
> [    9.730000] msgmni has been set to 721
> [    9.770000] alg: No test for stdrng (krng)
> [    9.770000] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 253)
> [    9.780000] io scheduler noop registered
> [    9.780000] io scheduler cfq registered (default)
> [    9.930000] Console: switching to colour frame buffer device 80x25
> [   10.010000] fb0: Amiga ECS frame buffer device, using 640K of video memory
> [   10.020000] atafb_init: start
> [   10.040000] pmac_zilog: 0.6 (Benjamin Herrenschmidt <benh@kernel.crashing.org>)
> [   10.050000] Amiga-builtin serial driver version 4.30
> [   10.060000] ttyS0 is the amiga builtin serial port
> [   10.100000] Zorro: Probing AutoConfig expansion devices: 3 devices
> [   10.120000]  zorro: Address space collision on device Zorro device 0e3b2000 [??? 0x40000000-0x4fffffff flags 0x0]
> [   10.160000] mousedev: PS/2 mouse device common for all mice
> [   10.180000] input: amiga-keyboard as /devices/platform/amiga-keyboard/input/input0
> [   10.200000] rtc-rp5c01 rtc-rp5c01: rtc core: registered rtc-rp5c01 as rtc0
> [   10.220000] ledtrig-cpu: registered to indicate activity on CPUs
> [   10.240000] TCP: cubic registered
> [   10.250000] NET: Registered protocol family 17
> [   10.260000] mpls_gso: MPLS GSO support
> [   10.290000] registered taskstats version 1
> [   10.310000] rtc-rp5c01 rtc-rp5c01: setting system clock to 2015-01-17 17:45:57 UTC (1421516757)
> [   10.320000] Freeing unused kernel memory: 144K (00320000 - 00344000)
> [   10.340000] pc=0x122478, fa=0x8000ef4c
> [   10.350000] 68060 access error, fslw=810040
> [   10.360000] Failed to execute /init (error -14)
> [   10.380000] pc=0x9c23e, fa=0x2ce0c8
> [   10.390000] 68060 access error, fslw=1010040
> [   10.410000] Starting init: /bin/sh exists but couldn't execute it (error -14)
> [   10.420000] Kernel panic - not syncing: No working init found.  Try passing init= option to kernel. See Linux Documentation/init.txt for guidance.
> [   10.420000] CPU: 0 PID: 1 Comm: init Not tainted 3.16.0-4-m68k #1 Debian 3.16.7-ckt2-1
> [   10.420000] Stack from 06435f8c:
>         06435f8c 0028e286 00212478 00000000 00000000 00000000 00000000 00002036
>         00000000 00000000 00000000 00211bdc 002751cc 00211b12 0000280c 00000000
>         00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
>         00000000 00000000 00000000 20000000 00000000
> [   10.420000] Call Trace: [<00212478>] panic+0x78/0x1d8
> [   10.420000]  [<00002036>] try_to_run_init_process+0x0/0x36
> [   10.420000]  [<00211bdc>] kernel_init+0xca/0xd0
> [   10.420000]  [<00211b12>] kernel_init+0x0/0xd0
> [   10.420000]  [<0000280c>] ret_from_kernel_thread+0xc/0x14
> [   10.420000] 
> [   10.420000] ---[ end Kernel panic - not syncing: No working init found.  Try passing init= option to kernel. See Linux Documentation/init.txt for guidance.
> [   20.530000] amikbd: Ctrl-Amiga-Amiga reset warning!!
> <<<<<<<<<<<<<<<<<<<<

/proc/iomem:
> 00000000-001dffff : Chip RAM
>   00000000-00000fff : Beep
>   00001000-000a1fff : amifb [RAM]
>   000a2000-000a9fff : Floppy
>   000aa000-000b9fff : z2ram
>   000ba000-000c9fff : z2ram
>   000ca000-000d9fff : z2ram
>   000da000-000e9fff : z2ram
>   000ea000-000f9fff : z2ram
>   000fa000-00109fff : z2ram
>   0010a000-00119fff : z2ram
>   0011a000-00129fff : z2ram
>   0012a000-00139fff : z2ram
>   0013a000-00149fff : z2ram
>   0014a000-00159fff : z2ram
>   0015a000-00169fff : z2ram
>   0016a000-00179fff : z2ram
>   0017a000-00189fff : z2ram
>   0018a000-00199fff : z2ram
>   0019a000-001a9fff : z2ram
> 00200000-009fffff : Zorro II mem
> 00bfd000-00bfdfff : CIA B
>   00bfd400-00bfd5ff : timer
> 00bfe000-00bfefff : CIA A
> 00dc0000-00dcffff : rtc-rp5c01
> 00dd0000-00dd00ff : amiga-a3000-scsi
>   00dd0000-00dd00ff : wd33c93
> 00dff000-00dfffff : Custom I/O
> 00e80000-00efffff : Zorro II exp
>   00e90000-00e9ffff : Village Tronic Ariadne II [Ethernet Card]
>     00e90600-00e9067f : zorro8390
>   00ea0000-00ebffff : Phase 5 CyberStorm Mk II [Flash ROM]
> 00f80000-00ffffff : Kickstart ROM
> 07000000-07ffffff : 32-bit Fast RAM
> 08000000-0effffff : 32-bit Fast RAM
> 40000000-7fffffff : Zorro III cfg
>   40000000-4fffffff : 32-bit Fast RAM
> ff000000-ffffffff : Zorro III exp
