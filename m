From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [RFC PATCH 1/2] net-next: ax88796: export ax_NS8390_init() hook
Date: Sat, 9 Jun 2018 16:31:34 +0200
Message-ID: <CAMuHMdUTLpUhbAZfRm=m1E8axjyzS7_MWsgWVLNDL=dZp=KJuQ@mail.gmail.com>
References: <CAMuHMdWsibY4h5zwBC4qs8ZLq_1-627qjpeDLGzVjaGjG_A4PA@mail.gmail.com>
 <1528523869-3403-2-git-send-email-schmitzmic@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <1528523869-3403-2-git-send-email-schmitzmic@gmail.com>
Sender: netdev-owner@vger.kernel.org
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: netdev <netdev@vger.kernel.org>, Linux/m68k <linux-m68k@vger.kernel.org>, Andrew Lunn <andrew@lunn.ch>, Finn Thain <fthain@telegraphics.com.au>
List-Id: linux-m68k@vger.kernel.org

Hi Michael,

On Sat, Jun 9, 2018 at 7:58 AM Michael Schmitz <schmitzmic@gmail.com> wrote:
> The block I/O code for the new X-Surf 100 ax88796 driver needs
> ax_NS8390_init() for error fixup in its block_output function.
>
> Export this function so we can lose the lib8380.c include in the
> X-Surf 100 driver.
>
> Signed-off-by: Michael Schmitz <schmitzmic@gmail.com>

Thanks for your patch!

> --- a/drivers/net/ethernet/8390/ax88796.c
> +++ b/drivers/net/ethernet/8390/ax88796.c
> @@ -62,6 +62,8 @@
>
>  #include "lib8390.c"
>
> +EXPORT_SYMBOL_GPL(ax_NS8390_init);

While that works for the modular case, it doesn't work for the builtin case,
as the function is static.

You can fix that by adding a non-static wrapper, and exporting that one instead.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
