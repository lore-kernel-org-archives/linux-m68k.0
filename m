From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 25/58] move macsonic's probe function to .devinit.text
Date: Sat, 28 Mar 2009 09:39:10 +0100
Message-ID: <10f740e80903280139i4a6d4a54y1a40eb376d3b89fa@mail.gmail.com>
References: <20090327232153.GA16348@pengutronix.de>
	 <1238196439-16535-25-git-send-email-u.kleine-koenig@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1238196439-16535-25-git-send-email-u.kleine-koenig@pengutronix.de>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Jeff Garzik <jgarzik@redhat.com>, "David S. Miller" <davem@davemloft.net>, Finn Thain <fthain@telegraphics.com.au>, linux-m68k@lists.linux-m68k.org

2009/3/28 Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>:
> A pointer to mac_sonic_probe is passed to the core via
> platform_driver_register and so the function must not disappear when =
the
> .init sections are discarded. =C2=A0Otherwise (if also having HOTPLUG=
=3Dy)
> unbinding and binding a device to the driver via sysfs will result in=
 an
> oops as does a device being registered late.
>
> An alternative to this patch is using platform_driver_probe instead o=
f
> platform_driver_register plus removing the pointer to the probe funct=
ion
> from the struct platform_driver.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> Cc: Jeff Garzik <jgarzik@redhat.com>
> Cc: David S. Miller <davem@davemloft.net>
> Cc: Finn Thain <fthain@telegraphics.com.au>
> Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> ---
> =C2=A0drivers/net/macsonic.c | =C2=A0 =C2=A02 +-
> =C2=A01 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/drivers/net/macsonic.c b/drivers/net/macsonic.c
> index 527166e..d4f913b 100644
> --- a/drivers/net/macsonic.c
> +++ b/drivers/net/macsonic.c
> @@ -555,7 +555,7 @@ static int __init mac_nubus_sonic_probe(struct ne=
t_device *dev)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0return macsonic_init(dev);
> =C2=A0}
>
> -static int __init mac_sonic_probe(struct platform_device *pdev)
> +static int __devinit mac_sonic_probe(struct platform_device *pdev)
> =C2=A0{
> =C2=A0 =C2=A0 =C2=A0 =C2=A0struct net_device *dev;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0struct sonic_local *lp;

mac_{onboard,nubus}_sonic_probe() (called by mac_sonic_probe()) have th=
e
same problem.

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-=
m68k.org

In personal conversations with technical people, I call myself a hacker=
=2E But
when I'm talking to journalists I just say "programmer" or something li=
ke that.
							    -- Linus Torvalds
--
To unsubscribe from this list: send the line "unsubscribe linux-m68k" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
