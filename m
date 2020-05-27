Return-Path: <SRS0=ooB5=7J=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04D4EC433E0
	for <linux-m68k@archiver.kernel.org>; Wed, 27 May 2020 09:14:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D5FEF2084C
	for <linux-m68k@archiver.kernel.org>; Wed, 27 May 2020 09:14:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726860AbgE0JOq (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 27 May 2020 05:14:46 -0400
Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66]:58003 "EHLO
        outpost1.zedat.fu-berlin.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725820AbgE0JOp (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 27 May 2020 05:14:45 -0400
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.93)
          with esmtps (TLS1.2)
          tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1jds93-0011iA-AB; Wed, 27 May 2020 11:14:41 +0200
Received: from p57bd9b57.dip0.t-ipconnect.de ([87.189.155.87] helo=[192.168.178.139])
          by inpost2.zedat.fu-berlin.de (Exim 4.93)
          with esmtpsa (TLS1.2)
          tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1jds92-000Ioo-Vu; Wed, 27 May 2020 11:14:41 +0200
To:     linux-m68k <linux-m68k@lists.linux-m68k.org>
Cc:     Debian m68k <debian-68k@lists.debian.org>,
        Laurent Vivier <laurent@vivier.eu>
From:   John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: Kernel crash on qemu-m68k-system while building r-cran packages
Autocrypt: addr=glaubitz@physik.fu-berlin.de; keydata=
 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
 scOkTAZQGVpD/8AaLH4v1w==
Message-ID: <ff031d61-c6d7-dacc-f656-da42ad729e53@physik.fu-berlin.de>
Date:   Wed, 27 May 2020 11:14:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 87.189.155.87
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi!

I just ran into the following kernel crash - which is reproducible - when trying
to build the R package r-cran-phangorn on qemu-m68k-system on Linux 5.6.7.

Adrian

[   56.640000] *** ADDRESS ERROR ***   FORMAT=2
[   56.640000] Current process id is 728
[   56.640000] BAD KERNEL TRAP: 00000000
[   56.640000] Modules linked in: sg evdev mac_hid ip_tables x_tables sha1_generic hmac ipv6 nf_defrag_ipv6 autofs4 ext4 crc16 mbcache jbd2 crc32c_generic sd_mod t10_pi crc_t10dif crct10dif_generic crct10dif_common sr_mod cdrom mac_esp macsonic esp_scsi
[   56.640000] PC: [<00016a2c>] X_UNSUPP+0x2c/0x3c
[   56.640000] SR: 2004  SP: 3eb5e68c  a2: c02e239a
[   56.640000] d0: 00000040    d1: 00000002    d2: 8002adec    d3: 8002ad50
[   56.640000] d4: 8002c768    d5: 0000000d    a0: ffffffc2    a1: ffffffc1
[   56.640000] Process R (pid: 728, task=a3dfda5d)
[   56.640000] Frame format=2 instr addr=00000000
[   56.650000] Stack from 3a4d9f30:
[   56.650000]         41000000 00000002 00000002 ffffffc2 ffffffc1 1fff0000 80000000 00000000
[   56.650000]         3fbf0000 80000000 00000000 00000000 20000000 00000000 7fff0000 ffffffff
[   56.650000]         ffffffff 00000000 00050008 00000000 8000067c c02c2000 efffee20 000002d8
[   56.650000]         00002a28 3a4d9f98 00000002 00000014 fffffffe 8002c768 00000002 00000041
[   56.650000]         00000002 c041fc58 c0743758 ffffffff 00000000 0008c075 00002b24 00000012
[   56.650000]         000007d0 00000024 00000002 c05bef04 c05bef04 0000005e 00000077 c28aca70
[   56.650000] Call Trace: [<00050008>] copy_overflow+0x10/0x28
[   56.650000]  [<00002a28>] buserr+0x20/0x28
[   56.650000]  [<0008c075>] bpf_check+0x57f/0x1cfa
[   56.650000]  [<00002b24>] syscall+0x8/0xc
[   56.650000]  [<0000c019>] dn_sched_init+0x75/0x88
[   56.650000] Code: 1017 0200 00f0 0c00 0040 66ff 0000 05ac <f23c> 8800 0000 0000 f23c 9000 0000 0000 222e ff84 082e 0005 ff1c 6600 000a 0281
[   56.650000] Disabling lock debugging due to kernel taint
[   56.650000] *** ADDRESS ERROR ***   FORMAT=2
[   56.650000] Current process id is 7
[   56.650000] BAD KERNEL TRAP: 00000000
[   56.650000] Modules linked in: sg evdev mac_hid ip_tables x_tables sha1_generic hmac ipv6 nf_defrag_ipv6 autofs4 ext4 crc16 mbcache jbd2 crc32c_generic sd_mod t10_pi crc_t10dif crct10dif_generic crct10dif_common sr_mod cdrom mac_esp macsonic esp_scsi
[   56.650000] PC: [<00016a2c>] X_UNSUPP+0x2c/0x3c
[   56.650000] SR: 2704  SP: 5ca00d79  a2: 391686b0
[   56.650000] d0: 00000040    d1: 3dc64d60    d2: 0000000e    d3: 309a6680
[   56.650000] d4: fffffffc    d5: 00000000    a0: 3dc64d60    a1: 391686b0
[   56.650000] Process ksoftirqd/0 (pid: 7, task=018bf318)
[   56.650000] Frame format=2 instr addr=00000000
[   56.650000] Stack from 3dc79e44:
[   56.650000]         41000000 00000000 3dc64d60 3dc64d60 391686b0 1fff0000 80000000 00000000
[   56.650000]         3fbf0000 80000000 00000000 00000000 20000000 00000000 7fff0000 ffffffff
[   56.650000]         ffffffff 00000000 00000000 00000000 00000004 00000004 00000000 00000000
[   56.650000]         0003f400 00000009 003e6ce0 003e6d10 391686dc 003e6ce0 00414bf4 39168641
[   56.650000]         0004732e 391686e8 003e6d10 003e6ce0 000472e2 000489a2 00042114 3dc64d8c
[   56.650000]         391686b0 391686dc 003e6ce0 00048b82 003e6ce0 391686dc 003e6ce0 3dc64d8c
[   56.650000] Call Trace: [<0003f400>] arch_local_irq_enable+0x8/0x26
[   56.650000]  [<0004732e>] set_next_entity+0x4c/0xbe
[   56.650000]  [<000472e2>] set_next_entity+0x0/0xbe
[   56.650000]  [<000489a2>] put_prev_entity+0x0/0x68
[   56.650000]  [<00042114>] smpboot_thread_fn+0x0/0x100
[   56.650000]  [<00048b82>] pick_next_task_fair+0x14e/0x186
[   56.650000]  [<002ef606>] __schedule+0x25e/0x39c
[   56.650000]  [<0003f4ca>] kthread_parkme+0x0/0x10
[   56.650000]  [<00042114>] smpboot_thread_fn+0x0/0x100
[   56.650000]  [<0003f5cc>] __init_completion+0x0/0x20
[   56.650000]  [<002ef3a8>] __schedule+0x0/0x39c
[   56.650000]  [<0003f450>] kthread_should_stop+0x0/0x12
[   56.650000]  [<0003f5cc>] __init_completion+0x0/0x20
[   56.650000]  [<002ef7ae>] schedule+0x6a/0xb2
[   56.650000]  [<002ef744>] schedule+0x0/0xb2
[   56.650000]  [<0003f476>] kthread_should_park+0x0/0xc
[   56.650000]  [<000421b8>] smpboot_thread_fn+0xa4/0x100
[   56.650000]  [<0002df86>] do_exit+0x0/0x720
[   56.650000]  [<0004bd4a>] complete+0x0/0x34
[   56.650000]  [<00040190>] kthread+0xb8/0xc2
[   56.650000]  [<000400d8>] kthread+0x0/0xc2
[   56.650000]  [<00002a74>] ret_from_kernel_thread+0xc/0x14
[   56.650000] Code: 1017 0200 00f0 0c00 0040 66ff 0000 05ac <f23c> 8800 0000 0000 f23c 9000 0000 0000 222e ff84 082e 0005 ff1c 6600 000a 0281
[   56.670000] *** ADDRESS ERROR ***   FORMAT=2
[   56.670000] Current process id is 174
[   56.670000] BAD KERNEL TRAP: 00000000
[   56.670000] Modules linked in: sg evdev mac_hid ip_tables x_tables sha1_generic hmac ipv6 nf_defrag_ipv6 autofs4 ext4 crc16 mbcache jbd2 crc32c_generic sd_mod t10_pi crc_t10dif crct10dif_generic crct10dif_common sr_mod cdrom mac_esp macsonic esp_scsi
[   56.670000] PC: [<00016a2c>] X_UNSUPP+0x2c/0x3c
[   56.670000] SR: 2704  SP: 82add07d  a2: 391686b0
[   56.670000] d0: efd57040    d1: 3c534000    d2: 0000000e    d3: 31cb9380
[   56.670000] d4: fffffffc    d5: 00000000    a0: 3c534000    a1: 391686b0
[   56.670000] Process systemd-journal (pid: 174, task=9a58f959)
[   56.670000] Frame format=2 instr addr=00000000
[   56.670000] Stack from 391c9ce4:
[   56.670000]         41000000 efd57054 3c534000 3c534000 391686b0 1fff0000 80000000 00000000
[   56.670000]         3fbf0000 80000000 00000000 00000000 20000000 00000000 7fff0000 ffffffff
[   56.670000]         ffffffff 00000000 04000000 00000000 00000004 00000006 00000000 00000000
[   56.670000]         00000000 00000009 003e6ce0 003e6d10 391686dc 003e6ce0 00414bf4 39168641
[   56.670000]         0004732e 391686e8 003e6d10 003e6ce0 000472e2 000489a2 000657d0 3c53402c
[   56.670000]         391686b0 391686dc 003e6ce0 00048b82 003e6ce0 391686dc 003e6ce0 3c53402c
[   56.670000] Call Trace: [<0004732e>] set_next_entity+0x4c/0xbe
[   56.670000]  [<000472e2>] set_next_entity+0x0/0xbe
[   56.670000]  [<000489a2>] put_prev_entity+0x0/0x68
[   56.670000]  [<000657d0>] futex_wait_queue_me+0x0/0xa6
[   56.670000]  [<00048b82>] pick_next_task_fair+0x14e/0x186
[   56.670000]  [<002ef606>] __schedule+0x25e/0x39c
[   56.670000]  [<0006535a>] futex_wait_setup+0x0/0x9c
[   56.670000]  [<000657d0>] futex_wait_queue_me+0x0/0xa6
[   56.670000]  [<00064bb8>] __unqueue_futex+0x0/0x3c
[   56.670000]  [<002ef3a8>] __schedule+0x0/0x39c
[   56.670000]  [<002e09f0>] list_add_tail+0x1c/0x36
[   56.670000]  [<002ef7ae>] schedule+0x6a/0xb2
[   56.670000]  [<00065848>] futex_wait_queue_me+0x78/0xa6
[   56.670000]  [<00048b82>] pick_next_task_fair+0x14e/0x186
[   56.670000]  [<002ef606>] __schedule+0x25e/0x39c
[   56.670000]  [<0006535a>] futex_wait_setup+0x0/0x9c
[   56.670000]  [<000657d0>] futex_wait_queue_me+0x0/0xa6
[   56.670000]  [<00064bb8>] __unqueue_futex+0x0/0x3c
[   56.670000]  [<002ef3a8>] __schedule+0x0/0x39c
[   56.670000]  [<002e09f0>] list_add_tail+0x1c/0x36
[   56.670000]  [<002ef7ae>] schedule+0x6a/0xb2
[   56.670000]  [<00065848>] futex_wait_queue_me+0x78/0xa6
[   56.670000]  [<00065904>] futex_wait+0x8e/0x150
[   56.670000]  [<0004fe94>] arch_local_irq_enable+0x0/0x26
[   56.670000]  [<00066b00>] do_futex+0x94/0x6ee
[   56.670000]  [<0000c041>] dn_serial_console_wait_key+0x15/0x24
[   56.670000]  [<0005bef6>] timekeeping_get_ns+0x4e/0x58
[   56.670000]  [<0000c041>] dn_serial_console_wait_key+0x15/0x24
[   56.670000]  [<0006737c>] sys_futex_time32+0x106/0x11e
[   56.670000]  [<00002b24>] syscall+0x8/0xc
[   56.670000]  [<0010c06b>] __blkdev_get+0x3f/0x3ce
[   56.670000] Code: 1017 0200 00f0 0c00 0040 66ff 0000 05ac <f23c> 8800 0000 0000 f23c 9000 0000 0000 222e ff84 082e 0005 ff1c 6600 000a 0281
[   56.670000] kernel BUG at kernel/sched/core.c:4097!
[   56.670000] *** TRAP #7 ***   FORMAT=0
[   56.670000] Current process id is 174
[   56.670000] BAD KERNEL TRAP: 00000000
[   56.670000] Modules linked in: sg evdev mac_hid ip_tables x_tables sha1_generic hmac ipv6 nf_defrag_ipv6 autofs4 ext4 crc16 mbcache jbd2 crc32c_generic sd_mod t10_pi crc_t10dif crct10dif_generic crct10dif_common sr_mod cdrom mac_esp macsonic esp_scsi
[   56.670000] PC: [<0004518c>] rt_mutex_setprio+0x0/0x1ae
[   56.670000] SR: 2000  SP: 249d2574  a2: 3c534000
[   56.680000] d0: 00000027    d1: 00002000    d2: 391c9c4c    d3: 391c9c4c
[   56.680000] d4: 0002d374    d5: 00000000    a0: 003e7b54    a1: 5000c022
[   56.680000] Process systemd-journal (pid: 174, task=9a58f959)
[   56.680000] Frame format=0
[   56.680000] Stack from 391c9c0c:
[   56.680000]         00378004 0037e061 00001001 00000000 391c9c54 0002e658 00000000 000000c0
[   56.680000]         fffffffc 00000000 00000000 391c9ea8 391c9cac 000525b6 3c53434c 3c4cd21c
[   56.680000]         391c9c4c 391c9c4c 391c9da8 00005486 0000000b 00000007 00000001 00378dc5
[   56.680000]         0037906c 00379166 00000000 391c9cac 00005ee6 00379166 391c9cac 00000000
[   56.680000]         0037914a 000000ae 0000000e 31cb9380 3c534000 003e6cd0 00002a50 391c9cac
[   56.680000]         3c534000 0000000e 31cb9380 fffffffc 00000000 3c534000 391686b0 391686b0
[   56.680000] Call Trace: [<00001001>] kernel_pg_dir+0x1/0x1000
[   56.680000]  [<0002e658>] do_exit+0x6d2/0x720
[   56.680000]  [<000525b6>] printk+0x0/0x18
[   56.680000]  [<00005486>] die_if_kernel+0x52/0x56
[   56.680000]  [<00005ee6>] bad_super_trap+0x130/0x14e
[   56.680000]  [<00002a50>] trap+0x20/0x28
[   56.680000]  [<0004732e>] set_next_entity+0x4c/0xbe
[   56.680000]  [<000472e2>] set_next_entity+0x0/0xbe
[   56.680000]  [<000489a2>] put_prev_entity+0x0/0x68
[   56.680000]  [<000657d0>] futex_wait_queue_me+0x0/0xa6
[   56.680000]  [<00048b82>] pick_next_task_fair+0x14e/0x186
[   56.680000]  [<002ef606>] __schedule+0x25e/0x39c
[   56.680000]  [<0006535a>] futex_wait_setup+0x0/0x9c
[   56.680000]  [<000657d0>] futex_wait_queue_me+0x0/0xa6
[   56.680000]  [<00064bb8>] __unqueue_futex+0x0/0x3c
[   56.680000]  [<002ef3a8>] __schedule+0x0/0x39c
[   56.680000]  [<002e09f0>] list_add_tail+0x1c/0x36
[   56.680000]  [<002ef7ae>] schedule+0x6a/0xb2
[   56.680000]  [<00065848>] futex_wait_queue_me+0x78/0xa6
[   56.680000]  [<00065904>] futex_wait+0x8e/0x150
[   56.680000]  [<0004fe94>] arch_local_irq_enable+0x0/0x26
[   56.680000]  [<00066b00>] do_futex+0x94/0x6ee
[   56.680000]  [<0000c041>] dn_serial_console_wait_key+0x15/0x24
[   56.680000]  [<0005bef6>] timekeeping_get_ns+0x4e/0x58
[   56.680000]  [<0000c041>] dn_serial_console_wait_key+0x15/0x24
[   56.680000]  [<0006737c>] sys_futex_time32+0x106/0x11e
[   56.680000]  [<00002b24>] syscall+0x8/0xc
[   56.680000]  [<0010c06b>] __blkdev_get+0x3f/0x3ce
[   56.680000] Code: e061 4879 0037 8004 4eb9 0005 25b6 4e47 <4e56> fff8 48e7 3f1c 266e 0008 2a6e 000c 242b 0020 4a8d 670a 202d 0018 b082 6c02
[   56.680000] Fixing recursive fault but reboot is needed!
[   56.690000] *** ADDRESS ERROR ***   FORMAT=2
[   56.690000] Current process id is 343
[   56.690000] BAD KERNEL TRAP: 00000000
[   56.690000] Modules linked in: sg evdev mac_hid ip_tables x_tables sha1_generic hmac ipv6 nf_defrag_ipv6 autofs4 ext4 crc16 mbcache jbd2 crc32c_generic sd_mod t10_pi crc_t10dif crct10dif_generic crct10dif_common sr_mod cdrom mac_esp macsonic esp_scsi
[   56.690000] PC: [<00016a2c>] X_UNSUPP+0x2c/0x3c

-- 
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer - glaubitz@debian.org
`. `'   Freie Universitaet Berlin - glaubitz@physik.fu-berlin.de
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
