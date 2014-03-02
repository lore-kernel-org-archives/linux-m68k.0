From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [RFC 4/4] m68k: toward platform agnostic framebuffer debug logging
Date: Sun, 2 Mar 2014 11:08:12 +0100
Message-ID: <CAMuHMdWKS=OH69kU7T8OHc13Yw9M-CKEPZc4mtzaAtgo7=18dA@mail.gmail.com>
References: <alpine.LNX.2.00.1402151534030.16321@nippy.intranet>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.2.00.1402151534030.16321@nippy.intranet>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: linux-m68k <linux-m68k@lists.linux-m68k.org>

On Sat, Feb 15, 2014 at 5:49 AM, Finn Thain <fthain@telegraphics.com.au> wrote:
> Code subject to #ifdef CONSOLE is made more generic, as was apparently
> intended by the original author of that code.
>
> Remove console_put_stats() routine. If it should be somehow useful, it
> should also be useful on platforms without framebuffer debug logging. The
> present implementation is only built #if defined CONFIG_MAC && defined
> CONSOLE even though puts() works everywhere...

Looks fine to me. Can I add your SoB and take it?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
