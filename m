Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 624E6C433F5
	for <linux-m68k@archiver.kernel.org>; Mon, 13 Sep 2021 05:52:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 47C7A60E76
	for <linux-m68k@archiver.kernel.org>; Mon, 13 Sep 2021 05:52:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230390AbhIMFyA (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 13 Sep 2021 01:54:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237052AbhIMFyA (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 13 Sep 2021 01:54:00 -0400
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F3B6C061574
        for <linux-m68k@lists.linux-m68k.org>; Sun, 12 Sep 2021 22:52:45 -0700 (PDT)
Received: by mail-pf1-x435.google.com with SMTP id j6so7464360pfa.4
        for <linux-m68k@lists.linux-m68k.org>; Sun, 12 Sep 2021 22:52:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=lnM79IWvZRD2xjvFPioFJeex6ze1IqpoCRuSO/UG8u0=;
        b=WOm/okh998IE9l8TOec4JZFeG8ADhM2+2CHanmt5hWXnqyDAr78sxjKvnkPcxLcj5b
         gM1J4BYW8wBrj8zw1c6vynsP1tTb7PVqU9gAtotwN1WsHbBmlrMT7t04MXvq06Q/FN9N
         oQ+d2s9rYzKpQsFRHPiUjp0tEiT8pQg9MFe7qiuuBnz04u0VCGcvp4W+wZkOYJWuu/VT
         muqIqhYX3AXYeaxqdaMpimpR4UgM3eMdg0EY1LO9Szd+EzwwN6bJtAtSuHQr5xifMPxq
         HS1p6ekzCclHAdKxN3S0KtODWmSjhtfPxFy11f/DRbaY3YuzvLVskTos/CqU0z2uQulD
         eAZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:references:cc:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=lnM79IWvZRD2xjvFPioFJeex6ze1IqpoCRuSO/UG8u0=;
        b=PI/q0NTJicVOdDGKmnDd7YZwf124phHscxheGUgyq1tlBwPOgl/0FTNpvA1o0wWllp
         SrAU4UxPPactzXwMpjY9erCq5bIp1EoiTreOJmrevlO/LFgutgQZF859YwZG03RIt5TL
         mQlX4BekuukHfNdq+1WgKa7GFfO7wFgvI9eIqFGUgOP535jVxAZ0q3alYYHBMwhIoxwz
         o1sDdKPg2pgH8kYm9OQ+Fl7pJtb5kR9z90FZIy3DJ8zv3MbapoOS93YcJ1M7tH6LuoCA
         uLoa/slHiycCP41DUIHCoSoJDfZK15Cf1J9L2LgOtgr/hRA0MeDAbe43b/pmoUeLg0ul
         HlKQ==
X-Gm-Message-State: AOAM530+28Gpb6ZBCrRS+mxNU7WfJz6uvaSWhzrJRxWg5r63L0MU185x
        uuEZ9uytNLDlTQ4DIAsv1aSpNDUYRcc=
X-Google-Smtp-Source: ABdhPJy/DsiaDN5ce/QUUkbQ0kZNA1EdHgbdJRyPPODRU6FBAgG7Jm/0KdaEWDRHzIxhGOoVkNixiA==
X-Received: by 2002:a63:68a:: with SMTP id 132mr9748252pgg.154.1631512364277;
        Sun, 12 Sep 2021 22:52:44 -0700 (PDT)
Received: from [10.1.1.26] (222-155-4-20-adsl.sparkbb.co.nz. [222.155.4.20])
        by smtp.gmail.com with ESMTPSA id q21sm6424465pgk.71.2021.09.12.22.52.41
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 12 Sep 2021 22:52:43 -0700 (PDT)
Subject: Re: [RFC] m68k: Enable memtest kernel parameter
To:     Finn Thain <fthain@linux-m68k.org>
References: <9fac90da-18d5-7b89-96a5-3cf9dbc8bcf8@linux-m68k.org>
 <b1b630b8-d6b6-661b-b5c1-2a2831b5b8c2@gmail.com>
 <a4cd5e13-bdd0-35c-77ff-c0f0cef1486@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org, Mike Rapoport <rppt@kernel.org>
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <e4f41ecc-1206-9a2e-241c-c28ed2e5fd22@gmail.com>
Date:   Mon, 13 Sep 2021 17:51:09 +1200
User-Agent: Mozilla/5.0 (X11; Linux ppc64; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <a4cd5e13-bdd0-35c-77ff-c0f0cef1486@linux-m68k.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Finn,

On 13/09/21 17:17, Finn Thain wrote:
> On Mon, 13 Sep 2021, Michael Schmitz wrote:
>
>>
>> I'm amazed this works - I'd expect the kernel text segment to get
>> trashed by the memory test routines.
>>
>
> I think the initramfs may get clobbered when the 'memtest' parameter is
> set. But that may be expected behaviour...

Looks like it got clobbered, but I don't think that is expected behaviour.

>
> [    0.000000] Linux version 5.14.0-multi-debug-00001-g3e3e2b0990a2 (fthain@nippy) (m68k-linux-gnu-gcc (btc) 6.4.0, GNU ld (btc) 2.28) #20 Mon Sep 13 15:08:56 AEST 2021
> [    0.000000] Saving 214 bytes of bootinfo
> [    0.000000] printk: console [debug0] enabled
> [    0.000000] printk: debug: ignoring loglevel setting.
> Blitter tried to read byte from register ff8a00 at 00816a
> [    0.000000] Atari hardware found: VIDEL STDMA-SCSI ST_MFP YM2149 PCM CODEC DSP56K SCC ANALOG_JOY BLITTER IDE TT_CLK FDC_SPEED
> [    0.000000] early_memtest: # of tests: 17
> [    0.000000]   0x005b2000 - 0x00e00000 pattern 7a6c7258554e494c
> [    0.000000]   0x01000000 - 0x08600000 pattern 7a6c7258554e494c
> [    0.000000]   0x005b2000 - 0x00e00000 pattern eeeeeeeeeeeeeeee
> [    0.000000]   0x01000000 - 0x08600000 pattern eeeeeeeeeeeeeeee
> [    0.000000]   0x005b2000 - 0x00e00000 pattern dddddddddddddddd
> [    0.000000]   0x01000000 - 0x08600000 pattern dddddddddddddddd
> [    0.000000]   0x005b2000 - 0x00e00000 pattern bbbbbbbbbbbbbbbb
> [    0.000000]   0x01000000 - 0x08600000 pattern bbbbbbbbbbbbbbbb
> [    0.000000]   0x005b2000 - 0x00e00000 pattern 7777777777777777
> [    0.000000]   0x01000000 - 0x08600000 pattern 7777777777777777
> [    0.000000]   0x005b2000 - 0x00e00000 pattern cccccccccccccccc
> [    0.000000]   0x01000000 - 0x08600000 pattern cccccccccccccccc
> [    0.000000]   0x005b2000 - 0x00e00000 pattern 9999999999999999
> [    0.000000]   0x01000000 - 0x08600000 pattern 9999999999999999
> [    0.000000]   0x005b2000 - 0x00e00000 pattern 6666666666666666
> [    0.000000]   0x01000000 - 0x08600000 pattern 6666666666666666
> [    0.000000]   0x005b2000 - 0x00e00000 pattern 3333333333333333
> [    0.000000]   0x01000000 - 0x08600000 pattern 3333333333333333
> [    0.000000]   0x005b2000 - 0x00e00000 pattern 8888888888888888
> [    0.000000]   0x01000000 - 0x08600000 pattern 8888888888888888
> [    0.000000]   0x005b2000 - 0x00e00000 pattern 4444444444444444
> [    0.000000]   0x01000000 - 0x08600000 pattern 4444444444444444
> [    0.000000]   0x005b2000 - 0x00e00000 pattern 2222222222222222
> [    0.000000]   0x01000000 - 0x08600000 pattern 2222222222222222
> [    0.000000]   0x005b2000 - 0x00e00000 pattern 1111111111111111
> [    0.000000]   0x01000000 - 0x08600000 pattern 1111111111111111
> [    0.000000]   0x005b2000 - 0x00e00000 pattern aaaaaaaaaaaaaaaa
> [    0.000000]   0x01000000 - 0x08600000 pattern aaaaaaaaaaaaaaaa
> [    0.000000]   0x005b2000 - 0x00e00000 pattern 5555555555555555
> [    0.000000]   0x01000000 - 0x08600000 pattern 5555555555555555
> [    0.000000]   0x005b2000 - 0x00e00000 pattern ffffffffffffffff
> [    0.000000]   0x01000000 - 0x08600000 pattern ffffffffffffffff
> [    0.000000]   0x005b2000 - 0x00e00000 pattern 0000000000000000
> [    0.000000]   0x01000000 - 0x08600000 pattern 0000000000000000
> [    0.000000] Zone ranges:
> [    0.000000]   DMA      [mem 0x0000000000000000-0x00000085ffffffff]
> [    0.000000]   Normal   empty
> [    0.000000] Movable zone start for each node
> [    0.000000] Early memory node ranges
> [    0.000000]   node   0: [mem 0x0000000000000000-0x0000000000dfffff]
> [    0.000000]   node   0: [mem 0x0000000001000000-0x00000000085fffff]
> [    0.000000] Initmem setup node 0 [mem 0x0000000000000000-0x00000000085fffff]
> [    0.000000] NatFeats found (ARAnyM, 1.0)
> [    0.000000] initrd: 0833ea00 - 08600000

The initrd got loaded at the end of the FastRAM chunk - we'd need that 
excluded from the memtest range.

Trouble is - I don't know whether that holds true for other m68k platforms.

But what Mike just explained (memtest skipping reserved areas of memory) 
provides a clean way to exclude the ramdisk area - move early_memtest() 
to setup_arch(), after the ramdisk area has been reserved.

Cheers,

	Michael


> [    0.000000] pcpu-alloc: s0 r0 d32768 u32768 alloc=1*32768
> [    0.000000] pcpu-alloc: [0] 0
> [    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 33490
> [    0.000000] Kernel command line: debug=par console=tty0 ignore_loglevel initcall_blacklist=ide_falcon_driver_init,nfhd_init memtest=17 BOOT_IMAGE=vmlinux
> [    0.000000] blacklisting initcall ide_falcon_driver_init
> [    0.000000] blacklisting initcall nfhd_init
> [    0.000000] Unknown command line parameters: initcall_blacklist=ide_falcon_driver_init BOOT_IMAGE=vmlinux
> [    0.000000] Dentry cache hash table entries: 32768 (order: 5, 131072 bytes, linear)
> [    0.000000] Inode-cache hash table entries: 16384 (order: 4, 65536 bytes, linear)
> [    0.000000] Sorting __ex_table...
> [    0.000000] mem auto-init: stack:off, heap alloc:off, heap free:off
> [    0.000000] Memory: 124032K/135168K available (4385K kernel code, 357K rwdata, 772K rodata, 148K init, 121K bss, 11136K reserved, 0K cma-reserved)
> [    0.000000] SLUB: HWalign=16, Order=0-3, MinObjects=0, CPUs=1, Nodes=1
> [    0.000000] NR_IRQS: 200
> [    0.000000] clocksource: mfp: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 77769386670404 ns
> [    0.000000] Console: colour dummy device 80x25
> [    0.010000] printk: console [tty0] enabled
> [    0.010000] Calibrating delay loop... 140.69 BogoMIPS (lpj=703488)
> [    0.080000] pid_max: default: 32768 minimum: 301
> [    0.080000] Mount-cache hash table entries: 1024 (order: 0, 4096 bytes, linear)
> [    0.080000] Mountpoint-cache hash table entries: 1024 (order: 0, 4096 bytes, linear)
> [    0.090000] devtmpfs: initialized
> [    0.100000] random: get_random_u32 called from bucket_table_alloc+0x13e/0x180 with crng_init=0
> [    0.110000] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 19112604462750000 ns
> [    0.110000] futex hash table entries: 256 (order: 0, 7168 bytes, linear)
> [    0.110000] NET: Registered PF_NETLINK/PF_ROUTE protocol family
> [    0.110000] DMA: preallocated 128 KiB GFP_KERNEL pool for atomic allocations
> [    0.120000] DMA: preallocated 128 KiB GFP_KERNEL|GFP_DMA pool for atomic allocations
> [    0.160000] wait_for_initramfs() called before rootfs_initcalls
> [    0.170000] SCSI subsystem initialized
> [    0.170000] libata version 3.00 loaded.
> [    0.180000] clocksource: Switched to clocksource mfp
> [    0.230000] NET: Registered PF_INET protocol family
> [    0.240000] IP idents hash table entries: 4096 (order: 3, 32768 bytes, linear)
> [    0.240000] tcp_listen_portaddr_hash hash table entries: 256 (order: 0, 6144 bytes, linear)
> [    0.240000] TCP established hash table entries: 2048 (order: 1, 8192 bytes, linear)
> [    0.240000] TCP bind hash table entries: 2048 (order: 3, 40960 bytes, linear)
> [    0.250000] TCP: Hash tables configured (established 2048 bind 2048)
> [    0.250000] UDP hash table entries: 256 (order: 1, 12288 bytes, linear)
> [    0.250000] UDP-Lite hash table entries: 256 (order: 1, 12288 bytes, linear)
> [    0.250000] NET: Registered PF_UNIX/PF_LOCAL protocol family
> [    0.250000] RPC: Registered named UNIX socket transport module.
> [    0.250000] RPC: Registered udp transport module.
> [    0.250000] RPC: Registered tcp transport module.
> [    0.250000] RPC: Registered tcp NFSv4.1 backchannel transport module.
> [    0.260000] initcall nfhd_init blacklisted
> [    0.260000] Trying to unpack rootfs image as initramfs...
> [    0.960000] Freeing initrd memory: 2820K
> [    0.960000] nfeth: API 5
> [    0.960000] workingset: timestamp_bits=30 max_order=15 bucket_order=0
> [    1.150000] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 252)
> [    1.150000] io scheduler mq-deadline registered
> [    1.160000] atafb atafb: phys_screen_base 6e6000 screen_len 311296
> [    1.160000] atafb atafb: Determined 640x480, depth 4
> [    1.160000] atafb atafb:    virtual 640x972
> [    1.170000] Console: switching to colour frame buffer device 80x30
> [    1.180000] fb0: frame buffer device, using 304K of video memory
> [    1.180000] pmac_zilog: 0.6 (Benjamin Herrenschmidt <benh@kernel.crashing.org>)
> [    1.180000] Non-volatile memory driver v1.3
> [    1.210000] brd: module loaded
> [    1.500000] scsi host0: Atari native SCSI, irq 15, io_port 0x0, base 0x0, can_queue 1, cmd_per_lun 2, sg_tablesize 1, this_id 7, flags { }
> [    2.100000] random: fast init done
> [    3.290000] atari-falcon-ide atari-falcon-ide: Atari Falcon and Q40/Q60 PATA controller
> [    3.350000] scsi host1: pata_falcon
> [    3.360000] ata1: PATA max PIO4 cmd 0xfff00000 ctl 0xfff00038 no IRQ, using PIO polling
> [    3.410000] aoe: AoE v85 initialised.
> [    3.440000] mousedev: PS/2 mouse device common for all mice
> [    3.700000] input: Atari Keyboard as /devices/virtual/input/input0
> [    3.710000] ata1.00: NODEV after polling detection
> [    3.740000] ata1.01: ATA-2: slave, , max PIO2
> [    3.760000] ata1.01: 322560 sectors, multi 0: LBA
> [    3.770000] ata1.01: configured for PIO
> [    3.790000] scsi 1:0:1:0: Direct-Access     ATA      slave            n/a  PQ: 0 ANSI: 5
> [    3.850000] sd 1:0:1:0: Attached scsi generic sg0 type 0
> [    3.870000] sd 1:0:1:0: [sda] 322560 512-byte logical blocks: (165 MB/158 MiB)
> [    3.910000] sd 1:0:1:0: [sda] Write Protect is off
> [    3.920000] sd 1:0:1:0: [sda] Mode Sense: 00 3a 00 00
> [    3.940000] sd 1:0:1:0: [sda] Write cache: disabled, read cache: enabled, doesn't support DPO or FUA
> [    4.010000] sd 1:0:1:0: [sda] Attached SCSI disk
> [    4.060000] rtc-generic rtc-generic: registered as rtc0
> [    4.080000] NET: Registered PF_PACKET protocol family
> [    4.100000] VFS: Cannot open root device "(null)" or unknown-block(0,0): error -6
> [    4.140000] Please append a correct "root=" boot option; here are the available partitions:
> [    4.190000] 0100            8192 ram0
> [    4.190000]  (driver?)
> [    4.230000] 0101            8192 ram1
> [    4.230000]  (driver?)
> [    4.270000] 0102            8192 ram2
> [    4.270000]  (driver?)
> [    4.310000] 0103            8192 ram3
> [    4.310000]  (driver?)
> [    4.350000] 0800          161280 sda
> [    4.350000]  driver: sd
> [    4.400000] Kernel panic - not syncing: VFS: Unable to mount root fs on unknown-block(0,0)
> [    4.400000] CPU: 0 PID: 1 Comm: swapper Not tainted 5.14.0-multi-debug-00001-g3e3e2b0990a2 #20
> [    4.400000] Stack from 0102deac:
> [    4.400000]         0102deac 004da4cc 004da4cc 0102df00 0102dec8 0043e88e 004da4cc 0102dee8
> [    4.400000]         0043ce76 0102df28 00008001 005dc1d8 0043d0ec 01246000 00277e40 0102df48
> [    4.400000]         005692ac 004cc21e 0102df28 004cc1cd 004cc19a 00000000 0102df28 fffffffa
> [    4.400000]         00000000 0000000c 00002200 0004aa80 01018380 00585c98 00585c78 756e6b6e
> [    4.400000]         6f776e2d 626c6f63 6b28302c 302900c0 014162d0 0102df70 005693da 0102df70
> [    4.400000]         00569404 004cc282 00008001 0000007e 00000008 01018380 00585c98 00585c98
> [    4.400000] Call Trace: [<0043e88e>] dump_stack+0x10/0x16
> [    4.400000]  [<0043ce76>] panic+0xe6/0x2ea
> [    4.400000]  [<00008001>] free_pointer_table+0x101/0x240
> [    4.400000]  [<0043d0ec>] printk+0x0/0x16
> [    4.400000]  [<00277e40>] strlen+0x0/0x40
> [    4.400000]  [<005692ac>] mount_block_root+0x134/0x1ae
> [    4.400000]  [<00002200>] do_one_initcall+0x0/0x1c0
> [    4.400000]  [<0004aa80>] parse_args+0x0/0x2c0
> [    4.400000]  [<005693da>] mount_root+0xb4/0xfa
> [    4.400000]  [<00569404>] mount_root+0xde/0xfa
> [    4.400000]  [<00008001>] free_pointer_table+0x101/0x240
> [    4.400000]  [<00569562>] prepare_namespace+0x142/0x17c
> [    4.400000]  [<00568f92>] kernel_init_freeable+0x1d2/0x1dc
> [    4.400000]  [<0043ff80>] kernel_init+0x0/0x100
> [    4.400000]  [<0043ff98>] kernel_init+0x18/0x100
> [    4.400000]  [<0043ff80>] kernel_init+0x0/0x100
> [    4.400000]  [<00002bf4>] ret_from_kernel_thread+0xc/0x14
> [    4.400000]
> [    4.400000] ---[ end Kernel panic - not syncing: VFS: Unable to mount root fs on unknown-block(0,0) ]---
>
