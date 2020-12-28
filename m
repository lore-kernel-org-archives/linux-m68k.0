Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B86A2C433DB
	for <linux-m68k@archiver.kernel.org>; Mon, 28 Dec 2020 07:49:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 803DC207B6
	for <linux-m68k@archiver.kernel.org>; Mon, 28 Dec 2020 07:49:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726292AbgL1HtI (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 28 Dec 2020 02:49:08 -0500
Received: from mail-oi1-f171.google.com ([209.85.167.171]:44997 "EHLO
        mail-oi1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726300AbgL1HtF (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 28 Dec 2020 02:49:05 -0500
Received: by mail-oi1-f171.google.com with SMTP id d189so10720906oig.11
        for <linux-m68k@lists.linux-m68k.org>; Sun, 27 Dec 2020 23:48:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dwOG3Rdx+Bs9ShvxTgTiz6VxgWYDrwpnieaPNAu4NdY=;
        b=UF0Vp/OK7ZbP3Ga042eul7/xVaDEyRciOh2PA/xHkGMlGdY69aHXxH53k9PrR3BNF/
         EfWVG1O0hif8gH2G7f+Bo8nhTB7HAq7WTn2JCA6NOSaAymEpcQUwEvY03XL32V3QZ0MI
         Kz+5uVoL/0VLCl6bddPFFniYGAlnwb19MQvAoTPS/l8kuT3hZT+WnlQRD+i5DCZVwiRX
         h7w1fuoqIyXHlhTTgy3agW7ris+v5gVGJJYe+2vqZWGTdSE2N75BUxqszJ9hf9whdCEF
         Jy8OqfVCPjsuJiQJTklndVEQWNIKoH9TWVpgt9MA3OAqkgwZcRz27FL7Ms6ZoHJgjEZT
         AgPA==
X-Gm-Message-State: AOAM530+4F09zhTkIROZtd6qIi4Ezn/8yaiqxrdXjll2yo160AC3NHjk
        eSxb3pywL8FhXrnxLWa0YXTFuoSc2gzPZzGZY0g=
X-Google-Smtp-Source: ABdhPJwW0Vvce+v0PSbZ1Mvc9RPUJU5cugHMBwWn8Y1tNZW8mmOYAhFLEzUFhQrRSi/SoFtEuooxidWJ9VE/63Vjtd4=
X-Received: by 2002:aca:3cc5:: with SMTP id j188mr11316836oia.54.1609141704170;
 Sun, 27 Dec 2020 23:48:24 -0800 (PST)
MIME-Version: 1.0
References: <1609121265-207018-1-git-send-email-bodefang@126.com>
In-Reply-To: <1609121265-207018-1-git-send-email-bodefang@126.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 28 Dec 2020 08:48:12 +0100
Message-ID: <CAMuHMdXH8qw9SMD4=SDNUeZUTm2ar1hO7Ev23r9ypFziZstKUw@mail.gmail.com>
Subject: Re: [PATCH] m68k: let clk_enable() return immediately if clk is NULL
To:     Defang Bo <bodefang@126.com>
Cc:     Greg Ungerer <gerg@linux-m68k.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Defang,

On Mon, Dec 28, 2020 at 3:08 AM Defang Bo <bodefang@126.com> wrote:
> Similar to commit<742859adc721>("m68k: let clk_disable() return immediately if clk is NULL").
> there should be a check for clk to prevent NULL pointer dereference.
>
> Signed-off-by: Defang Bo <bodefang@126.com>

Thanks for your patch!

> --- a/arch/m68k/coldfire/clk.c
> +++ b/arch/m68k/coldfire/clk.c
> @@ -90,6 +90,9 @@ EXPORT_SYMBOL(clk_get);
>  int clk_enable(struct clk *clk)
>  {
>         unsigned long flags;

Please keep the blank line between variable declarations and
statements (no complaint from scripts/checkpatch.pl? See
Documentation/process/submitting-patches.rst
).

> +       if (!clk)
> +               return -EINVAL;
> +
>         spin_lock_irqsave(&clk_lock, flags);
>         if ((clk->enabled++ == 0) && clk->clk_ops)
>                 clk->clk_ops->enable(clk);

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
