Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 123D5C4338F
	for <linux-m68k@archiver.kernel.org>; Mon,  9 Aug 2021 13:23:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E8C206101D
	for <linux-m68k@archiver.kernel.org>; Mon,  9 Aug 2021 13:23:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235483AbhHINX1 convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 9 Aug 2021 09:23:27 -0400
Received: from mail-vs1-f51.google.com ([209.85.217.51]:45981 "EHLO
        mail-vs1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235465AbhHINXV (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 9 Aug 2021 09:23:21 -0400
Received: by mail-vs1-f51.google.com with SMTP id a1so9995579vsd.12
        for <linux-m68k@lists.linux-m68k.org>; Mon, 09 Aug 2021 06:23:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=dceVL1zlAS3o69TxNbD+bkbP10t3ohJU4T5KJ5aE8RI=;
        b=MN5MFIyWqbPNusO76sQfF/jfQ+yDtwnEWMSnEsnljVZqbU7MNyuSh8v37YxiiH6xxD
         YMqVTzWZSeVOCoDJ+SpYsRlgianB5d9M9EKNpH0hN4yioEJe6o4gt1Wa732dGJdoWn4z
         fKayZKZ0joa2wdFGao7CJ58hny/BuGeQidKMOG1oHp8cVeDPXy4Kw56ErpANdJHRM0Us
         6KNl9KQUX4Xro59e0/UW9yCsBUZv+qyUN3GmdttpRr1s3gjPQr+ycNq0jvr67dAYtnM2
         yYKSkvl43EJejND5Rg1ORmmarf8HCq8nKXgQaSixqQrNoyCRjydzeo5X6GSrGax7H+EQ
         RrIQ==
X-Gm-Message-State: AOAM532++DfQwLIkn2htUJJDQa+VvW+blimR9nzDXehHFJQjI1Pk00G9
        0A7o8EU+LCzPjC/l3+bgSDi7wW/L+6Hlo+7t9vA=
X-Google-Smtp-Source: ABdhPJwJoMjpAh7WO5FcQZo8zjjOGsDP151wKp5+tjtfJp/WkMg8gT/tj9AZ3Ld9iNo4TAtHEYXu2B1AUvafB06WTtw=
X-Received: by 2002:a67:b604:: with SMTP id d4mr9037657vsm.40.1628515380764;
 Mon, 09 Aug 2021 06:23:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210730191035.1455248-1-u.kleine-koenig@pengutronix.de> <20210730191035.1455248-4-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20210730191035.1455248-4-u.kleine-koenig@pengutronix.de>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 9 Aug 2021 15:22:49 +0200
Message-ID: <CAMuHMdVXMST4eHPKiOjNzWp6==EACYv7ZrCkNETZ=z-Y94q0kA@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] zorro: Simplify remove callback
To:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Sascha Hauer <kernel@pengutronix.de>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Fri, Jul 30, 2021 at 9:10 PM Uwe Kleine-König
<u.kleine-koenig@pengutronix.de> wrote:
> The driver core only calls a remove callback when the device was
> successfully bound (aka probed) before. So dev->driver is never NULL.
>
> (And even if it was NULL, to_zorro_driver(NULL) isn't ...)
>
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
