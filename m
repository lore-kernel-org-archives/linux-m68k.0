Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CA6DC432BE
	for <linux-m68k@archiver.kernel.org>; Mon,  9 Aug 2021 13:26:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0FF9260295
	for <linux-m68k@archiver.kernel.org>; Mon,  9 Aug 2021 13:26:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234825AbhHIN01 convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 9 Aug 2021 09:26:27 -0400
Received: from mail-vs1-f49.google.com ([209.85.217.49]:40634 "EHLO
        mail-vs1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234597AbhHIN01 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 9 Aug 2021 09:26:27 -0400
Received: by mail-vs1-f49.google.com with SMTP id g1so627927vsq.7
        for <linux-m68k@lists.linux-m68k.org>; Mon, 09 Aug 2021 06:26:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=bb5vDHnenDIwQS7FU/7KReEJ0SSOJsXa1YQK1ADVnf0=;
        b=d1QmJ1kLYLIqxc9dAzJHoDFQgDxyz1z5wBI+cZBt7fvE07fkrQANDpZBbD+Jub+m87
         KgTlix8wPX5SkiJMJ13tpp6dSTti3CjbOCY15ycwP0Z8nu5IZq6pTdAoaxqXwoz3wZwP
         PXywwZJ2/ojloOJfwNM/wkIWx5qOVyFW4pfB4NQOCJETEzNZvVzXzffpFz59TAdo3Cuw
         5WA2ffxAsATTo0mhX8HHuUyvXD4Mb7C9CtTuBhuRrzkvJyLFWm0etBK0hWcQpRD/J20X
         un7LxyZrOcDwvkp905TMO1p+zVaf45Tt/qcyik6cWe0HBq4mRrAx7ec1tNeXwALWCkI+
         ly/g==
X-Gm-Message-State: AOAM533kP/sF6BBh+oLKLykn+skMD2vq4FgxD3ZLpno+KyUG5NdR28pO
        swJfrQL28cL82Guw9sXHR97LXBrnYPnt9R6dm+A=
X-Google-Smtp-Source: ABdhPJwgTx/pUeAft1dPT5ijyQHqxDE7CG3c2jLJAIXlExXxSK1gELGae1Q/Ka0nRxrKwR5r/2yDWGyQZjdlI/lbnLo=
X-Received: by 2002:a05:6102:d9:: with SMTP id u25mr7147062vsp.42.1628515566662;
 Mon, 09 Aug 2021 06:26:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210730191035.1455248-1-u.kleine-koenig@pengutronix.de> <20210730191035.1455248-5-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20210730191035.1455248-5-u.kleine-koenig@pengutronix.de>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 9 Aug 2021 15:25:54 +0200
Message-ID: <CAMuHMdU28k_eAaPoZ8Fzoxv-p=vT6jtuNmGkE79DsLc=-aeRhA@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] zorro: Drop useless (and hardly used) .driver
 member in struct zorro_dev
To:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Sascha Hauer <kernel@pengutronix.de>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Uwe,

On Fri, Jul 30, 2021 at 9:10 PM Uwe Kleine-König
<u.kleine-koenig@pengutronix.de> wrote:
> The only actual use is to check in zorro_device_probe() that the device
> isn't already bound. The driver core already ensures this however so the
> check can go away which allows to drop the then assigned-only member
> from struct zorro_dev.
>
> If the value was indeed needed somewhere it can always be calculated by
>
>         to_zorro_driver(z->dev.driver)
>
> .
>
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Thanks for your patch!

> --- a/drivers/zorro/zorro-driver.c
> +++ b/drivers/zorro/zorro-driver.c
> @@ -47,16 +47,14 @@ static int zorro_device_probe(struct device *dev)
>         struct zorro_driver *drv = to_zorro_driver(dev->driver);
>         struct zorro_dev *z = to_zorro_dev(dev);
>
> -       if (!z->driver && drv->probe) {
> +       if (drv->probe) {
>                 const struct zorro_device_id *id;
>
>                 id = zorro_match_device(drv->id_table, z);
>                 if (id)
>                         error = drv->probe(z, id);
> -               if (error >= 0) {
> -                       z->driver = drv;
> +               if (error >= 0)

I guess this test can become "> 0" now, but that doesn't matter much.

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

>                         error = 0;
> -               }
>         }
>         return error;
>  }

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
