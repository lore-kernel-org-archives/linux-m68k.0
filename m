From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] M68K: Vector ints need a valid interrupt handler
Date: Sun, 16 Jun 2013 14:08:54 +0200
Message-ID: <CAMuHMdVa6KfTj6YfmnYcC-VDJqXhW0jxgk_UYpTEY7BMW8wWvw@mail.gmail.com>
References: <20130603105301.30F8E1D018@solo.franken.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <20130603105301.30F8E1D018@solo.franken.de>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-m68k <linux-m68k@lists.linux-m68k.org>

On Mon, Jun 3, 2013 at 12:53 PM, Thomas Bogendoerfer
<tsbogend@alpha.franken.de> wrote:
> To get vectored interrupts working we need to switch from the default
> handler handle_bad_irq() to something more sensible. Tested on a MVME177
> board.
>
> Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>

Thanks, queued for 3.11.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
