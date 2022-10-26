Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21E7DC38A2D
	for <linux-m68k@archiver.kernel.org>; Wed, 26 Oct 2022 13:03:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233513AbiJZNDQ (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 26 Oct 2022 09:03:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233473AbiJZNDP (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 26 Oct 2022 09:03:15 -0400
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9632F9841
        for <linux-m68k@lists.linux-m68k.org>; Wed, 26 Oct 2022 06:03:14 -0700 (PDT)
Received: by mail-qt1-f176.google.com with SMTP id bb5so9752797qtb.11
        for <linux-m68k@lists.linux-m68k.org>; Wed, 26 Oct 2022 06:03:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=03y6t+YKs/wRE9nSRW/h4fPn8pJSXetuChZYCPZewYM=;
        b=da0T5j/9Ktkwg7P5N+2dE7NCi8Aqjv6h7N7fzSMWpkE5Fm96Wsg44YiALwqtuWhVxq
         muKZgDeGcM4p7tlakUGOFeVJUpoT4bgPRzXYUa9LKsk/W8BegORUMCr5nKcWS4dtrYC9
         OtN+9cdlgewSoQFWPNyZERbB2aVfXR9Nai0CyBCWQ02k+SWyRTO2kr8Ch/w4gppc/BnS
         cBpt/zr1QQcKsNyR4MCXGsJ3si1oumBt1AKYn5muApz4ms2Dj8VUqU7sHWe4oyXM50kp
         qoEMSPARC9XPEh1RGXW0URCTbARRFfu3hXf7kNopYQBCxflugIseYY23mZDWD61peiWQ
         Pvfg==
X-Gm-Message-State: ACrzQf0tsxdxaVXoBXyS81sm4N/jwtlU18XFy44hxT1k1Er76Wl+pQXY
        nq3mOqpvZ2oWWXm7ID1Fms4skxcXKFjrCg==
X-Google-Smtp-Source: AMsMyM7DYqsMoi30nDXsb1Hj3T2iMG3SoRfPknwZUgJcce8qYh4o6jYTFmzusZj0XUCJHK4+qB9S2A==
X-Received: by 2002:ac8:4e8e:0:b0:39c:d73a:e7c5 with SMTP id 14-20020ac84e8e000000b0039cd73ae7c5mr35327172qtp.105.1666789393740;
        Wed, 26 Oct 2022 06:03:13 -0700 (PDT)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com. [209.85.128.182])
        by smtp.gmail.com with ESMTPSA id w3-20020ac857c3000000b0039442ee69c5sm3175046qta.91.2022.10.26.06.03.13
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Oct 2022 06:03:13 -0700 (PDT)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-367cd2807f2so146521387b3.1
        for <linux-m68k@lists.linux-m68k.org>; Wed, 26 Oct 2022 06:03:13 -0700 (PDT)
X-Received: by 2002:a81:9c49:0:b0:34a:de:97b8 with SMTP id n9-20020a819c49000000b0034a00de97b8mr38941301ywa.384.1666789392975;
 Wed, 26 Oct 2022 06:03:12 -0700 (PDT)
MIME-Version: 1.0
References: <20221026130051.1577286-1-Jason@zx2c4.com>
In-Reply-To: <20221026130051.1577286-1-Jason@zx2c4.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 26 Oct 2022 15:03:00 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX1733OFFc1P1oGKD5Nef9GyiR0XYL0u+2XhMS5aNAGyA@mail.gmail.com>
Message-ID: <CAMuHMdX1733OFFc1P1oGKD5Nef9GyiR0XYL0u+2XhMS5aNAGyA@mail.gmail.com>
Subject: Re: [PATCH] m68k: mac_via: remove unused rbv_set_video_bpp()
To:     "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc:     linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Wed, Oct 26, 2022 at 3:01 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> In examining rbv_set_video_bpp()'s improper usage of a non-explictly
> signed char type, it turns out that the function is actually unused. So
> remove it.
>
> Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
i.e. will queue in the m68k for-v6.2 branch.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
