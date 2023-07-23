Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB72BC001B0
	for <linux-m68k@archiver.kernel.org>; Sun, 23 Jul 2023 15:54:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229566AbjGWPy0 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sun, 23 Jul 2023 11:54:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229446AbjGWPyZ (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sun, 23 Jul 2023 11:54:25 -0400
X-Greylist: delayed 1529 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sun, 23 Jul 2023 08:54:23 PDT
Received: from mail.sowerbutts.com (mail.sowerbutts.com [IPv6:2001:8b0:3b1:dead::100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06DBEE5F
        for <linux-m68k@lists.linux-m68k.org>; Sun, 23 Jul 2023 08:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sowerbutts.com; s=igor; h=In-Reply-To:Content-Type:MIME-Version:References:
        Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=eaFXBipN3ULt6yhLaiRPx6YHXqdhZ1UxShXKUN9EpUM=; b=eMgw2sR7/c8zO65rNRGlFryu3m
        ayrPBeZVn6nTebpnwV5x7wjn+iEWwCUdLlSVT5O5i3sKL8XyC3Zp8Xhxc95HI0B1aMmjX3o1ewGok
        KvRKMjIfbKHjbIJdII7FuhhVTh8h7GGMjm5Aob/3pBhUBWIhUiFpwRua/ZnpFpwGACT6PGAmajEha
        x4lKI4iw3DgorIW84T5N+SmC4WAlWTjJrI5hIkvQMBo51zJQMBYBkGyvIZfhG3p02RJKw5B7TPlXW
        kK7NKeUQl3/BGkkCIn3+aZjlPHSwIAhr+BigM1bqYESxQp7KZ28SFl345bJN+GDshCTwT7DRvPqL/
        KGUZ8waA==;
Received: from badhorse.sowerbutts.com ([2001:8b0:3b1:beef::bad] helo=sowerbutts.com)
        by mail.sowerbutts.com with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.96)
        (envelope-from <will@sowerbutts.com>)
        id 1qNb0s-002oPa-2l;
        Sun, 23 Jul 2023 16:28:50 +0100
Date:   Sun, 23 Jul 2023 16:28:50 +0100
From:   William R Sowerbutts <will@sowerbutts.com>
To:     Finn Thain <fthain@linux-m68k.org>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
Subject: Re: Linux 6.4.4 on m68k - Q40 - pata_falcon causes oops at boot time
Message-ID: <ZL1HMqBbdw+8buf+@sowerbutts.com>
References: <ZLvZmVfzJNHlPTlJ@sowerbutts.com>
 <CAMuHMdUU62jjunJh9cqSqHT87B0H0A4udOOPs=WN7WZKpcagVA@mail.gmail.com>
 <1dabd80c-d91e-7869-e95e-199fc58b9f84@linux-m68k.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1dabd80c-d91e-7869-e95e-199fc58b9f84@linux-m68k.org>
X-URL:  http://sowerbutts.com/
X-Hatstand: Voltron
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

>> It might be a good idea to verify that IDE works in v5.13
>
>Yes, please do.

It does:

[    0.000000] Linux version 5.13.0-wrs (btg@carbon) (m68k-linux-gnu-gcc (Debian 12.2.0-13) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40) #1 Sun Jul 23 15:47:14 BST 2023
[    0.000000] Zone ranges:
[    0.000000]   DMA      [mem 0x0000000000040000-0x0000001fffffffff]
[    0.000000]   Normal   empty
[    0.000000] Movable zone start for each node
[    0.000000] Early memory node ranges
[    0.000000]   node   0: [mem 0x0000000000040000-0x0000000001ffffff]
[    0.000000] Initmem setup node 0 [mem 0x0000000000040000-0x0000000001ffffff]
[    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 8056
[    0.000000] Kernel command line: console=ttyS2,115200n8 earlyprintk=ttyS2,115200  BOOT_IMAGE=vmlinux513
[    0.000000] Dentry cache hash table entries: 4096 (order: 2, 16384 bytes, linear)
[    0.000000] Inode-cache hash table entries: 2048 (order: 1, 8192 bytes, linear)
[    0.000000] Sorting __ex_table...
[    0.000000] mem auto-init: stack:off, heap alloc:off, heap free:off
[    0.000000] Memory: 27708K/32512K available (2991K kernel code, 449K rwdata, 856K rodata, 104K init, 133K bss, 4804K reserved, 0K cma-reserved)
[    0.000000] NR_IRQS: 43
[    0.010000] Console: colour dummy device 80x25
[    0.090000] printk: console [ttyS2] enabled
[    0.090000] Calibrating delay loop... 26.16 BogoMIPS (lpj=130816)
[    0.210000] pid_max: default: 32768 minimum: 301
[    0.220000] Mount-cache hash table entries: 1024 (order: 0, 4096 bytes, linear)
[    0.230000] Mountpoint-cache hash table entries: 1024 (order: 0, 4096 bytes, linear)
[    0.270000] devtmpfs: initialized
[    0.290000] random: get_random_u32 called from bucket_table_alloc.isra.0+0xe0/0xf8 with crng_init=0
[    0.300000] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 19112604462750000 ns
[    0.310000] futex hash table entries: 256 (order: -1, 3072 bytes, linear)
[    0.330000] NET: Registered protocol family 16
[    0.330000] DMA: preallocated 128 KiB GFP_KERNEL pool for atomic allocations
[    0.340000] DMA: preallocated 128 KiB GFP_KERNEL|GFP_DMA pool for atomic allocations
[    0.500000] wait_for_initramfs() called before rootfs_initcalls
[    0.530000] SCSI subsystem initialized
[    0.800000] NET: Registered protocol family 2
[    0.810000] IP idents hash table entries: 2048 (order: 2, 16384 bytes, linear)
[    0.830000] tcp_listen_portaddr_hash hash table entries: 512 (order: 0, 4096 bytes, linear)
[    0.840000] TCP established hash table entries: 1024 (order: 0, 4096 bytes, linear)
[    0.840000] TCP bind hash table entries: 1024 (order: 0, 4096 bytes, linear)
[    0.850000] TCP: Hash tables configured (established 1024 bind 1024)
[    0.850000] UDP hash table entries: 256 (order: 0, 4096 bytes, linear)
[    0.860000] UDP-Lite hash table entries: 256 (order: 0, 4096 bytes, linear)
[    0.870000] NET: Registered protocol family 1
[    0.890000] workingset: timestamp_bits=30 max_order=13 bucket_order=0
[    0.930000] fb0: Q40 frame buffer alive and kicking !
[    0.940000] Serial: 8250/16550 driver, 8 ports, IRQ sharing disabled
[    0.950000] serial8250: ttyS0 at I/O 0x3f8 (irq = 4, base_baud = 115200) is a 16450
[    0.960000] serial8250: ttyS1 at I/O 0x2f8 (irq = 3, base_baud = 115200) is a 16450
[    0.980000] serial8250: ttyS2 at I/O 0x3e8 (irq = 4, base_baud = 115200) is a 16550A
[    0.990000] serial8250: ttyS3 at I/O 0x2e8 (irq = 3, base_baud = 115200) is a 16550A
[    1.160000] loop: module loaded
[    1.160000] Uniform Multi-Platform E-IDE driver
[    1.170000] ide: Q40 IDE controller
[    1.170000] legacy IDE will be removed in 2021, please switch to libata
[    1.170000] Report any missing HW support to linux-ide@vger.kernel.org
[    1.280000] random: fast init done
[    1.540000] hda: InnoDisk Corp. - iCF4000 2GB, CFA DISK drive
[    2.680000] ide0 at 0xff4007c0 on irq 14
[    2.690000] ide1 at 0xff4005c0 on irq 15
[    2.700000] ide-gd driver 1.18
[    2.700000] hda: max request size: 128KiB
[    2.710000] hda: 4095504 sectors (2096 MB) w/1KiB Cache, CHS=4063/16/63
[    2.750000] hda: cache flushes supported
[    2.780000]  hda: AHDI hda1 hda2 hda3
[    2.910000] PPP generic driver version 2.4.2
[    2.920000] serio: Q40 kbd registered
[    2.940000] NET: Registered protocol family 10
[    2.960000] input: AT Raw Set 2 keyboard as /devices/platform/q40kbd/serio0/input/input0
[    2.980000] Segment Routing with IPv6
[    3.000000] VFS: Cannot open root device "(null)" or unknown-block(0,0): error -6

_________________________________________________________________________
William R Sowerbutts                                  will@sowerbutts.com
"Carpe post meridiem"                               http://sowerbutts.com
         main(){char*s=">#=0> ^#X@#@^7=",c=0,m;for(;c<15;c++)for
         (m=-1;m<7;putchar(m++/6&c%3/2?10:s[c]-31&1<<m?42:32));}  

