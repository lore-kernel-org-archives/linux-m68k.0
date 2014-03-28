From: Daniel Palmer <danieruru@gmail.com>
Subject: Re: Getting stuck during boot on a 68VZ328 (DragonBallVZ).
Date: Fri, 28 Mar 2014 15:38:30 +0900
Message-ID: <CAO64nm6s8SYRFpnd1yMV5UsvM7JetkzkYgWMiRfNQyT93+PuGQ@mail.gmail.com>
References: <CAO64nm7D_cfy95rdDasH9jeHhXRzLpMMpniK-BKxCsqZsn7yZw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-ve0-f179.google.com ([209.85.128.179]:51335 "EHLO
	mail-ve0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750925AbaC1Gib (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 28 Mar 2014 02:38:31 -0400
Received: by mail-ve0-f179.google.com with SMTP id db12so5275231veb.38
        for <linux-m68k@vger.kernel.org>; Thu, 27 Mar 2014 23:38:31 -0700 (PDT)
In-Reply-To: <CAO64nm7D_cfy95rdDasH9jeHhXRzLpMMpniK-BKxCsqZsn7yZw@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org

Replying to myself so there is a record of what I have found:

arch/m68k/platform/68000/mc68VZ328.c doesn't set mach_sched_init which
causes the CPU to jump back to 0 and eventually re-enter the kernel. I
didn't notice the that there were duplicate messages before. Adding a
dummy function for that allows start_kernel to get further.
The next problem I found is that drivers/tty/serial/68328serial.c
doesn't have any consideration for the PLL frequency. After commenting
out it's attempts to change the baud rate I can now see that it is
correctly being initialised and getting switched to.

With some help from printk I can see that it is now stopping around
the call to calibrate_delay() in start_kernel. I guess I will need to
implement the timer correctly to make it get any further but some
progress at least.

Current output below;

loading "/home/daniel/coding/musasim/dragonballstuff/linux/vmlinux.bin" to 0x400
wrote 904192 bytes
>r 0x400
parsing command r 0x400

jumping to code at 0x400
Reading input from board
[    0.000000] Linux version 3.14.0-rc8+ (daniel@mirmachina) (gcc
version 4.8.2 (GCC) ) #52 Fri Mar 28 15:21:19 JST 2014
[    0.000000] bootconsole [early0] enabled
[    0.000000] 68VZ328 DragonBallVZ support (c) 2001 Lineo, Inc.
[    0.000000]
[    0.000000]
[    0.000000] uClinux/MC68VZ328
[    0.000000] M68VZ328 support by Evan Stawnyczy <e@lineo.ca>
[    0.000000] Flat model support (C) 1998,1999 Kenneth Albanowski, D.
Jeff Dionne
[    0.000000] Built 1 zonelists in Zone order, mobility grouping off.
 Total pages: 2032
[    0.000000] Kernel command line: console=ttyS0,115200 loglevel=7
[    0.000000] PID hash table entries: 32 (order: -5, 128 bytes)
[    0.000000] Dentry cache hash table entries: 1024 (order: 0, 4096 bytes)
[    0.000000] Inode-cache hash table entries: 1024 (order: 0, 4096 bytes)
[    0.000000] Memory: 7108K/8192K available (677K kernel code, 30K
rwdata, 132K rodata, 40K init, 77K bss, 1084K reserved)
[    0.000000] Virtual kernel memory layout:
[    0.000000]     vector  : 0x00000000 - 0x00000400   (   1 KiB)
[    0.000000]     kmap    : 0x00000000 - 0xffffffff   (4095 MiB)
[    0.000000]     vmalloc : 0x00000000 - 0xffffffff   (4095 MiB)
[    0.000000]     lowmem  : 0x00000000 - 0x00800000   (   8 MiB)
[    0.000000]       .init : 0x000d3000 - 0x000dd000   (  40 KiB)
[    0.000000]       .text : 0x00000400 - 0x000a9ad0   ( 678 KiB)
[    0.000000]       .data : 0x000a9ad0 - 0x000d2460   ( 163 KiB)
[    0.000000]       .bss  : 0x000dd000 - 0x000f07a4   (  78 KiB)
[    0.000000] early irq init
[    0.000000] NR_IRQS:32
[    0.000000] init IRQ
[    0.000000] tick init
[    0.000000] init timers
[    0.000000] hrtimers init
[    0.000000] softirq
[    0.000000] timekeeping_init()
[    0.000000] time_init()
[    0.000000] mach_sched_init
[    0.000000] sched_clock_postinit()
[    0.000000] perf_event_init()
[    0.000000] profile_init()
[    0.000000] call_function_init()
[    0.000000] local_irq_enable()
[    0.000000] kmem_cache_init_late()
[    0.000000] console_init()
[    0.000000] calling dcb4c
[    0.000000] register_console(&m68328_driver)
[    0.000000] m68328_console_setup
[    0.000000] console [ttyS0] enabled
    0.000000] console [ttyS0] enabled
[    0.000000] bootconsole [early0] disabled
    0.000000] bootconsole [early0] disabled
[    0.000000] ---register_console(&m68328_driver)
[    0.000000] lockdep_info()
[    0.000000] locking_selftest()
[    0.000000] page_cgroup_init()
[    0.000000] debug_objects_mem_init()
[    0.000000] kmemleak_init()
[    0.000000] setup_per_cpu_pageset()
[    0.000000] numa_policy_init()
[    0.000000] sched_clock_init()
[    0.000000] calibrate_delay()
