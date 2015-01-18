From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: The BigRAMPlus works - Re: kullervo with bigram
Date: Sun, 18 Jan 2015 16:03:06 +0100
Message-ID: <CAMuHMdX6yV8ptj0E=9HOH5kGEMiOD3gmbD=v8qYXQnmbUZ7O2Q@mail.gmail.com>
References: <54BACEB6.6060805@debian.org>
	<20150118115355.GA20168@guido.earth.sol>
	<CAMuHMdXTyYp=7SOL4qG1JoK6x6zO5mqkGt9wKGXceqbjejMwgA@mail.gmail.com>
	<54BBA8D3.8020703@physik.fu-berlin.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <54BBA8D3.8020703@physik.fu-berlin.de>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: Linux/m68k <linux-m68k@lists.linux-m68k.org>, Debian m68k <debian-68k@lists.debian.org>

Hi Adrian,

On Sun, Jan 18, 2015 at 1:36 PM, John Paul Adrian Glaubitz
<glaubitz@physik.fu-berlin.de> wrote:
> Important side note: We can no longer reproduce this particular crash.

Good to hear that!

> All we get now is a CPU soft-lockup which goes away when using a memfile
> to either exclude the BigRAMPlus ~256 MB from 0x40000000 _or_ the
> accelerator's on-board memory ~128 MB from 0x07000000.
>
> Thus, the memfile to run Linux in the accelerator's memory is:
>
> 2097152
> 0x07000000 134217728
>
> and the memfile for running the kernel in the BigRAMPlus:
>
> 2097152
> 0x40000000 268435456
>
> Both seem to work fine so far. Activating both regions will lead
> to a soft-lockup right after the message "Freeing unused kernel
> memory", using them mutually exclusively works.

So this indicates that there's probably a bug in the page table setup
code, manifesting itself on systems with lots of RAM, or a big gap in
between the memory blocks.

> Furthermore, we just wanted to use the BigRAMPlus as a swap device
> now following Ingo's description [1]. Unfortunately, CONFIG_MTD
> is not set in the current Debian m68k kernel and we therefore
> can't use it.
>
> Any chance we can activate that?

Build your own kernel?

But I think a real block device driver would perform better.
drivers/block/ps3vram.c would be a good example.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
