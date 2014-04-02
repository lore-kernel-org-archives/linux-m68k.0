From: Greg Ungerer <gregungerer00@gmail.com>
Subject: Re: Getting stuck during boot on a 68VZ328 (DragonBallVZ).
Date: Wed, 02 Apr 2014 22:26:48 +1000
Message-ID: <533C0208.3040206@gmail.com>
References: <CAO64nm7D_cfy95rdDasH9jeHhXRzLpMMpniK-BKxCsqZsn7yZw@mail.gmail.com>	<CAO64nm6s8SYRFpnd1yMV5UsvM7JetkzkYgWMiRfNQyT93+PuGQ@mail.gmail.com> <CAO64nm6Z0rOhiUYu5nqeZuVvfz0-9wy8D02gj_82nXRdi0NECw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pa0-f41.google.com ([209.85.220.41]:43143 "EHLO
	mail-pa0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758618AbaDBM0y (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 2 Apr 2014 08:26:54 -0400
Received: by mail-pa0-f41.google.com with SMTP id fa1so111847pad.28
        for <linux-m68k@vger.kernel.org>; Wed, 02 Apr 2014 05:26:53 -0700 (PDT)
In-Reply-To: <CAO64nm6Z0rOhiUYu5nqeZuVvfz0-9wy8D02gj_82nXRdi0NECw@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Daniel Palmer <danieruru@gmail.com>, linux-m68k@vger.kernel.org

Hi Daniel,

On 02/04/14 11:42, Daniel Palmer wrote:
> I now have this mostly working.

Can you create patches and send them here?
Clean neat patches are easily pushed up-stream to the kernel.

Regards
Greg



> I have some issues with busybox and
> the clock frequency showing incorrectly in /proc/cpuinfo. It's running
> at 33MHz and it has to be running somewhere near that as the baud rate
> for the serial is derived from that clock.
>
> Just in case someone else wants to run the latest kernel on a 68000 or
> 68000 based chip:
>
> - For the 68[EZ|VZ|SZ]328 you will need to fix up the PLL settings and
> do the fixes from Luis Alves at
> https://github.com/ljalves/alce68k/commit/4ef1df317c7acb6dfcd0fe9e87be9b4a60b141a4.
> If your chip isn't running at 16MHz you have to fix up the serial
> driver as it seems to assume a clock of 16MHz for it's baud rate
> setting.
>
> To make life easier you can easily add early printk support with a
> routine like this:
>
> ENTRY(vzads_early_print)
> moveml %d0/%d1/%a0,%sp@-
> movew %sr,%sp@-
> ori #0x0700,%sr
> movel %sp@(18),%a0 /* fetch parameter */
> movel %sp@(22),%d1 /* fetch parameter */
> jra 3f
> 1:
>
> moveb %d0, 0xfffff907
> 2:
> btst.b #2, 0xfffff906
> jne 2b
>
> subq #1,%d1
> 3: jeq 4f
> moveb %a0@+,%d0
> jne 1b
> 4:
> movew %sp@+,%sr
> moveml %sp@+,%d0/%d1/%a0
> rts
>
> Look at how it is wired up for the mac to wire it up.
>
> - Building a working toolchain and user land will probably turn you
> bald.. but if you like a challenge you need to use an old version of
> GCC. It's probably easiest to start with Luis Alves' pre compiled GCC
> 4.5.1 toolchain that you can download here:
> https://code.google.com/p/m68k/downloads/list. The problem with this
> toolchain is that uClibc contains 020+ instructions even in the m68000
> version. So download the uClibc source, run menuconfig, add -m68000 to
> it's LDFLAGs settings, build it and then copy the resulting libc.a
> over the version in the libs/m68000 directory in the toolchain. You
> can use objcopy to disassemble the resulting binaries to check for
> illegal instructions.
>
> - The latest version of busybox seems to work. Some applets wouldn't
> compile but I think they will after a bit of tinkering. Make sure to
> enter -m68000 in the LDFLAGs setting in menuconfig.
>
> - There are no handlers for address, buserr, illegal instruction
> exceptions. If you see the kernel restarting and then going crazy it's
> probably because you have unaligned accesses or instructions that the
> 68000 can't execute in your kernel or userland. Because the vector for
> those exceptions is 0 the PC goes to 0 and everything goes downhill
> from there. I added my own handlers and added some code to decode the
> 68000 stack frames for bus and address exceptions and found that the
> m68k-uclinux target in newer GCC versions is broken for 68000. There
> is a stale bug open for it that'll probably never be fixed.
>
> Attached is the output from what I'm sure is the first successful boot
> on a MC68VZ328 in a very long time. :)
>
>
> jumping to code at 0x400
> Reading input from board
> [    0.000000] Linux version 3.14.0-rc8+ (daniel@mirmachina) (gcc
> version 4.5.1 (GCC) ) #229 Wed Apr 2 02:22:10 JST 2014
> [    0.000000] bootconsole [early0] enabled
> [    0.000000] 68VZ328 DragonBallVZ support (c) 2001 Lineo, Inc.
> [    0.000000]
> [    0.000000]
> [    0.000000] uClinux/MC68VZ328
> [    0.000000] M68VZ328 support by Evan Stawnyczy <e@lineo.ca>
> [    0.000000] Flat model support (C) 1998,1999 Kenneth Albanowski, D.
> Jeff Dionne
> [    0.000000] Built 1 zonelists in Zone order, mobility grouping off.
>   Total pages: 2032
> [    0.000000] Kernel command line: console=ttyS0,115200 loglevel=7
> [    0.000000] PID hash table entries: 32 (order: -5, 128 bytes)
> [    0.000000] Dentry cache hash table entries: 1024 (order: 0, 4096 bytes)
> [    0.000000] Inode-cache hash table entries: 1024 (order: 0, 4096 bytes)
> [    0.000000] Memory: 6792K/8192K available (879K kernel code, 36K
> rwdata, 156K rodata, 184K init, 18K bss, 1400K reserved)
> [    0.000000] Virtual kernel memory layout:
> [    0.000000]     vector  : 0x00000000 - 0x00000400   (   1 KiB)
> [    0.000000]     kmap    : 0x00000000 - 0xffffffff   (4095 MiB)
> [    0.000000]     vmalloc : 0x00000000 - 0xffffffff   (4095 MiB)
> [    0.000000]     lowmem  : 0x00000000 - 0x00800000   (   8 MiB)
> [    0.000000]       .init : 0x0010d000 - 0x0013b000   ( 184 KiB)
> [    0.000000]       .text : 0x00000400 - 0x000dc1f0   ( 880 KiB)
> [    0.000000]       .data : 0x000dc1f0 - 0x0010c340   ( 193 KiB)
> [    0.000000]       .bss  : 0x0013b000 - 0x0013fb80   (  19 KiB)
> [    0.000000] NR_IRQS:32
> [    0.000000] console [ttyS0] enabled
>      0.000000] console [ttyS0] enabled
> [    0.010000] bootconsole [early0] disabled
>      0.010000] bootconsole [early0] disabled
> [    0.020000] Calibrating delay loop... 2.35 BogoMIPS (lpj=11776)
> [    0.170000] pid_max: default: 4096 minimum: 301
> [    0.190000] Mount-cache hash table entries: 512
> [    0.620000] devtmpfs: initialized
> [    1.300000] bio: create slab <bio-0> at 0
> [    1.370000] Switched to clocksource timer
> [    7.280000] Block layer SCSI generic (bsg) driver version 0.4
> loaded (major 254)
> [    7.300000] io scheduler noop registered (default)
> [    7.350000] MC68328 serial driver version 1.00
> [    7.350000] ttyS0 at 0xfffff900 (irq = 2) is a builtin MC68328 UART
> [    7.560000] physmap platform flash device: 00400000 at 01000000
> [    7.580000] physmap-flash.0: Found 1 x16 devices at 0x0 in 16-bit
> bank. Manufacturer ID 0x000004 Chip ID 0x0022c4
> [    7.590000] physmap-flash.0: Found 1 x16 devices at 0x200000 in 16-bit bank
> [    7.600000] Amd/Fujitsu Extended Query Table at 0x0040
> [    7.610000]   Amd/Fujitsu Extended Query version 1.0.
> [    7.620000] physmap-flash.0: CFI contains unrecognised boot bank
> location (0). Assuming bottom.
> [    7.630000] number of CFI chips: 2
> [    7.710000] bootconsole [early0] disabled
> [    7.930000] Freeing unused kernel memory: 184K (0010d000 - 0013b000)
> init started: BusyBox v1.23.0.git (2014-04-02 00:24:20 JST)
> starting pid 17, tty '': '/etc/init.d/rcS'
> starting pid 22, tty '': '-/bin/sh'
>
>
> BusyBox v1.23.0.git (2014-04-02 00:24:20 JST) hush - the humble shell
> Enter 'help' for a list of built-in commands.
>
> / # cat /proc/cpuinfo
> CPU:            MC68VZ328
> MMU:            none
> FPU:            none
> Clocking:       18.8MHz
> BogoMips:       2.35
> Calibration:    1177600 loops
> --
> To unsubscribe from this list: send the line "unsubscribe linux-m68k" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
