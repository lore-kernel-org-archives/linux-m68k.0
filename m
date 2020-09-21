Return-Path: <SRS0=iw/Y=C6=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35C4FC43463
	for <linux-m68k@archiver.kernel.org>; Mon, 21 Sep 2020 07:23:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E80BF206B2
	for <linux-m68k@archiver.kernel.org>; Mon, 21 Sep 2020 07:23:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726326AbgIUHXQ convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 21 Sep 2020 03:23:16 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:41221 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726244AbgIUHXQ (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Mon, 21 Sep 2020 03:23:16 -0400
Received: by mail-ot1-f67.google.com with SMTP id q21so11453438ota.8
        for <linux-m68k@vger.kernel.org>; Mon, 21 Sep 2020 00:23:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=xdzpAg0Op9aVev/g1SjgCHr/zFo8GlU47nLI/S+aH+g=;
        b=YcRhv7VuHkoxG3FwDvGv022lhae/YZqd3FZG43TUcbOEnSAy7aY3/iIZC9+TbyXcec
         nTNY4k8XTNDUdaZRKnZFPs0Yepn646Xi4/8Je8Qcb22u8buF/eJe1iUpHkp0qFFLA0YP
         QXkXF5wYAi1K8BXztv3hry2Q78egHh9x+K+xBTWg6pu1JKCmfC042KtEt3EP+pqGhcxR
         JjAWlTz4fKZppZtU8VgApUz1qHCxTadKsypWZecR6otyeUthnNfDfto71+Lpv8BBmr0Y
         sSq0BNic2OkXLmNSs4lBwbXCX+rbo+4LD7djXjiJGCK2rUCyd/FXe4MRtDVcd1ibxuJV
         Kbqg==
X-Gm-Message-State: AOAM531nEv6Q0RpWSL0Jv4SzasVOEtKjBJean1mIDSDPVzz68dSqP6d4
        Mq2OzCZvWjWdW7uplTDwsiWo01Of7/GlrV9WzeC7SxHDiAs=
X-Google-Smtp-Source: ABdhPJwU5etgeAz9I8oMP9Xf1JhasHbQZeJUYx/kSsER6RUZjSwunXLM0nt5YuAoTyxpgzjhO5DJ7WKLaFt0o8eo1gE=
X-Received: by 2002:a9d:3b76:: with SMTP id z109mr31331752otb.250.1600672995074;
 Mon, 21 Sep 2020 00:23:15 -0700 (PDT)
MIME-Version: 1.0
References: <20200921030858.3899744-1-gerg@linux-m68k.org>
In-Reply-To: <20200921030858.3899744-1-gerg@linux-m68k.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 21 Sep 2020 09:23:03 +0200
Message-ID: <CAMuHMdWnkh+WpRbQ-SELxHsyZfeaCBH5Ly8-KJFrNzSdMYCd_w@mail.gmail.com>
Subject: Re: [PATCH] m68knommu: include SDHC support only when hardware has it
To:     Greg Ungerer <gerg@linux-m68k.org>
Cc:     "Linux/m68k" <linux-m68k@vger.kernel.org>,
        Angelo Dureghello <angelo.dureghello@timesys.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Mon, Sep 21, 2020 at 5:09 AM Greg Ungerer <gerg@linux-m68k.org> wrote:
> The mere fact that the kernel has the MMC subsystem enabled (CONFIG_MMC
> enabled) does not mean that the underlying hardware platform has the
> SDHC hardware present. Within the ColdFire hardware defines that is
> signified by MCFSDHC_BASE being defined with an address.
>
> The platform data for the ColdFire parts is including the SDHC hardware
> if CONFIG_MMC is enabled, instead of MCFSDHC_BASE. This means that if
> you are compiling for a ColdFire target that does not support SDHC but
> enable CONFIG_MMC you will fail to compile with errors like this:
>
>     arch/m68k/coldfire/device.c:565:12: error: ‘MCFSDHC_BASE’ undeclared here (not in a function)
>        .start = MCFSDHC_BASE,
>             ^
>     arch/m68k/coldfire/device.c:566:25: error: ‘MCFSDHC_SIZE’ undeclared here (not in a function)
>        .end = MCFSDHC_BASE + MCFSDHC_SIZE - 1,
>                          ^
>     arch/m68k/coldfire/device.c:569:12: error: ‘MCF_IRQ_SDHC’ undeclared here (not in a function)
>        .start = MCF_IRQ_SDHC,
>             ^
>
> Make the SDHC platform support depend on MCFSDHC_BASE, that is only
> include it if the specific ColdFire SoC has that hardware module.
>
> Signed-off-by: Greg Ungerer <gerg@linux-m68k.org>

Fixes: 991f5c4dd2422881 ("m68k: mcf5441x: add support for esdhc mmc controller")
Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
