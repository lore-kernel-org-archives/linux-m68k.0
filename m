Return-Path: <SRS0=lrj2=5Q=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D623EC43331
	for <linux-m68k@archiver.kernel.org>; Tue, 31 Mar 2020 06:07:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9CC5A20748
	for <linux-m68k@archiver.kernel.org>; Tue, 31 Mar 2020 06:07:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eXL+jL07"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726620AbgCaGHH (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 31 Mar 2020 02:07:07 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:50906 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725809AbgCaGHH (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 31 Mar 2020 02:07:07 -0400
Received: by mail-wm1-f68.google.com with SMTP id t128so1147759wma.0
        for <linux-m68k@lists.linux-m68k.org>; Mon, 30 Mar 2020 23:07:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=dez/VhJcdXWzVu+G7q9U7twMjxW2ng/7kEhwDOJ/S4o=;
        b=eXL+jL07ssKgMW49967YCM3T52pIu4+dhUcPmD4L1x+Y1bMCmoUFN6IJScjpmfv+Zm
         tynkhXHwmzXO/aq4h5/xJTtZDLMe6PPaojrQePV0puZ4l4Bng+yjsvCqJ3ZphSxgHYhf
         ks2C+AC/5ENcbjgqZveOkQg7VnGBopjUHHtTI5Pji0azbq9au9gTuI5Pcl4QeNK59Fs5
         dEGO5gDIw5UQtHfZKXKt+HVi125/NRXOS+LUwE6FbA7XxKYO2t1usmCSBs6kD/U8j5v+
         MCOxCsJSENMViAN3zzcaO6nQOFXr3Our7lZIKOhoaSQS55xQQMQnubhFcR7o6TfV17bD
         MGmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=dez/VhJcdXWzVu+G7q9U7twMjxW2ng/7kEhwDOJ/S4o=;
        b=qBhUq76TwkCAGHXk4a7iv//n4mufnXr3M7PKWVAMER5ij6TVF4yRbz+7+ySvz0+Fs0
         8K1JeJ/bjDpTW1YoB7fh025J9a+mFzYSopxAZbFwvXtx5f5rK3iGTJyHTETcdgm2FMMT
         oKxKyJTSvzu6G2RnyCn26h9fX055A/8UQKzWvC+ayBe80SySI7LNNDrkpuclymSQOsRV
         NiABNiOQTm7reAQV7TCwHShUlM6gRC8qt19vspI4CfPzhT5WcPwkWoixzRn7yt9h+U3D
         CpBq0GtFelr+puXVh5p8MFVeAAvYCDtZ5xQzlE35VYsoHXGSu0PIb6fnE//QachmWmU7
         /03g==
X-Gm-Message-State: ANhLgQ3iVJpOkNGyZrWi/JtanCFW+Nk5bSOuMUkdu11lDiCGiWeG5rUj
        +NaVh+I6bUwwr68XI7HesM5VoJjcLJIxPpD6VvgGTRcnRdU=
X-Google-Smtp-Source: ADFU+vun8J7s3yQgjVgn1w4e2U9yGQ5Qu0C7cdPDdfrDcEbJtE5d2Wz4ojI7Nd+uJdHEYgN0nUMylxTRqDNDddAUpD8=
X-Received: by 2002:a7b:ca46:: with SMTP id m6mr1726230wml.102.1585634824906;
 Mon, 30 Mar 2020 23:07:04 -0700 (PDT)
MIME-Version: 1.0
From:   Stefan Reinauer <stefan.k.reinauer@gmail.com>
Date:   Mon, 30 Mar 2020 23:06:52 -0700
Message-ID: <CABq5eXG0=2H7N-BvXftudRb9Jv=8Ybbw9T+=zKMw=nyawTEQWA@mail.gmail.com>
Subject: kernel memory corruption in private_data
To:     linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi.

My Linux system is now booting and I am trying to write a driver for
the MNT ZZ9000 graphics card (and network adapter and USB port).

As a strategy I started with USB support, then moved on to network
support (so I could possibly debug the framebuffer driver without a
framebuffer and get new driver versions sent to the Amiga without
having to compile locally)

I am having some success in talking to the ZZ9000, but it's been full
of challenges.

One of them is that my block device disk structure's private data gets
partly overwritten (only the pointer to the structures that have the
pointers to my ioremapped device memory:

The pointer reads back as 0x13f484b9 (instead of e781c9cc where the
struct really lives.
(See code and log below: ZZ9000 log)

I can't get my serial port lose few enough characters to  run ppp over
it, so I decided to have a go at a driver for the HyperCOM 4+ that I
have sitting around. It's 16552 based and there's a driver in NetBSD,
so it should be easy enough.

Ok, but when I am loading 8250.ko (have to move the MINOR to avoid
conflict with amiserial), I get a kernel oops when trying to lock a
mutex, which seems very random for all the places where it could fail.
Until I see the virtual kernel address in the oops: 13f484b9, the same
address that magically showed up in my zz9000 driver data structure.

What is going on here? This is really obscure.

Stefan

--------------------------- ZZ9000 Log
------------------------------------------------------------
dev = kzalloc(sizeof(zz9000_usb_storage_t), GFP_KERNEL);
[..]
zz9000_usb_queue = blk_mq_init_sq_queue(&dev->tag_set, &zz9000_mq_ops,
128, BLK_MQ_F_SHOULD_MERGE);
[..]
dev->queue = zz9000_usb_queue;
dev->queue->queuedata = dev;
[..]
dev->disk = alloc_disk(16);
[..]
dev->disk->fops = &zz9000_usb_fops;
[..]
dev->disk->private_data = dev;
[..]
dump_private(dev);
add_disk(dev->disk);
[..]
dump_private(dev);

[  255.080000] zz9000: loading out-of-tree module taints kernel.
[  255.140000] MNT ZZ9000 driver v0.1 alpha (Mar 30 2020 21:21:31)
[  255.150000] MNT ZZ9000 Zorro III found at 0x40000000
[  255.160000]   HW version 0
[  255.170000]   FW version 1.5
[  255.180000]   USB capacity: 7669824 512-byte logical blocks: (3.93
GB GB/3.66 GiB GiB)
[  255.210000] zz9000_usb_init: platform data (13f484b9, expected e781c9cc)
[  255.220000] priv @2e1df782
[  255.230000]   |-- capacity     = 7669824
[  255.240000]   |-- data         = 13f484b9
[  255.260000]   |-- open_counter = 0
[  255.270000]   |-- queue        = bedd5080
[  255.280000]   |-- disk         = 6f7f0035
[  255.280000]
[  255.330000] usb_open: platform data corrupted (13f484b9, expected e781c9cc)
[  255.350000] priv @2e1df782
[  255.370000]   |-- capacity     = 7669824
[  255.380000]   |-- data         = 13f484b9
[  255.390000]   |-- open_counter = 0
[  255.400000]   |-- queue        = bedd5080
[  255.410000]   |-- disk         = 6f7f0035
[  255.410000]
[  255.530000] zz9000_usb_init: platform data (e781c9cc, expected e781c9cc)
[  255.540000] priv @2e1df782
[  255.560000]   |-- capacity     = 7669824
[  255.570000]   |-- data         = e781c9cc
[  255.580000]   |-- open_counter = 0
[  255.590000]   |-- queue        = bedd5080
[  255.600000]   |-- disk         = 6f7f0035
-----------------------------------------------------------------------------------------------------

----------------------------8250.ko
--------------------------------------------------------------
[  329.480000] Serial: 8250/16550 driver, 4 ports, IRQ sharing disabled
[  329.500000] Unable to handle kernel NULL pointer dereference at
virtual address 13f484b9
[  329.500000] Oops: 00000000
[  329.500000] Modules linked in: 8250(O+) 8250_base(O) zz9000(O) affs
ext4 crc16 mbcache jbd2 crc32c_generic ide_cd_mod cdrom ide_gd_me
[  329.500000] PC: [<1088fb92>] io_serial_in+0x22/0x36 [8250_base]
[  329.500000] SR: 2714  SP: 15fb5dcc  a2: 0dcb1ac0
[  329.500000] d0: 00000000    d1: ffffffff    d2: 00000000    d3: 0dca120a
[  329.500000] d4: 10891ca4    d5: 0e192010    a0: 00000000    a1: 00000000
[  329.500000] Process insmod (pid: 143, task=c63d20d6)
[  329.500000] Frame format=4 fault addr=00000000 fslw=01450200
[  329.500000] Stack from 0f50fd50:
[  329.500000]         1089120a 10853338 00000001 00000000 0dca120a
0dd5ec7e 0e199140 00000013
[  329.500000]         000007f8 10853338 0dd5ec00 10853178 002e247e
1085301c 001d6eb0 001d6ef8
[  329.500000]         10853338 00000001 00000000 0dca120a 0013ce68
00051862 10853397 001d6d94
[  329.500000]         0f50fe78 0dca1200 0e19aef0 0002f740 0f50fe78
0f50fdd8 0f50fe78 001e584c
[  329.500000]         0dca120a 001e58b0 0dca120a 00000000 00000000
0013ce68 0e199140 00051862
[  329.500000]         0e19aef0 1087935a 10853178 10853338 00000002
00000000 10879216 0e19aef0
[  329.500000] Call Trace: [<1089120a>]
serial8250_config_port+0x70/0x8d4 [8250_base]
[  329.500000]  [<002e247e>] mutex_lock+0x0/0x34
[  329.500000]  [<001d6eb0>] uart_add_one_port+0x11c/0x366
[  329.500000]  [<001d6ef8>] uart_add_one_port+0x164/0x366
[  329.500000]  [<0013ce68>] sysfs_create_bin_file+0x0/0x7e
[  329.500000]  [<00051862>] printk+0x0/0x18
[  329.500000]  [<001d6d94>] uart_add_one_port+0x0/0x366
[  329.500000]  [<0002f740>] insert_resource+0x0/0x1c
[  329.500000]  [<001e584c>] platform_device_add+0x60/0x1ce
[  329.500000]  [<001e58b0>] platform_device_add+0xc4/0x1ce
[  329.500000]  [<0013ce68>] sysfs_create_bin_file+0x0/0x7e
[  329.500000]  [<00051862>] printk+0x0/0x18
[  329.500000]  [<1087935a>] serial8250_init+0x144/0x160 [8250]
[  329.500000]  [<10879216>] serial8250_init+0x0/0x160 [8250]
[  329.500000]  [<0004a9ae>] __wake_up+0x0/0x1c
[  329.500000]  [<0000214c>] do_one_initcall+0x5a/0x14e
[  329.500000]  [<000676b4>] module_put+0x0/0x52
[  329.500000]  [<0013ce68>] sysfs_create_bin_file+0x0/0x7e
[  329.500000]  [<000bf4d0>] __vfree+0x28/0x2c
[  329.500000]  [<000cceee>] slab_pre_alloc_hook+0x1c/0x52
[  329.500000]  [<000ced48>] kmem_cache_alloc+0x68/0xc4
[  329.500000]  [<000ced6a>] kmem_cache_alloc+0x8a/0xc4
[  329.500000]  [<0013ce68>] sysfs_create_bin_file+0x0/0x7e
[  329.500000]  [<000400ec>] blocking_notifier_call_chain+0x0/0x1e
[  329.500000]  [<000683a0>] do_init_module+0x50/0x192
[  329.500000]  [<10879216>] serial8250_init+0x0/0x160 [8250]
[  329.500000]  [<00069f6c>] load_module+0x1a1a/0x1c20
[  329.500000]  [<0006a31c>] sys_finit_module+0x98/0xaa
[  329.500000]  [<0000108a>] kernel_pg_dir+0x8a/0x1000
[  329.500000]  [<00030000>] __do_proc_douintvec+0x48/0x1b0
[  329.500000]  [<00001796>] kernel_pg_dir+0x796/0x1000
[  329.500000]  [<000029e8>] syscall+0x8/0xc
[  329.500000]  [<0014c031>] keyctl_read_key+0x8d/0xbe
[  329.500000] Code: 0c80 0000 03ff 6210 2f00 4eba fe9e 588f <3210>
e9c1 0408 4e75 2040 1010 0280 0000 00ff 60f2 2f02 206f 0008 242f 001
