From: Daniel Palmer <danieruru@gmail.com>
Subject: Getting stuck during boot on a 68VZ328 (DragonBallVZ).
Date: Fri, 28 Mar 2014 02:58:27 +0900
Message-ID: <CAO64nm7D_cfy95rdDasH9jeHhXRzLpMMpniK-BKxCsqZsn7yZw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-yk0-f176.google.com ([209.85.160.176]:39277 "EHLO
	mail-yk0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753351AbaC0R62 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 27 Mar 2014 13:58:28 -0400
Received: by mail-yk0-f176.google.com with SMTP id 19so2632593ykq.21
        for <linux-m68k@vger.kernel.org>; Thu, 27 Mar 2014 10:58:27 -0700 (PDT)
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org

Hi,

I'm working on getting Linux running on a Motorola 68VZ328 development kit.
I've written a tool to work with it's built in bootloader mode,
implemented the parts
for  early printk to work and fixed up some register settings. I can
get the kernel
to start booting now and printk is working. It's not getting very far
in the boot
process (see long attached output). Is anyone currently running the nommu
m68k port? Is it known to be broken?

Please CC me as I'm not subscribed.

loading "/home/daniel/coding/musasim/dragonballstuff/linux/vmlinux.bin" to 0x400
wrote 957440 bytes
>r 0x400
parsing command r 0x400

jumping to code at 0x400
Reading input from board
Linux version 3.14.0-rc8+ (daniel@mirmachina) (gcc version 4.8.2 (GCC)
) #32 Fri Mar 28 02:28:29 JST 2014
bootconsole [early0] enabled
68VZ328 DragonBallVZ support (c) 2001 Lineo, Inc.


uClinux/MC68VZ328
M68VZ328 support by Evan Stawnyczy <e@lineo.ca>
Flat model support (C) 1998,1999 Kenneth Albanowski, D. Jeff Dionne
Built 1 zonelists in Zone order, mobility grouping off.  Total pages: 2032
Kernel command line: console=ttyS0,115200
PID hash table entries: 32 (order: -5, 128 bytes)
Dentry cache hash table entries: 1024 (order: 0, 4096 bytes)
Inode-cache hash table entries: 1024 (order: 0, 4096 bytes)
Memory: 7052K/8192K available (724K kernel code, 32K rwdata, 136K
rodata, 40K init, 81K bss, 1140K reserved)
Virtual kernel memory layout:
    vector  : 0x00000000 - 0x00000400   (   1 KiB)
    kmap    : 0x00000000 - 0xffffffff   (4095 MiB)
    vmalloc : 0x00000000 - 0xffffffff   (4095 MiB)
    lowmem  : 0x00000000 - 0x00800000   (   8 MiB)
      .init : 0x000e0000 - 0x000ea000   (  40 KiB)
      .text : 0x00000400 - 0x000b5710   ( 725 KiB)
      .data : 0x000b5710 - 0x000df7e0   ( 169 KiB)
      .bss  : 0x000ea000 - 0x000fe6c8   (  82 KiB)
SLUB: HWalign=16, Order=0-3, MinObjects=0, CPUs=1, Nodes=8
NR_IRQS:32
Linux version 3.14.0-rc8+ (daniel@mirmachina) (gcc version 4.8.2 (GCC)
) #32 Fri Mar 28 02:28:29 JST 2014
bootconsole [early0] enabled
68VZ328 DragonBallVZ support (c) 2001 Lineo, Inc.


uClinux/MC68VZ328
M68VZ328 support by Evan Stawnyczy <e@lineo.ca>
Flat model support (C) 1998,1999 Kenneth Albanowski, D. Jeff Dionne
------------[ cut here ]------------
WARNING: CPU: 0 PID: 0 at mm/page_alloc.c:4918 free_area_init_node+0x2a4/0x2aa()
CPU: 0 PID: 0 Comm: swapper Not tainted 3.14.0-rc8+ #32
Stack from 000d8f1c:
        000d8f1c 000d56b8 0000476e 00000000 00000005 00000000 00002000 0008dbcc
        000d8fc0 0000482c 000d2262 00001336 000e35fc 00000009 00000000 000e35fc
        000d2262 00001336 00000800 00000005 00000000 00002000 00000002 00000030
        0008dbcc 000d8fc0 000b25e8 00002704 000d8ff8 00100000 00000000 000e3610
        00000000 000d8fc0 00000000 00000000 000e0f4a 000d8fc0 000e7a28 00000100
        00111090 00000800 00000000 00000000 000e0eb8 00089e20 000e03cc 000d8ff4
Call Trace: [<0000476e>] warn_slowpath_common+0x64/0x78
 [<00002000>] show_registers+0x1b0/0x416
 [<0008dbcc>] memset+0x0/0x70
 [<0000482c>] warn_slowpath_null+0x16/0x1e
 [<00001336>] show_cpuinfo+0x1a/0xa8
 [<000e35fc>] free_area_init_node+0x2a4/0x2aa
 [<000e35fc>] free_area_init_node+0x2a4/0x2aa
 [<00001336>] show_cpuinfo+0x1a/0xa8
 [<00000800>] calibrate_delay+0x88/0x22c
 [<00002000>] show_registers+0x1b0/0x416
 [<0008dbcc>] memset+0x0/0x70
 [<000b25e8>] printk+0x0/0x24
 [<00002704>] inthandler1+0x26/0x28
 [<000e3610>] free_area_init+0xe/0x14
 [<000e0f4a>] paging_init+0x70/0x7c
 [<00000800>] calibrate_delay+0x88/0x22c
 [<000e0eb8>] setup_arch+0x126/0x136
 [<00089e20>] strcpy+0x0/0x12
 [<000e03cc>] start_kernel+0x78/0x2c6
 [<00089e20>] strcpy+0x0/0x12
 [<000b25e8>] printk+0x0/0x24
 [<00000480>] _exit+0x0/0x4

---[ end trace b64f93fd77ce594e ]---
Built 1 zonelists in Zone order, mobility grouping off.  Total pages: 2032
Kernel command line: console=ttyS0,115200
PID hash table entries: 64 (order: -4, 256 bytes)
Dentry cache hash table entries: 2048 (order: 1, 8192 bytes)
Inode-cache hash table entries: 1024 (order: 0, 4096 bytes)
BUG: Bad page state in process swapper  pfn:0010f
page:001031e0 count:0 mapcount:1 mapping:  (null) index:0x0
page flags: 0x0()
page dumped because: nonzero mapcount
CPU: 0 PID: 0 Comm: swapper Tainted: G        W    3.14.0-rc8+ #32
Stack from 000d8f14:
        000d8f14 000d56b8 0003c8b2 001031e0 000d291b 00000000 000d28eb 000d94f2
        0000010f 00000000 00000000 001031e0 0003c774 0003c9ac 001031e0 000d291b
        00000000 00000000 0000010f 00000000 000ff000 001031e0 000e3616 0003dcee
        001031e0 00000000 00000000 0000010f 000e8f74 000e3616 000b25e8 0008dd1c
        000e51f8 001031e0 00000000 000e7a28 00000005 00000000 00002000 00000002
        00000030 00089e20 00101090 000b25e8 00002704 000d8ff8 00000800 00000120
Call Trace: [<0003c8b2>] bad_page+0x13e/0x146
 [<0003c774>] bad_page+0x0/0x146
 [<0003c9ac>] free_pages_prepare+0xf2/0xfa
 [<000e3616>] __free_pages_bootmem+0x0/0x9a
 [<0003dcee>] free_hot_cold_page+0x12/0xec
 [<000e3616>] __free_pages_bootmem+0x0/0x9a
 [<000b25e8>] printk+0x0/0x24
 [<0008dd1c>] __mulsi3+0x0/0x24
 [<000e51f8>] free_all_bootmem+0x126/0x1ca
 [<00002000>] show_registers+0x1b0/0x416
 [<00089e20>] strcpy+0x0/0x12
 [<000b25e8>] printk+0x0/0x24
 [<00002704>] inthandler1+0x26/0x28
 [<00000800>] calibrate_delay+0x88/0x22c
 [<000e1042>] mem_init+0x6/0x14
 [<000e04d8>] start_kernel+0x184/0x2c6
 [<00089e20>] strcpy+0x0/0x12
 [<000b25e8>] printk+0x0/0x24
 [<00000480>] _exit+0x0/0x4

Disabling lock debugging due to kernel taint
BUG: Bad page state in process swapper  pfn:00110
page:00103200 count:0 mapcount:1 mapping:  (null) index:0x0
page flags: 0x0()
page dumped because: nonzero mapcount
CPU: 0 PID: 0 Comm: swapper Tainted: G    B   W    3.14.0-rc8+ #32
Stack from 000d8f14:
        000d8f14 000d56b8 0003c818 00103200 000d291b 00000000 000d28eb 000d94f2
        00000110 00000000 00000000 00103200 0003c774 0003c9ac 00103200 000d291b
        00000000 00000000 00000110 00000001 000ff000 00103200 000e3616 0003dcee
        00103200 00000000 00000000 00000110 000e8f74 000e3616 000b25e8 0008dd1c
        000e51f8 00103200 00000000 000e7a28 00000005 00000000 00002000 00000002
        00000030 00089e20 00101090 000b25e8 00002704 000d8ff8 00000800 00000120
Call Trace: [<0003c818>] bad_page+0xa4/0x146
 [<0003c774>] bad_page+0x0/0x146
 [<0003c9ac>] free_pages_prepare+0xf2/0xfa
 [<000e3616>] __free_pages_bootmem+0x0/0x9a
 [<0003dcee>] free_hot_cold_page+0x12/0xec
 [<000e3616>] __free_pages_bootmem+0x0/0x9a
 [<000b25e8>] printk+0x0/0x24
 [<0008dd1c>] __mulsi3+0x0/0x24
 [<000e51f8>] free_all_bootmem+0x126/0x1ca
 [<00002000>] show_registers+0x1b0/0x416
 [<00089e20>] strcpy+0x0/0x12
 [<000b25e8>] printk+0x0/0x24
 [<00002704>] inthandler1+0x26/0x28
 [<00000800>] calibrate_delay+0x88/0x22c
 [<000e1042>] mem_init+0x6/0x14
 [<000e04d8>] start_kernel+0x184/0x2c6
 [<00089e20>] strcpy+0x0/0x12
 [<000b25e8>] printk+0x0/0x24
 [<00000480>] _exit+0x0/0x4

BUG: Bad page state in process swapper  pfn:00111
page:00103220 count:0 mapcount:1 mapping:  (null) index:0x0
page flags: 0x0()
page dumped because: nonzero mapcount
CPU: 0 PID: 0 Comm: swapper Tainted: G    B   W    3.14.0-rc8+ #32
Stack from 000d8f14:
        000d8f14 000d56b8 0003c818 00103220 000d291b 00000000 000d28eb 000d94f2
        00000111 00000000 00000000 00103220 0003c774 0003c9ac 00103220 000d291b
        00000000 00000000 00000111 00000002 000ff000 00103220 000e3616 0003dcee
        00103220 00000000 00000000 00000111 000e8f74 000e3616 000b25e8 0008dd1c
        000e51f8 00103220 00000000 000e7a28 00000005 00000000 00002000 00000002
        00000030 00089e20 00101090 000b25e8 00002704 000d8ff8 00000800 00000120
Call Trace: [<0003c818>] bad_page+0xa4/0x146
 [<0003c774>] bad_page+0x0/0x146
 [<0003c9ac>] free_pages_prepare+0xf2/0xfa
 [<000e3616>] __free_pages_bootmem+0x0/0x9a
 [<0003dcee>] free_hot_cold_page+0x12/0xec
 [<000e3616>] __free_pages_bootmem+0x0/0x9a
 [<000b25e8>] printk+0x0/0x24
 [<0008dd1c>] __mulsi3+0x0/0x24
 [<000e51f8>] free_all_bootmem+0x126/0x1ca
 [<00002000>] show_registers+0x1b0/0x416
 [<00089e20>] strcpy+0x0/0x12
 [<000b25e8>] printk+0x0/0x24
 [<00002704>] inthandler1+0x26/0x28
 [<00000800>] calibrate_delay+0x88/0x22c
 [<000e1042>] mem_init+0x6/0x14
 [<000e04d8>] start_kernel+0x184/0x2c6
 [<00089e20>] strcpy+0x0/0x12
 [<000b25e8>] printk+0x0/0x24
 [<00000480>] _exit+0x0/0x4

BUG: Bad page state in process swapper  pfn:00112
page:00103240 count:0 mapcount:1 mapping:  (null) index:0x0
page flags: 0x0()
page dumped because: nonzero mapcount
CPU: 0 PID: 0 Comm: swapper Tainted: G    B   W    3.14.0-rc8+ #32
Stack from 000d8f14:
        000d8f14 000d56b8 0003c818 00103240 000d291b 00000000 000d28eb 000d94f2
        00000112 00000000 00000000 00103240 0003c774 0003c9ac 00103240 000d291b
        00000000 00000000 00000112 00000003 000ff000 00103240 000e3616 0003dcee
        00103240 00000000 00000000 00000112 000e8f74 000e3616 000b25e8 0008dd1c
        000e51f8 00103240 00000000 000e7a28 00000005 00000000 00002000 00000002
        00000030 00089e20 00101090 000b25e8 00002704 000d8ff8 00000800 00000120
Call Trace: [<0003c818>] bad_page+0xa4/0x146
 [<0003c774>] bad_page+0x0/0x146
 [<0003c9ac>] free_pages_prepare+0xf2/0xfa
 [<000e3616>] __free_pages_bootmem+0x0/0x9a
 [<0003dcee>] free_hot_cold_page+0x12/0xec
 [<000e3616>] __free_pages_bootmem+0x0/0x9a
 [<000b25e8>] printk+0x0/0x24
 [<0008dd1c>] __mulsi3+0x0/0x24
 [<000e51f8>] free_all_bootmem+0x126/0x1ca
 [<00002000>] show_registers+0x1b0/0x416
 [<00089e20>] strcpy+0x0/0x12
 [<000b25e8>] printk+0x0/0x24
 [<00002704>] inthandler1+0x26/0x28
 [<00000800>] calibrate_delay+0x88/0x22c
 [<000e1042>] mem_init+0x6/0x14
 [<000e04d8>] start_kernel+0x184/0x2c6
 [<00089e20>] strcpy+0x0/0x12
 [<000b25e8>] printk+0x0/0x24
 [<00000480>] _exit+0x0/0x4

BUG: Bad page state in process swapper  pfn:00113
page:00103260 count:0 mapcount:1 mapping:  (null) index:0x0
page flags: 0x0()
page dumped because: nonzero mapcount
CPU: 0 PID: 0 Comm: swapper Tainted: G    B   W    3.14.0-rc8+ #32
Stack from 000d8f14:
        000d8f14 000d56b8 0003c818 00103260 000d291b 00000000 000d28eb 000d94f2
        00000113 00000000 00000000 00103260 0003c774 0003c9ac 00103260 000d291b
        00000000 00000000 00000113 00000004 000ff000 00103260 000e3616 0003dcee
        00103260 00000000 00000000 00000113 000e8f74 000e3616 000b25e8 0008dd1c
        000e51f8 00103260 00000000 000e7a28 00000005 00000000 00002000 00000002
        00000030 00089e20 00101090 000b25e8 00002704 000d8ff8 00000800 00000120
Call Trace: [<0003c818>] bad_page+0xa4/0x146
 [<0003c774>] bad_page+0x0/0x146
 [<0003c9ac>] free_pages_prepare+0xf2/0xfa
 [<000e3616>] __free_pages_bootmem+0x0/0x9a
 [<0003dcee>] free_hot_cold_page+0x12/0xec
 [<000e3616>] __free_pages_bootmem+0x0/0x9a
 [<000b25e8>] printk+0x0/0x24
 [<0008dd1c>] __mulsi3+0x0/0x24
 [<000e51f8>] free_all_bootmem+0x126/0x1ca
 [<00002000>] show_registers+0x1b0/0x416
 [<00089e20>] strcpy+0x0/0x12
 [<000b25e8>] printk+0x0/0x24
 [<00002704>] inthandler1+0x26/0x28
 [<00000800>] calibrate_delay+0x88/0x22c
 [<000e1042>] mem_init+0x6/0x14
 [<000e04d8>] start_kernel+0x184/0x2c6
 [<00089e20>] strcpy+0x0/0x12
 [<000b25e8>] printk+0x0/0x24
 [<00000480>] _exit+0x0/0x4

BUG: Bad page state in process swapper  pfn:00114
page:00103280 count:0 mapcount:1 mapping:  (null) index:0x0
page flags: 0x0()
page dumped because: nonzero mapcount
CPU: 0 PID: 0 Comm: swapper Tainted: G    B   W    3.14.0-rc8+ #32
Stack from 000d8f14:
        000d8f14 000d56b8 0003c818 00103280 000d291b 00000000 000d28eb 000d94f2
        00000114 00000000 00000000 00103280 0003c774 0003c9ac 00103280 000d291b
        00000000 00000000 00000114 00000005 000ff000 00103280 000e3616 0003dcee
        00103280 00000000 00000000 00000114 000e8f74 000e3616 000b25e8 0008dd1c
        000e51f8 00103280 00000000 000e7a28 00000005 00000000 00002000 00000002
        00000030 00089e20 00101090 000b25e8 00002704 000d8ff8 00000800 00000120
Call Trace: [<0003c818>] bad_page+0xa4/0x146
 [<0003c774>] bad_page+0x0/0x146
 [<0003c9ac>] free_pages_prepare+0xf2/0xfa
 [<000e3616>] __free_pages_bootmem+0x0/0x9a
 [<0003dcee>] free_hot_cold_page+0x12/0xec
 [<000e3616>] __free_pages_bootmem+0x0/0x9a
 [<000b25e8>] printk+0x0/0x24
 [<0008dd1c>] __mulsi3+0x0/0x24
 [<000e51f8>] free_all_bootmem+0x126/0x1ca
 [<00002000>] show_registers+0x1b0/0x416
 [<00089e20>] strcpy+0x0/0x12
 [<000b25e8>] printk+0x0/0x24
 [<00002704>] inthandler1+0x26/0x28
 [<00000800>] calibrate_delay+0x88/0x22c
 [<000e1042>] mem_init+0x6/0x14
 [<000e04d8>] start_kernel+0x184/0x2c6
 [<00089e20>] strcpy+0x0/0x12
 [<000b25e8>] printk+0x0/0x24
 [<00000480>] _exit+0x0/0x4

BUG: Bad page state in process swapper  pfn:00115
page:001032a0 count:0 mapcount:1 mapping:  (null) index:0x0
page flags: 0x0()
page dumped because: nonzero mapcount
CPU: 0 PID: 0 Comm: swapper Tainted: G    B   W    3.14.0-rc8+ #32
Stack from 000d8f14:
        000d8f14 000d56b8 0003c818 001032a0 000d291b 00000000 000d28eb 000d94f2
        00000115 00000000 00000000 001032a0 0003c774 0003c9ac 001032a0 000d291b
        00000000 00000000 00000115 00000006 000ff000 001032a0 000e3616 0003dcee
        001032a0 00000000 00000000 00000115 000e8f74 000e3616 000b25e8 0008dd1c
        000e51f8 001032a0 00000000 000e7a28 00000005 00000000 00002000 00000002
        00000030 00089e20 00101090 000b25e8 00002704 000d8ff8 00000800 00000120
Call Trace: [<0003c818>] bad_page+0xa4/0x146
 [<0003c774>] bad_page+0x0/0x146
 [<0003c9ac>] free_pages_prepare+0xf2/0xfa
 [<000e3616>] __free_pages_bootmem+0x0/0x9a
 [<0003dcee>] free_hot_cold_page+0x12/0xec
 [<000e3616>] __free_pages_bootmem+0x0/0x9a
 [<000b25e8>] printk+0x0/0x24
 [<0008dd1c>] __mulsi3+0x0/0x24
 [<000e51f8>] free_all_bootmem+0x126/0x1ca
 [<00002000>] show_registers+0x1b0/0x416
 [<00089e20>] strcpy+0x0/0x12
 [<000b25e8>] printk+0x0/0x24
 [<00002704>] inthandler1+0x26/0x28
 [<00000800>] calibrate_delay+0x88/0x22c
 [<000e1042>] mem_init+0x6/0x14
 [<000e04d8>] start_kernel+0x184/0x2c6
 [<00089e20>] strcpy+0x0/0x12
 [<000b25e8>] printk+0x0/0x24
 [<00000480>] _exit+0x0/0x4

BUG: Bad page state in process swapper  pfn:00116
page:001032c0 count:0 mapcount:1 mapping:  (null) index:0x0
page flags: 0x0()
page dumped because: nonzero mapcount
CPU: 0 PID: 0 Comm: swapper Tainted: G    B   W    3.14.0-rc8+ #32
Stack from 000d8f14:
        000d8f14 000d56b8 0003c818 001032c0 000d291b 00000000 000d28eb 000d94f2
        00000116 00000000 00000000 001032c0 0003c774 0003c9ac 001032c0 000d291b
        00000000 00000000 00000116 00000007 000ff000 001032c0 000e3616 0003dcee
        001032c0 00000000 00000000 00000116 000e8f74 000e3616 000b25e8 0008dd1c
        000e51f8 001032c0 00000000 000e7a28 00000005 00000000 00002000 00000002
        00000030 00089e20 00101090 000b25e8 00002704 000d8ff8 00000800 00000120
Call Trace: [<0003c818>] bad_page+0xa4/0x146
 [<0003c774>] bad_page+0x0/0x146
 [<0003c9ac>] free_pages_prepare+0xf2/0xfa
 [<000e3616>] __free_pages_bootmem+0x0/0x9a
 [<0003dcee>] free_hot_cold_page+0x12/0xec
 [<000e3616>] __free_pages_bootmem+0x0/0x9a
 [<000b25e8>] printk+0x0/0x24
 [<0008dd1c>] __mulsi3+0x0/0x24
 [<000e51f8>] free_all_bootmem+0x126/0x1ca
 [<00002000>] show_registers+0x1b0/0x416
 [<00089e20>] strcpy+0x0/0x12
 [<000b25e8>] printk+0x0/0x24
 [<00002704>] inthandler1+0x26/0x28
 [<00000800>] calibrate_delay+0x88/0x22c
 [<000e1042>] mem_init+0x6/0x14
 [<000e04d8>] start_kernel+0x184/0x2c6
 [<00089e20>] strcpy+0x0/0x12
 [<000b25e8>] printk+0x0/0x24
 [<00000480>] _exit+0x0/0x4

BUG: Bad page state in process swapper  pfn:00117
page:001032e0 count:0 mapcount:1 mapping:  (null) index:0x0
page flags: 0x0()
page dumped because: nonzero mapcount
CPU: 0 PID: 0 Comm: swapper Tainted: G    B   W    3.14.0-rc8+ #32
Stack from 000d8f14:
        000d8f14 000d56b8 0003c818 001032e0 000d291b 00000000 000d28eb 000d94f2
        00000117 00000000 00000000 001032e0 0003c774 0003c9ac 001032e0 000d291b
        00000000 00000000 00000117 00000008 000ff000 001032e0 000e3616 0003dcee
        001032e0 00000000 00000000 00000117 000e8f74 000e3616 000b25e8 0008dd1c
        000e51f8 001032e0 00000000 000e7a28 00000005 00000000 00002000 00000002
        00000030 00089e20 00101090 000b25e8 00002704 000d8ff8 00000800 00000120
Call Trace: [<0003c818>] bad_page+0xa4/0x146
 [<0003c774>] bad_page+0x0/0x146
 [<0003c9ac>] free_pages_prepare+0xf2/0xfa
 [<000e3616>] __free_pages_bootmem+0x0/0x9a
 [<0003dcee>] free_hot_cold_page+0x12/0xec
 [<000e3616>] __free_pages_bootmem+0x0/0x9a
 [<000b25e8>] printk+0x0/0x24
 [<0008dd1c>] __mulsi3+0x0/0x24
 [<000e51f8>] free_all_bootmem+0x126/0x1ca
 [<00002000>] show_registers+0x1b0/0x416
 [<00089e20>] strcpy+0x0/0x12
 [<000b25e8>] printk+0x0/0x24
 [<00002704>] inthandler1+0x26/0x28
 [<00000800>] calibrate_delay+0x88/0x22c
 [<000e1042>] mem_init+0x6/0x14
 [<000e04d8>] start_kernel+0x184/0x2c6
 [<00089e20>] strcpy+0x0/0x12
 [<000b25e8>] printk+0x0/0x24
 [<00000480>] _exit+0x0/0x4

BUG: Bad page state in process swapper  pfn:00118
page:00103300 count:0 mapcount:1 mapping:  (null) index:0x0
page flags: 0x0()
page dumped because: nonzero mapcount
CPU: 0 PID: 0 Comm: swapper Tainted: G    B   W    3.14.0-rc8+ #32
Stack from 000d8f14:
        000d8f14 000d56b8 0003c818 00103300 000d291b 00000000 000d28eb 000d94f2
        00000118 00000000 00000000 00103300 0003c774 0003c9ac 00103300 000d291b
        00000000 00000000 00000118 00000009 000ff000 00103300 000e3616 0003dcee
        00103300 00000000 00000000 00000118 000e8f74 000e3616 000b25e8 0008dd1c
        000e51f8 00103300 00000000 000e7a28 00000005 00000000 00002000 00000002
        00000030 00089e20 00101090 000b25e8 00002704 000d8ff8 00000800 00000120
Call Trace: [<0003c818>] bad_page+0xa4/0x146
 [<0003c774>] bad_page+0x0/0x146
 [<0003c9ac>] free_pages_prepare+0xf2/0xfa
 [<000e3616>] __free_pages_bootmem+0x0/0x9a
 [<0003dcee>] free_hot_cold_page+0x12/0xec
 [<000e3616>] __free_pages_bootmem+0x0/0x9a
 [<000b25e8>] printk+0x0/0x24
 [<0008dd1c>] __mulsi3+0x0/0x24
 [<000e51f8>] free_all_bootmem+0x126/0x1ca
 [<00002000>] show_registers+0x1b0/0x416
 [<00089e20>] strcpy+0x0/0x12
 [<000b25e8>] printk+0x0/0x24
 [<00002704>] inthandler1+0x26/0x28
 [<00000800>] calibrate_delay+0x88/0x22c
 [<000e1042>] mem_init+0x6/0x14
 [<000e04d8>] start_kernel+0x184/0x2c6
 [<00089e20>] strcpy+0x0/0x12
 [<000b25e8>] printk+0x0/0x24
 [<00000480>] _exit+0x0/0x4

BUG: Bad page state in process swapper  pfn:00119
page:00103320 count:0 mapcount:1 mapping:  (null) index:0x0
page flags: 0x0()
page dumped because: nonzero mapcount
CPU: 0 PID: 0 Comm: swapper Tainted: G    B   W    3.14.0-rc8+ #32
Stack from 000d8f14:
        000d8f14 000d56b8 0003c818 00103320 000d291b 00000000 000d28eb 000d94f2
        00000119 00000000 00000000 00103320 0003c774 0003c9ac 00103320 000d291b
        00000000 00000000 00000119 0000000a 000ff000 00103320 000e3616 0003dcee
        00103320 00000000 00000000 00000119 000e8f74 000e3616 000b25e8 0008dd1c
        000e51f8 00103320 00000000 000e7a28 00000005 00000000 00002000 00000002
        00000030 00089e20 00101090 000b25e8 00002704 000d8ff8 00000800 00000120
Call Trace: [<0003c818>] bad_page+0xa4/0x146
 [<0003c774>] bad_page+0x0/0x146
 [<0003c9ac>] free_pages_prepare+0xf2/0xfa
 [<000e3616>] __free_pages_bootmem+0x0/0x9a
 [<0003dcee>] free_hot_cold_page+0x12/0xec
 [<000e3616>] __free_pages_bootmem+0x0/0x9a
 [<000b25e8>] printk+0x0/0x24
 [<0008dd1c>] __mulsi3+0x0/0x24
 [<000e51f8>] free_all_bootmem+0x126/0x1ca
 [<00002000>] show_registers+0x1b0/0x416
 [<00089e20>] strcpy+0x0/0x12
 [<000b25e8>] printk+0x0/0x24
 [<00002704>] inthandler1+0x26/0x28
 [<00000800>] calibrate_delay+0x88/0x22c
 [<000e1042>] mem_init+0x6/0x14
 [<000e04d8>] start_kernel+0x184/0x2c6
 [<00089e20>] strcpy+0x0/0x12
 [<000b25e8>] printk+0x0/0x24
 [<00000480>] _exit+0x0/0x4

BUG: Bad page state in process swapper  pfn:0011a
page:00103340 count:0 mapcount:1 mapping:  (null) index:0x0
page flags: 0x0()
page dumped because: nonzero mapcount
CPU: 0 PID: 0 Comm: swapper Tainted: G    B   W    3.14.0-rc8+ #32
Stack from 000d8f14:
        000d8f14 000d56b8 0003c818 00103340 000d291b 00000000 000d28eb 000d94f2
        0000011a 00000000 00000000 00103340 0003c774 0003c9ac 00103340 000d291b
        00000000 00000000 0000011a 0000000b 000ff000 00103340 000e3616 0003dcee
        00103340 00000000 00000000 0000011a 000e8f74 000e3616 000b25e8 0008dd1c
        000e51f8 00103340 00000000 000e7a28 00000005 00000000 00002000 00000002
        00000030 00089e20 00101090 000b25e8 00002704 000d8ff8 00000800 00000120
Call Trace: [<0003c818>] bad_page+0xa4/0x146
 [<0003c774>] bad_page+0x0/0x146
 [<0003c9ac>] free_pages_prepare+0xf2/0xfa
 [<000e3616>] __free_pages_bootmem+0x0/0x9a
 [<0003dcee>] free_hot_cold_page+0x12/0xec
 [<000e3616>] __free_pages_bootmem+0x0/0x9a
 [<000b25e8>] printk+0x0/0x24
 [<0008dd1c>] __mulsi3+0x0/0x24
 [<000e51f8>] free_all_bootmem+0x126/0x1ca
 [<00002000>] show_registers+0x1b0/0x416
 [<00089e20>] strcpy+0x0/0x12
 [<000b25e8>] printk+0x0/0x24
 [<00002704>] inthandler1+0x26/0x28
 [<00000800>] calibrate_delay+0x88/0x22c
 [<000e1042>] mem_init+0x6/0x14
 [<000e04d8>] start_kernel+0x184/0x2c6
 [<00089e20>] strcpy+0x0/0x12
 [<000b25e8>] printk+0x0/0x24
 [<00000480>] _exit+0x0/0x4

BUG: Bad page state in process swapper  pfn:0011b
page:00103360 count:0 mapcount:1 mapping:  (null) index:0x0
page flags: 0x0()
page dumped because: nonzero mapcount
CPU: 0 PID: 0 Comm: swapper Tainted: G    B   W    3.14.0-rc8+ #32
Stack from 000d8f14:
        000d8f14 000d56b8 0003c818 00103360 000d291b 00000000 000d28eb 000d94f2
        0000011b 00000000 00000000 00103360 0003c774 0003c9ac 00103360 000d291b
        00000000 00000000 0000011b 0000000c 000ff000 00103360 000e3616 0003dcee
        00103360 00000000 00000000 0000011b 000e8f74 000e3616 000b25e8 0008dd1c
        000e51f8 00103360 00000000 000e7a28 00000005 00000000 00002000 00000002
        00000030 00089e20 00101090 000b25e8 00002704 000d8ff8 00000800 00000120
Call Trace: [<0003c818>] bad_page+0xa4/0x146
 [<0003c774>] bad_page+0x0/0x146
 [<0003c9ac>] free_pages_prepare+0xf2/0xfa
 [<000e3616>] __free_pages_bootmem+0x0/0x9a
 [<0003dcee>] free_hot_cold_page+0x12/0xec
 [<000e3616>] __free_pages_bootmem+0x0/0x9a
 [<000b25e8>] printk+0x0/0x24
 [<0008dd1c>] __mulsi3+0x0/0x24
 [<000e51f8>] free_all_bootmem+0x126/0x1ca
 [<00002000>] show_registers+0x1b0/0x416
 [<00089e20>] strcpy+0x0/0x12
 [<000b25e8>] printk+0x0/0x24
 [<00002704>] inthandler1+0x26/0x28
 [<00000800>] calibrate_delay+0x88/0x22c
 [<000e1042>] mem_init+0x6/0x14
 [<000e04d8>] start_kernel+0x184/0x2c6
 [<00089e20>] strcpy+0x0/0x12
 [<000b25e8>] printk+0x0/0x24
 [<00000480>] _exit+0x0/0x4

BUG: Bad page state in process swapper  pfn:0011c
page:00103380 count:0 mapcount:1 mapping:  (null) index:0x0
page flags: 0x0()
page dumped because: nonzero mapcount
CPU: 0 PID: 0 Comm: swapper Tainted: G    B   W    3.14.0-rc8+ #32
Stack from 000d8f14:
        000d8f14 000d56b8 0003c818 00103380 000d291b 00000000 000d28eb 000d94f2
        0000011c 00000000 00000000 00103380 0003c774 0003c9ac 00103380 000d291b
        00000000 00000000 0000011c 0000000d 000ff000 00103380 000e3616 0003dcee
        00103380 00000000 00000000 0000011c 000e8f74 000e3616 000b25e8 0008dd1c
        000e51f8 00103380 00000000 000e7a28 00000005 00000000 00002000 00000002
        00000030 00089e20 00101090 000b25e8 00002704 000d8ff8 00000800 00000120
Call Trace: [<0003c818>] bad_page+0xa4/0x146
 [<0003c774>] bad_page+0x0/0x146
 [<0003c9ac>] free_pages_prepare+0xf2/0xfa
 [<000e3616>] __free_pages_bootmem+0x0/0x9a
 [<0003dcee>] free_hot_cold_page+0x12/0xec
 [<000e3616>] __free_pages_bootmem+0x0/0x9a
 [<000b25e8>] printk+0x0/0x24
 [<0008dd1c>] __mulsi3+0x0/0x24
 [<000e51f8>] free_all_bootmem+0x126/0x1ca
 [<00002000>] show_registers+0x1b0/0x416
 [<00089e20>] strcpy+0x0/0x12
 [<000b25e8>] printk+0x0/0x24
 [<00002704>] inthandler1+0x26/0x28
 [<00000800>] calibrate_delay+0x88/0x22c
 [<000e1042>] mem_init+0x6/0x14
 [<000e04d8>] start_kernel+0x184/0x2c6
 [<00089e20>] strcpy+0x0/0x12
 [<000b25e8>] printk+0x0/0x24
 [<00000480>] _exit+0x0/0x4

BUG: Bad page state in process swapper  pfn:0011d
page:001033a0 count:0 mapcount:1 mapping:  (null) index:0x0
page flags: 0x0()
page dumped because: nonzero mapcount
CPU: 0 PID: 0 Comm: swapper Tainted: G    B   W    3.14.0-rc8+ #32
Stack from 000d8f14:
        000d8f14 000d56b8 0003c818 001033a0 000d291b 00000000 000d28eb 000d94f2
        0000011d 00000000 00000000 001033a0 0003c774 0003c9ac 001033a0 000d291b
        00000000 00000000 0000011d 0000000e 000ff000 001033a0 000e3616 0003dcee
        001033a0 00000000 00000000 0000011d 000e8f74 000e3616 000b25e8 0008dd1c
        000e51f8 001033a0 00000000 000e7a28 00000005 00000000 00002000 00000002
        00000030 00089e20 00101090 000b25e8 00002704 000d8ff8 00000800 00000120
Call Trace: [<0003c818>] bad_page+0xa4/0x146
 [<0003c774>] bad_page+0x0/0x146
 [<0003c9ac>] free_pages_prepare+0xf2/0xfa
 [<000e3616>] __free_pages_bootmem+0x0/0x9a
 [<0003dcee>] free_hot_cold_page+0x12/0xec
 [<000e3616>] __free_pages_bootmem+0x0/0x9a
 [<000b25e8>] printk+0x0/0x24
 [<0008dd1c>] __mulsi3+0x0/0x24
 [<000e51f8>] free_all_bootmem+0x126/0x1ca
 [<00002000>] show_registers+0x1b0/0x416
 [<00089e20>] strcpy+0x0/0x12
 [<000b25e8>] printk+0x0/0x24
 [<00002704>] inthandler1+0x26/0x28
 [<00000800>] calibrate_delay+0x88/0x22c
 [<000e1042>] mem_init+0x6/0x14
 [<000e04d8>] start_kernel+0x184/0x2c6
 [<00089e20>] strcpy+0x0/0x12
 [<000b25e8>] printk+0x0/0x24
 [<00000480>] _exit+0x0/0x4

BUG: Bad page state in process swapper  pfn:0011e
page:001033c0 count:0 mapcount:1 mapping:  (null) index:0x0
page flags: 0x0()
page dumped because: nonzero mapcount
CPU: 0 PID: 0 Comm: swapper Tainted: G    B   W    3.14.0-rc8+ #32
Stack from 000d8f14:
        000d8f14 000d56b8 0003c818 001033c0 000d291b 00000000 000d28eb 000d94f2
        0000011e 00000000 00000000 001033c0 0003c774 0003c9ac 001033c0 000d291b
        00000000 00000000 0000011e 0000000f 000ff000 001033c0 000e3616 0003dcee
        001033c0 00000000 00000000 0000011e 000e8f74 000e3616 000b25e8 0008dd1c
        000e51f8 001033c0 00000000 000e7a28 00000005 00000000 00002000 00000002
        00000030 00089e20 00101090 000b25e8 00002704 000d8ff8 00000800 00000120
Call Trace: [<0003c818>] bad_page+0xa4/0x146
 [<0003c774>] bad_page+0x0/0x146
 [<0003c9ac>] free_pages_prepare+0xf2/0xfa
 [<000e3616>] __free_pages_bootmem+0x0/0x9a
 [<0003dcee>] free_hot_cold_page+0x12/0xec
 [<000e3616>] __free_pages_bootmem+0x0/0x9a
 [<000b25e8>] printk+0x0/0x24
 [<0008dd1c>] __mulsi3+0x0/0x24
 [<000e51f8>] free_all_bootmem+0x126/0x1ca
 [<00002000>] show_registers+0x1b0/0x416
 [<00089e20>] strcpy+0x0/0x12
 [<000b25e8>] printk+0x0/0x24
 [<00002704>] inthandler1+0x26/0x28
 [<00000800>] calibrate_delay+0x88/0x22c
 [<000e1042>] mem_init+0x6/0x14
 [<000e04d8>] start_kernel+0x184/0x2c6
 [<00089e20>] strcpy+0x0/0x12
 [<000b25e8>] printk+0x0/0x24
 [<00000480>] _exit+0x0/0x4

BUG: Bad page state in process swapper  pfn:0011f
page:001033e0 count:0 mapcount:1 mapping:  (null) index:0x0
page flags: 0x0()
page dumped because: nonzero mapcount
CPU: 0 PID: 0 Comm: swapper Tainted: G    B   W    3.14.0-rc8+ #32
Stack from 000d8f14:
        000d8f14 000d56b8 0003c818 001033e0 000d291b 00000000 000d28eb 000d94f2
        0000011f 00000000 00000000 001033e0 0003c774 0003c9ac 001033e0 000d291b
        00000000 00000000 0000011f 00000010 000ff000 001033e0 000e3616 0003dcee
        001033e0 00000000 00000000 0000011f 000e8f74 000e3616 000b25e8 0008dd1c
        000e51f8 001033e0 00000000 000e7a28 00000005 00000000 00002000 00000002
        00000030 00089e20 00101090 000b25e8 00002704 000d8ff8 00000800 00000120
Call Trace: [<0003c818>] bad_page+0xa4/0x146
 [<0003c774>] bad_page+0x0/0x146
 [<0003c9ac>] free_pages_prepare+0xf2/0xfa
 [<000e3616>] __free_pages_bootmem+0x0/0x9a
 [<0003dcee>] free_hot_cold_page+0x12/0xec
 [<000e3616>] __free_pages_bootmem+0x0/0x9a
 [<000b25e8>] printk+0x0/0x24
 [<0008dd1c>] __mulsi3+0x0/0x24
 [<000e51f8>] free_all_bootmem+0x126/0x1ca
 [<00002000>] show_registers+0x1b0/0x416
 [<00089e20>] strcpy+0x0/0x12
 [<000b25e8>] printk+0x0/0x24
 [<00002704>] inthandler1+0x26/0x28
 [<00000800>] calibrate_delay+0x88/0x22c
 [<000e1042>] mem_init+0x6/0x14
 [<000e04d8>] start_kernel+0x184/0x2c6
 [<00089e20>] strcpy+0x0/0x12
 [<000b25e8>] printk+0x0/0x24
 [<00000480>] _exit+0x0/0x4

BUG: Bad page state in process swapper  pfn:00120
page:00103400 count:0 mapcount:1 mapping:  (null) index:0x0
page flags: 0x0()
page dumped because: nonzero mapcount
CPU: 0 PID: 0 Comm: swapper Tainted: G    B   W    3.14.0-rc8+ #32
Stack from 000d8f24:
        000d8f24 000d56b8 0003c818 00103400 000d291b 00000000 000d28eb 000d94f2
        00000120 00000000 00000000 00103400 0003c774 0003c9ac 00103400 000d291b
        00000000 00000005 00103400 00000011 000ff000 000e8f74 000e3616 0003de34
        00103400 00000005 00000000 00103400 000e51c2 00103400 00000005 000e7a28
        00000005 00000000 00002000 00000002 00000030 00089e20 00101090 000b25e8
        00002704 000d8ff8 00000800 00000120 000e7a28 000e1042 000e04d8 00000000
Call Trace: [<0003c818>] bad_page+0xa4/0x146
 [<0003c774>] bad_page+0x0/0x146
 [<0003c9ac>] free_pages_prepare+0xf2/0xfa
 [<000e3616>] __free_pages_bootmem+0x0/0x9a
 [<0003de34>] __free_pages.part.96+0x16/0x3e
 [<000e51c2>] free_all_bootmem+0xf0/0x1ca
 [<00002000>] show_registers+0x1b0/0x416
 [<00089e20>] strcpy+0x0/0x12
 [<000b25e8>] printk+0x0/0x24
 [<00002704>] inthandler1+0x26/0x28
 [<00000800>] calibrate_delay+0x88/0x22c
 [<000e1042>] mem_init+0x6/0x14
 [<000e04d8>] start_kernel+0x184/0x2c6
 [<00089e20>] strcpy+0x0/0x12
 [<000b25e8>] printk+0x0/0x24
 [<00000480>] _exit+0x0/0x4

BUG: Bad page state in process swapper  pfn:00121
page:00103420 count:0 mapcount:1 mapping:  (null) index:0x0
page flags: 0x0()
page dumped because: nonzero mapcount
CPU: 0 PID: 0 Comm: swapper Tainted: G    B   W    3.14.0-rc8+ #32
Stack from 000d8f24:
        000d8f24 000d56b8 0003c818 00103420 000d291b 00000000 000d28eb 000d94f2
        00000121 00000001 00000001 00103420 0003c774 0003c9ac 00103420 000d291b
        00000000 00000005 00103400 00000011 000ff000 000e8f74 000e3616 0003de34
        00103400 00000005 00000000 00103400 000e51c2 00103400 00000005 000e7a28
        00000005 00000000 00002000 00000002 00000030 00089e20 00101090 000b25e8
        00002704 000d8ff8 00000800 00000120 000e7a28 000e1042 000e04d8 00000000
Call Trace: [<0003c818>] bad_page+0xa4/0x146
 [<0003c774>] bad_page+0x0/0x146
 [<0003c9ac>] free_pages_prepare+0xf2/0xfa
 [<000e3616>] __free_pages_bootmem+0x0/0x9a
 [<0003de34>] __free_pages.part.96+0x16/0x3e
 [<000e51c2>] free_all_bootmem+0xf0/0x1ca
 [<00002000>] show_registers+0x1b0/0x416
 [<00089e20>] strcpy+0x0/0x12
 [<000b25e8>] printk+0x0/0x24
 [<00002704>] inthandler1+0x26/0x28
 [<00000800>] calibrate_delay+0x88/0x22c
 [<000e1042>] mem_init+0x6/0x14
 [<000e04d8>] start_kernel+0x184/0x2c6
 [<00089e20>] strcpy+0x0/0x12
 [<000b25e8>] printk+0x0/0x24
 [<00000480>] _exit+0x0/0x4

BUG: Bad page state in process swapper  pfn:00122
page:00103440 count:0 mapcount:1 mapping:  (null) index:0x0
page flags: 0x0()
page dumped because: nonzero mapcount
CPU: 0 PID: 0 Comm: swapper Tainted: G    B   W    3.14.0-rc8+ #32
Stack from 000d8f24:
        000d8f24 000d56b8 0003c818 00103440 000d291b 00000000 000d28eb 000d94f2
        00000122 00000002 00000002 00103440 0003c774 0003c9ac 00103440 000d291b
        00000000 00000005 00103400 00000011 000ff000 000e8f74 000e3616 0003de34
        00103400 00000005 00000000 00103400 000e51c2 00103400 00000005 000e7a28
        00000005 00000000 00002000 00000002 00000030 00089e20 00101090 000b25e8
        00002704 000d8ff8 00000800 00000120 000e7a28 000e1042 000e04d8 00000000
Call Trace: [<0003c818>] bad_page+0xa4/0x146
 [<0003c774>] bad_page+0x0/0x146
 [<0003c9ac>] free_pages_prepare+0xf2/0xfa
 [<000e3616>] __free_pages_bootmem+0x0/0x9a
 [<0003de34>] __free_pages.part.96+0x16/0x3e
 [<000e51c2>] free_all_bootmem+0xf0/0x1ca
 [<00002000>] show_registers+0x1b0/0x416
 [<00089e20>] strcpy+0x0/0x12
 [<000b25e8>] printk+0x0/0x24
 [<00002704>] inthandler1+0x26/0x28
 [<00000800>] calibrate_delay+0x88/0x22c
 [<000e1042>] mem_init+0x6/0x14
 [<000e04d8>] start_kernel+0x184/0x2c6
 [<00089e20>] strcpy+0x0/0x12
 [<000b25e8>] printk+0x0/0x24
 [<00000480>] _exit+0x0/0x4

BUG: Bad page state in process swapper  pfn:00123
page:00103460 count:0 mapcount:1 mapping:  (null) index:0x0
page flags: 0x0()
page dumped because: nonzero mapcount
CPU: 0 PID: 0 Comm: swapper Tainted: G    B   W    3.14.0-rc8+ #32
Stack from 000d8f24:
        000d8f24 000d56b8 0003c818 00103460 000d291b 00000000 000d28eb 000d94f2
        00000123 00000003 00000003 00103460 0003c774 0003c9ac 00103460 000d291b
        00000000 00000005 00103400 00000011 000ff000 000e8f74 000e3616 0003de34
        00103400 00000005 00000000 00103400 000e51c2 00103400 00000005 000e7a28
        00000005 00000000 00002000 00000002 00000030 00089e20 00101090 000b25e8
        00002704 000d8ff8 00000800 00000120 000e7a28 000e1042 000e04d8 00000000
Call Trace: [<0003c818>] bad_page+0xa4/0x146
 [<0003c774>] bad_page+0x0/0x146
 [<0003c9ac>] free_pages_prepare+0xf2/0xfa
 [<000e3616>] __free_pages_bootmem+0x0/0x9a
 [<0003de34>] __free_pages.part.96+0x16/0x3e
 [<000e51c2>] free_all_bootmem+0xf0/0x1ca
 [<00002000>] show_registers+0x1b0/0x416
 [<00089e20>] strcpy+0x0/0x12
 [<000b25e8>] printk+0x0/0x24
 [<00002704>] inthandler1+0x26/0x28
 [<00000800>] calibrate_delay+0x88/0x22c
 [<000e1042>] mem_init+0x6/0x14
 [<000e04d8>] start_kernel+0x184/0x2c6
 [<00089e20>] strcpy+0x0/0x12
 [<000b25e8>] printk+0x0/0x24
 [<00000480>] _exit+0x0/0x4

BUG: Bad page state in process swapper  pfn:00124
page:00103480 count:0 mapcount:1 mapping:  (null) index:0x0
page flags: 0x0()
page dumped because: nonzero mapcount
CPU: 0 PID: 0 Comm: swapper Tainted: G    B   W    3.14.0-rc8+ #32
Stack from 000d8f24:
        000d8f24 000d56b8 0003c818 00103480 000d291b 00000000 000d28eb 000d94f2
        00000124 00000004 00000004 00103480 0003c774 0003c9ac 00103480 000d291b
        00000000 00000005 00103400 00000011 000ff000 000e8f74 000e3616 0003de34
        00103400 00000005 00000000 00103400 000e51c2 00103400 00000005 000e7a28
        00000005 00000000 00002000 00000002 00000030 00089e20 00101090 000b25e8
        00002704 000d8ff8 00000800 00000120 000e7a28 000e1042 000e04d8 00000000
Call Trace: [<0003c818>] bad_page+0xa4/0x146
 [<0003c774>] bad_page+0x0/0x146
 [<0003c9ac>] free_pages_prepare+0xf2/0xfa
 [<000e3616>] __free_pages_bootmem+0x0/0x9a
 [<0003de34>] __free_pages.part.96+0x16/0x3e
 [<000e51c2>] free_all_bootmem+0xf0/0x1ca
 [<00002000>] show_registers+0x1b0/0x416
 [<00089e20>] strcpy+0x0/0x12
 [<000b25e8>] printk+0x0/0x24
 [<00002704>] inthandler1+0x26/0x28
 [<00000800>] calibrate_delay+0x88/0x22c
 [<000e1042>] mem_init+0x6/0x14
 [<000e04d8>] start_kernel+0x184/0x2c6
 [<00089e20>] strcpy+0x0/0x12
 [<000b25e8>] printk+0x0/0x24
 [<00000480>] _exit+0x0/0x4

BUG: Bad page state in process swapper  pfn:00125
page:001034a0 count:0 mapcount:1 mapping:  (null) index:0x0
page flags: 0x0()
page dumped because: nonzero mapcount
CPU: 0 PID: 0 Comm: swapper Tainted: G    B   W    3.14.0-rc8+ #32
Stack from 000d8f24:
        000d8f24 000d56b8 0003c818 001034a0 000d291b 00000000 000d28eb 000d94f2
        00000125 00000005 00000005 001034a0 0003c774 0003c9ac 001034a0 000d291b
        00000000 00000005 00103400 00000011 000ff000 000e8f74 000e3616 0003de34
        00103400 00000005 00000000 00103400 000e51c2 00103400 00000005 000e7a28
        00000005 00000000 00002000 00000002 00000030 00089e20 00101090 000b25e8
        00002704 000d8ff8 00000800 00000120 000e7a28 000e1042 000e04d8 00000000
Call Trace: [<0003c818>] bad_page+0xa4/0x146
 [<0003c774>] bad_page+0x0/0x146
 [<0003c9ac>] free_pages_prepare+0xf2/0xfa
 [<000e3616>] __free_pages_bootmem+0x0/0x9a
 [<0003de34>] __free_pages.part.96+0x16/0x3e
 [<000e51c2>] free_all_bootmem+0xf0/0x1ca
 [<00002000>] show_registers+0x1b0/0x416
 [<00089e20>] strcpy+0x0/0x12
 [<000b25e8>] printk+0x0/0x24
 [<00002704>] inthandler1+0x26/0x28
 [<00000800>] calibrate_delay+0x88/0x22c
 [<000e1042>] mem_init+0x6/0x14
 [<000e04d8>] start_kernel+0x184/0x2c6
 [<00089e20>] strcpy+0x0/0x12
 [<000b25e8>] printk+0x0/0x24
 [<00000480>] _exit+0x0/0x4

BUG: Bad page state in process swapper  pfn:00126
page:001034c0 count:0 mapcount:1 mapping:  (null) index:0x0
page flags: 0x0()
page dumped because: nonzero mapcount
CPU: 0 PID: 0 Comm: swapper Tainted: G    B   W    3.14.0-rc8+ #32
Stack from 000d8f24:
        000d8f24 000d56b8 0003c818 001034c0 000d291b 00000000 000d28eb 000d94f2
        00000126 00000006 00000006 001034c0 0003c774 0003c9ac 001034c0 000d291b
        00000000 00000005 00103400 00000011 000ff000 000e8f74 000e3616 0003de34
        00103400 00000005 00000000 00103400 000e51c2 00103400 00000005 000e7a28
        00000005 00000000 00002000 00000002 00000030 00089e20 00101090 000b25e8
        00002704 000d8ff8 00000800 00000120 000e7a28 000e1042 000e04d8 00000000
Call Trace: [<0003c818>] bad_page+0xa4/0x146
 [<0003c774>] bad_page+0x0/0x146
 [<0003c9ac>] free_pages_prepare+0xf2/0xfa
 [<000e3616>] __free_pages_bootmem+0x0/0x9a
 [<0003de34>] __free_pages.part.96+0x16/0x3e
 [<000e51c2>] free_all_bootmem+0xf0/0x1ca
 [<00002000>] show_registers+0x1b0/0x416
 [<00089e20>] strcpy+0x0/0x12
 [<000b25e8>] printk+0x0/0x24
 [<00002704>] inthandler1+0x26/0x28
 [<00000800>] calibrate_delay+0x88/0x22c
 [<000e1042>] mem_init+0x6/0x14
 [<000e04d8>] start_kernel+0x184/0x2c6
 [<00089e20>] strcpy+0x0/0x12
 [<000b25e8>] printk+0x0/0x24
 [<00000480>] _exit+0x0/0x4

BUG: Bad page state in process swapper  pfn:00127
page:001034e0 count:0 mapcount:1 mapping:  (null) index:0x0
page flags: 0x0()
page dumped because: nonzero mapcount
CPU: 0 PID: 0 Comm: swapper Tainted: G    B   W    3.14.0-rc8+ #32
Stack from 000d8f24:
        000d8f24 000d56b8 0003c818 001034e0 000d291b 00000000 000d28eb 000d94f2
        00000127 00000007 00000007 001034e0 0003c774 0003c9ac 001034e0 000d291b
        00000000 00000005 00103400 00000011 000ff000 000e8f74 000e3616 0003de34
        00103400 00000005 00000000 00103400 000e51c2 00103400 00000005 000e7a28
        00000005 00000000 00002000 00000002 00000030 00089e20 00101090 000b25e8
        00002704 000d8ff8 00000800 00000120 000e7a28 000e1042 000e04d8 00000000
Call Trace: [<0003c818>] bad_page+0xa4/0x146
 [<0003c774>] bad_page+0x0/0x146
 [<0003c9ac>] free_pages_prepare+0xf2/0xfa
 [<000e3616>] __free_pages_bootmem+0x0/0x9a
 [<0003de34>] __free_pages.part.96+0x16/0x3e
 [<000e51c2>] free_all_bootmem+0xf0/0x1ca
 [<00002000>] show_registers+0x1b0/0x416
 [<00089e20>] strcpy+0x0/0x12
 [<000b25e8>] printk+0x0/0x24
 [<00002704>] inthandler1+0x26/0x28
 [<00000800>] calibrate_delay+0x88/0x22c
 [<000e1042>] mem_init+0x6/0x14
 [<000e04d8>] start_kernel+0x184/0x2c6
 [<00089e20>] strcpy+0x0/0x12
 [<000b25e8>] printk+0x0/0x24
 [<00000480>] _exit+0x0/0x4

BUG: Bad page state in process swapper  pfn:00128
page:00103500 count:0 mapcount:1 mapping:  (null) index:0x0
page flags: 0x0()
page dumped because: nonzero mapcount
CPU: 0 PID: 0 Comm: swapper Tainted: G    B   W    3.14.0-rc8+ #32
Stack from 000d8f24:
        000d8f24 000d56b8 0003c818 00103500 000d291b 00000000 000d28eb 000d94f2
        00000128 00000008 00000008 00103500 0003c774 0003c9ac 00103500 000d291b
        00000000 00000005 00103400 00000011 000ff000 000e8f74 000e3616 0003de34
        00103400 00000005 00000000 00103400 000e51c2 00103400 00000005 000e7a28
        00000005 00000000 00002000 00000002 00000030 00089e20 00101090 000b25e8
        00002704 000d8ff8 00000800 00000120 000e7a28 000e1042 000e04d8 00000000
Call Trace: [<0003c818>] bad_page+0xa4/0x146
 [<0003c774>] bad_page+0x0/0x146
 [<0003c9ac>] free_pages_prepare+0xf2/0xfa
 [<000e3616>] __free_pages_bootmem+0x0/0x9a
 [<0003de34>] __free_pages.part.96+0x16/0x3e
 [<000e51c2>] free_all_bootmem+0xf0/0x1ca
 [<00002000>] show_registers+0x1b0/0x416
 [<00089e20>] strcpy+0x0/0x12
 [<000b25e8>] printk+0x0/0x24
 [<00002704>] inthandler1+0x26/0x28
 [<00000800>] calibrate_delay+0x88/0x22c
 [<000e1042>] mem_init+0x6/0x14
 [<000e04d8>] start_kernel+0x184/0x2c6
 [<00089e20>] strcpy+0x0/0x12
 [<000b25e8>] printk+0x0/0x24
 [<00000480>] _exit+0x0/0x4

BUG: Bad page state in process swapper  pfn:00129
page:00103520 count:0 mapcount:1 mapping:  (null) index:0x0
page flags: 0x0()
page dumped because: nonzero mapcount
CPU: 0 PID: 0 Comm: swapper Tainted: G    B   W    3.14.0-rc8+ #32
Stack from 000d8f24:
        000d8f24 000d56b8 0003c818 00103520 000d291b 00000000 000d28eb 000d94f2
        00000129 00000009 00000009 00103520 0003c774 0003c9ac 00103520 000d291b
        00000000 00000005 00103400 00000011 000ff000 000e8f74 000e3616 0003de34
        00103400 00000005 00000000 00103400 000e51c2 00103400 00000005 000e7a28
        00000005 00000000 00002000 00000002 00000030 00089e20 00101090 000b25e8
        00002704 000d8ff8 00000800 00000120 000e7a28 000e1042 000e04d8 00000000
Call Trace: [<0003c818>] bad_page+0xa4/0x146
 [<0003c774>] bad_page+0x0/0x146
 [<0003c9ac>] free_pages_prepare+0xf2/0xfa
 [<000e3616>] __free_pages_bootmem+0x0/0x9a
 [<0003de34>] __free_pages.part.96+0x16/0x3e
 [<000e51c2>] free_all_bootmem+0xf0/0x1ca
 [<00002000>] show_registers+0x1b0/0x416
 [<00089e20>] strcpy+0x0/0x12
 [<000b25e8>] printk+0x0/0x24
 [<00002704>] inthandler1+0x26/0x28
 [<00000800>] calibrate_delay+0x88/0x22c
 [<000e1042>] mem_init+0x6/0x14
 [<000e04d8>] start_kernel+0x184/0x2c6
 [<00089e20>] strcpy+0x0/0x12
 [<000b25e8>] printk+0x0/0x24
 [<00000480>] _exit+0x0/0x4

BUG: Bad page state in process swapper  pfn:0012a
page:00103540 count:0 mapcount:1 mapping:  (null) index:0x0
page flags: 0x0()
page dumped because: nonzero mapcount
CPU: 0 PID: 0 Comm: swapper Tainted: G    B   W    3.14.0-rc8+ #32
Stack from 000d8f24:
        000d8f24 000d56b8 0003c818 00103540 000d291b 00000000 000d28eb 000d94f2
        0000012a 0000000a 0000000a 00103540 0003c774 0003c9ac 00103540 000d291b
        00000000 00000005 00103400 00000011 000ff000 000e8f74 000e3616 0003de34
        00103400 00000005 00000000 00103400 000e51c2 00103400 00000005 000e7a28
        00000005 00000000 00002000 00000002 00000030 00089e20 00101090 000b25e8
        00002704 000d8ff8 00000800 00000120 000e7a28 000e1042 000e04d8 00000000
Call Trace: [<0003c818>] bad_page+0xa4/0x146
 [<0003c774>] bad_page+0x0/0x146
 [<0003c9ac>] free_pages_prepare+0xf2/0xfa
 [<000e3616>] __free_pages_bootmem+0x0/0x9a
 [<0003de34>] __free_pages.part.96+0x16/0x3e
 [<000e51c2>] free_all_bootmem+0xf0/0x1ca
 [<00002000>] show_registers+0x1b0/0x416
 [<00089e20>] strcpy+0x0/0x12
 [<000b25e8>] printk+0x0/0x24
 [<00002704>] inthandler1+0x26/0x28
 [<00000800>] calibrate_delay+0x88/0x22c
 [<000e1042>] mem_init+0x6/0x14
 [<000e04d8>] start_kernel+0x184/0x2c6
 [<00089e20>] strcpy+0x0/0x12
 [<000b25e8>] printk+0x0/0x24
 [<00000480>] _exit+0x0/0x4

BUG: Bad page state in process swapper  pfn:0012b
page:00103560 count:0 mapcount:1 mapping:  (null) index:0x0
page flags: 0x0()
page dumped because: nonzero mapcount
CPU: 0 PID: 0 Comm: swapper Tainted: G    B   W    3.14.0-rc8+ #32
Stack from 000d8f24:
        000d8f24 000d56b8 0003c818 00103560 000d291b 00000000 000d28eb 000d94f2
        0000012b 0000000b 0000000b 00103560 0003c774 0003c9ac 00103560 000d291b
        00000000 00000005 00103400 00000011 000ff000 000e8f74 000e3616 0003de34
        00103400 00000005 00000000 00103400 000e51c2 00103400 00000005 000e7a28
        00000005 00000000 00002000 00000002 00000030 00089e20 00101090 000b25e8
        00002704 000d8ff8 00000800 00000120 000e7a28 000e1042 000e04d8 00000000
Call Trace: [<0003c818>] bad_page+0xa4/0x146
 [<0003c774>] bad_page+0x0/0x146
 [<0003c9ac>] free_pages_prepare+0xf2/0xfa
 [<000e3616>] __free_pages_bootmem+0x0/0x9a
 [<0003de34>] __free_pages.part.96+0x16/0x3e
 [<000e51c2>] free_all_bootmem+0xf0/0x1ca
 [<00002000>] show_registers+0x1b0/0x416
 [<00089e20>] strcpy+0x0/0x12
 [<000b25e8>] printk+0x0/0x24
 [<00002704>] inthandler1+0x26/0x28
 [<00000800>] calibrate_delay+0x88/0x22c
 [<000e1042>] mem_init+0x6/0x14
 [<000e04d8>] start_kernel+0x184/0x2c6
 [<00089e20>] strcpy+0x0/0x12
 [<000b25e8>] printk+0x0/0x24
 [<00000480>] _exit+0x0/0x4

BUG: Bad page state in process swapper  pfn:0012c
page:00103580 count:0 mapcount:1 mapping:  (null) index:0x0
page flags: 0x0()
page dumped because: nonzero mapcount
CPU: 0 PID: 0 Comm: swapper Tainted: G    B   W    3.14.0-rc8+ #32
Stack from 000d8f24:
        000d8f24 000d56b8 0003c818 00103580 000d291b 00000000 000d28eb 000d94f2
        0000012c 0000000c 0000000c 00103580 0003c774 0003c9ac 00103580 000d291b
        00000000 00000005 00103400 00000011 000ff000 000e8f74 000e3616 0003de34
        00103400 00000005 00000000 00103400 000e51c2 00103400 00000005 000e7a28
        00000005 00000000 00002000 00000002 00000030 00089e20 00101090 000b25e8
        00002704 000d8ff8 00000800 00000120 000e7a28 000e1042 000e04d8 00000000
Call Trace: [<0003c818>] bad_page+0xa4/0x146
 [<0003c774>] bad_page+0x0/0x146
 [<0003c9ac>] free_pages_prepare+0xf2/0xfa
 [<000e3616>] __free_pages_bootmem+0x0/0x9a
 [<0003de34>] __free_pages.part.96+0x16/0x3e
 [<000e51c2>] free_all_bootmem+0xf0/0x1ca
 [<00002000>] show_registers+0x1b0/0x416
 [<00089e20>] strcpy+0x0/0x12
 [<000b25e8>] printk+0x0/0x24
 [<00002704>] inthandler1+0x26/0x28
 [<00000800>] calibrate_delay+0x88/0x22c
 [<000e1042>] mem_init+0x6/0x14
 [<000e04d8>] start_kernel+0x184/0x2c6
 [<00089e20>] strcpy+0x0/0x12
 [<000b25e8>] printk+0x0/0x24
 [<00000480>] _exit+0x0/0x4

BUG: Bad page state in process swapper  pfn:0012d
page:001035a0 count:0 mapcount:1 mapping:  (null) index:0x0
page flags: 0x0()
page dumped because: nonzero mapcount
CPU: 0 PID: 0 Comm: swapper Tainted: G    B   W    3.14.0-rc8+ #32
Stack from 000d8f24:
        000d8f24 000d56b8 0003c818 001035a0 000d291b 00000000 000d28eb 000d94f2
        0000012d 0000000d 0000000d 001035a0 0003c774 0003c9ac 001035a0 000d291b
        00000000 00000005 00103400 00000011 000ff000 000e8f74 000e3616 0003de34
        00103400 00000005 00000000 00103400 000e51c2 00103400 00000005 000e7a28
        00000005 00000000 00002000 00000002 00000030 00089e20 00101090 000b25e8
        00002704 000d8ff8 00000800 00000120 000e7a28 000e1042 000e04d8 00000000
Call Trace: [<0003c818>] bad_page+0xa4/0x146
 [<0003c774>] bad_page+0x0/0x146
 [<0003c9ac>] free_pages_prepare+0xf2/0xfa
 [<000e3616>] __free_pages_bootmem+0x0/0x9a
 [<0003de34>] __free_pages.part.96+0x16/0x3e
 [<000e51c2>] free_all_bootmem+0xf0/0x1ca
 [<00002000>] show_registers+0x1b0/0x416
 [<00089e20>] strcpy+0x0/0x12
 [<000b25e8>] printk+0x0/0x24
 [<00002704>] inthandler1+0x26/0x28
 [<00000800>] calibrate_delay+0x88/0x22c
 [<000e1042>] mem_init+0x6/0x14
 [<000e04d8>] start_kernel+0x184/0x2c6
 [<00089e20>] strcpy+0x0/0x12
 [<000b25e8>] printk+0x0/0x24
 [<00000480>] _exit+0x0/0x4

BUG: Bad page state in process swapper  pfn:0012e
page:001035c0 count:0 mapcount:1 mapping:  (null) index:0x0
page flags: 0x0()
page dumped because: nonzero mapcount
CPU: 0 PID: 0 Comm: swapper Tainted: G    B   W    3.14.0-rc8+ #32
Stack from 000d8f24:
        000d8f24 000d56b8 0003c818 001035c0 000d291b 00000000 000d28eb 000d94f2
        0000012e 0000000e 0000000e 001035c0 0003c774 0003c9ac 001035c0 000d291b
        00000000 00000005 00103400 00000011 000ff000 000e8f74 000e3616 0003de34
        00103400 00000005 00000000 00103400 000e51c2 00103400 00000005 000e7a28
        00000005 00000000 00002000 00000002 00000030 00089e20 00101090 000b25e8
        00002704 000d8ff8 00000800 00000120 000e7a28 000e1042 000e04d8 00000000
Call Trace: [<0003c818>] bad_page+0xa4/0x146
 [<0003c774>] bad_page+0x0/0x146
 [<0003c9ac>] free_pages_prepare+0xf2/0xfa
 [<000e3616>] __free_pages_bootmem+0x0/0x9a
 [<0003de34>] __free_pages.part.96+0x16/0x3e
 [<000e51c2>] free_all_bootmem+0xf0/0x1ca
 [<00002000>] show_registers+0x1b0/0x416
 [<00089e20>] strcpy+0x0/0x12
 [<000b25e8>] printk+0x0/0x24
 [<00002704>] inthandler1+0x26/0x28
 [<00000800>] calibrate_delay+0x88/0x22c
 [<000e1042>] mem_init+0x6/0x14
 [<000e04d8>] start_kernel+0x184/0x2c6
 [<00089e20>] strcpy+0x0/0x12
 [<000b25e8>] printk+0x0/0x24
 [<00000480>] _exit+0x0/0x4

BUG: Bad page state in process swapper  pfn:0012f
page:001035e0 count:0 mapcount:1 mapping:  (null) index:0x0
page flags: 0x0()
page dumped because: nonzero mapcount
CPU: 0 PID: 0 Comm: swapper Tainted: G    B   W    3.14.0-rc8+ #32
Stack from 000d8f24:
        000d8f24 000d56b8 0003c818 001035e0 000d291b 00000000 000d28eb 000d94f2
        0000012f 0000000f 0000000f 001035e0 0003c774 0003c9ac 001035e0 000d291b
        00000000 00000005 00103400 00000011 000ff000 000e8f74 000e3616 0003de34
        00103400 00000005 00000000 00103400 000e51c2 00103400 00000005 000e7a28
        00000005 00000000 00002000 00000002 00000030 00089e20 00101090 000b25e8
        00002704 000d8ff8 00000800 00000120 000e7a28 000e1042 000e04d8 00000000
Call Trace: [<0003c818>] bad_page+0xa4/0x146
 [<0003c774>] bad_page+0x0/0x146
 [<0003c9ac>] free_pages_prepare+0xf2/0xfa
 [<000e3616>] __free_pages_bootmem+0x0/0x9a
 [<0003de34>] __free_pages.part.96+0x16/0x3e
 [<000e51c2>] free_all_bootmem+0xf0/0x1ca
 [<00002000>] show_registers+0x1b0/0x416
 [<00089e20>] strcpy+0x0/0x12
 [<000b25e8>] printk+0x0/0x24
 [<00002704>] inthandler1+0x26/0x28
 [<00000800>] calibrate_delay+0x88/0x22c
 [<000e1042>] mem_init+0x6/0x14
 [<000e04d8>] start_kernel+0x184/0x2c6
 [<00089e20>] strcpy+0x0/0x12
 [<000b25e8>] printk+0x0/0x24
 [<00000480>] _exit+0x0/0x4

BUG: Bad page state in process swapper  pfn:00130
page:00103600 count:0 mapcount:1 mapping:  (null) index:0x0
page flags: 0x0()
page dumped because: nonzero mapcount
CPU: 0 PID: 0 Comm: swapper Tainted: G    B   W    3.14.0-rc8+ #32
Stack from 000d8f24:
        000d8f24 000d56b8 0003c818 00103600 000d291b 00000000 000d28eb 000d94f2
        00000130 00000010 00000010 00103600 0003c774 0003c9ac 00103600 000d291b
        00000000 00000005 00103400 00000011 000ff000 000e8f74 000e3616 0003de34
        00103400 00000005 00000000 00103400 000e51c2 00103400 00000005 000e7a28
        00000005 00000000 00002000 00000002 00000030 00089e20 00101090 000b25e8
        00002704 000d8ff8 00000800 00000120 000e7a28 000e1042 000e04d8 00000000
Call Trace: [<0003c818>] bad_page+0xa4/0x146
 [<0003c774>] bad_page+0x0/0x146
 [<0003c9ac>] free_pages_prepare+0xf2/0xfa
 [<000e3616>] __free_pages_bootmem+0x0/0x9a
 [<0003de34>] __free_pages.part.96+0x16/0x3e
 [<000e51c2>] free_all_bootmem+0xf0/0x1ca
 [<00002000>] show_registers+0x1b0/0x416
 [<00089e20>] strcpy+0x0/0x12
 [<000b25e8>] printk+0x0/0x24
 [<00002704>] inthandler1+0x26/0x28
 [<00000800>] calibrate_delay+0x88/0x22c
 [<000e1042>] mem_init+0x6/0x14
 [<000e04d8>] start_kernel+0x184/0x2c6
 [<00089e20>] strcpy+0x0/0x12
 [<000b25e8>] printk+0x0/0x24
 [<00000480>] _exit+0x0/0x4

BUG: Bad page state in process swapper  pfn:00131
page:00103620 count:0 mapcount:1 mapping:  (null) index:0x0
page flags: 0x0()
page dumped because: nonzero mapcount
CPU: 0 PID: 0 Comm: swapper Tainted: G    B   W    3.14.0-rc8+ #32
Stack from 000d8f24:
        000d8f24 000d56b8 0003c818 00103620 000d291b 00000000 000d28eb 000d94f2
        00000131 00000011 00000011 00103620 0003c774 0003c9ac 00103620 000d291b
        00000000 00000005 00103400 00000011 000ff000 000e8f74 000e3616 0003de34
        00103400 00000005 00000000 00103400 000e51c2 00103400 00000005 000e7a28
        00000005 00000000 00002000 00000002 00000030 00089e20 00101090 000b25e8
        00002704 000d8ff8 00000800 00000120 000e7a28 000e1042 000e04d8 00000000
Call Trace: [<0003c818>] bad_page+0xa4/0x146
 [<0003c774>] bad_page+0x0/0x146
 [<0003c9ac>] free_pages_prepare+0xf2/0xfa
 [<000e3616>] __free_pages_bootmem+0x0/0x9a
 [<0003de34>] __free_pages.part.96+0x16/0x3e
 [<000e51c2>] free_all_bootmem+0xf0/0x1ca
 [<00002000>] show_registers+0x1b0/0x416
 [<00089e20>] strcpy+0x0/0x12
 [<000b25e8>] printk+0x0/0x24
 [<00002704>] inthandler1+0x26/0x28
 [<00000800>] calibrate_delay+0x88/0x22c
 [<000e1042>] mem_init+0x6/0x14
 [<000e04d8>] start_kernel+0x184/0x2c6
 [<00089e20>] strcpy+0x0/0x12
 [<000b25e8>] printk+0x0/0x24
 [<00000480>] _exit+0x0/0x4

BUG: Bad page state in process swapper  pfn:00132
page:00103640 count:0 mapcount:1 mapping:  (null) index:0x0
page flags: 0x0()
page dumped because: nonzero mapcount
CPU: 0 PID: 0 Comm: swapper Tainted: G    B   W    3.14.0-rc8+ #32
Stack from 000d8f24:
        000d8f24 000d56b8 0003c818 00103640 000d291b 00000000 000d28eb 000d94f2
        00000132 00000012 00000012 00103640 0003c774 0003c9ac 00103640 000d291b
        00000000 00000005 00103400 00000011 000ff000 000e8f74 000e3616 0003de34
        00103400 00000005 00000000 00103400 000e51c2 00103400 00000005 000e7a28
        00000005 00000000 00002000 00000002 00000030 00089e20 00101090 000b25e8
        00002704 000d8ff8 00000800 00000120 000e7a28 000e1042 000e04d8 00000000
Call Trace: [<0003c818>] bad_page+0xa4/0x146
 [<0003c774>] bad_page+0x0/0x146
 [<0003c9ac>] free_pages_prepare+0xf2/0xfa
 [<000e3616>] __free_pages_bootmem+0x0/0x9a
 [<0003de34>] __free_pages.part.96+0x16/0x3e
 [<000e51c2>] free_all_bootmem+0xf0/0x1ca
 [<00002000>] show_registers+0x1b0/0x416
 [<00089e20>] strcpy+0x0/0x12
 [<000b25e8>] printk+0x0/0x24
 [<00002704>] inthandler1+0x26/0x28
 [<00000800>] calibrate_delay+0x88/0x22c
 [<000e1042>] mem_init+0x6/0x14
 [<000e04d8>] start_kernel+0x184/0x2c6
 [<00089e20>] strcpy+0x0/0x12
 [<000b25e8>] printk+0x0/0x24
 [<00000480>] _exit+0x0/0x4

BUG: Bad page state in process swapper  pfn:00133
page:00103660 count:0 mapcount:1 mapping:  (null) index:0x0
page flags: 0x0()
page dumped because: nonzero mapcount
CPU: 0 PID: 0 Comm: swapper Tainted: G    B   W    3.14.0-rc8+ #32
Stack from 000d8f24:
        000d8f24 000d56b8 0003c818 00103660 000d291b 00000000 000d28eb 000d94f2
        00000133 00000013 00000013 00103660 0003c774 0003c9ac 00103660 000d291b
        00000000 00000005 00103400 00000011 000ff000 000e8f74 000e3616 0003de34
        00103400 00000005 00000000 00103400 000e51c2 00103400 00000005 000e7a28
        00000005 00000000 00002000 00000002 00000030 00089e20 00101090 000b25e8
        00002704 000d8ff8 00000800 00000120 000e7a28 000e1042 000e04d8 00000000
Call Trace: [<0003c818>] bad_page+0xa4/0x146
 [<0003c774>] bad_page+0x0/0x146
 [<0003c9ac>] free_pages_prepare+0xf2/0xfa
 [<000e3616>] __free_pages_bootmem+0x0/0x9a
 [<0003de34>] __free_pages.part.96+0x16/0x3e
 [<000e51c2>] free_all_bootmem+0xf0/0x1ca
 [<00002000>] show_registers+0x1b0/0x416
 [<00089e20>] strcpy+0x0/0x12
 [<000b25e8>] printk+0x0/0x24
 [<00002704>] inthandler1+0x26/0x28
 [<00000800>] calibrate_delay+0x88/0x22c
 [<000e1042>] mem_init+0x6/0x14
 [<000e04d8>] start_kernel+0x184/0x2c6
 [<00089e20>] strcpy+0x0/0x12
 [<000b25e8>] printk+0x0/0x24
 [<00000480>] _exit+0x0/0x4

BUG: Bad page state in process swapper  pfn:00134
page:00103680 count:0 mapcount:1 mapping:  (null) index:0x0
page flags: 0x0()
page dumped because: nonzero mapcount
CPU: 0 PID: 0 Comm: swapper Tainted: G    B   W    3.14.0-rc8+ #32
Stack from 000d8f24:
        000d8f24 000d56b8 0003c818 00103680 000d291b 00000000 000d28eb 000d94f2
        00000134 00000014 00000014 00103680 0003c774 0003c9ac 00103680 000d291b
        00000000 00000005 00103400 00000011 000ff000 000e8f74 000e3616 0003de34
        00103400 00000005 00000000 00103400 000e51c2 00103400 00000005 000e7a28
        00000005 00000000 00002000 00000002 00000030 00089e20 00101090 000b25e8
        00002704 000d8ff8 00000800 00000120 000e7a28 000e1042 000e04d8 00000000
Call Trace: [<0003c818>] bad_page+0xa4/0x146
 [<0003c774>] bad_page+0x0/0x146
 [<0003c9ac>] free_pages_prepare+0xf2/0xfa
 [<000e3616>] __free_pages_bootmem+0x0/0x9a
 [<0003de34>] __free_pages.part.96+0x16/0x3e
 [<000e51c2>] free_all_bootmem+0xf0/0x1ca
 [<00002000>] show_registers+0x1b0/0x416
 [<00089e20>] strcpy+0x0/0x12
 [<000b25e8>] printk+0x0/0x24
 [<00002704>] inthandler1+0x26/0x28
 [<00000800>] calibrate_delay+0x88/0x22c
 [<000e1042>] mem_init+0x6/0x14
 [<000e04d8>] start_kernel+0x184/0x2c6
 [<00089e20>] strcpy+0x0/0x12
 [<000b25e8>] printk+0x0/0x24
 [<00000480>] _exit+0x0/0x4

BUG: Bad page state in process swapper  pfn:00135
page:001036a0 count:0 mapcount:1 mapping:  (null) index:0x0
page flags: 0x0()
page dumped because: nonzero mapcount
CPU: 0 PID: 0 Comm: swapper Tainted: G    B   W    3.14.0-rc8+ #32
Stack from 000d8f24:
        000d8f24 000d56b8 0003c818 001036a0 000d291b 00000000 000d28eb 000d94f2
        00000135 00000015 00000015 001036a0 0003c774 0003c9ac 001036a0 000d291b
        00000000 00000005 00103400 00000011 000ff000 000e8f74 000e3616 0003de34
        00103400 00000005 00000000 00103400 000e51c2 00103400 00000005 000e7a28
        00000005 00000000 00002000 00000002 00000030 00089e20 00101090 000b25e8
        00002704 000d8ff8 00000800 00000120 000e7a28 000e1042 000e04d8 00000000
Call Trace: [<0003c818>] bad_page+0xa4/0x146
 [<0003c774>] bad_page+0x0/0x146
 [<0003c9ac>] free_pages_prepare+0xf2/0xfa
 [<000e3616>] __free_pages_bootmem+0x0/0x9a
 [<0003de34>] __free_pages.part.96+0x16/0x3e
 [<000e51c2>] free_all_bootmem+0xf0/0x1ca
 [<00002000>] show_registers+0x1b0/0x416
 [<00089e20>] strcpy+0x0/0x12
 [<000b25e8>] printk+0x0/0x24
 [<00002704>] inthandler1+0x26/0x28
 [<00000800>] calibrate_delay+0x88/0x22c
 [<000e1042>] mem_init+0x6/0x14
 [<000e04d8>] start_kernel+0x184/0x2c6
 [<00089e20>] strcpy+0x0/0x12
 [<000b25e8>] printk+0x0/0x24
 [<00000480>] _exit+0x0/0x4

BUG: Bad page state in process swapper  pfn:00136
page:001036c0 count:0 mapcount:1 mapping:  (null) index:0x0
page flags: 0x0()
page dumped because: nonzero mapcount
CPU: 0 PID: 0 Comm: swapper Tainted: G    B   W    3.14.0-rc8+ #32
Stack from 000d8f24:
        000d8f24 000d56b8 0003c818 001036c0 000d291b 00000000 000d28eb 000d94f2
        00000136 00000016 00000016 001036c0 0003c774 0003c9ac 001036c0 000d291b
        00000000 00000005 00103400 00000011 000ff000 000e8f74 000e3616 0003de34
        00103400 00000005 00000000 00103400 000e51c2 00103400 00000005 000e7a28
        00000005 00000000 00002000 00000002 00000030 00089e20 00101090 000b25e8
        00002704 000d8ff8 00000800 00000120 000e7a28 000e1042 000e04d8 00000000
Call Trace: [<0003c818>] bad_page+0xa4/0x146
 [<0003c774>] bad_page+0x0/0x146
 [<0003c9ac>] free_pages_prepare+0xf2/0xfa
 [<000e3616>] __free_pages_bootmem+0x0/0x9a
 [<0003de34>] __free_pages.part.96+0x16/0x3e
 [<000e51c2>] free_all_bootmem+0xf0/0x1ca
 [<00002000>] show_registers+0x1b0/0x416
 [<00089e20>] strcpy+0x0/0x12
 [<000b25e8>] printk+0x0/0x24
 [<00002704>] inthandler1+0x26/0x28
 [<00000800>] calibrate_delay+0x88/0x22c
 [<000e1042>] mem_init+0x6/0x14
 [<000e04d8>] start_kernel+0x184/0x2c6
 [<00089e20>] strcpy+0x0/0x12
 [<000b25e8>] printk+0x0/0x24
 [<00000480>] _exit+0x0/0x4

BUG: Bad page state in process swapper  pfn:00137
page:001036e0 count:0 mapcount:1 mapping:  (null) index:0x0
page flags: 0x0()
page dumped because: nonzero mapcount
CPU: 0 PID: 0 Comm: swapper Tainted: G    B   W    3.14.0-rc8+ #32
Stack from 000d8f24:
        000d8f24 000d56b8 0003c818 001036e0 000d291b 00000000 000d28eb 000d94f2
        00000137 00000017 00000017 001036e0 0003c774 0003c9ac 001036e0 000d291b
        00000000 00000005 00103400 00000011 000ff000 000e8f74 000e3616 0003de34
        00103400 00000005 00000000 00103400 000e51c2 00103400 00000005 000e7a28
        00000005 00000000 00002000 00000002 00000030 00089e20 00101090 000b25e8
        00002704 000d8ff8 00000800 00000120 000e7a28 000e1042 000e04d8 00000000
Call Trace: [<0003c818>] bad_page+0xa4/0x146
 [<0003c774>] bad_page+0x0/0x146
 [<0003c9ac>] free_pages_prepare+0xf2/0xfa
 [<000e3616>] __free_pages_bootmem+0x0/0x9a
 [<0003de34>] __free_pages.part.96+0x16/0x3e
 [<000e51c2>] free_all_bootmem+0xf0/0x1ca
 [<00002000>] show_registers+0x1b0/0x416
 [<00089e20>] strcpy+0x0/0x12
 [<000b25e8>] printk+0x0/0x24
 [<00002704>] inthandler1+0x26/0x28
 [<00000800>] calibrate_delay+0x88/0x22c
 [<000e1042>] mem_init+0x6/0x14
 [<000e04d8>] start_kernel+0x184/0x2c6
 [<00089e20>] strcpy+0x0/0x12
 [<000b25e8>] printk+0x0/0x24
 [<00000480>] _exit+0x0/0x4

BUG: Bad page state in process swapper  pfn:00138
page:00103700 count:0 mapcount:1 mapping:  (null) index:0x0
page flags: 0x0()
page dumped because: nonzero mapcount
CPU: 0 PID: 0 Comm: swapper Tainted: G    B   W    3.14.0-rc8+ #32
Stack from 000d8f24:
        000d8f24 000d56b8 0003c818 00103700 000d291b 00000000 000d28eb 000d94f2
        00000138 00000018 00000018 00103700 0003c774 0003c9ac 00103700 000d291b
        00000000 00000005 00103400 00000011 000ff000 000e8f74 000e3616 0003de34
        00103400 00000005 00000000 00103400 000e51c2 00103400 00000005 000e7a28
        00000005 00000000 00002000 00000002 00000030 00089e20 00101090 000b25e8
        00002704 000d8ff8 00000800 00000120 000e7a28 000e1042 000e04d8 00000000
Call Trace: [<0003c818>] bad_page+0xa4/0x146
 [<0003c774>] bad_page+0x0/0x146
 [<0003c9ac>] free_pages_prepare+0xf2/0xfa
 [<000e3616>] __free_pages_bootmem+0x0/0x9a
 [<0003de34>] __free_pages.part.96+0x16/0x3e
 [<000e51c2>] free_all_bootmem+0xf0/0x1ca
 [<00002000>] show_registers+0x1b0/0x416
 [<00089e20>] strcpy+0x0/0x12
 [<000b25e8>] printk+0x0/0x24
 [<00002704>] inthandler1+0x26/0x28
 [<00000800>] calibrate_delay+0x88/0x22c
 [<000e1042>] mem_init+0x6/0x14
 [<000e04d8>] start_kernel+0x184/0x2c6
 [<00089e20>] strcpy+0x0/0x12
 [<000b25e8>] printk+0x0/0x24
 [<00000480>] _exit+0x0/0x4

BUG: Bad page state in process swapper  pfn:00139
page:00103720 count:0 mapcount:1 mapping:  (null) index:0x0
page flags: 0x0()
page dumped because: nonzero mapcount
CPU: 0 PID: 0 Comm: swapper Tainted: G    B   W    3.14.0-rc8+ #32
Stack from 000d8f24:
        000d8f24 000d56b8 0003c818 00103720 000d291b 00000000 000d28eb 000d94f2
        00000139 00000019 00000019 00103720 0003c774 0003c9ac 00103720 000d291b
        00000000 00000005 00103400 00000011 000ff000 000e8f74 000e3616 0003de34
        00103400 00000005 00000000 00103400 000e51c2 00103400 00000005 000e7a28
        00000005 00000000 00002000 00000002 00000030 00089e20 00101090 000b25e8
        00002704 000d8ff8 00000800 00000120 000e7a28 000e1042 000e04d8 00000000
Call Trace: [<0003c818>] bad_page+0xa4/0x146
 [<0003c774>] bad_page+0x0/0x146
 [<0003c9ac>] free_pages_prepare+0xf2/0xfa
 [<000e3616>] __free_pages_bootmem+0x0/0x9a
 [<0003de34>] __free_pages.part.96+0x16/0x3e
 [<000e51c2>] free_all_bootmem+0xf0/0x1ca
 [<00002000>] show_registers+0x1b0/0x416
 [<00089e20>] strcpy+0x0/0x12
 [<000b25e8>] printk+0x0/0x24
 [<00002704>] inthandler1+0x26/0x28
 [<00000800>] calibrate_delay+0x88/0x22c
 [<000e1042>] mem_init+0x6/0x14
 [<000e04d8>] start_kernel+0x184/0x2c6
 [<00089e20>] strcpy+0x0/0x12
 [<000b25e8>] printk+0x0/0x24
 [<00000480>] _exit+0x0/0x4

BUG: Bad page state in process swapper  pfn:0013a
page:00103740 count:0 mapcount:1 mapping:  (null) index:0x0
page flags: 0x0()
page dumped because: nonzero mapcount
CPU: 0 PID: 0 Comm: swapper Tainted: G    B   W    3.14.0-rc8+ #32
Stack from 000d8f24:
        000d8f24 000d56b8 0003c818 00103740 000d291b 00000000 000d28eb 000d94f2
        0000013a 0000001a 0000001a 00103740 0003c774 0003c9ac 00103740 000d291b
        00000000 00000005 00103400 00000011 000ff000 000e8f74 000e3616 0003de34
        00103400 00000005 00000000 00103400 000e51c2 00103400 00000005 000e7a28
        00000005 00000000 00002000 00000002 00000030 00089e20 00101090 000b25e8
        00002704 000d8ff8 00000800 00000120 000e7a28 000e1042 000e04d8 00000000
Call Trace: [<0003c818>] bad_page+0xa4/0x146
 [<0003c774>] bad_page+0x0/0x146
 [<0003c9ac>] free_pages_prepare+0xf2/0xfa
 [<000e3616>] __free_pages_bootmem+0x0/0x9a
 [<0003de34>] __free_pages.part.96+0x16/0x3e
 [<000e51c2>] free_all_bootmem+0xf0/0x1ca
 [<00002000>] show_registers+0x1b0/0x416
 [<00089e20>] strcpy+0x0/0x12
 [<000b25e8>] printk+0x0/0x24
 [<00002704>] inthandler1+0x26/0x28
 [<00000800>] calibrate_delay+0x88/0x22c
 [<000e1042>] mem_init+0x6/0x14
 [<000e04d8>] start_kernel+0x184/0x2c6
 [<00089e20>] strcpy+0x0/0x12
 [<000b25e8>] printk+0x0/0x24
 [<00000480>] _exit+0x0/0x4

BUG: Bad page state in process swapper  pfn:0013b
page:00103760 count:0 mapcount:1 mapping:  (null) index:0x0
page flags: 0x0()
page dumped because: nonzero mapcount
CPU: 0 PID: 0 Comm: swapper Tainted: G    B   W    3.14.0-rc8+ #32
Stack from 000d8f24:
        000d8f24 000d56b8 0003c818 00103760 000d291b 00000000 000d28eb 000d94f2
        0000013b 0000001b 0000001b 00103760 0003c774 0003c9ac 00103760 000d291b
        00000000 00000005 00103400 00000011 000ff000 000e8f74 000e3616 0003de34
        00103400 00000005 00000000 00103400 000e51c2 00103400 00000005 000e7a28
        00000005 00000000 00002000 00000002 00000030 00089e20 00101090 000b25e8
        00002704 000d8ff8 00000800 00000120 000e7a28 000e1042 000e04d8 00000000
Call Trace: [<0003c818>] bad_page+0xa4/0x146
 [<0003c774>] bad_page+0x0/0x146
 [<0003c9ac>] free_pages_prepare+0xf2/0xfa
 [<000e3616>] __free_pages_bootmem+0x0/0x9a
 [<0003de34>] __free_pages.part.96+0x16/0x3e
 [<000e51c2>] free_all_bootmem+0xf0/0x1ca
 [<00002000>] show_registers+0x1b0/0x416
 [<00089e20>] strcpy+0x0/0x12
 [<000b25e8>] printk+0x0/0x24
 [<00002704>] inthandler1+0x26/0x28
 [<00000800>] calibrate_delay+0x88/0x22c
 [<000e1042>] mem_init+0x6/0x14
 [<000e04d8>] start_kernel+0x184/0x2c6
 [<00089e20>] strcpy+0x0/0x12
 [<000b25e8>] printk+0x0/0x24
 [<00000480>] _exit+0x0/0x4

BUG: Bad page state in process swapper  pfn:0013c
page:00103780 count:0 mapcount:1 mapping:  (null) index:0x0
page flags: 0x0()
page dumped because: nonzero mapcount
CPU: 0 PID: 0 Comm: swapper Tainted: G    B   W    3.14.0-rc8+ #32
Stack from 000d8f24:
        000d8f24 000d56b8 0003c818 00103780 000d291b 00000000 000d28eb 000d94f2
        0000013c 0000001c 0000001c 00103780 0003c774 0003c9ac 00103780 000d291b
        00000000 00000005 00103400 00000011 000ff000 000e8f74 000e3616 0003de34
        00103400 00000005 00000000 00103400 000e51c2 00103400 00000005 000e7a28
        00000005 00000000 00002000 00000002 00000030 00089e20 00101090 000b25e8
        00002704 000d8ff8 00000800 00000120 000e7a28 000e1042 000e04d8 00000000
Call Trace: [<0003c818>] bad_page+0xa4/0x146
 [<0003c774>] bad_page+0x0/0x146
 [<0003c9ac>] free_pages_prepare+0xf2/0xfa
 [<000e3616>] __free_pages_bootmem+0x0/0x9a
 [<0003de34>] __free_pages.part.96+0x16/0x3e
 [<000e51c2>] free_all_bootmem+0xf0/0x1ca
 [<00002000>] show_registers+0x1b0/0x416
 [<00089e20>] strcpy+0x0/0x12
 [<000b25e8>] printk+0x0/0x24
 [<00002704>] inthandler1+0x26/0x28
 [<00000800>] calibrate_delay+0x88/0x22c
 [<000e1042>] mem_init+0x6/0x14
 [<000e04d8>] start_kernel+0x184/0x2c6
 [<00089e20>] strcpy+0x0/0x12
 [<000b25e8>] printk+0x0/0x24
 [<00000480>] _exit+0x0/0x4

BUG: Bad page state in process swapper  pfn:0013d
page:001037a0 count:0 mapcount:1 mapping:  (null) index:0x0
page flags: 0x0()
page dumped because: nonzero mapcount
CPU: 0 PID: 0 Comm: swapper Tainted: G    B   W    3.14.0-rc8+ #32
Stack from 000d8f24:
        000d8f24 000d56b8 0003c818 001037a0 000d291b 00000000 000d28eb 000d94f2
        0000013d 0000001d 0000001d 001037a0 0003c774 0003c9ac 001037a0 000d291b
        00000000 00000005 00103400 00000011 000ff000 000e8f74 000e3616 0003de34
        00103400 00000005 00000000 00103400 000e51c2 00103400 00000005 000e7a28
        00000005 00000000 00002000 00000002 00000030 00089e20 00101090 000b25e8
        00002704 000d8ff8 00000800 00000120 000e7a28 000e1042 000e04d8 00000000
Call Trace: [<0003c818>] bad_page+0xa4/0x146
 [<0003c774>] bad_page+0x0/0x146
 [<0003c9ac>] free_pages_prepare+0xf2/0xfa
 [<000e3616>] __free_pages_bootmem+0x0/0x9a
 [<0003de34>] __free_pages.part.96+0x16/0x3e
 [<000e51c2>] free_all_bootmem+0xf0/0x1ca
 [<00002000>] show_registers+0x1b0/0x416
 [<00089e20>] strcpy+0x0/0x12
 [<000b25e8>] printk+0x0/0x24
 [<00002704>] inthandler1+0x26/0x28
 [<00000800>] calibrate_delay+0x88/0x22c
 [<000e1042>] mem_init+0x6/0x14
 [<000e04d8>] start_kernel+0x184/0x2c6
 [<00089e20>] strcpy+0x0/0x12
 [<000b25e8>] printk+0x0/0x24
 [<00000480>] _exit+0x0/0x4

BUG: Bad page state in process swapper  pfn:0013e
page:001037c0 count:0 mapcount:1 mapping:  (null) index:0x0
page flags: 0x0()
page dumped because: nonzero mapcount
CPU: 0 PID: 0 Comm: swapper Tainted: G    B   W    3.14.0-rc8+ #32
Stack from 000d8f24:
        000d8f24 000d56b8 0003c818 001037c0 000d291b 00000000 000d28eb 000d94f2
        0000013e 0000001e 0000001e 001037c0 0003c774 0003c9ac 001037c0 000d291b
        00000000 00000005 00103400 00000011 000ff000 000e8f74 000e3616 0003de34
        00103400 00000005 00000000 00103400 000e51c2 00103400 00000005 000e7a28
        00000005 00000000 00002000 00000002 00000030 00089e20 00101090 000b25e8
        00002704 000d8ff8 00000800 00000120 000e7a28 000e1042 000e04d8 00000000
Call Trace: [<0003c818>] bad_page+0xa4/0x146
 [<0003c774>] bad_page+0x0/0x146
 [<0003c9ac>] free_pages_prepare+0xf2/0xfa
 [<000e3616>] __free_pages_bootmem+0x0/0x9a
 [<0003de34>] __free_pages.part.96+0x16/0x3e
 [<000e51c2>] free_all_bootmem+0xf0/0x1ca
 [<00002000>] show_registers+0x1b0/0x416
 [<00089e20>] strcpy+0x0/0x12
 [<000b25e8>] printk+0x0/0x24
 [<00002704>] inthandler1+0x26/0x28
 [<00000800>] calibrate_delay+0x88/0x22c
 [<000e1042>] mem_init+0x6/0x14
 [<000e04d8>] start_kernel+0x184/0x2c6
 [<00089e20>] strcpy+0x0/0x12
 [<000b25e8>] printk+0x0/0x24
 [<00000480>] _exit+0x0/0x4

BUG: Bad page state in process swapper  pfn:0013f
page:001037e0 count:0 mapcount:1 mapping:  (null) index:0x0
page flags: 0x0()
page dumped because: nonzero mapcount
CPU: 0 PID: 0 Comm: swapper Tainted: G    B   W    3.14.0-rc8+ #32
Stack from 000d8f24:
        000d8f24 000d56b8 0003c818 001037e0 000d291b 00000000 000d28eb 000d94f2
        0000013f 0000001f 0000001f 001037e0 0003c774 0003c9ac 001037e0 000d291b
        00000000 00000005 00103400 00000011 000ff000 000e8f74 000e3616 0003de34
        00103400 00000005 00000000 00103400 000e51c2 00103400 00000005 000e7a28
        00000005 00000000 00002000 00000002 00000030 00089e20 00101090 000b25e8
        00002704 000d8ff8 00000800 00000120 000e7a28 000e1042 000e04d8 00000000
Call Trace: [<0003c818>] bad_page+0xa4/0x146
 [<0003c774>] bad_page+0x0/0x146
 [<0003c9ac>] free_pages_prepare+0xf2/0xfa
 [<000e3616>] __free_pages_bootmem+0x0/0x9a
 [<0003de34>] __free_pages.part.96+0x16/0x3e
 [<000e51c2>] free_all_bootmem+0xf0/0x1ca
 [<00002000>] show_registers+0x1b0/0x416
 [<00089e20>] strcpy+0x0/0x12
 [<000b25e8>] printk+0x0/0x24
 [<00002704>] inthandler1+0x26/0x28
 [<00000800>] calibrate_delay+0x88/0x22c
 [<000e1042>] mem_init+0x6/0x14
 [<000e04d8>] start_kernel+0x184/0x2c6
 [<00089e20>] strcpy+0x0/0x12
 [<000b25e8>] printk+0x0/0x24
 [<00000480>] _exit+0x0/0x4

BUG: Bad page state in process swapper  pfn:00140
page:00103800 count:0 mapcount:1 mapping:  (null) index:0x0
page flags: 0x0()
page dumped because: nonzero mapcount
CPU: 0 PID: 0 Comm: swapper Tainted: G    B   W    3.14.0-rc8+ #32
Stack from 000d8f24:
        000d8f24 000d56b8 0003c818 00103800 000d291b 00000000 000d28eb 000d94f2
        00000140 00000000 00000000 00103800 0003c774 0003c9ac 00103800 000d291b
        00000000 00000005 00103800 00000031 000ff000 000e8f74 000e3616 0003de34
        00103800 00000005 00000000 00103800 000e51c2 00103800 00000005 000e7a28
        00000005 00000000 00002000 00000002 00000030 00089e20 00101090 000b25e8
        00002704 000d8ff8 00000800 00000120 000e7a28 000e1042 000e04d8 00000000
Call Trace: [<0003c818>] bad_page+0xa4/0x146
 [<0003c774>] bad_page+0x0/0x146
 [<0003c9ac>] free_pages_prepare+0xf2/0xfa
 [<000e3616>] __free_pages_bootmem+0x0/0x9a
 [<0003de34>] __free_pages.part.96+0x16/0x3e
 [<000e51c2>] free_all_bootmem+0xf0/0x1ca
 [<00002000>] show_registers+0x1b0/0x416
 [<00089e20>] strcpy+0x0/0x12
 [<000b25e8>] printk+0x0/0x24
 [<00002704>] inthandler1+0x26/0x28
 [<00000800>] calibrate_delay+0x88/0x22c
 [<000e1042>] mem_init+0x6/0x14
 [<000e04d8>] start_kernel+0x184/0x2c6
 [<00089e20>] strcpy+0x0/0x12
 [<000b25e8>] printk+0x0/0x24
 [<00000480>] _exit+0x0/0x4

BUG: Bad page state in process swapper  pfn:00141
page:00103820 count:0 mapcount:1 mapping:  (null) index:0x0
page flags: 0x0()
page dumped because: nonzero mapcount
CPU: 0 PID: 0 Comm: swapper Tainted: G    B   W    3.14.0-rc8+ #32
Stack from 000d8f24:
        000d8f24 000d56b8 0003c818 00103820 000d291b 00000000 000d28eb 000d94f2
        00000141 00000001 00000001 00103820 0003c774 0003c9ac 00103820 000d291b
        00000000 00000005 00103800 00000031 000ff000 000e8f74 000e3616 0003de34
        00103800 00000005 00000000 00103800 000e51c2 00103800 00000005 000e7a28
        00000005 00000000 00002000 00000002 00000030 00089e20 00101090 000b25e8
        00002704 000d8ff8 00000800 00000120 000e7a28 000e1042 000e04d8 00000000
Call Trace: [<0003c818>] bad_page+0xa4/0x146
 [<0003c774>] bad_page+0x0/0x146
 [<0003c9ac>] free_pages_prepare+0xf2/0xfa
 [<000e3616>] __free_pages_bootmem+0x0/0x9a
 [<0003de34>] __free_pages.part.96+0x16/0x3e
 [<000e51c2>] free_all_bootmem+0xf0/0x1ca
 [<00002000>] show_registers+0x1b0/0x416
 [<00089e20>] strcpy+0x0/0x12
 [<000b25e8>] printk+0x0/0x24
 [<00002704>] inthandler1+0x26/0x28
 [<00000800>] calibrate_delay+0x88/0x22c
 [<000e1042>] mem_init+0x6/0x14
 [<000e04d8>] start_kernel+0x184/0x2c6
 [<00089e20>] strcpy+0x0/0x12
 [<000b25e8>] printk+0x0/0x24
 [<00000480>] _exit+0x0/0x4

BUG: Bad page state in process swapper  pfn:00142
page:00103840 count:0 mapcount:1 mapping:  (null) index:0x0
page flags: 0x0()
page dumped because: nonzero mapcount
CPU: 0 PID: 0 Comm: swapper Tainted: G    B   W    3.14.0-rc8+ #32
Stack from 000d8f24:
        000d8f24 000d56b8 0003c818 00103840 000d291b 00000000 000d28eb 000d94f2
        00000142 00000002 00000002 00103840 0003c774 0003c9ac 00103840 000d291b
        00000000 00000005 00103800 00000031 000ff000 000e8f74 000e3616 0003de34
        00103800 00000005 00000000 00103800 000e51c2 00103800 00000005 000e7a28
        00000005 00000000 00002000 00000002 00000030 00089e20 00101090 000b25e8
        00002704 000d8ff8 00000800 00000120 000e7a28 000e1042 000e04d8 00000000
Call Trace: [<0003c818>] bad_page+0xa4/0x146
 [<0003c774>] bad_page+0x0/0x146
 [<0003c9ac>] free_pages_prepare+0xf2/0xfa
 [<000e3616>] __free_pages_bootmem+0x0/0x9a
 [<0003de34>] __free_pages.part.96+0x16/0x3e
 [<000e51c2>] free_all_bootmem+0xf0/0x1ca
 [<00002000>] show_registers+0x1b0/0x416
 [<00089e20>] strcpy+0x0/0x12
 [<000b25e8>] printk+0x0/0x24
 [<00002704>] inthandler1+0x26/0x28
 [<00000800>] calibrate_delay+0x88/0x22c
 [<000e1042>] mem_init+0x6/0x14
 [<000e04d8>] start_kernel+0x184/0x2c6
 [<00089e20>] strcpy+0x0/0x12
 [<000b25e8>] printk+0x0/0x24
 [<00000480>] _exit+0x0/0x4

BUG: Bad page state in process swapper  pfn:00143
page:00103860 count:0 mapcount:1 mapping:  (null) index:0x0
page flags: 0x0()
page dumped because: nonzero mapcount
CPU: 0 PID: 0 Comm: swapper Tainted: G    B   W    3.14.0-rc8+ #32
Stack from 000d8f24:
        000d8f24 000d56b8 0003c818 00103860 000d291b 00000000 000d28eb 000d94f2
        00000143 00000003 00000003 00103860 0003c774 0003c9ac 00103860 000d291b
        00000000 00000005 00103800 00000031 000ff000 000e8f74 000e3616 0003de34
        00103800 00000005 00000000 00103800 000e51c2 00103800 00000005 000e7a28
        00000005 00000000 00002000 00000002 00000030 00089e20 00101090 000b25e8
        00002704 000d8ff8 00000800 00000120 000e7a28 000e1042 000e04d8 00000000
Call Trace: [<0003c818>] bad_page+0xa4/0x146
 [<0003c774>] bad_page+0x0/0x146
 [<0003c9ac>] free_pages_prepare+0xf2/0xfa
 [<000e3616>] __free_pages_bootmem+0x0/0x9a
 [<0003de34>] __free_pages.part.96+0x16/0x3e
 [<000e51c2>] free_all_bootmem+0xf0/0x1ca
 [<00002000>] show_registers+0x1b0/0x416
 [<00089e20>] strcpy+0x0/0x12
 [<000b25e8>] printk+0x0/0x24
 [<00002704>] inthandler1+0x26/0x28
 [<00000800>] calibrate_delay+0x88/0x22c
 [<000e1042>] mem_init+0x6/0x14
 [<000e04d8>] start_kernel+0x184/0x2c6
 [<00089e20>] strcpy+0x0/0x12
 [<000b25e8>] printk+0x0/0x24
 [<00000480>] _exit+0x0/0x4

BUG: Bad page state in process swapper  pfn:00144
page:00103880 count:0 mapcount:1 mapping:  (null) index:0x0
page flags: 0x0()
page dumped because: nonzero mapcount
CPU: 0 PID: 0 Comm: swapper Tainted: G    B   W    3.14.0-rc8+ #32
Stack from 000d8f24:
        000d8f24 000d56b8 0003c818 00103880 000d291b 00000000 000d28eb 000d94f2
        00000144 00000004 00000004 00103880 0003c774 0003c9ac 00103880 000d291b
        00000000 00000005 00103800 00000031 000ff000 000e8f74 000e3616 0003de34
        00103800 00000005 00000000 00103800 000e51c2 00103800 00000005 000e7a28
        00000005 00000000 00002000 00000002 00000030 00089e20 00101090 000b25e8
        00002704 000d8ff8 00000800 00000120 000e7a28 000e1042 000e04d8 00000000
Call Trace: [<0003c818>] bad_page+0xa4/0x146
 [<0003c774>] bad_page+0x0/0x146
 [<0003c9ac>] free_pages_prepare+0xf2/0xfa
 [<000e3616>] __free_pages_bootmem+0x0/0x9a
 [<0003de34>] __free_pages.part.96+0x16/0x3e
 [<000e51c2>] free_all_bootmem+0xf0/0x1ca
 [<00002000>] show_registers+0x1b0/0x416
 [<00089e20>] strcpy+0x0/0x12
 [<000b25e8>] printk+0x0/0x24
 [<00002704>] inthandler1+0x26/0x28
 [<00000800>] calibrate_delay+0x88/0x22c
 [<000e1042>] mem_init+0x6/0x14
 [<000e04d8>] start_kernel+0x184/0x2c6
 [<00089e20>] strcpy+0x0/0x12
 [<000b25e8>] printk+0x0/0x24
 [<00000480>] _exit+0x0/0x4

BUG: Bad page state in process swapper  pfn:00145
page:001038a0 count:0 mapcount:1 mapping:  (null) index:0x0
page flags: 0x0()
page dumped because: nonzero mapcount
CPU: 0 PID: 0 Comm: swapper Tainted: G    B   W    3.14.0-rc8+ #32
Stack from 000d8f24:
        000d8f24 000d56b8 0003c818 001038a0 000d291b 00000000 000d28eb 000d94f2
        00000145 00000005 00000005 001038a0 0003c774 0003c9ac 001038a0 000d291b
        00000000 00000005 00103800 00000031 000ff000 000e8f74 000e3616 0003de34
        00103800 00000005 00000000 00103800 000e51c2 00103800 00000005 000e7a28
        00000005 00000000 00002000 00000002 00000030 00089e20 00101090 000b25e8
        00002704 000d8ff8 00000800 00000120 000e7a28 000e1042 000e04d8 00000000
Call Trace: [<0003c818>] bad_page+0xa4/0x146
 [<0003c774>] bad_page+0x0/0x146
 [<0003c9ac>] free_pages_prepare+0xf2/0xfa
 [<000e3616>] __free_pages_bootmem+0x0/0x9a
 [<0003de34>] __free_pages.part.96+0x16/0x3e
 [<000e51c2>] free_all_bootmem+0xf0/0x1ca
 [<00002000>] show_registers+0x1b0/0x416
 [<00089e20>] strcpy+0x0/0x12
 [<000b25e8>] printk+0x0/0x24
 [<00002704>] inthandler1+0x26/0x28
 [<00000800>] calibrate_delay+0x88/0x22c
 [<000e1042>] mem_init+0x6/0x14
 [<000e04d8>] start_kernel+0x184/0x2c6
 [<00089e20>] strcpy+0x0/0x12
 [<000b25e8>] printk+0x0/0x24
 [<00000480>] _exit+0x0/0x4

BUG: Bad page state in process swapper  pfn:00146
page:001038c0 count:0 mapcount:1 mapping:  (null) index:0x0
page flags: 0x0()
page dumped because: nonzero mapcount
CPU: 0 PID: 0 Comm: swapper Tainted: G    B   W    3.14.0-rc8+ #32
Stack from 000d8f24:
        000d8f24 000d56b8 0003c818 001038c0 000d291b 00000000 000d28eb 000d94f2
        00000146 00000006 00000006 001038c0 0003c774 0003c9ac 001038c0 000d291b
        00000000 00000005 00103800 00000031 000ff000 000e8f74 000e3616 0003de34
        00103800 00000005 00000000 00103800 000e51c2 00103800 00000005 000e7a28
        00000005 00000000 00002000 00000002 00000030 00089e20 00101090 000b25e8
        00002704 000d8ff8 00000800 00000120 000e7a28 000e1042 000e04d8 00000000
Call Trace: [<0003c818>] bad_page+0xa4/0x146
 [<0003c774>] bad_page+0x0/0x146
 [<0003c9ac>] free_pages_prepare+0xf2/0xfa
 [<000e3616>] __free_pages_bootmem+0x0/0x9a
 [<0003de34>] __free_pages.part.96+0x16/0x3e
 [<000e51c2>] free_all_bootmem+0xf0/0x1ca
 [<00002000>] show_registers+0x1b0/0x416
 [<00089e20>] strcpy+0x0/0x12
 [<000b25e8>] printk+0x0/0x24
 [<00002704>] inthandler1+0x26/0x28
 [<00000800>] calibrate_delay+0x88/0x22c
 [<000e1042>] mem_init+0x6/0x14
 [<000e04d8>] start_kernel+0x184/0x2c6
 [<00089e20>] strcpy+0x0/0x12
 [<000b25e8>] printk+0x0/0x24
 [<00000480>] _exit+0x0/0x4

BUG: Bad page state in process swapper  pfn:00147
page:001038e0 count:0 mapcount:1 mapping:  (null) index:0x0
page flags: 0x0()
page dumped because: nonzero mapcount
CPU: 0 PID: 0 Comm: swapper Tainted: G    B   W    3.14.0-rc8+ #32
Stack from 000d8f24:
        000d8f24 000d56b8 0003c818 001038e0 000d291b 00000000 000d28eb 000d94f2
        00000147 00000007 00000007 001038e0 0003c774 0003c9ac 001038e0 000d291b
        00000000 00000005 00103800 00000031 000ff000 000e8f74 000e3616 0003de34
        00103800 00000005 00000000 00103800 000e51c2 00103800 00000005 000e7a28
        00000005 00000000 00002000 00000002 00000030 00089e20 00101090 000b25e8
        00002704 000d8ff8 00000800 00000120 000e7a28 000e1042 000e04d8 00000000
Call Trace: [<0003c818>] bad_page+0xa4/0x146
 [<0003c774>] bad_page+0x0/0x146
 [<0003c9ac>] free_pages_prepare+0xf2/0xfa
 [<000e3616>] __free_pages_bootmem+0x0/0x9a
 [<0003de34>] __free_pages.part.96+0x16/0x3e
 [<000e51c2>] free_all_bootmem+0xf0/0x1ca
 [<00002000>] show_registers+0x1b0/0x416
 [<00089e20>] strcpy+0x0/0x12
 [<000b25e8>] printk+0x0/0x24
 [<00002704>] inthandler1+0x26/0x28
 [<00000800>] calibrate_delay+0x88/0x22c
 [<000e1042>] mem_init+0x6/0x14
 [<000e04d8>] start_kernel+0x184/0x2c6
 [<00089e20>] strcpy+0x0/0x12
 [<000b25e8>] printk+0x0/0x24
 [<00000480>] _exit+0x0/0x4

BUG: Bad page state in process swapper  pfn:00148
page:00103900 count:0 mapcount:1 mapping:  (null) index:0x0
page flags: 0x0()
page dumped because: nonzero mapcount
CPU: 0 PID: 0 Comm: swapper Tainted: G    B   W    3.14.0-rc8+ #32
Stack from 000d8f24:
        000d8f24 000d56b8 0003c818 00103900 000d291b 00000000 000d28eb 000d94f2
        00000148 00000008 00000008 00103900 0003c774 0003c9ac 00103900 000d291b
        00000000 00000005 00103800 00000031 000ff000 000e8f74 000e3616 0003de34
        00103800 00000005 00000000 00103800 000e51c2 00103800 00000005 000e7a28
        00000005 00000000 00002000 00000002 00000030 00089e20 00101090 000b25e8
        00002704 000d8ff8 00000800 00000120 000e7a28 000e1042 000e04d8 00000000
Call Trace: [<0003c818>] bad_page+0xa4/0x146
 [<0003c774>] bad_page+0x0/0x146
 [<0003c9ac>] free_pages_prepare+0xf2/0xfa
 [<000e3616>] __free_pages_bootmem+0x0/0x9a
 [<0003de34>] __free_pages.part.96+0x16/0x3e
 [<000e51c2>] free_all_bootmem+0xf0/0x1ca
 [<00002000>] show_registers+0x1b0/0x416
 [<00089e20>] strcpy+0x0/0x12
 [<000b25e8>] printk+0x0/0x24
 [<00002704>] inthandler1+0x26/0x28
 [<00000800>] calibrate_delay+0x88/0x22c
 [<000e1042>] mem_init+0x6/0x14
 [<000e04d8>] start_kernel+0x184/0x2c6
 [<00089e20>] strcpy+0x0/0x12
 [<000b25e8>] printk+0x0/0x24
 [<00000480>] _exit+0x0/0x4

BUG: Bad page state in process swapper  pfn:00149
page:00103920 count:0 mapcount:1 mapping:  (null) index:0x0
page flags: 0x0()
page dumped because: nonzero mapcount
CPU: 0 PID: 0 Comm: swapper Tainted: G    B   W    3.14.0-rc8+ #32
Stack from 000d8f24:
        000d8f24 000d56b8 0003c818 00103920 000d291b 00000000 000d28eb 000d94f2
        00000149 00000009 00000009 00103920 0003c774 0003c9ac 00103920 000d291b
        00000000 00000005 00103800 00000031 000ff000 000e8f74 000e3616 0003de34
        00103800 00000005 00000000 00103800 000e51c2 00103800 00000005 000e7a28
        00000005 00000000 00002000 00000002 00000030 00089e20 00101090 000b25e8
        00002704 000d8ff8 00000800 00000120 000e7a28 000e1042 000e04d8 00000000
Call Trace: [<0003c818>] bad_page+0xa4/0x146
 [<0003c774>] bad_page+0x0/0x146
 [<0003c9ac>] free_pages_prepare+0xf2/0xfa
 [<000e3616>] __free_pages_bootmem+0x0/0x9a
 [<0003de34>] __free_pages.part.96+0x16/0x3e
 [<000e51c2>] free_all_bootmem+0xf0/0x1ca
 [<00002000>] show_registers+0x1b0/0x416
 [<00089e20>] strcpy+0x0/0x12
 [<000b25e8>] printk+0x0/0x24
 [<00002704>] inthandler1+0x26/0x28
 [<00000800>] calibrate_delay+0x88/0x22c
 [<000e1042>] mem_init+0x6/0x14
 [<000e04d8>] start_kernel+0x184/0x2c6
 [<00089e20>] strcpy+0x0/0x12
 [<000b25e8>] printk+0x0/0x24
 [<00000480>] _exit+0x0/0x4

BUG: Bad page state in process swapper  pfn:0014a
page:00103940 count:0 mapcount:1 mapping:  (null) index:0x0
page flags: 0x0()
page dumped because: nonzero mapcount
CPU: 0 PID: 0 Comm: swapper Tainted: G    B   W    3.14.0-rc8+ #32
Stack from 000d8f24:
        000d8f24 000d56b8 0003c818 00103940 000d291b 00000000 000d28eb 000d94f2
        0000014a 0000000a 0000000a 00103940 0003c774 0003c9ac 00103940 000d291b
        00000000 00000005 00103800 00000031 000ff000 000e8f74 000e3616 0003de34
        00103800 00000005 00000000 00103800 000e51c2 00103800 00000005 000e7a28
        00000005 00000000 00002000 00000002 00000030 00089e20 00101090 000b25e8
        00002704 000d8ff8 00000800 00000120 000e7a28 000e1042 000e04d8 00000000
Call Trace: [<0003c818>] bad_page+0xa4/0x146
 [<0003c774>] bad_page+0x0/0x146
 [<0003c9ac>] free_pages_prepare+0xf2/0xfa
 [<000e3616>] __free_pages_bootmem+0x0/0x9a
 [<0003de34>] __free_pages.part.96+0x16/0x3e
 [<000e51c2>] free_all_bootmem+0xf0/0x1ca
 [<00002000>] show_registers+0x1b0/0x416
 [<00089e20>] strcpy+0x0/0x12
 [<000b25e8>] printk+0x0/0x24
 [<00002704>] inthandler1+0x26/0x28
 [<00000800>] calibrate_delay+0x88/0x22c
 [<000e1042>] mem_init+0x6/0x14
 [<000e04d8>] start_kernel+0x184/0x2c6
 [<00089e20>] strcpy+0x0/0x12
 [<000b25e8>] printk+0x0/0x24
 [<00000480>] _exit+0x0/0x4
