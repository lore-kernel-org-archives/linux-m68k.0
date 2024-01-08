Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A4941170E
	for <linux-m68k@lists.linux-m68k.org>; Mon,  8 Jan 2024 09:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b="nfksUxvW"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-6d9af1f52bcso322521b3a.3
        for <linux-m68k@lists.linux-m68k.org>; Mon, 08 Jan 2024 01:32:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google; t=1704706349; x=1705311149; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Cs9vzb1n38r3KSCKHC3EJAI/1WYTWvMGUeUPWuKTBX8=;
        b=nfksUxvWx6g5vpZFZTS7DusFsWa6iKrNrg8rWQ8x2XxR3/2s5WSYF5hFSQzUGcSruL
         wRaMWjAPfg44WFV0M2BIDKTGd37PBPIaM8OPfSmuWHnYU9wy9KosBmXXVej0FSVh3sve
         ICUiv6/xRhGXQbRsugqkIBtDDSOYEwEVij4Lw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704706349; x=1705311149;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Cs9vzb1n38r3KSCKHC3EJAI/1WYTWvMGUeUPWuKTBX8=;
        b=SdJf9znZkHxqz1b1zxN0dGO5IjZNK6ZVJt2wXXdsz8bra6J6Gt06RAbspeg+CihCfP
         8xQUExK9Q+IaBZ4Ju/Uau7XLKINBpjtnRPvAWWckygjAOADP7yBx+bD1WSXk5hOMxChq
         gQSqoQxhov/Uw6if88zpu4oXSupUcgQvVwyKEdutaOnzsGRMK+7lMI3/PBUMa9pp5Yft
         e6KJxh/KzPDm9t0ThLX8c/2wGAPmSSa2iIAy655VB+LFxZeyjKhjRd0A8HpCjluY3Fg7
         oT83lJL0y5RLATD7HpEQFvWGQbc8b5T4PDXYZ4m3AnIe9ukOWIpxRod7dQXr5Ns+/DmS
         ZZEQ==
X-Gm-Message-State: AOJu0YzB1uDQ/FIpyhS9IIVljP4RmacOAFNWJGxR9hi1N5mzMFbUT4w7
	Jg7RnJuoy7GStJd3JFKz0FUbtXP9wGT4RQ==
X-Google-Smtp-Source: AGHT+IFRYXmofrK8Fzap3zYZgFlLslio0ZB2+sDl/xb33Gkmro2oN5dexos0NCcxXOfGFZPnNCd+tQ==
X-Received: by 2002:a05:6a00:2913:b0:6d9:b547:b398 with SMTP id cg19-20020a056a00291300b006d9b547b398mr1250912pfb.63.1704706348561;
        Mon, 08 Jan 2024 01:32:28 -0800 (PST)
Received: from shiro.work.home.arpa ([2400:4162:2428:2ffe:a221:b29b:7116:6ce9])
        by smtp.googlemail.com with ESMTPSA id i8-20020a632208000000b005cdbebd61d8sm5578974pgi.9.2024.01.08.01.32.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jan 2024 01:32:27 -0800 (PST)
From: Daniel Palmer <daniel@0x0f.com>
To: gerg@linux-m68k.org,
	geert@linux-m68k.org,
	fthain@linux-m68k.org
Cc: linux-m68k@lists.linux-m68k.org,
	linux-kernel@vger.kernel.org,
	Daniel Palmer <daniel@0x0f.com>
Subject: [PATCH v2 0/2] Fix 68000 interrupt stack frames
Date: Mon,  8 Jan 2024 18:32:19 +0900
Message-ID: <20240108093221.1477020-1-daniel@0x0f.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

While porting u-boot/linux to the QEMU M68K virt machine with configured
with a 68000 cpu (i.e. nommu..) I noticed that this has been broken for
a while.

I can't test this works on DragonBall right now as I need to get u-boot
working, put the UART driver back etc but this is working fine on QEMU
with some other WIP bits except for the issue that as soon as a process
exits the kernel panics that I'm debugging currently:

qemu-system-m68k \
        -cpu m68000 \
        -m 128 \
        -M virt \
        -kernel u-boot/u-boot.elf.fudged \
        -nographic \
        -drive file=fat:./bootfiles/,if=none,id=drive-dummy,readonly=on \
        -device virtio-blk-device,drive=drive-dummy \
        -drive format=raw,file=buildroot/output/images/rootfs.squashfs,if=none,id=drive-rootfs \
        -device virtio-blk-device,drive=drive-rootfs \
        -device virtio-serial-device \
        -netdev user,id=net1 \
        -device virtio-net-device,netdev=net1 \
        -s

U-Boot 2024.01-rc6-00024-g90c9fa986604-dirty (Jan 08 2024 - 17:58:36 +0900)

DRAM:  128 MiB
Core:  134 devices, 6 uclasses, devicetree: embed
Warning: Device tree includes old 'u-boot,dm-' tags: please fix by 2023.07!
Loading Environment from nowhere... OK
In:    uart@ff008000
Out:   uart@ff008000
Err:   uart@ff008000
Net:   No ethernet found.
=> virtio scan; fatload virtio 1:1 0x3000000 vmlinux; setenv autostart yes; setenv bootargs console=ttyGF0 init=/bin/sh root=/dev/vda rootfstype=squashfs; bootelf 0x3000000
3669228 bytes read in 5 ms (699.8 MiB/s)
## Starting application at 0x00000400 ...
new fdt 07bf1810
[    0.000000] Linux version 6.7.0-rc8-00188-gd9657c8bdd78 (daniel@shiro) (m68k-linux-gnu-gcc (Debian 13.2.0-7) 13.2.0, GNU ld (GNU Binutils for Debian) 2.41.50.20231227) #38 Mon Jan  8 17:58:45 JST 2024
[    0.000000] Flat model support (C) 1998,1999 Kenneth Albanowski, D. Jeff Dionne
[    0.000000] Generic DT Machine (C) 2024 Daniel Palmer <daniel@thingy.jp>
[    0.000000] Zone ranges:
[    0.000000]   DMA      [mem 0x0000000000000000-0x00000000ffffefff]
[    0.000000]   Normal   empty
[    0.000000] Movable zone start for each node
[    0.000000] Early memory node ranges
[    0.000000]   node   0: [mem 0x0000000000000000-0x0000000007ffffff]
[    0.000000] Initmem setup node 0 [mem 0x0000000000000000-0x0000000007ffffff]
[    0.000000] Kernel command line: console=ttyGF0 init=/bin/sh root=/dev/vda rootfstype=squashfs
[    0.000000] Dentry cache hash table entries: 16384 (order: 4, 65536 bytes, linear)
[    0.000000] Inode-cache hash table entries: 8192 (order: 3, 32768 bytes, linear)
[    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 32512
[    0.000000] mem auto-init: stack:all(zero), heap alloc:off, heap free:off
[    0.000000] Memory: 126140K/131072K available (2571K kernel code, 299K rwdata, 604K rodata, 108K init, 106K bss, 4932K reserved, 0K cma-reserved)
[    0.000000] SLUB: HWalign=16, Order=0-1, MinObjects=0, CPUs=1, Nodes=1
[    0.000000] NR_IRQS: 126
[    0.000000] irq_goldfish_pic: /soc/pic@0: Successfully registered.
[    0.000000] irq_goldfish_pic: /soc/pic@1: Successfully registered.
[    0.000000] irq_goldfish_pic: /soc/pic@2: Successfully registered.
[    0.000000] irq_goldfish_pic: /soc/pic@3: Successfully registered.
[    0.000000] irq_goldfish_pic: /soc/pic@4: Successfully registered.
[    0.000000] irq_goldfish_pic: /soc/pic@5: Successfully registered.
[    0.010000] Calibrating delay loop... 2046.36 BogoMIPS (lpj=10231808)
[    0.070000] pid_max: default: 32768 minimum: 301
[    0.070000] Mount-cache hash table entries: 1024 (order: 0, 4096 bytes, linear)
[    0.070000] Mountpoint-cache hash table entries: 1024 (order: 0, 4096 bytes, linear)
[    0.080000] devtmpfs: initialized
[    0.090000] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 19112604462750000 ns
[    0.090000] futex hash table entries: 256 (order: -1, 3072 bytes, linear)
[    0.100000] NET: Registered PF_NETLINK/PF_ROUTE protocol family
[    0.140000] NET: Registered PF_INET protocol family
[    0.140000] IP idents hash table entries: 2048 (order: 2, 16384 bytes, linear)
[    0.140000] tcp_listen_portaddr_hash hash table entries: 1024 (order: 0, 4096 bytes, linear)
[    0.140000] Table-perturb hash table entries: 65536 (order: 6, 262144 bytes, linear)
[    0.150000] TCP established hash table entries: 1024 (order: 0, 4096 bytes, linear)
[    0.150000] TCP bind hash table entries: 1024 (order: 1, 8192 bytes, linear)
[    0.150000] TCP: Hash tables configured (established 1024 bind 1024)
[    0.150000] UDP hash table entries: 256 (order: 0, 4096 bytes, linear)
[    0.150000] UDP-Lite hash table entries: 256 (order: 0, 4096 bytes, linear)
[    0.150000] workingset: timestamp_bits=30 max_order=15 bucket_order=0
[    0.150000] squashfs: version 4.0 (2009/01/31) Phillip Lougher
[    0.160000] printk: legacy console [ttyGF0] enabled
[    0.170000] virtio_blk virtio2: 1/0/0 default/read/poll queues
[    0.170000] virtio_blk virtio2: [vda] 936 512-byte logical blocks (479 kB/468 KiB)
[    0.180000] virtio_blk virtio3: 1/0/0 default/read/poll queues
[    0.180000] virtio_blk virtio3: [vdb] 1032192 512-byte logical blocks (528 MB/504 MiB)
[    0.180000]  vdb: vdb1
[    0.190000] goldfish_rtc ff007000.rtc: registered as rtc0
[    0.190000] goldfish_rtc ff007000.rtc: setting system clock to 2024-01-08T08:58:52 UTC (1704704332)
[    0.190000] NET: Registered PF_INET6 protocol family
[    0.190000] Segment Routing with IPv6
[    0.190000] In-situ OAM (IOAM) with IPv6
[    0.190000] sit: IPv6, IPv4 and MPLS over IPv4 tunneling driver
[    0.210000] VFS: Mounted root (squashfs filesystem) readonly on device 254:0.
[    0.210000] devtmpfs: mounted
[    0.210000] Freeing unused kernel image (initmem) memory: 108K
[    0.210000] This architecture does not have kernel memory protection.
[    0.210000] Run /bin/sh as init process
[    0.250000] random: sh: uninitialized urandom read (4 bytes read)
~ # uname -a
[   54.830000] random: uname: uninitialized urandom read (4 bytes read)
uClinux (none) 6.7.0-rc8-00188-gd9657c8bdd78 #38 Mon Jan  8 17:58:45 JST 2024 m68k GNU/Linux
[   54.840000] Kernel panic - not syncing: Attempted to kill init! exitcode=0x00000000
[   54.840000] CPU: 0 PID: 1 Comm: sh Not tainted 6.7.0-rc8-00188-gd9657c8bdd78 #38
[   54.840000] Stack from 0041bf20:
[   54.840000]         0041bf20 002fd8d1 002fd8d1 0041fb00 00000001 0041bf40 0027e946 002fd8d1
[   54.840000]         0041bf5c 0027b36e 0041fbc4 000000ff 00000000 00418000 00321ba4 0041bfa0
[   54.840000]         0027bbee 002f6dbe 00000000 00000000 000000f7 0062e538 00000001 00000000
[   54.840000]         00000000 00004c10 008255fe 00825272 008406da 008255fe 0041bf98 0041bf98
[   54.840000]         0041bfb4 000057f8 00000000 00000000 0041a000 0041bfc4 0027bdf2 00000000
[   54.840000]         002f6ef9 00891cb4 000019f8 00000000 00000000 000000f7 0062e538 00000001
[   54.840000] Call Trace: [<0027e946>] dump_stack+0x10/0x16
[   54.840000]  [<0027b36e>] panic+0xc2/0x24c
[   54.840000]  [<0027bbee>] do_exit+0x4bc/0x684
[   54.840000]  [<00004c10>] get_current+0x0/0x16
[   54.840000]  [<000057f8>] do_group_exit+0x2a/0x6c
[   54.840000]  [<0027bdf2>] pr_cont_pool_info+0x0/0x62
[   54.840000]  [<000019f8>] system_call+0x48/0x4c
[   54.840000]  [<00200000>] tcp_seq_next+0x6e/0x90
[   54.840000]
[   54.840000] ---[ end Kernel panic - not syncing: Attempted to kill init! exitcode=0x00000000 ]---

Daniel Palmer (2):
  m68k: Use macro to generate 68000 interrupt entry sleds
  m68k: Fix interrupt stack frames for 68000

 arch/m68k/68000/entry.S             | 103 ++++++----------------------
 arch/m68k/68000/ints.c              |  30 ++++----
 arch/m68k/include/asm/entry.h       |   3 +
 arch/m68k/include/uapi/asm/ptrace.h |   2 +-
 4 files changed, 40 insertions(+), 98 deletions(-)

-- 
2.43.0

