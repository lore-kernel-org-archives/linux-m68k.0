From: Waldemar Brodkorb <wbx@openadk.org>
Subject: regression for m68k/coldfire
Date: Thu, 2 Feb 2017 21:15:00 +0100
Message-ID: <20170202201500.GU11210@waldemar-brodkorb.de>
Reply-To: uClinux development list <uclinux-dev@uclinux.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <uclinux-dev-bounces@uclinux.org>
Content-Disposition: inline
List-Unsubscribe: <http://mailman.uclinux.org/mailman/options/uclinux-dev>,
 <mailto:uclinux-dev-request@uclinux.org?subject=unsubscribe>
List-Archive: <http://mailman.uclinux.org/pipermail/uclinux-dev>
List-Post: <mailto:uclinux-dev@uclinux.org>
List-Help: <mailto:uclinux-dev-request@uclinux.org?subject=help>
List-Subscribe: <http://mailman.uclinux.org/mailman/listinfo/uclinux-dev>,
 <mailto:uclinux-dev-request@uclinux.org?subject=subscribe>
Errors-To: uclinux-dev-bounces@uclinux.org
Sender: uclinux-dev-bounces@uclinux.org
To: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
Cc: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org, linux-kernel@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org

Hi,

your commit 80cca775cdc4f8555612d2943a2872076b33e0ff breaks Linux
booting in qemu-system-m68k:

qemu-system-m68k -nographic -M mcf5208evb -cpu m5208 -kernel qemu-m68k-mcf5208-initramfspiggyback-kernel

[    0.000000] Linux version 4.9.6-1 (wbx@vopenadk) (gcc version
5.4.0 (GCC) ) #2 Thu Feb 2 21:08:59 CET 2017
[    0.000000] uClinux with CPU COLDFIRE(m520x)
[    0.000000] COLDFIRE port done by Greg Ungerer, gerg@snapgear.com
[    0.000000] Flat model support (C) 1998,1999 Kenneth Albanowski,
D. Jeff Dionne
[    0.000000] Built 1 zonelists in Zone order, mobility grouping
on.  Total pages: 16320
[    0.000000] Kernel command line: console=ttyS0,115200 ro
rootfstype=tmpfs
[    0.000000] PID hash table entries: 512 (order: -2, 2048 bytes)
[    0.000000] Dentry cache hash table entries: 16384 (order: 3,
65536 bytes)
[    0.000000] Inode-cache hash table entries: 8192 (order: 2, 32768
bytes)
[    0.000000] Memory: 127920K/131072K available (1292K kernel code,
96K rwdata, 216K rodata, 560K init, 179K bss, 3152K reserved, 0K
cma-reserved)
[    0.000000] Virtual kernel memory layout:
[    0.000000]     vector  : 0x40000000 - 0x40000400   (   1 KiB)
[    0.000000]     kmap    : 0x00000000 - 0xffffffff   (4095 MiB)
[    0.000000]     vmalloc : 0x00000000 - 0xffffffff   (4095 MiB)
[    0.000000]     lowmem  : 0x40000000 - 0x48000000   ( 128 MiB)
[    0.000000]       .init : 0x401b2000 - 0x4023e000   ( 560 KiB)
[    0.000000]       .text : 0x40020000 - 0x40163350   (1293 KiB)
[    0.000000]       .data : 0x40163350 - 0x401b1640   ( 313 KiB)
[    0.000000]       .bss  : 0x4023e000 - 0x4026af04   ( 180 KiB)
[    0.000000] SLUB: HWalign=16, Order=0-3, MinObjects=0, CPUs=1,
Nodes=8
[    0.000000] NR_IRQS:256
[    0.000000] clocksource: pit: mask: 0xffffffff max_cycles:
0xffffffff, max_idle_ns: 3669622406313 ns
[    0.020000] Calibrating delay loop... 238.38 BogoMIPS
(lpj=1191936)
[    0.080000] pid_max: default: 4096 minimum: 301
[    0.080000] Mount-cache hash table entries: 2048 (order: 0, 8192
bytes)
[    0.080000] Mountpoint-cache hash table entries: 2048 (order: 0,
8192 bytes)
[    0.160000] clocksource: jiffies: mask: 0xffffffff max_cycles:
0xffffffff, max_idle_ns: 19112604462750000 ns
[    0.170000] NET: Registered protocol family 16
[    0.200000] pps_core: LinuxPPS API ver. 1 registered
[    0.200000] pps_core: Software ver. 5.3.6 - Copyright 2005-2007
Rodolfo Giometti <giometti@linux.it>
[    0.200000] PTP clock support registered
[    0.220000] clocksource: Switched to clocksource pit
[    0.230000] NET: Registered protocol family 2
[    0.240000] TCP established hash table entries: 2048 (order: 0,
8192 bytes)
[    0.240000] TCP bind hash table entries: 2048 (order: 0, 8192
bytes)
[    0.240000] TCP: Hash tables configured (established 2048 bind
2048)
[    0.240000] UDP hash table entries: 512 (order: 0, 8192 bytes)
[    0.240000] UDP-Lite hash table entries: 512 (order: 0, 8192
bytes)
[    0.250000] NET: Registered protocol family 1
[    2.560000] random: fast init done
[    3.400000] futex hash table entries: 16 (order: -6, 192 bytes)
[    3.400000] workingset: timestamp_bits=27 max_order=14
bucket_order=0
[    3.460000] ColdFire internal UART serial driver
[    3.470000] mcfuart.0: ttyS0 at MMIO 0xfc060000 (irq = 90,
base_baud = 2083333) is a ColdFire UART
[    3.500000] console [ttyS0] enabled
[    3.500000] mcfuart.0: ttyS1 at MMIO 0xfc064000 (irq = 91,
base_baud = 2083333) is a ColdFire UART
[    3.510000] mcfuart.0: ttyS2 at MMIO 0xfc068000 (irq = 92,
base_baud = 2083333) is a ColdFire UART
qemu: hardware error: mcf_fec_read: Bad address 0x200

CPU #0:
D0 = 00000200   A0 = 4780fdec   F0 = 0000000000000000 (           0)
D1 = 4780ff94   A1 = 401703de   F1 = 0000000000000000 (           0)
D2 = 46dbb000   A2 = 4780f800   F2 = 0000000000000000 (           0)
D3 = 4019d612   A3 = fc030200   F3 = 0000000000000000 (           0)
D4 = 00000000   A4 = 4019d608   F4 = 0000000000000000 (           0)
D5 = 40043f7a   A5 = 400222a0   F5 = 0000000000000000 (           0)
D6 = 400df204   A6 = 4783de78   F6 = 0000000000000000 (           0)
D7 = 401701c0   A7 = 4783de28   F7 = 0000000000000000 (           0)
PC = 400e5ff2   SR = 2009 -N--C FPRESULT =            0
Aborted
wbx@vopenadk:~/m68k/openadk$     
wbx@vopenadk:~/m68k/openadk$ qemu-system-m68k --version
QEMU emulator version 2.8.0
Copyright (c) 2003-2016 Fabrice Bellard and the QEMU Project
developers

Any ideas how to fix it?

best regards
 Waldemar

_______________________________________________
uClinux-dev mailing list
uClinux-dev@uclinux.org
http://mailman.uclinux.org/mailman/listinfo/uclinux-dev
This message was resent by uclinux-dev@uclinux.org
To unsubscribe see:
http://mailman.uclinux.org/mailman/options/uclinux-dev
