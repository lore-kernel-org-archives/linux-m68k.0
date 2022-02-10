Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8D65C433EF
	for <linux-m68k@archiver.kernel.org>; Thu, 10 Feb 2022 13:11:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242009AbiBJNLU (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 10 Feb 2022 08:11:20 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:45566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241393AbiBJNLS (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 10 Feb 2022 08:11:18 -0500
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A871510A5
        for <linux-m68k@lists.linux-m68k.org>; Thu, 10 Feb 2022 05:11:19 -0800 (PST)
Received: by mail-vs1-f51.google.com with SMTP id i26so2694755vso.9
        for <linux-m68k@lists.linux-m68k.org>; Thu, 10 Feb 2022 05:11:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VyfL/XR3k1yiplw7IJLRPirPvVisKMbHbKr+Yiu87oY=;
        b=2XRhXHwHshVzJoznIBo1MjsPcqk6TuxdwWhHXaWD6bkW6vJ3w9bCZGYj8drnwmahD6
         9my5dtbJeseqY4d6MHvYLZAQAb93XHBBElNFi66dUIbmElYL6spr7Xasr3vUaKdgnCoG
         03Fr6oeyqmVYE6o6cN0SaSVv3ZeyrfKCvvHf4vseggB7a2eUSme9dTzbbwBmgJlL8obk
         OOB+oaeSJDqHzT5Z408+kvzOdVQSZwk++3RPmMKolZgNFMoGnO2Um88fMaCwgS3eKaNR
         t/fdV1W0Kl4aU7oHv4ThHSLP39J5c1YtAdBA1D8v6SyAQmAwettQyX1XmOgFs3hRierE
         wwMQ==
X-Gm-Message-State: AOAM533cHGwu/8GR5PnK+nigKcq8uyiKXlrqqk3IbwszV8H5UBqx1cxL
        qI+YQRKXt2qO5ZfMlAhTd4QmYBynyqi6LA==
X-Google-Smtp-Source: ABdhPJyG8Oif72DX0e1qsmbgqgsgW8E0piQq+vAZEwg64rAJNOGywptnHpYOMCFcvt4ktI3c5Z/CQw==
X-Received: by 2002:a05:6102:3f55:: with SMTP id l21mr2512363vsv.27.1644498678625;
        Thu, 10 Feb 2022 05:11:18 -0800 (PST)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com. [209.85.217.51])
        by smtp.gmail.com with ESMTPSA id w4sm1067115vsq.17.2022.02.10.05.11.18
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Feb 2022 05:11:18 -0800 (PST)
Received: by mail-vs1-f51.google.com with SMTP id r20so6376367vsn.0
        for <linux-m68k@lists.linux-m68k.org>; Thu, 10 Feb 2022 05:11:18 -0800 (PST)
X-Received: by 2002:a67:c198:: with SMTP id h24mr2420776vsj.5.1644498677998;
 Thu, 10 Feb 2022 05:11:17 -0800 (PST)
MIME-Version: 1.0
References: <20220130143333.552646-1-laurent@vivier.eu> <20220130143333.552646-4-laurent@vivier.eu>
In-Reply-To: <20220130143333.552646-4-laurent@vivier.eu>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 10 Feb 2022 14:11:07 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUorQNkEfYfnkme8MzA2pMP1gogQSTMhAywSPFiZUSCuA@mail.gmail.com>
Message-ID: <CAMuHMdUorQNkEfYfnkme8MzA2pMP1gogQSTMhAywSPFiZUSCuA@mail.gmail.com>
Subject: Re: [PATCH v14 3/5] rtc: goldfish: use gf_ioread32()/gf_iowrite32()
To:     Laurent Vivier <laurent@vivier.eu>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, linux-rtc@vger.kernel.org,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Stephen Boyd <sboyd@kernel.org>,
        John Stultz <john.stultz@linaro.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Sun, Jan 30, 2022 at 3:33 PM Laurent Vivier <laurent@vivier.eu> wrote:
> replace readl()/writel() by gf_ioread32()/gf_iowrite32()
> as done for goldfish-tty.
>
> Signed-off-by: Laurent Vivier <laurent@vivier.eu>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
