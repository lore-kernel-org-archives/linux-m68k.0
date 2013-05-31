From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: mac68k: fix unexpected interrupt with CONFIG_EARLY_PRINTK
Date: Fri, 31 May 2013 11:11:47 +0200
Message-ID: <CAMuHMdWKOMO7za+JxjyHu8r48UBNi_1-+LDqD90UAfUvKag6uA@mail.gmail.com>
References: <alpine.LNX.2.00.1305291227560.6962@nippy.intranet>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.2.00.1305291227560.6962@nippy.intranet>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: Linux/m68k <linux-m68k@lists.linux-m68k.org>

On Wed, May 29, 2013 at 4:37 AM, Finn Thain <fthain@telegraphics.com.au> wrote:
> The present code does not wait for the SCC to finish resetting itself
> before trying to initialise the device. The result is that the SCC
> interrupt sources become enabled (if they weren't already). This leads to
> an early boot crash (unexpected interrupt) given CONFIG_EARLY_PRINTK. Fix
> this by adding a delay. A successful reset disables the interrupt sources.
>
> Also, after the reset for channel A setup, the SCC then gets a second
> reset for channel B setup which leaves channel A uninitialised again. Fix
> this by performing the reset only once.

Thanks, applied and queued for 3.10.

> ---
>
> This patch can be applied to -stable trees >= 3.3.y.

... with a CC to stable.

> Signed-off-by: Finn Thain <fthain@telegraphics.com.au>

This line belongs above the "--".

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
