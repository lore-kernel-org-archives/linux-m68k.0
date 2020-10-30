Return-Path: <SRS0=oftE=EF=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 821E5C55179
	for <linux-m68k@archiver.kernel.org>; Fri, 30 Oct 2020 08:52:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2A17A22241
	for <linux-m68k@archiver.kernel.org>; Fri, 30 Oct 2020 08:52:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725355AbgJ3Iww (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 30 Oct 2020 04:52:52 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:39708 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725875AbgJ3Iww (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 30 Oct 2020 04:52:52 -0400
Received: by mail-oi1-f194.google.com with SMTP id u127so5940122oib.6
        for <linux-m68k@lists.linux-m68k.org>; Fri, 30 Oct 2020 01:52:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wu3B2RW+hP2NEF9+Ir4dqWNvD9ijMEa3kooMxaDXyIg=;
        b=oPSXUpJe/GK6KzPeZ5e2qOVIyM68DE6j6X7HC+j67nicJQH+/balllivEl9d/NqD1S
         kOvTT44wT/WgaOafYLVD+rivShRl/MlSdXAzrSx5oGfmPDdj9mdeo5zJaO8/iExC0Qe2
         KHa9Q/OkbXrhZnARi89GR4u5/ZpiwG3G8ZHQWBaj4I37APqRSW3rnCYU1ChYlCk6ofe+
         qFiwC/W6kk3BLps85Y4Zu5i2S66fyyDip9vGoVi3Yh+gwtG30mTy/F7OYhNkrt0o9C/m
         ImNxDqAugSIuVJz9wbjjRCBRogplcrQGHOy6ITguKmuASRhJEJhrn2mk9DBgnfZL6nsM
         uhHQ==
X-Gm-Message-State: AOAM531mkHiiJyAAQPyzPJdg7O3yiTJADna9LBTe5PiUheVSQL93C5ud
        m4V/Gjc9+apoHbdQh90dC1n464Osm1JBgoa+eGc=
X-Google-Smtp-Source: ABdhPJw8RUvDtZJ8KeE9IPZOgi+3F3YswE63UqCh2jdSnNecTXolk3mcRqwQy5rnBxHMtSNML8N2h1pgzOGGRXHIjc8=
X-Received: by 2002:aca:f203:: with SMTP id q3mr813144oih.148.1604047935019;
 Fri, 30 Oct 2020 01:52:15 -0700 (PDT)
MIME-Version: 1.0
References: <63245c79-6fa4-49f6-d468-becf9a805ca8@kernel.dk>
In-Reply-To: <63245c79-6fa4-49f6-d468-becf9a805ca8@kernel.dk>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 30 Oct 2020 09:52:04 +0100
Message-ID: <CAMuHMdXXYdBadH4zj=bBsTzMBDxjQtAp=sYaz62ueOHqtWnDWw@mail.gmail.com>
Subject: Re: [PATCH] m68k: add support for TIF_NOTIFY_SIGNAL
To:     Jens Axboe <axboe@kernel.dk>
Cc:     linux-m68k <linux-m68k@lists.linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Jens,

On Thu, Oct 29, 2020 at 5:16 PM Jens Axboe <axboe@kernel.dk> wrote:
> Wire up TIF_NOTIFY_SIGNAL handling for m68k.
>
> Cc: linux-m68k@lists.linux-m68k.org
> Signed-off-by: Jens Axboe <axboe@kernel.dk>

Thanks for your patch!

> 5.11 has support queued up for TIF_NOTIFY_SIGNAL, see this posting
> for details:
>
> https://lore.kernel.org/io-uring/20201026203230.386348-1-axboe@kernel.dk/
>
> As part of that work, I'm adding TIF_NOTIFY_SIGNAL support to all archs,
> as that will enable a set of cleanups once all of them support it. I'm
> happy carrying this patch if need be, or it can be funelled through the
> arch tree. Let me know.

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>
hence please pick it up. Thx!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
