From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v4 9/9] net-next: New ax88796 platform driver for Amiga
 X-Surf 100 Zorro board (m68k)
Date: Thu, 7 Jun 2018 16:36:15 +0200
Message-ID: <CAMuHMdWsibY4h5zwBC4qs8ZLq_1-627qjpeDLGzVjaGjG_A4PA@mail.gmail.com>
References: <1524025616-3722-1-git-send-email-schmitzmic@gmail.com> <1524103526-12240-10-git-send-email-schmitzmic@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <1524103526-12240-10-git-send-email-schmitzmic@gmail.com>
Sender: netdev-owner@vger.kernel.org
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: netdev <netdev@vger.kernel.org>, Andrew Lunn <andrew@lunn.ch>, Finn Thain <fthain@telegraphics.com.au>, Florian Fainelli <f.fainelli@gmail.com>, Linux/m68k <linux-m68k@vger.kernel.org>, Michael Karcher <Michael.Karcher@fu-berlin.de>, Michael Karcher <kernel@mkarcher.dialup.fu-berlin.de>
List-Id: linux-m68k@vger.kernel.org

Hi Michael,

On Thu, Apr 19, 2018 at 4:05 AM, Michael Schmitz <schmitzmic@gmail.com> wro=
te:
> From: Michael Karcher <kernel@mkarcher.dialup.fu-berlin.de>
>
> Add platform device driver to populate the ax88796 platform data from
> information provided by the XSurf100 zorro device driver. The ax88796
> module will be loaded through this module's probe function.
>
> Signed-off-by: Michael Karcher <kernel@mkarcher.dialup.fu-berlin.de>
> Signed-off-by: Michael Schmitz <schmitzmic@gmail.com>

This is now commit 861928f4e60e826c ("net-next: New ax88796 platform
driver for Amiga X-Surf 100 Zorro board (m68k)").

> --- /dev/null
> +++ b/drivers/net/ethernet/8390/xsurf100.c

> +#define __NS8390_init ax_NS8390_init

[...]

> +#include "lib8390.c"

drivers/net/ethernet/8390/lib8390.c:202: warning: =E2=80=98__ei_open=E2=80=
=99 defined
but not used
drivers/net/ethernet/8390/lib8390.c:231: warning: =E2=80=98__ei_close=E2=80=
=99 defined
but not used
drivers/net/ethernet/8390/lib8390.c:255: warning: =E2=80=98__ei_tx_timeout=
=E2=80=99
defined but not used
drivers/net/ethernet/8390/lib8390.c:302: warning: =E2=80=98__ei_start_xmit=
=E2=80=99
defined but not used
drivers/net/ethernet/8390/lib8390.c:510: warning: =E2=80=98__ei_poll=E2=80=
=99 defined
but not used
drivers/net/ethernet/8390/lib8390.c:851: warning: =E2=80=98__ei_get_stats=
=E2=80=99
defined but not used
drivers/net/ethernet/8390/lib8390.c:951: warning:
=E2=80=98__ei_set_multicast_list=E2=80=99 defined but not used
drivers/net/ethernet/8390/lib8390.c:989: warning:
=E2=80=98____alloc_ei_netdev=E2=80=99 defined but not used

So I was wondering: why is this file included, as XSURF100 selects AX88796,
while ax88796.c includes lib8390.c anyway?

Apparently lib8390.c is included for register definitions (provided by
8390.h, and can easily be fixed), and for the __NS8390_init()
implementation, called below.

> +static void xs100_block_output(struct net_device *dev, int count,
> +                              const unsigned char *buf, const int start_=
page)
> +{

[...]

> +       while ((ei_inb(nic_base + EN0_ISR) & ENISR_RDC) =3D=3D 0) {
> +               if (jiffies - dma_start > 2 * HZ / 100) {       /* 20ms *=
/
> +                       netdev_warn(dev, "timeout waiting for Tx RDC.\n")=
;
> +                       ei_local->reset_8390(dev);
> +                       ax_NS8390_init(dev, 1);
> +                       break;
> +               }
> +       }
> +
> +       ei_outb(ENISR_RDC, nic_base + EN0_ISR); /* Ack intr. */
> +       ei_local->dmaing &=3D ~0x01;
> +}

Can we get rid of the inclusion of lib8390.c, and the related warnings?
Perhaps ax88796.c can export its ax_NS8390_init(), iff the implementation
is identical? Or is there a better solution?

Thanks!

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
