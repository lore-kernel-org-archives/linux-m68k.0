From: Finn Thain <fthain@telegraphics.com.au>
Subject: sonic ethernet and powerbook 520
Date: Thu, 29 Oct 2009 03:22:21 +1100 (EST)
Message-ID: <alpine.OSX.2.00.0910281848300.523@silk.local>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from www.telegraphics.com.au ([204.15.192.19]:62842 "EHLO
	mail.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751737AbZJ1QWO (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 28 Oct 2009 12:22:14 -0400
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org


I've just tested a new kernel on a powerbook 520, and it crashes while 
reading the sonic's MAC address. The same kernel binary works fine with 
Quadra comm-slot and on-board sonic NICs, which use the same code path.

The crash occurs while reading the MAC address during the driver probe. 
Basically, nubus_readb(ONBOARD_SONIC_PROM_BASE) fails. Macsbug can't read 
this address either.

Anyone want to take a guess at the real PROM base? If I had a rough idea I 
could get Macsbug to search for the MAC address, but it's a bit difficult 
when the memory map is full of holes. Is it worth trying to search 
/dev/kmem?

Finn


Linux version 2.6.31.5-mac (fthain@nippy) (gcc version 4.4.1 (GCC) ) #3 Wed Oct 28 18:11:28 EST 2009
Detected Macintosh model: 72 
VIA1 at 50f00000 is a 6522 or clone
VIA2 at 50f02000 is a 6522 or clone
Apple Macintosh PowerBook 520
Built 1 zonelists in Zone order, mobility grouping off.  Total pages: 3045
Kernel command line: console=tty0 console=ttyS0,9600n8
PID hash table entries: 64 (order: 6, 256 bytes)
Dentry cache hash table entries: 2048 (order: 1, 8192 bytes)
Inode-cache hash table entries: 1024 (order: 0, 4096 bytes)
Memory: 8948k/8948k available (1760k kernel code, 1048k data, 532k init)
Killing onboard sonic... Done.
Console: colour dummy device 80x25
console [tty0] enabled
console [ttyS0] enabled
Calibrating delay loop... 16.43 BogoMIPS (lpj=82176)
Mount-cache hash table entries: 512
devtmpfs: initialized
NET: Registered protocol family 16
bio: create slab <bio-0> at 0
NuBus: Scanning NuBus slots.
SCSI subsystem initialized
NET: Registered protocol family 2
IP route cache hash table entries: 1024 (order: 0, 4096 bytes)
TCP established hash table entries: 512 (order: 0, 4096 bytes)
TCP bind hash table entries: 512 (order: -1, 2048 bytes)
TCP: Hash tables configured (established 512 bind 512)
TCP reno registered
NET: Registered protocol family 1
msgmni has been set to 17
alg: No test for stdrng (krng)
io scheduler noop registered
io scheduler deadline registered (default)
macfb: framebuffer at 0x60000000, mapped to 0xd0000000, size 37k
macfb: mode is 640x480x1, linelength=80
macfb: scrolling: redraw
Console: switching to mono frame buffer device 80x30
fb0: CSC frame buffer device
Generic RTC Driver v1.07
pmac_zilog: 0.6 (Benjamin Herrenschmidt <benh@kernel.crashing.org>)
ttyS0 at MMIO 0x50f04002 (irq = 4) is a Z85c30 ESCC - Serial port
ttyS1 at MMIO 0x50f04000 (irq = 4) is a Z85c30 ESCC - Serial port
brd: module loaded
loop: module loaded
input: Macintosh mouse button emulation as /class/input/input0
Warning: no ADB interface detected
Uniform Multi-Platform E-IDE driver
ide-gd driver 1.18
Checking for internal Macintosh ethernet (SONIC).. yes
sonic.c:v0.92 20.9.98 tsbogend@alpha.franken.de
macsonic: onboard / comm-slot SONIC at 0x50f0a000
macsonic: revision 0x0004, using 16 bit DMA and register offset 0
Unable to handle kernel access at virtual address 50f08000
Oops: 00000000
Modules linked in:
PC: [<001b5384>] mac_sonic_probe+0x22a/0x718
SR: 2010  SP: 0081be84  a2: 008198f0
d0: 00008019    d1: ffffffff    d2: 00000000    d3: 00000038
d4: 00000000    d5: 00001000    a0: 00000000    a1: 50f08000
Process swapper (pid: 1, task=008198f0)
Frame format=7 eff addr=0081be60 ssw=0125 faddr=50f08000
wb 1 stat/addr/data: 0025 50f08000 ffffffff
wb 2 stat/addr/data: 0025 50f08000 ffffffff
wb 3 stat/addr/data: 0045 50f0a014 00007fff
push data: ffffffff 00000004 00000010 00000000
Stack from 0081beec:
        0081bf5c 0025f930 00000000 00001000 00000001 00246b50 0025f930 00246b82
        0081bf64 001294c6 00246b48 0081bf5c 00246b50 0025f930 00129594 0025f930
        00246b50 001b3ea6 00129540 00537920 00128e2e 00246b50 0025f930 00000000
        00000000 00000000 0025f930 0025e4c8 00804558 00817d50 00309ff8 0012935e
        0025e4c8 00000000 0025f930 00129540 00128788 0025f930 00000000 00000040
        00000000 0025f930 00002008 007cedb4 00309ff8 00129844 0025f930 00000000
Call Trace: [<00001000>] kernel_pg_dir+0x0/0x1000
 [<001294c6>] driver_probe_device+0x82/0xfc
 [<00129594>] __driver_attach+0x54/0x78
 [<001b3ea6>] klist_next+0x0/0x84
 [<00129540>] __driver_attach+0x0/0x78
 [<00128e2e>] bus_for_each_dev+0x58/0x88
 [<0012935e>] driver_attach+0x16/0x1c
 [<00129540>] __driver_attach+0x0/0x78
 [<00128788>] bus_add_driver+0x96/0x1ee
 [<00002008>] do_one_initcall+0x0/0x172
 [<00129844>] driver_register+0x96/0x106
 [<00294984>] mac_sonic_init_module+0x0/0x10
 [<00002008>] do_one_initcall+0x0/0x172
 [<00294990>] mac_sonic_init_module+0xc/0x10
 [<00002046>] do_one_initcall+0x3e/0x172
 [<00001000>] kernel_pg_dir+0x0/0x1000
 [<002849ee>] kernel_init+0x78/0xc8
 [<00294984>] mac_sonic_init_module+0x0/0x10
 [<00284976>] kernel_init+0x0/0xc8
 [<00002000>] _start+0x0/0x8
 [<00002824>] kernel_thread+0x3a/0x4e

Code: 0004 30bc 7fff 91c8 227c 50f0 8000 d3c8 <1011> 226b 0136 1380 8800 5288 7606 b688 66e6 2a6b 0136 4878 0003 4879 001d 8228
