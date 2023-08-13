Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6206DC001DB
	for <linux-m68k@archiver.kernel.org>; Sun, 13 Aug 2023 22:24:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230519AbjHMWYi (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sun, 13 Aug 2023 18:24:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230292AbjHMWYc (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sun, 13 Aug 2023 18:24:32 -0400
Received: from mail.sowerbutts.com (mail.sowerbutts.com [IPv6:2001:8b0:3b1:dead::100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35CEC18F
        for <linux-m68k@lists.linux-m68k.org>; Sun, 13 Aug 2023 15:24:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sowerbutts.com; s=igor; h=In-Reply-To:Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
        Sender:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=y6FDjDNKCY+8LwVMTsxFxggizXZUNjk6kaYlsOfgGYc=; b=Y5VuKLWeh7vH9L27i7yXjON/yr
        PL9wLLFumKEHNYctfao/6iHJHk8ZI8Rrrz3g+cpW2jhifz3RQO4+fYR+I4vXsj0Fe3tDkuaWKnv2P
        EgdWRIKb9/RiaEEg4kaCnM7wGeDPgbq1ODMdB6RexiK8Tmu/VJEQXP+AxCUD4zsrWC7CndW/AUrhL
        XKW2OEQPtvQ7DEqRmruDxGC11bUpEafM1c61ZmEJXXZdjL420U07JrSOiwhK9m+ySmdGFboyniyIG
        x9QIwJ58/Ea41LMXjXU8lN6ohRD3uBA9eie6U5sAS52qorqoXI0O7NPKDRFN5rqkVoJ2QlrjV+L4y
        EU/xApjw==;
Received: from [2001:8b0:3b1:cafe:2292:e7dd:dea3:4ff6] (helo=sowerbutts.com)
        by mail.sowerbutts.com with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.96)
        (envelope-from <will@sowerbutts.com>)
        id 1qVJVU-000Ezm-1g;
        Sun, 13 Aug 2023 23:24:20 +0100
Date:   Sun, 13 Aug 2023 23:24:20 +0100
From:   William R Sowerbutts <will@sowerbutts.com>
To:     Finn Thain <fthain@linux-m68k.org>
Cc:     Michael Schmitz <schmitzmic@gmail.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Richard Zidlicky <rz@linux-m68k.org>
Subject: Re: Linux 6.4.4 on m68k - Q40 - pata_falcon causes oops at boot time
Message-ID: <ZNlYFCVubNgzmUfc@sowerbutts.com>
References: <c47f07a9-d302-b8ce-c630-988e08cc8254@gmail.com>
 <ZL5jwoXAU5t8S+E6@sowerbutts.com>
 <d01db1e6-a0ae-559c-ab64-b3a2f5b60324@gmail.com>
 <997f0ff1-865d-29fb-ef65-2bb693549da8@linux-m68k.org>
 <288847c5-46bd-fcd4-11a7-829685a02c79@gmail.com>
 <521776cc-a11e-0a3a-b44d-fc051f6ee2ea@linux-m68k.org>
 <624c5629-e337-46ba-c8ac-411fe19f2f46@gmail.com>
 <81706cdc-2a7a-f383-881a-7313fefbb938@linux-m68k.org>
 <68187ca1-1d4f-92f9-f6c7-476caaa24df0@gmail.com>
 <275c3e98-a8e3-5d2a-13fa-db79ab9d6719@linux-m68k.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="HkIVYKf7Bd8oPSWa"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <275c3e98-a8e3-5d2a-13fa-db79ab9d6719@linux-m68k.org>
X-URL:  http://sowerbutts.com/
X-Hatstand: Voltron
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org


--HkIVYKf7Bd8oPSWa
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hello

Thank you for your interest and patience!

Sorry for the delay in providing more information.  The only method I had to 
transfer test kernels onto the Q40 was painfully slow and involved swapping 
ISA cards which is itself problematic as the pins in one of the ISA slots are 
breaking.

In the end I decided my best option was to dispose of the standard operating 
system (SMSQ/E) and write a new boot ROM for the machine with support for 
FAT32 filesystems on an IDE disk and TFTP transfers using an NE2000 card.
It's still in development but is now working well enough to use. The source 
code is at https://github.com/willsowerbutts/q40boot 

During the process I learned a bit more about the Q40 hardware, and 
transferring a kernel now takes 7 seconds instead of over 20 minutes.

I've run the various tests as requested;

* 5.13.19 -- IDE works (but the data on disk is byte-swapped, see below)

* 5.13.19+44b1fbc0f5f30e66a56d29575349f0b1ebe2b0ee -- IDE fails (crash)

* 5.14.21 -- IDE fails (crash)

* 6.4.10 + Michael's RFC patch -- IDE fails (no crash, but "Bad IO access")

* 6.4.10 + my patch -- IDE works, data on disk is NOT byte-swapped

Copies of the boot output for each kernel are attached to this email.

I've also attached the patch I am currently using on my Q40 kernel. It's 
based in part on Michael's patch. It bodges up "ioport_map" to apply the 
offset required to convert raw ISA address into "cookies" and thus allow the 
IDE to work without "Bad IO" complaints. To be crystal clear I am NOT 
proposing this as a solution, it's obviously a hack job, but I wanted to 
illustrate at least one way that *does* work on the Q40. 

I think one proper solution might involve enabling CONFIG_HAS_IOPORT_MAP but 
I've not yet looked properly into the implications of doing so. I'm very open 
to alternative solutions too.

As a side note, the NE2000 driver, which is also using 8- and 16-bit ISA I/O, 
works correctly with both 5.13 and 6.4. If one allows it to auto-probe the 
card's interrupt it locks up the machine due to limitations of the interrupt 
controller, but I understand this was always the case; I've made a tiny patch 
to ne.c to prevent it trying this.


On Tue, Jul 25, 2023 at 08:26:28AM +1200, Michael Schmitz wrote:
>Note that this also means that the address hardcoded for IDE may be 
>incorrect (AFAIR, IDE cards could have their IO base reassigned by 
>firmware).

The W83757 on my ISA IO card, and the W83787IF on the ISA IO card that 
shipped with the machine, are configurable only using jumpers. They can only 
use the two standard base addresses (0x1F0 or 0x170).


On Fri, Jul 28, 2023 at 9:52 AM Michael Schmitz <schmitzmic@gmail.com> wrote:
> Yes, but Q40 and Falcon are impossible to support any other way, and
> byte swapping the IDE interface in hardware was never repeated anywhere
> else, fortunately. We will have to keep pata_falcon around for that
> cause in any event.

I wonder if this is a misunderstanding about Q40 IDE.

The Q40 does not have an on-board IDE controller.  IDE is accessed via a 
common ISA PC Super-IO card.  When you do a 16-bit transfer from the ISA I/O 
address the data comes out backwards and the CPU needs to byteswap it.

I found it interesting and quite unexpected that 5.13 read data from the IDE 
drive byte-swapped.  I had prepared a drive for the machine with an MBR 
partition table and an ext4 filesystem but the kernel did not recognise 
either.  After a while I realised I had to byte swap the entire drive with 
'dd conv=swab', and then it worked.

For my 6.4 patch I enabled byte swapping in the pata_falcon_data_xfer() 
function -- this allows me to use an IDE drive with everything in the 
normal/compatible byte ordering, which makes life much easier. I assume this 
is the intended behaviour.

I wonder if any existing Q40 users are actually storing all the data on their 
drives byte-swapped just to avoid the overhead of byte-swapping on every
read/write. I suppose this would work just fine until you need to connect 
that drive to another machine.

For my Q40boot ROM I wrote an IDE driver. It just treats the IDE interface as 
a regular legacy PC style IDE interface (which is exactly what it is!) plus 
byte swapping of 16-bit transfers. See the functions q40_ide_read_sector_data 
and q40_ide_write_sector_data in the IDE driver (q40ide.c, q40isa.h in the 
q40boot github repository linked above).

I am going to look at the pata_legacy driver and see if it might be usable on 
the Q40 instead of pata_falcon.

As a long term fix I think I need to read up on CONFIG_HAS_IOPORT_MAP to try 
and understand how I might enable this.  I expect enabling it will have
implications for all M68K machines, so maybe someone with more experience 
should be making that decision.

I would be very happy to run further tests or to rewrite my hacky patch in 
response to pointers on how to improve it.

Thanks

Will



On Sun, Aug 13, 2023 at 05:38:00PM +1000, Finn Thain wrote:
>Michael, William,
>
>On Sun, 13 Aug 2023, Michael Schmitz wrote:
>
>> Am 28.07.23 um 11:47 schrieb Finn Thain:
>> > On Thu, 27 Jul 2023, Michael Schmitz wrote:
>> >
>> >>>> And yes, I'm painfully aware the m68k low level IO code is becoming 
>> >>>> a bit of a maintainance legacy, in no small part due to my hacks 
>> >>>> around Atari EtherNEC.
>> >>>>
>> >>> I guess you and I both can share the blame for 44b1fbc0f5f30e66...
>> >>>
>> >>> Anyway, you make a good point about on-going maintenance. Do you 
>> >>> think that by supporting standard ISA drivers we might actually 
>> >>> reduce the ideosyncracies in m68k IO code?
>> >> You and DaveM ought to have a chat about that - abstracting the 
>> >> legacy drivers from the ISA constraints was his preferred option when 
>> >> I last attempted to get the Gayle network driver patches merged. When 
>> >> I say 'preferred', I'm probably understating a little.
>> >>
>> > A discussion with maintainers probably won't get far without working 
>> > code to look at. Perhaps William will send an RFC patch to illustrate 
>> > his approach.
>> 
>> Haven't seen anything yet, so I've just sent a patch switching 
>> pata_falcon.c to use the IO resources instead of the memory resources.
>
>Thanks for sending that.
>
>> Survived compile and ARAnyM boot tests only so far. I've checked and 
>> confirmed the entire 0xffxxxxx range is mapped transparent in head.S for 
>> Q40 so I don't see what else might be missing.
>> 
>
>In the message that Geert originally forwarded, William was quoted as 
>saying it was necessary to "fix up the pata_falcon_data_xfer function". He 
>also said that using the IO port resources "causes the ioread8/iowrite8 
>functions to complain loudly". 
>https://lore.kernel.org/linux-m68k/CAMuHMdUU62jjunJh9cqSqHT87B0H0A4udOOPs=WN7WZKpcagVA@mail.gmail.com/
>
>I think your patch is taking the same approach and may run into the same 
>issues... I guess we shall see when William tests it.
>
>> Please have a look and test if possible. Haven't yet bothered 
>> linux-block or linux-ide... the patch still needs a Fixes: and other 
>> trimmings so isn't ready for submission anyway.
>> 
>
>Right. You'll want to run checkpatch.pl on it at some stage.

_________________________________________________________________________
William R Sowerbutts                                  will@sowerbutts.com
"Carpe post meridiem"                               http://sowerbutts.com
         main(){char*s=">#=0> ^#X@#@^7=",c=0,m;for(;c<15;c++)for
         (m=-1;m<7;putchar(m++/6&c%3/2?10:s[c]-31&1<<m?42:32));}  


--HkIVYKf7Bd8oPSWa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="linux-5.13.19"

1:/> vmlinux-5.13.19 console=ttyS0,115200n8 netdev=5,0x300,eth0
vmlinux-5.13.19: 6023848 bytes, ELF.
Loading 4279392 bytes from file offset 0x1000 to memory at 0x41000
Loading 106716 bytes from file offset 0x416000 to memory at 0x478000
Linux kernel detected: creating bootinfo at 0x493000
Entry at 0x42000 in supervisor mode
[    0.000000] Linux version 5.13.19-wrs (btg@carbon) (m68k-linux-gnu-gcc (Debian 12.2.0-13) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40) #1 Sun Aug 13 21:47:28 BST 2023
[    0.000000] Zone ranges:
[    0.000000]   DMA      [mem 0x0000000000040000-0x0000001fffffffff]
[    0.000000]   Normal   empty
[    0.000000] Movable zone start for each node
[    0.000000] Early memory node ranges
[    0.000000]   node   0: [mem 0x0000000000040000-0x0000000001ffffff]
[    0.000000] Initmem setup node 0 [mem 0x0000000000040000-0x0000000001ffffff]
[    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 8056
[    0.000000] Kernel command line: console=ttyS0,115200n8 netdev=5,0x300,eth0
[    0.000000] Dentry cache hash table entries: 4096 (order: 2, 16384 bytes, linear)
[    0.000000] Inode-cache hash table entries: 2048 (order: 1, 8192 bytes, linear)
[    0.000000] Sorting __ex_table...
[    0.000000] mem auto-init: stack:off, heap alloc:off, heap free:off
[    0.000000] Memory: 27696K/32512K available (2996K kernel code, 449K rwdata, 860K rodata, 108K init, 133K bss, 4816K reserved, 0K cma-reserved)
[    0.000000] NR_IRQS: 43
[    0.010000] Console: colour dummy device 80x25
[    0.080000] printk: console [ttyS0] enabled
[    0.090000] Calibrating delay loop... 26.16 BogoMIPS (lpj=130816)
[    0.200000] pid_max: default: 32768 minimum: 301
[    0.210000] Mount-cache hash table entries: 1024 (order: 0, 4096 bytes, linear)
[    0.220000] Mountpoint-cache hash table entries: 1024 (order: 0, 4096 bytes, linear)
[    0.260000] devtmpfs: initialized
[    0.280000] random: get_random_u32 called from bucket_table_alloc.isra.0+0xe0/0xf8 with crng_init=0
[    0.290000] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 19112604462750000 ns
[    0.300000] futex hash table entries: 256 (order: -1, 3072 bytes, linear)
[    0.310000] NET: Registered protocol family 16
[    0.320000] DMA: preallocated 128 KiB GFP_KERNEL pool for atomic allocations
[    0.330000] DMA: preallocated 128 KiB GFP_KERNEL|GFP_DMA pool for atomic allocations
[    0.480000] wait_for_initramfs() called before rootfs_initcalls
[    0.520000] SCSI subsystem initialized
[    0.780000] NET: Registered protocol family 2
[    0.790000] IP idents hash table entries: 2048 (order: 2, 16384 bytes, linear)
[    0.810000] tcp_listen_portaddr_hash hash table entries: 512 (order: 0, 4096 bytes, linear)
[    0.820000] TCP established hash table entries: 1024 (order: 0, 4096 bytes, linear)
[    0.820000] TCP bind hash table entries: 1024 (order: 0, 4096 bytes, linear)
[    0.830000] TCP: Hash tables configured (established 1024 bind 1024)
[    0.840000] UDP hash table entries: 256 (order: 0, 4096 bytes, linear)
[    0.840000] UDP-Lite hash table entries: 256 (order: 0, 4096 bytes, linear)
[    0.850000] NET: Registered protocol family 1
[    0.870000] workingset: timestamp_bits=30 max_order=13 bucket_order=0
[    0.910000] fb0: Q40 frame buffer alive and kicking !
[    0.920000] Serial: 8250/16550 driver, 8 ports, IRQ sharing disabled
[    0.930000] serial8250: ttyS0 at I/O 0x3f8 (irq = 4, base_baud = 115200) is a 16450
[    0.940000] serial8250: ttyS1 at I/O 0x2f8 (irq = 3, base_baud = 115200) is a 16450
[    1.120000] loop: module loaded
[    1.120000] Uniform Multi-Platform E-IDE driver
[    1.130000] ide: Q40 IDE controller
[    1.130000] legacy IDE will be removed in 2021, please switch to libata
[    1.130000] Report any missing HW support to linux-ide@vger.kernel.org
[    1.280000] random: fast init done
[    1.500000] hda: InnoDisk Corp. - iCF4000 2GB, CFA DISK drive
[    1.930000] hdb: SDCFHS-016G, CFA DISK drive
[    2.640000] ide0 at 0xff4007c0 on irq 14
[    2.650000] ide1 at 0xff4005c0 on irq 15
[    2.660000] ide-gd driver 1.18
[    2.670000] hda: max request size: 128KiB
[    2.670000] hda: 4095504 sectors (2096 MB) w/1KiB Cache, CHS=4063/16/63
[    2.720000] hda: cache flushes supported
[    2.760000] hdb: max request size: 1024KiB
[    2.770000] hdb: 31293360 sectors (16022 MB) w/1KiB Cache, CHS=31045/255/63
[    2.930000] ne ne.0 (unnamed net_device) (uninitialized): NE*000 ethercard probe at 0x300:
[    2.940000] 00:00:e8:cf:2e:39
[    2.960000] ne ne.0 eth0: RTL8019 found at 0x300, using IRQ 5.
[    2.980000] PPP generic driver version 2.4.2
[    2.990000] serio: Q40 kbd registered
[    3.010000] NET: Registered protocol family 10
[    3.030000] input: AT Raw Set 2 keyboard as /devices/platform/q40kbd/serio0/input/input0
[    3.050000] Segment Routing with IPv6
[    3.070000] VFS: Cannot open root device "(null)" or unknown-block(0,0): error -6
[    3.080000] Please append a correct "root=" boot option; here are the available partitions:
[    3.090000] 0300         2047752 hda 
[    3.090000]  driver: ide-gd
[    3.100000] 0340        15646680 hdb 
[    3.100000]  driver: ide-gd
[    3.110000] Kernel panic - not syncing: VFS: Unable to mount root fs on unknown-block(0,0)
[    3.110000] CPU: 0 PID: 1 Comm: swapper Not tainted 5.13.19-wrs #1
[    3.110000] Stack from 007d9f0c:
[    3.110000]         007d9f0c 00375e52 00375e52 002e60aa 00000000 00008001 004731ac 002e66d6
[    3.110000]         fffffffa 00993000 007d9f78 00439768 0036c5a6 007d9f78 0036c555 0036c522
[    3.110000]         00000000 007d9f78 fffffffa 00000000 0000000c 0001f9c4 00009248 002e8f10
[    3.110000]         00000000 00000000 00000000 756e6b6e 6f776e2d 626c6f63 6b28302c 302900c0
[    3.110000]         00bc8280 004397fc 0036c60a 00439826 0036c60a 00008001 00000000 0044e028
[    3.110000]         0043999a 002e8f10 00000000 00000000 002e8f18 002e8f10 0000289c 00000000
[    3.110000] Call Trace: [<002e60aa>] panic+0xc2/0x250
[    3.110000]  [<00008001>] t_avoid_unsupp+0x17/0x46
[    3.110000]  [<002e66d6>] printk+0x0/0x18
[    3.110000]  [<00439768>] mount_block_root+0x224/0x278
[    3.110000]  [<0001f9c4>] prctl_set_mm+0x1ea/0x490
[    3.110000]  [<00009248>] dp+0x8/0x2c
[    3.110000]  [<002e8f10>] kernel_init+0x0/0xd8
[    3.110000]  [<004397fc>] mount_root+0x40/0x72
[    3.110000]  [<00439826>] mount_root+0x6a/0x72
[    3.110000]  [<00008001>] t_avoid_unsupp+0x17/0x46
[    3.110000]  [<0043999a>] prepare_namespace+0x16c/0x17a
[    3.110000]  [<002e8f10>] kernel_init+0x0/0xd8
[    3.110000]  [<002e8f18>] kernel_init+0x8/0xd8
[    3.110000]  [<002e8f10>] kernel_init+0x0/0xd8
[    3.110000]  [<0000289c>] ret_from_kernel_thread+0xc/0x14
[    3.110000] 
[    3.110000] ---[ end Kernel panic - not syncing: VFS: Unable to mount root fs on unknown-block(0,0) ]---

--HkIVYKf7Bd8oPSWa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="linux-5.13.19+44b1f"

1:/> vmlinux-5.13.19-44b1f console=ttyS0,115200n8 netdev=5,0x300,eth0
vmlinux-5.13.19-44b1f: 6025404 bytes, ELF.
Loading 4280032 bytes from file offset 0x1000 to memory at 0x41000
Loading 107708 bytes from file offset 0x416000 to memory at 0x478000
Linux kernel detected: creating bootinfo at 0x493000
Entry at 0x42000 in supervisor mode
[    0.000000] Linux version 5.13.19-wrs (btg@carbon) (m68k-linux-gnu-gcc (Debian 12.2.0-13) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40) #2 Sun Aug 13 21:52:42 BST 2023
[    0.000000] Zone ranges:
[    0.000000]   DMA      [mem 0x0000000000040000-0x0000001fffffffff]
[    0.000000]   Normal   empty
[    0.000000] Movable zone start for each node
[    0.000000] Early memory node ranges
[    0.000000]   node   0: [mem 0x0000000000040000-0x0000000001ffffff]
[    0.000000] Initmem setup node 0 [mem 0x0000000000040000-0x0000000001ffffff]
[    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 8056
[    0.000000] Kernel command line: console=ttyS0,115200n8 netdev=5,0x300,eth0
[    0.000000] Dentry cache hash table entries: 4096 (order: 2, 16384 bytes, linear)
[    0.000000] Inode-cache hash table entries: 2048 (order: 1, 8192 bytes, linear)
[    0.000000] Sorting __ex_table...
[    0.000000] mem auto-init: stack:off, heap alloc:off, heap free:off
[    0.000000] Memory: 27696K/32512K available (2996K kernel code, 448K rwdata, 860K rodata, 108K init, 132K bss, 4816K reserved, 0K cma-reserved)
[    0.000000] NR_IRQS: 43
[    0.010000] Console: colour dummy device 80x25
[    0.090000] printk: console [ttyS0] enabled
[    0.090000] Calibrating delay loop... 26.16 BogoMIPS (lpj=130816)
[    0.200000] pid_max: default: 32768 minimum: 301
[    0.210000] Mount-cache hash table entries: 1024 (order: 0, 4096 bytes, linear)
[    0.220000] Mountpoint-cache hash table entries: 1024 (order: 0, 4096 bytes, linear)
[    0.260000] devtmpfs: initialized
[    0.280000] random: get_random_u32 called from bucket_table_alloc.isra.0+0xe0/0xf8 with crng_init=0
[    0.290000] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 19112604462750000 ns
[    0.300000] futex hash table entries: 256 (order: -1, 3072 bytes, linear)
[    0.310000] NET: Registered protocol family 16
[    0.320000] DMA: preallocated 128 KiB GFP_KERNEL pool for atomic allocations
[    0.320000] DMA: preallocated 128 KiB GFP_KERNEL|GFP_DMA pool for atomic allocations
[    0.480000] wait_for_initramfs() called before rootfs_initcalls
[    0.520000] SCSI subsystem initialized
[    0.780000] NET: Registered protocol family 2
[    0.790000] IP idents hash table entries: 2048 (order: 2, 16384 bytes, linear)
[    0.810000] tcp_listen_portaddr_hash hash table entries: 512 (order: 0, 4096 bytes, linear)
[    0.810000] TCP established hash table entries: 1024 (order: 0, 4096 bytes, linear)
[    0.820000] TCP bind hash table entries: 1024 (order: 0, 4096 bytes, linear)
[    0.820000] TCP: Hash tables configured (established 1024 bind 1024)
[    0.830000] UDP hash table entries: 256 (order: 0, 4096 bytes, linear)
[    0.840000] UDP-Lite hash table entries: 256 (order: 0, 4096 bytes, linear)
[    0.840000] NET: Registered protocol family 1
[    0.870000] workingset: timestamp_bits=30 max_order=13 bucket_order=0
[    0.900000] fb0: Q40 frame buffer alive and kicking !
[    0.910000] Serial: 8250/16550 driver, 8 ports, IRQ sharing disabled
[    0.920000] serial8250: ttyS0 at I/O 0x3f8 (irq = 4, base_baud = 115200) is a 16450
[    0.930000] serial8250: ttyS1 at I/O 0x2f8 (irq = 3, base_baud = 115200) is a 16450
[    1.110000] loop: module loaded
[    1.110000] Uniform Multi-Platform E-IDE driver
[    1.120000] atari-falcon-ide atari-falcon-ide.0: Atari Falcon and Q40/Q60 IDE controller
[    1.120000] atari-falcon-ide atari-falcon-ide.0: resources busy
[    1.130000] atari-falcon-ide: probe of atari-falcon-ide.0 failed with error -16
[    1.140000] atari-falcon-ide atari-falcon-ide.1: Atari Falcon and Q40/Q60 IDE controller
[    1.140000] atari-falcon-ide atari-falcon-ide.1: resources busy
[    1.150000] atari-falcon-ide: probe of atari-falcon-ide.1 failed with error -16
[    1.150000] ide-gd driver 1.18
[    1.160000] atari-falcon-ide atari-falcon-ide.0: Atari Falcon and Q40/Q60 PATA controller
[    1.170000] Unable to handle kernel access at virtual address (ptrval)
[    1.170000] Oops: 00000000
[    1.170000] Modules linked in:
[    1.170000] PC: [<00195c0e>] iowrite8+0x1c/0x46
[    1.170000] SR: 2710  SP: (ptrval)  a2: 007d7aa0
[    1.170000] d0: fc803f65    d1: 0000000a    d2: 00002000    d3: 00000000
[    1.170000] d4: 00000000    d5: 002030ca    a0: fc803f65    a1: 008dc000
[    1.170000] Process swapper (pid: 1, task=(ptrval))
[    1.170000] Frame format=7 eff addr=007d9df4 ssw=04a5 faddr=fc803f65
[    1.170000] wb 1 stat/addr/data: 0005 ff400fd8 09ffffff
[    1.170000] wb 2 stat/addr/data: 00a5 fc803f65 0000000a
[    1.170000] wb 3 stat/addr/data: 0025 fc803f65 0000000a
[    1.170000] push data: 09ffffff 2010ffff 00000050 007fa700
[    1.170000] Stack from 007d9dac:
[    1.170000]         00202364 0000000a ff400fd9 008dc000 001fd94e 008dc000 0093fec0 001fdd4a
[    1.170000]         008dc000 00000001 001f5e94 008dc000 001d56e6 0000000e 0040ecb8 0093fec0
[    1.170000]         001fd8ac 00807000 0093fec0 001f60b0 0093fec0 001d56e6 007fa700 00000000
[    1.170000]         000275d6 00002098 008dc000 001fd8ac 00807000 00446e44 0093fec0 0000000e
[    1.170000]         002030ca 00000080 0040ecb8 00000000 00000000 0080700a 0040eb84 00431ad0
[    1.170000]         007d9f8c 001d5c98 00807000 0080700a 0040eb84 001d4666 0080700a 00000000
[    1.170000] Call Trace: [<00202364>] ata_sff_freeze+0x34/0x5c
[    1.170000]  [<001fd94e>] __ata_port_freeze+0x3a/0x46
[    1.170000]  [<001fdd4a>] ata_eh_freeze_port+0x1c/0x24
[    1.170000]  [<001f5e94>] ata_host_start+0x10c/0x12a
[    1.170000]  [<001d56e6>] platform_get_resource+0x0/0x48
[    1.170000]  [<001fd8ac>] ata_port_desc+0x0/0x68
[    1.170000]  [<001f60b0>] ata_host_activate+0x20/0xf8
[    1.170000]  [<001d56e6>] platform_get_resource+0x0/0x48
[    1.170000]  [<000275d6>] parse_args+0x0/0x264
[    1.170000]  [<00002098>] do_one_initcall+0x0/0x150
[    1.170000]  [<001fd8ac>] ata_port_desc+0x0/0x68
[    1.170000]  [<00446e44>] pata_falcon_init_one+0x1f8/0x206
[    1.170000]  [<002030ca>] ata_sff_interrupt+0x0/0x144
[    1.170000]  [<001d5c98>] platform_probe+0x22/0x4e
[    1.170000]  [<001d4666>] really_probe+0x1b2/0x2b4
[    1.170000]  [<001a673e>] strcpy+0x0/0x1c
[    1.170000]  [<001d49d8>] device_driver_attach+0x2e/0x4a
[    1.170000]  [<001d4a98>] __driver_attach+0xa4/0xa8
[    1.170000]  [<001d2d28>] next_device+0x0/0x18
[    1.170000]  [<001d2d9a>] bus_for_each_dev+0x5a/0x78
[    1.170000]  [<001d4022>] driver_attach+0x16/0x1c
[    1.170000]  [<001d49f4>] __driver_attach+0x0/0xa8
[    1.170000]  [<001d3c76>] bus_add_driver+0x15e/0x188
[    1.170000]  [<001d4f7e>] driver_register+0x94/0xcc
[    1.170000]  [<001d5b6e>] __platform_driver_probe+0x62/0x8e
[    1.170000]  [<00446c34>] pata_falcon_driver_init+0x0/0x18
[    1.170000]  [<00446c46>] pata_falcon_driver_init+0x12/0x18
[    1.170000]  [<00446c4c>] pata_falcon_init_one+0x0/0x206
[    1.170000]  [<000020f2>] do_one_initcall+0x5a/0x150
[    1.170000]  [<001a673e>] strcpy+0x0/0x1c
[    1.170000]  [<000275d6>] parse_args+0x0/0x264
[    1.170000]  [<00002098>] do_one_initcall+0x0/0x150
[    1.170000]  [<00060006>] do_misc_fixups+0x24/0x5f8
[    1.170000]  [<00439416>] kernel_init_freeable+0x154/0x1ac
[    1.170000]  [<00439464>] kernel_init_freeable+0x1a2/0x1ac
[    1.170000]  [<00446c34>] pata_falcon_driver_init+0x0/0x18
[    1.170000]  [<0001f9c4>] prctl_set_mm+0x1ea/0x490
[    1.170000]  [<00009248>] dp+0x8/0x2c
[    1.170000]  [<002e91d8>] kernel_init+0x0/0xd8
[    1.170000]  [<002e91e0>] kernel_init+0x8/0xd8
[    1.170000]  [<002e91d8>] kernel_init+0x0/0xd8
[    1.170000]  [<0000289c>] ret_from_kernel_thread+0xc/0x14
[    1.170000] 
[    1.170000] Code: 0000 650e e588 0680 ff80 0001 2040 1081 <4e75> 0c80 0001 0000 6310 0280 0000 ffff e588 0680 ff40 0001 60e2 2f7c 0038 b5fb
[    1.170000] Disabling lock debugging due to kernel taint
[    1.170000] Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
[    1.170000] ---[ end Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b ]---


--HkIVYKf7Bd8oPSWa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="linux-5.14.21"

1:/> vmlinux-5.14.21 console=ttyS0,115200n8 netdev=5,0x300,eth0
vmlinux-5.14.21: 5979196 bytes, ELF.
Loading 4247168 bytes from file offset 0x1000 to memory at 0x41000
Loading 107324 bytes from file offset 0x40E000 to memory at 0x470000
Linux kernel detected: creating bootinfo at 0x48B000
Entry at 0x42000 in supervisor mode
[    0.000000] Linux version 5.14.21-wrs (btg@carbon) (m68k-linux-gnu-gcc (Debian 12.2.0-13) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40) #1 Sun Aug 13 21:54:11 BST 2023
[    0.000000] Zone ranges:
[    0.000000]   DMA      [mem 0x0000000000040000-0x0000001fffffffff]
[    0.000000]   Normal   empty
[    0.000000] Movable zone start for each node
[    0.000000] Early memory node ranges
[    0.000000]   node   0: [mem 0x0000000000040000-0x0000000001ffffff]
[    0.000000] Initmem setup node 0 [mem 0x0000000000040000-0x0000000001ffffff]
[    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 8056
[    0.000000] Kernel command line: console=ttyS0,115200n8 netdev=5,0x300,eth0
[    0.000000] Dentry cache hash table entries: 4096 (order: 2, 16384 bytes, linear)
[    0.000000] Inode-cache hash table entries: 2048 (order: 1, 8192 bytes, linear)
[    0.000000] Sorting __ex_table...
[    0.000000] mem auto-init: stack:off, heap alloc:off, heap free:off
[    0.000000] Memory: 27728K/32512K available (2972K kernel code, 449K rwdata, 852K rodata, 108K init, 133K bss, 4784K reserved, 0K cma-reserved)
[    0.000000] NR_IRQS: 43
[    0.010000] Console: colour dummy device 80x25
[    0.090000] printk: console [ttyS0] enabled
[    0.090000] Calibrating delay loop... 26.16 BogoMIPS (lpj=130816)
[    0.200000] pid_max: default: 32768 minimum: 301
[    0.210000] Mount-cache hash table entries: 1024 (order: 0, 4096 bytes, linear)
[    0.220000] Mountpoint-cache hash table entries: 1024 (order: 0, 4096 bytes, linear)
[    0.260000] devtmpfs: initialized
[    0.280000] random: get_random_u32 called from bucket_table_alloc.isra.0+0xe0/0xf8 with crng_init=0
[    0.290000] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 19112604462750000 ns
[    0.300000] futex hash table entries: 256 (order: -1, 3072 bytes, linear)
[    0.310000] NET: Registered PF_NETLINK/PF_ROUTE protocol family
[    0.310000] DMA: preallocated 128 KiB GFP_KERNEL pool for atomic allocations
[    0.320000] DMA: preallocated 128 KiB GFP_KERNEL|GFP_DMA pool for atomic allocations
[    0.490000] SCSI subsystem initialized
[    0.750000] NET: Registered PF_INET protocol family
[    0.760000] IP idents hash table entries: 2048 (order: 2, 16384 bytes, linear)
[    0.780000] tcp_listen_portaddr_hash hash table entries: 512 (order: 0, 4096 bytes, linear)
[    0.780000] TCP established hash table entries: 1024 (order: 0, 4096 bytes, linear)
[    0.790000] TCP bind hash table entries: 1024 (order: 0, 4096 bytes, linear)
[    0.790000] TCP: Hash tables configured (established 1024 bind 1024)
[    0.800000] UDP hash table entries: 256 (order: 0, 4096 bytes, linear)
[    0.800000] UDP-Lite hash table entries: 256 (order: 0, 4096 bytes, linear)
[    0.810000] NET: Registered PF_UNIX/PF_LOCAL protocol family
[    0.840000] workingset: timestamp_bits=30 max_order=13 bucket_order=0
[    0.870000] fb0: Q40 frame buffer alive and kicking !
[    0.880000] Serial: 8250/16550 driver, 8 ports, IRQ sharing disabled
[    0.890000] serial8250: ttyS0 at I/O 0x3f8 (irq = 4, base_baud = 115200) is a 16450
[    0.900000] serial8250: ttyS1 at I/O 0x2f8 (irq = 3, base_baud = 115200) is a 16450
[    1.070000] loop: module loaded
[    1.080000] atari-falcon-ide atari-falcon-ide.0: Atari Falcon and Q40/Q60 PATA controller
[    1.090000] Unable to handle kernel access at virtual address (ptrval)
[    1.090000] Oops: 00000000
[    1.090000] Modules linked in:
[    1.090000] PC: [<00196bf6>] iowrite8+0x1c/0x46
[    1.090000] SR: 2710  SP: (ptrval)  a2: 007d7aa0
[    1.090000] d0: fc803f65    d1: 0000000a    d2: 00002000    d3: 00000000
[    1.090000] d4: 00000000    d5: 001fbf80    a0: fc803f65    a1: 008d8000
[    1.090000] Process swapper (pid: 1, task=(ptrval))
[    1.090000] Frame format=7 eff addr=007d9de8 ssw=04a5 faddr=fc803f65
[    1.090000] wb 1 stat/addr/data: 0005 ff400fd8 09ffffff
[    1.090000] wb 2 stat/addr/data: 00a5 fc803f65 0000000a
[    1.090000] wb 3 stat/addr/data: 0025 fc803f65 0000000a
[    1.090000] push data: 09ffffff 2010ffff 00000050 007fa700
[    1.090000] Stack from 007d9da0:
[    1.090000]         001fb246 0000000a ff400fd9 008d8000 001f685e 008d8000 008ecf00 001f6c5a
[    1.090000]         008d8000 00000001 001eea6c 008d8000 001d5cf2 0000000e 00406afc 008ecf00
[    1.090000]         001f67bc 00807000 008ecf00 001ef00c 008ecf00 001d5cf2 007fa700 00000000
[    1.090000]         000275ce 00002098 008d8000 001f67bc 00807000 0043ec4c 008ecf00 0000000e
[    1.090000]         001fbf80 00000080 00406afc 00000000 0080700a 0080700a 004069c8 004055e8
[    1.090000]         007d9f88 001d6350 00807000 0080700a 004069c8 001d4bc2 0080700a 00000000
[    1.090000] Call Trace: [<001fb246>] ata_sff_freeze+0x34/0x5c
[    1.090000]  [<001f685e>] __ata_port_freeze+0x3a/0x46
[    1.090000]  [<001f6c5a>] ata_eh_freeze_port+0x1c/0x24
[    1.090000]  [<001eea6c>] ata_host_start+0x112/0x130
[    1.090000]  [<001d5cf2>] platform_get_resource+0x0/0x48
[    1.090000]  [<001f67bc>] ata_port_desc+0x0/0x68
[    1.090000]  [<001ef00c>] ata_host_activate+0x20/0xf8
[    1.090000]  [<001d5cf2>] platform_get_resource+0x0/0x48
[    1.090000]  [<000275ce>] parse_args+0x0/0x264
[    1.090000]  [<00002098>] do_one_initcall+0x0/0x150
[    1.090000]  [<001f67bc>] ata_port_desc+0x0/0x68
[    1.090000]  [<0043ec4c>] pata_falcon_init_one+0x1f8/0x206
[    1.090000]  [<001fbf80>] ata_sff_interrupt+0x0/0x144
[    1.090000]  [<001d6350>] platform_probe+0x22/0x4e
[    1.090000]  [<001d4bc2>] really_probe+0x12a/0x248
[    1.090000]  [<001d4d6c>] driver_probe_device+0x20/0x76
[    1.090000]  [<001a6d7e>] strcpy+0x0/0x1c
[    1.090000]  [<001d5088>] __driver_attach+0xac/0xbc
[    1.090000]  [<001d3318>] next_device+0x0/0x18
[    1.090000]  [<001d338a>] bus_for_each_dev+0x5a/0x78
[    1.090000]  [<001d4606>] driver_attach+0x16/0x1c
[    1.090000]  [<001d4fdc>] __driver_attach+0x0/0xbc
[    1.090000]  [<001d425a>] bus_add_driver+0x15e/0x188
[    1.090000]  [<001d558a>] driver_register+0x94/0xcc
[    1.090000]  [<001d6226>] __platform_driver_probe+0x62/0x8e
[    1.090000]  [<0043ea3c>] pata_falcon_driver_init+0x0/0x18
[    1.090000]  [<0043ea4e>] pata_falcon_driver_init+0x12/0x18
[    1.090000]  [<0043ea54>] pata_falcon_init_one+0x0/0x206
[    1.090000]  [<000020f2>] do_one_initcall+0x5a/0x150
[    1.090000]  [<001a6d7e>] strcpy+0x0/0x1c
[    1.090000]  [<000275ce>] parse_args+0x0/0x264
[    1.090000]  [<00002098>] do_one_initcall+0x0/0x150
[    1.090000]  [<00060006>] check_cond_jmp_op+0x954/0xa88
[    1.090000]  [<00431510>] kernel_init_freeable+0x13c/0x194
[    1.090000]  [<0043155e>] kernel_init_freeable+0x18a/0x194
[    1.090000]  [<0043ea3c>] pata_falcon_driver_init+0x0/0x18
[    1.090000]  [<00009248>] dp+0xc/0x2c
[    1.090000]  [<002e30b6>] kernel_init+0x0/0xe4
[    1.090000]  [<002e30ca>] kernel_init+0x14/0xe4
[    1.090000]  [<002e30b6>] kernel_init+0x0/0xe4
[    1.090000]  [<00002880>] ret_from_kernel_thread+0xc/0x14
[    1.090000] 
[    1.090000] Code: 0000 650e e588 0680 ff80 0001 2040 1081 <4e75> 0c80 0001 0000 6310 0280 0000 ffff e588 0680 ff40 0001 60e2 2f7c 0038 38c8
[    1.090000] Disabling lock debugging due to kernel taint
[    1.090000] Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
[    1.090000] ---[ end Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b ]---

--HkIVYKf7Bd8oPSWa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="linux-6.4.10+michael-rfc"

1:/> vmlinux-6.4.10+rfc console=ttyS0,115200n8 netdev=5,0x300,eth0
vmlinux-6.4.10+rfc: 6482976 bytes, ELF.
Loading 4637888 bytes from file offset 0x1000 to memory at 0x41000
Loading 120996 bytes from file offset 0x46E000 to memory at 0x4CE000
Linux kernel detected: creating bootinfo at 0x4EC000
Entry at 0x42000 in supervisor mode
[    0.000000] Linux version 6.4.10-wrs (btg@carbon) (m68k-linux-gnu-gcc (Debian 12.2.0-13) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40) #1 Sun Aug 13 22:05:38 BST 2023
[    0.000000] Zone ranges:
[    0.000000]   DMA      [mem 0x0000000000040000-0x0000001fffffffff]
[    0.000000]   Normal   empty
[    0.000000] Movable zone start for each node
[    0.000000] Early memory node ranges
[    0.000000]   node   0: [mem 0x0000000000040000-0x0000000001ffffff]
[    0.000000] Initmem setup node 0 [mem 0x0000000000040000-0x0000000001ffffff]
[    0.000000] Kernel command line: console=ttyS0,115200n8 netdev=5,0x300,eth0
[    0.000000] Dentry cache hash table entries: 4096 (order: 2, 16384 bytes, linear)
[    0.000000] Inode-cache hash table entries: 2048 (order: 1, 8192 bytes, linear)
[    0.000000] Sorting __ex_table...
[    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 8056
[    0.000000] mem auto-init: stack:off, heap alloc:off, heap free:off
[    0.000000] Memory: 27340K/32512K available (3220K kernel code, 442K rwdata, 988K rodata, 120K init, 129K bss, 5172K reserved, 0K cma-reserved)
[    0.000000] NR_IRQS: 43
[    0.010000] Console: colour dummy device 80x25
[    0.010000] printk: console [ttyS0] enabled
[    0.090000] Calibrating delay loop... 26.16 BogoMIPS (lpj=130816)
[    0.200000] pid_max: default: 32768 minimum: 301
[    0.210000] Mount-cache hash table entries: 1024 (order: 0, 4096 bytes, linear)
[    0.220000] Mountpoint-cache hash table entries: 1024 (order: 0, 4096 bytes, linear)
[    0.260000] cblist_init_generic: Setting adjustable number of callback queues.
[    0.260000] cblist_init_generic: Setting shift to 0 and lim to 1.
[    0.280000] devtmpfs: initialized
[    0.310000] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 19112604462750000 ns
[    0.310000] futex hash table entries: 256 (order: -1, 3072 bytes, linear)
[    0.350000] NET: Registered PF_NETLINK/PF_ROUTE protocol family
[    0.360000] DMA: preallocated 128 KiB GFP_KERNEL pool for atomic allocations
[    0.370000] DMA: preallocated 128 KiB GFP_KERNEL|GFP_DMA pool for atomic allocations
[    0.430000] SCSI subsystem initialized
[    0.790000] NET: Registered PF_INET protocol family
[    0.800000] IP idents hash table entries: 2048 (order: 2, 16384 bytes, linear)
[    0.830000] tcp_listen_portaddr_hash hash table entries: 1024 (order: 0, 4096 bytes, linear)
[    0.840000] Table-perturb hash table entries: 65536 (order: 6, 262144 bytes, linear)
[    0.840000] TCP established hash table entries: 1024 (order: 0, 4096 bytes, linear)
[    0.850000] TCP bind hash table entries: 1024 (order: 1, 8192 bytes, linear)
[    0.860000] TCP: Hash tables configured (established 1024 bind 1024)
[    0.860000] UDP hash table entries: 256 (order: 0, 4096 bytes, linear)
[    0.870000] UDP-Lite hash table entries: 256 (order: 0, 4096 bytes, linear)
[    0.880000] NET: Registered PF_UNIX/PF_LOCAL protocol family
[    0.910000] workingset: timestamp_bits=30 max_order=13 bucket_order=0
[    1.310000] fb0: Q40 frame buffer alive and kicking !
[    1.320000] Serial: 8250/16550 driver, 8 ports, IRQ sharing disabled
[    1.330000] serial8250: ttyS0 at I/O 0x3f8 (irq = 4, base_baud = 115200) is a 16450
[    1.340000] serial8250: ttyS1 at I/O 0x2f8 (irq = 3, base_baud = 115200) is a 16450
[    1.560000] loop: module loaded
[    1.570000] atari-falcon-ide atari-falcon-ide.0: Atari Falcon and Q40/Q60 PATA controller
[    1.570000] ------------[ cut here ]------------
[    1.570000] WARNING: CPU: 0 PID: 1 at lib/iomap.c:45 bad_io_access+0x32/0x38
[    1.570000] Bad IO access at port 0x3f6 (outb(val,port))
[    1.570000] Modules linked in:
[    1.570000] CPU: 0 PID: 1 Comm: swapper Not tainted 6.4.10-wrs #1
[    1.570000] Stack from 007d7cf8:
[    1.570000]         007d7cf8 003ca39a 003ca39a 00000000 00000009 00320c7a 003ca39a 0031c0de
[    1.570000]         003be068 003e12e8 0000002d 00914000 00914000 0031c16c 003e12e8 0000002d
[    1.570000]         001bb44e 00000009 00000000 007d7d58 00002000 00000000 00000000 00211826
[    1.570000]         003e12c5 007d7d78 0020c374 001bb44e 003e12e8 0000002d 00000009 003e12c5
[    1.570000]         000003f6 003e1330 002100fc 000003f6 003e1330 00210126 00914000 0000000a
[    1.570000]         00914000 0020bf8a 00914000 00964b80 0020c390 00914000 00000001 00203e80
[    1.570000] Call Trace: [<00320c7a>] dump_stack+0xc/0x10
[    1.570000]  [<0031c0de>] __warn+0x70/0xbc
[    1.570000]  [<0031c16c>] warn_slowpath_fmt+0x42/0x62
[    1.570000]  [<001bb44e>] bad_io_access+0x32/0x38
[    1.570000]  [<00002000>] _start+0x0/0x8
[    1.570000]  [<00211826>] ata_sff_interrupt+0x0/0x144
[    1.570000]  [<0020c374>] ata_eh_freeze_port+0x0/0x24
[    1.570000]  [<001bb44e>] bad_io_access+0x32/0x38
[    1.570000]  [<002100fc>] ata_sff_set_devctl+0x3c/0x42
[    1.570000]  [<00210126>] ata_sff_freeze+0x24/0x4c
[    1.570000]  [<0020bf8a>] __ata_port_freeze+0x3a/0x46
[    1.570000]  [<0020c390>] ata_eh_freeze_port+0x1c/0x24
[    1.570000]  [<00203e80>] ata_host_start+0x112/0x130
[    1.570000]  [<0020bee8>] ata_port_desc+0x0/0x68
[    1.570000]  [<0020451e>] ata_host_activate+0x20/0xf8
[    1.570000]  [<001ea47c>] platform_get_resource+0x0/0x48
[    1.570000]  [<00002080>] do_one_initcall+0x0/0x184
[    1.570000]  [<0020bee8>] ata_port_desc+0x0/0x68
[    1.570000]  [<0049d35a>] pata_falcon_init_one+0x1e6/0x1f4
[    1.570000]  [<00211826>] ata_sff_interrupt+0x0/0x144
[    1.570000]  [<00306fa0>] klist_next+0x0/0x80
[    1.570000]  [<001eaa26>] platform_probe+0x22/0x4e
[    1.570000]  [<001e920a>] really_probe+0xfa/0x200
[    1.570000]  [<001e9402>] driver_probe_device+0x20/0x78
[    1.570000]  [<003150ee>] strcpy+0x0/0x1c
[    1.570000]  [<001e959e>] __driver_attach+0xbe/0xce
[    1.570000]  [<00306fa0>] klist_next+0x0/0x80
[    1.570000]  [<001e79cc>] bus_for_each_dev+0x62/0x86
[    1.570000]  [<001e8c18>] driver_attach+0x16/0x1c
[    1.570000]  [<001e94e0>] __driver_attach+0x0/0xce
[    1.570000]  [<001e8688>] bus_add_driver+0x96/0x18c
[    1.570000]  [<001e9c3e>] driver_register+0x9c/0xda
[    1.570000]  [<001ea9ce>] __platform_driver_probe+0x64/0x9a
[    1.570000]  [<0049d15c>] pata_falcon_driver_init+0x0/0x18
[    1.570000]  [<0049d16e>] pata_falcon_driver_init+0x12/0x18
[    1.570000]  [<0049d174>] pata_falcon_init_one+0x0/0x1f4
[    1.570000]  [<000020da>] do_one_initcall+0x5a/0x184
[    1.570000]  [<003150ee>] strcpy+0x0/0x1c
[    1.570000]  [<00028374>] parse_args+0x0/0x25e
[    1.570000]  [<00002080>] do_one_initcall+0x0/0x184
[    1.570000]  [<00060006>] check_max_stack_depth_subprog+0x16e/0x220
[    1.570000]  [<0048f4b2>] kernel_init_freeable+0x132/0x18a
[    1.570000]  [<0048f500>] kernel_init_freeable+0x180/0x18a
[    1.570000]  [<0049d15c>] pata_falcon_driver_init+0x0/0x18
[    1.570000]  [<000286c8>] list_del_init+0x0/0x1c
[    1.570000]  [<00015cbc>] kernel_thread+0x0/0x68
[    1.570000]  [<00320df4>] kernel_init+0x0/0xec
[    1.570000]  [<00320e08>] kernel_init+0x14/0xec
[    1.570000]  [<00320df4>] kernel_init+0x0/0xec
[    1.570000]  [<00002898>] ret_from_kernel_thread+0xc/0x14
[    1.570000] 
[    1.570000] ---[ end trace 0000000000000000 ]---
[    1.570000] ------------[ cut here ]------------
[    1.570000] WARNING: CPU: 0 PID: 1 at lib/iomap.c:45 bad_io_access+0x32/0x38
[    1.570000] Bad IO access at port 0x1f7 (return inb(port))
[    1.570000] Modules linked in:
[    1.570000] CPU: 0 PID: 1 Comm: swapper Tainted: G        W          6.4.10-wrs #1
[    1.570000] Stack from 007d7cec:
[    1.570000]         007d7cec 003ca39a 003ca39a 00000000 00000009 00320c7a 003ca39a 0031c0de
[    1.570000]         003be068 003e12e8 0000002d 00914000 00914000 0031c16c 003e12e8 0000002d
[    1.570000]         001bb44e 00000009 00000000 007d7d4c 00002000 00000000 00000000 00211826
[    1.570000]         003e12c5 007d7d6c 0020c374 001bb44e 003e12e8 0000002d 00000009 003e12c5
[    1.570000]         000001f7 003e12f4 001bb498 000001f7 003e12f4 00210066 000001f7 00210132
[    1.570000]         00914000 00914000 0000000a 00914000 0020bf8a 00914000 00964b80 0020c390
[    1.570000] Call Trace: [<00320c7a>] dump_stack+0xc/0x10
[    1.570000]  [<0031c0de>] __warn+0x70/0xbc
[    1.570000]  [<0031c16c>] warn_slowpath_fmt+0x42/0x62
[    1.570000]  [<001bb44e>] bad_io_access+0x32/0x38
[    1.570000]  [<00002000>] _start+0x0/0x8
[    1.570000]  [<00211826>] ata_sff_interrupt+0x0/0x144
[    1.570000]  [<0020c374>] ata_eh_freeze_port+0x0/0x24
[    1.570000]  [<001bb44e>] bad_io_access+0x32/0x38
[    1.570000]  [<001bb498>] ioread8+0x44/0x4c
[    1.570000]  [<00210066>] ata_sff_check_status+0xe/0x12
[    1.570000]  [<00210132>] ata_sff_freeze+0x30/0x4c
[    1.570000]  [<0020bf8a>] __ata_port_freeze+0x3a/0x46
[    1.570000]  [<0020c390>] ata_eh_freeze_port+0x1c/0x24
[    1.570000]  [<00203e80>] ata_host_start+0x112/0x130
[    1.570000]  [<0020bee8>] ata_port_desc+0x0/0x68
[    1.570000]  [<0020451e>] ata_host_activate+0x20/0xf8
[    1.570000]  [<001ea47c>] platform_get_resource+0x0/0x48
[    1.570000]  [<00002080>] do_one_initcall+0x0/0x184
[    1.570000]  [<0020bee8>] ata_port_desc+0x0/0x68
[    1.570000]  [<0049d35a>] pata_falcon_init_one+0x1e6/0x1f4
[    1.570000]  [<00211826>] ata_sff_interrupt+0x0/0x144
[    1.570000]  [<00306fa0>] klist_next+0x0/0x80
[    1.570000]  [<001eaa26>] platform_probe+0x22/0x4e
[    1.570000]  [<001e920a>] really_probe+0xfa/0x200
[    1.570000]  [<001e9402>] driver_probe_device+0x20/0x78
[    1.570000]  [<003150ee>] strcpy+0x0/0x1c
[    1.570000]  [<001e959e>] __driver_attach+0xbe/0xce
[    1.570000]  [<00306fa0>] klist_next+0x0/0x80
[    1.570000]  [<001e79cc>] bus_for_each_dev+0x62/0x86
[    1.570000]  [<001e8c18>] driver_attach+0x16/0x1c
[    1.570000]  [<001e94e0>] __driver_attach+0x0/0xce
[    1.570000]  [<001e8688>] bus_add_driver+0x96/0x18c
[    1.570000]  [<001e9c3e>] driver_register+0x9c/0xda
[    1.570000]  [<001ea9ce>] __platform_driver_probe+0x64/0x9a
[    1.570000]  [<0049d15c>] pata_falcon_driver_init+0x0/0x18
[    1.570000]  [<0049d16e>] pata_falcon_driver_init+0x12/0x18
[    1.570000]  [<0049d174>] pata_falcon_init_one+0x0/0x1f4
[    1.570000]  [<000020da>] do_one_initcall+0x5a/0x184
[    1.570000]  [<003150ee>] strcpy+0x0/0x1c
[    1.570000]  [<00028374>] parse_args+0x0/0x25e
[    1.570000]  [<00002080>] do_one_initcall+0x0/0x184
[    1.570000]  [<00060006>] check_max_stack_depth_subprog+0x16e/0x220
[    1.570000]  [<0048f4b2>] kernel_init_freeable+0x132/0x18a
[    1.570000]  [<0048f500>] kernel_init_freeable+0x180/0x18a
[    1.570000]  [<0049d15c>] pata_falcon_driver_init+0x0/0x18
[    1.570000]  [<000286c8>] list_del_init+0x0/0x1c
[    1.570000]  [<00015cbc>] kernel_thread+0x0/0x68
[    1.570000]  [<00320df4>] kernel_init+0x0/0xec
[    1.570000]  [<00320e08>] kernel_init+0x14/0xec
[    1.570000]  [<00320df4>] kernel_init+0x0/0xec
[    1.570000]  [<00002898>] ret_from_kernel_thread+0xc/0x14
[    1.570000] 
[    1.570000] ---[ end trace 0000000000000000 ]---
[    1.600000] scsi host0: pata_falcon
[    1.610000] ata1: PATA max PIO4 cmd 0x1f0 ctl 0x3f6 irq 14
[    1.620000] atari-falcon-ide atari-falcon-ide.1: Atari Falcon and Q40/Q60 PATA controller
[    1.630000] ------------[ cut here ]------------
[    1.630000] WARNING: CPU: 0 PID: 1 at lib/iomap.c:45 bad_io_access+0x32/0x38
[    1.630000] Bad IO access at port 0x376 (outb(val,port))
[    1.630000] Modules linked in:
[    1.630000] CPU: 0 PID: 1 Comm: swapper Tainted: G        W          6.4.10-wrs #1
[    1.630000] Stack from 007d7cf8:
[    1.630000]         007d7cf8 003ca39a 003ca39a 00000000 00000009 00320c7a 003ca39a 0031c0de
[    1.630000]         003be068 003e12e8 0000002d 00990000 00990000 0031c16c 003e12e8 0000002d
[    1.630000]         001bb44e 00000009 00000000 007d7d58 00002000 00000000 00000000 00211826
[    1.630000]         003e12c5 007d7d78 0020c374 001bb44e 003e12e8 0000002d 00000009 003e12c5
[    1.630000]         00000376 003e1330 002100fc 00000376 003e1330 00210126 00990000 0000000a
[    1.630000]         00990000 0020bf8a 00990000 009646c0 0020c390 00990000 00000001 00203e80
[    1.630000] Call Trace: [<00320c7a>] dump_stack+0xc/0x10
[    1.630000]  [<0031c0de>] __warn+0x70/0xbc
[    1.630000]  [<0031c16c>] warn_slowpath_fmt+0x42/0x62
[    1.630000]  [<001bb44e>] bad_io_access+0x32/0x38
[    1.630000]  [<00002000>] _start+0x0/0x8
[    1.630000]  [<00211826>] ata_sff_interrupt+0x0/0x144
[    1.630000]  [<0020c374>] ata_eh_freeze_port+0x0/0x24
[    1.630000]  [<001bb44e>] bad_io_access+0x32/0x38
[    1.630000]  [<002100fc>] ata_sff_set_devctl+0x3c/0x42
[    1.630000]  [<00210126>] ata_sff_freeze+0x24/0x4c
[    1.630000]  [<0020bf8a>] __ata_port_freeze+0x3a/0x46
[    1.630000]  [<0020c390>] ata_eh_freeze_port+0x1c/0x24
[    1.630000]  [<00203e80>] ata_host_start+0x112/0x130
[    1.630000]  [<0020bee8>] ata_port_desc+0x0/0x68
[    1.630000]  [<0020451e>] ata_host_activate+0x20/0xf8
[    1.630000]  [<001ea47c>] platform_get_resource+0x0/0x48
[    1.630000]  [<00002080>] do_one_initcall+0x0/0x184
[    1.630000]  [<0020bee8>] ata_port_desc+0x0/0x68
[    1.630000]  [<0049d35a>] pata_falcon_init_one+0x1e6/0x1f4
[    1.630000]  [<00211826>] ata_sff_interrupt+0x0/0x144
[    1.630000]  [<00306fa0>] klist_next+0x0/0x80
[    1.630000]  [<001eaa26>] platform_probe+0x22/0x4e
[    1.630000]  [<001e920a>] really_probe+0xfa/0x200
[    1.630000]  [<001e9402>] driver_probe_device+0x20/0x78
[    1.630000]  [<003150ee>] strcpy+0x0/0x1c
[    1.630000]  [<001e959e>] __driver_attach+0xbe/0xce
[    1.630000]  [<00306fa0>] klist_next+0x0/0x80
[    1.630000]  [<001e79cc>] bus_for_each_dev+0x62/0x86
[    1.630000]  [<001e8c18>] driver_attach+0x16/0x1c
[    1.630000]  [<001e94e0>] __driver_attach+0x0/0xce
[    1.630000]  [<001e8688>] bus_add_driver+0x96/0x18c
[    1.630000]  [<001e9c3e>] driver_register+0x9c/0xda
[    1.630000]  [<001ea9ce>] __platform_driver_probe+0x64/0x9a
[    1.630000]  [<0049d15c>] pata_falcon_driver_init+0x0/0x18
[    1.630000]  [<0049d16e>] pata_falcon_driver_init+0x12/0x18
[    1.630000]  [<0049d174>] pata_falcon_init_one+0x0/0x1f4
[    1.630000]  [<000020da>] do_one_initcall+0x5a/0x184
[    1.630000]  [<003150ee>] strcpy+0x0/0x1c
[    1.630000]  [<00028374>] parse_args+0x0/0x25e
[    1.630000]  [<00002080>] do_one_initcall+0x0/0x184
[    1.630000]  [<00060006>] check_max_stack_depth_subprog+0x16e/0x220
[    1.630000]  [<0048f4b2>] kernel_init_freeable+0x132/0x18a
[    1.630000]  [<0048f500>] kernel_init_freeable+0x180/0x18a
[    1.630000]  [<0049d15c>] pata_falcon_driver_init+0x0/0x18
[    1.630000]  [<000286c8>] list_del_init+0x0/0x1c
[    1.630000]  [<00015cbc>] kernel_thread+0x0/0x68
[    1.630000]  [<00320df4>] kernel_init+0x0/0xec
[    1.630000]  [<00320e08>] kernel_init+0x14/0xec
[    1.630000]  [<00320df4>] kernel_init+0x0/0xec
[    1.630000]  [<00002898>] ret_from_kernel_thread+0xc/0x14
[    1.630000] 
[    1.630000] ---[ end trace 0000000000000000 ]---
[    1.630000] ------------[ cut here ]------------
[    1.630000] WARNING: CPU: 0 PID: 1 at lib/iomap.c:45 bad_io_access+0x32/0x38
[    1.630000] Bad IO access at port 0x177 (return inb(port))
[    1.630000] Modules linked in:
[    1.630000] CPU: 0 PID: 1 Comm: swapper Tainted: G        W          6.4.10-wrs #1
[    1.630000] Stack from 007d7cec:
[    1.630000]         007d7cec 003ca39a 003ca39a 00000000 00000009 00320c7a 003ca39a 0031c0de
[    1.630000]         003be068 003e12e8 0000002d 00990000 00990000 0031c16c 003e12e8 0000002d
[    1.630000]         001bb44e 00000009 00000000 007d7d4c 00002000 00000000 00000000 00211826
[    1.630000]         003e12c5 007d7d6c 0020c374 001bb44e 003e12e8 0000002d 00000009 003e12c5
[    1.630000]         00000177 003e12f4 001bb498 00000177 003e12f4 00210066 00000177 00210132
[    1.630000]         00990000 00990000 0000000a 00990000 0020bf8a 00990000 009646c0 0020c390
[    1.630000] Call Trace: [<00320c7a>] dump_stack+0xc/0x10
[    1.630000]  [<0031c0de>] __warn+0x70/0xbc
[    1.630000]  [<0031c16c>] warn_slowpath_fmt+0x42/0x62
[    1.630000]  [<001bb44e>] bad_io_access+0x32/0x38
[    1.630000]  [<00002000>] _start+0x0/0x8
[    1.630000]  [<00211826>] ata_sff_interrupt+0x0/0x144
[    1.630000]  [<0020c374>] ata_eh_freeze_port+0x0/0x24
[    1.630000]  [<001bb44e>] bad_io_access+0x32/0x38
[    1.630000]  [<001bb498>] ioread8+0x44/0x4c
[    1.630000]  [<00210066>] ata_sff_check_status+0xe/0x12
[    1.630000]  [<00210132>] ata_sff_freeze+0x30/0x4c
[    1.630000]  [<0020bf8a>] __ata_port_freeze+0x3a/0x46
[    1.630000]  [<0020c390>] ata_eh_freeze_port+0x1c/0x24
[    1.630000]  [<00203e80>] ata_host_start+0x112/0x130
[    1.630000]  [<0020bee8>] ata_port_desc+0x0/0x68
[    1.630000]  [<0020451e>] ata_host_activate+0x20/0xf8
[    1.630000]  [<001ea47c>] platform_get_resource+0x0/0x48
[    1.630000]  [<00002080>] do_one_initcall+0x0/0x184
[    1.630000]  [<0020bee8>] ata_port_desc+0x0/0x68
[    1.630000]  [<0049d35a>] pata_falcon_init_one+0x1e6/0x1f4
[    1.630000]  [<00211826>] ata_sff_interrupt+0x0/0x144
[    1.630000]  [<00306fa0>] klist_next+0x0/0x80
[    1.630000]  [<001eaa26>] platform_probe+0x22/0x4e
[    1.630000]  [<001e920a>] really_probe+0xfa/0x200
[    1.630000]  [<001e9402>] driver_probe_device+0x20/0x78
[    1.630000]  [<003150ee>] strcpy+0x0/0x1c
[    1.630000]  [<001e959e>] __driver_attach+0xbe/0xce
[    1.630000]  [<00306fa0>] klist_next+0x0/0x80
[    1.630000]  [<001e79cc>] bus_for_each_dev+0x62/0x86
[    1.630000]  [<001e8c18>] driver_attach+0x16/0x1c
[    1.630000]  [<001e94e0>] __driver_attach+0x0/0xce
[    1.630000]  [<001e8688>] bus_add_driver+0x96/0x18c
[    1.630000]  [<001e9c3e>] driver_register+0x9c/0xda
[    1.630000]  [<001ea9ce>] __platform_driver_probe+0x64/0x9a
[    1.630000]  [<0049d15c>] pata_falcon_driver_init+0x0/0x18
[    1.630000]  [<0049d16e>] pata_falcon_driver_init+0x12/0x18
[    1.630000]  [<0049d174>] pata_falcon_init_one+0x0/0x1f4
[    1.630000]  [<000020da>] do_one_initcall+0x5a/0x184
[    1.630000]  [<003150ee>] strcpy+0x0/0x1c
[    1.630000]  [<00028374>] parse_args+0x0/0x25e
[    1.630000]  [<00002080>] do_one_initcall+0x0/0x184
[    1.630000]  [<00060006>] check_max_stack_depth_subprog+0x16e/0x220
[    1.630000]  [<0048f4b2>] kernel_init_freeable+0x132/0x18a
[    1.630000]  [<0048f500>] kernel_init_freeable+0x180/0x18a
[    1.630000]  [<0049d15c>] pata_falcon_driver_init+0x0/0x18
[    1.630000]  [<000286c8>] list_del_init+0x0/0x1c
[    1.630000]  [<00015cbc>] kernel_thread+0x0/0x68
[    1.630000]  [<00320df4>] kernel_init+0x0/0xec
[    1.630000]  [<00320e08>] kernel_init+0x14/0xec
[    1.630000]  [<00320df4>] kernel_init+0x0/0xec
[    1.630000]  [<00002898>] ret_from_kernel_thread+0xc/0x14
[    1.630000] 
[    1.630000] ---[ end trace 0000000000000000 ]---
[    1.650000] ------------[ cut here ]------------
[    1.650000] WARNING: CPU: 0 PID: 18 at lib/iomap.c:45 bad_io_access+0x32/0x38
[    1.660000] Bad IO access at port 0x1f7 (return inb(port))
[    1.670000] Modules linked in:
[    1.670000] CPU: 0 PID: 18 Comm: scsi_eh_0 Tainted: G        W          6.4.10-wrs #1
[    1.670000] Stack from 00989cf8:
[    1.670000]         00989cf8 003ca39a 003ca39a 00000000 00000009 00320c7a 003ca39a 0031c0de
[    1.670000]         003be068 003e12e8 0000002d 00915550 ffff8d69 0031c16c 003e12e8 0000002d
[    1.670000]         001bb44e 00000009 00000000 00989d58 ffff8f5d ffff8b75 ffff8f5d 00000000
[    1.670000]         003e12c5 00989d78 002042c8 001bb44e 003e12e8 0000002d 00000009 003e12c5
[    1.670000]         000001f7 003e12f4 001bb498 000001f7 003e12f4 00210066 000001f7 0020ffde
[    1.670000]         00914000 00204ef6 00915550 ffff8f5d 0021075c 0000000c 00000000 0020ca8a
[    1.670000] Call Trace: [<00320c7a>] dump_stack+0xc/0x10
[    1.670000]  [<0031c0de>] __warn+0x70/0xbc
[    1.670000]  [<0031c16c>] warn_slowpath_fmt+0x42/0x62
[    1.670000]  [<001bb44e>] bad_io_access+0x32/0x38
[    1.670000]  [<002042c8>] ata_link_online+0x0/0x2a
[    1.670000]  [<001bb44e>] bad_io_access+0x32/0x38
[    1.670000]  [<001bb498>] ioread8+0x44/0x4c
[    1.670000]  [<00210066>] ata_sff_check_status+0xe/0x12
[    1.670000]  [<0020ffde>] ata_sff_check_ready+0x12/0x2a
[    1.670000]  [<00204ef6>] ata_wait_ready+0x6c/0x120
[    1.670000]  [<0021075c>] ata_sff_softreset+0x0/0x154
[    1.670000]  [<0020ca8a>] ata_eh_about_to_do+0x0/0x42
[    1.670000]  [<002100ba>] ata_sff_wait_ready+0x12/0x18
[    1.670000]  [<0020ffcc>] ata_sff_check_ready+0x0/0x2a
[    1.670000]  [<00210c36>] ata_sff_prereset+0x38/0x8a
[    1.670000]  [<00210bfe>] ata_sff_prereset+0x0/0x8a
[    1.670000]  [<0020da8c>] ata_eh_reset+0x212/0x8e8
[    1.670000]  [<0020bcc8>] ata_class_enabled+0x0/0x1c
[    1.670000]  [<0020c9aa>] ata_eh_schedule_probe+0x0/0xe0
[    1.670000]  [<0020c92e>] ata_eh_detach_dev+0x0/0x7c
[    1.670000]  [<00203bec>] ata_link_next+0x0/0x8c
[    1.670000]  [<0020d87a>] ata_eh_reset+0x0/0x8e8
[    1.670000]  [<0020c320>] ata_count_probe_trials_cb+0x0/0x54
[    1.670000]  [<0020bcc8>] ata_class_enabled+0x0/0x1c
[    1.670000]  [<0020e5d8>] ata_eh_recover+0x37e/0xbe4
[    1.670000]  [<00210bfe>] ata_sff_prereset+0x0/0x8a
[    1.670000]  [<0021075c>] ata_sff_softreset+0x0/0x154
[    1.670000]  [<002108b0>] ata_sff_postreset+0x0/0x76
[    1.670000]  [<00210bfe>] ata_sff_prereset+0x0/0x8a
[    1.670000]  [<0021075c>] ata_sff_softreset+0x0/0x154
[    1.670000]  [<00012004>] fp_roundint+0x50/0x1e8
[    1.670000]  [<002108b0>] ata_sff_postreset+0x0/0x76
[    1.670000]  [<00203bec>] ata_link_next+0x0/0x8c
[    1.670000]  [<00023d60>] __flush_work.isra.0+0x54/0x134
[    1.670000]  [<0000405e>] do_notify_resume+0x56/0x4a8
[    1.670000]  [<00022f22>] set_work_data+0x0/0x46
[    1.670000]  [<00024b3a>] try_to_grab_pending+0x0/0xc0
[    1.670000]  [<0020d386>] ata_eh_autopsy+0x8c/0x94
[    1.670000]  [<0031ba44>] memset+0x0/0x94
[    1.670000]  [<0020f2c0>] ata_do_eh+0x3a/0x8e
[    1.670000]  [<00210bfe>] ata_sff_prereset+0x0/0x8a
[    1.670000]  [<0021075c>] ata_sff_softreset+0x0/0x154
[    1.670000]  [<002108b0>] ata_sff_postreset+0x0/0x76
[    1.670000]  [<0021075c>] ata_sff_softreset+0x0/0x154
[    1.670000]  [<00312001>] siphash_2u64+0xd/0x8b2
[    1.670000]  [<002109a6>] ata_sff_error_handler+0x80/0x8a
[    1.670000]  [<00210bfe>] ata_sff_prereset+0x0/0x8a
[    1.670000]  [<0021075c>] ata_sff_softreset+0x0/0x154
[    1.670000]  [<002108b0>] ata_sff_postreset+0x0/0x76
[    1.670000]  [<002046f2>] ata_dev_next+0x0/0xac
[    1.670000]  [<0031b8ec>] memcpy+0x0/0x78
[    1.670000]  [<0020ef80>] ata_scsi_port_error_handler+0x90/0x2fc
[    1.670000]  [<00015cbc>] kernel_thread+0x0/0x68
[    1.670000]  [<00028736>] kthread_should_stop+0x0/0x12
[    1.670000]  [<001f3460>] scsi_host_busy+0x0/0x2a
[    1.670000]  [<0020f258>] ata_scsi_error+0x6c/0x9a
[    1.670000]  [<001f4c5e>] scsi_device_online+0x0/0x24
[    1.670000]  [<00028736>] kthread_should_stop+0x0/0x12
[    1.670000]  [<001f681a>] scsi_error_handler+0x5e/0x242
[    1.670000]  [<000286c8>] list_del_init+0x0/0x1c
[    1.670000]  [<00015cbc>] kernel_thread+0x0/0x68
[    1.670000]  [<000295a4>] kthread_exit+0x0/0x14
[    1.670000]  [<001f67bc>] scsi_error_handler+0x0/0x242
[    1.670000]  [<00322a26>] schedule_preempt_disabled+0xa/0xe
[    1.670000]  [<000295a4>] kthread_exit+0x0/0x14
[    1.670000]  [<00029668>] kthread+0x96/0xa0
[    1.670000]  [<000295d2>] kthread+0x0/0xa0
[    1.670000]  [<00002898>] ret_from_kernel_thread+0xc/0x14
[    1.670000] 
[    1.680000] ---[ end trace 0000000000000000 ]---
[    1.680000] ------------[ cut here ]------------
[    1.680000] WARNING: CPU: 0 PID: 18 at lib/iomap.c:45 bad_io_access+0x32/0x38
[    1.680000] Bad IO access at port 0x3f6 (outb(val,port))
[    1.680000] Modules linked in:
[    1.680000] CPU: 0 PID: 18 Comm: scsi_eh_0 Tainted: G        W          6.4.10-wrs #1
[    1.680000] Stack from 00989d34:
[    1.680000]         00989d34 003ca39a 003ca39a 00000000 00000009 00320c7a 003ca39a 0031c0de
[    1.680000]         003be068 003e12e8 0000002d 00914000 00914000 0031c16c 003e12e8 0000002d
[    1.680000]         001bb44e 00000009 00000000 00989d94 00002000 0021075c 0000000c 00000000
[    1.680000]         003e12c5 00989db4 00915780 001bb44e 003e12e8 0000002d 00000009 003e12c5
[    1.680000]         000003f6 003e1330 002100fc 000003f6 003e1330 00210126 00914000 0000000a
[    1.680000]         00914000 0020bf8a 00914000 00915550 0020c390 00914000 00000000 0020db1a
[    1.680000] Call Trace: [<00320c7a>] dump_stack+0xc/0x10
[    1.680000]  [<0031c0de>] __warn+0x70/0xbc
[    1.680000]  [<0031c16c>] warn_slowpath_fmt+0x42/0x62
[    1.680000]  [<001bb44e>] bad_io_access+0x32/0x38
[    1.680000]  [<00002000>] _start+0x0/0x8
[    1.680000]  [<0021075c>] ata_sff_softreset+0x0/0x154
[    1.680000]  [<001bb44e>] bad_io_access+0x32/0x38
[    1.680000]  [<002100fc>] ata_sff_set_devctl+0x3c/0x42
[    1.680000]  [<00210126>] ata_sff_freeze+0x24/0x4c
[    1.680000]  [<0020bf8a>] __ata_port_freeze+0x3a/0x46
[    1.680000]  [<0020c390>] ata_eh_freeze_port+0x1c/0x24
[    1.680000]  [<0020db1a>] ata_eh_reset+0x2a0/0x8e8
[    1.680000]  [<0020bcc8>] ata_class_enabled+0x0/0x1c
[    1.680000]  [<0020c9aa>] ata_eh_schedule_probe+0x0/0xe0
[    1.680000]  [<0020c92e>] ata_eh_detach_dev+0x0/0x7c
[    1.680000]  [<00203bec>] ata_link_next+0x0/0x8c
[    1.680000]  [<0020d87a>] ata_eh_reset+0x0/0x8e8
[    1.680000]  [<0020c320>] ata_count_probe_trials_cb+0x0/0x54
[    1.680000]  [<0020e5d8>] ata_eh_recover+0x37e/0xbe4
[    1.680000]  [<00210bfe>] ata_sff_prereset+0x0/0x8a
[    1.680000]  [<0021075c>] ata_sff_softreset+0x0/0x154
[    1.680000]  [<002108b0>] ata_sff_postreset+0x0/0x76
[    1.680000]  [<00210bfe>] ata_sff_prereset+0x0/0x8a
[    1.680000]  [<0021075c>] ata_sff_softreset+0x0/0x154
[    1.680000]  [<00012004>] fp_roundint+0x50/0x1e8
[    1.680000]  [<002108b0>] ata_sff_postreset+0x0/0x76
[    1.680000]  [<00203bec>] ata_link_next+0x0/0x8c
[    1.680000]  [<00023d60>] __flush_work.isra.0+0x54/0x134
[    1.680000]  [<0000405e>] do_notify_resume+0x56/0x4a8
[    1.680000]  [<00022f22>] set_work_data+0x0/0x46
[    1.680000]  [<00024b3a>] try_to_grab_pending+0x0/0xc0
[    1.680000]  [<0020d386>] ata_eh_autopsy+0x8c/0x94
[    1.680000]  [<0031ba44>] memset+0x0/0x94
[    1.680000]  [<0020f2c0>] ata_do_eh+0x3a/0x8e
[    1.680000]  [<00210bfe>] ata_sff_prereset+0x0/0x8a
[    1.680000]  [<0021075c>] ata_sff_softreset+0x0/0x154
[    1.680000]  [<002108b0>] ata_sff_postreset+0x0/0x76
[    1.680000]  [<0021075c>] ata_sff_softreset+0x0/0x154
[    1.680000]  [<00312001>] siphash_2u64+0xd/0x8b2
[    1.680000]  [<002109a6>] ata_sff_error_handler+0x80/0x8a
[    1.680000]  [<00210bfe>] ata_sff_prereset+0x0/0x8a
[    1.680000]  [<0021075c>] ata_sff_softreset+0x0/0x154
[    1.680000]  [<002108b0>] ata_sff_postreset+0x0/0x76
[    1.680000]  [<002046f2>] ata_dev_next+0x0/0xac
[    1.680000]  [<0031b8ec>] memcpy+0x0/0x78
[    1.680000]  [<0020ef80>] ata_scsi_port_error_handler+0x90/0x2fc
[    1.680000]  [<00015cbc>] kernel_thread+0x0/0x68
[    1.680000]  [<00028736>] kthread_should_stop+0x0/0x12
[    1.680000]  [<001f3460>] scsi_host_busy+0x0/0x2a
[    1.680000]  [<0020f258>] ata_scsi_error+0x6c/0x9a
[    1.680000]  [<001f4c5e>] scsi_device_online+0x0/0x24
[    1.680000]  [<00028736>] kthread_should_stop+0x0/0x12
[    1.680000]  [<001f681a>] scsi_error_handler+0x5e/0x242
[    1.680000]  [<000286c8>] list_del_init+0x0/0x1c
[    1.680000]  [<00015cbc>] kernel_thread+0x0/0x68
[    1.680000]  [<000295a4>] kthread_exit+0x0/0x14
[    1.680000]  [<001f67bc>] scsi_error_handler+0x0/0x242
[    1.680000]  [<00322a26>] schedule_preempt_disabled+0xa/0xe
[    1.680000]  [<000295a4>] kthread_exit+0x0/0x14
[    1.680000]  [<00029668>] kthread+0x96/0xa0
[    1.680000]  [<000295d2>] kthread+0x0/0xa0
[    1.680000]  [<00002898>] ret_from_kernel_thread+0xc/0x14
[    1.680000] 
[    1.680000] ---[ end trace 0000000000000000 ]---
[    1.680000] ------------[ cut here ]------------
[    1.680000] WARNING: CPU: 0 PID: 18 at lib/iomap.c:45 bad_io_access+0x32/0x38
[    1.680000] Bad IO access at port 0x1f7 (return inb(port))
[    1.680000] Modules linked in:
[    1.680000] CPU: 0 PID: 18 Comm: scsi_eh_0 Tainted: G        W          6.4.10-wrs #1
[    1.680000] Stack from 00989d28:
[    1.680000]         00989d28 003ca39a 003ca39a 00000000 00000009 00320c7a 003ca39a 0031c0de
[    1.680000]         003be068 003e12e8 0000002d 00914000 00914000 0031c16c 003e12e8 0000002d
[    1.680000]         001bb44e 00000009 00000000 00989d88 00002000 0021075c 0000000c 00000000
[    1.680000]         003e12c5 00989da8 00915780 001bb44e 003e12e8 0000002d 00000009 003e12c5
[    1.680000]         000001f7 003e12f4 001bb498 000001f7 003e12f4 00210066 000001f7 00210132
[    1.680000]         00914000 00914000 0000000a 00914000 0020bf8a 00914000 00915550 0020c390
[    1.680000] Call Trace: [<00320c7a>] dump_stack+0xc/0x10
[    1.680000]  [<0031c0de>] __warn+0x70/0xbc
[    1.680000]  [<0031c16c>] warn_slowpath_fmt+0x42/0x62
[    1.680000]  [<001bb44e>] bad_io_access+0x32/0x38
[    1.680000]  [<00002000>] _start+0x0/0x8
[    1.680000]  [<0021075c>] ata_sff_softreset+0x0/0x154
[    1.680000]  [<001bb44e>] bad_io_access+0x32/0x38
[    1.680000]  [<001bb498>] ioread8+0x44/0x4c
[    1.680000]  [<00210066>] ata_sff_check_status+0xe/0x12
[    1.680000]  [<00210132>] ata_sff_freeze+0x30/0x4c
[    1.680000]  [<0020bf8a>] __ata_port_freeze+0x3a/0x46
[    1.680000]  [<0020c390>] ata_eh_freeze_port+0x1c/0x24
[    1.680000]  [<0020db1a>] ata_eh_reset+0x2a0/0x8e8
[    1.680000]  [<0020bcc8>] ata_class_enabled+0x0/0x1c
[    1.680000]  [<0020c9aa>] ata_eh_schedule_probe+0x0/0xe0
[    1.680000]  [<0020c92e>] ata_eh_detach_dev+0x0/0x7c
[    1.680000]  [<00203bec>] ata_link_next+0x0/0x8c
[    1.680000]  [<0020d87a>] ata_eh_reset+0x0/0x8e8
[    1.680000]  [<0020c320>] ata_count_probe_trials_cb+0x0/0x54
[    1.680000]  [<0020e5d8>] ata_eh_recover+0x37e/0xbe4
[    1.680000]  [<00210bfe>] ata_sff_prereset+0x0/0x8a
[    1.680000]  [<0021075c>] ata_sff_softreset+0x0/0x154
[    1.680000]  [<002108b0>] ata_sff_postreset+0x0/0x76
[    1.680000]  [<00210bfe>] ata_sff_prereset+0x0/0x8a
[    1.680000]  [<0021075c>] ata_sff_softreset+0x0/0x154
[    1.680000]  [<00012004>] fp_roundint+0x50/0x1e8
[    1.680000]  [<002108b0>] ata_sff_postreset+0x0/0x76
[    1.680000]  [<00203bec>] ata_link_next+0x0/0x8c
[    1.680000]  [<00023d60>] __flush_work.isra.0+0x54/0x134
[    1.680000]  [<0000405e>] do_notify_resume+0x56/0x4a8
[    1.680000]  [<00022f22>] set_work_data+0x0/0x46
[    1.680000]  [<00024b3a>] try_to_grab_pending+0x0/0xc0
[    1.680000]  [<0020d386>] ata_eh_autopsy+0x8c/0x94
[    1.680000]  [<0031ba44>] memset+0x0/0x94
[    1.680000]  [<0020f2c0>] ata_do_eh+0x3a/0x8e
[    1.680000]  [<00210bfe>] ata_sff_prereset+0x0/0x8a
[    1.680000]  [<0021075c>] ata_sff_softreset+0x0/0x154
[    1.680000]  [<002108b0>] ata_sff_postreset+0x0/0x76
[    1.680000]  [<0021075c>] ata_sff_softreset+0x0/0x154
[    1.680000]  [<00312001>] siphash_2u64+0xd/0x8b2
[    1.680000]  [<002109a6>] ata_sff_error_handler+0x80/0x8a
[    1.680000]  [<00210bfe>] ata_sff_prereset+0x0/0x8a
[    1.680000]  [<0021075c>] ata_sff_softreset+0x0/0x154
[    1.680000]  [<002108b0>] ata_sff_postreset+0x0/0x76
[    1.680000]  [<002046f2>] ata_dev_next+0x0/0xac
[    1.680000]  [<0031b8ec>] memcpy+0x0/0x78
[    1.680000]  [<0020ef80>] ata_scsi_port_error_handler+0x90/0x2fc
[    1.680000]  [<00015cbc>] kernel_thread+0x0/0x68
[    1.680000]  [<00028736>] kthread_should_stop+0x0/0x12
[    1.680000]  [<001f3460>] scsi_host_busy+0x0/0x2a
[    1.680000]  [<0020f258>] ata_scsi_error+0x6c/0x9a
[    1.680000]  [<001f4c5e>] scsi_device_online+0x0/0x24
[    1.680000]  [<00028736>] kthread_should_stop+0x0/0x12
[    1.680000]  [<001f681a>] scsi_error_handler+0x5e/0x242
[    1.680000]  [<000286c8>] list_del_init+0x0/0x1c
[    1.680000]  [<00015cbc>] kernel_thread+0x0/0x68
[    1.680000]  [<000295a4>] kthread_exit+0x0/0x14
[    1.680000]  [<001f67bc>] scsi_error_handler+0x0/0x242
[    1.680000]  [<00322a26>] schedule_preempt_disabled+0xa/0xe
[    1.680000]  [<000295a4>] kthread_exit+0x0/0x14
[    1.680000]  [<00029668>] kthread+0x96/0xa0
[    1.680000]  [<000295d2>] kthread+0x0/0xa0
[    1.680000]  [<00002898>] ret_from_kernel_thread+0xc/0x14
[    1.680000] 
[    1.680000] ---[ end trace 0000000000000000 ]---
[    1.690000] ------------[ cut here ]------------
[    1.690000] WARNING: CPU: 0 PID: 18 at lib/iomap.c:45 bad_io_access+0x32/0x38
[    1.700000] Bad IO access at port 0x1f6 (outb(val,port))
[    1.700000] Modules linked in:
[    1.710000] CPU: 0 PID: 18 Comm: scsi_eh_0 Tainted: G        W          6.4.10-wrs #1
[    1.710000] Stack from 00989d04:
[    1.710000]         00989d04 003ca39a 003ca39a 00000000 00000009 00320c7a 003ca39a 0031c0de
[    1.710000]         003be068 003e12e8 0000002d 00914000 00915550 0031c16c 003e12e8 0000002d
[    1.710000]         001bb44e 00000009 00000000 00989d64 00000000 00000001 0000000c 00000000
[    1.710000]         003e12c5 00989d84 00915780 001bb44e 003e12e8 0000002d 00000009 003e12c5
[    1.710000]         000001f6 003e1330 00210d20 000001f6 003e1330 00914000 00210166 00914000
[    1.710000]         00000000 00000000 00914000 00915550 0021077c 00914000 00000000 00000000
[    1.710000] Call Trace: [<00320c7a>] dump_stack+0xc/0x10
[    1.710000]  [<0031c0de>] __warn+0x70/0xbc
[    1.710000]  [<0031c16c>] warn_slowpath_fmt+0x42/0x62
[    1.710000]  [<001bb44e>] bad_io_access+0x32/0x38
[    1.710000]  [<001bb44e>] bad_io_access+0x32/0x38
[    1.710000]  [<00210d20>] ata_sff_dev_select+0x20/0x32
[    1.710000]  [<00210166>] ata_devchk+0x18/0x8e
[    1.710000]  [<0021077c>] ata_sff_softreset+0x20/0x154
[    1.710000]  [<0021075c>] ata_sff_softreset+0x0/0x154
[    1.710000]  [<0020dba6>] ata_eh_reset+0x32c/0x8e8
[    1.710000]  [<0020bcc8>] ata_class_enabled+0x0/0x1c
[    1.710000]  [<0020c9aa>] ata_eh_schedule_probe+0x0/0xe0
[    1.710000]  [<0020c92e>] ata_eh_detach_dev+0x0/0x7c
[    1.710000]  [<00203bec>] ata_link_next+0x0/0x8c
[    1.710000]  [<0020d87a>] ata_eh_reset+0x0/0x8e8
[    1.710000]  [<0020c320>] ata_count_probe_trials_cb+0x0/0x54
[    1.710000]  [<0020e5d8>] ata_eh_recover+0x37e/0xbe4
[    1.710000]  [<00210bfe>] ata_sff_prereset+0x0/0x8a
[    1.710000]  [<0021075c>] ata_sff_softreset+0x0/0x154
[    1.710000]  [<002108b0>] ata_sff_postreset+0x0/0x76
[    1.710000]  [<00210bfe>] ata_sff_prereset+0x0/0x8a
[    1.710000]  [<0021075c>] ata_sff_softreset+0x0/0x154
[    1.710000]  [<00012004>] fp_roundint+0x50/0x1e8
[    1.710000]  [<002108b0>] ata_sff_postreset+0x0/0x76
[    1.710000]  [<00203bec>] ata_link_next+0x0/0x8c
[    1.710000]  [<00023d60>] __flush_work.isra.0+0x54/0x134
[    1.710000]  [<0000405e>] do_notify_resume+0x56/0x4a8
[    1.710000]  [<00022f22>] set_work_data+0x0/0x46
[    1.710000]  [<00024b3a>] try_to_grab_pending+0x0/0xc0
[    1.710000]  [<0020d386>] ata_eh_autopsy+0x8c/0x94
[    1.710000]  [<0031ba44>] memset+0x0/0x94
[    1.710000]  [<0020f2c0>] ata_do_eh+0x3a/0x8e
[    1.710000]  [<00210bfe>] ata_sff_prereset+0x0/0x8a
[    1.710000]  [<0021075c>] ata_sff_softreset+0x0/0x154
[    1.710000]  [<002108b0>] ata_sff_postreset+0x0/0x76
[    1.710000]  [<0021075c>] ata_sff_softreset+0x0/0x154
[    1.710000]  [<00312001>] siphash_2u64+0xd/0x8b2
[    1.710000]  [<002109a6>] ata_sff_error_handler+0x80/0x8a
[    1.710000]  [<00210bfe>] ata_sff_prereset+0x0/0x8a
[    1.710000]  [<0021075c>] ata_sff_softreset+0x0/0x154
[    1.710000]  [<002108b0>] ata_sff_postreset+0x0/0x76
[    1.710000]  [<002046f2>] ata_dev_next+0x0/0xac
[    1.710000]  [<0031b8ec>] memcpy+0x0/0x78
[    1.710000]  [<0020ef80>] ata_scsi_port_error_handler+0x90/0x2fc
[    1.710000]  [<00015cbc>] kernel_thread+0x0/0x68
[    1.710000]  [<00028736>] kthread_should_stop+0x0/0x12
[    1.710000]  [<001f3460>] scsi_host_busy+0x0/0x2a
[    1.710000]  [<0020f258>] ata_scsi_error+0x6c/0x9a
[    1.710000]  [<001f4c5e>] scsi_device_online+0x0/0x24
[    1.710000]  [<00028736>] kthread_should_stop+0x0/0x12
[    1.710000]  [<001f681a>] scsi_error_handler+0x5e/0x242
[    1.710000]  [<000286c8>] list_del_init+0x0/0x1c
[    1.710000]  [<00015cbc>] kernel_thread+0x0/0x68
[    1.710000]  [<000295a4>] kthread_exit+0x0/0x14
[    1.710000]  [<001f67bc>] scsi_error_handler+0x0/0x242
[    1.710000]  [<00322a26>] schedule_preempt_disabled+0xa/0xe
[    1.710000]  [<000295a4>] kthread_exit+0x0/0x14
[    1.710000]  [<00029668>] kthread+0x96/0xa0
[    1.710000]  [<000295d2>] kthread+0x0/0xa0
[    1.710000]  [<00002898>] ret_from_kernel_thread+0xc/0x14
[    1.710000] 
[    1.720000] ---[ end trace 0000000000000000 ]---
[    1.720000] ------------[ cut here ]------------
[    1.730000] WARNING: CPU: 0 PID: 18 at lib/iomap.c:45 bad_io_access+0x32/0x38
[    1.730000] Bad IO access at port 0x3f6 (return inb(port))
[    1.740000] Modules linked in:
[    1.740000] CPU: 0 PID: 18 Comm: scsi_eh_0 Tainted: G        W          6.4.10-wrs #1
[    1.740000] Stack from 00989cf0:
[    1.740000]         00989cf0 003ca39a 003ca39a 00000000 00000009 00320c7a 003ca39a 0031c0de
[    1.740000]         003be068 003e12e8 0000002d 00000000 00915550 0031c16c 003e12e8 0000002d
[    1.740000]         001bb44e 00000009 00000000 00989d50 00000000 00000001 0000000c 00000000
[    1.740000]         003e12c5 00989d70 00915780 001bb44e 003e12e8 0000002d 00000009 003e12c5
[    1.740000]         000003f6 003e12f4 001bb498 000003f6 003e12f4 0021009e 000003f6 00914000
[    1.740000]         00210cc4 00914000 00000000 00210166 00914000 00000000 00000000 00914000
[    1.740000] Call Trace: [<00320c7a>] dump_stack+0xc/0x10
[    1.740000]  [<0031c0de>] __warn+0x70/0xbc
[    1.740000]  [<0031c16c>] warn_slowpath_fmt+0x42/0x62
[    1.740000]  [<001bb44e>] bad_io_access+0x32/0x38
[    1.740000]  [<001bb44e>] bad_io_access+0x32/0x38
[    1.740000]  [<001bb498>] ioread8+0x44/0x4c
[    1.740000]  [<0021009e>] ata_sff_altstatus+0x34/0x3e
[    1.740000]  [<00210cc4>] ata_sff_pause+0xa/0x46
[    1.740000]  [<00210166>] ata_devchk+0x18/0x8e
[    1.740000]  [<0021077c>] ata_sff_softreset+0x20/0x154
[    1.740000]  [<0021075c>] ata_sff_softreset+0x0/0x154
[    1.740000]  [<0020dba6>] ata_eh_reset+0x32c/0x8e8
[    1.740000]  [<0020bcc8>] ata_class_enabled+0x0/0x1c
[    1.740000]  [<0020c9aa>] ata_eh_schedule_probe+0x0/0xe0
[    1.740000]  [<0020c92e>] ata_eh_detach_dev+0x0/0x7c
[    1.740000]  [<00203bec>] ata_link_next+0x0/0x8c
[    1.740000]  [<0020d87a>] ata_eh_reset+0x0/0x8e8
[    1.740000]  [<0020c320>] ata_count_probe_trials_cb+0x0/0x54
[    1.740000]  [<0020e5d8>] ata_eh_recover+0x37e/0xbe4
[    1.740000]  [<00210bfe>] ata_sff_prereset+0x0/0x8a
[    1.740000]  [<0021075c>] ata_sff_softreset+0x0/0x154
[    1.740000]  [<002108b0>] ata_sff_postreset+0x0/0x76
[    1.740000]  [<00210bfe>] ata_sff_prereset+0x0/0x8a
[    1.740000]  [<0021075c>] ata_sff_softreset+0x0/0x154
[    1.740000]  [<00012004>] fp_roundint+0x50/0x1e8
[    1.740000]  [<002108b0>] ata_sff_postreset+0x0/0x76
[    1.740000]  [<00203bec>] ata_link_next+0x0/0x8c
[    1.740000]  [<00023d60>] __flush_work.isra.0+0x54/0x134
[    1.740000]  [<0000405e>] do_notify_resume+0x56/0x4a8
[    1.740000]  [<00022f22>] set_work_data+0x0/0x46
[    1.740000]  [<00024b3a>] try_to_grab_pending+0x0/0xc0
[    1.740000]  [<0020d386>] ata_eh_autopsy+0x8c/0x94
[    1.740000]  [<0031ba44>] memset+0x0/0x94
[    1.740000]  [<0020f2c0>] ata_do_eh+0x3a/0x8e
[    1.740000]  [<00210bfe>] ata_sff_prereset+0x0/0x8a
[    1.740000]  [<0021075c>] ata_sff_softreset+0x0/0x154
[    1.740000]  [<002108b0>] ata_sff_postreset+0x0/0x76
[    1.740000]  [<0021075c>] ata_sff_softreset+0x0/0x154
[    1.740000]  [<00312001>] siphash_2u64+0xd/0x8b2
[    1.740000]  [<002109a6>] ata_sff_error_handler+0x80/0x8a
[    1.740000]  [<00210bfe>] ata_sff_prereset+0x0/0x8a
[    1.740000]  [<0021075c>] ata_sff_softreset+0x0/0x154
[    1.740000]  [<002108b0>] ata_sff_postreset+0x0/0x76
[    1.740000]  [<002046f2>] ata_dev_next+0x0/0xac
[    1.740000]  [<0031b8ec>] memcpy+0x0/0x78
[    1.740000]  [<0020ef80>] ata_scsi_port_error_handler+0x90/0x2fc
[    1.740000]  [<00015cbc>] kernel_thread+0x0/0x68
[    1.740000]  [<00028736>] kthread_should_stop+0x0/0x12
[    1.740000]  [<001f3460>] scsi_host_busy+0x0/0x2a
[    1.740000]  [<0020f258>] ata_scsi_error+0x6c/0x9a
[    1.740000]  [<001f4c5e>] scsi_device_online+0x0/0x24
[    1.740000]  [<00028736>] kthread_should_stop+0x0/0x12
[    1.740000]  [<001f681a>] scsi_error_handler+0x5e/0x242
[    1.740000]  [<000286c8>] list_del_init+0x0/0x1c
[    1.740000]  [<00015cbc>] kernel_thread+0x0/0x68
[    1.740000]  [<000295a4>] kthread_exit+0x0/0x14
[    1.740000]  [<001f67bc>] scsi_error_handler+0x0/0x242
[    1.740000]  [<00322a26>] schedule_preempt_disabled+0xa/0xe
[    1.740000]  [<000295a4>] kthread_exit+0x0/0x14
[    1.740000]  [<00029668>] kthread+0x96/0xa0
[    1.740000]  [<000295d2>] kthread+0x0/0xa0
[    1.740000]  [<00002898>] ret_from_kernel_thread+0xc/0x14
[    1.740000] 
[    1.750000] ---[ end trace 0000000000000000 ]---
[    1.750000] ------------[ cut here ]------------
[    1.760000] WARNING: CPU: 0 PID: 18 at lib/iomap.c:45 bad_io_access+0x32/0x38
[    1.760000] Bad IO access at port 0x1f2 (outb(val,port))
[    1.770000] Modules linked in:
[    1.770000] CPU: 0 PID: 18 Comm: scsi_eh_0 Tainted: G        W          6.4.10-wrs #1
[    1.770000] Stack from 00989d0c:
[    1.770000]         00989d0c 003ca39a 003ca39a 00000000 00000009 00320c7a 003ca39a 0031c0de
[    1.770000]         003be068 003e12e8 0000002d 00914000 001bb536 0031c16c 003e12e8 0000002d
[    1.770000]         001bb44e 00000009 00000000 00989d6c 00000000 00000001 0000000c 00000000
[    1.770000]         003e12c5 00989d8c 00915780 001bb44e 003e12e8 0000002d 00000009 003e12c5
[    1.770000]         000001f2 003e1330 00210176 000001f2 003e1330 00914000 00000000 00000000
[    1.770000]         00914000 00915550 0021077c 00914000 00000000 00000000 0021075c 0000000c
[    1.770000] Call Trace: [<00320c7a>] dump_stack+0xc/0x10
[    1.770000]  [<0031c0de>] __warn+0x70/0xbc
[    1.770000]  [<001bb536>] iowrite8+0x0/0x46
[    1.770000]  [<0031c16c>] warn_slowpath_fmt+0x42/0x62
[    1.770000]  [<001bb44e>] bad_io_access+0x32/0x38
[    1.770000]  [<001bb44e>] bad_io_access+0x32/0x38
[    1.770000]  [<00210176>] ata_devchk+0x28/0x8e
[    1.770000]  [<0021077c>] ata_sff_softreset+0x20/0x154
[    1.770000]  [<0021075c>] ata_sff_softreset+0x0/0x154
[    1.770000]  [<0020dba6>] ata_eh_reset+0x32c/0x8e8
[    1.770000]  [<0020bcc8>] ata_class_enabled+0x0/0x1c
[    1.770000]  [<0020c9aa>] ata_eh_schedule_probe+0x0/0xe0
[    1.770000]  [<0020c92e>] ata_eh_detach_dev+0x0/0x7c
[    1.770000]  [<00203bec>] ata_link_next+0x0/0x8c
[    1.770000]  [<0020d87a>] ata_eh_reset+0x0/0x8e8
[    1.770000]  [<0020c320>] ata_count_probe_trials_cb+0x0/0x54
[    1.770000]  [<0020e5d8>] ata_eh_recover+0x37e/0xbe4
[    1.770000]  [<00210bfe>] ata_sff_prereset+0x0/0x8a
[    1.770000]  [<0021075c>] ata_sff_softreset+0x0/0x154
[    1.770000]  [<002108b0>] ata_sff_postreset+0x0/0x76
[    1.770000]  [<00210bfe>] ata_sff_prereset+0x0/0x8a
[    1.770000]  [<0021075c>] ata_sff_softreset+0x0/0x154
[    1.770000]  [<00012004>] fp_roundint+0x50/0x1e8
[    1.770000]  [<002108b0>] ata_sff_postreset+0x0/0x76
[    1.770000]  [<00203bec>] ata_link_next+0x0/0x8c
[    1.770000]  [<00023d60>] __flush_work.isra.0+0x54/0x134
[    1.770000]  [<0000405e>] do_notify_resume+0x56/0x4a8
[    1.770000]  [<00022f22>] set_work_data+0x0/0x46
[    1.770000]  [<00024b3a>] try_to_grab_pending+0x0/0xc0
[    1.770000]  [<0020d386>] ata_eh_autopsy+0x8c/0x94
[    1.770000]  [<0031ba44>] memset+0x0/0x94
[    1.770000]  [<0020f2c0>] ata_do_eh+0x3a/0x8e
[    1.770000]  [<00210bfe>] ata_sff_prereset+0x0/0x8a
[    1.770000]  [<0021075c>] ata_sff_softreset+0x0/0x154
[    1.770000]  [<002108b0>] ata_sff_postreset+0x0/0x76
[    1.770000]  [<0021075c>] ata_sff_softreset+0x0/0x154
[    1.770000]  [<00312001>] siphash_2u64+0xd/0x8b2
[    1.770000]  [<002109a6>] ata_sff_error_handler+0x80/0x8a
[    1.770000]  [<00210bfe>] ata_sff_prereset+0x0/0x8a
[    1.770000]  [<0021075c>] ata_sff_softreset+0x0/0x154
[    1.770000]  [<002108b0>] ata_sff_postreset+0x0/0x76
[    1.770000]  [<002046f2>] ata_dev_next+0x0/0xac
[    1.770000]  [<0031b8ec>] memcpy+0x0/0x78
[    1.770000]  [<0020ef80>] ata_scsi_port_error_handler+0x90/0x2fc
[    1.770000]  [<00015cbc>] kernel_thread+0x0/0x68
[    1.770000]  [<00028736>] kthread_should_stop+0x0/0x12
[    1.770000]  [<001f3460>] scsi_host_busy+0x0/0x2a
[    1.770000]  [<0020f258>] ata_scsi_error+0x6c/0x9a
[    1.770000]  [<001f4c5e>] scsi_device_online+0x0/0x24
[    1.770000]  [<00028736>] kthread_should_stop+0x0/0x12
[    1.770000]  [<001f681a>] scsi_error_handler+0x5e/0x242
[    1.770000]  [<000286c8>] list_del_init+0x0/0x1c
[    1.770000]  [<00015cbc>] kernel_thread+0x0/0x68
[    1.770000]  [<000295a4>] kthread_exit+0x0/0x14
[    1.770000]  [<001f67bc>] scsi_error_handler+0x0/0x242
[    1.770000]  [<00322a26>] schedule_preempt_disabled+0xa/0xe
[    1.770000]  [<000295a4>] kthread_exit+0x0/0x14
[    1.770000]  [<00029668>] kthread+0x96/0xa0
[    1.770000]  [<000295d2>] kthread+0x0/0xa0
[    1.770000]  [<00002898>] ret_from_kernel_thread+0xc/0x14
[    1.770000] 
[    1.780000] ---[ end trace 0000000000000000 ]---
[    1.790000] scsi host1: pata_falcon
[    1.800000] ata2: PATA max PIO4 cmd 0x170 ctl 0x376 irq 15
[    1.900000] ne ne.0 (unnamed net_device) (uninitialized): NE*000 ethercard probe at 0x300:
[    1.900000] 00:00:e8:cf:2e:39
[    1.920000] ne ne.0 eth0: RTL8019 found at 0x300, using IRQ 5.
[    1.940000] PPP generic driver version 2.4.2
[    1.960000] serio: Q40 kbd registered
[    1.990000] NET: Registered PF_INET6 protocol family
[    2.010000] input: AT Raw Set 2 keyboard as /devices/platform/q40kbd/serio0/input/input0
[    2.050000] Segment Routing with IPv6
[    2.060000] In-situ OAM (IOAM) with IPv6
[    2.240000] /dev/root: Can't open blockdev
[    2.240000] VFS: Cannot open root device "(null)" or unknown-block(0,0): error -6
[    2.250000] Please append a correct "root=" boot option; here are the available partitions:
[    2.250000] Kernel panic - not syncing: VFS: Unable to mount root fs on unknown-block(0,0)
[    2.250000] CPU: 0 PID: 1 Comm: swapper Tainted: G        W          6.4.10-wrs #1
[    2.250000] Stack from 007d7ed8:
[    2.250000]         007d7ed8 003ca39a 003ca39a 00000000 ffffffff 00320c7a 003ca39a 0031bf24
[    2.250000]         00000006 00008001 00000000 0031c660 009ca000 007d7f54 004cc968 0048f828
[    2.250000]         003be5f0 007d7f54 003be59f 003be56c 00000000 007d7f54 fffffffa 00000000
[    2.250000]         0000000c 000286c8 00015cbc 00320df4 00000000 00000000 00000000 756e6b6e
[    2.250000]         6f776e2d 626c6f63 6b28302c 302900c0 00bc8280 0048f8c8 003be654 0048f8f2
[    2.250000]         003be654 00008001 00000001 007dc000 000286c8 00015cbc 00000000 00000000
[    2.250000] Call Trace: [<00320c7a>] dump_stack+0xc/0x10
[    2.250000]  [<0031bf24>] panic+0xba/0x204
[    2.250000]  [<00008001>] t_operr+0xb/0x1a
[    2.250000]  [<0031c660>] _printk+0x0/0x18
[    2.250000]  [<0048f828>] mount_block_root+0x132/0x18a
[    2.250000]  [<000286c8>] list_del_init+0x0/0x1c
[    2.250000]  [<00015cbc>] kernel_thread+0x0/0x68
[    2.250000]  [<00320df4>] kernel_init+0x0/0xec
[    2.250000]  [<0048f8c8>] mount_root+0x48/0x14e
[    2.250000]  [<0048f8f2>] mount_root+0x72/0x14e
[    2.250000]  [<00008001>] t_operr+0xb/0x1a
[    2.250000]  [<000286c8>] list_del_init+0x0/0x1c
[    2.250000]  [<00015cbc>] kernel_thread+0x0/0x68
[    2.250000]  [<00320df4>] kernel_init+0x0/0xec
[    2.250000]  [<0048fb3a>] prepare_namespace+0x16c/0x17a
[    2.250000]  [<00320df4>] kernel_init+0x0/0xec
[    2.250000]  [<00320e08>] kernel_init+0x14/0xec
[    2.250000]  [<00320df4>] kernel_init+0x0/0xec
[    2.250000]  [<00002898>] ret_from_kernel_thread+0xc/0x14
[    2.250000] 
[    2.250000] ---[ end Kernel panic - not syncing: VFS: Unable to mount root fs on unknown-block(0,0) ]---

--HkIVYKf7Bd8oPSWa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="linux-6.4.10+wrs"

1:/> vmlinux-6.4.10+wrs console=ttyS0,115200n8 netdev=5,0x300,eth0 root=/dev/sdb3
vmlinux-6.4.10+wrs: 6482816 bytes, ELF.
Loading 4637888 bytes from file offset 0x1000 to memory at 0x41000
Loading 120836 bytes from file offset 0x46E000 to memory at 0x4CE000
Linux kernel detected: creating bootinfo at 0x4EC000
Entry at 0x42000 in supervisor mode
[    0.000000] Linux version 6.4.10-wrs (btg@carbon) (m68k-linux-gnu-gcc (Debian 12.2.0-13) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40) #1 Sun Aug 13 22:32:30 BST 2023
[    0.000000] Zone ranges:
[    0.000000]   DMA      [mem 0x0000000000040000-0x0000001fffffffff]
[    0.000000]   Normal   empty
[    0.000000] Movable zone start for each node
[    0.000000] Early memory node ranges
[    0.000000]   node   0: [mem 0x0000000000040000-0x0000000001ffffff]
[    0.000000] Initmem setup node 0 [mem 0x0000000000040000-0x0000000001ffffff]
[    0.000000] Kernel command line: console=ttyS0,115200n8 netdev=5,0x300,eth0 root=/dev/sdb3
[    0.000000] Dentry cache hash table entries: 4096 (order: 2, 16384 bytes, linear)
[    0.000000] Inode-cache hash table entries: 2048 (order: 1, 8192 bytes, linear)
[    0.000000] Sorting __ex_table...
[    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 8056
[    0.000000] mem auto-init: stack:off, heap alloc:off, heap free:off
[    0.000000] Memory: 27340K/32512K available (3220K kernel code, 442K rwdata, 988K rodata, 120K init, 129K bss, 5172K reserved, 0K cma-reserved)
[    0.000000] NR_IRQS: 43
[    0.010000] Console: colour dummy device 80x25
[    0.010000] printk: console [ttyS0] enabled
[    0.100000] Calibrating delay loop... 26.16 BogoMIPS (lpj=130816)
[    0.210000] pid_max: default: 32768 minimum: 301
[    0.220000] Mount-cache hash table entries: 1024 (order: 0, 4096 bytes, linear)
[    0.230000] Mountpoint-cache hash table entries: 1024 (order: 0, 4096 bytes, linear)
[    0.270000] cblist_init_generic: Setting adjustable number of callback queues.
[    0.270000] cblist_init_generic: Setting shift to 0 and lim to 1.
[    0.290000] devtmpfs: initialized
[    0.320000] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 19112604462750000 ns
[    0.320000] futex hash table entries: 256 (order: -1, 3072 bytes, linear)
[    0.360000] NET: Registered PF_NETLINK/PF_ROUTE protocol family
[    0.370000] DMA: preallocated 128 KiB GFP_KERNEL pool for atomic allocations
[    0.380000] DMA: preallocated 128 KiB GFP_KERNEL|GFP_DMA pool for atomic allocations
[    0.440000] SCSI subsystem initialized
[    0.800000] NET: Registered PF_INET protocol family
[    0.810000] IP idents hash table entries: 2048 (order: 2, 16384 bytes, linear)
[    0.840000] tcp_listen_portaddr_hash hash table entries: 1024 (order: 0, 4096 bytes, linear)
[    0.840000] Table-perturb hash table entries: 65536 (order: 6, 262144 bytes, linear)
[    0.850000] TCP established hash table entries: 1024 (order: 0, 4096 bytes, linear)
[    0.850000] TCP bind hash table entries: 1024 (order: 1, 8192 bytes, linear)
[    0.860000] TCP: Hash tables configured (established 1024 bind 1024)
[    0.860000] UDP hash table entries: 256 (order: 0, 4096 bytes, linear)
[    0.870000] UDP-Lite hash table entries: 256 (order: 0, 4096 bytes, linear)
[    0.880000] NET: Registered PF_UNIX/PF_LOCAL protocol family
[    0.900000] workingset: timestamp_bits=30 max_order=13 bucket_order=0
[    1.300000] fb0: Q40 frame buffer alive and kicking !
[    1.310000] Serial: 8250/16550 driver, 8 ports, IRQ sharing disabled
[    1.320000] serial8250: ttyS0 at I/O 0x3f8 (irq = 4, base_baud = 115200) is a 16450
[    1.340000] serial8250: ttyS1 at I/O 0x2f8 (irq = 3, base_baud = 115200) is a 16450
[    1.560000] loop: module loaded
[    1.570000] atari-falcon-ide atari-falcon-ide.0: Atari Falcon and Q40/Q60 PATA controller
[    1.590000] scsi host0: pata_falcon
[    1.600000] ata1: PATA max PIO4 cmd 0x1f0 ctl 0x3f6 irq 14
[    1.610000] atari-falcon-ide atari-falcon-ide.1: Atari Falcon and Q40/Q60 PATA controller
[    1.650000] scsi host1: pata_falcon
[    1.660000] ata2: PATA max PIO4 cmd 0x170 ctl 0x376 irq 15
[    1.760000] ne ne.0 (unnamed net_device) (uninitialized): NE*000 ethercard probe at 0x300:
[    1.760000] 00:00:e8:cf:2e:39
[    1.780000] ne ne.0 eth0: RTL8019 found at 0x300, using IRQ 5.
[    1.790000] PPP generic driver version 2.4.2
[    1.810000] serio: Q40 kbd registered
[    1.840000] NET: Registered PF_INET6 protocol family
[    1.870000] input: AT Raw Set 2 keyboard as /devices/platform/q40kbd/serio0/input/input0
[    1.910000] Segment Routing with IPv6
[    1.920000] In-situ OAM (IOAM) with IPv6
[    2.110000] ata1.00: CFA: InnoDisk Corp. - iCF4000 2GB, 080414S4, max UDMA/66
[    2.110000] ata1.00: 4095504 sectors, multi 2: LBA 
[    2.120000] ata1.01: CFA: SDCFHS-016G, HDX13.04, max UDMA/100
[    2.120000] ata1.01: 31293360 sectors, multi 0: LBA48 
[    2.140000] ata1.00: configured for PIO
[    2.140000] ata1.01: configured for PIO
[    2.150000] scsi 0:0:0:0: Direct-Access     ATA      InnoDisk Corp. - 14S4 PQ: 0 ANSI: 5
[    2.190000] scsi 0:0:1:0: Direct-Access     ATA      SDCFHS-016G      3.04 PQ: 0 ANSI: 5
[    2.230000] sd 0:0:0:0: [sda] 4095504 512-byte logical blocks: (2.10 GB/1.95 GiB)
[    2.230000] sd 0:0:0:0: [sda] Write Protect is off
[    2.240000] sd 0:0:0:0: [sda] Write cache: disabled, read cache: enabled, doesn't support DPO or FUA
[    2.250000] sd 0:0:0:0: [sda] Preferred minimum I/O size 512 bytes
[    2.260000] sd 0:0:1:0: [sdb] 31293360 512-byte logical blocks: (16.0 GB/14.9 GiB)
[    2.280000] sd 0:0:1:0: [sdb] Write Protect is off
[    2.280000] sd 0:0:1:0: [sdb] Write cache: disabled, read cache: enabled, doesn't support DPO or FUA
[    2.290000] sd 0:0:1:0: [sdb] Preferred minimum I/O size 512 bytes
[    2.360000] sd 0:0:0:0: [sda] Attached SCSI disk
[    2.370000]  sdb: sdb1 sdb2 sdb3
[    2.400000] sd 0:0:1:0: [sdb] Attached SCSI removable disk
[    2.460000] EXT4-fs (sdb3): INFO: recovery required on readonly filesystem
[    2.470000] EXT4-fs (sdb3): write access will be enabled during recovery
[    2.730000] EXT4-fs (sdb3): recovery complete
[    2.760000] EXT4-fs (sdb3): mounted filesystem f8a23063-b7c5-46f5-8693-5e1ae0b418b0 ro with ordered data mode. Quota mode: disabled.
[    2.760000] VFS: Mounted root (ext4 filesystem) readonly on device 8:19.
[    2.780000] devtmpfs: mounted
[    2.780000] Freeing unused kernel image (initmem) memory: 120K
[    2.790000] This architecture does not have kernel memory protection.
[    2.790000] Run /sbin/init as init process
[    3.910000] EXT4-fs (sdb3): re-mounted f8a23063-b7c5-46f5-8693-5e1ae0b418b0 r/w. Quota mode: disabled.
Starting syslogd: OK
Starting klogd: OK


--HkIVYKf7Bd8oPSWa
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment; filename="linux-6.4.10-q40.patch"

diff -urN linux-6.4.10.orig/arch/m68k/include/asm/kmap.h linux-6.4.10.q40/arch/m68k/include/asm/kmap.h
--- linux-6.4.10.orig/arch/m68k/include/asm/kmap.h	2023-08-11 11:14:29.000000000 +0100
+++ linux-6.4.10.q40/arch/m68k/include/asm/kmap.h	2023-08-13 15:36:32.400206567 +0100
@@ -61,7 +61,7 @@
 #define ioport_map ioport_map
 static inline void __iomem *ioport_map(unsigned long port, unsigned int nr)
 {
-	return (void __iomem *) port;
+	return (void __iomem *) port + 0x10000UL; /* NOW YOU HAVE TWO PROBLEMS */
 }
 
 #define ioport_unmap ioport_unmap
diff -urN linux-6.4.10.orig/drivers/ata/pata_falcon.c linux-6.4.10.q40/drivers/ata/pata_falcon.c
--- linux-6.4.10.orig/drivers/ata/pata_falcon.c	2023-08-11 11:14:29.000000000 +0100
+++ linux-6.4.10.q40/drivers/ata/pata_falcon.c	2023-08-13 15:47:18.426870857 +0100
@@ -43,12 +43,14 @@
 {
 	struct ata_device *dev = qc->dev;
 	struct ata_port *ap = dev->link->ap;
-	void __iomem *data_addr = ap->ioaddr.data_addr;
+	void __iomem *data_addr = ap->private_data;
 	unsigned int words = buflen >> 1;
 	struct scsi_cmnd *cmd = qc->scsicmd;
 	bool swap = 1;
 
-	if (dev->class == ATA_DEV_ATA && cmd &&
+        /* WRS: on my Q40 I need byteswapping to read from any normal disks? */
+	if (!MACH_IS_Q40 && 
+            dev->class == ATA_DEV_ATA && cmd &&
 	    !blk_rq_is_passthrough(scsi_cmd_to_rq(cmd)))
 		swap = 0;
 
@@ -165,26 +167,40 @@
 	ap->pio_mask = ATA_PIO4;
 	ap->flags |= ATA_FLAG_SLAVE_POSS | ATA_FLAG_NO_IORDY;
 
-	base = (void __iomem *)base_mem_res->start;
-	/* N.B. this assumes data_addr will be used for word-sized I/O only */
-	ap->ioaddr.data_addr		= base + 0 + 0 * 4;
-	ap->ioaddr.error_addr		= base + 1 + 1 * 4;
-	ap->ioaddr.feature_addr		= base + 1 + 1 * 4;
-	ap->ioaddr.nsect_addr		= base + 1 + 2 * 4;
-	ap->ioaddr.lbal_addr		= base + 1 + 3 * 4;
-	ap->ioaddr.lbam_addr		= base + 1 + 4 * 4;
-	ap->ioaddr.lbah_addr		= base + 1 + 5 * 4;
-	ap->ioaddr.device_addr		= base + 1 + 6 * 4;
-	ap->ioaddr.status_addr		= base + 1 + 7 * 4;
-	ap->ioaddr.command_addr		= base + 1 + 7 * 4;
-
-	base = (void __iomem *)ctl_mem_res->start;
-	ap->ioaddr.altstatus_addr	= base + 1;
-	ap->ioaddr.ctl_addr		= base + 1;
-
-	ata_port_desc(ap, "cmd 0x%lx ctl 0x%lx",
-		      (unsigned long)base_mem_res->start,
-		      (unsigned long)ctl_mem_res->start);
+	if (MACH_IS_Q40) {
+                ap->private_data = isa_itw(base_res->start);
+                ap->ioaddr.cmd_addr = ioport_map(base_res->start, 8);
+                ap->ioaddr.ctl_addr = ioport_map(ctl_res->start, 1);
+                ata_sff_std_ports(&ap->ioaddr);
+                ap->ioaddr.altstatus_addr = ap->ioaddr.ctl_addr;
+
+		ata_port_desc(ap, "cmd 0x%lx ctl 0x%lx",
+			      (unsigned long)base_res->start,
+			      (unsigned long)ctl_res->start);
+	} else {
+		base = (void __iomem *)base_mem_res->start;
+		/* N.B. this assumes data_addr will be used for word-sized I/O only */
+		ap->ioaddr.data_addr		= base + 0 + 0 * 4;
+		ap->ioaddr.error_addr		= base + 1 + 1 * 4;
+		ap->ioaddr.feature_addr		= base + 1 + 1 * 4;
+		ap->ioaddr.nsect_addr		= base + 1 + 2 * 4;
+		ap->ioaddr.lbal_addr		= base + 1 + 3 * 4;
+		ap->ioaddr.lbam_addr		= base + 1 + 4 * 4;
+		ap->ioaddr.lbah_addr		= base + 1 + 5 * 4;
+		ap->ioaddr.device_addr		= base + 1 + 6 * 4;
+		ap->ioaddr.status_addr		= base + 1 + 7 * 4;
+		ap->ioaddr.command_addr		= base + 1 + 7 * 4;
+
+		base = (void __iomem *)ctl_mem_res->start;
+		ap->ioaddr.altstatus_addr	= base + 1;
+		ap->ioaddr.ctl_addr		= base + 1;
+
+                ap->private_data = ap->ioaddr.data_addr; /* UNTESTED */
+
+		ata_port_desc(ap, "cmd 0x%lx ctl 0x%lx",
+			      (unsigned long)base_mem_res->start,
+			      (unsigned long)ctl_mem_res->start);
+	}
 
 	irq_res = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
 	if (irq_res && irq_res->start > 0) {
diff -urN linux-6.4.10.orig/drivers/net/ethernet/8390/ne.c linux-6.4.10.q40/drivers/net/ethernet/8390/ne.c
--- linux-6.4.10.orig/drivers/net/ethernet/8390/ne.c	2023-08-11 11:14:29.000000000 +0100
+++ linux-6.4.10.q40/drivers/net/ethernet/8390/ne.c	2023-08-13 20:05:09.993504684 +0100
@@ -468,8 +468,11 @@
 #endif
 	}
 
-	if (dev->irq < 2)
-	{
+	if (dev->irq < 2 
+#ifdef CONFIG_Q40
+                && !MACH_IS_Q40 /* Q40 cannot do IRQ probing, it just locks up */
+#endif
+                ) {
 		unsigned long cookie = probe_irq_on();
 		outb_p(0x50, ioaddr + EN0_IMR);	/* Enable one interrupt. */
 		outb_p(0x00, ioaddr + EN0_RCNTLO);
diff -urN linux-6.4.10.orig/Makefile linux-6.4.10.q40/Makefile
--- linux-6.4.10.orig/Makefile	2023-08-11 11:14:29.000000000 +0100
+++ linux-6.4.10.q40/Makefile	2023-08-13 14:49:35.522277706 +0100
@@ -388,7 +388,8 @@
 # Alternatively CROSS_COMPILE can be set in the environment.
 # Default value for CROSS_COMPILE is not to prefix executables
 # Note: Some architectures assign CROSS_COMPILE in their arch/*/Makefile
-ARCH		?= $(SUBARCH)
+ARCH		?= m68k
+CROSS_COMPILE   ?= m68k-linux-gnu-
 
 # Architecture as present in compile.h
 UTS_MACHINE 	:= $(ARCH)

--HkIVYKf7Bd8oPSWa--
