From: "Christian T. Steigies" <cts@debian.org>
Subject: Re: linux 3.10.1 with initrd
Date: Wed, 31 Jul 2013 11:01:07 +0200
Message-ID: <20130731090107.GA22608@chumley.earth.sol>
References: <alpine.DEB.2.02.1305132122190.14304@tglase.lan.tarent.de>
 <CAMuHMdX+t0=J+8a1JoF6Jf=gO_ROuL_kgAVjF0DJA-cgPGp_Ng@mail.gmail.com>
 <Pine.BSM.4.64L.1305132126170.11828@herc.mirbsd.org>
 <5192331E.9010009@debian.org>
 <Pine.BSM.4.64L.1305141338580.14676@herc.mirbsd.org>
 <20130514144112.GH11842@chumley.earth.sol>
 <Pine.BSM.4.64L.1305141642360.9568@herc.mirbsd.org>
 <Pine.BSM.4.64L.1307201716460.31890@herc.mirbsd.org>
 <CAMuHMdVj_xZWYc1Cszun0F6Xrrz0=e_EJN4b1cqdbcRqgC7ABg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-in-04.arcor-online.net ([151.189.21.44]:51300 "EHLO
	mail-in-04.arcor-online.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1759202Ab3GaJBL (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>);
	Wed, 31 Jul 2013 05:01:11 -0400
Content-Disposition: inline
In-Reply-To: <CAMuHMdVj_xZWYc1Cszun0F6Xrrz0=e_EJN4b1cqdbcRqgC7ABg@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Thorsten Glaser <tg@mirbsd.de>, Debian m68k <debian-68k@lists.debian.org>, Linux/m68k <linux-m68k@vger.kernel.org>

Not sure if this is the correct thread, but crest is working with your new
kernel, without using a memfile! The only thing that does not work seems to
be nfs so far... maybe I should check the cirrusfb driver and also try to
set this up in AmigaOS so a standard VGA monitor would work without any
adapters.

Is gcc-4.8 now the default compiler for all buildds?

Christian

[    0.000000] Linux version 3.10-0+m68k.2-m68k (debian-kernel@lists.debian.org) (gcc version 4.8.1 (Debian 4.8.1-7+m68k.1) ) #1 Debian 3.10.1-1+m68k.5 (2013-07-24)
[    0.000000] Enabling workaround for errata I14
[    0.000000] console [debug0] enabled
[    0.000000] Amiga hardware found: [A4000] VIDEO BLITTER AUDIO FLOPPY A4000_IDE KEYBOARD MOUSE SERIAL PARALLEL A3000_CLK CHIP_RAM PAULA LISA ALICE_PAL ZORRO3 
[    0.000000] On node 0 totalpages: 32768
[    0.000000] free_area_init_node: node 0, pgdat 002a3c14, node_mem_map 00314000
[    0.000000]   DMA zone: 288 pages used for memmap
[    0.000000]   DMA zone: 0 pages reserved
[    0.000000]   DMA zone: 32768 pages, LIFO batch:7
[    0.000000] initrd: 07cb3f1f - 08000000
[    0.000000] pcpu-alloc: s0 r0 d32768 u32768 alloc=1*32768
[    0.000000] pcpu-alloc: [0] 0 
[    0.000000] Built 1 zonelists in Zone order, mobility grouping on.  Total pages: 32480
[    0.000000] Kernel command line: root=/dev/hda3 fb=false video=amifb:ntsc-lace debug=mem
[    0.000000] PID hash table entries: 512 (order: -1, 2048 bytes)
[    0.000000] Dentry cache hash table entries: 16384 (order: 4, 65536 bytes)
[    0.000000] Inode-cache hash table entries: 8192 (order: 3, 32768 bytes)
[    0.000000] Sorting __ex_table...
[    0.000000] Memory: 123252k/123252k available (1888k kernel code, 5792k data, 140k init)
[    0.000000] Virtual kernel memory layout:
[    0.000000]     vector  : 0x002a370c - 0x002a3b0c   (   1 KiB)
[    0.000000]     kmap    : 0xd0000000 - 0xf0000000   ( 512 MiB)
[    0.000000]     vmalloc : 0x08800000 - 0xd0000000   (3192 MiB)
[    0.000000]     lowmem  : 0x00000000 - 0x08000000   ( 128 MiB)
[    0.000000]       .init : 0x002ca000 - 0x002ed000   ( 140 KiB)
[    0.000000]       .text : 0x00001000 - 0x001d8668   (1886 KiB)
[    0.000000]       .data : 0x001dac60 - 0x002c94d4   ( 955 KiB)
[    0.000000]       .bss  : 0x002a34e0 - 0x002c94d4   ( 152 KiB)
[    0.000000] NR_IRQS:200
[    0.000000] Console: colour dummy device 80x25
[    0.000000] console [tty0] enabled
[    0.010000] Calibrating delay loop... 98.20 BogoMIPS (lpj=491008)
[    0.100000] pid_max: default: 32768 minimum: 301
[    0.100000] Mount-cache hash table entries: 512
[    0.130000] devtmpfs: initialized
[    0.150000] NET: Registered protocol family 16
[    0.200000] bio: create slab <bio-0> at 0
[    0.220000] SCSI subsystem initialized
[    0.390000] NET: Registered protocol family 2
[    0.400000] TCP established hash table entries: 1024 (order: 1, 8192 bytes)
[    0.410000] TCP bind hash table entries: 1024 (order: 0, 4096 bytes)
[    0.410000] TCP: Hash tables configured (established 1024 bind 1024)
[    0.410000] TCP: reno registered
[    0.410000] UDP hash table entries: 256 (order: 0, 4096 bytes)
[    0.410000] UDP-Lite hash table entries: 256 (order: 0, 4096 bytes)
[    0.420000] NET: Registered protocol family 1
[    0.420000] Unpacking initramfs...
[    7.370000] Freeing initrd memory: 3376K (7cb4000 - 8000000)
[    7.390000] VFS: Disk quotas dquot_6.5.2
[    7.390000] Dquot-cache hash table entries: 1024 (order 0, 4096 bytes)
[    7.390000] msgmni has been set to 247
[    7.410000] alg: No test for stdrng (krng)
[    7.410000] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 253)
[    7.410000] io scheduler noop registered (default)
[    7.640000] Console: switching to colour frame buffer device 80x25
[    7.680000] fb0: Amiga AGA frame buffer device, using 1280K of video memory
[    7.690000] atafb_init: start
[    7.700000] pmac_zilog: 0.6 (Benjamin Herrenschmidt <benh@kernel.crashing.org>)
[    7.710000] Amiga-builtin serial driver version 4.30
[    7.720000] ttyS0 is the amiga builtin serial port
[    7.740000] Zorro: Probing AutoConfig expansion devices: 3 devices
[    7.750000] cirrusfb 00: CL Picasso4 board detected, REG at 0x40600000, 4 MiB RAM at 0x41000000
[    7.760000] cirrusfb 00: Cirrus Logic chipset on Zorro bus, RAM (4 MiB) at 0x41000000
[    7.790000] mousedev: PS/2 mouse device common for all mice
[    7.810000] input: amiga-keyboard as /devices/platform/amiga-keyboard/input/input0
[    7.820000] rtc-rp5c01 rtc-rp5c01: rtc core: registered rtc-rp5c01 as rtc0
[    7.830000] TCP: cubic registered
[    7.840000] NET: Registered protocol family 17
[    7.860000] registered taskstats version 1
[    7.870000] rtc-rp5c01 rtc-rp5c01: setting system clock to 2013-07-31 07:34:29 UTC (1375256069)
[    7.880000] Freeing unused kernel memory: 140K (2ca000 - 2ed000)
[    9.730000] udevd[43]: starting version 175
[   11.210000] FD: probing units
[   11.210000] found fd0 
[   11.490000] Uniform Multi-Platform E-IDE driver
[   12.160000] ide: Gayle IDE controller (A4000 style)
[   12.170000] Probing IDE interface ide0...
[   12.870000] eth0: X-Surf at 0x00e90000, Ethernet Address 00:c0:f0:51:c1:21
[   12.890000] hda: SAMSUNG SP1614N, ATA DISK drive
[   13.140000] Z2RAM: using 0K Zorro II RAM and 384K Chip RAM (Total 384K)
[   13.620000] ide0 at 0x80dd2020 on irq 2 (serialized)
[   16.160000] ide-gd driver 1.18
[   16.180000] hda: max request size: 512KiB
[   16.240000] hda: 312581808 sectors (160041 MB) w/8192KiB Cache, CHS=19457/255/63
[   16.250000] hda: cache flushes supported
[   16.290000]  hda: RDSK (512) hda1 (DOS^C)(res 2 spb 1) hda2 (DOS^C)(res 2 spb 1) hda3 (LNX^@)(res 2 spb 1) hda4 (LNX^@)(res 2 spb 1)
[   23.970000] kjournald starting.  Commit interval 5 seconds
[   23.980000] EXT3-fs (hda3): mounted filesystem with ordered data mode
[   42.590000] udevd[231]: starting version 175
[   48.410000] input: amiga-mouse as /devices/platform/amiga-mouse/input/input1
[   49.370000] parport0: Amiga built-in port using irq
[   49.620000] parport0: fix this legacy no-device port driver!
[   50.160000] Amiga DMA sound driver rev 016 installed
[   50.170000] Core driver edition 01.06 : AMIGA driver edition 00.04
[   50.180000] Write will use    4 fragments of   32768 bytes as default
[   67.800000] device-mapper: uevent: version 1.0.3
[   67.830000] device-mapper: ioctl: 4.24.0-ioctl (2013-01-15) initialised: dm-devel@redhat.com
[   71.460000] bio: create slab <bio-1> at 1
[   78.770000] Adding 4194300k swap on /dev/mapper/crest-swap.  Priority:-1 extents:1 across:4194300k 
[  233.150000] EXT3-fs (hda3): using internal journal
[  254.150000] loop: module loaded
[  260.910000] EXT4-fs (dm-1): mounted filesystem with ordered data mode. Opts: (null)
[  261.010000] EXT4-fs (dm-2): mounted filesystem with ordered data mode. Opts: (null)
[  261.170000] EXT4-fs (dm-3): mounted filesystem with ordered data mode. Opts: (null)
[  282.410000] FS-Cache: Loaded
[  282.460000] Key type dns_resolver registered
[  282.830000] RPC: Registered named UNIX socket transport module.
[  282.840000] RPC: Registered udp transport module.
[  282.850000] RPC: Registered tcp transport module.
[  282.860000] RPC: Registered tcp NFSv4.1 backchannel transport module.
[  283.320000] FS-Cache: Netfs 'nfs' registered for caching
[  288.420000] NET: Registered protocol family 10
