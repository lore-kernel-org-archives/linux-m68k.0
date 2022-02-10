Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9D51C433FE
	for <linux-m68k@archiver.kernel.org>; Thu, 10 Feb 2022 13:07:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241964AbiBJNHu (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 10 Feb 2022 08:07:50 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:43570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241957AbiBJNHt (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 10 Feb 2022 08:07:49 -0500
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56C8122F
        for <linux-m68k@lists.linux-m68k.org>; Thu, 10 Feb 2022 05:07:50 -0800 (PST)
Received: by mail-ua1-f45.google.com with SMTP id u77so2959483uau.6
        for <linux-m68k@lists.linux-m68k.org>; Thu, 10 Feb 2022 05:07:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9xSDkfGA7Gbw9lubbu8lfvfHIM/jNHECsHfMyY0SuGE=;
        b=cyb0mjao81tDCdqhidwjYdv+H/aMGYBEm3uTSuqPeHCfJWcbYVaJG2RSNushXqRt0D
         JQYcesJ/ClIVQd4+xYNzyoVwcKv7O3hGlk4ngIQaZgTTqFBnTlPumqbEXG8NFLj8q+Nm
         rE8uChxz1PXRxrC0apl1Z/H2PGSwugRMp+EsMdbE3fDGZwuQMFUBa1WIZij4Sf7EYvXt
         E9waWtJTtcpPg3BxVNn/NQVrE5CzIPQ5+PglywKNX6pZ7Tayos2cVIFHyG4XuwiHIoK/
         S3fKjYL69d9BppR0kKtdqiJedaCubaTGekTHr4M4EhMKkcuClp91OrwUOoVQeHUdmGkF
         VGUQ==
X-Gm-Message-State: AOAM5302yrjEu1D1iqhzoReDKODJx5I3EbZkXgxI1GP5L55BDC4oTxbn
        ZPiDcP7YD/2D1xu8guXufHgmbQFAGQB9Aw==
X-Google-Smtp-Source: ABdhPJyYh18emuWpLgyeH025UBC9P/S6lOpgd7YwJRMMRNHjOxwv/bgOIlZI13C6XvssY85/0SCL5Q==
X-Received: by 2002:ab0:3c86:: with SMTP id a6mr2936747uax.6.1644498469151;
        Thu, 10 Feb 2022 05:07:49 -0800 (PST)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com. [209.85.217.53])
        by smtp.gmail.com with ESMTPSA id h141sm3792415vka.19.2022.02.10.05.07.48
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Feb 2022 05:07:48 -0800 (PST)
Received: by mail-vs1-f53.google.com with SMTP id u134so1494698vsu.8
        for <linux-m68k@lists.linux-m68k.org>; Thu, 10 Feb 2022 05:07:48 -0800 (PST)
X-Received: by 2002:a05:6102:34d9:: with SMTP id a25mr2360386vst.68.1644498468038;
 Thu, 10 Feb 2022 05:07:48 -0800 (PST)
MIME-Version: 1.0
References: <20220130143333.552646-1-laurent@vivier.eu> <20220130143333.552646-3-laurent@vivier.eu>
In-Reply-To: <20220130143333.552646-3-laurent@vivier.eu>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 10 Feb 2022 14:07:37 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVX_DTZDTad9iU2DkTT_KTyducGJWtisj8wpTOzWdZMgg@mail.gmail.com>
Message-ID: <CAMuHMdVX_DTZDTad9iU2DkTT_KTyducGJWtisj8wpTOzWdZMgg@mail.gmail.com>
Subject: Re: [PATCH v14 2/5] tty: goldfish: introduce gf_ioread32()/gf_iowrite32()
To:     Laurent Vivier <laurent@vivier.eu>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, linux-rtc@vger.kernel.org,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Stephen Boyd <sboyd@kernel.org>,
        John Stultz <john.stultz@linaro.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        stable <stable@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Sun, Jan 30, 2022 at 3:33 PM Laurent Vivier <laurent@vivier.eu> wrote:
> Revert
> commit da31de35cd2f ("tty: goldfish: use __raw_writel()/__raw_readl()")
>
> and define gf_ioread32()/gf_iowrite32() to be able to use accessors
> defined by the architecture.
>
> Cc: stable@vger.kernel.org # v5.11+
> Fixes: da31de35cd2f ("tty: goldfish: use __raw_writel()/__raw_readl()")
> Signed-off-by: Laurent Vivier <laurent@vivier.eu>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
