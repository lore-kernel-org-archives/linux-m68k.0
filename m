From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: Debian kernel regression, was Re: Modernizing a Macintosh LC III
Date: Thu, 21 Nov 2013 15:16:26 +0100
Message-ID: <CAMuHMdXN2CZqNorxPmHqw3cpFqBtfX-GOCqLcBpJ5wKV5DByPA@mail.gmail.com>
References: <mcII9-2Ep-5@gated-at.bofh.it>
	<mdhPA-3Y1-15@gated-at.bofh.it>
	<52824A09.3060906@gmail.com>
	<CAMuHMdUJTx3pRzW8xewbhq+yow5CbXNKix2Za5kUqP5m7kv-Dg@mail.gmail.com>
	<Pine.BSM.4.64L.1311121708580.2989@herc.mirbsd.org>
	<5282DE78.2000109@iamscott.net>
	<alpine.LNX.2.00.1311170913380.6636@nippy.intranet>
	<5289723D.5090509@iamscott.net>
	<CAMuHMdUz=cJK7VTgvL3-4BWOqK-kP4ge5LD6v1snsRtkL3aNiw@mail.gmail.com>
	<1f16cd3b6538d850d32c3f8274fd8688@biophys.uni-duesseldorf.de>
	<alpine.LNX.2.00.1311192205430.3217@nippy.intranet>
	<89f415777a8134f27561668e8fb56d65@biophys.uni-duesseldorf.de>
	<alpine.LNX.2.00.1311212023220.17773@nippy.intranet>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pd0-f172.google.com ([209.85.192.172]:45583 "EHLO
	mail-pd0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753896Ab3KUOQ1 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 21 Nov 2013 09:16:27 -0500
Received: by mail-pd0-f172.google.com with SMTP id g10so6877374pdj.3
        for <linux-m68k@vger.kernel.org>; Thu, 21 Nov 2013 06:16:26 -0800 (PST)
In-Reply-To: <alpine.LNX.2.00.1311212023220.17773@nippy.intranet>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>, Scott Holder <scott@iamscott.net>, Debian m68k <debian-68k@lists.debian.org>, Linux/m68k <linux-m68k@vger.kernel.org>

I gave linux-image-3.12-trunk-m68k_3.12-1~exp1_m68k.deb a try on my
Amiga. Actually I tried my own first, using my current tree, and a config
derived from config-3.12-1~exp1, as I couldn't find the Debian kernel.
However, both gave the same result.

Surprise 1: There was no ABC...

head.S has this "interesting" piece of code, which plays foul of
multi-platform kernels:

#ifdef CONFIG_MAC

#include <asm/machw.h>

#ifdef CONFIG_FRAMEBUFFER_CONSOLE
#define CONSOLE
#define CONSOLE_PENGUIN
#endif

#ifdef CONFIG_EARLY_PRINTK
#define SERIAL_DEBUG
#else
#undef SERIAL_DEBUG
#endif

#else /* !CONFIG_MAC */

#define SERIAL_DEBUG

#endif /* !CONFIG_MAC */

As CONFIG_MAC=y, and CONFIG_EARLY_PRINTK=n, SERIAL_DEBUG
is not defined, and no one gets early serial debug output :-(
Enabling CONFIG_EARLY_PRINTK fixes this.
Is there a good reason for this construct?
  - Should it check for MACH_MAC_ONLY instead?
  - Can we just unconditionally enable SERIAL_DEBUG?

Surprise 2: Instead of a deadly non-Mac driver, I found a deadly Mac driver.
When passing "debug=ser", it crashes with:

Console: colour dummy device 80x25
Unable to handle kernel NULL pointer dereference at virtual address   (null)
Oops: 00000000
PC: [<0013ad28>] __pmz_startup+0x32/0x2a0
SR: 2010  SP: 0025ff10  a2: 00266300
d0: 00000080    d1: ffffffff    d2: 00000000    d3: 002cbd32
d4: 00000000    d5: 000119a8    a0: 00000000    a1: 002c5cda
Process swapper (pid: 0, task=00266300)
Frame format=7 eff addr=0025ff5c ssw=04a5 faddr=00000000
wb 1 stat/addr/data: 0005 00000000 0013ad0c
wb 2 stat/addr/data: 00a5 00000000 00000009
wb 3 stat/addr/data: 0025 00000000 00000009
push data: 0013ad0c 002a9f7a 00000000 00000011
Stack from 0025ff78:
        002a9ecc 002c5d3e 002a9ecc 00000000 002cbd32 0000000a 00283454 0029170e
        0000006e 0000006e 00000008 00009600 0025fff8 000499f4 00283454 00000000
        00000002 002d3b10 000fc4a8 00048b96 002c5cd4 00283454 002c5142 000fc39c
        002b2728 002d4000 000000fa 00001538 0743ed40 07401000 07401000 002cbd32
        00000000 002b07f8
Call Trace: [<002c5d3e>] pmz_console_setup+0x64/0xe4
 [<00009600>] atari_keyboard_interrupt+0x164/0x2dc
 [<000499f4>] register_console+0x104/0x2a6
 [<000fc4a8>] strlen+0x0/0x14
 [<00048b96>] printk+0x0/0x26
 [<002c5cd4>] pmz_console_init+0x10/0x16
 [<002c5142>] console_init+0x14/0x20
 [<000fc39c>] strcpy+0x0/0x16
 [<002b2728>] start_kernel+0x29a/0x3fc
 [<00001538>] kernel_pg_dir+0x538/0x1000
 [<002b07f8>] _sinittext+0x7f8/0x10dc

Code: 00c3 6604 103c 0040 206b 00c6 10bc 0009 <206b> 00c6 1080 206b
00c6 1010 223c 0000 a7c6 2039 0026 60bc 4c01 0401 2001 e988
Disabling lock debugging due to kernel taint
Kernel panic - not syncing: Attempted to kill the idle task!

drivers/tty/serial/pmac_zilog.c needs some MACH_IS_MAC() tests.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
