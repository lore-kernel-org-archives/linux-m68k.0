From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: v3.13 panic in init_bootmem_core
Date: Tue, 21 Jan 2014 15:08:20 +0100
Message-ID: <CAMuHMdW7Z-Xc7ATxoiUBrz996foX=CHxLsiMRiJp=RwJAdkHBA@mail.gmail.com>
References: <87sishiqmg.fsf@igel.home>
	<CAMuHMdUcGzFsnaxpLfvhEXyHc79c7e7Hd6RjmSFj1nk++zS00g@mail.gmail.com>
	<87fvohihx4.fsf@igel.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pd0-f172.google.com ([209.85.192.172]:55212 "EHLO
	mail-pd0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754244AbaAUOIV (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 21 Jan 2014 09:08:21 -0500
Received: by mail-pd0-f172.google.com with SMTP id p10so3948241pdj.17
        for <linux-m68k@vger.kernel.org>; Tue, 21 Jan 2014 06:08:20 -0800 (PST)
In-Reply-To: <87fvohihx4.fsf@igel.home>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>

On Tue, Jan 21, 2014 at 2:27 PM, Andreas Schwab <schwab@linux-m68k.org> wrote:
>>> When trying to boot 3.13 with the attached .config in aranym I get a
>>> panic during init_bootmem_core once I try to set FastRAM to anything
>>> bigger than 256.  With 3.12 and pretty much the same config I could go
>>> up to 932 while still having enough room in ST-RAM for the frame buffer.
>>> The static kernel size only grew by about 45k.
>>
>> Can you please post the panic message?
>
> There are actually two types of panics, one with CONFIG_KEXEC, the other
> without it:
>
> [    0.000000] Unable to handle kernel access at virtual address 00400000

This tries to access the first page beyond the 4 MiB of mapped memory.
But it's not yet mapped. Is there some check missing?

> [    0.000000] Oops: 00000000
> [    0.000000] Modules linked in:
> [    0.000000] PC: [<0016e6f6>] memset+0x5a/0x8c
> [    0.000000] SR: 2708  SP: 0038becc  a2: 003922e0
> [    0.000000] d0: 00002300    d1: ffffffff    d2: 00000117    d3: 00000000
> [    0.000000] d4: 00012800    d5: 00000400    a0: 00400000    a1: 00400004
> [    0.000000] Process swapper (pid: 0, task=003922e0)
> [    0.000000] Frame format=7 eff addr=00400000 ssw=0405 faddr=00400000
> [    0.000000] wb 1 stat/addr/data: 0000 00000000 00000000
> [    0.000000] wb 2 stat/addr/data: 0000 00000000 00000000
> [    0.000000] wb 3 stat/addr/data: 0085 00400000 ffffffff
> [    0.000000] push data: 00000000 00000000 00000000 00000000
> [    0.000000] Stack from 0038bf34:
>         00001000 00002300 003e38da 00400000 000000ff 00002300 00000001 003ae8e0
>         00001000 00012800 0038bfa0 003adac8 003e402a 003ddcf8 003f4ffe 00000400
>         00001000 00012800 00000001 00000000 00000008 002d7014 00000000 003f90b0
>         0016b060 003ddfc4 0038bfcc 00000000 00000000 00000000 003dd2c2 00000000
>         00000000 00000000 00000000 00000000 002d7014 00000000 0038bff8 003dad74
>         0038bff4 003391ff 002e0061 00000000 00000000 00000000 00000000 00000000
> [    0.000000] Call Trace: [<00001000>] kernel_pg_dir+0x0/0x1000
> [    0.000000]  [<00002300>] name_to_dev_t+0x60/0x39c
> [    0.000000]  [<003e38da>] init_bootmem_core+0xa0/0xe6

The second one:

> [    0.000000] bootmem alloc of 4096 bytes failed!
> [    0.000000] Kernel panic - not syncing: Out of memory

Definitely not enough free space in the first 4 MiB.

>> At first sight, I don't see a relevant difference with the .config I'm using.
>> Did the kernel size grow above 4 MiB? If not, can you please bisect?
>
> The size is 4089118 vs. 4135192, so still below 4M, though already
> pretty close.

Yes, the kernel is getting too large.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
