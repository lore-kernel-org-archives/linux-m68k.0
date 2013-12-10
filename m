From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: [PATCH/RFC] futex: Switch to USER_DS for futex test
Date: Wed, 11 Dec 2013 09:08:59 +1100 (EST)
Message-ID: <alpine.LNX.2.00.1312110830200.19724@nippy.intranet>
References: <1386706216-17764-1-git-send-email-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:41606 "EHLO
	kvm5.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750983Ab3LJWJH (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 10 Dec 2013 17:09:07 -0500
In-Reply-To: <1386706216-17764-1-git-send-email-geert@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Tuxist <tuxist@tuxist.de>, Patrick McCarthy <patrickjmc@gmail.com>, Andreas Schwab <schwab@linux-m68k.org>, linux-m68k@vger.kernel.org


On Tue, 10 Dec 2013, Geert Uytterhoeven wrote:

> Fix this by switching to USER_DS before running the test, and restoring 
> the old address space afterwards.

Yep, that fixed it. Thankyou Geert and Andreas.

I tested your patch by booting to busybox from initramfs. Please ignore 
the PMU driver and RTC errors in the log below; I've never seen the PMU 
driver work on PowerBook 1XX series hardware. Hence no RTC or ADB and 
hence the serial console. The "Bus error in macscsi_pread" message is also 
normal.

Finn


# 
# cat /proc/cpuinfo 
CPU:            68030
MMU:            68030
FPU:            68882
Clocking:       31.3MHz
BogoMips:       7.83
Calibration:    39168 loops
# cat /proc/version 
Linux version 3.12.4-mac (fthain@nippy) (gcc version 4.4.6 (GCC) ) #1 Wed 
Dec 11 08:17:18 EST 2013
# cat /proc/hardware 
Model:          Macintosh PowerBook 180
System Memory:  12288K
# cat /proc/meminfo 
MemTotal:           9076 kB
MemFree:            7044 kB
Buffers:               0 kB
Cached:              532 kB
SwapCached:            0 kB
Active:              392 kB
Inactive:            200 kB
Active(anon):        392 kB
Inactive(anon):      200 kB
Active(file):          0 kB
Inactive(file):        0 kB
Unevictable:           0 kB
Mlocked:               0 kB
SwapTotal:             0 kB
SwapFree:              0 kB
Dirty:                 0 kB
Writeback:             0 kB
AnonPages:            88 kB
Mapped:              264 kB
Shmem:               532 kB
Slab:               1040 kB
SReclaimable:        112 kB
SUnreclaim:          928 kB
KernelStack:         192 kB
PageTables:           20 kB
NFS_Unstable:          0 kB
Bounce:                0 kB
WritebackTmp:          0 kB
CommitLimit:        4536 kB
Committed_AS:       1132 kB
VmallocTotal:    3391488 kB
VmallocUsed:          64 kB
VmallocChunk:    3391424 kB
# dmesg
Linux version 3.12.4-mac (fthain@nippy) (gcc version 4.4.6 (GCC) ) #1 Wed Dec 11 08:17:18 EST 2013
bootconsole [early0] enabled
Detected Macintosh model: 33
 Penguin bootinfo data:
 Video: addr 0x60040000 row 0x140 depth 4 dimensions 640 x 400
 Videological 0xf0040000 phys. 0x60040000, SCC at 0x50f04000
 Boottime: 0x52b55270 GMTBias: 0x0
 Machine ID: 33 CPUid: 0x1 memory size: 0xc
VIA1 at 50f00000 is a 6522 or clone
VIA2 at 50f02000 is a 6522 or clone
Apple Macintosh PowerBook 180
On node 0 totalpages: 3072
free_area_init_node: node 0, pgdat 002d7dfc, node_mem_map 00314000
  DMA zone: 27 pages used for memmap
  DMA zone: 0 pages reserved
  DMA zone: 3072 pages, LIFO batch:0
initrd: 00bbf400 - 00c00000
pcpu-alloc: s0 r0 d32768 u32768 alloc=1*32768
pcpu-alloc: [0] 0 
Built 1 zonelists in Zone order, mobility grouping off.  Total pages: 3045
Kernel command line: console=ttyS0
PID hash table entries: 64 (order: -4, 256 bytes)
Dentry cache hash table entries: 2048 (order: 1, 8192 bytes)
Inode-cache hash table entries: 1024 (order: 0, 4096 bytes)
Sorting __ex_table...
Memory: 8716K/12288K available (2172K kernel code, 241K rwdata, 604K 
rodata, 104K init, 122K bss, 3572K reserved)
Virtual kernel memory layout:
    vector  : 0x002d78f4 - 0x002d7cf4   (   1 KiB)
    kmap    : 0xd0000000 - 0xf0000000   ( 512 MiB)
    vmalloc : 0x01000000 - 0xd0000000   (3312 MiB)
    lowmem  : 0x00000000 - 0x00c00000   (  12 MiB)
      .init : 0x002f7000 - 0x00311000   ( 104 KiB)
      .text : 0x00001000 - 0x0022011e   (2173 KiB)
      .data : 0x00222cd8 - 0x002f62f0   ( 846 KiB)
      .bss  : 0x002d7720 - 0x002f62f0   ( 123 KiB)
SLUB: HWalign=16, Order=0-3, MinObjects=0, CPUs=1, Nodes=8
NR_IRQS:72
Killing onboard sonic... Done.
PMU: SR_INT but ack still high! (42)
PMU: SR_INT but ack still high! (42)
PMU: SR_INT but ack still high! (42)
PMU: SR_INT but ack still high! (42)
PMU: SR_INT but ack still high! (42)
WARNING: Persistent clock returned invalid value!
         Check your CMOS/BIOS settings.
Console: colour dummy device 80x25
console [ttyS0] enabled, bootconsole disabled
Calibrating delay loop... 7.83 BogoMIPS (lpj=39168)
pid_max: default: 32768 minimum: 301
Mount-cache hash table entries: 512
devtmpfs: initialized
NET: Registered protocol family 16
bio: create slab <bio-0> at 0
NuBus: Scanning NuBus slots.
SCSI subsystem initialized
NET: Registered protocol family 2
TCP established hash table entries: 512 (order: 0, 4096 bytes)
TCP bind hash table entries: 512 (order: -1, 2048 bytes)
TCP: Hash tables configured (established 512 bind 512)
TCP: reno registered
UDP hash table entries: 256 (order: 0, 4096 bytes)
UDP-Lite hash table entries: 256 (order: 0, 4096 bytes)
NET: Registered protocol family 1
RPC: Registered named UNIX socket transport module.
RPC: Registered udp transport module.
RPC: Registered tcp transport module.
RPC: Registered tcp NFSv4.1 backchannel transport module.
Unpacking initramfs...
Freeing initrd memory: 256K (00bc0000 - 00c00000)
NFS: Registering the id_resolver key type
Key type id_resolver registered
Key type id_legacy registered
msgmni has been set to 17
Block layer SCSI generic (bsg) driver version 0.4 loaded (major 253)
io scheduler noop registered
io scheduler deadline registered (default)
macfb: framebuffer at 0x60040000, mapped to 0xd0000000, size 125k
macfb: mode is 640x400x4, linelength=320
Console: switching to colour frame buffer device 80x25
fb0: GSC frame buffer device
pmac_zilog: 0.6 (Benjamin Herrenschmidt <benh@kernel.crashing.org>)
scc.0: ttyS0 at MMIO 0x50f04002 (irq = 4, base_baud = 230400) is a Z85c30 ESCC - Serial port
scc.1: ttyS1 at MMIO 0x50f04000 (irq = 4, base_baud = 230400) is a Z85c30 ESCC - Serial port
PMU: SR_INT but ack still high! (42)
PMU: SR_INT but ack still high! (42)
PMU: SR_INT but ack still high! (42)
PMU: SR_INT but ack still high! (42)
PMU: SR_INT but ack still high! (42)
PMU: SR_INT but ack still high! (42)
PMU: SR_INT but ack still high! (42)
PMU: SR_INT but ack still high! (42)
PMU: SR_INT but ack still high! (42)
PMU: SR_INT but ack still high! (42)
PMU: SR_INT but ack still high! (42)
pmu_init: timed out acking intrs
Warning: no ADB interface detected
Uniform Multi-Platform E-IDE driver
ide-gd driver 1.18
Macintosh SCSI: resetting the SCSI bus...
 done
scsi0: generic 5380 at port 50F10000 irq
 19 options CAN_QUEUE=16 CMD_PER_LUN=2 release=2

scsi0: generic options AUTOSENSE PSEUDO DMA USLEEP, USLEEP_POLL=20 USLEEP_SLEEP=2 generic release=7
scsi0 : 
blk_queue_max_segments: set to minimum 1
scsi 0:0:0:0: Direct-Access     QUANTUM  DAYTONA514S      5110 PQ: 0 ANSI: 2 CCS
blk_queue_max_segments: set to minimum 1
blk_queue_max_segments: set to minimum 1
blk_queue_max_segments: set to minimum 1
blk_queue_max_segments: set to minimum 1
blk_queue_max_segments: set to minimum 1
blk_queue_max_segments: set to minimum 1
Bus error in macscsi_pread
sd 0:0:0:0: switching to slow handshake
sd 0:0:0:0: [sda] Sector size 0 reported, assuming 512.
sd 0:0:0:0: [sda] 1 512-byte logical blocks: (512 B/512 B)
sd 0:0:0:0: [sda] 0-byte physical blocks
sd 0:0:0:0: [sda] Write Protect is off
sd 0:0:0:0: [sda] Mode Sense: 91 00 00 08
sd 0:0:0:0: [sda] Write cache: enabled, read cache: enabled, doesn't 
support DPO or FUA
aoe: cannot create debugfs directory
aoe: AoE v85 initialised.
sd 0:0:0:0: [sda] 1005569 512-byte logical blocks: (514 MB/491 MiB)
mousedev: PS/2 mouse device common for all mice
PMU: SR_INT but ack still high! (42)
PMU: SR_INT but ack still high! (42)
PMU: SR_INT but ack still high! (42)
PMU: SR_INT but ack still high! (42)
PMU: SR_INT but ack still high! (42)
rtc-generic rtc-generic: rtc core: registered rtc-generic as rtc0
TCP: cubic registered
NET: Registered protocol family 17
Key type dns_resolver registered
sda: detected capacity change from 512 to 514851328
 sda: [mac] sda1 sda2 sda3 sda4 sda5 sda6
sd 0:0:0:0: [sda] Attached SCSI disk
Freeing unused kernel memory: 104K (002f7000 - 00311000)
# 
