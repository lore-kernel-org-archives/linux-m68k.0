Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9F8AC47087
	for <linux-m68k@archiver.kernel.org>; Fri, 28 May 2021 09:29:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B0AC26128B
	for <linux-m68k@archiver.kernel.org>; Fri, 28 May 2021 09:29:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234595AbhE1JbA convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 28 May 2021 05:31:00 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:53225 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234153AbhE1Ja7 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 28 May 2021 05:30:59 -0400
Received: from mail-wr1-f52.google.com ([209.85.221.52]) by
 mrelayeu.kundenserver.de (mreue106 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MEFCF-1lf60n07CX-00AGBV for <linux-m68k@lists.linux-m68k.org>; Fri, 28
 May 2021 11:29:24 +0200
Received: by mail-wr1-f52.google.com with SMTP id j14so2600534wrq.5
        for <linux-m68k@lists.linux-m68k.org>; Fri, 28 May 2021 02:29:23 -0700 (PDT)
X-Gm-Message-State: AOAM5305cAt6V8jj79YuS03Eh4L1+axjIJesNINuH5cxnwK0nuM5dtNi
        wm6qCWG8mOZkBiBStHzk6JWYFrBcZnusXSigW30=
X-Google-Smtp-Source: ABdhPJywgALYfevaZchWg8EzzxwlRe7/w4FsfnLHzqy7k0scBlUV9N7AwRL3lgV5nPFvp2XIyNLmAh0ZEV+CX3zrcmU=
X-Received: by 2002:a5d:53cc:: with SMTP id a12mr7140748wrw.99.1622194163736;
 Fri, 28 May 2021 02:29:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210523232556.15017-1-digetx@gmail.com> <CAMuHMdWqNngrDQOut1r5aD1Nk5BMXEV4m8+OBix4DXOV6OSpNg@mail.gmail.com>
 <8b6af8c0-6f01-193f-1eb4-4e230871f0cd@gmail.com> <f12b4622-6cea-ac65-2d94-f50a85c29215@canonical.com>
 <CAMuHMdW_G259Nwx1EEf38h0AcVH8yjmjqp9Mh-vQ4LJJMzD8Dg@mail.gmail.com>
 <2e5bb7c2-62d9-b1f7-7f35-2b379d3692d5@gmail.com> <3661fdba-ad32-5d16-7714-1ebc58caf435@infradead.org>
In-Reply-To: <3661fdba-ad32-5d16-7714-1ebc58caf435@infradead.org>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Fri, 28 May 2021 11:27:54 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0hZGEOh0jckDvt-386KopCCL09RM6hv4qAUie31LDSTQ@mail.gmail.com>
Message-ID: <CAK8P3a0hZGEOh0jckDvt-386KopCCL09RM6hv4qAUie31LDSTQ@mail.gmail.com>
Subject: Re: [PATCH v1] kbuild: Disable compile testing if HAVE_LEGACY_CLK enabled
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Dmitry Osipenko <digetx@gmail.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Tony Lindgren <tony@atomide.com>,
        Paul Burton <paul.burton@mips.com>,
        John Crispin <john@phrozen.org>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:TI ETHERNET SWITCH DRIVER (CPSW)" 
        <linux-omap@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Provags-ID: V03:K1:1LvEM4DFAIBepwazJz/HWvvwCGPDVZFRKeL6Ye2C6EH4/2wq7qU
 nzQRqoirOEdEmOZQbXHCUa7BKFr8ORvbhbYZqtAR+BxaYfkTAjYAwTQhuBbL27/VQNazdI5
 Y6zAUSGhdYyGajtgKehJBjU6AOP3uFbzOwVDkN7OSmfrAIcOyExMEAWfl6NrU7vYiLBnUiD
 DM9AxYt0i8OsuFvRgBMtA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:tzGCPvxjsE0=:NofyHen0nQ4iWv7L5HxdHC
 OOVHzZs1XYywACQMq986OcBatU532ZPgg/6ScOKbbuGwkgJ9BF/gQEedRDKdzDQodKxEHM77o
 1Z2oURzRF7tH7hqsI8IBQAqQybRyQ7syOeMdD4MsuD8UzGV5bJt4/CpKOLA7WjO3uJmS8jitS
 T+VvgSbEsQlRT7Fq6mV2onG/rBwF6OCTAT/OhVtNDelNxuPvMrc8631I3OlDhHveZluFbCDsO
 bjvqKS2kaHbUhXzCWk3x7cHuRI6xJGWdqxdlUm3SeORMTG0neitwkgJk3hKMAgmVNQspA/OHk
 6ZAEwAPfLL909XFP8RBrtIVceTeS/9bZjkWgjmtGv0D9fjB807RjYve0FQARbRzpQLqXKWWQn
 2CYXb9zsit6lgpruc+ENi4I1h4NZ0t/Vq0XA7B6Nv6GXQwDfbolOgO4255YSDBTvJ0g8ct2k7
 GUqDOg2gnyEpRWN4eAB85eDcFhn5mGFwJf6TtaOh+PWJwNA5Vw/Tzt7AafviZ9dG7/DW+QYm8
 GxyQO6+v5haTkxPI3ePwZX6dUjq0Ng5/Mz9j9h2F5NQlY+/aRbfHoV3m5AaIfvdYZ+vK5g3ai
 VYAIkZZwCefvWPLtPhnAKDLq67DdlTB3Z2aAAngdiXAah2HLLpHSDTyd8S9gBNkrBHbzdZyT4
 CwAk=
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Wed, May 26, 2021 at 2:39 AM Randy Dunlap <rdunlap@infradead.org> wrote:
> On 5/25/21 2:29 PM, Dmitry Osipenko wrote:
> > 25.05.2021 15:19, Geert Uytterhoeven пишет:
> If you are messing around with HAVE_LEGACY_CLK and COMMON_CLK
> and don't mind, please have a look at this report from
> 'kernel test robot':
>   https://lore.kernel.org/lkml/202103162301.oomY9NwI-lkp@intel.com/
>
>
> Maybe this one is more MIPS-specific. I dunno.
> I tried to come up with a patch for it and failed.
>
> I will be happy to built-test any patches that you come up with.
>
> Maybe I have just looked at this too long...

This is exactly the case that Dmitry is trying to solve. The problem
is that bcm63xx
and lantiq set CONFIG_HAVE_LEGACY_CLK but lack the clk_set_parent()
and clk_get_parent() functions. We could add the same stubs for these
two that we have for the other legacy clk implementations, or rework the
handling of legacy clocks completely.

       Arnd
