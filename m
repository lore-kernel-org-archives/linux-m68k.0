From: Greg Ungerer <gregungerer@westnet.com.au>
Subject: Re: mcf54415, spi nor and SD drivers
Date: Fri, 6 Oct 2017 14:04:12 +1000
Message-ID: <dc7ad189-0ddc-4852-1aba-9e6d0fba180b@westnet.com.au>
References: <ba371285-38b5-5744-c386-1721bdf25f95@gmail.com>
 <30ab985a-70e5-3ca0-3bb1-ace05dd4ebc2@westnet.com.au>
 <218c4625-2ba7-668e-f6e3-e4145c69c3b0@sysam.it>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from icp-osb-irony-out2.external.iinet.net.au ([203.59.1.155]:47491
        "EHLO icp-osb-irony-out2.external.iinet.net.au" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1750757AbdJFEEQ (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Fri, 6 Oct 2017 00:04:16 -0400
In-Reply-To: <218c4625-2ba7-668e-f6e3-e4145c69c3b0@sysam.it>
Content-Language: en-US
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Angelo Dureghello <angelo@sysam.it>, angelo <angelo70@gmail.com>, Linux/m68k <linux-m68k@vger.kernel.org>

Hi Angelo,

On 06/10/17 09:06, Angelo Dureghello wrote:
> jfyi, i finally have dspi working on mcf54415.
> 
> [    8.310000] m25p80 spi0.1: is25lp128 (16384 Kbytes)
> [    8.320000] Creating 3 MTD partitions on "is25lp128":
> [    8.330000] 0x000000000000-0x000000100000 : "U-Boot (1024K)"
> [    9.750000] ftl_cs: FTL header not found.
> [    9.800000] 0x000000100000-0x000000800000 : "Kernel+initramfs (7168K)"
> [   11.230000] ftl_cs: FTL header not found.
> [   11.270000] 0x000000800000-0x000001000000 : "Flash Free Space (8192K)"
> [   12.010000] random: crng init done
> [   12.710000] ftl_cs: FTL header not found.
> [   12.800000] Freeing unused kernel memory: 264K
> 
> 
> / # cat /proc/mtd
> dev:    size   erasesize  name
> mtd0: 00100000 00001000 "U-Boot (1024K)"
> mtd1: 00700000 00001000 "Kernel+initramfs (7168K)"
> mtd2: 00800000 00001000 "Flash Free Space (8192K)"
> / #

Nice work!

 
> Changes to spi-fsl-dspi.c driver is minimal, just mainly had to
> get some few settings from board c file.
> 
> Now the issue is how to proceed, likely, spi-list gouys would complain
> i add board/platform support to the driver.
> 
> Is it better i send a patch for this stmark2 board.c before ?

Sure, start with that. I don't mind if you send spi changes relevant to
the 54411 here either for review.

Regards
Greg



> Regards,
> Angelo Dureghello
> 
> On 06/07/2017 15:07, Greg Ungerer wrote:
>> Hi Angelo,
>>
>> On 06/07/17 18:36, angelo wrote:
>>> i designed here a new board with mcf54415. Testing a first mainline kernel.
>>> I would like to load a cramfs rootfs from SPI NOR (mtd, ftl) but actually
>>> i don't see the SPI NOR flash detected from dmesg.
>>>
>>> Next future step then would be load rootfs from SD.
>>>
>>> Seems there is no selectable driver for
>>>
>>> - SPI controller
>>> - SD (MMC) controller
>>>
>>> Those should be similar to existing drivers of some other freescale chip,
>>> or some new implementation is required ? Attaching dmesg.
>>
>> Most other ColdFire parts use the QSPI hardware module, and its driver
>> is at drivers/spi/spi-coldfire-qspi.c. But, looking at the hardware
>> reference manual for the mcf5441x family it contains a DSPI hardware
>> module - and it looks quite different.
>>
>> That DSPI module looks to be similar to the one in the Freescale iMX
>> parts, and its driver is at drivers/spi/spi-fsl-dspi.c. I don't know
>> that anyone has used that on ColdFire with the mcf5441x parts,
>> but that is where you should start I think.
>>
>> I haven't used any SD/MMC drivers on ColdFire so no advice on where
>> to look for that one.
>>
>> If you are feeling adventurous you may want to look at:
>>
>>    https://www.spinics.net/lists/linux-m68k/msg10057.html
>>
>> With a reasonably recent kernel you don't even need to generate a
>> different user space filesystem and binaries. You can run your flat
>> format non-MMU binaries on an MMU configured ColdFire system (as long
>> as you have CONFIG_BINFMT_FLAT=y in your kernel config). I would love
>> to be able to push this patch to mainline.
>>
>> Regards
>> Greg
>>
>>
>>
>>> Regards,
>>> Angelo Dureghello
>>>
>>>
>>> U-Boot 2017.05-00709-g9d9f074dfe-dirty (Jul 02 2017 - 19:50:16 +0200)
>>>
>>> CPU:   Freescale MCF54410 (Mask:9f Version:2)
>>>         CPU CLK 240 MHz BUS CLK 120 MHz FLB CLK 60 MHz
>>>         INP CLK 30 MHz VCO CLK 480 MHz
>>> SPI:   ready
>>> DRAM:  128 MiB
>>> SF: Detected is25lp128 with page size 256 Bytes, erase size 64 KiB, total 16 MiB
>>> In:    serial
>>> Out:   serial
>>> Err:   serial
>>> Hit any key to stop autoboot:  0
>>> SF: Detected is25lp128 with page size 256 Bytes, erase size 64 KiB, total 16 MiB
>>> device 0 offset 0x100000, size 0x200000
>>> SF: 2097152 bytes @ 0x100000 Read: OK
>>> ## Booting kernel from Legacy Image at 40001000 ...
>>>     Image Name:   mainline kernel
>>>     Created:      2017-07-05  23:58:53 UTC
>>>     Image Type:   M68K Linux Kernel Image (uncompressed)
>>>     Data Size:    1642496 Bytes = 1.6 MiB
>>>     Load Address: 40001000
>>>     Entry Point:  40001000
>>>     Verifying Checksum ... OK
>>>     Loading Kernel Image ... OK
>>> [    0.000000] Linux version 4.10.0-rc2stmark2-001-00020-g0f64df301240 (angelo@jerusalem) (gcc version 4.9.0 (crosstools-sysam-2016.04.16) ) #16 Thu Jul 6 01:58:52 CEST 2017
>>> [    0.000000] uClinux with CPU COLDFIRE(m5441x)
>>> [    0.000000] COLDFIRE port done by Greg Ungerer, gerg@snapgear.com
>>> [    0.000000] Flat model support (C) 1998,1999 Kenneth Albanowski, D. Jeff Dionne
>>> [    0.000000] Built 1 zonelists in Zone order, mobility grouping on. Total pages: 16320
>>> [    0.000000] Kernel command line: console=ttyS0,115200 root=/dev/mtdblock3 mtdparts=spi-flash.0:1m(u-boot),7m(kernel),-(rootfs) rw rootwait
>>> [    0.000000] PID hash table entries: 512 (order: -2, 2048 bytes)
>>> [    0.000000] Dentry cache hash table entries: 16384 (order: 3, 65536 bytes)
>>> [    0.000000] Inode-cache hash table entries: 8192 (order: 2, 32768 bytes)
>>> [    0.000000] Memory: 128664K/131072K available (1154K kernel code, 92K rwdata, 304K rodata, 48K init, 121K bss, 2408K reserved, 0K cma-reserved)
>>> [    0.000000] Virtual kernel memory layout:
>>> [    0.000000]     vector  : 0x40000000 - 0x40000400   (   1 KiB)
>>> [    0.000000]     kmap    : 0x00000000 - 0xffffffff   (4095 MiB)
>>> [    0.000000]     vmalloc : 0x00000000 - 0xfffff ----- Message truncated -----
>>> -- 
>>> To unsubscribe from this list: send the line "unsubscribe linux-m68k" in
>>> the body of a message to majordomo@vger.kernel.org
>>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>>
>>
> 
