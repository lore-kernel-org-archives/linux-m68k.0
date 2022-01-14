Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D800DC433EF
	for <linux-m68k@archiver.kernel.org>; Fri, 14 Jan 2022 10:46:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240444AbiANKq5 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 14 Jan 2022 05:46:57 -0500
Received: from mout.kundenserver.de ([212.227.126.135]:55055 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240284AbiANKq4 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 14 Jan 2022 05:46:56 -0500
Received: from mail-wm1-f47.google.com ([209.85.128.47]) by
 mrelayeu.kundenserver.de (mreue011 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1N79hs-1mGW6F1aYu-017Yuv for <linux-m68k@lists.linux-m68k.org>; Fri, 14 Jan
 2022 11:46:55 +0100
Received: by mail-wm1-f47.google.com with SMTP id q141-20020a1ca793000000b00347b48dfb53so5413703wme.0
        for <linux-m68k@lists.linux-m68k.org>; Fri, 14 Jan 2022 02:46:54 -0800 (PST)
X-Gm-Message-State: AOAM531C83GPQf+Bx0pZ3kZjsu6wtt9ATZJEVIr1GJlHQKlMAJZar6B4
        fq8K3PwbSSQ4TC2iWSVor2tduWeAX58pOn3Jrq4=
X-Google-Smtp-Source: ABdhPJwAWWNZkfH3zvOak1E2MdZhsLPVQGdvjKTtuDO+j6YhpQJjnaj8sNFQLsSqZON5BUwmQiGLZMoD/6dNPWTOY/Y=
X-Received: by 2002:a7b:c418:: with SMTP id k24mr3646582wmi.173.1642157214594;
 Fri, 14 Jan 2022 02:46:54 -0800 (PST)
MIME-Version: 1.0
References: <20220113201920.3201760-1-laurent@vivier.eu> <20220113201920.3201760-4-laurent@vivier.eu>
In-Reply-To: <20220113201920.3201760-4-laurent@vivier.eu>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Fri, 14 Jan 2022 11:46:38 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2QzMiga0FFVmTuefnq1OzsgyopiJN2he8043K0TRF1ng@mail.gmail.com>
Message-ID: <CAK8P3a2QzMiga0FFVmTuefnq1OzsgyopiJN2he8043K0TRF1ng@mail.gmail.com>
Subject: Re: [PATCH v6 3/4] clocksource/drivers: Add a goldfish-timer clocksource
To:     Laurent Vivier <laurent@vivier.eu>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        John Stultz <john.stultz@linaro.org>,
        linux-rtc@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:5KWyq0MjL8SNEs09GWU5mgv5agIiD5L5ZmGrc7UdwFp9sqIgR5E
 Qg8u3MjZHnRqHxn5hZn5u01PVMR4wkb4VV1c4hxw1K+dt58+h1LJCUZ7apZh30k2vpJLISN
 85URYHjNEyh8qErWOCzWVNxvycOStfu+o/cNFbaUNCw2e5KNl71hC1wlsStknRNYddZLPlQ
 Uxs5xyqsJoLO/KbdbchrA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:EnSjWdPbEzE=:rgBoohvFDOCrps+A99pmuB
 wPjN9QM2L62p3+q30b9YHzd+3WZSMYmWCv4O3hshY/WrnKqDtoLDgmPXzjkk+h0BCSRzDJQBk
 e+q10M3Z9puhRFrpVkpmhjkTMtjOgFDaHkqmYWLntJEro2VXUb+fqvjGUesHbR/OOOEwfUwdn
 y33K8OGG+qhSce+hPnFJve5c4n9Vup8snu0p6LtD8MD7YEjrBhLar6q0dw4umnp7vecQ0wc3m
 tmIpyZROO1M3yZtqB4EkkFQObhl9EU8n9MKLizQmZZIw+nSLwIVkgm2iwm7yjNjILguu40tgk
 GjGIwpCTZjg8mUjWm64kJGr611U5aTRRnKZCvEo9AeQljT26utzDkcHWimyflOGxXINXe+g6k
 rOuB3TXj2QaJ6HhlKpcgB+lOPTy4OpbhmljSARO/tUPlX3Xko3fkabxBluJmGBuAsr0z6tNbt
 OKi/s8Z7ec+bBZMRkz2di3XU0tu9TIVqH4cmvFe6KMQawY3RmM47aqueYVFyyE9ohHmaVuwc5
 BWIhRRguycWuRuLVQfJ07upE7Q9k6F2F41koVS7kZ7Ko3A4BDtzGzTY8BCmEflEMW5ib2XAWe
 VAfHqqCFR75UxVwymuF81BnfOoAKC+2QjWr9bLg9BggbAFvCIAe2cNPfnArsepEwYrncgBj/k
 /QH921ocIVR1MMeP/Mllr+tr2DAPaGjPkKE/fvv8v4kvQ5zJ6/c30Lm+kUQ5Bre+LdVuB0QP+
 BdXqOFh0hMC6MV5A5sd9msAbyQhj6QrZoLltefCHSXRnXjnZqYu2G92uUVLNE1Z9mOAA1aovP
 DN0UoeSruzbXt5I3aWwrDG4dvHt3untgzCcmCnokN+vU4A0k2A=
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Thu, Jan 13, 2022 at 9:19 PM Laurent Vivier <laurent@vivier.eu> wrote:
>
> Add a clocksource based on the goldfish-rtc device.
>
> Signed-off-by: Laurent Vivier <laurent@vivier.eu>
> ---
>  drivers/clocksource/Kconfig          |   7 ++
>  drivers/clocksource/Makefile         |   1 +
>  drivers/clocksource/timer-goldfish.c | 130 +++++++++++++++++++++++++++
>  include/clocksource/timer-goldfish.h |  12 +++
>  4 files changed, 150 insertions(+)
>  create mode 100644 drivers/clocksource/timer-goldfish.c
>  create mode 100644 include/clocksource/timer-goldfish.h
>
> diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
> index f65e31bab9ae..6ca9bb78407d 100644
> --- a/drivers/clocksource/Kconfig
> +++ b/drivers/clocksource/Kconfig
> @@ -711,4 +711,11 @@ config MICROCHIP_PIT64B
>           modes and high resolution. It is used as a clocksource
>           and a clockevent.
>
> +config GOLDFISH_TIMER
> +       bool "Clocksource using goldfish-rtc"
> +       select RTC_CLASS
> +       select RTC_DRV_GOLDFISH

This should probably be

          depends on M68K || COMPILE_TEST
          depends on RTC_DRV_GOLDFISH

A driver should never 'select' another user-selectable subsystem

> +static int goldfish_timer_set_oneshot(struct clock_event_device *evt)
> +{
> +       struct goldfish_timer *timerdrv = ced_to_gf(evt);
> +       void __iomem *base = timerdrv->base;
> +
> +       __raw_writel(0, base + TIMER_ALARM_HIGH);
> +       __raw_writel(0, base + TIMER_ALARM_LOW);
> +       __raw_writel(1, base + TIMER_IRQ_ENABLED);

As mentioned elsewhere, the __raw_* accessors are not portable, please
use readl()/writel() here, or possibly ioread32_be()/iowrite32_be() for
the big-endian variant.

> +EXPORT_SYMBOL_GPL(goldfish_timer_init);

No need to export this if the only callers are in the kernel.

         Arnd
