Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64C47C433F5
	for <linux-m68k@archiver.kernel.org>; Tue,  7 Sep 2021 03:28:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3F0EA6069E
	for <linux-m68k@archiver.kernel.org>; Tue,  7 Sep 2021 03:28:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232859AbhIGDaE (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 6 Sep 2021 23:30:04 -0400
Received: from wout3-smtp.messagingengine.com ([64.147.123.19]:52073 "EHLO
        wout3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231880AbhIGDaD (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Mon, 6 Sep 2021 23:30:03 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailout.west.internal (Postfix) with ESMTP id 43A303200902
        for <linux-m68k@vger.kernel.org>; Mon,  6 Sep 2021 23:28:57 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Mon, 06 Sep 2021 23:28:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=10FXQk
        /2lR0Mshjelv4eFFXOOle7Q4Tcv59iau1+31s=; b=OVihOLF7TvWrDAoyA1fy8a
        bt4b2wENKVS8z7Zdwl7Gb+Tvia4oPgX181GRib3ncr7+1bjg7sH41MVvVs309ZUc
        iSVGjZrt/0pDYLYADB+VdCfBYoQZCQ7Krj3fYqhV3iL7+S3gG6eo2/4+ezByim04
        BjMmQIbr+vAs5D0R15k6VlprVyTZOjVuoH8rakTpOFvOJSZ6yUyFVCKfUOpggv1J
        AtLaLi6P/qcZIDaV6UJqA5VNXMobjyJqiOOljIVJHi6OtHep0zdQlPmtU5PxH337
        Mfubb0m4cWWivYW8uzgfrYoN+U1m3hvrAfrTLmudyhGpMnhGXNjyzSS2nLaupphg
        ==
X-ME-Sender: <xms:eNw2YZNu0ucP9SC7OElfvR-Hz4ma47zV3jprZOkj7vGH7U6hpm1noA>
    <xme:eNw2Yb9Ca3WjzvUzo0EwHx0DohhkNVQkWnXs3OC5uSqCg33dTj92FcUBtwho69_9d
    ddhLOtNQlDz7ifZ4UI>
X-ME-Received: <xmr:eNw2YYRdF37rAnqYneUNyvcGE2aa22zCQHqcU4qOHOtJos8OBhJx6QCh2d9NKjeNF2f8dEgWXxgkk0ja8OWG1xzlA5Icnq3org017w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudefgedgieekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvufgjkfhfgggtsehttdertd
    dttddvnecuhfhrohhmpefhihhnnhcuvfhhrghinhcuoehfthhhrghinheslhhinhhugidq
    mheikehkrdhorhhgqeenucggtffrrghtthgvrhhnpeffudfhgeefvdeitedugfelueeghe
    ekkeefveffhfeiveetledvhfdtveffteeuudenucevlhhushhtvghrufhiiigvpedtnecu
    rfgrrhgrmhepmhgrihhlfhhrohhmpehfthhhrghinheslhhinhhugidqmheikehkrdhorh
    hg
X-ME-Proxy: <xmx:eNw2YVvViqBMsLkKHxZIrIK6dUaq5aHni-ib7-HldKd5kfW3eO5tyg>
    <xmx:eNw2YRde9OwBMozYuf_bZybcb302YvEG0eUfJVV0oP9d6TPejPgJWw>
    <xmx:eNw2YR1Wr6AqhIONtNpeTSLBtUKqyGlkGv1RpgNK5E_cmYfeMQXYcg>
    <xmx:eNw2Ybr4XGnhvtLQM0IRvt9NRD5Jhdt5Tw8SyEfUQ1Jax1pY0lbCdg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <linux-m68k@vger.kernel.org>; Mon, 6 Sep 2021 23:28:53 -0400 (EDT)
Date:   Tue, 7 Sep 2021 13:28:44 +1000 (AEST)
From:   Finn Thain <fthain@linux-m68k.org>
To:     linux-m68k@vger.kernel.org
Subject: Re: Mainline kernel crashes, was Re: RFC: remove set_fs for m68k
In-Reply-To: <31f27da7-be60-8eb-9834-748b653c2246@linux-m68k.org>
Message-ID: <ed2ca322-b957-cd52-8d2f-a8edd2785625@linux-m68k.org>
References: <20210721170529.GA14550@lst.de> <20210723051126.GA31274@lst.de> <e9fb28d4-405a-5cc6-b071-707a2edbce92@gmail.com> <8884e940-22e8-72a5-e9ec-f9b2628b6ef4@gmail.com> <251aa093-047a-b37c-4e88-d543c6fa8bc6@gmail.com> <20210815074236.GA23777@lst.de>
 <63c35a20-3eec-1825-fa18-5df28f5b6eaa@gmail.com> <20210816065851.GA26665@lst.de> <23f745f2-9086-81fb-3d9e-40ea08a1923@linux-m68k.org> <20210816075155.GA29187@lst.de> <d407a2a1-738b-5cd5-c2ed-b7250c5da8ec@gmail.com> <83571ae-10ae-2919-cde-b6b4a5769c9@linux-m68k.org>
 <dc594142-e459-533e-cac2-c7a213cec464@gmail.com> <f4ab2dcb-6761-c60b-54ce-35d0d017d371@gmail.com> <d772d22e-a945-3e35-80a2-f4783893bea@linux-m68k.org> <b2c55280-657b-51c2-065c-3fc93db050b9@gmail.com> <d7b8f7eb-fc18-c8d-fe3e-dcdf19d3f4b@linux-m68k.org>
 <755e55ba-4ce2-b4e4-a628-5abc183a557a@linux-m68k.org> <b52a10fe-3e4b-5740-d3f8-52bce3bc988@linux-m68k.org> <31f27da7-be60-8eb-9834-748b653c2246@linux-m68k.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi All,

While running stress-ng on my Quadra 630, I observed a reproducible panic 
in do_exit():

        if (unlikely(in_interrupt()))
                panic("Aiee, killing interrupt handler!");

The console log says,

running --mmap -1 --mmap-odirect --mmap-bytes 100% -t 60 --timestamp --no-rand-seed --times
stress-ng: 22:22:17.70 info:  [19803] setting to a 60 second run per stressor
stress-ng: 22:22:17.70 info:  [19803] dispatching hogs: 1 mmap
[12634.030000] Kernel panic - not syncing: Aiee, killing interrupt handler!
[12634.030000] CPU: 0 PID: 19805 Comm: stress-ng Not tainted 5.14.0-mac #2
[12634.030000] Stack from 00b27de4:
[12634.030000]         00b27de4 0045b8ea 0045b8ea 00020000 00b27e00 003cb320 0045b8ea 00b27e20
[12634.030000]         003ca326 00020000 418004fc 00b26000 060324c0 00b26000 00ae9680 00b27e5c
[12634.030000]         0001dcc2 00453506 00000009 418004fc 00b26000 00000000 0741b000 00000009
[12634.030000]         00000008 00b27f38 00ae9680 00000006 00000000 00000001 00b27e6c 0001de78
[12634.030000]         00000009 06034510 00b27eb8 000271bc 00000009 0000000f 0000000e c043c000
[12634.030000]         00000000 0741b000 00000003 00b27f98 efe91934 efe90898 00025fc6 00b26000
[12634.030000] Call Trace: [<00020000>] resource_list_free+0x36/0x52
[12634.030000]  [<003cb320>] dump_stack+0x10/0x16
[12634.030000]  [<003ca326>] panic+0xba/0x2bc
[12634.030000]  [<00020000>] resource_list_free+0x36/0x52
[12634.030000]  [<0001dcc2>] do_exit+0x87e/0x9d6
[12634.030000]  [<0001de78>] do_group_exit+0x28/0xb6
[12634.030000]  [<000271bc>] get_signal+0x126/0x720
[12634.030000]  [<00025fc6>] send_signal+0xde/0x16e
[12634.030000]  [<00004bfa>] do_notify_resume+0x38/0x60a
[12634.030000]  [<00027076>] force_sig_fault_to_task+0x36/0x3a
[12634.030000]  [<00027092>] force_sig_fault+0x18/0x1c
[12634.030000]  [<00006e68>] send_fault_sig+0x44/0xc6
[12634.030000]  [<00006204>] buserr_c+0x260/0x5ca
[12634.030000]  [<00002cd8>] do_signal_return+0x10/0x1a
[12634.030000]  [<0018800e>] ext4_fill_super+0x1da0/0x3842
[12634.030000]  [<0010800a>] fsnotify_flush_notify+0x3c/0x72
[12634.030000] 
[12634.030000] ---[ end Kernel panic - not syncing: Aiee, killing interrupt handler! ]---


I haven't found the cause yet. While investigating I tried enabling 
various debug options including CONFIG_DEBUG_SPINLOCK. I then got 
backtrace below from the same machine.

# /root/stress-ng --mmap -1 --mmap-odirect --mmap-bytes=100% -t 1800
stress-ng: info:  [49] setting to a 1800 second (30 mins, 0.00 secs) run per stressor
stress-ng: info:  [49] dispatching hogs: 1 mmap
[  248.710000] BUG: spinlock trylock failure on UP on CPU#0, stress-ng/51
[  248.710000]  lock: 0x53d4a0, .magic: dead4ead, .owner: stress-ng/51, .owner_cpu: 0
[  248.710000] CPU: 0 PID: 51 Comm: stress-ng Not tainted 5.14.0-multi-debug #2
[  248.710000] Stack from 00b159ac:
[  248.710000]         00b159ac 004da40f 004da40f 00000000 00b159c8 0043e88e 004da40f 00b159f4
[  248.710000]         0006316c 004d240e 0053d4a0 dead4ead 0095ebba 00000033 00000000 0053d4a0
[  248.710000]         00b15ae4 0055e6ac 00b15a0c 000632b2 0053d4a0 004d2488 ffffebf7 0053d458
[  248.710000]         00b15a18 0044780e 0053d4a0 00b15a3c 002b8694 0053d4a0 00000001 00000040
[  248.710000]         4bfffffe 0000001a 00528200 00528260 00b15a60 00069f6a 0000000e 00014200
[  248.710000]         00528200 00b15a5c 00b12600 00528200 00014200 00b15a7c 00069ff0 00528200
[  248.710000] Call Trace: [<0043e88e>] dump_stack+0x10/0x16
[  248.710000]  [<0006316c>] spin_dump+0x6c/0xc0
[  248.710000]  [<000632b2>] do_raw_spin_trylock+0x32/0x80
[  248.710000]  [<0044780e>] _raw_spin_trylock+0xe/0x40
[  248.710000]  [<002b8694>] add_interrupt_randomness+0x154/0x1c0
[  248.710000]  [<00069f6a>] handle_irq_event_percpu+0x2a/0x80
[  248.710000]  [<00014200>] INV_L2+0x8/0x10
[  248.710000]  [<00014200>] INV_L2+0x8/0x10
[  248.710000]  [<00069ff0>] handle_irq_event+0x30/0x80
[  248.710000]  [<0006d9e4>] handle_simple_irq+0x64/0x80
[  248.710000]  [<000695fe>] generic_handle_irq+0x3e/0x80
[  248.710000]  [<0000b944>] via1_irq+0x44/0xc0
[  248.710000]  [<000695fe>] generic_handle_irq+0x3e/0x80
[  248.710000]  [<00002ea4>] do_IRQ+0x24/0x40
[  248.710000]  [<00002d74>] auto_irqhandler_fixup+0x4/0xc
[  248.710000]  [<0000129b>] kernel_pg_dir+0x29b/0x1000
[  248.710000]  [<002b86b0>] add_interrupt_randomness+0x170/0x1c0
[  248.710000]  [<00069f6a>] handle_irq_event_percpu+0x2a/0x80
[  248.710000]  [<00069ff0>] handle_irq_event+0x30/0x80
[  248.710000]  [<0006d9e4>] handle_simple_irq+0x64/0x80
[  248.710000]  [<000695c0>] generic_handle_irq+0x0/0x80
[  248.710000]  [<000695fe>] generic_handle_irq+0x3e/0x80
[  248.710000]  [<0000bad4>] via2_irq+0x54/0x80
[  248.710000]  [<000695fe>] generic_handle_irq+0x3e/0x80
[  248.710000]  [<00002ea4>] do_IRQ+0x24/0x40
[  248.710000]  [<00002d74>] auto_irqhandler_fixup+0x4/0xc
[  248.710000]  [<00001000>] kernel_pg_dir+0x0/0x1000
[  248.710000]  [<0000129b>] kernel_pg_dir+0x29b/0x1000
[  248.710000]  [<00404040>] rtm_dump_nexthop+0x80/0x180
[  248.710000]  [<00033f20>] irq_exit+0x60/0x80
[  248.710000]  [<00002eaa>] do_IRQ+0x2a/0x40
[  248.710000]  [<00002d74>] auto_irqhandler_fixup+0x4/0xc
[  248.710000]  [<00025a9b>] _FP_CALL_TOP+0xcc9d/0xd512
[  248.710000]  [<00001000>] kernel_pg_dir+0x0/0x1000
[  248.710000]  [<00001000>] kernel_pg_dir+0x0/0x1000
[  248.710000]  [<00025a9b>] _FP_CALL_TOP+0xcc9d/0xd512
[  248.710000]  [<0000129b>] kernel_pg_dir+0x29b/0x1000
[  248.710000]  [<0019e3e4>] ext4_get_block+0x24/0x40
[  248.710000]  [<0000129b>] kernel_pg_dir+0x29b/0x1000
[  248.710000]  [<0013a8f6>] __block_write_begin_int+0x1b6/0x700
[  248.710000]  [<0000129b>] kernel_pg_dir+0x29b/0x1000
[  248.710000]  [<00001000>] kernel_pg_dir+0x0/0x1000
[  248.710000]  [<00001000>] kernel_pg_dir+0x0/0x1000
[  248.710000]  [<00001000>] kernel_pg_dir+0x0/0x1000
[  248.710000]  [<0011b176>] update_time+0x36/0x40
[  248.710000]  [<0013b3ee>] block_page_mkwrite+0xae/0x100
[  248.710000]  [<00001000>] kernel_pg_dir+0x0/0x1000
[  248.710000]  [<0019e3c0>] ext4_get_block+0x0/0x40
[  248.710000]  [<00005526>] sys_cacheflush+0x2a6/0x500
[  248.710000]  [<001a5676>] ext4_page_mkwrite+0x2f6/0x6c0
[  248.710000]  [<0019e3c0>] ext4_get_block+0x0/0x40
[  248.710000]  [<000d51c0>] find_vma+0x0/0x80
[  248.710000]  [<00444500>] down_read+0x0/0x200
[  248.710000]  [<0000129b>] kernel_pg_dir+0x29b/0x1000
[  248.710000]  [<0019e3c0>] ext4_get_block+0x0/0x40
[  248.710000]  [<000ff292>] fput+0x12/0x40
[  248.710000]  [<000cbbc0>] do_page_mkwrite+0x40/0x140
[  248.710000]  [<004478ce>] _raw_spin_unlock+0xe/0x40
[  248.710000]  [<000cd516>] do_wp_page+0x296/0x4c0
[  248.710000]  [<000cfedc>] handle_mm_fault+0x79c/0x900
[  248.710000]  [<0000129b>] kernel_pg_dir+0x29b/0x1000
[  248.710000]  [<00007402>] do_page_fault+0x102/0x240
[  248.710000]  [<0000653c>] buserr_c+0x17c/0x600
[  248.710000]  [<00002ba8>] buserr+0x20/0x28
[  248.710000]  [<0008800d>] get_next_modinfo+0xcd/0x100
[  248.710000]  [<0009800d>] cgroup1_pidlist_destroy_all+0x8d/0xc0


Apparently add_interrupt_randomness() got re-entered, causing 
spin_trylock() to contest input_pool.lock. But I don't see anything wrong 
there -- false positive?

I was able to reproduce that on both QEMU and Aranym:

[    0.000000] Linux version 5.14.0-multi-debug (fthain@nippy) (m68k-linux-gnu-gcc (btc) 6.4.0, GNU ld (btc) 2.28) #2 Sat Sep 4 15:58:43 AEST 2021
[    0.000000] Saving 202 bytes of bootinfo
[    0.000000] printk: console [debug0] enabled
[    0.000000] printk: debug: ignoring loglevel setting.
Blitter tried to read byte from register ff8a00 at 00816a
[    0.000000] Atari hardware found: VIDEL STDMA-SCSI ST_MFP YM2149 PCM CODEC DSP56K SCC ANALOG_JOY BLITTER IDE TT_CLK FDC_SPEED
[    0.000000] Zone ranges:
[    0.000000]   DMA      [mem 0x0000000000000000-0x00000081ffffffff]
[    0.000000]   Normal   empty
[    0.000000] Movable zone start for each node
[    0.000000] Early memory node ranges
[    0.000000]   node   0: [mem 0x0000000000000000-0x0000000000dfffff]
[    0.000000]   node   0: [mem 0x0000000001000000-0x00000000081fffff]
[    0.000000] Initmem setup node 0 [mem 0x0000000000000000-0x00000000081fffff]
[    0.000000] NatFeats found (ARAnyM, 1.0)
[    0.000000] initrd: 07f3ea00 - 08200000
[    0.000000] pcpu-alloc: s0 r0 d32768 u32768 alloc=1*32768
[    0.000000] pcpu-alloc: [0] 0 
[    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 32475
[    0.000000] Kernel command line: debug=par console=tty0 ignore_loglevel initcall_blacklist=ide_falcon_driver_init,nfhd_init BOOT_IMAGE=vmlinux
[    0.000000] blacklisting initcall ide_falcon_driver_init
[    0.000000] blacklisting initcall nfhd_init
[    0.000000] Unknown command line parameters: initcall_blacklist=ide_falcon_driver_init BOOT_IMAGE=vmlinux
[    0.000000] Dentry cache hash table entries: 16384 (order: 4, 65536 bytes, linear)
[    0.000000] Inode-cache hash table entries: 8192 (order: 3, 32768 bytes, linear)
[    0.000000] Sorting __ex_table...
[    0.000000] mem auto-init: stack:off, heap alloc:off, heap free:off
[    0.000000] Memory: 120072K/131072K available (4385K kernel code, 357K rwdata, 772K rodata, 148K init, 121K bss, 11000K reserved, 0K cma-reserved)
[    0.000000] SLUB: HWalign=16, Order=0-3, MinObjects=0, CPUs=1, Nodes=1
[    0.000000] NR_IRQS: 200
[    0.000000] clocksource: mfp: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 77769386670404 ns
[    0.010000] Console: colour dummy device 80x25
[    0.010000] printk: console [tty0] enabled
[    0.010000] Calibrating delay loop... 132.50 BogoMIPS (lpj=662528)
[    0.090000] pid_max: default: 32768 minimum: 301
[    0.090000] Mount-cache hash table entries: 1024 (order: 0, 4096 bytes, linear)
[    0.090000] Mountpoint-cache hash table entries: 1024 (order: 0, 4096 bytes, linear)
[    0.110000] devtmpfs: initialized
[    0.120000] random: get_random_u32 called from bucket_table_alloc+0x13e/0x180 with crng_init=0
[    0.120000] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 19112604462750000 ns
[    0.130000] futex hash table entries: 256 (order: 0, 7168 bytes, linear)
[    0.130000] NET: Registered PF_NETLINK/PF_ROUTE protocol family
[    0.130000] DMA: preallocated 128 KiB GFP_KERNEL pool for atomic allocations
[    0.140000] DMA: preallocated 128 KiB GFP_KERNEL|GFP_DMA pool for atomic allocations
[    0.190000] wait_for_initramfs() called before rootfs_initcalls
[    0.200000] SCSI subsystem initialized
[    0.200000] libata version 3.00 loaded.
[    0.210000] clocksource: Switched to clocksource mfp
[    0.280000] NET: Registered PF_INET protocol family
[    0.280000] IP idents hash table entries: 2048 (order: 2, 16384 bytes, linear)
[    0.280000] tcp_listen_portaddr_hash hash table entries: 256 (order: 0, 6144 bytes, linear)
[    0.290000] TCP established hash table entries: 1024 (order: 0, 4096 bytes, linear)
[    0.290000] TCP bind hash table entries: 1024 (order: 2, 20480 bytes, linear)
[    0.290000] TCP: Hash tables configured (established 1024 bind 1024)
[    0.290000] UDP hash table entries: 256 (order: 1, 12288 bytes, linear)
[    0.290000] UDP-Lite hash table entries: 256 (order: 1, 12288 bytes, linear)
[    0.300000] NET: Registered PF_UNIX/PF_LOCAL protocol family
[    0.300000] RPC: Registered named UNIX socket transport module.
[    0.300000] RPC: Registered udp transport module.
[    0.300000] RPC: Registered tcp transport module.
[    0.310000] RPC: Registered tcp NFSv4.1 backchannel transport module.
[    0.310000] initcall nfhd_init blacklisted
[    0.310000] Trying to unpack rootfs image as initramfs...
[    0.330000] nfeth: API 5
[    0.330000] workingset: timestamp_bits=30 max_order=15 bucket_order=0
[    0.700000] Freeing initrd memory: 2820K
[    0.710000] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 252)
[    0.720000] io scheduler mq-deadline registered
[    0.720000] atafb atafb: phys_screen_base 6dc000 screen_len 311296
[    0.730000] atafb atafb: Determined 640x480, depth 4
[    0.730000] atafb atafb:    virtual 640x972
[    0.740000] Console: switching to colour frame buffer device 80x30
[    0.750000] fb0: frame buffer device, using 304K of video memory
[    0.750000] pmac_zilog: 0.6 (Benjamin Herrenschmidt <benh@kernel.crashing.org>)
[    0.750000] Non-volatile memory driver v1.3
[    0.780000] brd: module loaded
[    1.080000] scsi host0: Atari native SCSI, irq 15, io_port 0x0, base 0x0, can_queue 1, cmd_per_lun 2, sg_tablesize 1, this_id 7, flags { }
[    1.960000] random: fast init done
[    2.890000] atari-falcon-ide atari-falcon-ide: Atari Falcon and Q40/Q60 PATA controller
[    2.950000] scsi host1: pata_falcon
[    2.970000] ata1: PATA max PIO4 cmd 0xfff00000 ctl 0xfff00038 no IRQ, using PIO polling
[    3.020000] aoe: AoE v85 initialised.
[    3.050000] mousedev: PS/2 mouse device common for all mice
[    3.330000] input: Atari Keyboard as /devices/virtual/input/input0
[    3.350000] ata1.00: NODEV after polling detection
[    3.370000] ata1.01: ATA-2: slave, , max PIO2
[    3.390000] ata1.01: 322560 sectors, multi 0: LBA 
[    3.400000] ata1.01: configured for PIO
[    3.430000] scsi 1:0:1:0: Direct-Access     ATA      slave            n/a  PQ: 0 ANSI: 5
[    3.490000] scsi 1:0:1:0: Attached scsi generic sg0 type 0
[    3.520000] sd 1:0:1:0: [sda] 322560 512-byte logical blocks: (165 MB/158 MiB)
[    3.570000] sd 1:0:1:0: [sda] Write Protect is off
[    3.590000] sd 1:0:1:0: [sda] Mode Sense: 00 3a 00 00
[    3.620000] sd 1:0:1:0: [sda] Write cache: disabled, read cache: enabled, doesn't support DPO or FUA
[    3.670000] rtc-generic rtc-generic: registered as rtc0
[    3.690000] NET: Registered PF_PACKET protocol family
[    3.730000] sd 1:0:1:0: [sda] Attached SCSI disk
[    3.760000] Freeing unused kernel image (initmem) memory: 148K
[    3.790000] This architecture does not have kernel memory protection.
[    3.810000] Run /init as init process
[    3.840000]   with arguments:
[    3.870000]     /init
[    3.880000]   with environment:
[    3.910000]     HOME=/
[    3.920000]     TERM=linux
[    3.940000]     initcall_blacklist=ide_falcon_driver_init
[    3.970000]     BOOT_IMAGE=vmlinux
[   85.240000] random: crng init done
[  139.730000] EXT4-fs (sda): mounting ext2 file system using the ext4 subsystem
[  139.770000] EXT4-fs (sda): mounted filesystem without journal. Opts: (null). Quota mode: disabled.
[ 4089.070000] BUG: spinlock trylock failure on UP on CPU#0, stress-ng/1341
[ 4089.070000]  lock: 0x53d4a0, .magic: dead4ead, .owner: stress-ng/1341, .owner_cpu: 0
[ 4089.070000] CPU: 0 PID: 1341 Comm: stress-ng Not tainted 5.14.0-multi-debug #2
[ 4089.070000] Stack from 00a7dcc8:
[ 4089.070000]         00a7dcc8 004da40f 004da40f 00000000 00a7dce4 0043e88e 004da40f 00a7dd10
[ 4089.070000]         0006316c 004d240e 0053d4a0 dead4ead 00956bba 0000053d 00000000 0053d4a0
[ 4089.070000]         00a7ddd8 0055e6ac 00a7dd28 000632b2 0053d4a0 004d2488 0005c81b 0053d458
[ 4089.070000]         00a7dd34 0044780e 0053d4a0 00a7dd58 002b8694 0053d4a0 00000001 0000007f
[ 4089.070000]         00860000 00000011 00528138 00528198 00a7dd7c 00069f6a 0000000d 00014200
[ 4089.070000]         00528138 00a7dd78 00a7def0 00528138 00014200 00a7dd98 00069ff0 00528138
[ 4089.070000] Call Trace: [<0043e88e>] dump_stack+0x10/0x16
[ 4089.070000]  [<0006316c>] spin_dump+0x6c/0xc0
[ 4089.070000]  [<000632b2>] do_raw_spin_trylock+0x32/0x80
[ 4089.070000]  [<0005c81b>] init_dl_bandwidth+0x1b/0x80
[ 4089.070000]  [<0044780e>] _raw_spin_trylock+0xe/0x40
[ 4089.070000]  [<002b8694>] add_interrupt_randomness+0x154/0x1c0
[ 4089.070000]  [<00069f6a>] handle_irq_event_percpu+0x2a/0x80
[ 4089.070000]  [<00014200>] INV_L2+0x8/0x10
[ 4089.070000]  [<00014200>] INV_L2+0x8/0x10
[ 4089.070000]  [<00069ff0>] handle_irq_event+0x30/0x80
[ 4089.070000]  [<0006d9e4>] handle_simple_irq+0x64/0x80
[ 4089.070000]  [<000695fe>] generic_handle_irq+0x3e/0x80
[ 4089.070000]  [<00002ea4>] do_IRQ+0x24/0x40
[ 4089.070000]  [<00002da8>] user_irqvec_fixup+0xc/0x14
[ 4089.070000]  [<0005c81a>] init_dl_bandwidth+0x1a/0x80
[ 4089.070000]  [<000d51c0>] find_vma+0x0/0x80
[ 4089.070000]  [<00444500>] down_read+0x0/0x200
[ 4089.070000]  [<002b86b0>] add_interrupt_randomness+0x170/0x1c0
[ 4089.070000]  [<00069f6a>] handle_irq_event_percpu+0x2a/0x80
[ 4089.070000]  [<00069ff0>] handle_irq_event+0x30/0x80
[ 4089.070000]  [<0006d9e4>] handle_simple_irq+0x64/0x80
[ 4089.070000]  [<000695fe>] generic_handle_irq+0x3e/0x80
[ 4089.070000]  [<00002ea4>] do_IRQ+0x24/0x40
[ 4089.070000]  [<00002d74>] auto_irqhandler_fixup+0x4/0xc
[ 4089.070000]  [<0000653c>] buserr_c+0x17c/0x600
[ 4089.070000]  [<00002ba8>] buserr+0x20/0x28
[ 4089.070000]  [<0008800d>] get_next_modinfo+0xcd/0x100
[ 4089.070000] 

Does anyone know what causes this?
