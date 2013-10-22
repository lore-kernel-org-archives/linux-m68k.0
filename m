From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: Kernel sections loosing attributes
Date: Tue, 22 Oct 2013 10:31:23 +0200
Message-ID: <CAMuHMdWnh-H85a6YLtnHkuG-EBLiDTObygyiHJztdx8K+wRiyA@mail.gmail.com>
References: <CAMuHMdXsYFw6NR1BRfAEW8GYoQqUFsH5N-oSB7TxHYn8jRGCZg@mail.gmail.com>
	<87vc0qcmhs.fsf@igel.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <87vc0qcmhs.fsf@igel.home>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: linux-m68k <linux-m68k@lists.linux-m68k.org>

On Tue, Oct 22, 2013 at 12:01 AM, Andreas Schwab <schwab@linux-m68k.org> wrote:
>> As I also got complaints about overlapping sections from strip, I switched
>> from the good old gcc 4.1.2 20061115 (prerelease) (Ubuntu 4.1.1-21)
>> and binutils 2.18.0.20080103 to gcc 4.6.3 and binutils 2.22, but apart
>> from fixing the overlapping sections, it still didn't work.
>
> Have you tried the latest binutils?

When using binutils 2.23.2 to build the kernel, there's no difference in the
objdump -h output; the __modver section still has only the ALLOC attribute.
The readelf -Sl output is slightly different as the symtab and strtab sections
have changed.
Haven't tried to boot the resulting kernel yet, though.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
