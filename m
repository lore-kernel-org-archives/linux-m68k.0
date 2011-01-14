From: Thorsten Glaser <tg@mirbsd.de>
Subject: Re: build warnings
Date: Fri, 14 Jan 2011 10:25:51 +0100
Message-ID: <alpine.DEB.2.00.1101141023130.5300@tglase.bonn.tarent.de>
References: <alpine.DEB.2.00.1101131539400.19098@tglase.bonn.tarent.de>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from lo.gmane.org ([80.91.229.12]:33689 "EHLO lo.gmane.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751335Ab1ANJ0G convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 14 Jan 2011 04:26:06 -0500
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <glpm-linux-m68k@m.gmane.org>)
	id 1Pdfv1-0004Vz-Fi
	for linux-m68k@vger.kernel.org; Fri, 14 Jan 2011 10:26:03 +0100
Received: from gate.tarent.de ([212.79.178.249])
        by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
        id 1AlnuQ-0007hv-00
        for <linux-m68k@vger.kernel.org>; Fri, 14 Jan 2011 10:26:03 +0100
Received: from tg by gate.tarent.de with local (Gmexim 0.1 (Debian))
        id 1AlnuQ-0007hv-00
        for <linux-m68k@vger.kernel.org>; Fri, 14 Jan 2011 10:26:03 +0100
In-Reply-To: <alpine.DEB.2.00.1101131539400.19098@tglase.bonn.tarent.de>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org

Dixi quod=E2=80=A6

> -1~experimental.1) plus for-linus and m68k-queue of yesterday. I also
> discovered @Stephen that staging drivers are built again. In case you
> are interested in the progress: preliminary deb source package is at
> https://www.freewrt.org/~tg/debs68k/tmp/linux-2.6/

Ouch, just had a peek at the atari kernel which was built overnight
(it=E2=80=99s working on bvme now) and got this:

Running Aranym on X11: :0.0
ARAnyM 0.9.10
Using config file: 'aranym.config.x11'
Could not open audio:
Could not open joystick 0
ARAnyM RTC Timer: ioctl(256 Hz): Permission denied
ARAnyM LILO: Error loading ramdisk 'root.bin'
[    0.000000] Initializing cgroup subsys cpuset
[    0.000000] Initializing cgroup subsys cpu
[    0.000000] Linux version 2.6.37-0+m68k.1-atari (Debian 2.6.37-1~exp=
erimental.1+m68k.1) (tg@mirbsd.de) (gcc version 4.4.5 (Debian 4.4.5-10)=
 ) #1 Fri Jan 14 06:21:53 UTC 2011
[    0.000000] console [debug0] enabled
[    0.000000] Atari hardware found: VIDEL STDMA-SCSI ST_MFP YM2149 PCM=
 CODEC DSP56K ANALOG_JOY Blitter tried to read byte from register ff8a0=
0 at 00783a
BLITTER IDE TT_CLK FDC_SPEED
[    0.000000] NatFeats found (ARAnyM, 1.0)
[    0.000000] On node 0 totalpages: 3584
[    0.000000] free_area_init_node: node 0, pgdat 00330b64, node_mem_ma=
p 00464000
[    0.000000]   DMA zone: 32 pages used for memmap
[    0.000000]   DMA zone: 0 pages reserved
[    0.000000]   DMA zone: 3552 pages, LIFO batch:0
[    0.000000] On node 1 totalpages: 196608
[    0.000000] free_area_init_node: node 1, pgdat 00331514, node_mem_ma=
p 00488090
[    0.000000]   DMA zone: 1728 pages used for memmap
[    0.000000]   DMA zone: 0 pages reserved
[    0.000000]   DMA zone: 194880 pages, LIFO batch:31
[    0.000000] pcpu-alloc: s0 r0 d32768 u32768 alloc=3D1*32768
[    0.000000] pcpu-alloc: [0] 0
[    0.000000] Built 2 zonelists in Zone order, mobility grouping on.  =
Total pages: 198432
[    0.000000] Kernel command line: root=3D/dev/hda1 console=3Dtty debu=
g=3Dpar BOOT_IMAGE=3Dvmlinux
[    0.000000] PID hash table entries: 4096 (order: 2, 16384 bytes)
[    0.000000] Dentry cache hash table entries: 131072 (order: 7, 52428=
8 bytes)
[    0.000000] Inode-cache hash table entries: 65536 (order: 6, 262144 =
bytes)
[    0.000000] Memory: 787384k/787384k available (2488k kernel code, 10=
812k data, 108k init)
[    0.000000] SLUB: Genslabs=3D14, HWalign=3D16, Order=3D0-3, MinObjec=
ts=3D0, CPUs=3D1, Nodes=3D8
[    0.000000] Console: colour dummy device 80x25
[    0.000000] Initializing cgroup subsys cpuset
[    0.000000] Initializing cgroup subsys cpu
[    0.000000] Linux version 2.6.37-0+m68k.1-atari (Debian 2.6.37-1~exp=
erimental.1+m68k.1) (tg@mirbsd.de) (gcc version 4.4.5 (Debian 4.4.5-10)=
 ) #1 Fri Jan 14 06:21:53 UTC 2011
[    0.000000] console [debug0] enabled
[    0.000000] Atari hardware found: VIDEL STDMA-SCSI ST_MFP YM2149 PCM=
 CODEC DSP56K ANALOG_JOY BLITTER IDE TT_CLK FDC_SPEED
[    0.000000] NatFeats found (ARAnyM, 1.0)
[    0.000000] On node 0 totalpages: 3584
[    0.000000] free_area_init_node: node 0, pgdat 00330b64, node_mem_ma=
p 00464000
[    0.000000]   DMA zone: 32 pages used for memmap
[    0.000000]   DMA zone: 0 pages reserved
[    0.000000]   DMA zone: 3552 pages, LIFO batch:0
[    0.000000] On node 1 totalpages: 196608
[    0.000000] free_area_init_node: node 1, pgdat 00331514, node_mem_ma=
p 00488090
[    0.000000]   DMA zone: 1728 pages used for memmap
[    0.000000]   DMA zone: 0 pages reserved
[    0.000000]   DMA zone: 194880 pages, LIFO batch:31
[    0.000000] pcpu-alloc: s0 r0 d32768 u32768 alloc=3D1*32768
[    0.000000] pcpu-alloc: [0] 0
[    0.000000] Built 2 zonelists in Zone order, mobility grouping on.  =
Total pages: 198432
[    0.000000] Kernel command line: root=3D/dev/hda1 console=3Dtty debu=
g=3Dpar BOOT_IMAGE=3Dvmlinux
[    0.000000] PID hash table entries: 4096 (order: 2, 16384 bytes)
[    0.000000] Dentry cache hash table entries: 131072 (order: 7, 52428=
8 bytes)
[    0.000000] Inode-cache hash table entries: 65536 (order: 6, 262144 =
bytes)
[    0.000000] Memory: 787384k/787384k available (2488k kernel code, 10=
812k data, 108k init)
[    0.000000] SLUB: Genslabs=3D14, HWalign=3D16, Order=3D0-3, MinObjec=
ts=3D0, CPUs=3D1, Nodes=3D8
[    0.000000] Console: colour dummy device 80x25
[    0.000000] console [tty0] enabled
[    0.000000] Calibrating delay loop... 147.04 BogoMIPS (lpj=3D735232)
[    0.340000] pid_max: default: 32768 minimum: 301
[    0.340000] Security Framework initialized
[    0.350000] SELinux:  Disabled at boot.
[    0.350000] Mount-cache hash table entries: 512
[    0.360000] Initializing cgroup subsys ns
[    0.360000] ns_cgroup deprecated: consider using the 'clone_children=
' flag without the ns_cgroup.
[    0.360000] Initializing cgroup subsys cpuacct
[    0.360000] Initializing cgroup subsys devices
[    0.360000] Initializing cgroup subsys freezer
[    0.360000] Initializing cgroup subsys blkio
[    0.360000] devtmpfs: initialized
[    0.360000] regulator: core version 0.5
[    0.360000] regulator: dummy:
[    0.360000] NET: Registered protocol family 16
[    0.390000] bio: create slab <bio-0> at 0
[    0.390000] SCSI subsystem initialized
[    0.440000] NET: Registered protocol family 2
[    0.450000] IP route cache hash table entries: 32768 (order: 5, 1310=
72 bytes)
[    0.450000] TCP established hash table entries: 131072 (order: 8, 10=
48576 bytes)
[    0.480000] TCP bind hash table entries: 65536 (order: 6, 262144 byt=
es)
[    0.480000] TCP: Hash tables configured (established 131072 bind 655=
36)
[    0.480000] TCP reno registered
[    0.480000] UDP hash table entries: 512 (order: 1, 8192 bytes)
[    0.480000] UDP-Lite hash table entries: 512 (order: 1, 8192 bytes)
[    0.500000] NET: Registered protocol family 1
[    0.500000] nfeth API 5
[    0.500000] eth0: nfeth addr:192.168.0.1 (192.168.0.2) HWaddr:52:54:=
00:22:00:03
[    0.520000] nfhd8: found device with 20971440 blocks (512 bytes)
[    0.540000]  nfhd8: AHDI p1 p2
[    0.540000] audit: initializing netlink socket (disabled)
[    0.540000] type=3D2000 audit(1292318492.540:1): initialized
[    0.630000] VFS: Disk quotas dquot_6.5.2
[    0.650000] Dquot-cache hash table entries: 1024 (order 0, 4096 byte=
s)
[    0.690000] msgmni has been set to 1537
[    0.690000] alg: No test for stdrng (krng)
[    0.690000] Block layer SCSI generic (bsg) driver version 0.4 loaded=
 (major 252)
[    0.690000] io scheduler noop registered
[    0.690000] io scheduler deadline registered
[    0.690000] io scheduler cfq registered (default)
[    0.690000] atafb_init: start
[    0.690000] atafb_init: initializing Falcon hw
[    0.690000] atafb: screen_base 00b4b000 real_screen_base 00b4b000 sc=
reen_len 307200
[    0.710000] Determined 640x480, depth 4
[    0.710000]    virtual 640x960
[    0.710000] Console: switching to colour frame buffer device 80x30
[    0.730000] fb0: frame buffer device, using 300K of video memory
[    0.730000] Non-volatile memory driver v1.3
[    0.730000] Atari floppy driver: max. HD, track buffering
[    0.730000] Probing floppy drive(s):
[    0.730000] fd0
[    0.870000] brd: module loaded
[    0.890000] Uniform Multi-Platform E-IDE driver
[    0.950000] ide: Falcon IDE controller
[    0.970000] Probing IDE interface ide0...
[    1.360000] hda: Master, ATA DISK drive
[    2.450000] ide0 at 0xfff00000 on irq 15 (serialized)
[    2.460000] ide-gd driver 1.18
[    2.500000] hda: max request size: 128KiB
[    2.530000] hda: 20971440 sectors (10737 MB) w/256KiB Cache, CHS=3D2=
0805/16/63
[    2.570000]  hda: AHDI hda1 hda2
[    2.590000] ide-cd driver 5.00
[    2.600000] scsi0: options CAN_QUEUE=3D8 CMD_PER_LUN=3D1 SCAT-GAT=3D=
0 TAGGED-QUEUING=3Dno HOSTID=3D7 generic options AUTOSENSE REAL DMA SCS=
I-2 TAGGED QUEUING generic release=3D7
[    2.660000] scsi0 : Atari native SCSI
[    2.690000] mice: PS/2 mouse device common for all mice
[    2.960000] input: Atari Keyboard as /devices/virtual/input/input0
[    2.980000] input: Atari mouse as /devices/virtual/input/input1
[    2.980000] blk_queue_max_segments: set to minimum 1
[    3.000000] rtc-generic rtc-generic: rtc core: registered rtc-generi=
c as rtc0
[    3.040000] TCP cubic registered
[    3.070000] NET: Registered protocol family 17
[    3.080000] NET: Registered protocol family 15
[    3.100000] registered taskstats version 1
[    3.120000] scsi: waiting for bus probes to complete ...
[    3.390000] Unable to handle kernel NULL pointer dereference at virt=
ual address   (null)
[    3.390000] Oops: 00000000
[    3.390000] Modules linked in:
[    3.390000] PC: [<00090d4a>] __slab_free+0x5a/0xd0
[    3.390000] SR: 2700  SP: 30d95d2c  a2: 00d72b50
[    3.390000] d0: 0000001d    d1: 000000ff    d2: 00000001    d3: 30d5=
f700
[    3.390000] d4: 00000002    d5: 00000024    a0: 00000000    a1: 00c4=
c030
[    3.390000] Process scsi_scan_0 (pid: 25, task=3D00d72b50)
[    3.390000] Frame format=3D7 eff addr=3D00000000 ssw=3D0505 faddr=3D=
00000000
[    3.390000] wb 1 stat/addr/data: 0000 00000000 00000000
[    3.390000] wb 2 stat/addr/data: 0000 00000000 00000000
[    3.390000] wb 3 stat/addr/data: 0000 00000000 00000000
[    3.390000] push data: 00000000 00000000 00000000 00000000
[    3.390000] Stack from 30d95d94:
[    3.390000]         00002300 00b424bc 00d82240 00000000 00091b80 00d=
82240 00b424bc 30d73f40
[    3.390000]         0015d04a 00000000 30d7bb6c 0015c08e 0015d04a 30d=
73f40 30d7bb50 30d7bab0
[    3.390000]         0015bfe4 30d7bb6c 0015c08e 30d7ba00 001c691e 30d=
7bb50 30d7ba00 00dc8c00
[    3.390000]         00000000 001c4414 30d7ba00 ffffffff 00000000 00d=
c8cd8 00000000 00000000
[    3.390000]         00000000 001bc98c 30d5f500 00dc8cd8 30d95f18 30d=
5f70f 0015c11c 00000001
[    3.390000]         00000024 30d5f708 30d5f710 30d7bab0 00000000 30d=
95f14 00000012 00000024
[    3.390000] Call Trace: [<00002300>] name_to_dev_t+0x48/0x2c8
[    3.390000]  [<00091b80>] kfree+0x92/0xc6
[    3.390000]  [<0015d04a>] kref_put+0x2c/0x5e
[    3.390000]  [<0015c08e>] kobject_release+0x0/0x7a
[    3.390000]  [<0015d04a>] kref_put+0x2c/0x5e
[    3.390000]  [<0015bfe4>] kobject_put+0x1e/0x54
[    3.390000]  [<0015c08e>] kobject_release+0x0/0x7a
[    3.390000]  [<001c691e>] __scsi_remove_device+0x38/0xb8
[    3.390000]  [<001c4414>] scsi_probe_and_add_lun+0x2fc/0xb5c
[    3.390000]  [<001bc98c>] scsi_is_host_device+0x0/0x14
[    3.390000]  [<0015c11c>] kobject_get+0x14/0x1e
[    3.390000]  [<001c4e90>] __scsi_scan_target+0xa2/0x652
[    3.390000]  [<001c4dee>] __scsi_scan_target+0x0/0x652
[    3.390000]  [<0002d8ea>] T.1015+0x0/0x34
[    3.390000]  [<0004167a>] wq_worker_sleeping+0x0/0x8c
[    3.390000]  [<0002ac5a>] dequeue_entity+0x0/0x168
[    3.390000]  [<0002ac70>] dequeue_entity+0x16/0x168
[    3.390000]  [<001c54a4>] scsi_scan_channel+0x64/0x98
[    3.390000]  [<001c5440>] scsi_scan_channel+0x0/0x98
[    3.390000]  [<001c559c>] scsi_scan_host_selected+0xc4/0x13a
[    3.390000]  [<001c56a6>] do_scan_async+0x0/0x124
[    3.390000]  [<001c569c>] do_scsi_scan_host+0x8a/0x94
[    3.390000]  [<001c56a6>] do_scan_async+0x0/0x124
[    3.390000]  [<001c56b6>] do_scan_async+0x10/0x124
[    3.390000]  [<001c56a6>] do_scan_async+0x0/0x124
[    3.390000]  [<0000294a>] kernel_thread+0x0/0x4e
[    3.390000]  [<000459f0>] kthread+0x66/0x70
[    3.390000]  [<0004598a>] kthread+0x0/0x70
[    3.390000]  [<0026b31e>] schedule+0x0/0x41e
[    3.390000]  [<00002984>] kernel_thread+0x3a/0x4e
[    3.390000]
[    3.390000] Code: 4cdf 3804 4e75 103c 001d e0aa 2074 2c66 <5290> 49e=
b 0018 2268 0008 214c 0008 5888 2748 0018 2749 001c 228c 4cdf 3804 4e75
[    3.390000] Disabling lock debugging due to kernel taint
[    4.660000] Unable to handle kernel NULL pointer dereference at virt=
ual address   (null)
[    4.660000] Oops: 00000000
[    4.660000] Modules linked in:
[    4.660000] PC: [<00090d4a>] __slab_free+0x5a/0xd0
[    4.660000] SR: 2700  SP: 00db5ec0  a2: 00da49a0
[    4.660000] d0: 0000001d    d1: 00000054    d2: 00000001    d3: 0000=
0024
[    4.660000] d4: 00000100    d5: 0000000a    a0: 00000000    a1: 30d7=
f270
[    4.660000] Process ksoftirqd/0 (pid: 3, task=3D00da49a0)
[    4.660000] Frame format=3D7 eff addr=3D00000000 ssw=3D0505 faddr=3D=
00000000
[    4.660000] wb 1 stat/addr/data: 0000 00000000 00000000
[    4.660000] wb 2 stat/addr/data: 0000 00000000 00000000
[    4.660000] wb 3 stat/addr/data: 0000 00000000 00000000
[    4.660000] push data: 00000000 00000000 00000000 00000000
[    4.660000] Stack from 00db5f28:
[    4.660000]         00002300 00b4266c 00d86180 0026aff0 000919ec 00d=
86180 00b4266c 30d7f270
[    4.660000]         000434de 00d72fec 00315a0c 0006528a 000434de 00d=
86180 30d7f270 30d72978
[    4.660000]         000651a4 30d7f270 00000001 00356688 000651cc 003=
16efc 00035580 00356688
[    4.660000]         00002304 0026b31e 00000000 00000000 00000000 000=
652be 0026b7fe 000355e4
[    4.660000]         0003560c 00000000 0003565c 00000000 00000000 00d=
a9f64 00035610 0000294a
[    4.660000]         00db5ff4 000459f0 00000000 00000000 0004598a 00d=
a9f64 00000000 00000000
[    4.660000] Call Trace: [<00002300>] name_to_dev_t+0x48/0x2c8
[    4.660000]  [<0026aff0>] printk+0x0/0x18
[    4.660000]  [<000919ec>] kmem_cache_free+0x86/0x92
[    4.660000]  [<000434de>] put_pid+0x32/0x50
[    4.660000]  [<0006528a>] rcu_bh_qs+0x0/0x34
[    4.660000]  [<000434de>] put_pid+0x32/0x50
[    4.660000]  [<000651a4>] __rcu_process_callbacks+0x3c/0x5a
[    4.660000]  [<000651cc>] rcu_process_callbacks+0xa/0x16
[    4.660000]  [<00035580>] __do_softirq+0x6a/0xce
[    4.660000]  [<00002304>] name_to_dev_t+0x4c/0x2c8
[    4.660000]  [<0026b31e>] schedule+0x0/0x41e
[    4.660000]  [<000652be>] rcu_sched_qs+0x0/0x70
[    4.660000]  [<0026b7fe>] _cond_resched+0x0/0x3c
[    4.660000]  [<000355e4>] do_softirq+0x0/0x2c
[    4.660000]  [<0003560c>] do_softirq+0x28/0x2c
[    4.660000]  [<0003565c>] run_ksoftirqd+0x4c/0x8e
[    4.660000]  [<00035610>] run_ksoftirqd+0x0/0x8e
[    4.660000]  [<0000294a>] kernel_thread+0x0/0x4e
[    4.660000]  [<000459f0>] kthread+0x66/0x70
[    4.660000]  [<0004598a>] kthread+0x0/0x70
[    4.660000]  [<0026b31e>] schedule+0x0/0x41e
[    4.660000]  [<00002984>] kernel_thread+0x3a/0x4e
[    4.660000]
[    4.660000] Code: 4cdf 3804 4e75 103c 001d e0aa 2074 2c66 <5290> 49e=
b 0018 2268 0008 214c 0008 5888 2748 0018 2749 001c 228c 4cdf 3804 4e75
[    4.660000] Kernel panic - not syncing: Aiee, killing interrupt hand=
ler!
[    4.660000] Call Trace: [<0026aea8>] panic+0x54/0x19c
[    4.660000]  [<0026aff0>] printk+0x0/0x18
[    4.660000]  [<000455b8>] kthread_should_stop+0x0/0xa
[    4.660000]  [<00033fe8>] do_exit+0x618/0x6ee
[    4.660000]  [<0026aff0>] printk+0x0/0x18
[    4.660000]  [<000455b8>] kthread_should_stop+0x0/0xa
[    4.660000]  [<0026b002>] printk+0x12/0x18
[    4.660000]  [<0000338a>] bad_super_trap+0x0/0x198
[    4.660000]  [<000075e2>] send_fault_sig+0xaa/0xc6
[    4.660000]  [<00003c6e>] buserr_c+0x242/0x6f8
[    4.660000]  [<000025c6>] buserr+0x1e/0x24
[    4.660000]  [<00002300>] name_to_dev_t+0x48/0x2c8
[    4.660000]  [<0026aff0>] printk+0x0/0x18
[    4.660000]  [<000919ec>] kmem_cache_free+0x86/0x92
[    4.660000]  [<000434de>] put_pid+0x32/0x50
[    4.660000]  [<0006528a>] rcu_bh_qs+0x0/0x34
[    4.660000]  [<000434de>] put_pid+0x32/0x50
[    4.660000]  [<000651a4>] __rcu_process_callbacks+0x3c/0x5a
[    4.660000]  [<000651cc>] rcu_process_callbacks+0xa/0x16
[    4.660000]  [<00035580>] __do_softirq+0x6a/0xce
[    4.660000]  [<00002304>] name_to_dev_t+0x4c/0x2c8
[    4.660000]  [<0026b31e>] schedule+0x0/0x41e
[    4.660000]  [<000652be>] rcu_sched_qs+0x0/0x70
[    4.660000]  [<0026b7fe>] _cond_resched+0x0/0x3c
[    4.660000]  [<000355e4>] do_softirq+0x0/0x2c
[    4.660000]  [<0003560c>] do_softirq+0x28/0x2c
[    4.660000]  [<0003565c>] run_ksoftirqd+0x4c/0x8e
[    4.660000]  [<00035610>] run_ksoftirqd+0x0/0x8e
[    4.660000]  [<0000294a>] kernel_thread+0x0/0x4e
[    4.660000]  [<000459f0>] kthread+0x66/0x70
[    4.660000]  [<0004598a>] kthread+0x0/0x70
[    4.660000]  [<0026b31e>] schedule+0x0/0x41e
[    4.660000]  [<00002984>] kernel_thread+0x3a/0x4e
[    4.660000]


Then I press ^C and get this:

 A0: 0003082c A4: 00064db8   D0: 00000036 D4: 00011f1c  USP=3D00000000
 A1: 00314218 A5: 00007aa8   D1: 00004977 D5: 0000000a  ISP=3D00db5d64
 A2: 00da49a0 A6: 00db5d7c   D2: 00418958 D6: 00000009  MSP=3D00000000
 A3: 000079e0 A7: 00db5d64   D3: 00000001 D7: 00000000  VBR=3D0032f99c
T=3D00 S=3D1 M=3D0 X=3D0 N=3D0 Z=3D0 V=3D0 C=3D0           TC=3D8000
CACR=3D80008000 DTT0=3D00000000 ITT0=3D00000000 SRP=3D00001000  SFC=3D1=
01
CAAR=3D00000000 DTT1=3Dfe00a040 ITT1=3Dfe00a040 URP=3D00000000  DFC=3D1=
01
=46P0: 0 FP1: 0 FP2: 0 FP3: 0 N=3D0 Z=3D0
=46P4: 0 FP5: 0 FP6: 0 FP7: 0 I=3D0 NAN=3D0
0026afdc: 5381 64fc 51c8 fff8 4240 SUB.L #$00000001,D1
next PC: 0026afde
>


Does this help?

bye,
//mirabilos
--=20
15:41=E2=8E=9C<Lo-lan-do:#fusionforge> Somebody write a testsuite for h=
elloworld :-)
