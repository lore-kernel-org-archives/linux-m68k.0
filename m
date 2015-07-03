From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] char/nvram: Use bitwise OR to obtain Atari video mode data
Date: Fri, 3 Jul 2015 08:52:03 +0200
Message-ID: <CAMuHMdUF5NWHcUgxyLisSSPts1PBvC2dFANeEA4DTs1zCCqjAQ@mail.gmail.com>
References: <alpine.LNX.2.00.1507031320240.953@nippy.intranet>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.2.00.1507031320240.953@nippy.intranet>
Sender: linux-kernel-owner@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linux/m68k <linux-m68k@vger.kernel.org>
List-Id: linux-m68k@vger.kernel.org

On Fri, Jul 3, 2015 at 5:35 AM, Finn Thain <fthain@telegraphics.com.au> wrote:
> Signed-off-by: Finn Thain <fthain@telegraphics.com.au>

Nice catch!

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

> Index: linux/drivers/char/nvram.c
> ===================================================================
> --- linux.orig/drivers/char/nvram.c     2015-07-02 13:50:40.000000000 +1000
> +++ linux/drivers/char/nvram.c  2015-07-02 14:00:05.000000000 +1000
> @@ -702,7 +702,7 @@ static void atari_proc_infos(unsigned ch
>                 seq_printf(seq, "%ds%s\n", nvram[10],
>                     nvram[10] < 8 ? ", no memory test" : "");
>
> -       vmode = (nvram[14] << 8) || nvram[15];
> +       vmode = (nvram[14] << 8) | nvram[15];
>         seq_printf(seq,
>             "Video mode       : %s colors, %d columns, %s %s monitor\n",
>             colors[vmode & 7],

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
