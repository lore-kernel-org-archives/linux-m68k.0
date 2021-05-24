Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E808FC04FF3
	for <linux-m68k@archiver.kernel.org>; Mon, 24 May 2021 08:55:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CEF7560698
	for <linux-m68k@archiver.kernel.org>; Mon, 24 May 2021 08:55:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232474AbhEXI4g (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 24 May 2021 04:56:36 -0400
Received: from mail-ua1-f44.google.com ([209.85.222.44]:44666 "EHLO
        mail-ua1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232473AbhEXI4g (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 24 May 2021 04:56:36 -0400
Received: by mail-ua1-f44.google.com with SMTP id 68so1110507uao.11
        for <linux-m68k@lists.linux-m68k.org>; Mon, 24 May 2021 01:55:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5H0qZkzumrdkYcAyVjQDQA6Hje2p2FxbSu2Plzs94Cg=;
        b=ADT01EEPpTja2U0JuiPwl4FuLpMDEe06Ntwd+Lg7siUBaq49Ny90NpjWCtOWIv8bl2
         IX7IG04BUTuNswgHjzILRsNsiI34yZC/JfW0PPbM2Iequh+3EznHvOiV+EtGo8Skdx5E
         BO3/GEJhtV9ApNSKVWiQWoQAILm3wIDFm8lOf3fED2g3c2UQ6SdnyYQLMZ2G/6FbunA6
         AyXsYh536cxJzueb+9R9ViiHfFDVJd1V0kUltx3vCsFaO90TShGyCOlC8MB1XSj7n4g5
         Q7+1yKymYnhnN2UyHzuRJj1NXiTiFOzrcbJmHwGFTdOPOKyv+l2/tTqQjsDJ2Od2QqHi
         VySg==
X-Gm-Message-State: AOAM531mG7J8ziBkTobrEwBM08UpjOezBh4FIj1DIqlUdMTsJu8NCfpd
        OWRmuYOIW8BrA4PoNxn+QBXzgaLlbj7HLJkVGp0=
X-Google-Smtp-Source: ABdhPJxxyosYrdj1GqNypPiBnYRArw2E3/38homNMO1Av1PFu0RXXr0Dh8t9Utur9chqZtb0X55m4PfZQwmS3BcBlZQ=
X-Received: by 2002:ab0:7705:: with SMTP id z5mr20481974uaq.2.1621846508208;
 Mon, 24 May 2021 01:55:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210523232556.15017-1-digetx@gmail.com>
In-Reply-To: <20210523232556.15017-1-digetx@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 24 May 2021 10:54:57 +0200
Message-ID: <CAMuHMdWqNngrDQOut1r5aD1Nk5BMXEV4m8+OBix4DXOV6OSpNg@mail.gmail.com>
Subject: Re: [PATCH v1] kbuild: Disable compile testing if HAVE_LEGACY_CLK enabled
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Tony Lindgren <tony@atomide.com>,
        Arnd Bergmann <arnd@arndb.de>,
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
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Dmitry,

On Mon, May 24, 2021 at 1:26 AM Dmitry Osipenko <digetx@gmail.com> wrote:
> There are couple older platforms that can't be compile-tested because they
> partially implement CLK API. It causes build failure of kernel drivers due
> to the missing symbols of the unimplemented part of CLK API.
>
> These platforms are: ARM EP93XX, ARM OMAP1, m68k ColdFire, MIPS AR7,
>                      MIPS Ralink.
>
> Disable compile-testing for HAVE_LEGACY_CLK=y.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>

Thanks for your patch!

> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -131,7 +131,7 @@ config INIT_ENV_ARG_LIMIT
>
>  config COMPILE_TEST
>         bool "Compile also drivers which will not load"
> -       depends on HAS_IOMEM
> +       depends on HAS_IOMEM && !HAVE_LEGACY_CLK

That sounds a bit drastic to me.  Usually we just try to implement the
missing functionality, or provide stubs.
Which functions are missing?

>         help
>           Some drivers can be compiled on a different platform than they are
>           intended to be run on. Despite they cannot be loaded there (or even

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
