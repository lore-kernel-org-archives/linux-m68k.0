Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1C7AC001B0
	for <linux-m68k@archiver.kernel.org>; Sun, 23 Jul 2023 08:35:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229610AbjGWIfj convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Sun, 23 Jul 2023 04:35:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229469AbjGWIfi (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sun, 23 Jul 2023 04:35:38 -0400
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEAFBE7B
        for <linux-m68k@lists.linux-m68k.org>; Sun, 23 Jul 2023 01:35:34 -0700 (PDT)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-579e5d54e68so41081717b3.1
        for <linux-m68k@lists.linux-m68k.org>; Sun, 23 Jul 2023 01:35:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690101334; x=1690706134;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BvKp1E7DmC4AffDqkh0hzltSEC8UlMfdTytYi5wivqM=;
        b=KQTao09BXV3+cI+dZSK1ZBRvZNHbrjdnikg8Y3KkJEomEy1LEMspg+addqJ2jgUkA4
         +mzp5CxqTl9LCN5B15yzs2g7mK7YgTpf4yEHc0Mh4v3gelCQ/dolY+9GIes78168dyGj
         DrZt4Rrh4MzsNvghb1PCGvKFuxUfukirBDY2zMZC+ZqqWVtiXyL4gQNxdXg/UIxgJCHl
         ZTJVp9fZJwmJC/45O6lil2w3lAGLMBwZ529wosCFxeuV6yQsE4UkXXjbXKUDNJ8+36dY
         OAfJXR4Bmhu16vLSPMuBmb6dm6fSOiQFjTEEDBuIm7qB/aUUypJyc4C67hHEkfwI/7kj
         0kMQ==
X-Gm-Message-State: ABy/qLbcFIHgWix5flb8Kn2nI3I17PQRjFpY2E897dBHT87ncTpMdvqr
        FxgrfI41lOH/DVTP7YAU2DHJT4psIpOaYg==
X-Google-Smtp-Source: APBJJlGYyfkCeAQTfuxrZrPW7B+fuHAOC9t6FnAZUxeGJtzK7EkHprTcsRlgbjzF69VdSXWE+KJO1w==
X-Received: by 2002:a81:52cd:0:b0:577:bc0:2d55 with SMTP id g196-20020a8152cd000000b005770bc02d55mr4200783ywb.33.1690101333570;
        Sun, 23 Jul 2023 01:35:33 -0700 (PDT)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com. [209.85.128.178])
        by smtp.gmail.com with ESMTPSA id i142-20020a816d94000000b0056ffdec590csm2087348ywc.41.2023.07.23.01.35.33
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Jul 2023 01:35:33 -0700 (PDT)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-579e5d54e68so41081607b3.1
        for <linux-m68k@lists.linux-m68k.org>; Sun, 23 Jul 2023 01:35:33 -0700 (PDT)
X-Received: by 2002:a81:a191:0:b0:577:3cd0:384 with SMTP id
 y139-20020a81a191000000b005773cd00384mr3908297ywg.15.1690101333008; Sun, 23
 Jul 2023 01:35:33 -0700 (PDT)
MIME-Version: 1.0
References: <ZLvZmVfzJNHlPTlJ@sowerbutts.com>
In-Reply-To: <ZLvZmVfzJNHlPTlJ@sowerbutts.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Sun, 23 Jul 2023 10:35:21 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUU62jjunJh9cqSqHT87B0H0A4udOOPs=WN7WZKpcagVA@mail.gmail.com>
Message-ID: <CAMuHMdUU62jjunJh9cqSqHT87B0H0A4udOOPs=WN7WZKpcagVA@mail.gmail.com>
Subject: Re: Linux 6.4.4 on m68k - Q40 - pata_falcon causes oops at boot time
To:     William R Sowerbutts <will@sowerbutts.com>
Cc:     Finn Thain <fthain@linux-m68k.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Will,

CC linux-m68k
CC Finn

On Sat, Jul 22, 2023 at 3:29 PM William R Sowerbutts
<will@sowerbutts.com> wrote:
> I am writing to you as you're listed as the maintainer of the Linux M68K
> architecture.
>
> Sorry for the long email! The TL;DR is that pata_falcon.c on Q40 is broken
> because it tries to access the IDE hardware at the wrong address, but I'm not
> sure which of several possible solutions might be the best.

Thanks for your (extensive) bug report!

> Previously I have ported Linux 4.5 and later 6.2 to a homebrew 68030 machine
> (KISS-68030) which involved adding a new machine type and writing some
> drivers, so I have a little bit of experience hacking on the kernel.

Very cool!

> I thought it might be interesting to have another M68K machine around, so I
> recently acquired a Q40 machine (a Sinclair QL successor with 40MHz 68040,
> 32MB RAM). It was broken and missing several components but I've fixed it up
> and I believe the hardware is now reliable.
>
> I've built Linux 6.2.1 and 6.4.4 kernels with Q40 support based on the
> kernel.org sources (both with and without my patches for KISS-68030) and
> tested booting on the Q40.
>
> If I omit the pata_falcon driver it boots fine, only dying when it finds no
> root filesystem available to mount.
>
> With the pata_falcon driver compiled in, however, it dies as shown below,
> while trying to access an ISA I/O port in the drivers/ata/libsff-ata.c code
> which pata_falcon uses.
>
> I did a little digging and it appears the root of the problem is that it is
> accessing the wrong address when trying to access the IDE taskfile registers.
> I believe this is because ISA addresses are being translated twice. The first
> translation makes sense but the second should not happen and results in the
> wrong address.
>
> The Q40 has an ISA bus through which the IDE bus is accessed. One of the
> CPLDs will synthesise ISA I/O and memory cycles from CPU memory accesses to
> certain regions of the physical address space.
>
> I traced through the code to try and understand the problem:
>
> I'll use 0x3f6 as an example ISA port address since this is what is being
> accessed when the crash occurs.
>
> First the correct ISA port address (0x3f6) is translated to the correct MMIO
> address (0xff400000 + 4 * 0x3f6 = 0xff400fd8).  This is done when the
> platform device is declared in arch/m68k/q40/config.c around line 288.
>
> Then this address is passed to pata_falcon which computes the correct MMIO
> addresses for the ATA task file registers in drivers/ata/pata_falcon.c around
> line 168 (ap->ioaddr.altstatus_addr = 0xff400fd8 + 1 = 0xff400fd9)
>
> The access to the hardware registers is performed in drivers/ata/libata-sff.c
> which uses ioread8/iowrite8. These functions are defined in lib/iomap.c.
> These functions look at the address passed it, determine that it is an MMIO
> address, and pass it to readb/writeb. This is the first error, we actually
> want to do an ISA I/O cycle, not memory cycle, but being passed a
> pre-translated address confuses these two functions.
>
> arch/m68k/include/asm/io_mm.h defines inb/outb/readb/writeb etc. They
> translate the provided address into the MMIO address in the Q40s physical
> address space and then perform the MMIO access.  This is where the second,
> unnecessary, translation takes place, and the resulting address is wrong:
> (0xff800000 + 1 + 4 * 0xff400fd9) & 0xffffffff = 0xfc803f65 -- and this is
> the address accessed when we get the oops.

Looks like something was missed in commit 44b1fbc0f5f30e66 ("m68k/q40:
Replace q40ide driver with pata_falcon and falconide") in v5.14.
Before, Q40 used its own IDE driver (q40ide, CONFIG_BLK_DEV_Q40IDE).
It might be a good idea to verify that IDE works in v5.13, as something
else might have been broken along the long road since last time someone
used IDE on Q40.

> I made an initial attempt to fix this: I rewrote pata_falcon.c to use the IO
> resources (untranslated ISA port addresses) and to store these in the
> ap->ioaddr struct instead:
>
> +        ap->ioaddr.cmd_addr = base_res->start;
> +        ap->ioaddr.ctl_addr = ctl_res->start;
> +        ata_sff_std_ports(&ap->ioaddr);
> +        ap->ioaddr.altstatus_addr = ap->ioaddr.ctl_addr;
>
> (one also has to fix up the pata_falcon_data_xfer function)
>
> This causes the ioread8/iowrite8 functions to complain loudly about "Bad IO
> access", because it wants me to be using cookies provided by ioport_map().
>
> Try two, using devm_ioport_map():
>
> +        ap->ioaddr.cmd_addr = devm_ioport_map(&pdev->dev, base_res->start, 8);
> +        ap->ioaddr.ctl_addr = devm_ioport_map(&pdev->dev, ctl_res->start, 1);
> +        ata_sff_std_ports(&ap->ioaddr);
> +        ap->ioaddr.altstatus_addr = ap->ioaddr.ctl_addr;
>
> This feels like the correct solution to me, however it also fails, because
> devm_ioport_map() only returns NULL without CONFIG_HAS_IOPORT_MAP -- but I
> think it should otherwise work.
>
> I tried using ioport_map() instead of devm_ioport_map, but the m68k version
> of this just returns the address without the offset that ioread8/iowrite8
> check for (without this offset it complains "Bad IO access").  I hacked up
> arch/m68k/include/asm/kmap.h to add this offset (wrong way to fix this, I
> know) and it works: disk is detected, partition table read from the media,
> happy days!
>
> [    1.680000] ata1: PATA max PIO4 cmd 0x1f0 ctl 0x3f6 irq 14
> [    1.970000] ata1.00: CFA: InnoDisk Corp. - iCF4000 2GB, 080414S4, max UDMA/66
> [    1.970000] ata1.00: 4095504 sectors, multi 2: LBA
> [    1.980000] ata1.00: configured for PIO
> [    1.990000] scsi 0:0:0:0: Direct-Access     ATA      InnoDisk Corp. - 14S4 PQ: 0 ANSI: 5
> [    2.040000] sd 0:0:0:0: [sda] 4095504 512-byte logical blocks: (2.10 GB/1.95 GiB)
> [    2.040000] sd 0:0:0:0: [sda] Write Protect is off
> [    2.060000] sd 0:0:0:0: [sda] Write cache: disabled, read cache: enabled, doesn't support DPO or FUA
> [    2.070000] sd 0:0:0:0: [sda] Preferred minimum I/O size 512 bytes
> [    2.300000]  sda: AHDI sda1 sda2 sda3
> [    2.330000] sd 0:0:0:0: [sda] Attached SCSI disk
>
> So the driver code is apparently functional.
>
> I feel that turning on CONFIG_HAS_IOPORT_MAP is part of the answer here. But
> at this point I'm beyond changing a single driver and into much wider M68K
> changes which is why I am reaching out for advice!
>
> I could alternatively fix this by further rewriting pata_falcon to replace
> the libata-sff.c functions that perform I/O access with my own versions that
> call inb/outb instead of ioread8/iowrite8 -- but this feels like the wrong
> place to solve the problem ... If I could fix ioport_map and ioread*/iowrite*
> then any ISA hardware driver using this interface should become usable on the
> Q40.
>
> Sorry again for the long email -- just trying to give you enough detail to
> understand the problem fully!
>
> Thanks
>
> Will
>
> --
>
>
> [    0.000000] Linux version 6.4.4-wrs (btg@carbon) (m68k-linux-gnu-gcc (Debian 12.2.0-13) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40) #1 Sat Jul 22 12:13:58 BST 2023
> [    0.000000] Zone ranges:
> [    0.000000]   DMA      [mem 0x0000000000040000-0x0000001fffffffff]
> [    0.000000]   Normal   empty
> [    0.000000] Movable zone start for each node
> [    0.000000] Early memory node ranges
> [    0.000000]   node   0: [mem 0x0000000000040000-0x0000000001ffffff]
> [    0.000000] Initmem setup node 0 [mem 0x0000000000040000-0x0000000001ffffff]
> [    0.000000] Kernel command line: console=ttyS2,115200n8 earlyprintk=ttyS2,115200  BOOT_IMAGE=vmlinux
> [    0.000000] Unknown kernel command line parameters "BOOT_IMAGE=vmlinux", will be passed to user space.
> [    0.000000] Dentry cache hash table entries: 4096 (order: 2, 16384 bytes, linear)
> [    0.000000] Inode-cache hash table entries: 2048 (order: 1, 8192 bytes, linear)
> [    0.000000] Sorting __ex_table...
> [    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 8056
> [    0.000000] mem auto-init: stack:off, heap alloc:off, heap free:off
> [    0.000000] Memory: 27340K/32512K available (3220K kernel code, 443K rwdata, 988K rodata, 120K init, 129K bss, 5172K reserved, 0K cma-reserved)
> [    0.000000] NR_IRQS: 43
> [    0.000000] Console: colour dummy device 80x25
> [    0.000000] printk: console [ttyS2] enabled
> [    0.090000] Calibrating delay loop... 26.16 BogoMIPS (lpj=130816)
> [    0.200000] pid_max: default: 32768 minimum: 301
> [    0.210000] Mount-cache hash table entries: 1024 (order: 0, 4096 bytes, linear)
> [    0.220000] Mountpoint-cache hash table entries: 1024 (order: 0, 4096 bytes, linear)
> [    0.260000] cblist_init_generic: Setting adjustable number of callback queues.
> [    0.260000] cblist_init_generic: Setting shift to 0 and lim to 1.
> [    0.280000] devtmpfs: initialized
> [    0.310000] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 19112604462750000 ns
> [    0.320000] futex hash table entries: 256 (order: -1, 3072 bytes, linear)
> [    0.360000] NET: Registered PF_NETLINK/PF_ROUTE protocol family
> [    0.370000] DMA: preallocated 128 KiB GFP_KERNEL pool for atomic allocations
> [    0.370000] DMA: preallocated 128 KiB GFP_KERNEL|GFP_DMA pool for atomic allocations
> [    0.430000] SCSI subsystem initialized
> [    0.790000] NET: Registered PF_INET protocol family
> [    0.800000] IP idents hash table entries: 2048 (order: 2, 16384 bytes, linear)
> [    0.830000] tcp_listen_portaddr_hash hash table entries: 1024 (order: 0, 4096 bytes, linear)
> [    0.840000] Table-perturb hash table entries: 65536 (order: 6, 262144 bytes, linear)
> [    0.850000] TCP established hash table entries: 1024 (order: 0, 4096 bytes, linear)
> [    0.850000] TCP bind hash table entries: 1024 (order: 1, 8192 bytes, linear)
> [    0.860000] TCP: Hash tables configured (established 1024 bind 1024)
> [    0.870000] UDP hash table entries: 256 (order: 0, 4096 bytes, linear)
> [    0.870000] UDP-Lite hash table entries: 256 (order: 0, 4096 bytes, linear)
> [    0.880000] NET: Registered PF_UNIX/PF_LOCAL protocol family
> [    0.910000] workingset: timestamp_bits=30 max_order=13 bucket_order=0
> [    1.310000] fb0: Q40 frame buffer alive and kicking !
> [    1.320000] Serial: 8250/16550 driver, 8 ports, IRQ sharing disabled
> [    1.330000] serial8250: ttyS0 at I/O 0x3f8 (irq = 4, base_baud = 115200) is a 16450
> [    1.340000] serial8250: ttyS1 at I/O 0x2f8 (irq = 3, base_baud = 115200) is a 16450
> [    1.360000] serial8250: ttyS2 at I/O 0x3e8 (irq = 4, base_baud = 115200) is a 16550A
> [    1.380000] serial8250: ttyS3 at I/O 0x2e8 (irq = 3, base_baud = 115200) is a 16550A
> [    1.590000] loop: module loaded
> [    1.590000] atari-falcon-ide atari-falcon-ide.0: Atari Falcon and Q40/Q60 PATA controller
> [    1.600000] Unable to handle kernel access at virtual address (ptrval)
> [    1.600000] Oops: 00000000
> [    1.600000] Modules linked in:
> [    1.600000] PC: [<001bb4aa>] iowrite8+0x1c/0x46
> [    1.600000] SR: 2710  SP: (ptrval)  a2: 007d5570
> [    1.600000] d0: fc803f65    d1: 0000000a    d2: 00002000    d3: 00000000
> [    1.600000] d4: 00000000    d5: 0021178a    a0: fc803f65    a1: 00000000
> [    1.600000] Process swapper (pid: 1, task=(ptrval))
> [    1.600000] Frame format=7 eff addr=007d7dd4 ssw=04a5 faddr=fc803f65
> [    1.600000] wb 1 stat/addr/data: 0005 0091568d 009156c8
> [    1.600000] wb 2 stat/addr/data: 00a5 fc803f65 0000000a
> [    1.600000] wb 3 stat/addr/data: 0025 fc803f65 0000000a
> [    1.600000] push data: 009156c8 00000000 ff400fd8 09ffffff
> [    1.600000] Stack from 007d7d80:
> [    1.600000]         00210060 0000000a ff400fd9 0021008a 00914000 0000000a 00914000 0020beee
> [    1.600000]         00914000 00965bc0 0020c2f4 00914000 00000001 00203de4 00914000 001ea3e0
> [    1.600000]         0000000e 0034a504 00965bc0 0020be4c 007fe000 00965bc0 00204482 00965bc0
> [    1.600000]         001ea3e0 007f9940 00000000 00000000 00002080 00914000 0020be4c 007fe000
> [    1.600000]         0049d366 00965bc0 0000000e 0021178a 00000080 0034a504 00000000 00000000
> [    1.600000]         007fe00a 00465d40 00306e00 0090fcb4 001ea98a 007fe000 007fe00a 00465d40
> [    1.600000] Call Trace: [<00210060>] ata_sff_set_devctl+0x3c/0x42
> [    1.600000]  [<0021008a>] ata_sff_freeze+0x24/0x4c
> [    1.600000]  [<0020beee>] __ata_port_freeze+0x3a/0x46
> [    1.600000]  [<0020c2f4>] ata_eh_freeze_port+0x1c/0x24
> [    1.600000]  [<00203de4>] ata_host_start+0x112/0x130
> [    1.600000]  [<001ea3e0>] platform_get_resource+0x0/0x48
> [    1.600000]  [<0020be4c>] ata_port_desc+0x0/0x68
> [    1.600000]  [<00204482>] ata_host_activate+0x20/0xf8
> [    1.600000]  [<001ea3e0>] platform_get_resource+0x0/0x48
> [    1.600000]  [<00002080>] do_one_initcall+0x0/0x184
> [    1.600000]  [<0020be4c>] ata_port_desc+0x0/0x68
> [    1.600000]  [<0049d366>] pata_falcon_init_one+0x1f8/0x206
> [    1.600000]  [<0021178a>] ata_sff_interrupt+0x0/0x144
> [    1.600000]  [<00306e00>] klist_next+0x0/0x80
> [    1.600000]  [<001ea98a>] platform_probe+0x22/0x4e
> [    1.600000]  [<001e916e>] really_probe+0xfa/0x200
> [    1.600000]  [<001e9366>] driver_probe_device+0x20/0x78
> [    1.600000]  [<00314f4a>] strcpy+0x0/0x1c
> [    1.600000]  [<001e9502>] __driver_attach+0xbe/0xce
> [    1.600000]  [<00306e00>] klist_next+0x0/0x80
> [    1.600000]  [<001e7930>] bus_for_each_dev+0x62/0x86
> [    1.600000]  [<001e8b7c>] driver_attach+0x16/0x1c
> [    1.600000]  [<001e9444>] __driver_attach+0x0/0xce
> [    1.600000]  [<001e85ec>] bus_add_driver+0x96/0x18c
> [    1.600000]  [<001e9ba2>] driver_register+0x9c/0xda
> [    1.600000]  [<001ea932>] __platform_driver_probe+0x64/0x9a
> [    1.600000]  [<0049d156>] pata_falcon_driver_init+0x0/0x18
> [    1.600000]  [<0049d168>] pata_falcon_driver_init+0x12/0x18
> [    1.600000]  [<0049d16e>] pata_falcon_init_one+0x0/0x206
> [    1.600000]  [<000020da>] do_one_initcall+0x5a/0x184
> [    1.600000]  [<00314f4a>] strcpy+0x0/0x1c
> [    1.600000]  [<00028354>] parse_args+0x0/0x25e
> [    1.600000]  [<00002080>] do_one_initcall+0x0/0x184
> [    1.600000]  [<00060006>] check_max_stack_depth+0x188/0x1f8
> [    1.600000]  [<0048f4ba>] kernel_init_freeable+0x132/0x18a
> [    1.600000]  [<0048f508>] kernel_init_freeable+0x180/0x18a
> [    1.600000]  [<0049d156>] pata_falcon_driver_init+0x0/0x18
> [    1.600000]  [<000286a8>] list_del_init+0x0/0x1c
> [    1.600000]  [<00015cbc>] kernel_thread+0x0/0x68
> [    1.600000]  [<00320c50>] kernel_init+0x0/0xec
> [    1.600000]  [<00320c64>] kernel_init+0x14/0xec
> [    1.600000]  [<00320c50>] kernel_init+0x0/0xec
> [    1.600000]  [<00002898>] ret_from_kernel_thread+0xc/0x14
> [    1.600000]
> [    1.600000] Code: 0000 650e e588 0680 ff80 0001 2040 1081 <4e75> 0c80 0001 0000 6310 0280 0000 ffff e588 0680 ff40 0001 60e2 2f7c 003e 1365
> [    1.600000] Disabling lock debugging due to kernel taint
> [    1.600000] note: swapper[1] exited with irqs disabled
> [    1.610000] Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
> [    1.610000] ---[ end Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b ]---
>
>
>
> _________________________________________________________________________
> William R Sowerbutts                                  will@sowerbutts.com
> "Carpe post meridiem"                               http://sowerbutts.com
>          main(){char*s=">#=0> ^#X@#@^7=",c=0,m;for(;c<15;c++)for
>          (m=-1;m<7;putchar(m++/6&c%3/2?10:s[c]-31&1<<m?42:32));}
>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
