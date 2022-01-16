Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FD91C433F5
	for <linux-m68k@archiver.kernel.org>; Sun, 16 Jan 2022 16:20:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235565AbiAPQUB (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sun, 16 Jan 2022 11:20:01 -0500
Received: from mout.kundenserver.de ([212.227.17.10]:50471 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235543AbiAPQUB (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sun, 16 Jan 2022 11:20:01 -0500
Received: from mail-wm1-f49.google.com ([209.85.128.49]) by
 mrelayeu.kundenserver.de (mreue106 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1Mg6qO-1mg92131e2-00hdvN for <linux-m68k@lists.linux-m68k.org>; Sun, 16
 Jan 2022 17:19:59 +0100
Received: by mail-wm1-f49.google.com with SMTP id bg19-20020a05600c3c9300b0034565e837b6so6404747wmb.1
        for <linux-m68k@lists.linux-m68k.org>; Sun, 16 Jan 2022 08:19:59 -0800 (PST)
X-Gm-Message-State: AOAM530uby1MCvgW3oqTGsuyaqONjAamfenFXqa2BK9vmrf983iplMoy
        FSFr6gye8lrZc62+Q5yJ7JwgVby7mu3gn14U0eo=
X-Google-Smtp-Source: ABdhPJwLndypdoZqcgVySXUrUaTHtCgNSa0LHq+rQ0wsbDBGYparskmUw5otmdG9JKYAHAXXiKO0Lvzj6vDV3ZLvoZo=
X-Received: by 2002:a05:600c:5c1:: with SMTP id p1mr23740237wmd.1.1642349999360;
 Sun, 16 Jan 2022 08:19:59 -0800 (PST)
MIME-Version: 1.0
References: <20220115193245.3777833-1-laurent@vivier.eu> <20220115193245.3777833-4-laurent@vivier.eu>
 <CAK8P3a13g_o4mTsOO-4b=WU6TGRHubY7HCt1x1FdXpVmjy6-Sg@mail.gmail.com> <77e747de-c7d6-314d-e0b0-58852d463326@vivier.eu>
In-Reply-To: <77e747de-c7d6-314d-e0b0-58852d463326@vivier.eu>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Sun, 16 Jan 2022 17:19:43 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1i_ngEaqhsy4xNrQV8=d1jY=JTxGNNUqOZ0g0to5bw8Q@mail.gmail.com>
Message-ID: <CAK8P3a1i_ngEaqhsy4xNrQV8=d1jY=JTxGNNUqOZ0g0to5bw8Q@mail.gmail.com>
Subject: Re: [PATCH v8 3/4] clocksource/drivers: Add a goldfish-timer clocksource
To:     Laurent Vivier <laurent@vivier.eu>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        John Stultz <john.stultz@linaro.org>,
        linux-rtc@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:9/zanKaccaoMqwIrnqrjXXhwQCYoJArgkP3pVUIvh8+sMufGufp
 0BxA5u1WEOIQtbvuNKiR6gpUKvMMbrvyoNd1EeQoM9nRK1S+VWmHrM5BW4+g5FEP+FhmETH
 BLz21rsmeLMSZYBinfo1ISwlyvXld0JSSkHekft5SU64sBH9a5Q88UkFZ6ceS780wjtz8Dj
 d0XPqzHRiAy1uoUK4ohMA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Z26QeK4V6+Q=:45epP19JtylAWQHLzLANsu
 k9owl8zZ0NIHXfM31ZYcqJoqPGN9qW6vBlT71TTkmYOJhq23jmp5qbs6VbUWlKa7nf63N71oq
 xsj0E7rCuZcfywqmDtrwC4ME8xNaJFMAp4HAoYCu3xvQcO35t/BHlsgGbYwchKfBgJAz7h+Z+
 k9/LQROHyHyTUKXykzq95kEPGlYiX4wC0gEYechyFhOhmcjle28NvUuvgjRpzNOXrg6WPLRVe
 NshMuYAaDE2IZtTqVQMowz7r/vVz4y6xZIfm9JKXj25aXiAzE+5BU4vaRHBIYj5XXaHski9xz
 CSwVU/N3EWz+mw9Nh53SYpLb7u70iduYS/iqweTbNJOghrhnD/8vMaNx2WLDfOxwG7dvJjfM0
 H7o29iOTrDCbuW2gAz79UoiWPNOJgOhE183TU/tWWKcZuRfcfCLwXDRoU+9f+4+q4NzvHeQpC
 DOm/maoGptHDJHSSt5u7U3qROCThAfsdg/xBN5FTcynejFhKo2b9aFBAa5Ncb9A0OmZ3JFPBc
 mEr92/DUgllZQBUrLFKrUwSiTzm0+V+PlifT5z5hbtJsBJb7api/Yv5wlvHTSkgCnkKU3JiA3
 0EWMsqRh+f1/s5EerjExVud7WY2VDaCRGOiHa8Ts55ePkCT9K7QWOqMSESZKDWeeoRezzPD64
 XAEpkLxUWeLUcs9n8PDvattHxJ9hfg88F4PoYc/FP990J8DOzmWQv2AIFomTn0u6e95Q39ws1
 V3o4bR8DN7w6eH5IBVdAWtzVqH+8Gq/oETtKTBiYSdnrF2Fy8kKw2VHFiuj3WU9Mi3YMB79yQ
 iSWSCZ4iYElDQ1Ti9OaKDganGnQurY4AhsxRHsSZm9jg7J7PMM=
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Sun, Jan 16, 2022 at 12:54 PM Laurent Vivier <laurent@vivier.eu> wrote:
>
> Virtio has exactly the same problem in the past (prio to v1.0), and it uses __LITTLE_ENDIAN in
> virtio_legacy_is_little_endian() to know the endianness of the device.

Right, that was my point, let's not duplicate the bug from pre-standard virtio.

> So the code can become:
>
> #ifdef __LITTLE_ENDIAN
> #define goldfish_ioread32 ioread32
> #define goldfish_iowrite32 iowrite32
> #else
> #define goldfish_ioread32 ioread32be
> #define goldfish_iowrite32 iowrite32be
> #endif

This is exactly the same as what you had before, it continues to break when
host and guest disagree on the endianess.

> What do you prefer: CONFIG_M68K or __LITTLE_ENDIAN?

Checking for CONFIG_M68K at least has a chance of working, provided
that all existing qemu implementations agree on the semantics here.

       Arnd
