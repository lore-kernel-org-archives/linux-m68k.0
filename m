Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61F46C433EF
	for <linux-m68k@archiver.kernel.org>; Thu, 13 Jan 2022 11:43:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233450AbiAMLnF convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 13 Jan 2022 06:43:05 -0500
Received: from mout.kundenserver.de ([212.227.126.133]:56925 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232638AbiAMLnE (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 13 Jan 2022 06:43:04 -0500
Received: from mail-wm1-f46.google.com ([209.85.128.46]) by
 mrelayeu.kundenserver.de (mreue010 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MgeXk-1mgbud1crs-00h7a4 for <linux-m68k@lists.linux-m68k.org>; Thu, 13 Jan
 2022 12:43:03 +0100
Received: by mail-wm1-f46.google.com with SMTP id e5so3653039wmq.1
        for <linux-m68k@lists.linux-m68k.org>; Thu, 13 Jan 2022 03:43:03 -0800 (PST)
X-Gm-Message-State: AOAM530jbJDmpn042chWW7Fw0Xgd6VjiO3a+SuMUG31Ta1Ou72ISmgex
        fNTO14kf/kVys4nk/G29Raywv5+K1OCAmMgWO2o=
X-Google-Smtp-Source: ABdhPJxwX82RKjcZ7lo6/WdyVIEJ5Vjk6IOkFYcqrpqtCJt+H5PWX05QDE08ehIn3XiMfT4yqHLHIp8+V4wVfcchO3Q=
X-Received: by 2002:a7b:c1cc:: with SMTP id a12mr3431122wmj.35.1642074182910;
 Thu, 13 Jan 2022 03:43:02 -0800 (PST)
MIME-Version: 1.0
References: <20220113103559.2577216-1-laurent@vivier.eu> <20220113103559.2577216-4-laurent@vivier.eu>
 <CAK8P3a2_cJi9+SNi9gK6+5kpBo4wmVw4hz42Bq_jm1+s6AvENQ@mail.gmail.com> <8c0b3146-35ee-b0b2-468b-1c8dcdaf64ee@vivier.eu>
In-Reply-To: <8c0b3146-35ee-b0b2-468b-1c8dcdaf64ee@vivier.eu>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Thu, 13 Jan 2022 12:42:46 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0GYm=Q5aPJuJJ7JoBQw4+QokgkMKv_D+YgYfzPODRYSQ@mail.gmail.com>
Message-ID: <CAK8P3a0GYm=Q5aPJuJJ7JoBQw4+QokgkMKv_D+YgYfzPODRYSQ@mail.gmail.com>
Subject: Re: [PATCH v5 3/3] m68k: virt: Remove LEGACY_TIMER_TICK
To:     Laurent Vivier <laurent@vivier.eu>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        linux-rtc@vger.kernel.org, John Stultz <john.stultz@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Stephen Boyd <sboyd@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Provags-ID: V03:K1:/iQNgiwBCzL5Z7YGPv3Pg5eOaQoqNemPUFjONpQYzcfCBEXPVx8
 a2mxH4Ir5VzcuUgqTzLrSUiXE2D2p+dIJY2kpFTI3yPaGRO9xUVETlqzdZ04lamajxReZIX
 H1V9AhSzt2yzMa3ACpTQJVuQKwCTnpM3xJdh7Hfb4um+yevfBDbe/vcKR2wdTac5lo7uqwX
 D2dK9qgkYRKt+sRdhgawQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:qXZROOcoTWM=:VCXQ0vr1wDfDZ6L+zWuYSr
 Nx7ImKTeu4DyAvYZSCTVDnUIi/kAfp1punaOIm9M7E31qnx50hqdhenGBq2bFs2Ywzzoy0cXF
 hs88ziLV2bkcKAuWCXS0B3Z8Rx9zljK9ymVOVOL5JrDBDM1HRCrt49KOb4qYBIyssldoosC5Z
 4Tz5Zc2w96tY2sMmA3xjbnffgphe0NYAVhbBTddt5271BN7TJt2ocZHGz3dHqmIrPlTKxR5JC
 Yj2uyPQbndsuOjANHpd7tU5dJ0QiluIhIHUmkNNzavYZ2thBxdsJUB/DtsGzyEgtMNUL2RE3P
 jpehxeWBdX0bVM78Qz5h1VIeK314152ufpBo4W588y27bqsYW+gpswNvL1PbgClzqA3/3yRnp
 fvHA/EqUtl5apYRIRO9btGo3+pu05exTFItDURLQ5EVV3b8oHVstlPj4C0Gr7TVYrDNZztyWt
 8L0vxJIqQzIBVw/xsYHs4A/LFa4nN6BwVLGGt6EgxxoOs2x1xdWy8veZompJPTxNmUf3u9f//
 cViG+HwoA++kfH+U9C3l5MZytxe9kPrpX0zGTuApR8kHfXDYUtFc4eaPGdBgfoSq5ffZnLNDw
 pwupledONKU1MDVf0WXNbpGhTKmQVkA/WSnaCxr/UudYB3YWRFKE/J/P8DhfXPTR6RUZ7Kg3j
 vh/pAcjWPkwHjxnYK9dSzRdZdr/FOsItRxzAji6P/CPduUTvcSB2wlxMYhb1rIQ7o09sBs54W
 +MJxXvySvvKSc1gjgBV+8PcOCbLA0gU6H0UMk8iY9hGKllEAOIdC6cDN+3/b9f2NfzBkufDW4
 pc3IuN/bKASrs47He0LGVtZYAAib+ceF/3yCCYalLl2xC115CQ=
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Thu, Jan 13, 2022 at 12:32 PM Laurent Vivier <laurent@vivier.eu> wrote:
> Le 13/01/2022 à 12:20, Arnd Bergmann a écrit :
> > On Thu, Jan 13, 2022 at 11:35 AM Laurent Vivier <laurent@vivier.eu> wrote:
> >>
> >> Move virt machine to generic clockevents.
> >>
> >> cc: Arnd Bergmann <arnd@arndb.de>
> >> Signed-off-by: Laurent Vivier <laurent@vivier.eu>
> >
> > The change looks good, but it appears that you only just add the legacy code
> > in the same series, and it would be easier to just add the correct version
> > first.
>
> In fact, I'd like to keep it separated for two reasons:
> - it can be used as an example for people that want to move from legacy to clockevents,
> - the machine with legacy timer tick is in use for more than one year by debian to propose a m68k
> buildd and dev machine, so it is really well tested and robust. If there is a bug in my clockevents
> use it will be easier to detect.

In general, it should be easier to do a correct generic driver than
an implementation for the legacy interface.

> >> diff --git a/arch/m68k/virt/timer.c b/arch/m68k/virt/timer.c
> >> index 843bf6ed7e1a..767b01f75abb 100644
> >> --- a/arch/m68k/virt/timer.c
> >> +++ b/arch/m68k/virt/timer.c
> >
> > How about moving the entire file to drivers/clocksource/timer-goldfish.c?
> > It shouldn't even be architecture specific any more at this point. It probably
> > still is in practice, but that could be addressed when another architecture
> > wants to share the implementation.
>
> For the moment I'd like to have my m68k virt machine merged, and I think it will be easier if I hit
> only one subsystem/maintainer. Moreover I don't know if I use correctly the goldfish-rtc,  so for
> the moment I think it's better if I keep it hidden in arch/m68k/virt.
>
> But I can propose to send a patch to move this code to drivers/clocksource/timer-goldfish.c once the
> machine is merged.

If you are not sure about that implementation, I would think that's an
extra reason to
submit it to the clocksource maintainers for review (added to Cc
here). You should still
be able to merge the driver in the new location through the m68k tree
as part of your
series, but regardless of where it goes I think it needs an Ack from them.

        Arnd
