Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11BC8C4332F
	for <linux-m68k@archiver.kernel.org>; Mon,  8 Nov 2021 08:24:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EEA1861101
	for <linux-m68k@archiver.kernel.org>; Mon,  8 Nov 2021 08:24:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231292AbhKHI1X (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 8 Nov 2021 03:27:23 -0500
Received: from mail-ua1-f44.google.com ([209.85.222.44]:41679 "EHLO
        mail-ua1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235830AbhKHI1W (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 8 Nov 2021 03:27:22 -0500
Received: by mail-ua1-f44.google.com with SMTP id p37so28767932uae.8
        for <linux-m68k@lists.linux-m68k.org>; Mon, 08 Nov 2021 00:24:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=w9sUPN7cAUF5xiuU1BT+J3vFbVAyYdqsKrT0vTW8DYQ=;
        b=sxWpcNi4ex5KNKgYNiejugXpXiTXTQ2QHTiKTPkl58iMGf0wcGegsBDJsSrgRXYebU
         F2P0YepDo47axfBrqhS8m+u5II/JLQNhsDqQbI4ipvAYrs/NK46boa/oV0Th7QU/sGuy
         ZEpCA6Xq2jbYQSN1iMM3bHHbqz7faAMDdpucMnIqmwZNhSY9DfZkI24TCEwBl1S2S9tI
         B3apL1HdvYrhITQFXYG2uTVoIYAZJcI+ApzAN2YTCYrxsp/m32lJ9uOmmrozIa3tVwNY
         o3cA/kcR6aJckfZ4WPHmK3qqHfc0n3jyI9SSOx9op5VtOEbZWJiX7BzCczauQwMtOIfG
         1zKw==
X-Gm-Message-State: AOAM531Z7tT8D9UVUXj+O/DlKEmxAloJTgx9Csen4A4L1rVEm3h1x7c2
        CEPPdsZCHoj4b5q60MZT5KFpukzCeroyGw==
X-Google-Smtp-Source: ABdhPJyTkuRzY5magbf8g9Lxkvc0uAO49M240E8caKmxtuAamNxIgoDVxcNe+Ui9h9lV8lwDd4YuSw==
X-Received: by 2002:a67:c511:: with SMTP id e17mr42491355vsk.40.1636359877219;
        Mon, 08 Nov 2021 00:24:37 -0800 (PST)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com. [209.85.222.52])
        by smtp.gmail.com with ESMTPSA id u14sm660001vkk.12.2021.11.08.00.24.35
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Nov 2021 00:24:36 -0800 (PST)
Received: by mail-ua1-f52.google.com with SMTP id o26so29882474uab.5
        for <linux-m68k@lists.linux-m68k.org>; Mon, 08 Nov 2021 00:24:35 -0800 (PST)
X-Received: by 2002:a67:c38f:: with SMTP id s15mr38275693vsj.50.1636359875569;
 Mon, 08 Nov 2021 00:24:35 -0800 (PST)
MIME-Version: 1.0
References: <20211105130338.241100-1-arnd@kernel.org> <20211105130338.241100-3-arnd@kernel.org>
In-Reply-To: <20211105130338.241100-3-arnd@kernel.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 8 Nov 2021 09:24:24 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX=e5HB8gh25DMbrbUHagS9eOQokbjneJTY6HrSSf4Njw@mail.gmail.com>
Message-ID: <CAMuHMdX=e5HB8gh25DMbrbUHagS9eOQokbjneJTY6HrSSf4Njw@mail.gmail.com>
Subject: Re: [RFC 3/3] gpiolib: coldfire: remove custom asm/gpio.h
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Greg Ungerer <gerg@linux-m68k.org>,
        Russell King <linux@armlinux.org.uk>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux-sh list <linux-sh@vger.kernel.org>,
        Rich Felker <dalias@libc.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Arnd Bergmann <arnd@arndb.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Arnd,

On Fri, Nov 5, 2021 at 2:05 PM Arnd Bergmann <arnd@kernel.org> wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>
> Now that coldfire is the only user of a custom asm/gpio.h, it seems
> better to remove this as well, and have the same interface everywhere.
>
> For the gpio_get_value()/gpio_set_value()/gpio_to_irq(), gpio_cansleep()
> functions, the custom version is only a micro-optimization to inline the
> function for constant GPIO numbers. However, in the coldfire defconfigs,
> I was unable to find a single instance where this micro-optimization
> was even used, so to my best knowledge removing this has no downsides.

The only user seems to be QSPI chip select handling (not bit-banged
data transfer) in arch/m68k/coldfire/device.c, but that indeed depends
on CONFIG_SPI_COLDFIRE_QSPI, which is not set in any of the defconfigs.
That doesn't mean there were/are no real users, though ;-)

> The custom gpio_request_one() function is even less useful, as it is
> guarded by an #ifdef that is never true.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
