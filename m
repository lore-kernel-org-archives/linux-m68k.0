Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64A8FC7619A
	for <linux-m68k@archiver.kernel.org>; Sat,  8 Apr 2023 05:26:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229517AbjDHF0M (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sat, 8 Apr 2023 01:26:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229457AbjDHF0M (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sat, 8 Apr 2023 01:26:12 -0400
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com [64.147.123.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E90EA4C31
        for <linux-m68k@lists.linux-m68k.org>; Fri,  7 Apr 2023 22:26:09 -0700 (PDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.west.internal (Postfix) with ESMTP id 054C0320010B;
        Sat,  8 Apr 2023 01:26:07 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Sat, 08 Apr 2023 01:26:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:content-type:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm2; t=1680931567; x=1681017967; bh=5r/zsbkSsYx0+
        rwUyfu7WXk5GDY4JmNztowO1oig0rA=; b=Xz+b3nvVJJ3VxFXUXnbPnGmA4wlcT
        tJGQjr5enbfs/Wz++OYHd2PQ5qP/ysO8YUnNPeVncDDNj7debgWx07ryovQJ4cAs
        ZQz8ThK0jYflVh6Tf7tZCxfVu9sBgT8mZb0Im6mtsp9aCW6/QsJsf3L1CEgGji9Y
        s5oxQ1nlBEJm8uXQGs8AxtMp3NpWG4H4PvAP3vr/ZL7rVK0QEjzvrAuwx0RDy+au
        kZnThGz+ozGVdO5FtHTk/5joZCtd7cLC9NGSNv5k+yQboRNnL9jA9uDF4dHTBmwo
        y4lmfDPfO91aIgwb77IgHruvbHH5TwLRc+X+dENjlXdAE2fT7RwlEsh3Q==
X-ME-Sender: <xms:7vowZNs_gqWwLfjxjvspEjCdNXV_wCtDWwXpopBOzhvBxMZx549u2w>
    <xme:7vowZGcOro3vHaVy4ZL9nTN3g3O46Lo_J6y4d8P2f3bfnlRc2hygFwN_KJiQ--J7S
    3s1wSRmXWVWewIU7DA>
X-ME-Received: <xmr:7vowZAwEYUSGX29dQvPinFQxGKMy1fNTa-hGs7k-qMgMldKZSpgj-7-SP72DLXEA70j4vXOWYoq0tAV59WNwqCgSqt-0OXrhhLQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdejiedgledvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevufgjkfhfgggtsehttdertddttddvnecuhfhrohhmpefhihhnnhcu
    vfhhrghinhcuoehfthhhrghinheslhhinhhugidqmheikehkrdhorhhgqeenucggtffrrg
    htthgvrhhnpedugedttdffkedtgfegkeeguedvhefgieetjeffhfdtgffgffevvdeikeet
    keeuueenucffohhmrghinhepughonhgvrdgtlhgvrghnihhnghenucevlhhushhtvghruf
    hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehfthhhrghinheslhhinhhugidq
    mheikehkrdhorhhg
X-ME-Proxy: <xmx:7_owZEPt5K4xn9-4YvS38iAhc9-5zGkrMeC1vZHAYCBvK8bZ9VwhZQ>
    <xmx:7_owZN_7qjTXdI3LTjII4rjHBdU6NLDKf5cgeZbZWKafoEFIZGlo2A>
    <xmx:7_owZEU0kh9z7aErIv9anKxoLKm3SrbeHN18jbaoetZTfFUYR8MaoA>
    <xmx:7_owZPk95b2BDlzwgrifBjza5-4gym2jSh4QF2R0s5wA87Dp0lkCKQ>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 8 Apr 2023 01:26:05 -0400 (EDT)
Date:   Sat, 8 Apr 2023 15:29:20 +1000 (AEST)
From:   Finn Thain <fthain@linux-m68k.org>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
cc:     Michael Schmitz <schmitzmic@gmail.com>,
        debian-68k@lists.debian.org, linux-m68k@lists.linux-m68k.org
Subject: Re: dash behaviour, was Re: core dump analysis
In-Reply-To: <CAMuHMdWhVdafr4QDkq0QF+ptMD-ruZsF8Ga2Cu240K5YX5jwPA@mail.gmail.com>
Message-ID: <d742219c-aa26-e1e0-0c36-e391935e30ef@linux-m68k.org>
References: <4a9c1d0d-07aa-792e-921f-237d5a30fc44.ref@yahoo.com> <c47abfdc-31c8-e7ed-1c14-90f68710f25d@gmail.com> <040ad66a-71dd-001b-0446-36cbd6547b37@yahoo.com> <5b9d64bb-2adc-20a2-f596-f99bf255b5cc@linux-m68k.org> <56bd9a33-c58a-58e0-3956-e63c61abe5fe@yahoo.com>
 <1725f7c1-2084-a404-653d-9e9f8bbe961c@linux-m68k.org> <e10b8e06-6a36-5c83-89da-bec8fd7d3ed9@linux-m68k.org> <19d1f2ac-67dd-5415-b64a-1e1b4451f01e@linux-m68k.org> <ef5bcf6f-3541-50c2-9b6a-5e9d2f9c68d5@linux-m68k.org> <87zg7rap45.fsf@igel.home>
 <5a5588ca-81c3-3f4c-fd43-c95e90b27939@linux-m68k.org> <67f6bc5f-e1fc-64b9-cb3c-1698cf4daf51@gmail.com> <9eea635f-c947-eae7-09fa-d39f00d91532@linux-m68k.org> <3dfea52a-b09e-517a-c3ca-4b559a3d9ce4@gmail.com> <23ddfd2a-1123-45ae-866d-158d45e23ba2@linux-m68k.org>
 <8ff53c49-331e-1388-31c5-79cf21a2c201@gmail.com> <77321c26-fd0f-5975-0ab6-a726ee995358@linux-m68k.org> <CAMuHMdWhVdafr4QDkq0QF+ptMD-ruZsF8Ga2Cu240K5YX5jwPA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Fri, 7 Apr 2023, Geert Uytterhoeven wrote:

> >
> > The only way I have found to alter dash's inclination to crash is to 
> > reboot. (I said previously I was unable to reproduce this in a single 
> > user mode shell but it turned out to be more subtle.)
> 
> That sounds like memory corruption somewhere else, e.g. in the buffer 
> cache...
> 

If so, once the corruption showed up, you would expect the same crash next 
time...

root@debian:~# sh /etc/init.d/mountdevsubfs.sh start
*** stack smashing detected ***: terminated
Aborted (core dumped)
root@debian:~# sh /etc/init.d/mountdevsubfs.sh start
*** stack smashing detected ***: terminated
Aborted (core dumped)
*** stack smashing detected ***: terminated
Aborted (core dumped)
root@debian:~# sh /etc/init.d/mountdevsubfs.sh start
*** stack smashing detected ***: terminated
Aborted (core dumped)
root@debian:~# echo 3 > /proc/sys/vm/drop_caches 
[  937.250000] bash (717): drop_caches: 3
root@debian:~# sh /etc/init.d/mountdevsubfs.sh start
root@debian:~# sh /etc/init.d/mountdevsubfs.sh start
*** stack smashing detected ***: terminated
Aborted (core dumped)
root@debian:~# sh /etc/init.d/mountdevsubfs.sh start
*** stack smashing detected ***: terminated
Aborted (core dumped)
*** stack smashing detected ***: terminated
Aborted (core dumped)

I'd say it's probably not buffer cache corruption causing this because we 
can see two subshells fail, then just one.

For that build I enabled SLUB_DEBUG but forgot to enable SLUB_DEBUG_ON --

CONFIG_DEBUG_PAGEALLOC=y
CONFIG_DEBUG_PAGEALLOC_ENABLE_DEFAULT=y
CONFIG_SLUB_DEBUG=y
# CONFIG_SLUB_DEBUG_ON is not set
CONFIG_PAGE_POISONING=y
CONFIG_SCHED_STACK_END_CHECK=y

Below you can see the console log for a build with CONFIG_SLUB_DEBUG_ON=y.

BTW, these builds have a hacked RNG which produces only zeros, to try to 
get more consistent behaviour. It seems to have made no difference. None 
of the kernel changes I've made seem to make much difference, besides 
perturbing timing slightly. I tend to think this is a dash bug that's 
confined to slow machines only because it's timing sensitive.

ABCFGHIJK
[    0.000000] Linux version 6.3.0-rc5-mac-00001-gfaf1ca712d79 (fthain@nippy) (m68k-unknown-linux-musl-gcc (Gentoo 12.2.1_p20221224 p7) 12.2.1 20221224, GNU ld (Gentoo 2.39 p5) 2.39.0) #4 Sat Apr  8 14:25:16 AEST 2023
[    0.000000] Saving 402 bytes of bootinfo
[    0.000000] printk: debug: ignoring loglevel setting.
[    0.000000] printk: bootconsole [debug0] enabled
[    0.000000] Detected Macintosh model: 27
[    0.000000]  Penguin bootinfo data:
[    0.000000]  Video: addr 0x60b00000 row 0x50 depth 1 dimensions 640 x 480
[    0.000000]  Videological 0xf0300000 phys. 0x60b00000, SCC at 0x50f04000
[    0.000000]  Boottime: 0x73e GMTBias: 0x0
[    0.000000]  Machine ID: 27 CPUid: 0x1 memory size: 0x24
[    0.000000] Apple Macintosh LC III
[    0.000000] Zone ranges:
[    0.000000]   DMA      [mem 0x0000000000000000-0x00000023ffffffff]
[    0.000000]   Normal   empty
[    0.000000] Movable zone start for each node
[    0.000000] Early memory node ranges
[    0.000000]   node   0: [mem 0x0000000000000000-0x00000000023fffff]
[    0.000000] Initmem setup node 0 [mem 0x0000000000000000-0x00000000023fffff]
[    0.000000] pcpu-alloc: s0 r0 d32768 u32768 alloc=1*32768
[    0.000000] pcpu-alloc: [0] 0 
[    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 9135
[    0.000000] Kernel command line: console=ttyS0 ignore_loglevel ro earlyprintk fbcon=font:ProFont6x11 coherent_pool=4k root=/dev/sda6 single 
[    0.000000] Unknown kernel command line parameters "single", will be passed to user space.
[    0.000000] Dentry cache hash table entries: 8192 (order: 3, 32768 bytes, linear)
[    0.000000] Inode-cache hash table entries: 4096 (order: 2, 16384 bytes, linear)
[    0.000000] Sorting __ex_table...
[    0.000000] mem auto-init: stack:off, heap alloc:off, heap free:off
[    0.000000] Memory: 31008K/36864K available (4193K kernel code, 283K rwdata, 808K rodata, 132K init, 109K bss, 5856K reserved, 0K cma-reserved)
[    0.000000] **********************************************************
[    0.000000] **   NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE   **
[    0.000000] **                                                      **
[    0.000000] ** This system shows unhashed kernel memory addresses   **
[    0.000000] ** via the console, logs, and other interfaces. This    **
[    0.000000] ** might reduce the security of your system.            **
[    0.000000] **                                                      **
[    0.000000] ** If you see this message and you are not debugging    **
[    0.000000] ** the kernel, report this immediately to your system   **
[    0.000000] ** administrator!                                       **
[    0.000000] **                                                      **
[    0.000000] **   NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE   **
[    0.000000] **********************************************************
[    0.000000] SLUB: HWalign=16, Order=0-3, MinObjects=0, CPUs=1, Nodes=1
[    0.000000] NR_IRQS: 72
[    0.000000] clocksource: via1: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 2439823894983 ns
[    0.050000] Console: colour dummy device 80x25
[    0.060000] printk: console [ttyS0] enabled
[    0.060000] printk: console [ttyS0] enabled
[    0.080000] printk: bootconsole [debug0] disabled
[    0.080000] printk: bootconsole [debug0] disabled
[    0.110000] Calibrating delay loop... 5.83 BogoMIPS (lpj=29184)
[    0.270000] pid_max: default: 32768 minimum: 301
[    0.320000] Mount-cache hash table entries: 1024 (order: 0, 4096 bytes, linear)
[    0.340000] Mountpoint-cache hash table entries: 1024 (order: 0, 4096 bytes, linear)
[    0.730000] devtmpfs: initialized
[    1.060000] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 19112604462750000 ns
[    1.070000] futex hash table entries: 256 (order: -1, 3072 bytes, linear)
[    1.280000] NET: Registered PF_NETLINK/PF_ROUTE protocol family
[    1.340000] DMA: preallocated 4 KiB GFP_KERNEL pool for atomic allocations
[    1.360000] DMA: preallocated 4 KiB GFP_KERNEL|GFP_DMA pool for atomic allocations
[    1.940000] NuBus: Scanning NuBus slots.
[    2.180000] SCSI subsystem initialized
[    2.250000] libata version 3.00 loaded.
[    2.510000] clocksource: Switched to clocksource via1
[    5.540000] NET: Registered PF_INET protocol family
[    5.590000] IP idents hash table entries: 2048 (order: 2, 16384 bytes, linear)
[    5.780000] tcp_listen_portaddr_hash hash table entries: 1024 (order: 0, 4096 bytes, linear)
[    5.790000] Table-perturb hash table entries: 1024 (order: 0, 4096 bytes, linear)
[    5.810000] TCP established hash table entries: 1024 (order: 0, 4096 bytes, linear)
[    5.820000] TCP bind hash table entries: 1024 (order: 1, 8192 bytes, linear)
[    5.830000] TCP: Hash tables configured (established 1024 bind 1024)
[    5.880000] UDP hash table entries: 256 (order: 0, 4096 bytes, linear)
[    5.890000] UDP-Lite hash table entries: 256 (order: 0, 4096 bytes, linear)
[    5.930000] NET: Registered PF_UNIX/PF_LOCAL protocol family
[    6.090000] RPC: Registered named UNIX socket transport module.
[    6.110000] RPC: Registered udp transport module.
[    6.120000] RPC: Registered tcp transport module.
[    6.130000] RPC: Registered tcp NFSv4.1 backchannel transport module.
[    6.430000] workingset: timestamp_bits=30 max_order=13 bucket_order=0
[    6.910000] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 253)
[    6.920000] io scheduler mq-deadline registered
[    6.930000] macfb: framebuffer at 0x60b00000, mapped to 0xd0000000, size 37k
[    6.940000] macfb: mode is 640x480x1, linelength=80
[    8.510000] Console: switching to mono frame buffer device 106x43
[    9.670000] fb0: Sonora frame buffer device
[    9.750000] scc.0: ttyS0 at MMIO 0x50f04002 (irq = 4, base_baud = 230400) is a Z85c30 ESCC - Serial port
[    9.820000] scc.1: ttyS1 at MMIO 0x50f04000 (irq = 4, base_baud = 230400) is a Z85c30 ESCC - Serial port
[    9.950000] Non-volatile memory driver v1.3
[    9.980000] SWIM floppy driver Version 0.2 (2008-10-30)
[   10.670000] brd: module loaded
[   10.690000] cuda_input: 01 00 03 7c 25 b7 d6
[   10.710000] Macintosh Cuda and Egret driver.
[   11.270000] scsi host0: Macintosh NCR5380 SCSI, irq 19, io_port 0x0, base 0x50f10000, can_queue 16, cmd_per_lun 2, sg_tablesize 1, this_id 7, flags { }
[   11.420000] scsi 0:0:0:0: Direct-Access      codesrc          SCSI2SD  4.2 PQ: 0 ANSI: 2
[   11.800000] adb device [2]: 2 0x2
[   11.830000] adb device [3]: 3 0x1
[   11.880000] ADB keyboard at 2 has handler 0x3
[   11.900000] Detected ADB keyboard, type ANSI.
[   11.960000] input: ADB keyboard as /devices/virtual/input/input0
[   12.180000] ADB mouse (standard) at 3 has handler 0x2
[   12.240000] input: ADB mouse as /devices/virtual/input/input1
[   13.720000] sd 0:0:0:0: [sda] 4194303 512-byte logical blocks: (2.15 GB/2.00 GiB)
[   13.750000] sd 0:0:0:0: Attached scsi generic sg0 type 0
[   13.800000] mac8390 slot.E: Memory length resource not found, probing
[   13.810000] mac8390 slot.E: Ethernet A-Series (type farallon)
[   13.820000] mac8390 slot.E: MAC 00:40:10:07:60:c8, IRQ 61, 32 KB shared memory at 0xfeed0000, 32-bit access.
[   14.150000] sd 0:0:0:0: [sda] Write Protect is off
[   14.160000] sd 0:0:0:0: [sda] Mode Sense: 8d 00 00 08
[   14.180000] sd 0:0:0:0: [sda] Write cache: disabled, read cache: disabled, doesn't support DPO or FUA
[   14.480000]  sda: [mac] sda1 sda2 sda3 sda4 sda5 sda6 sda7
[   14.980000] sd 0:0:0:0: [sda] Attached SCSI disk
[   15.050000] aoe: AoE v85 initialised.
[   15.190000] mousedev: PS/2 mouse device common for all mice
[   15.320000] rtc-generic rtc-generic: registered as rtc0
[   15.410000] NET: Registered PF_PACKET protocol family
[   15.440000] printk: bootconsole [debug0] disabled
[   21.960000] EXT4-fs (sda6): mounting ext2 file system using the ext4 subsystem
[   22.620000] EXT4-fs (sda6): mounted filesystem d9738810-a43e-43d5-8eea-fd50d23f69b4 without journal. Quota mode: disabled.
[   22.650000] VFS: Mounted root (ext2 filesystem) readonly on device 8:6.
[   22.690000] Freeing unused kernel image (initmem) memory: 132K
[   22.700000] This architecture does not have kernel memory protection.
[   22.710000] Run /sbin/init as init process
[   22.720000]   with arguments:
[   22.730000]     /sbin/init
[   22.740000]     single
[   22.750000]   with environment:
[   22.760000]     HOME=/
[   22.770000]     TERM=linux
INIT: version 3.06 booting
INIT: No inittab.d directory found
[   40.210000] random: crng init done
Setting hostname to 'debian'...done.
findfs: unable to resolve 'UUID=d9738810-a43e-43d5-8eea-fd50d23f69b4'
Files under mount point '/run' will be hidden. ... (warning).
Starting hotplug events dispatcher: systemd-udevd.
Synthesizing the initial hotplug events (subsystems)...done.
Synthesizing the initial hotplug events (devices)...done.
Waiting for /dev to be fully populated...Failed to wait for daemon to reply: Connection timed out
done (timeout).
Press Enter for maintenance
(or press Control-D to continue): 
root@debian:~# sh /etc/init.d/mountdevsubfs.sh start
root@debian:~# sh /etc/init.d/mountdevsubfs.sh start
root@debian:~# sh /etc/init.d/mountdevsubfs.sh start
root@debian:~# sh /etc/init.d/mountdevsubfs.sh start
root@debian:~# 
exit
Activating swap:swapon: /dev/sda5: found signature [pagesize=4096, signature=swap]
swapon: /dev/sda5: pagesize=4096, swapsize=268435456, devsize=268435456
swapon /dev/sda5
[ 1768.650000] Adding 262140k swap on /dev/sda5.  Priority:-2 extents:1 across:262140k 
.
[ 1778.640000] EXT4-fs (sda6): re-mounted d9738810-a43e-43d5-8eea-fd50d23f69b4. Quota mode: disabled.
Will now check root file system:[/sbin/fsck.ext2 (1) -- /] fsck.ext2 -a -C0 /dev/sda6 
/dev/sda6: clean, 24004/425152 files, 234859/424872 blocks
.
[ 1797.940000] EXT4-fs (sda6): re-mounted d9738810-a43e-43d5-8eea-fd50d23f69b4. Quota mode: disabled.
*** stack smashing detected ***: terminated
Aborted (core dumped)
*** stack smashing detected ***: terminated
Aborted (core dumped)
Will now check all file systems.
Checking all file systems.
UUID=d9738810-a43e-43d5-8eea-fd50d23f69b4 is mounted
Done checking file systems.
Log is being saved in /var/log/fsck/checkfs if that location is writable.
Cleaning up temporary files...Cleaning /tmp...done.
 /tmp.
Will now mount local filesystems:.
Will now activate swapfile swap, if any:swapon: /dev/sda5: already active -- ignored
done.
Checking minimum space in /tmp...done.
Cleaning up temporary files....
Starting Setting kernel variables: sysctl.
Initializing random number generator...done.
Configuring network interfaces...done.
Starting nftables: nonemnl.c:60: Unable to initialize Netlink socket: Protocol not supported
 failed!
Cleaning up temporary files....
Press Enter for maintenance
(or press Control-D to continue): 
root@debian:~# sh /etc/init.d/mountdevsubfs.sh start
*** stack smashing detected ***: terminated
Aborted (core dumped)
root@debian:~# sh /etc/init.d/mountdevsubfs.sh start
root@debian:~# sh /etc/init.d/mountdevsubfs.sh start
*** stack smashing detected ***: terminated
Aborted (core dumped)
*** stack smashing detected ***: terminated
Aborted (core dumped)
root@debian:~# sh /etc/init.d/mountdevsubfs.sh start
root@debian:~# reboot
INIT: Switching to runlevel: 6
INIT: No inittab.d directory found
INIT: Sending processes configured via /etc/inittab the TERM signal
INIT: Sending processes configured via /etc/inittab the KILL signal
INIT: Pid 1006 [id ~~] seems to hang
Stopping Flexible I/O Tester as service: fio is not running.
Stopping nftables: nonemnl.c:60: Unable to initialize Netlink socket: Protocol not supported
 failed!
Asking all remaining processes to terminate...done.
All processes ended within 1 seconds...done.
Stopping hotplug events dispatcher: systemd-udevd.
Saving random seed...done.
Stopping enhanced syslogd: rsyslogd already stopped.
Saving the system clock to /dev/rtc0.
Hardware Clock updated to Thu Jan  1 11:13:47 AEST 1970.
Deconfiguring network interfaces...done.
Will now deactivate swap:swapoff /dev/sda5
.
Mounting root filesystem read-only...[ 2590.610000] EXT4-fs (sda6): re-mounted d9738810-a43e-43d5-8eea-fd50d23f69b4. Quota mode: disabled.
done.
Will now restart.
[ 2597.720000] reboot: Restarting system
