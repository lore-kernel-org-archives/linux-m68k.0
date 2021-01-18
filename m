Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7B8CC433DB
	for <linux-m68k@archiver.kernel.org>; Mon, 18 Jan 2021 20:03:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B138C22B49
	for <linux-m68k@archiver.kernel.org>; Mon, 18 Jan 2021 20:03:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437100AbhARUDf (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 18 Jan 2021 15:03:35 -0500
Received: from elvis.franken.de ([193.175.24.41]:34472 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2437877AbhARUCP (ORCPT <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 18 Jan 2021 15:02:15 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1l1aiE-000337-00; Mon, 18 Jan 2021 21:01:18 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 42F6AC0930; Mon, 18 Jan 2021 21:01:10 +0100 (CET)
Date:   Mon, 18 Jan 2021 21:01:10 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Sam Creasey <sammy@sammy.net>
Cc:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
Subject: Re: Booting Linux on Sun3 machines
Message-ID: <20210118200110.GA3232@alpha.franken.de>
References: <9fd0f739-1b4b-6ce1-6a02-02375b4b574f@physik.fu-berlin.de>
 <CAMuHMdW5Of5dJwVjBytZyuTw3fxv1vPXrTcB6EzLUVW6T3Jsbw@mail.gmail.com>
 <20210116010503.GI1344617@anhedonia>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210116010503.GI1344617@anhedonia>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Fri, Jan 15, 2021 at 08:05:03PM -0500, Sam Creasey wrote:
> Honestly, it probably doesn't boot.  The last kernel I knew to boot
> successfully was 2.6.16, and that required patches.

I just checked and my latest running kernel was 3.8.0-rc2 and the local
changes don't look too scary. Bootlog on a 3/160 emulated by TME below.

Thomas.

Linux version 3.8.0-rc2-sun3-84527-g5b3da89-dirty (tsbogend@solo.franken.de) (gcc version 4.3.5 (Debian 4.3.5-4) ) #238 Sun Jan 6 17:25:46 CET 2013
ARCH: SUN3
TYPE: Sun 3/160 Series
Ethernet address: 8:0:20:1:2:3
mapped: vaddr=fe00000 [fe] pte=d7000000 [0000000 vw-xam io]
mapped: vaddr=fe20000 [fd] pte=db07fa00 [ff400000 vw-xam vme16]
mapped: vaddr=fe40000 [fc] pte=d007f810 [ff020000 vw-x-- memory]
mapped: vaddr=fe60000 [fb] pte=d30007ff [0ffe000 vw-xam memory]
mapped: vaddr=fe80000 [fa] pte=20000000 [0000000 --s--- memory]
mapped: vaddr=fea0000 [f9] pte=d007fb00 [ff600000 vw-x-- memory]
mapped: vaddr=fee0000 [f7] pte=f0000f70 [1ee0000 vwsx-- memory]
mapped: vaddr=ff00000 [10] pte=d3000100 [0200000 vw-xam memory]
mapped: vaddr=ff20000 [11] pte=d3000110 [0220000 vw-xam memory]
mapped: vaddr=ff40000 [12] pte=d3000120 [0240000 vw-xam memory]
mapped: vaddr=ff60000 [13] pte=d0000130 [0260000 vw-x-- memory]
mapped: vaddr=ff80000 [14] pte=d3000140 [0280000 vw-xam memory]
mapped: vaddr=ffa0000 [15] pte=d0000150 [02a0000 vw-x-- memory]
mapped: vaddr=ffc0000 [16] pte=d0000160 [02c0000 vw-x-- memory]
mapped: vaddr=ffe0000 [f8] pte=f0000f80 [1f00000 vwsx-- memory]
On node 0 totalpages: 2046
free_area_init_node: node 0, pgdat 0e2465fc, node_mem_map 0e25e020
  DMA zone: 8 pages used for memmap
  DMA zone: 0 pages reserved
  DMA zone: 2038 pages, LIFO batch:0
pcpu-alloc: s0 r0 d32768 u32768 alloc=1*32768
pcpu-alloc: [0] 0 
Built 1 zonelists in Zone order, mobility grouping off.  Total pages: 2038
Kernel command line: console=ttyS0,9600 root=/dev/nfs ip=dhcp debug init=/bin/sh
PID hash table entries: 64 (order: -5, 256 bytes)
Dentry cache hash table entries: 2048 (order: 0, 8192 bytes)
Inode-cache hash table entries: 2048 (order: 0, 8192 bytes)
Memory: 13816k/13816k available (2112k kernel code, 360k data, 80k init)
Virtual kernel memory layout:
    vector  : 0x0e2461f8 - 0x0e2465f8   (   1 KiB)
    kmap    : 0x0dc00000 - 0x0e000000   (   4 MiB)
    vmalloc : 0x0f800000 - 0x0fe00000   (   6 MiB)
    lowmem  : 0x0e000000 - 0x0effc000   (  15 MiB)
      .init : 0x0e232000 - 0x0e246000   (  80 KiB)
      .text : 0x0e004000 - 0x0e214000   (2112 KiB)
      .data : 0x0e216268 - 0x0e230ee0   ( 108 KiB)
      .bss  : 0x0e246000 - 0x0e2563a8   (  65 KiB)
NR_IRQS:200
unexpected interrupt from 124
Calibrating delay loop... 18.94 BogoMIPS (lpj=94720)
pid_max: default: 4096 minimum: 301
Mount-cache hash table entries: 1024
NET: Registered protocol family 16
bio: create slab <bio-0> at 0
SCSI subsystem initialized
NET: Registered protocol family 2
TCP established hash table entries: 1024 (order: 0, 8192 bytes)
TCP bind hash table entries: 1024 (order: -1, 4096 bytes)
TCP: Hash tables configured (established 1024 bind 1024)
TCP: reno registered
UDP hash table entries: 512 (order: 0, 8192 bytes)
UDP-Lite hash table entries: 512 (order: 0, 8192 bytes)
NET: Registered protocol family 1
RPC: Registered named UNIX socket transport module.
RPC: Registered udp transport module.
RPC: Registered tcp transport module.
RPC: Registered tcp NFSv4.1 backchannel transport module.
io scheduler noop registered
io scheduler deadline registered
io scheduler cfq registered (default)
fe02000.zs: ttyS0 at MMIO 0xfe02000 (irq = 6) is a zs (ESCC)
Console: ttyS0 (SunZilog zs0)
console [ttyS0] enabled
fe02000.zs: ttyS1 at MMIO 0xfe02004 (irq = 6) is a zs (ESCC)
eth0: SUN3 Intel 82586 found at f800000, Memaddr: 0xffd8000, Memsize: 32768, IRQ 3
TCP: cubic registered
NET: Registered protocol family 17
Sending DHCP requests ., OK
IP-Config: Got DHCP answer from 0.0.0.0, my address is 192.168.11.100
IP-Config: Complete:
     device=eth0, hwaddr=08:00:20:01:02:03, ipaddr=192.168.11.100, mask=255.255.255.0, gw=192.168.11.1
     host=192.168.11.100, domain=franken.de, nis-domain=(none)
     bootserver=0.0.0.0, rootserver=192.168.11.1, rootpath=/export/sun3
     nameserver0=192.168.7.254VFS: Mounted root (nfs filesystem) readonly on device 0:7.
sh-2.03# uname -a
Linux 192.168.11.100 3.8.0-rc2-sun3-84527-g5b3da89-dirty #238 Sun Jan 6 17:25:46 CET 2013 m68k unknown
sh-2.03# cat /proc/cpuinfo
CPU:		68020
MMU:		Sun-3
FPU:		68881
Clocking:	75.7MHz
BogoMips:	18.94
Calibration:	94720 loops



-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
