Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A98DC433EF
	for <linux-m68k@archiver.kernel.org>; Mon, 13 Sep 2021 05:17:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CBAC560FC0
	for <linux-m68k@archiver.kernel.org>; Mon, 13 Sep 2021 05:17:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229879AbhIMFTG (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 13 Sep 2021 01:19:06 -0400
Received: from wout4-smtp.messagingengine.com ([64.147.123.20]:48289 "EHLO
        wout4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231458AbhIMFTF (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 13 Sep 2021 01:19:05 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.west.internal (Postfix) with ESMTP id E87E832008C3;
        Mon, 13 Sep 2021 01:17:49 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Mon, 13 Sep 2021 01:17:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=2wZ03c
        rOahXrrBwr636TL2rHhpvZXCIeqwG84G+HWag=; b=f1XyZ7FW2B9CfXTdIWj5c+
        fKipCxyhcmDz2MSRxAzEUU4tFUA1DBU/BJNchXE+iYDTnqdH2PbRAC9wozskjDuC
        8f1wT0LZX+tGpsX+VvEK8KzvSzuDTwoucQz/HQdCvg1PCPLdJb6n+DVQXSCYV6mV
        dxBCBa1zFa8hzfHQNzjqVqC7Ztuc4SPyS81EWoHjHFfTOLVtK2oyZuxJol4JzOs5
        +D8jJW1AnnLcEZ+OhEIfx41jWGDRLg9fWjcS9QglGY3T24pHVUnsWUKAYRGN8wwN
        mzJG3NM98E0fk4O9uymSF/T8mot+PH6VL+o8N8vkNYYeU9/8qzkbwX0e8byPMqsA
        ==
X-ME-Sender: <xms:_N4-YdMX2QDV7V7hto8Fxlk-wj5RnMIMZTxuIJuXnxXb1lBp6kG8nw>
    <xme:_N4-Yf_SUKDpAKjfCS42X2mxG0wh51OMTK453WgdjTrdKiW-IGIR76KTGRbvWxXgU
    mSUsfjqPaX7qXOXaI8>
X-ME-Received: <xmr:_N4-YcRIb3yCiQMGVB89DWKODso4D3kY-BXpyDhljPofZuQ2vn51N4P55XX9DzP40Loq11d0sepaRoJRdlbbkND5BV5lg1p3mVd_Pw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudegiedgleefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffujgfkfhggtgesthdtredttddtvdenucfhrhhomhephfhinhhnucfv
    hhgrihhnuceofhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgheqnecuggftrfgrth
    htvghrnhepffduhfegfedvieetudfgleeugeehkeekfeevfffhieevteelvdfhtdevffet
    uedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepfh
    hthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgh
X-ME-Proxy: <xmx:_N4-YZt_VUiz-vjlz1oUR34_b0N1-xVCEEvpbuweTAUwNcQUgYKK7w>
    <xmx:_N4-YVdbNOZ8rPO2lxRr4I8SA8an882TW1ZeL7GTLkBlxQ5emn7Lvg>
    <xmx:_N4-YV2qdTWzrCiIQALUoiKTJh0mKHJ8mO-wJaLxglpueUIGQldAHw>
    <xmx:_d4-YVk6K5Fmk4fwKMiRfrs0kDEN_UzJ3pDVBCmtYtMm4bPPl9tH9w>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 13 Sep 2021 01:17:46 -0400 (EDT)
Date:   Mon, 13 Sep 2021 15:17:33 +1000 (AEST)
From:   Finn Thain <fthain@linux-m68k.org>
To:     Michael Schmitz <schmitzmic@gmail.com>
cc:     linux-m68k@lists.linux-m68k.org, Mike Rapoport <rppt@kernel.org>
Subject: Re: [RFC] m68k: Enable memtest kernel parameter
In-Reply-To: <b1b630b8-d6b6-661b-b5c1-2a2831b5b8c2@gmail.com>
Message-ID: <a4cd5e13-bdd0-35c-77ff-c0f0cef1486@linux-m68k.org>
References: <9fac90da-18d5-7b89-96a5-3cf9dbc8bcf8@linux-m68k.org> <b1b630b8-d6b6-661b-b5c1-2a2831b5b8c2@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Mon, 13 Sep 2021, Michael Schmitz wrote:

> 
> I'm amazed this works - I'd expect the kernel text segment to get 
> trashed by the memory test routines.
> 

I think the initramfs may get clobbered when the 'memtest' parameter is 
set. But that may be expected behaviour...

[    0.000000] Linux version 5.14.0-multi-debug-00001-g3e3e2b0990a2 (fthain@nippy) (m68k-linux-gnu-gcc (btc) 6.4.0, GNU ld (btc) 2.28) #20 Mon Sep 13 15:08:56 AEST 2021
[    0.000000] Saving 214 bytes of bootinfo
[    0.000000] printk: console [debug0] enabled
[    0.000000] printk: debug: ignoring loglevel setting.
Blitter tried to read byte from register ff8a00 at 00816a
[    0.000000] Atari hardware found: VIDEL STDMA-SCSI ST_MFP YM2149 PCM CODEC DSP56K SCC ANALOG_JOY BLITTER IDE TT_CLK FDC_SPEED
[    0.000000] early_memtest: # of tests: 17
[    0.000000]   0x005b2000 - 0x00e00000 pattern 7a6c7258554e494c
[    0.000000]   0x01000000 - 0x08600000 pattern 7a6c7258554e494c
[    0.000000]   0x005b2000 - 0x00e00000 pattern eeeeeeeeeeeeeeee
[    0.000000]   0x01000000 - 0x08600000 pattern eeeeeeeeeeeeeeee
[    0.000000]   0x005b2000 - 0x00e00000 pattern dddddddddddddddd
[    0.000000]   0x01000000 - 0x08600000 pattern dddddddddddddddd
[    0.000000]   0x005b2000 - 0x00e00000 pattern bbbbbbbbbbbbbbbb
[    0.000000]   0x01000000 - 0x08600000 pattern bbbbbbbbbbbbbbbb
[    0.000000]   0x005b2000 - 0x00e00000 pattern 7777777777777777
[    0.000000]   0x01000000 - 0x08600000 pattern 7777777777777777
[    0.000000]   0x005b2000 - 0x00e00000 pattern cccccccccccccccc
[    0.000000]   0x01000000 - 0x08600000 pattern cccccccccccccccc
[    0.000000]   0x005b2000 - 0x00e00000 pattern 9999999999999999
[    0.000000]   0x01000000 - 0x08600000 pattern 9999999999999999
[    0.000000]   0x005b2000 - 0x00e00000 pattern 6666666666666666
[    0.000000]   0x01000000 - 0x08600000 pattern 6666666666666666
[    0.000000]   0x005b2000 - 0x00e00000 pattern 3333333333333333
[    0.000000]   0x01000000 - 0x08600000 pattern 3333333333333333
[    0.000000]   0x005b2000 - 0x00e00000 pattern 8888888888888888
[    0.000000]   0x01000000 - 0x08600000 pattern 8888888888888888
[    0.000000]   0x005b2000 - 0x00e00000 pattern 4444444444444444
[    0.000000]   0x01000000 - 0x08600000 pattern 4444444444444444
[    0.000000]   0x005b2000 - 0x00e00000 pattern 2222222222222222
[    0.000000]   0x01000000 - 0x08600000 pattern 2222222222222222
[    0.000000]   0x005b2000 - 0x00e00000 pattern 1111111111111111
[    0.000000]   0x01000000 - 0x08600000 pattern 1111111111111111
[    0.000000]   0x005b2000 - 0x00e00000 pattern aaaaaaaaaaaaaaaa
[    0.000000]   0x01000000 - 0x08600000 pattern aaaaaaaaaaaaaaaa
[    0.000000]   0x005b2000 - 0x00e00000 pattern 5555555555555555
[    0.000000]   0x01000000 - 0x08600000 pattern 5555555555555555
[    0.000000]   0x005b2000 - 0x00e00000 pattern ffffffffffffffff
[    0.000000]   0x01000000 - 0x08600000 pattern ffffffffffffffff
[    0.000000]   0x005b2000 - 0x00e00000 pattern 0000000000000000
[    0.000000]   0x01000000 - 0x08600000 pattern 0000000000000000
[    0.000000] Zone ranges:
[    0.000000]   DMA      [mem 0x0000000000000000-0x00000085ffffffff]
[    0.000000]   Normal   empty
[    0.000000] Movable zone start for each node
[    0.000000] Early memory node ranges
[    0.000000]   node   0: [mem 0x0000000000000000-0x0000000000dfffff]
[    0.000000]   node   0: [mem 0x0000000001000000-0x00000000085fffff]
[    0.000000] Initmem setup node 0 [mem 0x0000000000000000-0x00000000085fffff]
[    0.000000] NatFeats found (ARAnyM, 1.0)
[    0.000000] initrd: 0833ea00 - 08600000
[    0.000000] pcpu-alloc: s0 r0 d32768 u32768 alloc=1*32768
[    0.000000] pcpu-alloc: [0] 0 
[    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 33490
[    0.000000] Kernel command line: debug=par console=tty0 ignore_loglevel initcall_blacklist=ide_falcon_driver_init,nfhd_init memtest=17 BOOT_IMAGE=vmlinux
[    0.000000] blacklisting initcall ide_falcon_driver_init
[    0.000000] blacklisting initcall nfhd_init
[    0.000000] Unknown command line parameters: initcall_blacklist=ide_falcon_driver_init BOOT_IMAGE=vmlinux
[    0.000000] Dentry cache hash table entries: 32768 (order: 5, 131072 bytes, linear)
[    0.000000] Inode-cache hash table entries: 16384 (order: 4, 65536 bytes, linear)
[    0.000000] Sorting __ex_table...
[    0.000000] mem auto-init: stack:off, heap alloc:off, heap free:off
[    0.000000] Memory: 124032K/135168K available (4385K kernel code, 357K rwdata, 772K rodata, 148K init, 121K bss, 11136K reserved, 0K cma-reserved)
[    0.000000] SLUB: HWalign=16, Order=0-3, MinObjects=0, CPUs=1, Nodes=1
[    0.000000] NR_IRQS: 200
[    0.000000] clocksource: mfp: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 77769386670404 ns
[    0.000000] Console: colour dummy device 80x25
[    0.010000] printk: console [tty0] enabled
[    0.010000] Calibrating delay loop... 140.69 BogoMIPS (lpj=703488)
[    0.080000] pid_max: default: 32768 minimum: 301
[    0.080000] Mount-cache hash table entries: 1024 (order: 0, 4096 bytes, linear)
[    0.080000] Mountpoint-cache hash table entries: 1024 (order: 0, 4096 bytes, linear)
[    0.090000] devtmpfs: initialized
[    0.100000] random: get_random_u32 called from bucket_table_alloc+0x13e/0x180 with crng_init=0
[    0.110000] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 19112604462750000 ns
[    0.110000] futex hash table entries: 256 (order: 0, 7168 bytes, linear)
[    0.110000] NET: Registered PF_NETLINK/PF_ROUTE protocol family
[    0.110000] DMA: preallocated 128 KiB GFP_KERNEL pool for atomic allocations
[    0.120000] DMA: preallocated 128 KiB GFP_KERNEL|GFP_DMA pool for atomic allocations
[    0.160000] wait_for_initramfs() called before rootfs_initcalls
[    0.170000] SCSI subsystem initialized
[    0.170000] libata version 3.00 loaded.
[    0.180000] clocksource: Switched to clocksource mfp
[    0.230000] NET: Registered PF_INET protocol family
[    0.240000] IP idents hash table entries: 4096 (order: 3, 32768 bytes, linear)
[    0.240000] tcp_listen_portaddr_hash hash table entries: 256 (order: 0, 6144 bytes, linear)
[    0.240000] TCP established hash table entries: 2048 (order: 1, 8192 bytes, linear)
[    0.240000] TCP bind hash table entries: 2048 (order: 3, 40960 bytes, linear)
[    0.250000] TCP: Hash tables configured (established 2048 bind 2048)
[    0.250000] UDP hash table entries: 256 (order: 1, 12288 bytes, linear)
[    0.250000] UDP-Lite hash table entries: 256 (order: 1, 12288 bytes, linear)
[    0.250000] NET: Registered PF_UNIX/PF_LOCAL protocol family
[    0.250000] RPC: Registered named UNIX socket transport module.
[    0.250000] RPC: Registered udp transport module.
[    0.250000] RPC: Registered tcp transport module.
[    0.250000] RPC: Registered tcp NFSv4.1 backchannel transport module.
[    0.260000] initcall nfhd_init blacklisted
[    0.260000] Trying to unpack rootfs image as initramfs...
[    0.960000] Freeing initrd memory: 2820K
[    0.960000] nfeth: API 5
[    0.960000] workingset: timestamp_bits=30 max_order=15 bucket_order=0
[    1.150000] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 252)
[    1.150000] io scheduler mq-deadline registered
[    1.160000] atafb atafb: phys_screen_base 6e6000 screen_len 311296
[    1.160000] atafb atafb: Determined 640x480, depth 4
[    1.160000] atafb atafb:    virtual 640x972
[    1.170000] Console: switching to colour frame buffer device 80x30
[    1.180000] fb0: frame buffer device, using 304K of video memory
[    1.180000] pmac_zilog: 0.6 (Benjamin Herrenschmidt <benh@kernel.crashing.org>)
[    1.180000] Non-volatile memory driver v1.3
[    1.210000] brd: module loaded
[    1.500000] scsi host0: Atari native SCSI, irq 15, io_port 0x0, base 0x0, can_queue 1, cmd_per_lun 2, sg_tablesize 1, this_id 7, flags { }
[    2.100000] random: fast init done
[    3.290000] atari-falcon-ide atari-falcon-ide: Atari Falcon and Q40/Q60 PATA controller
[    3.350000] scsi host1: pata_falcon
[    3.360000] ata1: PATA max PIO4 cmd 0xfff00000 ctl 0xfff00038 no IRQ, using PIO polling
[    3.410000] aoe: AoE v85 initialised.
[    3.440000] mousedev: PS/2 mouse device common for all mice
[    3.700000] input: Atari Keyboard as /devices/virtual/input/input0
[    3.710000] ata1.00: NODEV after polling detection
[    3.740000] ata1.01: ATA-2: slave, , max PIO2
[    3.760000] ata1.01: 322560 sectors, multi 0: LBA 
[    3.770000] ata1.01: configured for PIO
[    3.790000] scsi 1:0:1:0: Direct-Access     ATA      slave            n/a  PQ: 0 ANSI: 5
[    3.850000] sd 1:0:1:0: Attached scsi generic sg0 type 0
[    3.870000] sd 1:0:1:0: [sda] 322560 512-byte logical blocks: (165 MB/158 MiB)
[    3.910000] sd 1:0:1:0: [sda] Write Protect is off
[    3.920000] sd 1:0:1:0: [sda] Mode Sense: 00 3a 00 00
[    3.940000] sd 1:0:1:0: [sda] Write cache: disabled, read cache: enabled, doesn't support DPO or FUA
[    4.010000] sd 1:0:1:0: [sda] Attached SCSI disk
[    4.060000] rtc-generic rtc-generic: registered as rtc0
[    4.080000] NET: Registered PF_PACKET protocol family
[    4.100000] VFS: Cannot open root device "(null)" or unknown-block(0,0): error -6
[    4.140000] Please append a correct "root=" boot option; here are the available partitions:
[    4.190000] 0100            8192 ram0 
[    4.190000]  (driver?)
[    4.230000] 0101            8192 ram1 
[    4.230000]  (driver?)
[    4.270000] 0102            8192 ram2 
[    4.270000]  (driver?)
[    4.310000] 0103            8192 ram3 
[    4.310000]  (driver?)
[    4.350000] 0800          161280 sda 
[    4.350000]  driver: sd
[    4.400000] Kernel panic - not syncing: VFS: Unable to mount root fs on unknown-block(0,0)
[    4.400000] CPU: 0 PID: 1 Comm: swapper Not tainted 5.14.0-multi-debug-00001-g3e3e2b0990a2 #20
[    4.400000] Stack from 0102deac:
[    4.400000]         0102deac 004da4cc 004da4cc 0102df00 0102dec8 0043e88e 004da4cc 0102dee8
[    4.400000]         0043ce76 0102df28 00008001 005dc1d8 0043d0ec 01246000 00277e40 0102df48
[    4.400000]         005692ac 004cc21e 0102df28 004cc1cd 004cc19a 00000000 0102df28 fffffffa
[    4.400000]         00000000 0000000c 00002200 0004aa80 01018380 00585c98 00585c78 756e6b6e
[    4.400000]         6f776e2d 626c6f63 6b28302c 302900c0 014162d0 0102df70 005693da 0102df70
[    4.400000]         00569404 004cc282 00008001 0000007e 00000008 01018380 00585c98 00585c98
[    4.400000] Call Trace: [<0043e88e>] dump_stack+0x10/0x16
[    4.400000]  [<0043ce76>] panic+0xe6/0x2ea
[    4.400000]  [<00008001>] free_pointer_table+0x101/0x240
[    4.400000]  [<0043d0ec>] printk+0x0/0x16
[    4.400000]  [<00277e40>] strlen+0x0/0x40
[    4.400000]  [<005692ac>] mount_block_root+0x134/0x1ae
[    4.400000]  [<00002200>] do_one_initcall+0x0/0x1c0
[    4.400000]  [<0004aa80>] parse_args+0x0/0x2c0
[    4.400000]  [<005693da>] mount_root+0xb4/0xfa
[    4.400000]  [<00569404>] mount_root+0xde/0xfa
[    4.400000]  [<00008001>] free_pointer_table+0x101/0x240
[    4.400000]  [<00569562>] prepare_namespace+0x142/0x17c
[    4.400000]  [<00568f92>] kernel_init_freeable+0x1d2/0x1dc
[    4.400000]  [<0043ff80>] kernel_init+0x0/0x100
[    4.400000]  [<0043ff98>] kernel_init+0x18/0x100
[    4.400000]  [<0043ff80>] kernel_init+0x0/0x100
[    4.400000]  [<00002bf4>] ret_from_kernel_thread+0xc/0x14
[    4.400000] 
[    4.400000] ---[ end Kernel panic - not syncing: VFS: Unable to mount root fs on unknown-block(0,0) ]---
