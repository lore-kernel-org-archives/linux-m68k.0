From: "Christian T. Steigies" <cts@debian.org>
Subject: Re: Debian kernel 2.6.38-5
Date: Sun, 8 May 2011 22:08:02 +0200
Message-ID: <20110508200802.GB16281@chumley.earth.sol>
References: <BANLkTimCKhPbp3wOCpVusHu1JmoyhwKX0w@mail.gmail.com>
 <Pine.BSM.4.64L.1105081254100.28983@herc.mirbsd.org>
 <20110508165909.GA16281@chumley.earth.sol>
 <Pine.BSM.4.64L.1105081834101.28983@herc.mirbsd.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-in-16.arcor-online.net ([151.189.21.56]:34987 "EHLO
	mail-in-16.arcor-online.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751173Ab1EHUGp (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 8 May 2011 16:06:45 -0400
Content-Disposition: inline
In-Reply-To: <Pine.BSM.4.64L.1105081834101.28983@herc.mirbsd.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Thorsten Glaser <tg@mirbsd.de>
Cc: linux-m68k@vger.kernel.org

On Sun, May 08, 2011 at 06:40:40PM +0000, Thorsten Glaser wrote:
> Christian T. Steigies dixit:
> 
> >> ??? Accepted linux-2.6 2.6.38-5 (source all i386) Ben Hutchings
> >> http://lists.debian.org/debian-devel-changes/2011/05/msg00736.html
> >
> >Why don't you cross-compile it?
> 
> I cross-built the kernels I ran for testing the patches, but that
> was an exception ??? packages that I upload to Debian are *always*
> built natively.

Brave
 
> >How do I get the older versions from Geert's git? I don't see any other
> >branches, I only see tags. What is the magic word to get for example the 2.6.30
> >tree? 
> 
> tg@zigo:~/linux-m68k $ git branch -r

I did not know about -r, it was not mentioned in the tutorial I read...
How do I switch back and forth between different branches? I got a conflict
and could not switch back anymore. Then I deleted all files (except .git), I
should be able to get everything back with git checkout? Well, I didn't. git
newbie here...
 
> >It's been so long, is this the correct way to cross-build linux-m68k?
> 
> sudo cowbuilder --debbuildopts -am68k --binary-arch --build linux*.dsc
> is the correct way in Debian (but will build all 6 images and more; it
> takes about half a day, cross).

I haven't used cowbuilder yet, for debian packages I us this, which I guess
is equivalent to your cowbuilder script:
DEB_HOST_ARCH=m68k debuild -B -am68k
 
> https://wiki.debian.org/HowToRebuildAnOfficialDebianKernelPackage#Building_only_a_single_kernel_variant
> lists another way, where you only ???dpkg-source -x linux*.dsc??? then
> ???cd linux-*/??? and ???fakeroot debian/rules binary-arch_m68k_none_amiga???
> I think (but cross parameters might need to be added). This is also
> in README.Debian in the source package.

Yes, but I am not trying to build a debian package, I try to build directly
from linux-m68k. This has worked, only the Amiga complained a missing
modules.dep (but I built in the network driver):

make ARCH=m68k CROSS_COMPILE=m68k-linux-gnu- 
make ARCH=m68k CROSS_COMPILE=m68k-linux-gnu- INSTALL_MOD_PATH=/data/m68k modules_install 

The kernel boots, it configures the network (static). When I try to ping a
host on my network, I get this oops(?).  A few seconds later I also get the
mismatch message I reported earlier (does not show up in dmesg?).

PS 2.6.28 did not boot: kernel too old. When was TLS introduced? I'll try to
apply the patch you mentioned in your other message.

[    0.000000] Initializing cgroup subsys cpuset
[    0.000000] Initializing cgroup subsys cpu
[    0.000000] Linux version 2.6.39-rc6+ (cts@ima) (gcc version 4.4.6 (Debian 4.4.6-3) ) #1 Sun May 8 19:05:46 CEST 2011
[    0.000000] Enabling workaround for errata I14
[    0.000000] Amiga hardware found: [A3000] VIDEO BLITTER AMBER_FF AUDIO FLOPPY A3000_SCSI KEYBOARD MOUSE SERIAL PARALLEL A3000_CLK CHIP_RAM PAULA DENISE_HR AGNUS_HR_PAL MAGIC_REKICK ZORRO3 
[    0.000000] Ignoring memory chunk at 0x7000000:0x1000000 before the first chunk
[    0.000000] Fix your bootloader or use a memfile to make use of this area!
[    0.000000] On node 0 totalpages: 28672
[    0.000000] free_area_init_node: node 0, pgdat 0036ab74, node_mem_map 003f4000
[    0.000000]   DMA zone: 252 pages used for memmap
[    0.000000]   DMA zone: 0 pages reserved
[    0.000000]   DMA zone: 28420 pages, LIFO batch:7
[    0.000000] pcpu-alloc: s0 r0 d32768 u32768 alloc=1*32768
[    0.000000] pcpu-alloc: [0] 0 
[    0.000000] Built 1 zonelists in Zone order, mobility grouping on.  Total pages: 28420
[    0.000000] Kernel command line: root=/dev/sda3 fb=false video=amifb:ntsc-lace BOOT_IMAGE=Work:linux/vmlinux-2.6.39+rc6+
[    0.000000] PID hash table entries: 512 (order: -1, 2048 bytes)
[    0.000000] Dentry cache hash table entries: 16384 (order: 4, 65536 bytes)
[    0.000000] Inode-cache hash table entries: 8192 (order: 3, 32768 bytes)
[    0.000000] Memory: 109496k/109496k available (2776k kernel code, 2280k data, 136k init)
[    0.000000] Console: colour dummy device 80x25
[    0.000000] console [tty0] enabled
[    0.000000] Calibrating delay loop... 99.22 BogoMIPS (lpj=496128)
[    0.090000] pid_max: default: 32768 minimum: 301
[    0.090000] Security Framework initialized
[    0.090000] TOMOYO Linux initialized
[    0.090000] Mount-cache hash table entries: 512
[    0.100000] Initializing cgroup subsys ns
[    0.100000] ns_cgroup deprecated: consider using the 'clone_children' flag without the ns_cgroup.
[    0.100000] Initializing cgroup subsys cpuacct
[    0.100000] Initializing cgroup subsys devices
[    0.100000] Initializing cgroup subsys freezer
[    0.110000] devtmpfs: initialized
[    0.120000] NET: Registered protocol family 16
[    0.170000] bio: create slab <bio-0> at 0
[    0.180000] SCSI subsystem initialized
[    0.330000] NET: Registered protocol family 2
[    0.340000] IP route cache hash table entries: 1024 (order: 0, 4096 bytes)
[    0.350000] TCP established hash table entries: 4096 (order: 3, 32768 bytes)
[    0.350000] TCP bind hash table entries: 4096 (order: 2, 16384 bytes)
[    0.350000] TCP: Hash tables configured (established 4096 bind 4096)
[    0.350000] TCP reno registered
[    0.360000] UDP hash table entries: 256 (order: 0, 4096 bytes)
[    0.360000] UDP-Lite hash table entries: 256 (order: 0, 4096 bytes)
[    0.360000] NET: Registered protocol family 1
[    0.390000] VFS: Disk quotas dquot_6.5.2
[    0.390000] Dquot-cache hash table entries: 1024 (order 0, 4096 bytes)
[    0.410000] NTFS driver 2.1.30 [Flags: R/W].
[    0.410000] msgmni has been set to 213
[    0.420000] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 253)
[    0.420000] io scheduler noop registered
[    0.420000] io scheduler deadline registered
[    0.420000] io scheduler cfq registered (default)
[    0.560000] Console: switching to colour frame buffer device 80x25
[    0.620000] fb0: Amiga ECS frame buffer device, using 640K of video memory
[    0.640000] Amiga-builtin serial driver version 4.30
[    0.650000] ttyS0 is the amiga builtin serial port
[    0.660000] FD: probing units
[    0.660000] found 
[    0.670000] fd: drive 0 didn't identify, setting default ffffffff
[    0.680000] fd0 
[    0.790000] brd: module loaded
[    0.800000] Uniform Multi-Platform E-IDE driver
[    0.810000] ide-gd driver 1.18
[    0.820000] ide-cd driver 5.00
[    0.830000] fd: drive 0 didn't identify, setting default ffffffff
[    0.850000] wd33c93-0: chip=WD33c93A/0 no_sync=0xff no_dma=0 debug_flags=0x00
[    0.860000]            setup_args=,,,,,,,,,,
[    0.880000]            Version 1.26++ - 10/Feb/2007, Compiled May  8 2011 at 18:59:13
[    0.890000] scsi0 : Amiga 3000 built-in SCSI
[    0.910000] Zorro: Probing AutoConfig expansion devices: 2 devices
[    0.930000] eth0: Ariadne II at 0x00e90000, Ethernet Address 00:60:30:00:41:5b
[    0.940000] mousedev: PS/2 mouse device common for all mice
[    0.960000] input: amiga-keyboard as /devices/platform/amiga-keyboard/input/input0
[    0.970000] input: amiga-mouse as /devices/platform/amiga-mouse/input/input1
[    1.000000] TCP cubic registered
[    1.010000] NET: Registered protocol family 17
[    1.020000] NET: Registered protocol family 15
[    1.030000] Registering the dns_resolver key type
[    1.040000] registered taskstats version 1
[    1.050000] scsi: waiting for bus probes to complete ...
[    1.410000]  sending SDTR 0103015e00 0103015e00 sync_xfer=30
[    1.430000] scsi 0:0:3:0: CD-ROM            TOSHIBA  CD-ROM XM-5701TA 0167 PQ: 0 ANSI: 2
[    1.680000]  sending SDTR 0103015e00 0103015e00 sync_xfer=30
[    1.710000] scsi 0:0:6:0: Direct-Access     ST325082 4A               3.AA PQ: 0 ANSI: 2
[    1.750000] drivers/rtc/hctosys.c: unable to open rtc device (rtc0)
[    1.770000] sd 0:0:6:0: [sda] 488397168 512-byte logical blocks: (250 GB/232 GiB)
[    1.780000] sd 0:0:6:0: [sda] Write Protect is off
[    1.790000] sd 0:0:6:0: [sda] Mode Sense: 03 00 00 08
[    1.800000] sd 0:0:6:0: [sda] Write cache: enabled, read cache: enabled, doesn't support DPO or FUA
[    1.850000]  sda: RDSK (512) sda1 (DOS^C)(res 2 spb 1) sda2 (DOS^C)(res 2 spb 1) sda3 (LNX^@)(res 2 spb 1) sda4 (LNX^@)(res 2 spb 1) sda5 (LNX^@)(res 2 spb 1) sda6 (LNX^@)(res 2 spb 1) sda7 (LNX^@)(res 2 spb 1) sda8 (SWP^@)(res 2 spb 1)
[    1.890000] sd 0:0:6:0: [sda] Attached SCSI disk
[    1.940000] EXT3-fs: barriers not enabled
[    1.960000] kjournald starting.  Commit interval 5 seconds
[    1.970000] EXT3-fs (sda3): mounted filesystem with ordered data mode
[    1.980000] VFS: Mounted root (ext3 filesystem) readonly on device 8:3.
[    2.030000] Not activating Mandatory Access Control now since /sbin/tomoyo-init doesn't exist.
[   13.180000] udevd (74): /proc/74/oom_adj is deprecated, please use /proc/74/oom_score_adj instead.
[   33.560000] Z2RAM: using 0K Zorro II RAM and 1152K Chip RAM (Total 1152K)
[   46.140000] Adding 2096092k swap on /dev/sda8.  Priority:-1 extents:1 across:2096092k 
[   48.550000] EXT3-fs (sda3): using internal journal
[  130.870000] eth0: trigger_send() called with the transmitter busy.
[  132.240000] ------------[ cut here ]------------
[  132.240000] WARNING: at net/sched/sch_generic.c:256 dev_watchdog+0x1ac/0x1cc()
[  132.250000] NETDEV WATCHDOG: eth0 (): transmit queue 0 timed out
[  132.260000] Modules linked in:
[  132.260000] Call Trace: [<0002a162>] warn_slowpath_common+0x48/0x6a
[  132.270000]  [<0002a170>] warn_slowpath_common+0x56/0x6a
[  132.280000]  [<0002a1fc>] warn_slowpath_fmt+0x2a/0x32
[  132.290000]  [<002511a2>] dev_watchdog+0x1ac/0x1cc
[  132.290000]  [<002511a2>] dev_watchdog+0x1ac/0x1cc
[  132.300000]  [<0003373a>] cascade+0x0/0xb0
[  132.310000]  [<00023c0e>] update_rq_clock+0x24/0x5c
[  132.310000]  [<0000ffff>] stanh+0x103/0x140
[  132.320000]  [<0000ffff>] stanh+0x103/0x140
[  132.320000]  [<000338ea>] run_timer_softirq+0x100/0x2ba
[  132.330000]  [<0000ffff>] stanh+0x103/0x140
[  132.340000]  [<0005b1d4>] rcu_bh_qs+0x0/0x5a
[  132.340000]  [<002b2b42>] printk+0x0/0x18
[  132.350000]  [<00004106>] m68k_handle_int+0x0/0x32
[  132.350000]  [<00250ff6>] dev_watchdog+0x0/0x1cc
[  132.360000]  [<0002ee26>] __do_softirq+0x6e/0xd2
[  132.370000]  [<002b2f1a>] schedule+0x0/0x450
[  132.370000]  [<0002ef5a>] do_softirq+0x28/0x2c
[  132.380000]  [<000026d0>] ret_from_exception+0x0/0xc
[  132.390000]  [<00002aaa>] default_idle+0x0/0xc
[  132.390000]  [<00002cca>] cpu_idle+0x16/0x20
[  132.400000]  [<002b2b42>] printk+0x0/0x18
[  132.410000]  [<003b012a>] start_kernel+0x37e/0x38a
[  132.410000]  [<00006aee>] devm_free_irq+0x1c/0x56
[  132.420000]  [<00006aee>] devm_free_irq+0x1c/0x56
[  132.420000]  [<003af2fc>] _sinittext+0x2fc/0x988
[  132.430000] 
[  132.430000] ---[ end trace baa6881e53412090 ]---
[  132.440000] eth0: Tx timed out, excess collisions. TSR=0xff, ISR=0xff, t=57.
[  132.870000] eth0: trigger_send() called with the transmitter busy.
[  134.240000] eth0: Tx timed out, excess collisions. TSR=0xff, ISR=0xff, t=34.
[  134.900000] eth0: trigger_send() called with the transmitter busy.
[  136.240000] eth0: Tx timed out, excess collisions. TSR=0xff, ISR=0xff, t=34.
[  136.930000] eth0: trigger_send() called with the transmitter busy.
[  138.240000] eth0: Tx timed out, excess collisions. TSR=0xff, ISR=0xff, t=31.
[  138.930000] eth0: trigger_send() called with the transmitter busy.
[  140.240000] eth0: Tx timed out, excess collisions. TSR=0xff, ISR=0xff, t=28.
[  140.960000] eth0: trigger_send() called with the transmitter busy.
[  142.240000] eth0: Tx timed out, excess collisions. TSR=0xff, ISR=0xff, t=28.


Christian
