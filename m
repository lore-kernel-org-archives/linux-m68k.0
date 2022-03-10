Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6223C433F5
	for <linux-m68k@archiver.kernel.org>; Thu, 10 Mar 2022 12:16:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241927AbiCJMR3 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 10 Mar 2022 07:17:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231394AbiCJMR2 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 10 Mar 2022 07:17:28 -0500
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B255B136EE0
        for <linux-m68k@lists.linux-m68k.org>; Thu, 10 Mar 2022 04:16:27 -0800 (PST)
Received: by mail-qt1-f178.google.com with SMTP id 10so1874681qtz.11
        for <linux-m68k@lists.linux-m68k.org>; Thu, 10 Mar 2022 04:16:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VXWjjmCL6PQMmHC/BXr8XwSL9VjR6u26j2gFJ4nELpM=;
        b=M1OzAROIWIQQTPicoKSzqVHcahBjnaSMMQUhhXBEUWmbmZuv+NzajE+B14a8T75xvh
         AaOcVAzI76s5uSs0P8mQJsbYoxDm7/oOpwm3wnGeMRLgeuDtNtjq8lGylP2F3gE9hOM7
         jx5qycbK2PUWmpmXx+3VzFoWMbw0Abfmv7F+r94lKIqNOCGiqR5qVRPZoXqZhQ/DcBgn
         9F+n2lmUZ6rZaSty3pVU/KNSciqfdJNJWKyEZrZdkyQSsH6uJ+wbBjIkSUBlFRvVlbYM
         4JE+0w6fe7+jXoNcqo9Ptu1y3jM0VAkgDqHHC258rwzC/pGknaml8wDVIPCD1RjaGpMd
         q7gA==
X-Gm-Message-State: AOAM531Ss5pLveNoJzPBapReqTdLK/4UYhfFcy+/lZXkUTGFvQeiYpI6
        9fpADlKu2X0OsfiQRiUiF7KlbjE6JkT59g==
X-Google-Smtp-Source: ABdhPJwe3R7zhrQfFT/F/iXA5Xb/utxBg90MG4TTGgif3SIs1A4Uz25ww+NNxIwAM330ueYE0oQXvg==
X-Received: by 2002:a05:622a:138b:b0:2de:29bf:7a09 with SMTP id o11-20020a05622a138b00b002de29bf7a09mr3527923qtk.479.1646914585876;
        Thu, 10 Mar 2022 04:16:25 -0800 (PST)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com. [209.85.128.176])
        by smtp.gmail.com with ESMTPSA id d28-20020a05620a205c00b0067d154026bdsm2204939qka.29.2022.03.10.04.16.23
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Mar 2022 04:16:24 -0800 (PST)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-2d6d0cb5da4so55116587b3.10
        for <linux-m68k@lists.linux-m68k.org>; Thu, 10 Mar 2022 04:16:23 -0800 (PST)
X-Received: by 2002:a81:c703:0:b0:2d0:cc6b:3092 with SMTP id
 m3-20020a81c703000000b002d0cc6b3092mr3532252ywi.449.1646914583451; Thu, 10
 Mar 2022 04:16:23 -0800 (PST)
MIME-Version: 1.0
References: <20220310090048.1933020-1-laurent@vivier.eu> <20220310090048.1933020-3-laurent@vivier.eu>
In-Reply-To: <20220310090048.1933020-3-laurent@vivier.eu>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 10 Mar 2022 13:16:12 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVcbcDvETmVsipYyixAYeQEm9sQORd_UfiwvZj1W2ft4w@mail.gmail.com>
Message-ID: <CAMuHMdVcbcDvETmVsipYyixAYeQEm9sQORd_UfiwvZj1W2ft4w@mail.gmail.com>
Subject: Re: [PATCH v15 2/5] tty: goldfish: introduce gf_ioread32()/gf_iowrite32()
To:     Laurent Vivier <laurent@vivier.eu>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        linux-rtc@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        John Stultz <john.stultz@linaro.org>,
        stable <stable@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Thu, Mar 10, 2022 at 10:01 AM Laurent Vivier <laurent@vivier.eu> wrote:
> Revert
> commit da31de35cd2f ("tty: goldfish: use __raw_writel()/__raw_readl()")
>
> and define gf_ioread32()/gf_iowrite32() to be able to use accessors
> defined by the architecture.
>
> Cc: stable@vger.kernel.org # v5.11+
> Fixes: da31de35cd2f ("tty: goldfish: use __raw_writel()/__raw_readl()")
> Signed-off-by: Laurent Vivier <laurent@vivier.eu>

Please include tags given on previous versions:
Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
