Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93BACC433F5
	for <linux-m68k@archiver.kernel.org>; Sun, 16 Jan 2022 10:44:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234845AbiAPKou (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sun, 16 Jan 2022 05:44:50 -0500
Received: from mout.kundenserver.de ([217.72.192.74]:49937 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234843AbiAPKor (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sun, 16 Jan 2022 05:44:47 -0500
Received: from mail-ot1-f49.google.com ([209.85.210.49]) by
 mrelayeu.kundenserver.de (mreue106 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MkIEJ-1mSoOS2tK5-00kbyu for <linux-m68k@lists.linux-m68k.org>; Sun, 16
 Jan 2022 11:44:45 +0100
Received: by mail-ot1-f49.google.com with SMTP id a10-20020a9d260a000000b005991bd6ae3eso2455962otb.11
        for <linux-m68k@lists.linux-m68k.org>; Sun, 16 Jan 2022 02:44:45 -0800 (PST)
X-Gm-Message-State: AOAM532ZZHS47cezrdI7iKo7doaYOEGRpkdTAnW3MZ7gT0nsKDGeVk/5
        W1vDy/WDB4kdNI7PV4xVk6gefqjo/4j1f+gebpo=
X-Google-Smtp-Source: ABdhPJzlLWoJQBn4VnzmdYliVzW+ITzvPUzHpGKIPBeYP+3HuPIgD4eMUFAmb5UWZ8K1iXz4bS3aEgCyVe9TE/GwoaI=
X-Received: by 2002:a9d:c61:: with SMTP id 88mr9417588otr.119.1642329884423;
 Sun, 16 Jan 2022 02:44:44 -0800 (PST)
MIME-Version: 1.0
References: <20220115193245.3777833-1-laurent@vivier.eu> <20220115193245.3777833-4-laurent@vivier.eu>
In-Reply-To: <20220115193245.3777833-4-laurent@vivier.eu>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Sun, 16 Jan 2022 11:44:28 +0100
X-Gmail-Original-Message-ID: <CAK8P3a13g_o4mTsOO-4b=WU6TGRHubY7HCt1x1FdXpVmjy6-Sg@mail.gmail.com>
Message-ID: <CAK8P3a13g_o4mTsOO-4b=WU6TGRHubY7HCt1x1FdXpVmjy6-Sg@mail.gmail.com>
Subject: Re: [PATCH v8 3/4] clocksource/drivers: Add a goldfish-timer clocksource
To:     Laurent Vivier <laurent@vivier.eu>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        John Stultz <john.stultz@linaro.org>,
        linux-rtc@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:Rle8KGfm3TIcXT363oQWzLI7KYqBNsnKWBzWhJZlOg8vvoTq1n5
 vAp4ai4nnHSidA9KxnEMwbFClNu9Z77QclQPobZ4ZTv+B6DA6DBCWtfqd6tyFtBZNb1qyqz
 V8E2LJwKZt+kki+XsfHHywK1gwSxmU0gcrHqCWtD1LOae5a1+Gxs/AouRr1d5pF7M1vnYOZ
 riD0Ei7eeksZFwlwNPfZw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:0D/76bRPBA0=:+mY0+Z+fVd2Lu3ZUrYddpw
 Q/DCeCJvcA+x6/viPdxkMZxXemoOcu0XWBU92cvgbzjZ8G3ZOX3D+0UT4FkPRy1IYvWwRO6Gz
 5legUWQBybcSQjLw+cm+/0Vzax1dLqTlrYD0qyMe3MNK00QwrViTHsn/CQMY+r+oUBtYWY74m
 YtCd5TzfD7WIyXbe/xDIdXZKGk2uVrXsfzuZs9bhpnskESViPyHqjLWVPqPFWxjKh1UxnCVb3
 Ph9ySRp2++SxtOiBe6FMtCJABao51mIzCC9Q9dhq3zmOAvXhqQJZyU05SrskHBDsD5r6YslNd
 P+RJnQ0IW+HzpsIkHuD92et7sotWqpiq5TWdHe/YlhpaklLUiZhNcQKgViBx/NYS0nyja+pJQ
 9i3S2AHC2Bub3rb1hsXf2msXna25SKTcnpIGfg/dOo9MhhJTPMmM06ddSHomsdJdmCY9zb6nY
 JFsA8ZS8TYKgVXeZNTgntplIirjUbpit64KbBaT5ZncfJcoq/ShVHOLY4ICV0XujTAYGeRP5e
 MnRShSvaVhWMGQroq2Wa12W5dmMDj6+wRb3n8PuKKR6myLWWxmEskrXu2OiNrvj0TmHLSHqOS
 kk5CmRytB07NJAC9QftR2lhC1jnOOko4uxaLoefvwIgP/lL60etz+F87cMCuoIwYm2xgFfd/A
 XDOeVM2Ez+9EyBzm+sduCCxs7NsrMrUqGThXXvXOboWn9fZRHd8+QPxIiXPTwHfKd82M=
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Sat, Jan 15, 2022 at 8:32 PM Laurent Vivier <laurent@vivier.eu> wrote:

> +
> +/* goldfish endianness depends on CPU endianness */
> +#ifdef CONFIG_CPU_BIG_ENDIAN
> +#define goldfish_ioread32 ioread32be
> +#define goldfish_iowrite32 iowrite32be
> +#else
> +#define goldfish_ioread32 ioread32
> +#define goldfish_iowrite32 iowrite32
> +#endif

This is not what I meant here, as you are breaking big-endian support
for all other
architectures in the process.

On architectures that support both big-endian and little-endian kernels, devices
(including emulated ones) can't know which type of kernel you are running, so
this has to be fixed by architecture. Ideally this macro should be in
an architecture
specific header file, but you can also just make this a check for m68k and  hope
that qemu doesn't duplicate this bug on architectures that gain support for this
driver in the future.

         Arnd
