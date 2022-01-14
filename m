Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF24CC433EF
	for <linux-m68k@archiver.kernel.org>; Fri, 14 Jan 2022 06:57:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239407AbiANG5s (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 14 Jan 2022 01:57:48 -0500
Received: from mout.kundenserver.de ([212.227.126.187]:50993 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239147AbiANG5q (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 14 Jan 2022 01:57:46 -0500
Received: from mail-wm1-f44.google.com ([209.85.128.44]) by
 mrelayeu.kundenserver.de (mreue009 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MjSHa-1mTB8k1XwY-00kynC for <linux-m68k@lists.linux-m68k.org>; Fri, 14 Jan
 2022 07:57:44 +0100
Received: by mail-wm1-f44.google.com with SMTP id s6-20020a7bc386000000b0034a89445406so2897854wmj.2
        for <linux-m68k@lists.linux-m68k.org>; Thu, 13 Jan 2022 22:57:44 -0800 (PST)
X-Gm-Message-State: AOAM533sPWnV4Vd63sNIS3JCuhCz7U5o6qRvNeC09hji7UFAhGOc6QUG
        zDusSead3O6JusULDghfn0ECZHBhII9wIDtQhw0=
X-Google-Smtp-Source: ABdhPJwwQhITLnWsKboPk0/GB6llV0E9xXAfPiCmzUJOvXgqzfiwsoK69qPL6kniPU2RdMPLej4odQ7iw1aqRAhtEyo=
X-Received: by 2002:a05:600c:5c1:: with SMTP id p1mr14161704wmd.1.1642143464069;
 Thu, 13 Jan 2022 22:57:44 -0800 (PST)
MIME-Version: 1.0
References: <20220113201920.3201760-1-laurent@vivier.eu> <20220113201920.3201760-3-laurent@vivier.eu>
In-Reply-To: <20220113201920.3201760-3-laurent@vivier.eu>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Fri, 14 Jan 2022 07:57:27 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1H6-sd_+FqnOq0Zhj=L51EWuW5VCcYeTENcp3+PkTC4Q@mail.gmail.com>
Message-ID: <CAK8P3a1H6-sd_+FqnOq0Zhj=L51EWuW5VCcYeTENcp3+PkTC4Q@mail.gmail.com>
Subject: Re: [PATCH v6 2/4] rtc: goldfish: use __raw_writel()/__raw_readl()
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
X-Provags-ID: V03:K1:V3Arz7HQVmSjd7Jtlx7yYRacq8/c/P5CmHWHiLym2PnpFyIEFqG
 AJXF8syzYveDxeArrnryLgkaZIcF1p77RuabJrBgvl29IoAgMgabixgvOjxme3OXLu0LU17
 ngVw0MLgqJGJdeMVgU0Bf+aGR2l5VhHaJhSTO3XwqO7SJZ472yez2N7c6+KjobVt47QGkfE
 P5MM+ISFl821Uq/u7m6ig==
X-UI-Out-Filterresults: notjunk:1;V03:K0:F1qpScx5cws=:vDizG3beYL4sbuZqmMaSlo
 qz83T385E+KbguCeC+eMc736nTN3C+eHTBZY419jtyolesPFhUNjPJnd4OkVsUUt0gw5lz+mV
 K5J3WXpo3prCMTUKQ84LXSfeBMtflIDNQwknGtHXM4cMzjpsnnxQZ6In1TUXsf0M2GwMvvVOe
 fIIqAXtWkh4RtfwOKw+0J/fZ+QXSbZl3o3/60lspxUvvGvHKvXhAQQ6hrnNpufJw2CDA8LgV4
 RxQ77baGXkw8liqPUFUBuccGzW507q1BXI0M0JrKnogk0FzbgpYF6XNz5OY+a+9iUvpoi6LW4
 6etURWjWny0KfV0EtM2Og3Yyb7lSyOjBflZ8TSi4CFUed7pYBK1vJxsvGbcz+Md/YXFk7jyy0
 KZY8x4aELgQ6ZOggsaRReZYM++SsnL4zEHBM/Yt9iBlIGEDmknMejFy4ZGj/2LumOr9GOfK9A
 H4OeT//9B8f2DDckJKdEXfTgRXMFvpyTbXNradcOH5ab/nijh+hLXgKQYeRi11E7OdueltgPp
 oSD8HIzPV2SxvYj2zbRGbLKm6Es9XP9LEi8NroC/4fVdjBYKahrAwnAJKOXEDnHVg9FIrPOSn
 ubYhqztEq5rGgqV9b/jBmtey5jYDRNnZvj9fNrEy8wOnDDWdF1ssuIZs58zWhXD9i8p/WL/B8
 qkPBuCk6l3Ucy19tRky2Ft6MljG2vaaMgW7d9VN1aJFq8oWqEyaNLl5DuMKbK23gbWMY=
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Thu, Jan 13, 2022 at 9:19 PM Laurent Vivier <laurent@vivier.eu> wrote:
>
> As android implementation defines the endianness of the device is the one
> of the architecture replace all writel()/readl() by
> __raw_writel()/__raw_readl()
>
> https://android.googlesource.com/platform/external/qemu/+/refs/heads/emu-master-dev/hw/timer/goldfish_timer.c#177
>
> The same change has been done for goldfish-tty:
>
>   commit da31de35cd2f ("tty: goldfish: use __raw_writel()/__raw_readl()")
>
> Signed-off-by: Laurent Vivier <laurent@vivier.eu>

__raw_readl() isn't really the correct interface though, this is not
well-defined to have
a particular meaning at all, and doesn't guarantee atomicity or a
particular endianess
across architectures.

I'd suggest defining a set of goldfish specific accessors per
architecture that turn
into either readl() or swabl(readl()), to allow future architectures
to define this
properly in qemu.

         Arnd
