From: "Christian T. Steigies" <cts@debian.org>
Subject: Re: 8390 drivers (was: Re: Debian kernel 2.6.38-5)
Date: Mon, 23 May 2011 22:44:14 +0200
Message-ID: <20110523204414.GA10664@chumley.earth.sol>
References: <BANLkTimG+3jqLiLaA_NVEpGg3LFtvK4bQQ@mail.gmail.com>
 <20110509213213.GA28675@chumley.earth.sol>
 <BANLkTik27HjWOF0s5HRqgva5zYzQRis27Q@mail.gmail.com>
 <20110510072928.GA32679@chumley.earth.sol>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20110510072928.GA32679@chumley.earth.sol>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Linux/m68k <linux-m68k@lists.linux-m68k.org>

On Tue, May 10, 2011 at 09:29:28AM +0200, Christian T. Steigies wrote:
> eth0: mismatched read page pointer:  1 vs ff.
> and
> eth0: mismatched read page pointer:  1 vs f0. (I think, maybe fe or  0)
> 
> A lot of them. So many that I can not stop the output or do anything on the
> machine :-(
> There is a different message as well, but it is not readable.

Here is the output from dmesg for linux-2.6.39 as built from Debian sources.
zorro8390.c includes the patch Finn and Geert sent earlier, so the network
works, for about 10 minutes. Then this happens (with my earlier built kernel
from linux-m68k git with the patch, it seems to work longer, but I did not
run a long test series):

Searching for SAVEKMSG magic...
Found 131056 bytes at 0x001e0010
>>>>>>>>>>>>>>>>>>>>
[    0.000000] Initializing cgroup subsys cpuset
[    0.000000] Initializing cgroup subsys cpu
[    0.000000] Linux version 2.6.39-1-amiga (Debian 2.6.39-1) (maks@debian.org) (gcc version 4.4.6 (Debian 4.4.6-3) ) #1 Sat May 21 09:56:48 CEST 2011
[    0.000000] Enabling workaround for errata I14
[    0.000000] console [debug0] enabled
[    0.000000] Amiga hardware found: [A3000] VIDEO BLITTER AMBER_FF AUDIO FLOPPY A3000_SCSI KEYBOARD MOUSE SERIAL PARALLEL A3000_CLK CHIP_RAM PAULA DENISE_HR AGNUS_HR_PAL MAGIC_REKICK ZORRO3 
[    0.000000] Ignoring memory chunk at 0x7000000:0x1000000 before the first chunk
[    0.000000] Fix your bootloader or use a memfile to make use of this area!
[    0.000000] On node 0 totalpages: 28672
[    0.000000] free_area_init_node: node 0, pgdat 00322074, node_mem_map 003ab000
[    0.000000]   DMA zone: 252 pages used for memmap
[    0.000000]   DMA zone: 0 pages reserved
[    0.000000]   DMA zone: 28420 pages, LIFO batch:7
[    0.000000] pcpu-alloc: s0 r0 d32768 u32768 alloc=1*32768
[    0.000000] pcpu-alloc: [0] 0 
[    0.000000] Built 1 zonelists in Zone order, mobility grouping on.  Total pages: 28420
[    0.000000] Kernel command line: root=/dev/sda3 fb=false video=amifb:ntsc-lace debug=mem BOOT_IMAGE=Work:linux/vmlinux-2.6.39-1-amiga
[    0.000000] PID hash table entries: 512 (order: -1, 2048 bytes)
[    0.000000] Dentry cache hash table entries: 16384 (order: 4, 65536 bytes)
[    0.000000] Inode-cache hash table entries: 8192 (order: 3, 32768 bytes)
[    0.000000] allocated 458752 bytes of page_cgroup
[    0.000000] please try 'cgroup_disable=memory' option if you don't want memory cgroups
[    0.000000] Memory: 109340k/109340k available (2448k kernel code, 2764k data, 136k init)
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
[    0.100000] Initializing cgroup subsys memory
[    0.100000] Initializing cgroup subsys devices
[    0.100000] Initializing cgroup subsys freezer
[    0.100000] Initializing cgroup subsys blkio
[    0.120000] devtmpfs: initialized
[    0.130000] print_constraints: dummy: 
[    0.130000] NET: Registered protocol family 16
[    0.180000] bio: create slab <bio-0> at 0
[    0.190000] SCSI subsystem initialized
[    0.350000] NET: Registered protocol family 2
[    0.350000] IP route cache hash table entries: 1024 (order: 0, 4096 bytes)
[    0.360000] TCP established hash table entries: 4096 (order: 3, 32768 bytes)
[    0.370000] TCP bind hash table entries: 4096 (order: 2, 16384 bytes)
[    0.370000] TCP: Hash tables configured (established 4096 bind 4096)
[    0.370000] TCP reno registered
[    0.370000] UDP hash table entries: 256 (order: 0, 4096 bytes)
[    0.370000] UDP-Lite hash table entries: 256 (order: 0, 4096 bytes)
[    0.370000] NET: Registered protocol family 1
[    0.410000] VFS: Disk quotas dquot_6.5.2
[    0.410000] Dquot-cache hash table entries: 1024 (order 0, 4096 bytes)
[    0.410000] msgmni has been set to 213
[    0.430000] alg: No test for stdrng (krng)
[    0.430000] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 253)
[    0.430000] io scheduler noop registered
[    0.430000] io scheduler deadline registered
[    0.430000] io scheduler cfq registered (default)
[    0.570000] Console: switching to colour frame buffer device 80x25
[    0.640000] fb0: Amiga ECS frame buffer device, using 640K of video memory
[    0.660000] Amiga-builtin serial driver version 4.30
[    0.670000] ttyS0 is the amiga builtin serial port
[    0.680000] FD: probing units
[    0.680000] found 
[    0.690000] fd: drive 0 didn't identify, setting default ffffffff
[    0.700000] fd0 
[    0.810000] brd: module loaded
[    0.820000] Uniform Multi-Platform E-IDE driver
[    0.830000] ide-gd driver 1.18
[    0.840000] ide-cd driver 5.00
[    0.860000] wd33c93-0: chip=WD33c93A/0 no_sync=0xff no_dma=0 debug_flags=0x00
[    0.870000]            setup_args=,,,,,,,,,,
[    0.890000]            Version 1.26++ - 10/Feb/2007, Compiled May 21 2011 at 09:49:09
[    0.900000] scsi0 : Amiga 3000 built-in SCSI
[    0.920000] Zorro: Probing AutoConfig expansion devices: 2 devices
[    0.940000] mousedev: PS/2 mouse device common for all mice
[    0.950000] input: amiga-keyboard as /devices/platform/amiga-keyboard/input/input0
[    0.960000] input: amiga-mouse as /devices/platform/amiga-mouse/input/input1
[    0.980000] TCP cubic registered
[    0.990000] NET: Registered protocol family 17
[    1.000000] NET: Registered protocol family 15
[    1.010000] Registering the dns_resolver key type
[    1.030000] registered taskstats version 1
[    1.040000] scsi: waiting for bus probes to complete ...
[    1.750000]  sending SDTR 0103015e00 0103015e00 sync_xfer=30
[    1.780000] scsi 0:0:6:0: Direct-Access     ST325082 4A               3.AA PQ: 0 ANSI: 2
[    1.810000] /data/linux/m68k/linux-2.6-2.6.39/debian/build/source_m68k_none/drivers/rtc/hctosys.c: unable to open rtc device (rtc0)
[    1.830000] sd 0:0:6:0: [sda] 488397168 512-byte logical blocks: (250 GB/232 GiB)
[    1.840000] sd 0:0:6:0: [sda] Write Protect is off
[    1.850000] sd 0:0:6:0: [sda] Mode Sense: 03 00 00 08
[    1.870000] sd 0:0:6:0: [sda] Write cache: enabled, read cache: enabled, doesn't support DPO or FUA
[    1.890000] sda: detected capacity change from 0 to 250059350016
[    1.930000]  sda: RDSK (512) sda1 (DOS^C)(res 2 spb 1) sda2 (DOS^C)(res 2 spb 1) sda3 (LNX^@)(res 2 spb 1) sda4 (LNX^@)(res 2 spb 1) sda5 (LNX^@)(res 2 spb 1) sda6 (LNX^@)(res 2 spb 1) sda7 (LNX^@)(res 2 spb 1) sda8 (SWP^@)(res 2 spb 1)
[    1.980000] sd 0:0:6:0: [sda] Attached SCSI disk
[    2.020000] EXT3-fs: barriers not enabled
[    2.050000] kjournald starting.  Commit interval 5 seconds
[    2.060000] EXT3-fs (sda3): mounted filesystem with ordered data mode
[    2.080000] VFS: Mounted root (ext3 filesystem) readonly on device 8:3.
[    2.130000] Not activating Mandatory Access Control now since /sbin/tomoyo-init doesn't exist.
[   15.000000] eth0: Features changed: 0x00004800 -> 0x00004000
[   15.020000] eth0: Ariadne II at 0x00e90000, Ethernet Address 00:60:30:00:41:5b
[   17.320000] rtc-rp5c01 rtc-rp5c01: rtc core: registered rtc-rp5c01 as rtc0
[   17.600000] Z2RAM: using 0K Zorro II RAM and 1024K Chip RAM (Total 1024K)
[   19.400000] Amiga DMA sound driver rev 016 installed
[   19.410000] Core driver edition 01.06 : AMIGA driver edition 00.04
[   19.420000] Write will use    4 fragments of   32768 bytes as default
[   23.360000] parport0: Amiga built-in port using irq
[   23.450000] parport0: fix this legacy no-device port driver!
[   31.720000] Adding 2096092k swap on /dev/sda8.  Priority:-1 extents:1 across:2096092k 
[   33.830000] EXT3-fs (sda3): using internal journal
[   37.180000] loop: module loaded
[   64.390000] NET: Registered protocol family 10
[  536.000000] eth0: trigger_send() called with the transmitter busy.
[  536.260000] eth0: mismatched read page pointers  1 vs ff.
[  536.270000] eth0: mismatched read page pointers  1 vs ff.
[  536.280000] eth0: mismatched read page pointers  1 vs ff.
[  536.290000] eth0: mismatched read page pointers  1 vs  0.
[  536.300000] eth0: mismatched read page pointers 1d vs ff.
[  536.310000] eth0: trigger_send() called with the transmitter busy.
[  536.330000] eth0: mismatched read page pointers  5 vs ff.
[  536.340000] eth0: mismatched read page pointers  1 vs 1f.
[  536.350000] eth0: mismatched read page pointers  5 vs ff.
[  536.360000] eth0: mismatched read page pointers  1 vs ff.
[  536.370000] eth0: mismatched read page pointers  1 vs ff.
[  536.390000] eth0: mismatched read page pointers  5 vs ff.
[  536.400000] eth0: mismatched read page pointers  1 vs  0.
[  536.410000] eth0: mismatched read page pointers  5 vs ff.
[  536.420000] eth0: mismatched read page pointers  1 vs ff.
[  536.430000] eth0: mismatched read page pointers  1 vs ff.
[  536.440000] eth0: mismatched read page pointers  1 vs  0.
[  536.460000] eth0: mismatched read page pointers  1 vs ff.
[  536.470000] eth0: mismatched read page pointers  1 vs ff.
[  536.480000] eth0: mismatched read page pointers  5 vs  0.
[  536.490000] eth0: mismatched read page pointers  1 vs ff.
...
this goes on and on for 25 seconds, until I rebooted the machine, it was
completely unresponsive via the network and on the console.

Christian
