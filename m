From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 14/14] zorro: fix device_register() error handling
Date: Thu, 30 Sep 2010 21:41:43 +0200
Message-ID: <AANLkTik9amOXStCu=MJdV7BsYWUbShFDUH1iM0DMT0M8@mail.gmail.com>
References: <1284900921-24814-1-git-send-email-segooon@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-iw0-f174.google.com ([209.85.214.174]:48610 "EHLO
	mail-iw0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755291Ab0I3Tlo convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 30 Sep 2010 15:41:44 -0400
In-Reply-To: <1284900921-24814-1-git-send-email-segooon@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Vasiliy Kulikov <segooon@gmail.com>
Cc: kernel-janitors@vger.kernel.org, Roman Zippel <zippel@linux-m68k.org>, linux-m68k@vger.kernel.org, linux-kernel@vger.kernel.org

On Sun, Sep 19, 2010 at 14:55, Vasiliy Kulikov <segooon@gmail.com> wrot=
e:
> If device_register() fails then call put_device().
> See comment to device_register.
>
> Signed-off-by: Vasiliy Kulikov <segooon@gmail.com>

Thanks, applied to m68k tree, queued for 2.6.37.

> ---
> =C2=A0I cannot compile this driver, so it is not tested at all.
>
> =C2=A0drivers/zorro/zorro.c | =C2=A0 =C2=A02 ++
> =C2=A01 files changed, 2 insertions(+), 0 deletions(-)
>
> diff --git a/drivers/zorro/zorro.c b/drivers/zorro/zorro.c
> index 6455f3a..e0c2807 100644
> --- a/drivers/zorro/zorro.c
> +++ b/drivers/zorro/zorro.c
> @@ -142,6 +142,7 @@ static int __init amiga_zorro_probe(struct platfo=
rm_device *pdev)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0error =3D device_register(&bus->dev);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0if (error) {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pr_err("Zorro:=
 Error registering zorro_bus\n");
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 put_device(&bus->d=
ev);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0kfree(bus);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return error;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0}
> @@ -175,6 +176,7 @@ static int __init amiga_zorro_probe(struct platfo=
rm_device *pdev)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (error) {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0dev_err(&bus->dev, "Error registering device %s\n",
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0z->name);
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 put_device(&z->dev);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0continue;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error =3D zorr=
o_create_sysfs_dev_files(z);
> --
> 1.7.0.4

Gr{oetje,eeting}s,

=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-=
m68k.org

In personal conversations with technical people, I call myself a hacker=
=2E But
when I'm talking to journalists I just say "programmer" or something li=
ke that.
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0=C2=A0 -- Linus Torvalds
