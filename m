From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: kexec (was: Re: Kernel sections loosing attributes)
Date: Sat, 30 Nov 2013 18:48:56 +0100
Message-ID: <CAMuHMdW3aZncimLvz40z7i3181opO1ecRUBVEePnXMfWwHwR2A@mail.gmail.com>
References: <CAMuHMdWhNYnYbKw+qC8d0j2i5Om0BKTuBdPruQMCGRSCaE4-zw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdWhNYnYbKw+qC8d0j2i5Om0BKTuBdPruQMCGRSCaE4-zw@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k <linux-m68k@lists.linux-m68k.org>

On Tue, Oct 22, 2013 at 11:39 AM, Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> On Mon, Oct 21, 2013 at 9:55 PM, Geert Uytterhoeven
> <geert@linux-m68k.org> wrote:
>> While trimming the kernel size to try kexec on real hardware with only
>> 12 MiB of RAM, I got several weird crashes and lock-ups indicating memory
>> corruption somewhere (illegal instructions, BUG()s for incorrect magics in
>> fresh lock objects, ...).
>
> The good news is that with a smaller kernel (ca. 2 MiB), kexec gets further on
> real hardware, up to "ABCDGH" in head.S, which is just before it calls
> mmu_engage.

After enabling MMU_PRINT in head.S, and adding debug code that
prints all registers, I found the problem: I forgot to clear [di]tt[01] after
turning off the MMU in relocate_kernel.S :-(
On Atari this doesn't matter due to the 1-1 mapping, but on Amiga it does.

Will send my updated patches. Still waiting/hoping for reports on real '020,
'030, and '060 (which also needs clearing of [di]tt[01] on machines with
non-identical RAM mapping, so better wait a bit).

BTW, there's one difference left in the register dump compared to plain
booting: with kexec, the caches are enabled, while plain booting has them
disabled. This is the case for both Atari and Amiga. This seems to work fine,
though.

Are there bootloaders on other platforms that boot Linux/m68k with caches
enabled?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
