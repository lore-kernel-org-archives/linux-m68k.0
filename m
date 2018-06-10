From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 2/2] net-next: xsurf100: drop include of lib8390.c
Date: Sun, 10 Jun 2018 11:34:51 +0200
Message-ID: <CAMuHMdVuZw19vJtQjx+Td3ARwfvrKsR6tPEtqanN6cGQ5ZWdWw@mail.gmail.com>
References: <CAMuHMdVfjE=+YiqCrPfGObeYYkQwKGiQEWyprQr-n9z7J9-X-A@mail.gmail.com>
 <1528604559-972-3-git-send-email-schmitzmic@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <1528604559-972-3-git-send-email-schmitzmic@gmail.com>
Sender: netdev-owner@vger.kernel.org
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: netdev <netdev@vger.kernel.org>, Linux/m68k <linux-m68k@vger.kernel.org>, Andrew Lunn <andrew@lunn.ch>, Finn Thain <fthain@telegraphics.com.au>, Michael Karcher <kernel@mkarcher.dialup.fu-berlin.de>
List-Id: linux-m68k@vger.kernel.org

On Sun, Jun 10, 2018 at 6:22 AM Michael Schmitz <schmitzmic@gmail.com> wrote:
> Now that ax88796.c exports the ax_NS8390_reinit() symbol, we can
> include 8390.h instead of lib8390.c, avoiding duplication of that
> function and killing a few compile warnings in the bargain.
>
> Fixes: 861928f4e60e826c ("net-next: New ax88796 platform
> driver for Amiga X-Surf 100 Zorro board (m68k)")
>
> Signed-off-by: Michael Schmitz <schmitzmic@gmail.com>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
