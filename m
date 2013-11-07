From: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>
Subject: Re: Kernel sections loosing attributes
Date: Thu, 7 Nov 2013 21:20:05 +1300
Message-ID: <a20610c002caef02061373fe70e59b01@biophys.uni-duesseldorf.de>
References: <CAMuHMdXsYFw6NR1BRfAEW8GYoQqUFsH5N-oSB7TxHYn8jRGCZg@mail.gmail.com> <CAMuHMdXrkSnswAr+0corHPO3fv9mtmwBxxsy7t0p=MK40hbC7w@mail.gmail.com>
Mime-Version: 1.0 (Apple Message framework v624)
Content-Type: text/plain; charset=US-ASCII; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdXrkSnswAr+0corHPO3fv9mtmwBxxsy7t0p=MK40hbC7w@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k <linux-m68k@lists.linux-m68k.org>

Hi Geert,

loosely related - when did vmlinux.lds last change? I have seen 
messages to the effect that .init_end is not in a sectiion in my last 
attempts to build 3.10 kernels (both for Atari and Amiga).

I had been using a patched version of vmlinux.lds to add extra explicit 
alignment at the end to pad the last section out to a page boundary 
(binutils 2.16 is even more horribly broken than 2.18 potentially is), 
but changes to vmlinux.lds appear to have defeated that.

Now that you have got tglx' attention in regards to the interrupt 
polling, I would certainly be willing to test his patch. 3.10 won't 
boot - how far back do I have to go?

Cheers,

	Michael


> On Mon, Oct 21, 2013 at 9:55 PM, Geert Uytterhoeven
> <geert@linux-m68k.org> wrote:
>> As I also got complaints about overlapping sections from strip, I 
>> switched
>> from the good old gcc 4.1.2 20061115 (prerelease) (Ubuntu 4.1.1-21)
>> and binutils 2.18.0.20080103 to gcc 4.6.3 and binutils 2.22, but apart
>> from fixing the overlapping sections, it still didn't work.
>
> Binutils 2.18 is indeed buggy here. LMA of the data section is the same
> as LMA of the __modver section, despite the correct __modver size due
> to the ". = ALIGN((align))" at the end of the section (see
> include/asm-generic/vmlinux.lds.h):
>
> Idx Name          Size      VMA       LMA       File off  Algn
>   7 __modver      000003f8  0034dc08  0034dc08  0034dc08  2**0
>                   ALLOC
>   8 .data         00020ae0  0034e000  0034dc08  0034dc08  2**4
>                   CONTENTS, ALLOC, LOAD, DATA
>
> So that's where the overlap warning comes from.
> And the resulting kernel crashes on ARAnyM after
>
> | Blitter tried to read byte from register ff8a00 at 0075ea
>
> With binutils 2.22/2.23.2, .data is correctly aligned:
>
>   7 __modver      000003f8  0034dc08  0034dc08  0034dc08  2**0
>                   ALLOC
>   8 .data         00020ae0  0034e000  0034e000  0034e000  2**4
>                   CONTENTS, ALLOC, LOAD, DATA
>
> and it seems to work fine on ARAnyM.
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- 
> geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a 
> hacker. But
> when I'm talking to journalists I just say "programmer" or something 
> like that.
>                                 -- Linus Torvalds
> --
> To unsubscribe from this list: send the line "unsubscribe linux-m68k" 
> in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
