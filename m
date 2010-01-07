From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 1/2] pmac-zilog: add platform driver
Date: Thu, 7 Jan 2010 22:12:12 +0100
Message-ID: <10f740e81001071312p451de3c0r93d8d9d2782abde8@mail.gmail.com>
References: <alpine.OSX.2.00.0911171657290.371@silk.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-ew0-f219.google.com ([209.85.219.219]:59380 "EHLO
	mail-ew0-f219.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753578Ab0AGVMN convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 7 Jan 2010 16:12:13 -0500
Received: by ewy19 with SMTP id 19so11246431ewy.21
        for <linux-m68k@vger.kernel.org>; Thu, 07 Jan 2010 13:12:12 -0800 (PST)
In-Reply-To: <alpine.OSX.2.00.0911171657290.371@silk.local>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>, linuxppc-dev@ozlabs.org, linux-m68k@vger.kernel.org

On Tue, Nov 17, 2009 at 10:04, Finn Thain <fthain@telegraphics.com.au> =
wrote:
> Add platform driver to the pmac-zilog driver for mac 68k, putting the
> powermac-specific bits inside #ifdef CONFIG_PPC_PMAC.

> --- linux-2.6.31.orig/drivers/serial/pmac_zilog.c =C2=A0 =C2=A0 =C2=A0=
 2009-11-17 17:07:28.000000000 +1100
> +++ linux-2.6.31/drivers/serial/pmac_zilog.c =C2=A0 =C2=A02009-11-17 =
17:07:38.000000000 +1100

> +static int pmz_attach(struct platform_device *pdev)

__devinit (or __init, see platform_driver_probe() below)

BTW, the same is true for the PowerMac version.

> +{
> + =C2=A0 =C2=A0 =C2=A0 int i;
> +
> + =C2=A0 =C2=A0 =C2=A0 for (i =3D 0; i < pmz_ports_count; i++)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (pmz_ports[i].n=
ode =3D=3D pdev)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 return 0;
> + =C2=A0 =C2=A0 =C2=A0 return -ENODEV;
> +}
> +
> +static int pmz_detach(struct platform_device *pdev)

__devexit (or __exit, see platform_driver_probe() below)

Idem ditto for PowerMac.

> +{
> + =C2=A0 =C2=A0 =C2=A0 return 0;
> +}
> +
> +#endif /* !CONFIG_PPC_PMAC */

> +static struct platform_driver pmz_driver =3D {
> + =C2=A0 =C2=A0 =C2=A0 .probe =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D p=
mz_attach,
> + =C2=A0 =C2=A0 =C2=A0 .remove =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D __deve=
xit_p(pmz_detach),
> + =C2=A0 =C2=A0 =C2=A0 .driver =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .name =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =3D "scc",
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .owner =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0=3D THIS_MODULE,
> + =C2=A0 =C2=A0 =C2=A0 },
> +};
> +
> +#endif /* !CONFIG_PPC_PMAC */
> +
> =C2=A0static int __init init_pmz(void)
> =C2=A0{
> =C2=A0 =C2=A0 =C2=A0 =C2=A0int rc, i;
> @@ -1942,15 +2053,23 @@ static int __init init_pmz(void)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0/*
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 * Then we register the macio driver itsel=
f
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 */
> +#ifdef CONFIG_PPC_PMAC
> =C2=A0 =C2=A0 =C2=A0 =C2=A0return macio_register_driver(&pmz_driver);
> +#else
> + =C2=A0 =C2=A0 =C2=A0 return platform_driver_register(&pmz_driver);

Since this device is not hot-pluggable, you could use
platform_driver_probe() instead (and leave pmz_driver.probe() empty).

> --- linux-2.6.31.orig/drivers/serial/pmac_zilog.h =C2=A0 =C2=A0 =C2=A0=
 2009-11-17 17:07:28.000000000 +1100
> +++ linux-2.6.31/drivers/serial/pmac_zilog.h =C2=A0 =C2=A02009-11-17 =
17:07:38.000000000 +1100
> @@ -1,7 +1,15 @@
> =C2=A0#ifndef __PMAC_ZILOG_H__
> =C2=A0#define __PMAC_ZILOG_H__
>
> +#ifdef CONFIG_PPC_PMAC
> =C2=A0#define pmz_debug(fmt, arg...) dev_dbg(&uap->dev->ofdev.dev, fm=
t, ## arg)
> +#define pmz_error(fmt, arg...) dev_err(&uap->dev->ofdev.dev, fmt, ##=
 arg)
> +#define pmz_info(fmt, arg...) =C2=A0dev_info(&uap->dev->ofdev.dev, f=
mt, ## arg)
> +#else
> +#define pmz_debug(fmt, arg...) do { } while (0)
> +#define pmz_error(fmt, arg...) printk(KERN_ERR fmt, ## arg)
> +#define pmz_info(fmt, arg...) =C2=A0printk(KERN_INFO fmt, ## arg)

Any chance you can sneak the platform device in and use dev_*()?

Anyway, I'm gonna take it, and feed it upstream if BenH adds his ack. B=
en?

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
