From: Michael Schmitz <schmitzmic@googlemail.com>
Subject: Re: m68k: [v5] Convert to genirq (WIP)
Date: Tue, 6 Sep 2011 08:18:01 +1200
Message-ID: <CAOmrzkLBgv8fFVb8BQcEbs4Pvux1FE9MMz3J6ityc-NaowbZng@mail.gmail.com>
References: <CAMuHMdUZe0Y55ZPee+umJdEsmY5X-EB-KoC-w-SGEtbPMAcf3g@mail.gmail.com>
	<alpine.OSX.2.00.1108271506320.190@ibook.local>
	<alpine.OSX.2.00.1108300148040.435@ibook.local>
	<CAMuHMdVmNAOSK+M9z-ySOR-oA4LwuS_N0SZ8XxzQ9_pYqM_vdQ@mail.gmail.com>
	<CAMuHMdXj-YDFPcsQFdaWzMU8w=2VQkpBpJGmjxsXT1Y+55W43g@mail.gmail.com>
	<4E63291D.5050801@gmail.com>
	<CAMuHMdXB5nBRVvUmqake-kV1mbWq+k8vOGHPOSL+2ix6PJW80w@mail.gmail.com>
	<CAOmrzkKCGhL2GfDTC_gqKtKfU2vKeqDh1CMZ+BdUCtLEufQhqw@mail.gmail.com>
	<4E647F80.8050903@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-vw0-f46.google.com ([209.85.212.46]:48173 "EHLO
	mail-vw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753780Ab1IEUSD (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 5 Sep 2011 16:18:03 -0400
Received: by vws1 with SMTP id 1so4213240vws.19
        for <linux-m68k@vger.kernel.org>; Mon, 05 Sep 2011 13:18:01 -0700 (PDT)
In-Reply-To: <4E647F80.8050903@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Michael Schmitz <schmitzmic@googlemail.com>, Linux/m68k <linux-m68k@vger.kernel.org>

Hi Geert,

> Works a treat - and gives about 1.5 to 2 fold higher throughput on scp than
> the 3.0 I used before.

Well, not quite:I have seen the following messages after a while of uptime

irq 12: nobody cared (try booting with the "irqpoll" option)
Call Trace: [<0004dc86>] __report_bad_irq+0xa2/0xae
 [<0004dc18>] __report_bad_irq+0x34/0xae
 [<0004dd64>] note_interrupt+0xaa/0x13c
 [<2102401c>] atari_ei_interrupt+0x1c/0x24 [atari_ethernec]
 [<0004cb32>] handle_irq_event_percpu+0x7e/0x110
 [<000a6cdc>] load_script+0xb4/0x1d8
 [<0009ae0c>] __blkdev_get+0x244/0x34a
 [<00001000>] kernel_pg_dir+0x0/0x1000
 [<000c6668>] ext3_link+0x48/0x124
 [<0004cbe4>] handle_irq_event+0x20/0x2c
 [<0004e258>] handle_simple_irq+0x3a/0x4c
 [<0004c5be>] generic_handle_irq+0x20/0x28
 [<00005e9c>] do_IRQ+0x20/0x30
 [<00237970>] schedule+0x0/0x2b6
 [<0000275e>] user_irqhandler_fixup+0x4/0x1a
 [<000028d0>] default_idle+0x0/0x14
 [<00002904>] cpu_idle+0x20/0x30
 [<000029f2>] kernel_thread+0x0/0x50
 [<00236928>] rest_init+0x68/0x6c
 [<000279f4>] printk+0x0/0x18
 [<0031407e>] start_kernel+0x29e/0x2a8
 [<00001000>] kernel_pg_dir+0x0/0x1000
 [<0031331e>] _sinittext+0x31e/0x9c0

handlers:
[<21024000>] atari_ei_interrupt
Disabling IRQ #12

Network dead after this; trying to ping out from the Falcon gives:

------------[ cut here ]------------
WARNING: at net/sched/sch_generic.c:255 dev_watchdog+0x194/0x1c6()
NETDEV WATCHDOG: eth0 (): transmit queue 0 timed out
Modules linked in: ipv6 atari_ethernec 8390 genrtc [last unloaded: atari_91C111]
Call Trace: [<000271fa>] warn_slowpath_common+0x4c/0x64
 [<0002723c>] warn_slowpath_fmt+0x2a/0x32
 [<001ccc98>] dev_watchdog+0x194/0x1c6
 [<0002ff10>] call_timer_fn+0x0/0x70
 [<001ccc98>] dev_watchdog+0x194/0x1c6
 [<001ccb04>] dev_watchdog+0x0/0x1c6
 [<0004cb32>] handle_irq_event_percpu+0x7e/0x110
 [<0002ff22>] call_timer_fn+0x12/0x70
 [<001ccb04>] dev_watchdog+0x0/0x1c6
 [<00030082>] run_timer_softirq+0xc0/0x16e
 [<001ccb04>] dev_watchdog+0x0/0x1c6
 [<00001000>] kernel_pg_dir+0x0/0x1000
 [<000c6668>] ext3_link+0x48/0x124
 [<0004c5be>] generic_handle_irq+0x20/0x28
 [<0002b24a>] __do_softirq+0x78/0xc6
 [<00237970>] schedule+0x0/0x2b6
 [<0002b2be>] do_softirq+0x26/0x2c
 [<00002664>] ret_from_exception+0x0/0xc
 [<000028d0>] default_idle+0x0/0x14
 [<00002904>] cpu_idle+0x20/0x30
 [<000029f2>] kernel_thread+0x0/0x50
 [<00236928>] rest_init+0x68/0x6c
 [<000279f4>] printk+0x0/0x18
 [<0031407e>] start_kernel+0x29e/0x2a8
 [<00001000>] kernel_pg_dir+0x0/0x1000
 [<0031331e>] _sinittext+0x31e/0x9c0

---[ end trace a81b161261829977 ]---

Unloading / reloading the module makes it work again:

ne.c:v1.10 9/23/94 Donald Becker (becker@scyld.com)
<6>atari_ethernec.c 11/10/06 Michael Schmitz (schmitz@debian.org)
 failed to detect IRQ line. Assuming irq 12
 00 00 e8 5d 58 cd
eth%d: RTL8019 found at 0x300, using IRQ 12.
eth0: no IPv6 routers present

Until the interrupt is disabled again:

irq 12: nobody cared (try booting with the "irqpoll" option)
Call Trace: [<0004dc86>] __report_bad_irq+0xa2/0xae
 [<0004dc18>] __report_bad_irq+0x34/0xae
 [<0004dd64>] note_interrupt+0xaa/0x13c
 [<2102401c>] atari_ei_interrupt+0x1c/0x24 [atari_ethernec]
 [<0004cb32>] handle_irq_event_percpu+0x7e/0x110
 [<000a6cdc>] load_script+0xb4/0x1d8
 [<0009ae0c>] __blkdev_get+0x244/0x34a
 [<00001000>] kernel_pg_dir+0x0/0x1000
 [<000c6668>] ext3_link+0x48/0x124
 [<0004cbe4>] handle_irq_event+0x20/0x2c
 [<0004e258>] handle_simple_irq+0x3a/0x4c
 [<0004c5be>] generic_handle_irq+0x20/0x28
 [<00005e9c>] do_IRQ+0x20/0x30
 [<00237970>] schedule+0x0/0x2b6
 [<0000275e>] user_irqhandler_fixup+0x4/0x1a
 [<000028d0>] default_idle+0x0/0x14
 [<00002904>] cpu_idle+0x20/0x30
 [<000029f2>] kernel_thread+0x0/0x50
 [<00236928>] rest_init+0x68/0x6c
 [<000279f4>] printk+0x0/0x18
 [<0031407e>] start_kernel+0x29e/0x2a8
 [<00001000>] kernel_pg_dir+0x0/0x1000
 [<0031331e>] _sinittext+0x31e/0x9c0

handlers:
[<21024000>] atari_ei_interrupt
Disabling IRQ #12

What will the irqpoll option do in this context?

Are these in the interrupt path, or another (disk) interrupt
preempting the timer D interrupt?

 [<000a6cdc>] load_script+0xb4/0x1d8
 [<0009ae0c>] __blkdev_get+0x244/0x34a
 [<00001000>] kernel_pg_dir+0x0/0x1000
 [<000c6668>] ext3_link+0x48/0x124

Cheers,

  Michael
