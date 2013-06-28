From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: iop_msg_pool
Date: Fri, 28 Jun 2013 10:59:02 +0200
Message-ID: <CAMuHMdX7WMDC9XXZrWYdcC0NouFjrS3TK+_U-DvmUAET5JB+DA@mail.gmail.com>
References: <CAMuHMdUCMUkoDbTFFXnVp-6E0LO5Y=4t64E13cWSpS1jVr2D_w@mail.gmail.com>
	<alpine.LNX.2.00.1306262026380.19790@nippy.intranet>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pb0-f43.google.com ([209.85.160.43]:46390 "EHLO
	mail-pb0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751324Ab3F1I7E (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 28 Jun 2013 04:59:04 -0400
Received: by mail-pb0-f43.google.com with SMTP id md12so2012268pbc.30
        for <linux-m68k@vger.kernel.org>; Fri, 28 Jun 2013 01:59:03 -0700 (PDT)
In-Reply-To: <alpine.LNX.2.00.1306262026380.19790@nippy.intranet>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>

Hi Finn,

On Wed, Jun 26, 2013 at 12:48 PM, Finn Thain <fthain@telegraphics.com.au> wrote:
>> As iop_msg_pool consumes 4928 bytes, it should be allocated dynamically,
>> especially for multi-platform kernels not running on Mac.
>
> I agree. Though I don't care much for multi-platform kernels: bloat in
> portable code is easily excused when most users of that code run it on
> recent hardware. We don't have that excuse.
>
> Maybe use kcalloc() to allocate iop_msg_pool, iop_send_queue and
> iop_listeners and remove all of the following initialisation. I don't see
> a convenient way to call kfree() though.

At this time, slab hasn't been initialized yet, so kzalloc() is out of
the question.
As iop_init() is called even before paging_init(), the bootmem allocator is also
not available yet.

I'm wondering if the call to iop_init() can be moved to mac_platform_init(),
where we can allocate memory?
The only callers into iop are adb-iop, which definitely runs later, and
mac_init_IRQ(), which calls iop_register_interrupts().
The latter may be an issue: can we receive iop interrupts immediately after
iop_register_interrupts()? If yes, this may call into an uninitialized
iop module.
Perhaps the call to iop_register_interrupts() can be done from iop_init()
instead?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
