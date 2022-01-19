Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EB2FC433EF
	for <linux-m68k@archiver.kernel.org>; Wed, 19 Jan 2022 08:49:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352578AbiASIto (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 19 Jan 2022 03:49:44 -0500
Received: from mout.kundenserver.de ([217.72.192.74]:34101 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352564AbiASItn (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 19 Jan 2022 03:49:43 -0500
Received: from mail-wm1-f43.google.com ([209.85.128.43]) by
 mrelayeu.kundenserver.de (mreue108 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1M9Fvl-1nCZVJ0blX-006LYk for <linux-m68k@lists.linux-m68k.org>; Wed, 19
 Jan 2022 09:49:42 +0100
Received: by mail-wm1-f43.google.com with SMTP id l35-20020a05600c1d2300b0034d477271c1so4310538wms.3
        for <linux-m68k@lists.linux-m68k.org>; Wed, 19 Jan 2022 00:49:42 -0800 (PST)
X-Gm-Message-State: AOAM532jhz5eishm9ZzgDurHDmYC8Wyrmvf2RnUQUjwWrys4ZdkMz4SI
        594Fc6mk8SN1+kAipwn8e1wjoTwXfOdLY6xdDVQ=
X-Google-Smtp-Source: ABdhPJxf3RtweRtU+CatTOtSpLEk3AYaK311IymBkfKp4ZAtysVZK4i4XHZhQpD0dg01dfcz9lpKSApJdra8Z56WbAg=
X-Received: by 2002:a1c:2784:: with SMTP id n126mr162213wmn.1.1642582181746;
 Wed, 19 Jan 2022 00:49:41 -0800 (PST)
MIME-Version: 1.0
References: <20220119000506.1299843-1-laurent@vivier.eu> <20220119000506.1299843-3-laurent@vivier.eu>
 <CAMuHMdXSFU4N+FLYkCLJCJcWJ74g=8Vr23Rx0cka-kDTBs6Z4Q@mail.gmail.com>
In-Reply-To: <CAMuHMdXSFU4N+FLYkCLJCJcWJ74g=8Vr23Rx0cka-kDTBs6Z4Q@mail.gmail.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Wed, 19 Jan 2022 09:49:25 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2fjbet+nNAVt_WUxedUDWdRwb880KEa+MY1cFwYNC4SA@mail.gmail.com>
Message-ID: <CAK8P3a2fjbet+nNAVt_WUxedUDWdRwb880KEa+MY1cFwYNC4SA@mail.gmail.com>
Subject: Re: [PATCH v10 2/5] rtc: goldfish: introduce goldfish_ioread32()/goldfish_iowrite32()
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Laurent Vivier <laurent@vivier.eu>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
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
X-Provags-ID: V03:K1:EyRlZ2CMlYKV9k3C3rl4yLn2ovV3ABd/6k4ObWaRFadiSd+LINa
 KGLmfxHQ/e/EWWEchwl1YYlKLWA17dSv7hEV0aw3FTxfF1y/sogbJu+3NAq+ZJMmYIOwuWa
 Yv8oLDjW9apIFNntBRXRWRB4sPy5I2aRQ+/eeI0Ou7Mla5t/FrmfG1VxQjTVDZEi23PB6OK
 E5Gq4mrtFjSjUe5P1dWaQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:RI3g38IzX8o=:QZW72lfvhZ8xwjrS2uO8Gf
 k6/OZNq84ZGkuKgeGsq6ACacdVHlmAQRnE1onpO61kWUSiA+ExZ6PCmz11sUMBoCulM8j74uX
 VZv6QiP2Vhg0SeQAjzS/1hdqaX64/T9PVHbcoV1pXpKv6Yj5HScmWFCphT4xFZ4UShiamt00p
 mnZKefYJAs9dU7VlNKD8aG59E+W9cnhO/CQYLH7hM672sXZgoMsynu0B14/ZhBxwO7MFYZksN
 V4F07bpa6qQbYctdqqp6TWBobFoxygDPbyAyIAyeKe2vYQSe2FnNN91NPuRBybmUs6YOWIZBJ
 xl8D64WrL/+N0RtrRSOyHBof1/IdrDWU01nF5Y6ALitS2hVwnH+hWJycIhxxnRYqN7McaC4oH
 i9tZvEjRzNQuVwiapSHZISpzgjn9vHZwVB/dYuNyXi5ptebVU7j/D0DFnea3MhTw0Ji54qxJo
 IkLKUQrquKYIFINScwWkLzxIdTs3ptnYhyN+QFFCt5I3kUFroTpXIOclDjSbSaKqFKFMpBvqD
 AU+2h9CNNDplMe++2VEYrDq3GMFBwGRMzaFeidoSpOENvktc7iln3wvfSqkYtC7ufsI+uddcE
 Z+1nQ3gfpj+a4p6Ucj6uOhADT5uJV7MNm6xfmSFBWWE4BxlDZeRfJhMXi5aeoBxbdJ+hSNx+Y
 QLkhKBrbmZ/GWhc3cx2SYg09Re1a/6hJCS1kDcp9FL4oyQlMuqLQ5qZHGIAkGRHq6F8w=
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Wed, Jan 19, 2022 at 9:21 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Wed, Jan 19, 2022 at 1:05 AM Laurent Vivier <laurent@vivier.eu> wrote:
>
> I've just discovered include/linux/goldfish.h, which already has gf_*()
> accessors for 64-bit, so it'd make sense to move the above there,
> and adjust the names.

Yes, good idea.

>
> Arnd: note that the existing ones do use __raw_writel().

It looks like Laurent introduced that bug in da31de35cd2f ("tty: goldfish: use
__raw_writel()/__raw_readl()") and could fix it up here. Laurent, was the intent
of this earlier patch also to make the driver usabel for m68k, or are there
any other targets you looked at that had mixed up endianness?

       Arnd
