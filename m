Return-Path: <SRS0=U4C4=7M=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 763FCC433DF
	for <linux-m68k@archiver.kernel.org>; Sat, 30 May 2020 08:58:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4F26E2074A
	for <linux-m68k@archiver.kernel.org>; Sat, 30 May 2020 08:58:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727112AbgE3I6M (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sat, 30 May 2020 04:58:12 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:38499 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725554AbgE3I6K (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sat, 30 May 2020 04:58:10 -0400
Received: from [192.168.100.1] ([82.252.135.106]) by mrelayeu.kundenserver.de
 (mreue009 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MK3eI-1jQBst2XzK-00LUB6; Sat, 30 May 2020 10:58:01 +0200
To:     Michael Schmitz <schmitzmic@gmail.com>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
Cc:     Debian m68k <debian-68k@lists.debian.org>
References: <ff031d61-c6d7-dacc-f656-da42ad729e53@physik.fu-berlin.de>
 <54998b37-e607-b8da-fe11-8a719531fba5@gmail.com>
From:   Laurent Vivier <laurent@vivier.eu>
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
 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
Subject: Re: Kernel crash on qemu-m68k-system while building r-cran packages
Message-ID: <ae5e25b2-2892-df97-9e79-2e1ed85cad43@vivier.eu>
Date:   Sat, 30 May 2020 10:58:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <54998b37-e607-b8da-fe11-8a719531fba5@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:WT/xySX5hVQc+qESRE8761UfwyzD4w0jejjdX2TsoqqFX4JCFh3
 9FCStNyilHXSY3TFTDtU1jNhYO2216aTRslyUMSEdYFDTlQb50LVB22FYkN2jIONjemtJuF
 d7K/N+ABR2iYjSVkKnz480MIY48u8Y0vpJOCO/NsV/oD0MykVRm1kpj9OygKddIiurInMlP
 BlXLx+lwVgXeai3Ynp0lw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:aKU0+XeX9Kk=:DDDa1Kyt2Gl4D6qAIhHQQ6
 qUZp4YdOPboWUH/8m/MShQ7SpzWAZ9idoVeEMs+U4HYrO1SH0HoS9akZC/91Db+0h89phSgSU
 hQlzbtCSd9eeIEXnAYfV2QWj3NXLvjRZBqP3UdfUSJu9gVBqt+zXbp/TpqpxOeklfhA7TT7S7
 VZ+GdpelcAY5vANt3zWvm/WU5tzXir8F12V+GTfhmirSy0hKCvC/HKrwrKNiYa0jzELAKLvwu
 T+VGH9wecY07ScJnrs1N/R1smpFjP0KFbr3v/l7sXloJ2XBhxCQ9hldrluTURcENFqoexaTGS
 IdRAVNrFuROvcJAkqZxrc06No+QXZL8M+mjJpQFApoBD3s4qMQB4uJEYOZCksgtFQOScT3XQk
 5kXiV6sXcCN3chMOzqr+5PRi98FH1XVtEPdGcz9E+O/2VZRJR4CWNY4stEsZZacP721NuKO6T
 0dB0Jp27YSYcDoacj2sBFl+E+jEHx8Fyf4nthm/7G4Qiafzm5o0SkcSZ53MNB3RshctbgYKa9
 EkWZkgCZ7FspSfcAx75+EfUQLlZw48aNRtvH7jQAJuL9BQajWjmu3ynld0w1LKH5awLlEToEi
 8C4i0ED9ZAsPj3NyBm2edb346JQfBLFKEjQFInZoMuZ8kJv0ioZJuKzblbarAA9XjTuv0nVWB
 9+Ldc0O8QKcDH+PlYOBTP90uRBXZ2BwH4QmjsoBd3A2gRR/llkAOVwOzvKcsQk/lQX3Ot5iOB
 c6P2W3R9PsUXycHK8H/FWz53EpxZfZc89fP51TxRVQR9MRhieZwR5CQHHMK1tXvEur43oMD0T
 XannpK4ei1a+7okyufpoHG4UdcnKf4w49O7/+qPEIDCmPI/pB3flB6zk48Rf2LNoF0FOmcZ
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Le 30/05/2020 à 01:49, Michael Schmitz a écrit :
> Adrian,
> 
> that's from the Motorola FPSP package - the fault instruction is
> 
> fmovel #0,%fpsr
> 
> at the start of the unsupported data format trap handler. The trap
> handler clears the FPU status register here (and will clear the control
> register in the next instruction). That should not cause an address error.
> 
> Can you try to run that R binary on a real 060 or 040?

It could be interesting to enable the TCG trace in QEMU.

If you have access to the QEMU monitor use the following command before
running R:

logfile qemu.log
log in_asm,op,int

and share the file qemu.log

Thanks,
Laurent

> Cheers,
> 
>     Michael
> 
> 
> Am 27.05.2020 um 21:14 schrieb John Paul Adrian Glaubitz:
>> Hi!
>>
>> I just ran into the following kernel crash - which is reproducible -
>> when trying
>> to build the R package r-cran-phangorn on qemu-m68k-system on Linux
>> 5.6.7.
>>
>> Adrian
>>
>> [   56.640000] *** ADDRESS ERROR ***   FORMAT=2
>> [   56.640000] Current process id is 728
>> [   56.640000] BAD KERNEL TRAP: 00000000
>> [   56.640000] Modules linked in: sg evdev mac_hid ip_tables x_tables
>> sha1_generic hmac ipv6 nf_defrag_ipv6 autofs4 ext4 crc16 mbcache jbd2
>> crc32c_generic sd_mod t10_pi crc_t10dif crct10dif_generic
>> crct10dif_common sr_mod cdrom mac_esp macsonic esp_scsi
>> [   56.640000] PC: [<00016a2c>] X_UNSUPP+0x2c/0x3c
>> [   56.640000] SR: 2004  SP: 3eb5e68c  a2: c02e239a
>> [   56.640000] d0: 00000040    d1: 00000002    d2: 8002adec    d3:
>> 8002ad50
>> [   56.640000] d4: 8002c768    d5: 0000000d    a0: ffffffc2    a1:
>> ffffffc1
>> [   56.640000] Process R (pid: 728, task=a3dfda5d)
>> [   56.640000] Frame format=2 instr addr=00000000
>> [   56.650000] Stack from 3a4d9f30:
>> [   56.650000]         41000000 00000002 00000002 ffffffc2 ffffffc1
>> 1fff0000 80000000 00000000
>> [   56.650000]         3fbf0000 80000000 00000000 00000000 20000000
>> 00000000 7fff0000 ffffffff
>> [   56.650000]         ffffffff 00000000 00050008 00000000 8000067c
>> c02c2000 efffee20 000002d8
>> [   56.650000]         00002a28 3a4d9f98 00000002 00000014 fffffffe
>> 8002c768 00000002 00000041
>> [   56.650000]         00000002 c041fc58 c0743758 ffffffff 00000000
>> 0008c075 00002b24 00000012
>> [   56.650000]         000007d0 00000024 00000002 c05bef04 c05bef04
>> 0000005e 00000077 c28aca70
>> [   56.650000] Call Trace: [<00050008>] copy_overflow+0x10/0x28
>> [   56.650000]  [<00002a28>] buserr+0x20/0x28
>> [   56.650000]  [<0008c075>] bpf_check+0x57f/0x1cfa
>> [   56.650000]  [<00002b24>] syscall+0x8/0xc
>> [   56.650000]  [<0000c019>] dn_sched_init+0x75/0x88
>> [   56.650000] Code: 1017 0200 00f0 0c00 0040 66ff 0000 05ac <f23c>
>> 8800 0000 0000 f23c 9000 0000 0000 222e ff84 082e 0005 ff1c 6600 000a
>> 0281
>> [   56.650000] Disabling lock debugging due to kernel taint
>> [   56.650000] *** ADDRESS ERROR ***   FORMAT=2
>> [   56.650000] Current process id is 7
>> [   56.650000] BAD KERNEL TRAP: 00000000
>> [   56.650000] Modules linked in: sg evdev mac_hid ip_tables x_tables
>> sha1_generic hmac ipv6 nf_defrag_ipv6 autofs4 ext4 crc16 mbcache jbd2
>> crc32c_generic sd_mod t10_pi crc_t10dif crct10dif_generic
>> crct10dif_common sr_mod cdrom mac_esp macsonic esp_scsi
>> [   56.650000] PC: [<00016a2c>] X_UNSUPP+0x2c/0x3c
>> [   56.650000] SR: 2704  SP: 5ca00d79  a2: 391686b0
>> [   56.650000] d0: 00000040    d1: 3dc64d60    d2: 0000000e    d3:
>> 309a6680
>> [   56.650000] d4: fffffffc    d5: 00000000    a0: 3dc64d60    a1:
>> 391686b0
>> [   56.650000] Process ksoftirqd/0 (pid: 7, task=018bf318)
>> [   56.650000] Frame format=2 instr addr=00000000
>> [   56.650000] Stack from 3dc79e44:
>> [   56.650000]         41000000 00000000 3dc64d60 3dc64d60 391686b0
>> 1fff0000 80000000 00000000
>> [   56.650000]         3fbf0000 80000000 00000000 00000000 20000000
>> 00000000 7fff0000 ffffffff
>> [   56.650000]         ffffffff 00000000 00000000 00000000 00000004
>> 00000004 00000000 00000000
>> [   56.650000]         0003f400 00000009 003e6ce0 003e6d10 391686dc
>> 003e6ce0 00414bf4 39168641
>> [   56.650000]         0004732e 391686e8 003e6d10 003e6ce0 000472e2
>> 000489a2 00042114 3dc64d8c
>> [   56.650000]         391686b0 391686dc 003e6ce0 00048b82 003e6ce0
>> 391686dc 003e6ce0 3dc64d8c
>> [   56.650000] Call Trace: [<0003f400>] arch_local_irq_enable+0x8/0x26
>> [   56.650000]  [<0004732e>] set_next_entity+0x4c/0xbe
>> [   56.650000]  [<000472e2>] set_next_entity+0x0/0xbe
>> [   56.650000]  [<000489a2>] put_prev_entity+0x0/0x68
>> [   56.650000]  [<00042114>] smpboot_thread_fn+0x0/0x100
>> [   56.650000]  [<00048b82>] pick_next_task_fair+0x14e/0x186
>> [   56.650000]  [<002ef606>] __schedule+0x25e/0x39c
>> [   56.650000]  [<0003f4ca>] kthread_parkme+0x0/0x10
>> [   56.650000]  [<00042114>] smpboot_thread_fn+0x0/0x100
>> [   56.650000]  [<0003f5cc>] __init_completion+0x0/0x20
>> [   56.650000]  [<002ef3a8>] __schedule+0x0/0x39c
>> [   56.650000]  [<0003f450>] kthread_should_stop+0x0/0x12
>> [   56.650000]  [<0003f5cc>] __init_completion+0x0/0x20
>> [   56.650000]  [<002ef7ae>] schedule+0x6a/0xb2
>> [   56.650000]  [<002ef744>] schedule+0x0/0xb2
>> [   56.650000]  [<0003f476>] kthread_should_park+0x0/0xc
>> [   56.650000]  [<000421b8>] smpboot_thread_fn+0xa4/0x100
>> [   56.650000]  [<0002df86>] do_exit+0x0/0x720
>> [   56.650000]  [<0004bd4a>] complete+0x0/0x34
>> [   56.650000]  [<00040190>] kthread+0xb8/0xc2
>> [   56.650000]  [<000400d8>] kthread+0x0/0xc2
>> [   56.650000]  [<00002a74>] ret_from_kernel_thread+0xc/0x14
>> [   56.650000] Code: 1017 0200 00f0 0c00 0040 66ff 0000 05ac <f23c>
>> 8800 0000 0000 f23c 9000 0000 0000 222e ff84 082e 0005 ff1c 6600 000a
>> 0281
>> [   56.670000] *** ADDRESS ERROR ***   FORMAT=2
>> [   56.670000] Current process id is 174
>> [   56.670000] BAD KERNEL TRAP: 00000000
>> [   56.670000] Modules linked in: sg evdev mac_hid ip_tables x_tables
>> sha1_generic hmac ipv6 nf_defrag_ipv6 autofs4 ext4 crc16 mbcache jbd2
>> crc32c_generic sd_mod t10_pi crc_t10dif crct10dif_generic
>> crct10dif_common sr_mod cdrom mac_esp macsonic esp_scsi
>> [   56.670000] PC: [<00016a2c>] X_UNSUPP+0x2c/0x3c
>> [   56.670000] SR: 2704  SP: 82add07d  a2: 391686b0
>> [   56.670000] d0: efd57040    d1: 3c534000    d2: 0000000e    d3:
>> 31cb9380
>> [   56.670000] d4: fffffffc    d5: 00000000    a0: 3c534000    a1:
>> 391686b0
>> [   56.670000] Process systemd-journal (pid: 174, task=9a58f959)
>> [   56.670000] Frame format=2 instr addr=00000000
>> [   56.670000] Stack from 391c9ce4:
>> [   56.670000]         41000000 efd57054 3c534000 3c534000 391686b0
>> 1fff0000 80000000 00000000
>> [   56.670000]         3fbf0000 80000000 00000000 00000000 20000000
>> 00000000 7fff0000 ffffffff
>> [   56.670000]         ffffffff 00000000 04000000 00000000 00000004
>> 00000006 00000000 00000000
>> [   56.670000]         00000000 00000009 003e6ce0 003e6d10 391686dc
>> 003e6ce0 00414bf4 39168641
>> [   56.670000]         0004732e 391686e8 003e6d10 003e6ce0 000472e2
>> 000489a2 000657d0 3c53402c
>> [   56.670000]         391686b0 391686dc 003e6ce0 00048b82 003e6ce0
>> 391686dc 003e6ce0 3c53402c
>> [   56.670000] Call Trace: [<0004732e>] set_next_entity+0x4c/0xbe
>> [   56.670000]  [<000472e2>] set_next_entity+0x0/0xbe
>> [   56.670000]  [<000489a2>] put_prev_entity+0x0/0x68
>> [   56.670000]  [<000657d0>] futex_wait_queue_me+0x0/0xa6
>> [   56.670000]  [<00048b82>] pick_next_task_fair+0x14e/0x186
>> [   56.670000]  [<002ef606>] __schedule+0x25e/0x39c
>> [   56.670000]  [<0006535a>] futex_wait_setup+0x0/0x9c
>> [   56.670000]  [<000657d0>] futex_wait_queue_me+0x0/0xa6
>> [   56.670000]  [<00064bb8>] __unqueue_futex+0x0/0x3c
>> [   56.670000]  [<002ef3a8>] __schedule+0x0/0x39c
>> [   56.670000]  [<002e09f0>] list_add_tail+0x1c/0x36
>> [   56.670000]  [<002ef7ae>] schedule+0x6a/0xb2
>> [   56.670000]  [<00065848>] futex_wait_queue_me+0x78/0xa6
>> [   56.670000]  [<00048b82>] pick_next_task_fair+0x14e/0x186
>> [   56.670000]  [<002ef606>] __schedule+0x25e/0x39c
>> [   56.670000]  [<0006535a>] futex_wait_setup+0x0/0x9c
>> [   56.670000]  [<000657d0>] futex_wait_queue_me+0x0/0xa6
>> [   56.670000]  [<00064bb8>] __unqueue_futex+0x0/0x3c
>> [   56.670000]  [<002ef3a8>] __schedule+0x0/0x39c
>> [   56.670000]  [<002e09f0>] list_add_tail+0x1c/0x36
>> [   56.670000]  [<002ef7ae>] schedule+0x6a/0xb2
>> [   56.670000]  [<00065848>] futex_wait_queue_me+0x78/0xa6
>> [   56.670000]  [<00065904>] futex_wait+0x8e/0x150
>> [   56.670000]  [<0004fe94>] arch_local_irq_enable+0x0/0x26
>> [   56.670000]  [<00066b00>] do_futex+0x94/0x6ee
>> [   56.670000]  [<0000c041>] dn_serial_console_wait_key+0x15/0x24
>> [   56.670000]  [<0005bef6>] timekeeping_get_ns+0x4e/0x58
>> [   56.670000]  [<0000c041>] dn_serial_console_wait_key+0x15/0x24
>> [   56.670000]  [<0006737c>] sys_futex_time32+0x106/0x11e
>> [   56.670000]  [<00002b24>] syscall+0x8/0xc
>> [   56.670000]  [<0010c06b>] __blkdev_get+0x3f/0x3ce
>> [   56.670000] Code: 1017 0200 00f0 0c00 0040 66ff 0000 05ac <f23c>
>> 8800 0000 0000 f23c 9000 0000 0000 222e ff84 082e 0005 ff1c 6600 000a
>> 0281
>> [   56.670000] kernel BUG at kernel/sched/core.c:4097!
>> [   56.670000] *** TRAP #7 ***   FORMAT=0
>> [   56.670000] Current process id is 174
>> [   56.670000] BAD KERNEL TRAP: 00000000
>> [   56.670000] Modules linked in: sg evdev mac_hid ip_tables x_tables
>> sha1_generic hmac ipv6 nf_defrag_ipv6 autofs4 ext4 crc16 mbcache jbd2
>> crc32c_generic sd_mod t10_pi crc_t10dif crct10dif_generic
>> crct10dif_common sr_mod cdrom mac_esp macsonic esp_scsi
>> [   56.670000] PC: [<0004518c>] rt_mutex_setprio+0x0/0x1ae
>> [   56.670000] SR: 2000  SP: 249d2574  a2: 3c534000
>> [   56.680000] d0: 00000027    d1: 00002000    d2: 391c9c4c    d3:
>> 391c9c4c
>> [   56.680000] d4: 0002d374    d5: 00000000    a0: 003e7b54    a1:
>> 5000c022
>> [   56.680000] Process systemd-journal (pid: 174, task=9a58f959)
>> [   56.680000] Frame format=0
>> [   56.680000] Stack from 391c9c0c:
>> [   56.680000]         00378004 0037e061 00001001 00000000 391c9c54
>> 0002e658 00000000 000000c0
>> [   56.680000]         fffffffc 00000000 00000000 391c9ea8 391c9cac
>> 000525b6 3c53434c 3c4cd21c
>> [   56.680000]         391c9c4c 391c9c4c 391c9da8 00005486 0000000b
>> 00000007 00000001 00378dc5
>> [   56.680000]         0037906c 00379166 00000000 391c9cac 00005ee6
>> 00379166 391c9cac 00000000
>> [   56.680000]         0037914a 000000ae 0000000e 31cb9380 3c534000
>> 003e6cd0 00002a50 391c9cac
>> [   56.680000]         3c534000 0000000e 31cb9380 fffffffc 00000000
>> 3c534000 391686b0 391686b0
>> [   56.680000] Call Trace: [<00001001>] kernel_pg_dir+0x1/0x1000
>> [   56.680000]  [<0002e658>] do_exit+0x6d2/0x720
>> [   56.680000]  [<000525b6>] printk+0x0/0x18
>> [   56.680000]  [<00005486>] die_if_kernel+0x52/0x56
>> [   56.680000]  [<00005ee6>] bad_super_trap+0x130/0x14e
>> [   56.680000]  [<00002a50>] trap+0x20/0x28
>> [   56.680000]  [<0004732e>] set_next_entity+0x4c/0xbe
>> [   56.680000]  [<000472e2>] set_next_entity+0x0/0xbe
>> [   56.680000]  [<000489a2>] put_prev_entity+0x0/0x68
>> [   56.680000]  [<000657d0>] futex_wait_queue_me+0x0/0xa6
>> [   56.680000]  [<00048b82>] pick_next_task_fair+0x14e/0x186
>> [   56.680000]  [<002ef606>] __schedule+0x25e/0x39c
>> [   56.680000]  [<0006535a>] futex_wait_setup+0x0/0x9c
>> [   56.680000]  [<000657d0>] futex_wait_queue_me+0x0/0xa6
>> [   56.680000]  [<00064bb8>] __unqueue_futex+0x0/0x3c
>> [   56.680000]  [<002ef3a8>] __schedule+0x0/0x39c
>> [   56.680000]  [<002e09f0>] list_add_tail+0x1c/0x36
>> [   56.680000]  [<002ef7ae>] schedule+0x6a/0xb2
>> [   56.680000]  [<00065848>] futex_wait_queue_me+0x78/0xa6
>> [   56.680000]  [<00065904>] futex_wait+0x8e/0x150
>> [   56.680000]  [<0004fe94>] arch_local_irq_enable+0x0/0x26
>> [   56.680000]  [<00066b00>] do_futex+0x94/0x6ee
>> [   56.680000]  [<0000c041>] dn_serial_console_wait_key+0x15/0x24
>> [   56.680000]  [<0005bef6>] timekeeping_get_ns+0x4e/0x58
>> [   56.680000]  [<0000c041>] dn_serial_console_wait_key+0x15/0x24
>> [   56.680000]  [<0006737c>] sys_futex_time32+0x106/0x11e
>> [   56.680000]  [<00002b24>] syscall+0x8/0xc
>> [   56.680000]  [<0010c06b>] __blkdev_get+0x3f/0x3ce
>> [   56.680000] Code: e061 4879 0037 8004 4eb9 0005 25b6 4e47 <4e56>
>> fff8 48e7 3f1c 266e 0008 2a6e 000c 242b 0020 4a8d 670a 202d 0018 b082
>> 6c02
>> [   56.680000] Fixing recursive fault but reboot is needed!
>> [   56.690000] *** ADDRESS ERROR ***   FORMAT=2
>> [   56.690000] Current process id is 343
>> [   56.690000] BAD KERNEL TRAP: 00000000
>> [   56.690000] Modules linked in: sg evdev mac_hid ip_tables x_tables
>> sha1_generic hmac ipv6 nf_defrag_ipv6 autofs4 ext4 crc16 mbcache jbd2
>> crc32c_generic sd_mod t10_pi crc_t10dif crct10dif_generic
>> crct10dif_common sr_mod cdrom mac_esp macsonic esp_scsi
>> [   56.690000] PC: [<00016a2c>] X_UNSUPP+0x2c/0x3c
>>
> 

