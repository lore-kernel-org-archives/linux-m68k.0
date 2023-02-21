Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A932BC636D7
	for <linux-m68k@archiver.kernel.org>; Tue, 21 Feb 2023 16:50:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233809AbjBUQu2 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 21 Feb 2023 11:50:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233775AbjBUQu1 (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Tue, 21 Feb 2023 11:50:27 -0500
X-Greylist: delayed 3113 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 21 Feb 2023 08:50:25 PST
Received: from smtpq3.tb.mail.iss.as9143.net (smtpq3.tb.mail.iss.as9143.net [212.54.42.166])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B9EB29E36
        for <linux-m68k@vger.kernel.org>; Tue, 21 Feb 2023 08:50:24 -0800 (PST)
Received: from [212.54.42.105] (helo=smtp1.tb.mail.iss.as9143.net)
        by smtpq3.tb.mail.iss.as9143.net with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.90_1)
        (envelope-from <jongk@linux-m68k.org>)
        id 1pUV2E-0005ed-CG
        for linux-m68k@vger.kernel.org; Tue, 21 Feb 2023 16:58:30 +0100
Received: from mail-lj1-f179.google.com ([209.85.208.179])
        by smtp1.tb.mail.iss.as9143.net with ESMTPA
        id UV2Dpsk8qWMlYUV2Ep3E7r; Tue, 21 Feb 2023 16:58:30 +0100
X-Env-Mailfrom: jongk@linux-m68k.org
X-Env-Rcptto: linux-m68k@vger.kernel.org
X-SourceIP: 209.85.208.179
X-CNFS-Analysis: v=2.4 cv=VqPlQc6n c=1 sm=1 tr=0 ts=63f4ea26 cx=a_exe
 a=VTRoezvS/npC8Q0+BDQU1g==:117 a=IkcTkHD0fZMA:10 a=m04uMKEZRckA:10
 a=roLDQd_9V1BsIuY2uhIA:9 a=QEXdDO2ut3YA:10
X-Authenticated-Sender: karsdejong@home.nl
Received: by mail-lj1-f179.google.com with SMTP id y44so4988911ljq.7
        for <linux-m68k@vger.kernel.org>; Tue, 21 Feb 2023 07:58:30 -0800 (PST)
X-Gm-Message-State: AO0yUKWBFIgDtsJrRz5UYtTqOu8J6H1I68psCHkK938G4i1BWk9XtyK7
        LUu80Tsj+SDmuZKgN/imqQZyaaTsUGVF+fvTyuA=
X-Google-Smtp-Source: AK7set9ul0IMCyCz3Z4wVLZ1x/IwMsZIA703wbdPewbXruB+Uioe3fZWmlUk2i4S3PerjlKpXHv6hMOM71xfsk8xZnI=
X-Received: by 2002:a2e:5ce:0:b0:295:8918:9d48 with SMTP id
 197-20020a2e05ce000000b0029589189d48mr967390ljf.6.1676995109283; Tue, 21 Feb
 2023 07:58:29 -0800 (PST)
MIME-Version: 1.0
From:   Kars de Jong <jongk@linux-m68k.org>
Date:   Tue, 21 Feb 2023 16:58:18 +0100
X-Gmail-Original-Message-ID: <CACz-3rhUo5pgNwdWHaPWmz+30Qo9xCg70wNxdf7o5x-6tXq8QQ@mail.gmail.com>
Message-ID: <CACz-3rhUo5pgNwdWHaPWmz+30Qo9xCg70wNxdf7o5x-6tXq8QQ@mail.gmail.com>
Subject: Booting 6.2.0-rc8 on HP 9000/425t - all memory is reserved
To:     "Linux/m68k" <linux-m68k@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CMAE-Envelope: MS4xfLU9CGA5/uW0S0pmoANs+420rIKBRkIvBcwyjHjBPao2TkI4pzmxRlt7k7DUx8LjOr/7nYX6RDMvLWy/Jsai/V/F8YNOZqSJLJpUtARRqGZ/WUS4qxJt
 ipb9GmFpVv/ux5Wb0rZxISapTStp+pF1UfGgFt9uXTgeyq0RVsXi88ZxKkQLyFBuzUOh2qvAr+cbGlW6wh19S40DkV3lzSYpq3w=
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi all,

I finally have my retro gear hooked up again, so I decided to test
whether a recent kernel would boot. I created a build of Geert's tree,
head of the master branch. The answer is: yes, it boots, but it gets
stuck soon.
As far as I can see, the problem appears to be that all pages are
marked as reserved. Any ideas why this happens? I would assume this is
common code and not hp300 specific.

Here is my boot log:

ABCGHIJK
Linux version 6.2.0-rc8-hp300+ (kars@htpc) (m68k-linux-gnu-gcc (Ubuntu
7.5.0-3ubuntu1~18.04) 7.5.0, GNU ld (GNU Binutils for Ubuntu) 2.30)
 #16 Sun Feb 19 12:26:43 CET 2023
printk: bootconsole [debug0] enabled
Detected HP9000 model 425t
Serial console is HP DCA at select code 9
Zone ranges:
  DMA      [mem 0x00000000fc000000-0x00000fffffffefff]
  Normal   empty
Movable zone start for each node
Early memory node ranges
  node   0: [mem 0x00000000fc000000-0x00000000ffffefff]
Initmem setup node 0 [mem 0x00000000fc000000-0x00000000ffffefff]
Built 1 zonelists, mobility grouping on.  Total pages: 16239
Kernel command line: BOOT_IMAGE=test-hp-ser root=/dev/nfs ro
console=ttyS0 nfsroot=/export/hp/root,rsize=16384,wsize=16384,nfsvers=3
nfsro
otdebug earlyprintk init=/bin/bash
Unknown kernel command line parameters "BOOT_IMAGE=test-hp-ser", will
be passed to user space.
Dentry cache hash table entries: 8192 (order: 3, 32768 bytes, linear)
Inode-cache hash table entries: 4096 (order: 2, 16384 bytes, linear)
Sorting __ex_table...
mem auto-init: stack:off, heap alloc:off, heap free:off
Memory: 0K/65532K available (3551K kernel code, 253K rwdata, 640K
rodata, 120K init, 100K bss, 65532K reserved, 0K cma-reserved)
swapper: page allocation failure: order:0, mode:0x40000(__GFP_COMP),
nodemask=(null)
CPU: 0 PID: 0 Comm: swapper Not tainted 6.2.0-rc8-hp300+ #16
Stack from 0041de38:
        0041de38 00404025 00404025 00040000 00000000 0041de58 0037133e 00404025
        0041de7c 000a9e78 00040000 00000000 00000040 000a81ac 0041de90 004037cb
        0041de70 0041df1c 000aa764 00040000 00000000 004037cb 00000000 00000001
        00000100 00000000 0041f220 003697a4 003697a4 00521000 0043175c 00431c94
        00000014 00000010 00000000 00140000 00000000 00000001 00000000 00000000
        00000000 0051fc30 00000044 10620000 00000044 10620000 00000000 00010000
Call Trace: [<00040000>] freq_constraints_init+0x70/0xa4
 [<0037133e>] dump_stack+0x10/0x16
 [<000a9e78>] warn_alloc+0x96/0x12c
 [<00040000>] freq_constraints_init+0x70/0xa4
 [<000a81ac>] get_page_from_freelist+0x0/0x86e
 [<000aa764>] __alloc_pages+0x856/0xb46
 [<00040000>] freq_constraints_init+0x70/0xa4
 [<003697a4>] sprintf+0x0/0x20
 [<003697a4>] sprintf+0x0/0x20
 [<00140000>] nfs_sysfs_init+0x2/0xe2
 [<00010000>] ovf_e3_exc+0x12/0x46
 [<000872b4>] __alloc_percpu+0x16/0x1c
 [<000b4412>] alloc_kmem_cache_cpus.isra.65+0x1e/0x3e
 [<000b4ad0>] cache_alloc_refill+0x3fc/0x5bc
 [<00040000>] freq_constraints_init+0x70/0xa4
 [<00002710>] calibrate_delay+0xee/0x236
 [<000b5ad2>] kmem_cache_alloc+0xc2/0xe0
 [<0002c95a>] parse_args+0x0/0x352
 [<00463be6>] create_kmalloc_cache+0x1c/0x86
 [<00002000>] _start+0x0/0x8
 [<004664dc>] kmem_cache_init+0x15e/0x1b0
 [<00002000>] _start+0x0/0x8
 [<00002000>] _start+0x0/0x8
 [<0036d29a>] _printk+0x0/0x16
 [<0045c474>] start_kernel+0x3c4/0x5ae
 [<0045b42c>] _sinittext+0x42c/0xab0

Mem-Info:
active_anon:0 inactive_anon:0 isolated_anon:0
 active_file:0 inactive_file:0 isolated_file:0
 unevictable:0 dirty:0 writeback:0
 slab_reclaimable:0 slab_unreclaimable:0
 mapped:0 shmem:0 pagetables:0
 sec_pagetables:0 bounce:0
 kernel_misc_reclaimable:0
 free:0 free_pcp:0 free_cma:0
DMA free:0kB boost:0kB min:0kB low:0kB high:0kB
reserved_highatomic:0KB active_anon:0kB inactive_anon:0kB
active_file:0kB inactive_file:0kB unevictable:0kB writepending:0kB
present:65532kB managed:0kB mlocked:0kB bounce:0kB free_pcp:0kB
local_pcp:0kB free_cma:0kB
lowmem_reserve[]: 0 0 0
DMA: 0*4kB 0*8kB 0*16kB 0*32kB 0*64kB 0*128kB 0*256kB 0*512kB 0*1024kB
0*2048kB 0*4096kB = 0kB
0 total pagecache pages
0 pages in swap cache
Free swap  = 0kB
Total swap = 0kB
16383 pages RAM
0 pages HighMem/MovableOnly
16383 pages reserved
Kernel panic - not syncing: Out of memory when creating slab kmalloc-64
CPU: 0 PID: 0 Comm: swapper Not tainted 6.2.0-rc8-hp300+ #16
Stack from 0041df30:
        0041df30 00404025 00404025 0051fc00 0002c95a 0041df50 0037133e 00404025
        0041df70 0036d0a6 0051fc47 0002c95a 00000000 0041f220 0040213b 0043175c
        0041df8c 00463bfa 00401f29 0040213b 00431cd2 0043175c 00002000 0041dfc8
        004664dc 0040213b 00000040 00002000 00000000 00000040 00431c94 00403fd2
        00000056 00002000 00000000 00000000 0036d29a 00000018 0041dff8 0045c474
        00000000 00000009 fc001004 00000000 fc001000 000000ff 00000000 fc47913a
Call Trace: [<0002c95a>] parse_args+0x0/0x352
 [<0037133e>] dump_stack+0x10/0x16
 [<0036d0a6>] panic+0xb2/0x234
 [<0002c95a>] parse_args+0x0/0x352
 [<00463bfa>] create_kmalloc_cache+0x30/0x86
 [<00002000>] _start+0x0/0x8
 [<004664dc>] kmem_cache_init+0x15e/0x1b0
 [<00002000>] _start+0x0/0x8
 [<00002000>] _start+0x0/0x8
 [<0036d29a>] _printk+0x0/0x16
 [<0045c474>] start_kernel+0x3c4/0x5ae
 [<0045b42c>] _sinittext+0x42c/0xab0

Mem-Info:
active_anon:0 inactive_anon:0 isolated_anon:0
 active_file:0 inactive_file:0 isolated_file:0
 unevictable:0 dirty:0 writeback:0
 slab_reclaimable:0 slab_unreclaimable:0
 mapped:0 shmem:0 pagetables:0
 sec_pagetables:0 bounce:0
 kernel_misc_reclaimable:0
 free:0 free_pcp:0 free_cma:0
DMA free:0kB boost:0kB min:0kB low:0kB high:0kB
reserved_highatomic:0KB active_anon:0kB inactive_anon:0kB
active_file:0kB inactive_file:0kB unevictable:0kB writepending:0kB
present:65532kB managed:0kB mlocked:0kB bounce:0kB free_pcp:0kB
local_pcp:0kB free_cma:0kB
lowmem_reserve[]: 0 0 0
DMA: 0*4kB 0*8kB 0*16kB 0*32kB 0*64kB 0*128kB 0*256kB 0*512kB 0*1024kB
0*2048kB 0*4096kB = 0kB
0 total pagecache pages
0 pages in swap cache
Free swap  = 0kB
Total swap = 0kB
16383 pages RAM
0 pages HighMem/MovableOnly
16383 pages reserved
Kernel panic - not syncing: Out of memory when creating slab kmalloc-64
CPU: 0 PID: 0 Comm: swapper Not tainted 6.2.0-rc8-hp300+ #16
Stack from 0041df30:
        0041df30 00404025 00404025 0051fc00 0002c95a 0041df50 0037133e 00404025
        0041df70 0036d0a6 0051fc47 0002c95a 00000000 0041f220 0040213b 0043175c
        0041df8c 00463bfa 00401f29 0040213b 00431cd2 0043175c 00002000 0041dfc8
        004664dc 0040213b 00000040 00002000 00000000 00000040 00431c94 00403fd2
        00000056 00002000 00000000 00000000 0036d29a 00000018 0041dff8 0045c474
        00000000 00000009 fc001004 00000000 fc001000 000000ff 00000000 fc47913a
Call Trace: [<0002c95a>] parse_args+0x0/0x352
 [<0037133e>] dump_stack+0x10/0x16
 [<0036d0a6>] panic+0xb2/0x234
 [<0002c95a>] parse_args+0x0/0x352
 [<00463bfa>] create_kmalloc_cache+0x30/0x86
 [<00002000>] _start+0x0/0x8
 [<004664dc>] kmem_cache_init+0x15e/0x1b0
 [<00002000>] _start+0x0/0x8
 [<00002000>] _start+0x0/0x8
 [<0036d29a>] _printk+0x0/0x16
 [<0045c474>] start_kernel+0x3c4/0x5ae
 [<0045b42c>] _sinittext+0x42c/0xab0

---[ end Kernel panic - not syncing: Out of memory when creating slab
kmalloc-64 ]---
