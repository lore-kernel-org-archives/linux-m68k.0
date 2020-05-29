Return-Path: <SRS0=UnHi=7L=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64304C433E0
	for <linux-m68k@archiver.kernel.org>; Fri, 29 May 2020 23:49:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2241B20810
	for <linux-m68k@archiver.kernel.org>; Fri, 29 May 2020 23:49:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G8pcgh85"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728293AbgE2Xtn (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 29 May 2020 19:49:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728142AbgE2Xtm (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 29 May 2020 19:49:42 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C9DBC03E969
        for <linux-m68k@lists.linux-m68k.org>; Fri, 29 May 2020 16:49:41 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id m1so645857pgk.1
        for <linux-m68k@lists.linux-m68k.org>; Fri, 29 May 2020 16:49:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=pA+8mJmck73/JafAAwKzBJzl4tCWVA5smdBgb9uDKeA=;
        b=G8pcgh85jrSigg9jpyHJ2PQXGWnyzywrNOeyHi/zEvSnuCbUokvIvswGX7TigeMqKC
         WEpNjL5q72yZpAFfVgvxuicyrqzZkJVhE2Fgi0G10P6rZdIKWzFxmDot59uAJrVl4sdH
         J+luOd6YLCEZ0aPlGdCj8OEhpbopzxYc8gSNG0ulXYqoH9xzukbKTbuzHrHypNstEEc0
         cl0BZlrFunnXVDjV+hOCMDPKLTTc3TQ9bZMFRRDlSmTfri51udjVJJ4BewELuunfsPE8
         4PRqpKLC5Mwiyha5BjsmDdZX2H8NQdg7NIyxqOrOBSvuy8efuOAm3nay1VNnYkzx8PFE
         1uTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:cc:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=pA+8mJmck73/JafAAwKzBJzl4tCWVA5smdBgb9uDKeA=;
        b=MjZTGZZv93aEEGf+59fQCT5wYbmJDOaNxExSaTiF3BSYEqe8UjF5D7BGtaFTh/48k3
         C5pfv3docXfgSjE+GDe4/wo1Nj0YRsM7EDcUPSEIU08sk3aQ0FtaZZ0Oj7BUHCCqEJi9
         1f7jL5WiBLMII8mvKCPkV0w2/oT2bkaheMYFbS+TrT8bfP8bsxl5pttBQL4vezgCHuBT
         UOUTTiZOnKnPx/T4j8hGG10Hc22ywFY8NXeDJzkWmUqUXpyyGxhodCO2WBk1zwaGBY7Z
         Aujrauxc0o+IlmJQsW39q5yOjQOCi+G9C6ueyXYYOeByVwBWLEuPVvTyHLri/87ZZrhz
         IPpQ==
X-Gm-Message-State: AOAM532hxNzMnJaicYSsTvKhFFEVL4lnSkdqk2Tr7nkVxeV5tFyHgXec
        JyEMlONt85Ff5MO7gUh9Y0s=
X-Google-Smtp-Source: ABdhPJz2vcTEPI7iz/Q5LxAoh967w6yQDC2foEmr5rdunXfw7XptaR0hHZ9eCb4LcUVIwokrYiyAnw==
X-Received: by 2002:a63:77ca:: with SMTP id s193mr10359172pgc.376.1590796180955;
        Fri, 29 May 2020 16:49:40 -0700 (PDT)
Received: from [192.168.1.101] (122-58-178-240-adsl.sparkbb.co.nz. [122.58.178.240])
        by smtp.gmail.com with ESMTPSA id 67sm8235101pfg.9.2020.05.29.16.49.37
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 29 May 2020 16:49:40 -0700 (PDT)
Subject: Re: Kernel crash on qemu-m68k-system while building r-cran packages
To:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
References: <ff031d61-c6d7-dacc-f656-da42ad729e53@physik.fu-berlin.de>
Cc:     Debian m68k <debian-68k@lists.debian.org>,
        Laurent Vivier <laurent@vivier.eu>
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <54998b37-e607-b8da-fe11-8a719531fba5@gmail.com>
Date:   Sat, 30 May 2020 11:49:35 +1200
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <ff031d61-c6d7-dacc-f656-da42ad729e53@physik.fu-berlin.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Adrian,

that's from the Motorola FPSP package - the fault instruction is

fmovel #0,%fpsr

at the start of the unsupported data format trap handler. The trap 
handler clears the FPU status register here (and will clear the control 
register in the next instruction). That should not cause an address error.

Can you try to run that R binary on a real 060 or 040?

Cheers,

	Michael


Am 27.05.2020 um 21:14 schrieb John Paul Adrian Glaubitz:
> Hi!
>
> I just ran into the following kernel crash - which is reproducible - when trying
> to build the R package r-cran-phangorn on qemu-m68k-system on Linux 5.6.7.
>
> Adrian
>
> [   56.640000] *** ADDRESS ERROR ***   FORMAT=2
> [   56.640000] Current process id is 728
> [   56.640000] BAD KERNEL TRAP: 00000000
> [   56.640000] Modules linked in: sg evdev mac_hid ip_tables x_tables sha1_generic hmac ipv6 nf_defrag_ipv6 autofs4 ext4 crc16 mbcache jbd2 crc32c_generic sd_mod t10_pi crc_t10dif crct10dif_generic crct10dif_common sr_mod cdrom mac_esp macsonic esp_scsi
> [   56.640000] PC: [<00016a2c>] X_UNSUPP+0x2c/0x3c
> [   56.640000] SR: 2004  SP: 3eb5e68c  a2: c02e239a
> [   56.640000] d0: 00000040    d1: 00000002    d2: 8002adec    d3: 8002ad50
> [   56.640000] d4: 8002c768    d5: 0000000d    a0: ffffffc2    a1: ffffffc1
> [   56.640000] Process R (pid: 728, task=a3dfda5d)
> [   56.640000] Frame format=2 instr addr=00000000
> [   56.650000] Stack from 3a4d9f30:
> [   56.650000]         41000000 00000002 00000002 ffffffc2 ffffffc1 1fff0000 80000000 00000000
> [   56.650000]         3fbf0000 80000000 00000000 00000000 20000000 00000000 7fff0000 ffffffff
> [   56.650000]         ffffffff 00000000 00050008 00000000 8000067c c02c2000 efffee20 000002d8
> [   56.650000]         00002a28 3a4d9f98 00000002 00000014 fffffffe 8002c768 00000002 00000041
> [   56.650000]         00000002 c041fc58 c0743758 ffffffff 00000000 0008c075 00002b24 00000012
> [   56.650000]         000007d0 00000024 00000002 c05bef04 c05bef04 0000005e 00000077 c28aca70
> [   56.650000] Call Trace: [<00050008>] copy_overflow+0x10/0x28
> [   56.650000]  [<00002a28>] buserr+0x20/0x28
> [   56.650000]  [<0008c075>] bpf_check+0x57f/0x1cfa
> [   56.650000]  [<00002b24>] syscall+0x8/0xc
> [   56.650000]  [<0000c019>] dn_sched_init+0x75/0x88
> [   56.650000] Code: 1017 0200 00f0 0c00 0040 66ff 0000 05ac <f23c> 8800 0000 0000 f23c 9000 0000 0000 222e ff84 082e 0005 ff1c 6600 000a 0281
> [   56.650000] Disabling lock debugging due to kernel taint
> [   56.650000] *** ADDRESS ERROR ***   FORMAT=2
> [   56.650000] Current process id is 7
> [   56.650000] BAD KERNEL TRAP: 00000000
> [   56.650000] Modules linked in: sg evdev mac_hid ip_tables x_tables sha1_generic hmac ipv6 nf_defrag_ipv6 autofs4 ext4 crc16 mbcache jbd2 crc32c_generic sd_mod t10_pi crc_t10dif crct10dif_generic crct10dif_common sr_mod cdrom mac_esp macsonic esp_scsi
> [   56.650000] PC: [<00016a2c>] X_UNSUPP+0x2c/0x3c
> [   56.650000] SR: 2704  SP: 5ca00d79  a2: 391686b0
> [   56.650000] d0: 00000040    d1: 3dc64d60    d2: 0000000e    d3: 309a6680
> [   56.650000] d4: fffffffc    d5: 00000000    a0: 3dc64d60    a1: 391686b0
> [   56.650000] Process ksoftirqd/0 (pid: 7, task=018bf318)
> [   56.650000] Frame format=2 instr addr=00000000
> [   56.650000] Stack from 3dc79e44:
> [   56.650000]         41000000 00000000 3dc64d60 3dc64d60 391686b0 1fff0000 80000000 00000000
> [   56.650000]         3fbf0000 80000000 00000000 00000000 20000000 00000000 7fff0000 ffffffff
> [   56.650000]         ffffffff 00000000 00000000 00000000 00000004 00000004 00000000 00000000
> [   56.650000]         0003f400 00000009 003e6ce0 003e6d10 391686dc 003e6ce0 00414bf4 39168641
> [   56.650000]         0004732e 391686e8 003e6d10 003e6ce0 000472e2 000489a2 00042114 3dc64d8c
> [   56.650000]         391686b0 391686dc 003e6ce0 00048b82 003e6ce0 391686dc 003e6ce0 3dc64d8c
> [   56.650000] Call Trace: [<0003f400>] arch_local_irq_enable+0x8/0x26
> [   56.650000]  [<0004732e>] set_next_entity+0x4c/0xbe
> [   56.650000]  [<000472e2>] set_next_entity+0x0/0xbe
> [   56.650000]  [<000489a2>] put_prev_entity+0x0/0x68
> [   56.650000]  [<00042114>] smpboot_thread_fn+0x0/0x100
> [   56.650000]  [<00048b82>] pick_next_task_fair+0x14e/0x186
> [   56.650000]  [<002ef606>] __schedule+0x25e/0x39c
> [   56.650000]  [<0003f4ca>] kthread_parkme+0x0/0x10
> [   56.650000]  [<00042114>] smpboot_thread_fn+0x0/0x100
> [   56.650000]  [<0003f5cc>] __init_completion+0x0/0x20
> [   56.650000]  [<002ef3a8>] __schedule+0x0/0x39c
> [   56.650000]  [<0003f450>] kthread_should_stop+0x0/0x12
> [   56.650000]  [<0003f5cc>] __init_completion+0x0/0x20
> [   56.650000]  [<002ef7ae>] schedule+0x6a/0xb2
> [   56.650000]  [<002ef744>] schedule+0x0/0xb2
> [   56.650000]  [<0003f476>] kthread_should_park+0x0/0xc
> [   56.650000]  [<000421b8>] smpboot_thread_fn+0xa4/0x100
> [   56.650000]  [<0002df86>] do_exit+0x0/0x720
> [   56.650000]  [<0004bd4a>] complete+0x0/0x34
> [   56.650000]  [<00040190>] kthread+0xb8/0xc2
> [   56.650000]  [<000400d8>] kthread+0x0/0xc2
> [   56.650000]  [<00002a74>] ret_from_kernel_thread+0xc/0x14
> [   56.650000] Code: 1017 0200 00f0 0c00 0040 66ff 0000 05ac <f23c> 8800 0000 0000 f23c 9000 0000 0000 222e ff84 082e 0005 ff1c 6600 000a 0281
> [   56.670000] *** ADDRESS ERROR ***   FORMAT=2
> [   56.670000] Current process id is 174
> [   56.670000] BAD KERNEL TRAP: 00000000
> [   56.670000] Modules linked in: sg evdev mac_hid ip_tables x_tables sha1_generic hmac ipv6 nf_defrag_ipv6 autofs4 ext4 crc16 mbcache jbd2 crc32c_generic sd_mod t10_pi crc_t10dif crct10dif_generic crct10dif_common sr_mod cdrom mac_esp macsonic esp_scsi
> [   56.670000] PC: [<00016a2c>] X_UNSUPP+0x2c/0x3c
> [   56.670000] SR: 2704  SP: 82add07d  a2: 391686b0
> [   56.670000] d0: efd57040    d1: 3c534000    d2: 0000000e    d3: 31cb9380
> [   56.670000] d4: fffffffc    d5: 00000000    a0: 3c534000    a1: 391686b0
> [   56.670000] Process systemd-journal (pid: 174, task=9a58f959)
> [   56.670000] Frame format=2 instr addr=00000000
> [   56.670000] Stack from 391c9ce4:
> [   56.670000]         41000000 efd57054 3c534000 3c534000 391686b0 1fff0000 80000000 00000000
> [   56.670000]         3fbf0000 80000000 00000000 00000000 20000000 00000000 7fff0000 ffffffff
> [   56.670000]         ffffffff 00000000 04000000 00000000 00000004 00000006 00000000 00000000
> [   56.670000]         00000000 00000009 003e6ce0 003e6d10 391686dc 003e6ce0 00414bf4 39168641
> [   56.670000]         0004732e 391686e8 003e6d10 003e6ce0 000472e2 000489a2 000657d0 3c53402c
> [   56.670000]         391686b0 391686dc 003e6ce0 00048b82 003e6ce0 391686dc 003e6ce0 3c53402c
> [   56.670000] Call Trace: [<0004732e>] set_next_entity+0x4c/0xbe
> [   56.670000]  [<000472e2>] set_next_entity+0x0/0xbe
> [   56.670000]  [<000489a2>] put_prev_entity+0x0/0x68
> [   56.670000]  [<000657d0>] futex_wait_queue_me+0x0/0xa6
> [   56.670000]  [<00048b82>] pick_next_task_fair+0x14e/0x186
> [   56.670000]  [<002ef606>] __schedule+0x25e/0x39c
> [   56.670000]  [<0006535a>] futex_wait_setup+0x0/0x9c
> [   56.670000]  [<000657d0>] futex_wait_queue_me+0x0/0xa6
> [   56.670000]  [<00064bb8>] __unqueue_futex+0x0/0x3c
> [   56.670000]  [<002ef3a8>] __schedule+0x0/0x39c
> [   56.670000]  [<002e09f0>] list_add_tail+0x1c/0x36
> [   56.670000]  [<002ef7ae>] schedule+0x6a/0xb2
> [   56.670000]  [<00065848>] futex_wait_queue_me+0x78/0xa6
> [   56.670000]  [<00048b82>] pick_next_task_fair+0x14e/0x186
> [   56.670000]  [<002ef606>] __schedule+0x25e/0x39c
> [   56.670000]  [<0006535a>] futex_wait_setup+0x0/0x9c
> [   56.670000]  [<000657d0>] futex_wait_queue_me+0x0/0xa6
> [   56.670000]  [<00064bb8>] __unqueue_futex+0x0/0x3c
> [   56.670000]  [<002ef3a8>] __schedule+0x0/0x39c
> [   56.670000]  [<002e09f0>] list_add_tail+0x1c/0x36
> [   56.670000]  [<002ef7ae>] schedule+0x6a/0xb2
> [   56.670000]  [<00065848>] futex_wait_queue_me+0x78/0xa6
> [   56.670000]  [<00065904>] futex_wait+0x8e/0x150
> [   56.670000]  [<0004fe94>] arch_local_irq_enable+0x0/0x26
> [   56.670000]  [<00066b00>] do_futex+0x94/0x6ee
> [   56.670000]  [<0000c041>] dn_serial_console_wait_key+0x15/0x24
> [   56.670000]  [<0005bef6>] timekeeping_get_ns+0x4e/0x58
> [   56.670000]  [<0000c041>] dn_serial_console_wait_key+0x15/0x24
> [   56.670000]  [<0006737c>] sys_futex_time32+0x106/0x11e
> [   56.670000]  [<00002b24>] syscall+0x8/0xc
> [   56.670000]  [<0010c06b>] __blkdev_get+0x3f/0x3ce
> [   56.670000] Code: 1017 0200 00f0 0c00 0040 66ff 0000 05ac <f23c> 8800 0000 0000 f23c 9000 0000 0000 222e ff84 082e 0005 ff1c 6600 000a 0281
> [   56.670000] kernel BUG at kernel/sched/core.c:4097!
> [   56.670000] *** TRAP #7 ***   FORMAT=0
> [   56.670000] Current process id is 174
> [   56.670000] BAD KERNEL TRAP: 00000000
> [   56.670000] Modules linked in: sg evdev mac_hid ip_tables x_tables sha1_generic hmac ipv6 nf_defrag_ipv6 autofs4 ext4 crc16 mbcache jbd2 crc32c_generic sd_mod t10_pi crc_t10dif crct10dif_generic crct10dif_common sr_mod cdrom mac_esp macsonic esp_scsi
> [   56.670000] PC: [<0004518c>] rt_mutex_setprio+0x0/0x1ae
> [   56.670000] SR: 2000  SP: 249d2574  a2: 3c534000
> [   56.680000] d0: 00000027    d1: 00002000    d2: 391c9c4c    d3: 391c9c4c
> [   56.680000] d4: 0002d374    d5: 00000000    a0: 003e7b54    a1: 5000c022
> [   56.680000] Process systemd-journal (pid: 174, task=9a58f959)
> [   56.680000] Frame format=0
> [   56.680000] Stack from 391c9c0c:
> [   56.680000]         00378004 0037e061 00001001 00000000 391c9c54 0002e658 00000000 000000c0
> [   56.680000]         fffffffc 00000000 00000000 391c9ea8 391c9cac 000525b6 3c53434c 3c4cd21c
> [   56.680000]         391c9c4c 391c9c4c 391c9da8 00005486 0000000b 00000007 00000001 00378dc5
> [   56.680000]         0037906c 00379166 00000000 391c9cac 00005ee6 00379166 391c9cac 00000000
> [   56.680000]         0037914a 000000ae 0000000e 31cb9380 3c534000 003e6cd0 00002a50 391c9cac
> [   56.680000]         3c534000 0000000e 31cb9380 fffffffc 00000000 3c534000 391686b0 391686b0
> [   56.680000] Call Trace: [<00001001>] kernel_pg_dir+0x1/0x1000
> [   56.680000]  [<0002e658>] do_exit+0x6d2/0x720
> [   56.680000]  [<000525b6>] printk+0x0/0x18
> [   56.680000]  [<00005486>] die_if_kernel+0x52/0x56
> [   56.680000]  [<00005ee6>] bad_super_trap+0x130/0x14e
> [   56.680000]  [<00002a50>] trap+0x20/0x28
> [   56.680000]  [<0004732e>] set_next_entity+0x4c/0xbe
> [   56.680000]  [<000472e2>] set_next_entity+0x0/0xbe
> [   56.680000]  [<000489a2>] put_prev_entity+0x0/0x68
> [   56.680000]  [<000657d0>] futex_wait_queue_me+0x0/0xa6
> [   56.680000]  [<00048b82>] pick_next_task_fair+0x14e/0x186
> [   56.680000]  [<002ef606>] __schedule+0x25e/0x39c
> [   56.680000]  [<0006535a>] futex_wait_setup+0x0/0x9c
> [   56.680000]  [<000657d0>] futex_wait_queue_me+0x0/0xa6
> [   56.680000]  [<00064bb8>] __unqueue_futex+0x0/0x3c
> [   56.680000]  [<002ef3a8>] __schedule+0x0/0x39c
> [   56.680000]  [<002e09f0>] list_add_tail+0x1c/0x36
> [   56.680000]  [<002ef7ae>] schedule+0x6a/0xb2
> [   56.680000]  [<00065848>] futex_wait_queue_me+0x78/0xa6
> [   56.680000]  [<00065904>] futex_wait+0x8e/0x150
> [   56.680000]  [<0004fe94>] arch_local_irq_enable+0x0/0x26
> [   56.680000]  [<00066b00>] do_futex+0x94/0x6ee
> [   56.680000]  [<0000c041>] dn_serial_console_wait_key+0x15/0x24
> [   56.680000]  [<0005bef6>] timekeeping_get_ns+0x4e/0x58
> [   56.680000]  [<0000c041>] dn_serial_console_wait_key+0x15/0x24
> [   56.680000]  [<0006737c>] sys_futex_time32+0x106/0x11e
> [   56.680000]  [<00002b24>] syscall+0x8/0xc
> [   56.680000]  [<0010c06b>] __blkdev_get+0x3f/0x3ce
> [   56.680000] Code: e061 4879 0037 8004 4eb9 0005 25b6 4e47 <4e56> fff8 48e7 3f1c 266e 0008 2a6e 000c 242b 0020 4a8d 670a 202d 0018 b082 6c02
> [   56.680000] Fixing recursive fault but reboot is needed!
> [   56.690000] *** ADDRESS ERROR ***   FORMAT=2
> [   56.690000] Current process id is 343
> [   56.690000] BAD KERNEL TRAP: 00000000
> [   56.690000] Modules linked in: sg evdev mac_hid ip_tables x_tables sha1_generic hmac ipv6 nf_defrag_ipv6 autofs4 ext4 crc16 mbcache jbd2 crc32c_generic sd_mod t10_pi crc_t10dif crct10dif_generic crct10dif_common sr_mod cdrom mac_esp macsonic esp_scsi
> [   56.690000] PC: [<00016a2c>] X_UNSUPP+0x2c/0x3c
>
