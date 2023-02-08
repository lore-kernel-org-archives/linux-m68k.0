Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25222C636CC
	for <linux-m68k@archiver.kernel.org>; Wed,  8 Feb 2023 10:14:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229462AbjBHKOR (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 8 Feb 2023 05:14:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229505AbjBHKOQ (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 8 Feb 2023 05:14:16 -0500
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E786F23662
        for <linux-m68k@lists.linux-m68k.org>; Wed,  8 Feb 2023 02:14:15 -0800 (PST)
Received: by mail-qt1-f172.google.com with SMTP id h24so20167213qtr.0
        for <linux-m68k@lists.linux-m68k.org>; Wed, 08 Feb 2023 02:14:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Al90dbaVnMvp1zrarwIGYloHZEfuuu1TJgBG8XepFdE=;
        b=r0Bg846q5es7cWlXGVJQh2CK4Czn9cq8y1SOhwybgkiy69zHxhlnpSvK6R2yxc8U5o
         tZDcoGF+2pkwwSuQazqlUSVssPT+hoMy1avLdSbEs2Vl0egYV2d7zrgCEztjb7NuLT4W
         sK4Yey83pMy8hsoAfEeeSYhHUW4auEgvTldhOSroe5nL/WPCqHqkHyLu3xrpNrTXEl1y
         QG6Y195KfLT0g2oV+1VgSMm9l0FidRYHMjsc0pnYxJDLrCYPWTJ80CPVu+S+/P/G0CBr
         xqiTQVX9hTcKnjNr5PXKDVYQzBOpkF4PcbLOvxhtMcN3vTMH/gjk+88DVmZ9iWMpQ6Lo
         FggA==
X-Gm-Message-State: AO0yUKUWn5Ub29L24jGmfp7mFOQSFRbnnuFKi1y0UUTbKVqgNcW4Gnwg
        1mTzCt8jtF2wVxthyW8iVY8T7szB3WGf3f7I
X-Google-Smtp-Source: AK7set/N9+JzM//g4tcfpfrUD5l4QNhQ48DA8q5G7Ym0Kug4ABqS0oZQYhs2+YgG+DtsvzmIBM9tcA==
X-Received: by 2002:a05:622a:130e:b0:3b9:b761:b0aa with SMTP id v14-20020a05622a130e00b003b9b761b0aamr11206784qtk.11.1675851254596;
        Wed, 08 Feb 2023 02:14:14 -0800 (PST)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com. [209.85.128.179])
        by smtp.gmail.com with ESMTPSA id 16-20020a05620a041000b007201df7ff47sm11416137qkp.45.2023.02.08.02.14.14
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Feb 2023 02:14:14 -0800 (PST)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-52bf225460cso4995287b3.4
        for <linux-m68k@lists.linux-m68k.org>; Wed, 08 Feb 2023 02:14:14 -0800 (PST)
X-Received: by 2002:a5b:508:0:b0:8a3:59a4:340e with SMTP id
 o8-20020a5b0508000000b008a359a4340emr741320ybp.604.1675850942618; Wed, 08 Feb
 2023 02:09:02 -0800 (PST)
MIME-Version: 1.0
References: <20230207142952.51844-1-andriy.shevchenko@linux.intel.com> <20230207142952.51844-9-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20230207142952.51844-9-andriy.shevchenko@linux.intel.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 8 Feb 2023 11:08:51 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVkhymFCys_LnqKtpXLBT6sKURbVqBnp2wDUc63nhxvSw@mail.gmail.com>
Message-ID: <CAMuHMdVkhymFCys_LnqKtpXLBT6sKURbVqBnp2wDUc63nhxvSw@mail.gmail.com>
Subject: Re: [PATCH v3 08/12] gpio: aggregator: Add missing header(s)
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Tony Lindgren <tony@atomide.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Devarsh Thakkar <devarsht@ti.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Stefan Schmidt <stefan@datenfreihafen.org>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        linux-doc-tw-discuss@lists.sourceforge.net,
        linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
        linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-input@vger.kernel.org,
        linux-media@vger.kernel.org, linux-wpan@vger.kernel.org,
        netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
        brcm80211-dev-list.pdl@broadcom.com,
        SHA-cyfmac-dev-list@infineon.com, linux-arch@vger.kernel.org,
        devicetree@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>,
        Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
        Yanteng Si <siyanteng@loongson.cn>,
        Hu Haowen <src.res@email.cn>,
        Russell King <linux@armlinux.org.uk>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Nicholas Piggin <npiggin@gmail.com>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        Mun Yew Tham <mun.yew.tham@intel.com>,
        Keerthy <j-keerthy@ti.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Alexander Aring <alex.aring@gmail.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Arend van Spriel <aspriel@gmail.com>,
        Franky Lin <franky.lin@broadcom.com>,
        Hante Meuleman <hante.meuleman@broadcom.com>,
        Kalle Valo <kvalo@kernel.org>, Qiang Zhao <qiang.zhao@nxp.com>,
        Li Yang <leoyang.li@nxp.com>, Lee Jones <lee@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Andy,

Thanks for your patch!

On Tue, Feb 7, 2023 at 3:29 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> Do not imply that some of the generic headers may be always included.
> Instead, include explicitly what we are direct user of.

That applies only to the addition of #include <linux/slab.h>...
Please also describe the other changes.

> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/gpio/gpio-aggregator.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpio/gpio-aggregator.c b/drivers/gpio/gpio-aggregator.c
> index 6d17d262ad91..20a686f12df7 100644
> --- a/drivers/gpio/gpio-aggregator.c
> +++ b/drivers/gpio/gpio-aggregator.c
> @@ -10,19 +10,20 @@
>  #include <linux/bitmap.h>
>  #include <linux/bitops.h>
>  #include <linux/ctype.h>
> -#include <linux/gpio.h>
> -#include <linux/gpio/consumer.h>
> -#include <linux/gpio/driver.h>
> -#include <linux/gpio/machine.h>
>  #include <linux/idr.h>
>  #include <linux/kernel.h>
>  #include <linux/module.h>
>  #include <linux/mutex.h>
>  #include <linux/overflow.h>
>  #include <linux/platform_device.h>
> +#include <linux/slab.h>
>  #include <linux/spinlock.h>
>  #include <linux/string.h>
>
> +#include <linux/gpio/consumer.h>
> +#include <linux/gpio/driver.h>
> +#include <linux/gpio/machine.h>
> +
>  #define AGGREGATOR_MAX_GPIOS 512

For the actual changes:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
