From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: Kernel sections loosing attributes
Date: Thu, 7 Nov 2013 09:31:40 +0100
Message-ID: <CAMuHMdWXDXYnx7J=EOpOQS0M2-roZof=iekYJ4F5xMxyYC7GHQ@mail.gmail.com>
References: <CAMuHMdXsYFw6NR1BRfAEW8GYoQqUFsH5N-oSB7TxHYn8jRGCZg@mail.gmail.com>
	<CAMuHMdXrkSnswAr+0corHPO3fv9mtmwBxxsy7t0p=MK40hbC7w@mail.gmail.com>
	<a20610c002caef02061373fe70e59b01@biophys.uni-duesseldorf.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <a20610c002caef02061373fe70e59b01@biophys.uni-duesseldorf.de>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>
Cc: linux-m68k <linux-m68k@lists.linux-m68k.org>

Hi Michael,

On Thu, Nov 7, 2013 at 9:20 AM, Michael Schmitz
<schmitz@biophys.uni-duesseldorf.de> wrote:
> loosely related - when did vmlinux.lds last change? I have seen messages to

17 months ago (the m68k part).

> the effect that .init_end is not in a sectiion in my last attempts to build
> 3.10 kernels (both for Atari and Amiga).

Strange. Can you send me kernel and .config by private email?

> I had been using a patched version of vmlinux.lds to add extra explicit
> alignment at the end to pad the last section out to a page boundary
> (binutils 2.16 is even more horribly broken than 2.18 potentially is), but
> changes to vmlinux.lds appear to have defeated that.

For cross-compiling, you can also try (ia32 version available as well):
https://www.kernel.org/pub/tools/crosstool/files/bin/x86_64/4.6.3/
These should work.

> Now that you have got tglx' attention in regards to the interrupt polling, I
> would certainly be willing to test his patch. 3.10 won't boot - how far back
> do I have to go?

Happily running 3.12 here.
atari_defconfig should be fine.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
