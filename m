Return-Path: <SRS0=Dbqx=4Y=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 345DDC10F00
	for <linux-m68k@archiver.kernel.org>; Sat,  7 Mar 2020 21:00:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id F3ABD20665
	for <linux-m68k@archiver.kernel.org>; Sat,  7 Mar 2020 21:00:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726116AbgCGVA4 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sat, 7 Mar 2020 16:00:56 -0500
Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66]:43331 "EHLO
        outpost1.zedat.fu-berlin.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726098AbgCGVA4 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sat, 7 Mar 2020 16:00:56 -0500
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.93)
          with esmtps (TLS1.2)
          tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1jAgZ1-003L6J-QL; Sat, 07 Mar 2020 22:00:51 +0100
Received: from p57bd9e8b.dip0.t-ipconnect.de ([87.189.158.139] helo=[192.168.178.139])
          by inpost2.zedat.fu-berlin.de (Exim 4.85)
          with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id <1jAgZ1-002xI5-J6>; Sat, 07 Mar 2020 22:00:51 +0100
To:     linux-m68k <linux-m68k@lists.linux-m68k.org>
From:   John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: BigRAMPlus seems to be detected now
Autocrypt: addr=glaubitz@physik.fu-berlin.de; keydata=
 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
 scOkTAZQGVpD/8AaLH4v1w==
Cc:     Debian m68k <debian-68k@lists.debian.org>
Message-ID: <2bde25bc-ce82-8442-92ae-629aaac91935@physik.fu-berlin.de>
Date:   Sat, 7 Mar 2020 22:00:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: 87.189.158.139
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi!

There is one user in the #debian-68k IRC channel who has tried installing Debian
on his A4000 with a A3660 and a BigRAMPlus installed and while the user is currently
running into problems with the kernel being stuck, to my surprise, the kernel seems
to be able to use and detect the extra memory from the BigRAMPlus (see below).

The kernel is reporting an address conflict though:

[    6.140000] Zorro: Probing AutoConfig expansion devices: 3 devices
[    6.150000]  zorro: Address space collision on device Zorro device 12128600 (Individual Computers) [??? 0x50000000-]

The question whether the lock up is caused by the BRP. But since this Amiga has only
16 MB FAST RAM, the user hasn't tested to boot without the BRP yet.

I will dig out my BRP tomorrow and see if it's actually detected in my A4000
as well with current kernel versions.

Adrian

=====================================================================================

[    0.000000] Linux version 5.4.19 (root@m68k) (gcc version 9.2.1 20200203 (Debian 9.2.1-28)) #2 Sun Mar 1 19:56:48 P0
[    0.000000] Amiga hardware found: [A4000] VIDEO BLITTER AUDIO FLOPPY A4000_IDE KEYBOARD MOUSE SERIAL PARALLEL A3000 
[    0.000000] On node 0 totalpages: 4096
[    0.000000]   DMA zone: 40 pages used for memmap
[    0.000000]   DMA zone: 0 pages reserved
[    0.000000]   DMA zone: 4096 pages, LIFO batch:0
[    0.000000] On node 1 totalpages: 65536
[    0.000000]   DMA zone: 640 pages used for memmap
[    0.000000]   DMA zone: 0 pages reserved
[    0.000000]   DMA zone: 65536 pages, LIFO batch:15
[    0.000000] pcpu-alloc: s0 r0 d32768 u32768 alloc=1*32768
[    0.000000] pcpu-alloc: [0] 0 
[    0.000000] Built 2 zonelists, mobility grouping on.  Total pages: 68952
[    0.000000] Kernel command line: debug=serial console=ttyS0 video=amifb:pal-lace BOOT_IMAGE=vmlinux
[    0.000000] Dentry cache hash table entries: 65536 (order: 6, 262144 bytes, linear)
[    0.000000] Inode-cache hash table entries: 32768 (order: 5, 131072 bytes, linear)
[    0.000000] Sorting __ex_table...
[    0.000000] mem auto-init: stack:off, heap alloc:off, heap free:off
[    0.000000] Memory: 269252K/278528K available (4312K kernel code, 365K rwdata, 984K rodata, 152K init, 201K bss, 92)
[    0.000000] random: get_random_u32 called from __kmem_cache_create+0x2e/0x528 with crng_init=0
[    0.000000] SLUB: HWalign=16, Order=0-3, MinObjects=0, CPUs=1, Nodes=8
[    0.000000] NR_IRQS: 32
[    0.000000] clocksource: ciab: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 2669697470866 ns
[    0.000000] Console: colour dummy device 80x25
[    0.260000] printk: console [ttyS0] enabled
[    0.270000] Calibrating delay loop... 115.09 BogoMIPS (lpj=575488)
[    0.370000] pid_max: default: 32768 minimum: 301
[    0.410000] Mount-cache hash table entries: 1024 (order: 0, 4096 bytes, linear)
[    0.420000] Mountpoint-cache hash table entries: 1024 (order: 0, 4096 bytes, linear)
[    0.480000] random: fast init done
[    0.580000] devtmpfs: initialized
[    0.630000] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 19112604462750000 ns
[    0.640000] futex hash table entries: 256 (order: -1, 3072 bytes, linear)
[    0.690000] NET: Registered protocol family 16
[    0.710000] DMA: preallocated 256 KiB pool for atomic allocations
[    1.560000] SCSI subsystem initialized
[    1.580000] libata version 3.00 loaded.
[    1.630000] clocksource: Switched to clocksource ciab
[    1.660000] VFS: Disk quotas dquot_6.6.0
[    1.670000] VFS: Dquot-cache hash table entries: 1024 (order 0, 4096 bytes)
[    2.290000] NET: Registered protocol family 2
[    2.340000] tcp_listen_portaddr_hash hash table entries: 512 (order: 0, 4096 bytes, linear)
[    2.350000] TCP established hash table entries: 4096 (order: 2, 16384 bytes, linear)
[    2.370000] TCP bind hash table entries: 4096 (order: 2, 16384 bytes, linear)
[    2.390000] TCP: Hash tables configured (established 4096 bind 4096)
[    2.410000] UDP hash table entries: 256 (order: 0, 4096 bytes, linear)
[    2.420000] UDP-Lite hash table entries: 256 (order: 0, 4096 bytes, linear)
[    2.450000] NET: Registered protocol family 1
[    2.460000] NET: Registered protocol family 44
[    2.510000] Initialise system trusted keyrings
[    2.520000] Key type blacklist registered
[    2.540000] workingset: timestamp_bits=11 max_order=17 bucket_order=6
[    3.130000] zbud: loaded
[    3.320000] Key type asymmetric registered
[    3.350000] Asymmetric key parser 'x509' registered
[    3.370000] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 252)
[    3.380000] io scheduler mq-deadline registered
[    3.790000] Console: switching to colour frame buffer device 80x32
[    3.850000] fb0: Amiga AGA frame buffer device, using 1280K of video memory
[    3.890000] Amiga-builtin serial driver version 4.30
[    3.910000] ttyS0 is the amiga builtin serial port
[    3.930000] parport0: Amiga built-in port using irq
[    4.030000] parport0: fix this legacy no-device port driver!
[    4.050000] FD: probing units
[    4.050000] found fd0 fd1
[    4.840000] loop: module loaded
[    6.020000] amiga-gayle-ide amiga-gayle-ide: Amiga Gayle IDE controller (A4000 style)
[    6.090000] scsi host0: pata_gayle
[    6.120000] ata1: PATA max PIO4 cmd 0xdd2020 ctl 0xdd303a irq 2
[    6.140000] Zorro: Probing AutoConfig expansion devices: 3 devices
[    6.150000]  zorro: Address space collision on device Zorro device 12128600 (Individual Computers) [??? 0x50000000-]
[    6.200000] mousedev: PS/2 mouse device common for all mice
[    6.220000] input: amiga-keyboard as /devices/platform/amiga-keyboard/input/input0
[    6.240000] input: amiga-mouse as /devices/platform/amiga-mouse/input/input1
[    6.270000] input: Amiga joystick as /devices/virtual/input/input2
[    6.300000] input: m68k beeper as /devices/platform/m68kspkr/input/input3
[    6.330000] rtc-rp5c01 rtc-rp5c01: registered as rtc0
[    6.350000] ledtrig-cpu: registered to indicate activity on CPUs
[    6.390000] Amiga DMA sound driver rev 016 installed
[    6.400000] Core driver edition 01.06 : AMIGA driver edition 00.04
[    6.410000] Write will use    4 fragments of   32768 bytes as default
[    6.430000] NET: Registered protocol family 17
[    6.450000] mpls_gso: MPLS GSO support
[    6.470000] registered taskstats version 1
[    6.480000] Loading compiled-in X.509 certificates
[    6.490000] zswap: loaded using pool lzo/zbud
[    6.530000] Key type ._fscrypt registered
[    6.540000] Key type .fscrypt registered
[    6.680000] random: crng init done
[   28.580000] watchdog: BUG: soft lockup - CPU#0 stuck for 22s! [scsi_eh_0:57]
[   28.580000] Modules linked in:
[   28.580000] Format 00  Vector: 0078  PC: 002c3f1a  Status: 2210    Not tainted
[   28.580000] ORIG_D0: ffffffff  D0: 95eb9164  A2: 00ed4c60  A1: 00ed14a6
[   28.580000] A0: 0054d2de  D5: 30870f62  D4: 0000000e
[   28.580000] D3: ffff95f9  D2: 4f8a597a  D1: 5f5936c3

-- 
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer - glaubitz@debian.org
`. `'   Freie Universitaet Berlin - glaubitz@physik.fu-berlin.de
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
