Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1B63C433FE
	for <linux-m68k@archiver.kernel.org>; Wed, 19 Jan 2022 08:22:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346997AbiASIWA (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 19 Jan 2022 03:22:00 -0500
Received: from mail-ua1-f47.google.com ([209.85.222.47]:37390 "EHLO
        mail-ua1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245478AbiASIV7 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 19 Jan 2022 03:21:59 -0500
Received: by mail-ua1-f47.google.com with SMTP id b16so3109134uaq.4
        for <linux-m68k@lists.linux-m68k.org>; Wed, 19 Jan 2022 00:21:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mNEeF7mEICXaIClDfLKBUPzmMnomVxgHrUkxe4T3tSU=;
        b=vMYtUI99nYHonDxRAothGmVkc+Vb7XPhgIc8D1g8bXi+Od2zguCnvZvJPOWHOVx04Y
         Q8FEY3mvoHlIEkTpszZ812xpC4EFfbGZC3bH51oOSmZVNspnPruu1erukHR53Qz5+t3o
         IsMr/bZIH0MjZXITBYz/6uRLWH9yR1vw7JnclLcIv2Lo9k/vdW06oRgPab+9X+EEO3Rz
         Qm3I6zUNE7FtB3JsXqCv170qg56EvdbexTZA9DyQ1cn5ZndSyU9S+vnusthCsycbW6gq
         zfWyt1PTDZo8A4cHSbXqhdqyCmamlhQcrfWeMqi5hQ+guhg3td+5OFOmx7km/7f8lV7G
         3XAA==
X-Gm-Message-State: AOAM531U4qdix9h3CvB4rpB6Iwr9qyRoeZe+hZnyxC4MU8LwDryArbfM
        Wd0DRe/zHWf8fsdxrXFo2VTauAlmcdew0g==
X-Google-Smtp-Source: ABdhPJya7TMOoJByqDrjOgeOfY9lbDapoEblmH/xno2qO8QqGdDvP7uAx/rXYJHYJbnAIEw70fwLqA==
X-Received: by 2002:a67:fb59:: with SMTP id e25mr10757079vsr.78.1642580518634;
        Wed, 19 Jan 2022 00:21:58 -0800 (PST)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com. [209.85.222.44])
        by smtp.gmail.com with ESMTPSA id o26sm4386883vsl.9.2022.01.19.00.21.57
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Jan 2022 00:21:57 -0800 (PST)
Received: by mail-ua1-f44.google.com with SMTP id 2so3050301uax.10
        for <linux-m68k@lists.linux-m68k.org>; Wed, 19 Jan 2022 00:21:57 -0800 (PST)
X-Received: by 2002:a05:6102:3581:: with SMTP id h1mr11184748vsu.5.1642580517250;
 Wed, 19 Jan 2022 00:21:57 -0800 (PST)
MIME-Version: 1.0
References: <20220119000506.1299843-1-laurent@vivier.eu> <20220119000506.1299843-3-laurent@vivier.eu>
In-Reply-To: <20220119000506.1299843-3-laurent@vivier.eu>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 19 Jan 2022 09:21:46 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXSFU4N+FLYkCLJCJcWJ74g=8Vr23Rx0cka-kDTBs6Z4Q@mail.gmail.com>
Message-ID: <CAMuHMdXSFU4N+FLYkCLJCJcWJ74g=8Vr23Rx0cka-kDTBs6Z4Q@mail.gmail.com>
Subject: Re: [PATCH v10 2/5] rtc: goldfish: introduce goldfish_ioread32()/goldfish_iowrite32()
To:     Laurent Vivier <laurent@vivier.eu>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        John Stultz <john.stultz@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>, linux-rtc@vger.kernel.org,
        Thomas Gleixner <tglx@linutronix.de>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Laurent,

On Wed, Jan 19, 2022 at 1:05 AM Laurent Vivier <laurent@vivier.eu> wrote:
> The goldfish device always uses the same endianness as the architecture
> using it:
> https://android.googlesource.com/platform/external/qemu/+/refs/heads/emu-master-dev/hw/timer/goldfish_timer.c#177
>
> On a big-endian machine, the device is also big-endian, on a
> little-endian machine the device is little-endian.
>
> So we need to use the right accessor to read/write values to the goldfish
> registers: ioread32()/iowrite32() on a little-endian machine,
> ioread32be()/iowrite32be() on a big-endian machine.
>
> This patch introduces goldfish_ioread32()/goldfish_iowrite32() to allow
> architectures to define them accordlingly to their endianness.
>
> We define them by default in asm-generic/io.h to access the device using
> little-endian access as it is the current use, but we will be able to define
> big-endian version when new architectures will use them.
>
> Signed-off-by: Laurent Vivier <laurent@vivier.eu>

Thanks for your patch!

> --- a/include/asm-generic/io.h
> +++ b/include/asm-generic/io.h
> @@ -906,6 +906,13 @@ static inline void iowrite64_rep(volatile void __iomem *addr,
>  #endif /* CONFIG_64BIT */
>  #endif /* CONFIG_GENERIC_IOMAP */
>
> +#ifndef goldfish_ioread32
> +#define goldfish_ioread32 ioread32
> +#endif
> +#ifndef goldfish_iowrite32
> +#define goldfish_iowrite32 iowrite32
> +#endif
> +
>  #ifdef __KERNEL__

I've just discovered include/linux/goldfish.h, which already has gf_*()
accessors for 64-bit, so it'd make sense to move the above there,
and adjust the names.

Arnd: note that the existing ones do use __raw_writel().

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
