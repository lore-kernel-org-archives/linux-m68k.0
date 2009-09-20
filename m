From: Lance Tagliapietra <lancetag@Luminet.net>
Subject: 2.6.29 kernel crash in SCSI driver
Date: Sun, 20 Sep 2009 08:59:54 -0500
Message-ID: <20090920135952.GA3466@luminet.net>
Reply-To: lancetag@luminet.net
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="1yeeQ81UyVL57Vl7"
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from spamtitan.hbci.com ([206.230.105.6]:56152 "EHLO
	spamtitan.hbci.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751971AbZITOVf (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 20 Sep 2009 10:21:35 -0400
Received: from localhost (localhost [127.0.0.1])
	by spamtitan.hbci.com (Postfix) with ESMTP id CD8C5AB9DAD
	for <linux-m68k@vger.kernel.org>; Sun, 20 Sep 2009 09:10:49 -0500 (CDT)
Received: from mail.hbci.com (ultra.hbci.com [206.230.105.5])
	by spamtitan.hbci.com (Postfix) with ESMTP id 77CF8AB9D9B
	for <linux-m68k@vger.kernel.org>; Sun, 20 Sep 2009 09:10:47 -0500 (CDT)
Received: from tag1amiga.luminet.net (unknown [205.243.118.55])
	by mail.hbci.com (Postfix) with ESMTP id B7B3D278202
	for <linux-m68k@vger.kernel.org>; Sun, 20 Sep 2009 09:11:03 -0500 (CDT)
Received: from lancetag by tag1amiga.luminet.net with local (Exim 3.36 #1 (Debian))
	id 1MpN07-0000w0-00
	for <linux-m68k@vger.kernel.org>; Sun, 20 Sep 2009 09:02:51 -0500
Content-Disposition: inline
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.hbci.com, kernel.org@hbci.com


--1yeeQ81UyVL57Vl7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello,

I can generate a very repeatable kernel crash when a bad block on my
hard drive is referenced.  The crash occurs on a 2.6.29 kernel, but not
on a 2.4.30 kernel.  It is repeatable (the bad block hasn't changed).
:)  The crash can occur when referencing the file which had the bad
block allocated to it, and when running fsck -C /home -- -c
to get that block mapped out.

Hardware:
Amiga 2000 / 40 MHz GVP 030 Combo Card (with SCSI) 9G SCSI hard disc (hosting
/home partition mentioned above) / 16M RAM

See attached DMESG with crash info.

I booted in to a 2.4.30 kernel, and got the block mapped out, but I'm
willing to help test any changes against this configuration.

Thanks,

--Lance

--1yeeQ81UyVL57Vl7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="fsck-2.6-crashlog.txt"

Searching for SAVEKMSG magic...
Found 10048 bytes at 0x000dc010
>>>>>>>>>>>>>>>>>>>>
Linux version 2.6.29.1 (lancetag@tag1amiga) (gcc version 4.1.2 20061115 (prerelease) (Debian 4.1.1-21)) #2 Wed May 13 20:22:09 CDT 2009
Warning: no chipram present for debugging
Amiga hardware found: [A2000] VIDEO BLITTER AUDIO FLOPPY KEYBOARD MOUSE SERIAL PARALLEL A2000_CLK CHIP_RAM PAULA DENISE_HR AGNUS_HR_NTSC ZORRO 
console [debug0] enabled
Ignoring memory chunk at 0x200000:0x600000 before the first chunk
Fix your bootloader or use a memfile to make use of this area!
On node 0 totalpages: 4096
free_area_init_node: node 0, pgdat 001cf1c4, node_mem_map 00201000
  DMA zone: 36 pages used for memmap
  DMA zone: 0 pages reserved
  DMA zone: 4060 pages, LIFO batch:0
Built 1 zonelists in Zone order, mobility grouping off.  Total pages: 4060
Kernel command line: debug=mem root=/dev/sda2 fb=false video=amifb:ntsc-lace single
PID hash table entries: 64 (order: 6, 256 bytes)
Console: colour dummy device 80x25
console [tty0] enabled
Linux version 2.6.29.1 (lancetag@tag1amiga) (gcc version 4.1.2 20061115 (prerelease) (Debian 4.1.1-21)) #2 Wed May 13 20:22:09 CDT 2009
Warning: no chipram present for debugging
Amiga hardware found: [A2000] VIDEO BLITTER AUDIO FLOPPY KEYBOARD MOUSE SERIAL PARALLEL A2000_CLK CHIP_RAM PAULA DENISE_HR AGNUS_HR_NTSC ZORRO 
console [debug0] enabled
Ignoring memory chunk at 0x200000:0x600000 before the first chunk
Fix your bootloader or use a memfile to make use of this area!
On node 0 totalpages: 4096
free_area_init_node: node 0, pgdat 001cf1c4, node_mem_map 00201000
  DMA zone: 36 pages used for memmap
  DMA zone: 0 pages reserved
  DMA zone: 4060 pages, LIFO batch:0
Built 1 zonelists in Zone order, mobility grouping off.  Total pages: 4060
Kernel command line: debug=mem root=/dev/sda2 fb=false video=amifb:ntsc-lace single
PID hash table entries: 64 (order: 6, 256 bytes)
Console: colour dummy device 80x25
console [tty0] enabled
Dentry cache hash table entries: 2048 (order: 1, 8192 bytes)
Inode-cache hash table entries: 1024 (order: 0, 4096 bytes)
Memory: 14172k/14172k available (1348k kernel code, 768k data, 96k init)
SLUB: Genslabs=12, HWalign=16, Order=0-3, MinObjects=0, CPUs=1, Nodes=8
Calibrating delay loop... 9.70 BogoMIPS (lpj=48512)
Mount-cache hash table entries: 512
net_namespace: 296 bytes
NET: Registered protocol family 16
bio: create slab <bio-0> at 0
SCSI subsystem initialized
Zorro: Probing AutoConfig expansion devices: 9 devices
NET: Registered protocol family 2
IP route cache hash table entries: 1024 (order: 0, 4096 bytes)
TCP established hash table entries: 512 (order: 0, 4096 bytes)
TCP bind hash table entries: 512 (order: -1, 2048 bytes)
TCP: Hash tables configured (established 512 bind 512)
TCP reno registered
NET: Registered protocol family 1
msgmni has been set to 27
alg: No test for stdrng (krng)
io scheduler noop registered
io scheduler deadline registered (default)
Console: switching to colour frame buffer device 80x25
fb0: Amiga ECS frame buffer device, using 640K of video memory
cirrusfb: CL Spectrum board detected;  RAM (2 MB) at $800000, <6> REG at $ec0000
Cirrus Logic chipset on Zorro bus
cirrusfb: Driver for Cirrus Logic based graphic boards, v2.0-pre2
Amiga-builtin serial driver version 4.30
ttyS0 is the amiga builtin serial port
lp: driver loaded but no devices found
parport0: Amiga built-in port using irq
parport0: fix this legacy no-device port driver!
lp0: using parport0 (interrupt-driven).
eth0 (): not using net_device_ops yet
eth0: A2065 at 0x00ee0000, Ethernet Address 00:80:10:00:07:48
wd33c93-0: chip=WD33c93A/9 no_sync=0xff no_dma=0 debug_flags=0x00
           setup_args=,,,,,,,,,,
           Version 1.26++ - 10/Feb/2007, Compiled May 12 2009 at 23:19:12
scsi0 : GVP Series II SCSI
 sending SDTR 0103015e00 0103015e00 sync_xfer=30
scsi 0:0:1:0: CD-ROM            DEC      RRD47   (C) DEC  1206 PQ: 0 ANSI: 2
 sending SDTR 0103015e00 0103015e00 sync_xfer=30
scsi 0:0:3:0: Direct-Access     IBM      DCHS09F  CLAR09  2424 PQ: 0 ANSI: 2
 sending SDTR 0103015e00 0103013200 sync_xfer=20
scsi 0:0:6:0: Direct-Access     SEAGATE  SX150176LC       BA11 PQ: 0 ANSI: 2
Driver 'sd' needs updating - please use bus_type methods
sd 0:0:3:0: [sda] 17796078 512-byte hardware sectors: (9.11 GB/8.48 GiB)
sd 0:0:3:0: [sda] Write Protect is off
sd 0:0:3:0: [sda] Mode Sense: bf 00 10 08
sd 0:0:3:0: [sda] Write cache: disabled, read cache: enabled, supports DPO and FUA
sd 0:0:3:0: [sda] 17796078 512-byte hardware sectors: (9.11 GB/8.48 GiB)
sd 0:0:3:0: [sda] Write Protect is off
sd 0:0:3:0: [sda] Mode Sense: bf 00 10 08
sd 0:0:3:0: [sda] Write cache: disabled, read cache: enabled, supports DPO and FUA
 sda: RDSK (512) sda1 (LNX^@)(res 2 spb 1) sda2 (LNX^@)(res 2 spb 1)
sd 0:0:3:0: [sda] Attached SCSI disk
sd 0:0:6:0: [sdb] 97693755 512-byte hardware sectors: (50.0 GB/46.5 GiB)
sd 0:0:6:0: [sdb] Write Protect is off
sd 0:0:6:0: [sdb] Mode Sense: cb 00 10 08
sd 0:0:6:0: [sdb] Write cache: enabled, read cache: enabled, supports DPO and FUA
sd 0:0:6:0: [sdb] 97693755 512-byte hardware sectors: (50.0 GB/46.5 GiB)
sd 0:0:6:0: [sdb] Write Protect is off
sd 0:0:6:0: [sdb] Mode Sense: cb 00 10 08
sd 0:0:6:0: [sdb] Write cache: enabled, read cache: enabled, supports DPO and FUA
 sdb: RDSK (512) sdb1 (DOS^C)(res 2 spb 1) sdb2 (DOS^C)(res 2 spb 1) sdb3 (SWP^@)(res 2 spb 1) sdb4 (LNX^@)(res 2 spb 1) sdb5 (LNX^@)(res 2 spb 1)
sd 0:0:6:0: [sdb] Attached SCSI disk
mice: PS/2 mouse device common for all mice
input: Amiga Keyboard as /devices/virtual/input/input0
test: dev (254:0)
rtc-test rtc-test.0: rtc core: registered test as rtc0
test: dev (254:1)
rtc-test rtc-test.1: rtc core: registered test as rtc1
TCP cubic registered
rtc-test rtc-test.0: setting system clock to 2009-08-20 00:30:58 UTC (1250728258)
VFS: Mounted root (ext2 filesystem) readonly on device 8:2.
Adding 860500k swap on /dev/sdb3.  Priority:-1 extents:1 across:860500k 
Generic RTC Driver v1.07
------------[ cut here ]------------
WARNING: at fs/proc/generic.c:547 0x1910df()
proc_dir_entry 'driver/rtc' already registered
Modules linked in: genrtc(+)
Call Trace: [<0000cf72>] warn_slowpath+0x56/0x7e
 [<0000cf80>] warn_slowpath+0x64/0x7e
 [<000af710>] kobject_uevent_env+0x300/0x340
 [<000aecb6>] kobject_get+0x14/0x1e
 [<000e1b7c>] get_device+0x12/0x1c
 [<000e4eb8>] klist_class_dev_get+0x12/0x16
 [<0014d70c>] klist_node_init+0x38/0x40
 [<000aeb84>] kobject_put+0x1e/0x46
 [<000aec30>] kobject_release+0x0/0x72
 [<000ae4ac>] ida_pre_get+0x0/0x6c
 [<0001fd02>] blocking_notifier_call_chain+0x0/0x1e
 [<000adf1e>] idr_get_empty_slot+0x0/0x294
 [<000ae33c>] ida_get_new_above+0x18a/0x1e6
 [<000ae4ac>] ida_pre_get+0x0/0x6c
 [<0001fd02>] blocking_notifier_call_chain+0x0/0x1e
 [<0001fd02>] blocking_notifier_call_chain+0x0/0x1e
 [<000ae4c2>] ida_pre_get+0x16/0x6c
 [<00080130>] proc_register+0x120/0x186
 [<01875000>] rtc_generic_init+0x0/0x62 [genrtc]
 [<0001fd02>] blocking_notifier_call_chain+0x0/0x1e
 [<0014f1ae>] mutex_unlock+0x0/0x24
 [<0008029a>] create_proc_entry+0x54/0x9c
 [<0000243c>] name_to_dev_t+0x198/0x200
 [<01875036>] rtc_generic_init+0x36/0x62 [genrtc]
 [<00002024>] do_one_initcall+0x1c/0x1a4
 [<0000243c>] name_to_dev_t+0x198/0x200
 [<00014262>] __mod_timer+0x0/0x96
 [<0000243c>] name_to_dev_t+0x198/0x200
 [<0001fd1a>] blocking_notifier_call_chain+0x18/0x1e
 [<000282e8>] sys_init_module+0x72/0x18a
 [<000282fa>] sys_init_module+0x84/0x18a
 [<01875000>] rtc_generic_init+0x0/0x62 [genrtc]
 [<0000243c>] name_to_dev_t+0x198/0x200
 [<00002576>] syscall+0x8/0xc
 [<0000243c>] name_to_dev_t+0x198/0x200
 [<0001c72c>] prepare_to_wait+0x0/0x34
 [<00019114>] ____call_usermodehelper+0xb2/0xde
 [<00019062>] ____call_usermodehelper+0x0/0xde
 [<00002a7a>] kernel_thread+0x3a/0x4e

---[ end trace a1772effa92406e5 ]---
sd 0:0:3:0: [sda] Sense Key : Recovered Error [current] 
Info fld=0xa4c9cf
sd 0:0:3:0: [sda] Add. Sense: Recovered data with error corr. & retries applied
sd 0:0:3:0: [sda] Sense Key : Recovered Error [current] 
Info fld=0xa91729
sd 0:0:3:0: [sda] Add. Sense: Recovered data - recommend reassignment
sd 0:0:3:0: [sda] Sense Key : Recovered Error [current] 
Info fld=0xa922be
sd 0:0:3:0: [sda] Add. Sense: Recovered data - recommend reassignment
*** ZERO DIVIDE ***   FORMAT=2
Current process id is 230
BAD KERNEL TRAP: 00000000
Modules linked in: affs genrtc
PC: [<000f6d30>] sd_completed_bytes+0xd8/0xfa
SR: 2002  SP: 002adedc  a2: 002b8c90
d0: 00000000    d1: 00000001    d2: 00aa8a00    d3: 00000000
d4: 00aa8a00    d5: 00000000    a0: 00000000    a1: 00aa8a00
Process scsi_eh_0 (pid: 230, task=002b8c90)
Frame format=2 instr addr=000f6d2c
Stack from 002adf14:
        00000008 00000008 002adfd4 002adfc4 002d2c34 00009698 002681e0 002d2c00
        002de400 00000000 00000000 00000000 00aa8a93 002adf68 000f8eba 002681e0
        002d2004 0001c398 00040000 7003110b 00000000 002681e0 000e90d8 002681e0
        002681ec 002681e0 002adfb8 002adfc4 000ebe48 002681e0 002681ec 002adfd4
        002d2c00 002adfdc 000ecb3a 002adfc4 002d2c00 00002a40 0000a7ce 00251ff4
        0001a0e0 0001c398 000ec8f6 00008acc 002adfc4 002adfc4 000ec8f6 00008acc
Call Trace: [<00009698>] set_user_nice+0x0/0xf8
 [<000f8eba>] sd_done+0x110/0x11c
 [<0001c398>] kthread_should_stop+0x0/0xe
 [<00040000>] copy_vma+0xe2/0x11c
 [<000e90d8>] scsi_finish_command+0x5e/0x90
 [<000ebe48>] scsi_eh_flush_done_q+0x50/0xbe
 [<000ecb3a>] scsi_error_handler+0x244/0x290
 [<00002a40>] kernel_thread+0x0/0x4e
 [<0000a7ce>] sched_setscheduler+0x0/0x1c
 [<0001a0e0>] find_task_by_pid_ns+0x0/0x18
 [<0001c398>] kthread_should_stop+0x0/0xe
 [<000ec8f6>] scsi_error_handler+0x0/0x290
 [<00008acc>] complete+0x0/0x36
 [<000ec8f6>] scsi_error_handler+0x0/0x290
 [<00008acc>] complete+0x0/0x36
 [<00008acc>] complete+0x0/0x36
 [<0001c3f0>] kthread+0x4a/0x5c
 [<0001c3a6>] kthread+0x0/0x5c
 [<0014ec34>] schedule+0x0/0x1de
 [<00002a7a>] kernel_thread+0x3a/0x4e

Code: 2043 2244 2404 4283 200b 220c 4c40 2403 <2242> 2005 2206 2206 4282 260b 280c 4c43 1402 2800 2a01 6090 4cee 38fc ffcc 4e5e
amikbd: Ctrl-Amiga-Amiga reset warning!!
amikbd: Ctrl-Amiga-Amiga reset warning!!
<<<<<<<<<<<<<<<<<<<<

--1yeeQ81UyVL57Vl7--
