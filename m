From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 1/2] m68k/atari - stram: alloc ST-RAM pool even if kernel
 not in ST-RAM
Date: Sun, 23 Mar 2014 21:02:42 +0100
Message-ID: <CAMuHMdVB0uZYb9QQyDGumRev_0wu=iAgYLTqQyBAeOSc0apPHQ@mail.gmail.com>
References: <1395213784-3249-1-git-send-email-schmitz@debian.org>
	<CAMuHMdXksY0Sfq-AN-1hi42=-yHYqgRnH0RM5z0k2oR-hPcOtQ@mail.gmail.com>
	<532AA57E.70506@biophys.uni-duesseldorf.de>
	<CAMuHMdXOwhE9WU1QK2mjHbwwA4iaS1vsROPNgLwR0ggz9ruW9Q@mail.gmail.com>
	<532CE84A.8090305@biophys.uni-duesseldorf.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pa0-f49.google.com ([209.85.220.49]:51027 "EHLO
	mail-pa0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750866AbaCWUCm (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 23 Mar 2014 16:02:42 -0400
Received: by mail-pa0-f49.google.com with SMTP id lj1so4521190pab.22
        for <linux-m68k@vger.kernel.org>; Sun, 23 Mar 2014 13:02:42 -0700 (PDT)
In-Reply-To: <532CE84A.8090305@biophys.uni-duesseldorf.de>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: schmitz <schmitz@biophys.uni-duesseldorf.de>
Cc: Michael Schmitz <schmitzmic@gmail.com>, Linux/m68k <linux-m68k@vger.kernel.org>, Debian m68k <debian-68k@lists.debian.org>, Michael Schmitz <schmitz@debian.org>

Hi Michael,

On Sat, Mar 22, 2014 at 2:32 AM, schmitz
<schmitz@biophys.uni-duesseldorf.de> wrote:
>>>> That's not true. E.g. I/O memory is never mapped by mem_init().
>>>>
>>>
>>> Why, then, does the ioremap() of ST-RAM fail? Because the physical
>>> address
>>> is lower than the lowest currently mapped physical address?
>>
>> I don't know. How does it fail?
>
> Example:
>
> Unable to handle kernel access at virtual address 5f435059
> Oops: 00000000
> Modules linked in:
> PC: [<00089552>] kmem_cache_alloc+0x12/0x9a
> SR: 2700  SP: 0029dec0  a2: 002a42d8
> d0: 000080d0    d1: 00000013    d2: 000080d0    d3: 0007fe3c
> d4: 00000001    d5: 000000d0    a0: 5f435055    a1: 002a75ee

This may be too early in the boot process to call ioremap().

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
