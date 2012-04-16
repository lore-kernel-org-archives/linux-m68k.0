From: Mikael Pettersson <mikpe@it.uu.se>
Subject: [atari regression] handle_irq_event_percpu() incorrectly blames nfeth_interrupt() for enabling interrupts
Date: Mon, 16 Apr 2012 23:28:34 +0200
Message-ID: <20364.36610.13318.165888@pilspetsen.it.uu.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from fanny.its.uu.se ([130.238.4.241]:65264 "EHLO fanny.its.uu.se"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755228Ab2DPWAD (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
	Mon, 16 Apr 2012 18:00:03 -0400
Received: from fanny.its.uu.se (localhost [127.0.0.1])
	by fanny.its.uu.se (Postfix) with ESMTP id DA9B261FA
	for <linux-m68k@vger.kernel.org>; Mon, 16 Apr 2012 23:28:34 +0200 (MSZ)
Received: from pilspetsen.it.uu.se (pilspetsen.it.uu.se [130.238.18.39])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by fanny.its.uu.se (Postfix) with ESMTP id 834A96285
	for <linux-m68k@vger.kernel.org>; Mon, 16 Apr 2012 23:28:34 +0200 (MSZ)
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org

This is with an emulated atari running in aranym-0.9.11 on an x86_64 host,
using the natfeat (para-virtualized) nfeth and nfblock drivers.

Previously it ran a 2.6.38 kernel (with addon m68k and natfeat patches)
for almost a year without issue.  Today I upgraded it to the 3.4-rc3
kernel and got the following kernel warning:

WARNING: at kernel/irq/handle.c:146 handle_irq_event_percpu+0x134/0x142()
irq 3 handler nfeth_interrupt+0x0/0x194 enabled interrupts
Modules linked in:
Call Trace: [<000299b2>] warn_slowpath_common+0x48/0x6a
 [<000299c0>] warn_slowpath_common+0x56/0x6a
 [<00029a4c>] warn_slowpath_fmt+0x2a/0x32
 [<0005b34c>] handle_irq_event_percpu+0x134/0x142
 [<0005b34c>] handle_irq_event_percpu+0x134/0x142
 [<0000a584>] nfeth_interrupt+0x0/0x194
 [<001ba0a8>] schedule_preempt_disabled+0x0/0xc
 [<0005b37a>] handle_irq_event+0x20/0x2c
 [<0005add4>] generic_handle_irq+0x2c/0x3a
 [<00002ab6>] do_IRQ+0x20/0x32
 [<0000289e>] auto_irqhandler_fixup+0x4/0x6
 [<00003144>] cpu_idle+0x22/0x2e
 [<001b8a78>] printk+0x0/0x18
 [<0024d112>] start_kernel+0x37a/0x386
 [<0003021d>] __do_proc_dointvec+0xb1/0x366
 [<0003021d>] __do_proc_dointvec+0xb1/0x366
 [<0024c31e>] _sinittext+0x31e/0x9c0

This always occurs exactly once, on the very first network packet sent
to the emulated machine.  The same once-only warning also occurs with
the 3.3.2 and 3.2.15 kernels, but not with the 3.1.10 kernel.

I inspected nfeth_interrupt() but couldn't find anything there that
would enable interrupts as handle_irq_event_percpu() claims it did,
so I added some runtime checks which showed that !irqs_disabled() is
true already on entry to handle_irq_event_percpu(), well before
nfeth_interrupt() is called.

Given the timeline and the fact that nfeth didn't change between 3.1
and 3.2, I suspect a bug in last fall's genirq conversion.
