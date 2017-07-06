From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: Re: mcf54415, spi nor and SD drivers
Date: Thu, 6 Jul 2017 10:40:26 +0200
Message-ID: <D87B2E55-4390-4DD3-BFDA-8D9905BAD6AF@physik.fu-berlin.de>
References: <ba371285-38b5-5744-c386-1721bdf25f95@gmail.com>
Mime-Version: 1.0 (1.0)
Content-Type: text/plain;
        charset=us-ascii
Content-Transfer-Encoding: 8BIT
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66]:53442 "EHLO
        outpost1.zedat.fu-berlin.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1750862AbdGFIki (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Thu, 6 Jul 2017 04:40:38 -0400
In-Reply-To: <ba371285-38b5-5744-c386-1721bdf25f95@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: angelo <angelo70@gmail.com>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>

On a sidenote: Are you currently selling these boards? I would love to get one.

Adrian

> On Jul 6, 2017, at 10:36 AM, angelo <angelo70@gmail.com> wrote:
> 
> Hi all,
> 
> i designed here a new board with mcf54415. Testing a first mainline kernel.
> I would like to load a cramfs rootfs from SPI NOR (mtd, ftl) but actually
> i don't see the SPI NOR flash detected from dmesg.
> 
> Next future step then would be load rootfs from SD.
> 
> Seems there is no selectable driver for
> 
> - SPI controller
> - SD (MMC) controller
> 
> Those should be similar to existing drivers of some other freescale chip,
> or some new implementation is required ? Attaching dmesg.
> 
> Regards,
> Angelo Dureghello
> 
> 
> U-Boot 2017.05-00709-g9d9f074dfe-dirty (Jul 02 2017 - 19:50:16 +0200)
> 
> CPU:   Freescale MCF54410 (Mask:9f Version:2)
>       CPU CLK 240 MHz BUS CLK 120 MHz FLB CLK 60 MHz
>       INP CLK 30 MHz VCO CLK 480 MHz
> SPI:   ready
> DRAM:  128 MiB
> SF: Detected is25lp128 with page size 256 Bytes, erase size 64 KiB, total 16 MiB
> In:    serial
> Out:   serial
> Err:   serial
> Hit any key to stop autoboot:  0
> SF: Detected is25lp128 with page size 256 Bytes, erase size 64 KiB, total 16 MiB
> device 0 offset 0x100000, size 0x200000
> SF: 2097152 bytes @ 0x100000 Read: OK
> ## Booting kernel from Legacy Image at 40001000 ...
>   Image Name:   mainline kernel
>   Created:      2017-07-05  23:58:53 UTC
>   Image Type:   M68K Linux Kernel Image (uncompressed)
>   Data Size:    1642496 Bytes = 1.6 MiB
>   Load Address: 40001000
>   Entry Point:  40001000
>   Verifying Checksum ... OK
>   Loading Kernel Image ... OK
> [    0.000000] Linux version 4.10.0-rc2stmark2-001-00020-g0f64df301240 (angelo@jerusalem) (gcc version 4.9.0 (crosstools-sysam-2016.04.16) ) #16 Thu Jul 6 01:58:52 CEST 2017
> [    0.000000] uClinux with CPU COLDFIRE(m5441x)
> [    0.000000] COLDFIRE port done by Greg Ungerer, gerg@snapgear.com
> [    0.000000] Flat model support (C) 1998,1999 Kenneth Albanowski, D. Jeff Dionne
> [    0.000000] Built 1 zonelists in Zone order, mobility grouping on.  Total pages: 16320
> [    0.000000] Kernel command line: console=ttyS0,115200 root=/dev/mtdblock3 mtdparts=spi-flash.0:1m(u-boot),7m(kernel),-(rootfs) rw rootwait
> [    0.000000] PID hash table entries: 512 (order: -2, 2048 bytes)
> [    0.000000] Dentry cache hash table entries: 16384 (order: 3, 65536 bytes)
> [    0.000000] Inode-cache hash table entries: 8192 (order: 2, 32768 bytes)
> [    0.000000] Memory: 128664K/131072K available (1154K kernel code, 92K rwdata, 304K rodata, 48K init, 121K bss, 2408K reserved, 0K cma-reserved)
> [    0.000000] Virtual kernel memory layout:
> [    0.000000]     vector  : 0x40000000 - 0x40000400   (   1 KiB)
> [    0.000000]     kmap    : 0x00000000 - 0xffffffff   (4095 MiB)
> [    0.000000]     vmalloc : 0x00000000 - 0xfffff ----- Message truncated -----
> --
> To unsubscribe from this list: send the line "unsubscribe linux-m68k" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
