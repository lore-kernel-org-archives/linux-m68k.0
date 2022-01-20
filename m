Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F406C433FE
	for <linux-m68k@archiver.kernel.org>; Thu, 20 Jan 2022 08:50:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359391AbiATIuu (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 20 Jan 2022 03:50:50 -0500
Received: from mout.kundenserver.de ([212.227.126.133]:49679 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241250AbiATIus (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 20 Jan 2022 03:50:48 -0500
Received: from mail-wm1-f46.google.com ([209.85.128.46]) by
 mrelayeu.kundenserver.de (mreue009 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1Mv2tE-1mJsZD0uae-00qz1J for <linux-m68k@lists.linux-m68k.org>; Thu, 20 Jan
 2022 09:50:47 +0100
Received: by mail-wm1-f46.google.com with SMTP id i187-20020a1c3bc4000000b0034d2ed1be2aso18739176wma.1
        for <linux-m68k@lists.linux-m68k.org>; Thu, 20 Jan 2022 00:50:47 -0800 (PST)
X-Gm-Message-State: AOAM531FPISAKcEPGB+JYAC+HQ2k+BztR4dthfogMlehhR+yI70ZAVXe
        1aWwNrgkOwcDPNg1Dn7ne5VETxq/Tdb5iFZuG1Y=
X-Google-Smtp-Source: ABdhPJwa2TLFWWtVzRt+gvdo3caSsHZVcnbUi/A/hVZ7P0/vZnDNJpHv52UMEl2oHT4PQoB1G9hWQmqPRnKWtHwc0qw=
X-Received: by 2002:a1c:2784:: with SMTP id n126mr5427772wmn.1.1642668646881;
 Thu, 20 Jan 2022 00:50:46 -0800 (PST)
MIME-Version: 1.0
References: <20220120080347.1595379-1-laurent@vivier.eu> <20220120080347.1595379-3-laurent@vivier.eu>
In-Reply-To: <20220120080347.1595379-3-laurent@vivier.eu>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Thu, 20 Jan 2022 09:50:30 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1oN8NrUjkh2X8jHQbyz42Xo6GSa=5n0gD6vQcXRjmq1Q@mail.gmail.com>
Message-ID: <CAK8P3a1oN8NrUjkh2X8jHQbyz42Xo6GSa=5n0gD6vQcXRjmq1Q@mail.gmail.com>
Subject: Re: [PATCH v11 2/5] tty: goldfish: introduce gf_ioread32()/gf_iowrite32()
To:     Laurent Vivier <laurent@vivier.eu>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        linux-rtc@vger.kernel.org, John Stultz <john.stultz@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Stephen Boyd <sboyd@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:Vj1mYQMCKu9345x7Sw0E+MCV/jb1Y0PEbDysnSEvQHtmEcSKqud
 GcHRzeLAJoTBuuTYApO1Agv8Avhr9rcuheCIMAlGDNoz8RYEd9WRROB5uA+C60GHwhvNvV4
 ak2By5mBY/CHYKj8vnWbeDnkGRDHnIdTG0wurz6LuF9V8O/a8fEXsGf0JEiVFQ0y9TfMJ0V
 jVjtk0YH3Ym4FXxG+exwA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:uAveEqGMCrA=:hZRzqsO2UghsurIO8oX5mc
 VXAZBbeGSobS51ax/i30Fe3pX7pXeMNJD0hCSL9b5Tkceu9TYsAPMWTSM/eIIb8FZ7DZCWD0/
 OUzfevRyEDUbfbXzRALiK0Fl4vKvLbI4AmSvSVRV1r/pGvAa0HGBkNxwuH/wamy6Ai9soInt6
 9X0OoikUCxq/nHMkD+WJ6vUWTIVCSVpRu7TtAyvx4gMycefuWUYAvUoV9/i30dM39hNmzoDd6
 FfIDqGH6ZUAJt+o23njxHu7fMuQg/ktmAwnnIBdPUa2DFa2JvF0Ug2q2cIrZ1swyOGvxHxyTf
 cKAM1UDv3aDnQs0XpIWAIdq4KC0yEB0vfGDQJhZbn9ws6ia/4Rvy1hNl0wLGFbqHFx72rybWw
 NSSm3p2SD/CosE+zDqf1j5+g3ZU4ZWmEDbMIy17PczbJz/LkwQU+9M7yj0sgxNTV8K/7sRp1v
 BsNVvkLpMGrfDShzCN7L20KELlA5Uxei+phos3bOAWjZRAB6KkpjQOToIcuWrC4ENT+VgLVcT
 LeJTz9mvWaNsqBaw4NwsVrjJTGavjdYF5zknPpaMgcgj72Z3kuj9QizmwQCGteZwr7iPviQOb
 aLK+Zso4G3dJ6r8FHSPRjdRAbwGYrqKiiSc3B6fooILS0Khn5j4bN8r1NV9/t7weNJ6EbZP4G
 Q3sj+byUib5RhxY+aub9z9cUjkE8FEqhfjT63R+HAFfH88ETzeQArrGxkKrzzrG0QUXI=
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Thu, Jan 20, 2022 at 9:03 AM Laurent Vivier <laurent@vivier.eu> wrote:
>
> Revert
> commit da31de35cd2f ("tty: goldfish: use __raw_writel()/__raw_readl()")
>
> to use accessors defined by the architecture.
>
> Define by default the accessor to be little-endian as we
> have only little-endian architectures using goldfish devices.
>
> Signed-off-by: Laurent Vivier <laurent@vivier.eu>

The patch looks good, but the description seems wrong to me:

Talking about "little-endian architectures" makes no sense here, the
point is that the device was clearly defined as having little-endian
registers, and your earlier patch broke this driver when running
on big-endian kernels (if anyone ever tried this).

This means you should also add

Cc: stable@vger.kernel.org # v5.11+
Fixes: da31de35cd2f ("tty: goldfish: use __raw_writel()/__raw_readl()")

The fact that m68k gets this wrong is just a bug in qemu, but it's
probably impossible to fix that since there is no way of knowing which
other operating systems have started relying on that bug over the years.

It might be a good idea to revisit the qemu implementation and make
sure that the extra byteswap is only inserted on m68k and not on
other targets, but hopefully there are no new targets based on goldfish
anymore and we don't need to care.

        Arnd
