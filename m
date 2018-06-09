From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [RFC PATCH 2/2] net-next: xsurf100: drop include of lib8390.c
Date: Sat, 9 Jun 2018 16:33:47 +0200
Message-ID: <CAMuHMdVfjE=+YiqCrPfGObeYYkQwKGiQEWyprQr-n9z7J9-X-A@mail.gmail.com>
References: <CAMuHMdWsibY4h5zwBC4qs8ZLq_1-627qjpeDLGzVjaGjG_A4PA@mail.gmail.com>
 <1528523869-3403-3-git-send-email-schmitzmic@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <1528523869-3403-3-git-send-email-schmitzmic@gmail.com>
Sender: netdev-owner@vger.kernel.org
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: netdev <netdev@vger.kernel.org>, Linux/m68k <linux-m68k@vger.kernel.org>, Andrew Lunn <andrew@lunn.ch>, Finn Thain <fthain@telegraphics.com.au>
List-Id: linux-m68k@vger.kernel.org

Hi Michael,

On Sat, Jun 9, 2018 at 7:58 AM Michael Schmitz <schmitzmic@gmail.com> wrote:
>
> Now that ax88796.c exports the ax_NS8390_init() symbol, we can
> include 8390.h instead of lib8390.c, avoiding duplication of that
> function and killing a few compile warnings in the bargain.
>
> Signed-off-by: Michael Schmitz <schmitzmic@gmail.com>

Thanks for your patch!


> --- a/drivers/net/ethernet/8390/xsurf100.c
> +++ b/drivers/net/ethernet/8390/xsurf100.c
> @@ -33,8 +33,6 @@
>  #define HW_CHIPID              0x70
>  #define HW_SCRATCH             0x78
>
> -#define __NS8390_init ax_NS8390_init
> -
>  /* force unsigned long back to 'void __iomem *' */
>  #define ax_convert_addr(_a) ((void __force __iomem *)(_a))
>
> @@ -80,12 +78,10 @@ static void reg_write16(void __iomem *base, u16 reg, u16 val)

This doesn't apply against net-next, which doesn't have reg_write16() (yet?).

Apart from that, your patch looks fine to me.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
