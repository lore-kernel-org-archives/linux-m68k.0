Return-Path: <SRS0=K7iR=5Z=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91C33C2D0EA
	for <linux-m68k@archiver.kernel.org>; Thu,  9 Apr 2020 08:58:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5C9D220730
	for <linux-m68k@archiver.kernel.org>; Thu,  9 Apr 2020 08:58:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726582AbgDII6z (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 9 Apr 2020 04:58:55 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:52167 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725972AbgDII6z (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 9 Apr 2020 04:58:55 -0400
Received: from mail-qt1-f172.google.com ([209.85.160.172]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1MoOIi-1iy7de1orY-00orM5 for <linux-m68k@lists.linux-m68k.org>; Thu, 09
 Apr 2020 10:58:54 +0200
Received: by mail-qt1-f172.google.com with SMTP id x2so2205287qtr.0
        for <linux-m68k@lists.linux-m68k.org>; Thu, 09 Apr 2020 01:58:54 -0700 (PDT)
X-Gm-Message-State: AGi0PuaXyCdcuo7XHr6WQcLMXpeFY/RcAGOvtRM3Qot9ly+m5c85+XnR
        sEH/Nd2JNsKMEwkInTPdaupJ+nsIpikPIFcFby0=
X-Google-Smtp-Source: APiQypJGQnSKvwEmA3Uxqr21N7C28AlJ4H4USNdYjJ7jBa7oUXIlp/5GQn3RknUCUlZR5y4GP5LLx3U/KPQi69ASHsQ=
X-Received: by 2002:aed:3b4c:: with SMTP id q12mr10854453qte.18.1586422733282;
 Thu, 09 Apr 2020 01:58:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200409064416.83340-1-sboyd@kernel.org>
In-Reply-To: <20200409064416.83340-1-sboyd@kernel.org>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Thu, 9 Apr 2020 10:58:36 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1mOS4bVs+FQNcWPXuAdXpB-rKAuRE-at-Pr0m=43D68g@mail.gmail.com>
Message-ID: <CAK8P3a1mOS4bVs+FQNcWPXuAdXpB-rKAuRE-at-Pr0m=43D68g@mail.gmail.com>
Subject: Re: [PATCH v2 00/10] Allow COMMON_CLK to be selectable
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Alexander Shiyan <shc_work@mail.ru>,
        =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
        Aurelien Jacquiot <jacquiot.aurelien@gmail.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Huacai Chen <chenhc@lemote.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Guan Xuetao <gxt@pku.edu.cn>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-c6x-dev@linux-c6x.org,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        Linux-sh list <linux-sh@vger.kernel.org>,
        Lubomir Rintel <lkundrak@v3.sk>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Mark Salter <msalter@redhat.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Paul Burton <paulburton@kernel.org>,
        Paul Walmsley <paul@pwsan.com>, Rich Felker <dalias@libc.org>,
        Russell King <linux@armlinux.org.uk>,
        Thierry Reding <treding@nvidia.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Tony Prisk <linux@prisktech.co.nz>,
        "moderated list:H8/300 ARCHITECTURE" 
        <uclinux-h8-devel@lists.sourceforge.jp>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Will Deacon <will@kernel.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:xZVR8DhM2eMJA6u20BqFK/uptu3q8wm5QlBFf+rqfYPOkJs2Zsl
 Ez+hRbSowdf+/KMYNEiYkoGI2l+U1b4HHTisu8UdY8EuJmgr5+in3UGjKwOqQy2ScnkXDQb
 w9QcF349ZZDsoPqU0fIQZ0TdLA/PmJXvbaHlyeaTZrktMm04KO+pZ7jhJtiFe4Nw3EMvC2D
 WNCEmBwh9+T3qpit9EBRQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:2sQiQVCk5/c=:1TaTHZ0qs7c6WCiXcKk9Y1
 L+PDULYskZ8YlcDa/Aby0V5xkRl7SeZ9PKtj34xNaYx1ufc/qVqYfY3ClvBeCjvJx3OP/bxry
 soYKndBs5Hh+T2fPw5nm+PlCy6Ut8LHdfC/m76MjXV2H2VaQ77FNkTynRXgTMv73iIBTbFD+7
 9XjJDBhXqE6I2zmfY3tiFYcQHPxVCNP2CWLCwF8JtztUmIWujZOAa+jy94NhtLyRYWJA+LJ3I
 A2TOR+AicxQD5wx7NqAg2woURvFfauogo1nzxM34a/Nr8HMTm9MO9Ym9gHkKcroqIT2lOTMKZ
 lgSbSUuZrs+gh1Wg7+n0eXv8oa23t4TsdGTd5PnO70IdPC0jieKHTcdFR7e9HbuHz2t3Re2qU
 3SKY3MAajwnQCsRWJ1LD/iKX7SqEOvk3KwF0j5uHypnAh8lxcsw3YEFCezkK6pDbab5846mSD
 lgPWxUBcKWGGTcVinWRgzBgBUgHvggrEAyQfaOu5ySMkqlKAkHK6gMfycB9QqTZ6UITA9izrq
 qE2xd3xGvu20mScctu3Bx33toC37SQsSkR7gDAopQbaNssqxgLNnfY6sNvQX9ZDb625lhghnl
 IdGjMBmONii8FIk65iTRdxbp+YmF4uZkYWSyAITV3VvMvd9qu0lgqZSD+ND0EhCkXD0oWlqoK
 Jtq9j1LYfDCZ8byTRedmRVmZxr+9wIPCu3SdrWf8UObMmcPzSeA+FQiFajTTd5HIEvnORSYzK
 RBXp0p0XfwatYLthaFFY8JMDW13C2WdBRm2w4lFZWu8NxuVugMUtK8O/nt5KDwtDXaM0yjsfK
 26lubhwLFvHND94piuOk9BKISzt5d1o8uR08gejW/ZTpOT54l8=
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Thu, Apr 9, 2020 at 8:44 AM Stephen Boyd <sboyd@kernel.org> wrote:
>
> This patch series cleans up a handful of selects that were redundant and
> deletes presumably dead code with the goal of making it possible to add
> kunit tests for the CCF in the future. To do that, we introduce a
> "legacy" clk Kconfig option to mark code that hasn't migrated to the
> common clk framework and then make the COMMON_CLK config option visible
> in the menuconfig as long as that legacy option isn't enabled. I've also
> included a couple patches at the end that may be more controversial but
> helped me consolidate all this logic/code.
>
> I haven't done more than compile test a few configs for arm, arm64,
> h8300, and mips. More testing is welcome.
>
> The plan is that I'll just merge the whole pile through the clk tree. If
> the first five patches or the last three patches are better going
> through another tree like arm-soc or architecture trees that's fine too,
> but there are potential conflicts between trees so maybe it's better to
> just leave it all in one tree.
>
> Changes from v1:
>  * Fixed MIPS ralink build problem pointed out by Arnd
>  * Fixed meson mx sdio build due to bad Kconfig exposed by this change
>  * Picked up acks

Whole series

Reviewed-by: Arnd Bergmann <arnd@arndb.de>

I also made a patch to completely remove the private clk implementation
for mips/loongson2f, but it obviously clashes with your series at the moment.

I'll send you what I have today and you can decide if you want to
add it to your series after it gets an Ack from the maintainers, or I'll
send it separately later.

     Arnd
