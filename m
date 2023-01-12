Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B158EC54EBD
	for <linux-m68k@archiver.kernel.org>; Thu, 12 Jan 2023 15:22:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230475AbjALPWc (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 12 Jan 2023 10:22:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234056AbjALPWM (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 12 Jan 2023 10:22:12 -0500
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35BC32657
        for <linux-m68k@lists.linux-m68k.org>; Thu, 12 Jan 2023 07:14:54 -0800 (PST)
Received: by mail-qt1-f175.google.com with SMTP id jr10so9396741qtb.7
        for <linux-m68k@lists.linux-m68k.org>; Thu, 12 Jan 2023 07:14:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5Y6qY7Xi7w4nejlKSxi1fYejKBcc6r8h/6CzmR1L1Uk=;
        b=DYdGeVewBoUuU9/tPJCMReGIjgZW+RJqxV6LmJpjDVK4BupARWbsOfiSjS5Gz0gtQB
         03fWQepbFh9y3jsLJf0bWTxlKOgAnhaeJvkBcpKtUdd1AXeGCdXDlmaY1Vb9+xZPOyx1
         fQ82QubuBpSN5FwonZPh7QN9RLdL4dTmXohEouIvwXEPGU9wG6kw6cldMf/i2gpOCAiN
         VucXvZUpsVCkLAOZcc/JbrDbfp9afo1WolTjuArc1M0RaYef1TqULtVt1nFeixMdsluz
         0KGABcUs3YDUz24Y9vXUEZQnbw6RX1KTos31ucDhopPHPDtljYBtuN+OaxCNtdycZ82R
         OOWg==
X-Gm-Message-State: AFqh2kqGRZEqSfgcrvTKXK3fjeRETTZWuM9+fKzFMhCU5o90/CQiqWFX
        nsOmUDwlcnk40X9tu++JCQn2kcp7USMtKg==
X-Google-Smtp-Source: AMrXdXv/2mVtEKmp3Zrwcu9sHFgtFLw3txLKi0cyhds3aJw57R02POGaRj2+JxSTx8flucrpGMFnjg==
X-Received: by 2002:a05:622a:5c8d:b0:3a9:81ba:409d with SMTP id ge13-20020a05622a5c8d00b003a981ba409dmr110015704qtb.0.1673536492971;
        Thu, 12 Jan 2023 07:14:52 -0800 (PST)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com. [209.85.128.178])
        by smtp.gmail.com with ESMTPSA id h14-20020ac8548e000000b003ab1ee36ee7sm9174946qtq.51.2023.01.12.07.14.51
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jan 2023 07:14:52 -0800 (PST)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-4a263c4ddbaso244222717b3.0
        for <linux-m68k@lists.linux-m68k.org>; Thu, 12 Jan 2023 07:14:51 -0800 (PST)
X-Received: by 2002:a81:1a16:0:b0:46f:bd6:957d with SMTP id
 a22-20020a811a16000000b0046f0bd6957dmr1837351ywa.383.1673536491636; Thu, 12
 Jan 2023 07:14:51 -0800 (PST)
MIME-Version: 1.0
References: <20230112133942.58471-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20230112133942.58471-1-andriy.shevchenko@linux.intel.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 12 Jan 2023 16:14:39 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXSc-H5TKBGisthv3DH3sZmF3fV_15FuMEt=typwTWUtA@mail.gmail.com>
Message-ID: <CAMuHMdXSc-H5TKBGisthv3DH3sZmF3fV_15FuMEt=typwTWUtA@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] gpio: Remove unused and obsoleted irq_to_gpio()
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        linux-doc-tw-discuss@lists.sourceforge.net,
        linux-m68k@lists.linux-m68k.org, linux-sh@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
        Yanteng Si <siyanteng@loongson.cn>,
        Hu Haowen <src.res@email.cn>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        Greg Ungerer <gerg@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

CC greg

On Thu, Jan 12, 2023 at 2:39 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> irq_to_gpio() is legacy and unused API, remove it for good.
>
> This leaves gpio_to_irq() as it's used yet in many places.
> Nevertheless, removal of its counterpart is a good signal
> to whoever even trying to consider using them that do not.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  Documentation/driver-api/gpio/legacy.rst             |  8 --------
>  .../translations/zh_CN/driver-api/gpio/legacy.rst    |  7 -------
>  Documentation/translations/zh_TW/gpio.txt            |  7 -------
>  arch/m68k/include/asm/gpio.h                         |  7 -------
>  arch/sh/include/asm/gpio.h                           |  5 -----
>  include/linux/gpio.h                                 | 12 ------------
>  6 files changed, 46 deletions(-)

[...]

> --- a/arch/m68k/include/asm/gpio.h
> +++ b/arch/m68k/include/asm/gpio.h
> @@ -66,13 +66,6 @@ static inline int gpio_to_irq(unsigned gpio)
>                 return __gpio_to_irq(gpio);
>  }
>
> -static inline int irq_to_gpio(unsigned irq)
> -{
> -       return (irq >= MCFGPIO_IRQ_VECBASE &&
> -               irq < (MCFGPIO_IRQ_VECBASE + MCFGPIO_IRQ_MAX)) ?
> -               irq - MCFGPIO_IRQ_VECBASE : -ENXIO;
> -}
> -
>  static inline int gpio_cansleep(unsigned gpio)
>  {
>         return gpio < MCFGPIO_PIN_MAX ? 0 : __gpio_cansleep(gpio);

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
