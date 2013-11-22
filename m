From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: Debian kernel regression, was Re: Modernizing a Macintosh LC III
Date: Fri, 22 Nov 2013 13:50:36 +0100
Message-ID: <CAMuHMdUsUsAK9nBDCsuyx=ZxkXLQytL5nw4kdiG6hFhaX7Z2Sg@mail.gmail.com>
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
	<CAMuHMdXN2CZqNorxPmHqw3cpFqBtfX-GOCqLcBpJ5wKV5DByPA@mail.gmail.com>
	<alpine.LNX.2.00.1311221007350.26979@nippy.intranet>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pa0-f52.google.com ([209.85.220.52]:53001 "EHLO
	mail-pa0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755377Ab3KVMug (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 22 Nov 2013 07:50:36 -0500
Received: by mail-pa0-f52.google.com with SMTP id ld10so1268538pab.11
        for <linux-m68k@vger.kernel.org>; Fri, 22 Nov 2013 04:50:36 -0800 (PST)
In-Reply-To: <alpine.LNX.2.00.1311221007350.26979@nippy.intranet>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>, Scott Holder <scott@iamscott.net>, Debian m68k <debian-68k@lists.debian.org>, Linux/m68k <linux-m68k@vger.kernel.org>

On Fri, Nov 22, 2013 at 12:47 AM, Finn Thain <fthain@telegraphics.com.au> wrote:
> On Thu, 21 Nov 2013, Geert Uytterhoeven wrote:
>
>> Unable to handle kernel NULL pointer dereference at virtual address   (null)
>> Oops: 00000000
>> PC: [<0013ad28>] __pmz_startup+0x32/0x2a0
>
> [snip]
>
>> Call Trace: [<002c5d3e>] pmz_console_setup+0x64/0xe4
>>  [<00009600>] atari_keyboard_interrupt+0x164/0x2dc
>>  [<000499f4>] register_console+0x104/0x2a6
>>  [<000fc4a8>] strlen+0x0/0x14
>>  [<00048b96>] printk+0x0/0x26
>>  [<002c5cd4>] pmz_console_init+0x10/0x16
>
> [snip]
>
>>
>> drivers/tty/serial/pmac_zilog.c needs some MACH_IS_MAC() tests.
>>
>
> The platform devices pmz_ports[X].pdev aren't supposed to be used unless
> config_mac() first initializes them (when MACH_IS_MAC). Unfortunately the
> null pointer test in pmz_console_setup() never succeeds because
> pmz_probe() always sets those pointers, so make sure they remain null when
> the platform device isn't valid.
>
> Signed-off-by: Finn Thain <fthain@telegraphics.com.au>
>
> ---
>
> I haven't even compiled this. Geert, can you please build and test?

Worse, now it crashes without output.

Adding more debug code in printk() itself showed that pmz_console_setup()
no longer crashes, but that it dies in serial_console_write() later, hiding all
evidence.

Woops, serial_console_write() is the one from amiserial...

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
