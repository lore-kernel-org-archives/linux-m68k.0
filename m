Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AA65C47080
	for <linux-m68k@archiver.kernel.org>; Tue,  1 Jun 2021 09:02:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7B2A1610C9
	for <linux-m68k@archiver.kernel.org>; Tue,  1 Jun 2021 09:02:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233642AbhFAJEV (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 1 Jun 2021 05:04:21 -0400
Received: from mail-vs1-f43.google.com ([209.85.217.43]:46903 "EHLO
        mail-vs1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233654AbhFAJET (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 1 Jun 2021 05:04:19 -0400
Received: by mail-vs1-f43.google.com with SMTP id z15so2313016vsn.13
        for <linux-m68k@lists.linux-m68k.org>; Tue, 01 Jun 2021 02:02:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EHcm9jYCYkNsG8BECBdpWu+jr0Tw+FYnyVu5lIqPjG8=;
        b=axHA4+EiWfN0YAKK9vx1/bMqYoJ+S4gvoXZ8DRMYDfbrvtYepQwVh1QNwciVwpgr7g
         qT/RW5ycm53q9Wta/4rf0YuiEcdqYuckwA+go2hzVMLxkvxxbC/7Y6O7+/2PtHlX643G
         XBfLPHLOWQOUd+mYjyrp/1V6hcL3rj2zJOIwYgNoightqDkcgGhIDxRyfI5dghRS47/C
         CNV1bGDcMncVnMKl8hfFMOKImKjsKcbeqbYSiqO3JUtT80IvA0Rezn1CkXi/hNpLthxY
         HPuoUFQ9zTmtIJMRdzK6zb9udq9ghhoiVqwbPyKoV1iA3DQH1SbjKF8AttTMKXKta3BR
         Bf5A==
X-Gm-Message-State: AOAM532BjiD7aPj2D3yKq/22zp4GfZ0gMQs4JDPiZNAplc5CnnOn9tzV
        HRLVlq47qLLHe84I4DUnLXVs6StNowv2HpxS2jU=
X-Google-Smtp-Source: ABdhPJyZ21UVoefNYSXOVpP73WjDYTbPgjKQxsKz3oVlb9cWbWFg4HtkPdIzotLfRBwQmggKZ2rNQzwp99WVojmMtR4=
X-Received: by 2002:a05:6102:392:: with SMTP id m18mr17157052vsq.40.1622538157370;
 Tue, 01 Jun 2021 02:02:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210531184749.2475868-1-arnd@kernel.org> <20210531184749.2475868-5-arnd@kernel.org>
In-Reply-To: <20210531184749.2475868-5-arnd@kernel.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 1 Jun 2021 11:02:25 +0200
Message-ID: <CAMuHMdXFcohr2y8oR3VaddmDXjZx97o8jRJvfoppuHMrL=4xEg@mail.gmail.com>
Subject: Re: [PATCH 4/7] m68k: coldfire: use clkdev_lookup on most coldfire
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     linux-clk <linux-clk@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Dmitry Osipenko <digetx@gmail.com>,
        Florian Fainelli <florian@openwrt.org>,
        Greg Ungerer <gerg@linux-m68k.org>,
        John Crispin <john@phrozen.org>,
        Jonas Gorski <jonas.gorski@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Russell King <linux@armlinux.org.uk>,
        Stephen Boyd <sboyd@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Arnd,

On Mon, May 31, 2021 at 8:49 PM Arnd Bergmann <arnd@kernel.org> wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>
> Coldfire is now the only target that implements the clk_get()/clk_put()
> helpers itself rather than using the common implementation.
>
> Most coldfire variants only have two distinct clocks and use the clk
> code purely for lookup. Change those over to use clkdev_lookup instead
> but leave the custom clk interface for those two clocks.
>
> Also leave the four SoCs that have gated clocks.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Thanks for your patch!

> --- a/arch/m68k/coldfire/m527x.c
> +++ b/arch/m68k/coldfire/m527x.c

> @@ -97,7 +86,7 @@ static void __init m527x_i2c_init(void)
>         /*  set PAR_SCL to SCL and PAR_SDA to SDA */
>         par = readw(MCFGPIO_PAR_FECI2C);
>         par |= 0x0f;
> -       writew(par, MCFGPIO_PAR_FECI2C);
> +       wm527x_clk_lookupritew(par, MCFGPIO_PAR_FECI2C);

As reported by the kernel test robot, this fails to compile.
Should probably just stay "write".

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
