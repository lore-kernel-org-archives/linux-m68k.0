From: Thorsten Glaser <tg@mirbsd.de>
Subject: Re: build warnings
Date: Sat, 5 Feb 2011 23:41:14 +0000
Message-ID: <Pine.BSM.4.64L.1102052339100.22476@herc.mirbsd.org>
References: <alpine.DEB.2.00.1101131539400.19098@tglase.bonn.tarent.de>
 <alpine.DEB.2.00.1101141023130.5300@tglase.bonn.tarent.de>
 <AANLkTi=2Cb+EHR9xAgNPa7wGsSWWydZ56_iAGRDN-hXU@mail.gmail.com>
 <AANLkTinN+0i9gZxvUn0cig1kp0aM9iJ+fph0=-R-ChKZ@mail.gmail.com>
 <Pine.BSM.4.64L.1101161347480.11797@herc.mirbsd.org>
 <AANLkTimcvXaCqRrn+uZ9eVjxg0UyncSF1YL=Xpz2FiNF@mail.gmail.com>
 <Pine.BSM.4.64L.1101162226120.11797@herc.mirbsd.org>
 <AANLkTi=QH7=6ddP=KoTywDpYrwnB21XGnmwhmFkZganD@mail.gmail.com>
 <4D44F92C.2050707@gmail.com> <AANLkTimB1fpvMsSeTbRn5ZTU1NCpZpjrAXQ+xRShAsZN@mail.gmail.com>
 <4D461512.8080609@gmail.com> <alpine.LNX.2.00.1101311424100.6256@nippy.intranet>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from lo.gmane.org ([80.91.229.12]:39690 "EHLO lo.gmane.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753883Ab1BEXlf convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sat, 5 Feb 2011 18:41:35 -0500
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <glpm-linux-m68k@m.gmane.org>)
	id 1Plrkt-0003u3-Qe
	for linux-m68k@vger.kernel.org; Sun, 06 Feb 2011 00:41:27 +0100
Received: from static-87-79-237-121.netcologne.de ([87.79.237.121])
        by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
        id 1AlnuQ-0007hv-00
        for <linux-m68k@vger.kernel.org>; Sun, 06 Feb 2011 00:41:27 +0100
Received: from tg by static-87-79-237-121.netcologne.de with local (Gmexim 0.1 (Debian))
        id 1AlnuQ-0007hv-00
        for <linux-m68k@vger.kernel.org>; Sun, 06 Feb 2011 00:41:27 +0100
In-Reply-To: <alpine.LNX.2.00.1101311424100.6256@nippy.intranet>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org

=46inn Thain dixit:

>The introduction of the SLUB allocator was 2.6.22, but I can't help yo=
u=20
>bisect because I don't recall that it worked ever (?)

It _appears_ to work well with 2.6.32 Debian though...

[    0.000000] Initializing cgroup subsys cpuset
[    0.000000] Initializing cgroup subsys cpu
[    0.000000] Linux version 2.6.32-5+m68k.5-atari (Debian 2.6.32-30+m6=
8k.5) (tg@mirbsd.de) (gcc version 4.4.5 (Debian 4.4.5-10) ) #1 Sun Jan =
30 10:25:16 UTC 2011
[    0.000000] console [debug0] enabled
[    0.000000] Atari hardware found: VIDEL STDMA-SCSI ST_MFP YM2149 PCM=
 CODEC DSP56K ANALOG_JOY BLITTER IDE TT_CLK FDC_SPEED
[    0.000000] NatFeats found (ARAnyM, 1.0)
[    0.000000] On node 0 totalpages: 3584
[    0.000000] free_area_init_node: node 0, pgdat 003100f4, node_mem_ma=
p 00440000
[    0.000000]   DMA zone: 32 pages used for memmap
[    0.000000]   DMA zone: 0 pages reserved
[    0.000000]   DMA zone: 3552 pages, LIFO batch:0
[    0.000000] On node 1 totalpages: 196608
[    0.000000] free_area_init_node: node 1, pgdat 00310aec, node_mem_ma=
p 00464090
[    0.000000]   DMA zone: 1728 pages used for memmap
[    0.000000]   DMA zone: 0 pages reserved
[    0.000000]   DMA zone: 194880 pages, LIFO batch:31
[    0.000000] Built 2 zonelists in Zone order, mobility grouping on.  =
Total pages: 198432
[    0.000000] Kernel command line: root=3D/dev/hda1 console=3Dtty debu=
g=3Dpar BOOT_IMAGE=3Dvmlinux
[    0.000000] PID hash table entries: 4096 (order: 2, 16384 bytes)
[    0.000000] Dentry cache hash table entries: 131072 (order: 7, 52428=
8 bytes)
[    0.000000] Inode-cache hash table entries: 65536 (order: 6, 262144 =
bytes)
[    0.000000] Memory: 787440k/787568k available (2376k kernel code, 10=
752k data, 96k init)
[    0.000000] SLUB: Genslabs=3D12, HWalign=3D16, Order=3D0-3, MinObjec=
ts=3D0, CPUs=3D1, Nodes=3D8
[    0.000000] Hierarchical RCU implementation.
[    0.000000] Console: colour dummy device 80x25
[    0.000000] console [tty0] enabled
[    0.040000] Calibrating delay loop... 92.97 BogoMIPS (lpj=3D464896)
[    0.250000] Security Framework initialized
[    0.250000] SELinux:  Disabled at boot.
[    0.250000] Mount-cache hash table entries: 512
[    0.250000] Initializing cgroup subsys ns
[    0.250000] Initializing cgroup subsys cpuacct
[    0.250000] Initializing cgroup subsys devices
[    0.260000] Initializing cgroup subsys freezer
[    0.260000] devtmpfs: initialized
[    0.260000] regulator: core version 0.5
[    0.270000] NET: Registered protocol family 16
[    0.280000] bio: create slab <bio-0> at 0
[    0.280000] SCSI subsystem initialized
[    0.290000] NET: Registered protocol family 2
[    0.290000] IP route cache hash table entries: 32768 (order: 5, 1310=
72 bytes)
[    0.300000] TCP established hash table entries: 131072 (order: 8, 10=
48576 bytes)
[    0.330000] TCP bind hash table entries: 65536 (order: 6, 262144 byt=
es)
[    0.340000] TCP: Hash tables configured (established 131072 bind 655=
36)
[    0.340000] TCP reno registered
[    0.340000] NET: Registered protocol family 1
[    0.350000] nfeth API 5
[    0.350000] eth0: nfeth addr:192.168.0.1 (192.168.0.2) HWaddr:52:54:=
00:22:00:02
[    0.350000] nfhd8: found device with 20971440 blocks (512 bytes)
[    0.360000]  nfhd8: AHDI p1 p2
[    0.360000] audit: initializing netlink socket (disabled)
[    0.360000] type=3D2000 audit(1293993493.360:1): initialized
[    0.420000] VFS: Disk quotas dquot_6.5.2
[    0.420000] Dquot-cache hash table entries: 1024 (order 0, 4096 byte=
s)
[    0.430000] msgmni has been set to 1538
[    0.440000] alg: No test for stdrng (krng)
[    0.440000] Block layer SCSI generic (bsg) driver version 0.4 loaded=
 (major 252)
[    0.440000] io scheduler noop registered
[    0.440000] io scheduler anticipatory registered
[    0.440000] io scheduler deadline registered
[    0.450000] io scheduler cfq registered (default)
[    0.450000] atafb_init: start
[    0.450000] atafb_init: initializing Falcon hw
[    0.450000] atafb: screen_base 00b27000 real_screen_base 00b27000 sc=
reen_len 307200
[    0.450000] Determined 640x480, depth 4
[    0.450000]    virtual 640x960
[    0.470000] Console: switching to colour frame buffer device 80x30
[    0.480000] fb0: frame buffer device, using 300K of video memory
[    0.530000] Non-volatile memory driver v1.3
[    0.530000] Atari floppy driver: max. HD, track buffering
[    0.540000] Probing floppy drive(s):
[    0.540000] fd0
[    0.590000] brd: module loaded
[    0.610000] Uniform Multi-Platform E-IDE driver
[    0.630000] ide: Falcon IDE controller
[    0.650000] Probing IDE interface ide0...
[    0.970000] hda: Master, ATA DISK drive
[    2.060000] ide0 at 0xfff00000 on irq 15 (serialized)
[    2.080000] ide-gd driver 1.18
[    2.090000] hda: max request size: 128KiB
[    2.110000] hda: 20971440 sectors (10737 MB) w/256KiB Cache, CHS=3D2=
0805/16/63
[    2.140000]  hda: AHDI hda1 hda2
[    2.170000] ide-cd driver 5.00
[    2.200000] scsi0: options CAN_QUEUE=3D8 CMD_PER_LUN=3D1 SCAT-GAT=3D=
0 TAGGED-QUEUING=3Dno HOSTID=3D7 generic options AUTOSENSE REAL DMA SCS=
I-2 TAGGED QUEUING generic release=3D7
[    2.250000] scsi0 : Atari native SCSI
[    2.270000] mice: PS/2 mouse device common for all mice
[    2.540000] input: Atari Keyboard as /devices/virtual/input/input0
[    2.550000] blk_queue_max_hw_segments: set to minimum 1
[    2.820000] blk_queue_max_hw_segments: set to minimum 1
[    3.090000] blk_queue_max_hw_segments: set to minimum 1
[    3.110000] rtc-generic rtc-generic: rtc core: registered rtc-generi=
c as rtc0
[    3.130000] TCP cubic registered
[    3.150000] NET: Registered protocol family 17
[    3.170000] NET: Registered protocol family 15
[    3.190000] registered taskstats version 1
[    3.200000] scsi: waiting for bus probes to complete ...
[    3.480000] blk_queue_max_hw_segments: set to minimum 1
[    3.740000] blk_queue_max_hw_segments: set to minimum 1
[    4.000000] blk_queue_max_hw_segments: set to minimum 1
[    4.260000] blk_queue_max_hw_segments: set to minimum 1
[    4.570000] rtc-generic rtc-generic: setting system clock to 2011-02=
-02 18:38:18 UTC (1296671898)
[    4.650000] kjournald starting.  Commit interval 5 seconds
[    4.670000] EXT3-fs: mounted filesystem with ordered data mode.
[    4.690000] VFS: Mounted root (ext3 filesystem) readonly on device 3=
:1.
[  195.310000] Adding 1989616k swap on /dev/hda2.  Priority:-1 extents:=
1 across:1989616k
[  196.240000] EXT3 FS on hda1, internal journal
[  214.350000] NET: Registered protocol family 10
[  214.390000] lo: Disabled Privacy Extensions
[  225.290000] eth0: no IPv6 routers present

bye,
//mirabilos

PS: I put up a new /var/cache/pbuilder/base.cow as ustar.xz on
    https://wiki.debian.org/M68k/Cowbuilder (and got creative),
    for those who want to toy with Debian.
--=20
22:20=E2=8E=9C<asarch> The crazy that persists in his craziness becomes=
 a master
22:21=E2=8E=9C<asarch> And the distance between the craziness and genia=
lity is
only measured by the success                       22:21=E2=8E=9C<mksh>=
 it=E2=80=99s a
very thin line anyway=E2=80=A6 with some, you don=E2=80=99t know which =
side they=E2=80=99re on
