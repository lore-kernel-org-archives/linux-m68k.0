Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8625C433EF
	for <linux-m68k@archiver.kernel.org>; Thu, 10 Mar 2022 12:14:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241908AbiCJMP3 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 10 Mar 2022 07:15:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241905AbiCJMP2 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 10 Mar 2022 07:15:28 -0500
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26C531480DE
        for <linux-m68k@lists.linux-m68k.org>; Thu, 10 Mar 2022 04:14:28 -0800 (PST)
Received: by mail-qk1-f179.google.com with SMTP id h196so4144746qke.12
        for <linux-m68k@lists.linux-m68k.org>; Thu, 10 Mar 2022 04:14:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5pC4y1hPLgVophxmsxiWtzmdOsu96CQ5ZYdDypoK4kI=;
        b=4cNXhuNIq10w2gjwwcSa0DxuSMCWiXR2ksYdIpIcs3QbvLG3gsWO1/ZlUagoA3KUQC
         G9S9G/q/vPQzDTUBmSiMebieDlE/9wk1tUjZCiQ2Aaeom7J8l67qWwnPCFBQ8BevCelY
         HsXhHm0RTx63XWFXFLO+SBnpT7ltzz19QpPj6It9DunMii8fLYmA3AHauJxex5HjzWia
         pS8+50wUi4Vqqeun+pojd4o3CQptH80kt0aDa0GZJHhHrXxXLxWVVXKDqlRameUuJlgw
         UaorNFIHaPaycE1/2+NjunYG8ttDynENFdKXTOm5w8aFSr5YzDt7BGsBUae0th7nzLah
         t5hQ==
X-Gm-Message-State: AOAM530QdIav1atytgurds+Ij8jqWADBQaRhNamSWxlAYY+XQq71mS2m
        CDFlr+FdkOvjOPPyenYw14rPSmpPovxQqg==
X-Google-Smtp-Source: ABdhPJyBEvSgw7WH4YepnI6SK4pRzuj6etix78tOjN3wqi4RcQ9IMwY6B5p8w5HmYXBAbqDl9BbVHg==
X-Received: by 2002:a05:620a:28c4:b0:67b:ce16:d2d with SMTP id l4-20020a05620a28c400b0067bce160d2dmr2718819qkp.715.1646914466626;
        Thu, 10 Mar 2022 04:14:26 -0800 (PST)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com. [209.85.128.182])
        by smtp.gmail.com with ESMTPSA id a13-20020ac85b8d000000b002e1b2620a4dsm715820qta.95.2022.03.10.04.14.25
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Mar 2022 04:14:25 -0800 (PST)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-2d07ae0b1c0so55661047b3.2
        for <linux-m68k@lists.linux-m68k.org>; Thu, 10 Mar 2022 04:14:25 -0800 (PST)
X-Received: by 2002:a0d:f1c7:0:b0:2db:d2bc:be11 with SMTP id
 a190-20020a0df1c7000000b002dbd2bcbe11mr3655602ywf.62.1646914464859; Thu, 10
 Mar 2022 04:14:24 -0800 (PST)
MIME-Version: 1.0
References: <20220310090048.1933020-1-laurent@vivier.eu> <20220310090048.1933020-2-laurent@vivier.eu>
In-Reply-To: <20220310090048.1933020-2-laurent@vivier.eu>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 10 Mar 2022 13:14:13 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVdxXuMrxeJ+RychgWgoq09PKOBdj0DC1LVj9qZ0ozHLw@mail.gmail.com>
Message-ID: <CAMuHMdVdxXuMrxeJ+RychgWgoq09PKOBdj0DC1LVj9qZ0ozHLw@mail.gmail.com>
Subject: Re: [PATCH v15 1/5] m68k: add asm/config.h
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
        John Stultz <john.stultz@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Thu, Mar 10, 2022 at 10:01 AM Laurent Vivier <laurent@vivier.eu> wrote:
> To avoid 'warning: no previous prototype for' error, declare all
> the parse_bootinfo and config functions prototypes into asm/config.h
> and include it in arch/m68k/kernel/setup_mm.c and arch/m68k/*/config.c
>
> Signed-off-by: Laurent Vivier <laurent@vivier.eu>
> Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>

Already queued in the m68k for-v5.18 branch.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
