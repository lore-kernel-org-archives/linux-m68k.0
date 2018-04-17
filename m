From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2 3/8] net: ax88796: Do not free IRQ in ax_remove()
 (already freed in ax_close()).
Date: Tue, 17 Apr 2018 10:20:25 +0200
Message-ID: <CAMuHMdUZa31pbmyieoqyh-RnsRtFKPOVbrzC9DveV8h0sZh_qw@mail.gmail.com>
References: <1523916285-6057-1-git-send-email-schmitzmic@gmail.com> <1523930895-6973-4-git-send-email-schmitzmic@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <1523930895-6973-4-git-send-email-schmitzmic@gmail.com>
Sender: netdev-owner@vger.kernel.org
To: Michael Schmitz <schmitzmic@gmail.com>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: netdev <netdev@vger.kernel.org>, Andrew Lunn <andrew@lunn.ch>, Linux/m68k <linux-m68k@vger.kernel.org>, Michael.Karcher@fu-berlin.de, Michael Karcher <kernel@mkarcher.dialup.fu-berlin.de>
List-Id: linux-m68k@vger.kernel.org

Hi Michael, Adrian,

Thanks for your patch!

On Tue, Apr 17, 2018 at 4:08 AM, Michael Schmitz <schmitzmic@gmail.com> wrote:
> From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
>
> This complements the fix in 82533ad9a1c that removed the free_irq

Please quote the commit's subject, too, like

... fix in commit 82533ad9a1 ("net: ethernet: ax88796: don't call free_irq
without request_irq first")

BTW, I have a git alias for that:

$ git help fixes
`git fixes' is aliased to `show --format='Fixes: %h ("%s")' -s'
$ git fixes 82533ad9a1c
Fixes: 82533ad9a1c ("net: ethernet: ax88796: don't call free_irq
without request_irq first")

> call in the error path of probe, to also not call free_irq when
> remove is called to revert the effects of probe.
>
> Signed-off-by: Michael Karcher <kernel@mkarcher.dialup.fu-berlin.de>

The patch is authored by Adrian, but his SoB is missing?

Michael (Schmitz): as you took the patch, you should add your SoB, too.

For the actual patch contents:
Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
