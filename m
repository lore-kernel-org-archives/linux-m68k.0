From: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>
Subject: Re: [PATCH] m68k: handle Atari interrupts in multi-platform kernels
Date: Tue, 13 Aug 2013 19:57:00 +1200
Message-ID: <f853f42622f9fd3b1f832a3b2b1d04ae@biophys.uni-duesseldorf.de>
References: <201308092135.r79LZwL1013105@herc.mirbsd.org> <Pine.BSM.4.64L.1308092147300.28970@herc.mirbsd.org>
Mime-Version: 1.0 (Apple Message framework v624)
Content-Type: text/plain; charset=WINDOWS-1252;
	delsp=yes	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pa0-f41.google.com ([209.85.220.41]:49893 "EHLO
	mail-pa0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750929Ab3HMH5M convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 13 Aug 2013 03:57:12 -0400
Received: by mail-pa0-f41.google.com with SMTP id bj1so8029777pad.28
        for <linux-m68k@vger.kernel.org>; Tue, 13 Aug 2013 00:57:12 -0700 (PDT)
In-Reply-To: <Pine.BSM.4.64L.1308092147300.28970@herc.mirbsd.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Thorsten Glaser <tg@mirbsd.de>
Cc: linux-m68k@vger.kernel.org, debian-68k@lists.debian.org

Thorsten,


> Dixi quod=85
>
>> Authors: Michael Schmitz, Geert Uytterhoeven
>> Source: =20
>> http://thread.gmane.org/gmane.linux.debian.devel.kernel/91476/=20
>> focus=3D5003
>
> I felt I could not name a single author (=93From=94) which
> is why I submitted this as-is.

It really was Geert's work, I did not meaningfully contribute to that.

>
>> Tested-By: Thorsten Glaser <tg@debian.org>
>
> I=92m successfully running this on my buildd VM now, with the
> patch to use generic div64.h instead of machdep one; dmesg
> follows. I=92m also building a kernel package with Andreas=92
> patch, expected to be compiled at about 16:00 UTC tomorrow
> if past times are reliable, and will send a Tested-By line
> for that patch too afterwards.
>
> Debian 3.10.5-1+m68k.1 is
> =95 generic div64
> =95 this interrupt patch
>
> Debian 3.10.5-1+m68k.2 will be
> =95 machdep div64 with <871u633t27.fsf@igel.home> applied
> =95 this interrupt patch

Having revived my Falcon, I should be in a position to test these.

Cheers,

	Michael


>
> [    0.000000] Linux version 3.10-2-m68k =20
> (debian-kernel@lists.debian.org) (gcc version 4.8.1 (Debian =20
> 4.8.1-7+m68k.1) ) #1 Debian 3.10.5-1+m68k.1 (2013-08-08)
> [    0.000000] console [debug0] enabled
> [    0.000000] Atari hardware found: VIDEL STDMA-SCSI ST_MFP YM2149 =20
> PCM CODEC DSP56K SCC ANALOG_JOY BLITTER IDE TT_CLK FDC_SPEED
> [    0.000000] NatFeats found (ARAnyM, 1.0)
> [    0.000000] On node 0 totalpages: 3584
> [    0.000000] free_area_init_node: node 0, pgdat 002a1c14, =20
> node_mem_map 003bf000
> [    0.000000]   DMA zone: 32 pages used for memmap
> [    0.000000]   DMA zone: 0 pages reserved
> [    0.000000]   DMA zone: 3584 pages, LIFO batch:0
> [    0.000000] On node 1 totalpages: 196608
> [    0.000000] free_area_init_node: node 1, pgdat 002a24cc, =20
> node_mem_map 003e3090
> [    0.000000]   DMA zone: 1728 pages used for memmap
> [    0.000000]   DMA zone: 0 pages reserved
> [    0.000000]   DMA zone: 196608 pages, LIFO batch:31
> [    0.000000] initrd: 01000000 - 018d5200
> [    0.000000] pcpu-alloc: s0 r0 d32768 u32768 alloc=3D1*32768
> [    0.000000] pcpu-alloc: [0] 0
> [    0.000000] Built 2 zonelists in Zone order, mobility grouping on.=
  =20
> Total pages: 198432
> [    0.000000] Kernel command line: root=3D/dev/nfhd8p1 console=3Dtty=
 =20
> debug=3Dpar devtmpfs.mount=3D1 BOOT_IMAGE=3Dvmlinux
> [    0.000000] PID hash table entries: 4096 (order: 2, 16384 bytes)
> [    0.000000] Dentry cache hash table entries: 131072 (order: 7, =20
> 524288 bytes)
> [    0.000000] Inode-cache hash table entries: 65536 (order: 6, 26214=
4 =20
> bytes)
> [    0.000000] Sorting __ex_table...
> [    0.000000] Memory: 778992k/778992k available (1892k kernel code, =
=20
> 19768k data, 140k init)
> [    0.000000] Virtual kernel memory layout:
> [    0.000000]     vector  : 0x002a170c - 0x002a1b0c   (   1 KiB)
> [    0.000000]     kmap    : 0xd0000000 - 0xf0000000   ( 512 MiB)
> [    0.000000]     vmalloc : 0x31800000 - 0xd0000000   (2536 MiB)
> [    0.000000]     lowmem  : 0x00000000 - 0x31000000   ( 784 MiB)
> [    0.000000]       .init : 0x002c8000 - 0x002eb000   ( 140 KiB)
> [    0.000000]       .text : 0x00001000 - 0x001d9188   (1889 KiB)
> [    0.000000]       .data : 0x001db780 - 0x002c74d4   ( 944 KiB)
> [    0.000000]       .bss  : 0x002a14e0 - 0x002c74d4   ( 152 KiB)
> [    0.000000] NR_IRQS:200
> [    0.000000] Console: colour dummy device 80x25
> [    0.000000] console [tty0] enabled
> [    0.010000] Calibrating delay loop... 115.09 BogoMIPS (lpj=3D57548=
8)
> [    0.100000] pid_max: default: 32768 minimum: 301
> [    0.100000] Mount-cache hash table entries: 512
> [    0.110000] devtmpfs: initialized
> [    0.130000] NET: Registered protocol family 16
> [    0.150000] bio: create slab <bio-0> at 0
> [    0.150000] SCSI subsystem initialized
> [    0.200000] NET: Registered protocol family 2
> [    0.200000] TCP established hash table entries: 8192 (order: 4, =20
> 65536 bytes)
> [    0.210000] TCP bind hash table entries: 8192 (order: 3, 32768 =20
> bytes)
> [    0.210000] TCP: Hash tables configured (established 8192 bind 819=
2)
> [    0.220000] TCP: reno registered
> [    0.220000] UDP hash table entries: 512 (order: 1, 8192 bytes)
> [    0.220000] UDP-Lite hash table entries: 512 (order: 1, 8192 bytes=
)
> [    0.220000] NET: Registered protocol family 1
> [    0.220000] Unpacking initramfs...
> [    0.690000] Freeing initrd memory: 9044K (1000000 - 18d5000)
> [    0.700000] nfhd8: found device with 37748592 blocks (512 bytes)
> [    0.710000]  nfhd8: AHDI p1 p2 p3
> [    0.720000] nfeth: API 5
> [    0.730000] eth0: nfeth addr:192.168.0.1 (192.168.0.2) =20
> HWaddr:52:54:00:22:81:00
> [    0.740000] VFS: Disk quotas dquot_6.5.2
> [    0.740000] Dquot-cache hash table entries: 1024 (order 0, 4096 =20
> bytes)
> [    0.740000] msgmni has been set to 1539
> [    0.740000] alg: No test for stdrng (krng)
> [    0.750000] Block layer SCSI generic (bsg) driver version 0.4 =20
> loaded (major 252)
> [    0.750000] io scheduler noop registered (default)
> [    0.750000] atafb_init: start
> [    0.750000] atafb_init: initializing Falcon hw
> [    0.750000] atafb: screen_base 00aa6000 real_screen_base 00aa6000 =
=20
> screen_len 311296
> [    0.750000] Determined 640x480, depth 4
> [    0.750000]    virtual 640x972
> [    0.780000] Console: switching to colour frame buffer device 80x30
> [    0.800000] fb0: frame buffer device, using 304K of video memory
> [    0.800000] pmac_zilog: 0.6 (Benjamin Herrenschmidt =20
> <benh@kernel.crashing.org>)
> [    0.800000] Non-volatile memory driver v1.3
> [    0.810000] mousedev: PS/2 mouse device common for all mice
> [    1.090000] input: Atari Keyboard as /devices/virtual/input/input0
> [    1.160000] rtc-generic rtc-generic: rtc core: registered =20
> rtc-generic as rtc0
> [    1.200000] TCP: cubic registered
> [    1.240000] NET: Registered protocol family 17
> [    1.310000] registered taskstats version 1
> [    1.390000] rtc-generic rtc-generic: setting system clock to =20
> 2013-08-09 21:32:31 UTC (1376083951)
> [    1.460000] Freeing unused kernel memory: 140K (2c8000 - 2eb000)
> [    2.070000] udevd[44]: starting version 175
> [    6.140000] raid6: int32x1     10 MB/s
> [    6.330000] raid6: int32x2     10 MB/s
> [    6.510000] raid6: int32x4     12 MB/s
> [    6.690000] raid6: int32x8     10 MB/s
> [    6.700000] raid6: using algorithm int32x4 (12 MB/s)
> [    6.720000] raid6: using intx1 recovery algorithm
> [    6.760000] xor: measuring software checksum speed
> [    6.890000]    8regs     :    93.600 MB/sec
> [    7.000000]    8regs_prefetch:    98.400 MB/sec
> [    7.110000]    32regs    :    60.000 MB/sec
> [    7.220000]    32regs_prefetch:    58.000 MB/sec
> [    7.220000] xor: using function: 8regs_prefetch (98.400 MB/sec)
> [    7.340000] bio: create slab <bio-1> at 1
> [    7.350000] Btrfs loaded
> [    7.480000] device label ara5-butter devid 1 transid 392479 =20
> /dev/nfhd8p3
> [    7.830000] EXT4-fs (nfhd8p1): mounted filesystem with ordered dat=
a =20
> mode. Opts: (null)
> [   16.410000] udevd[234]: starting version 175
> [   20.260000] device label ara5-butter devid 1 transid 392479 =20
> /dev/nfhd8p3
> [   23.610000] Adding 3670012k swap on /dev/nfhd8p2.  Priority:-1 =20
> extents:1 across:3670012k
> [   23.960000] EXT4-fs (nfhd8p1): re-mounted. Opts: (null)
> [   24.980000] EXT4-fs (nfhd8p1): re-mounted. Opts: errors=3Dremount-=
ro
> [   31.890000] device label ara5-butter devid 1 transid 392479 =20
> /dev/nfhd8p3
> [   31.950000] btrfs: setting nodatacow, compression disabled
> [   31.990000] btrfs: enabling auto recovery
> [   32.010000] btrfs: disk space caching is enabled
> [   43.160000] NET: Registered protocol family 10
>
> bye,
> //mirabilos
> --=20
> Sometimes they [people] care too much: pretty printers [and syntax =20
> highligh-
> ting, d.A.] mechanically produce pretty output that accentuates =20
> irrelevant
> detail in the program, which is as sensible as putting all the =20
> prepositions
> in English text in bold font.	-- Rob Pike in "Notes on Programming in=
 =20
> C"
> --
> To unsubscribe from this list: send the line "unsubscribe linux-m68k"=
 =20
> in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
