Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64525C54EE9
	for <linux-m68k@archiver.kernel.org>; Thu,  8 Sep 2022 13:16:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232286AbiIHNQd (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 8 Sep 2022 09:16:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232287AbiIHNQ3 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 8 Sep 2022 09:16:29 -0400
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B7BD22530
        for <linux-m68k@lists.linux-m68k.org>; Thu,  8 Sep 2022 06:16:26 -0700 (PDT)
Received: by mail-qk1-f175.google.com with SMTP id a15so12815411qko.4
        for <linux-m68k@lists.linux-m68k.org>; Thu, 08 Sep 2022 06:16:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=EN6OrD+swNcWW/wUukKGtS71vNoj6oAVRqW0V6ZuKEk=;
        b=B/eh1v63Y2Jasqfl8JvXyI/g9j0mMMHsQCgzHBoanH7Z69gcmczaPKZQy6kWivgszU
         DglSijnBD/1y9rOObd+tV5j062INaAF5cAg687k7Z6SOjYVbfWNCZrIrdcJ5fKZi3+KR
         6xXbDC89Iev1bOhhd9GKvGgJ6jEC5sed+93U/+RODRbsudunw7Y38FCUYqGtj3gAMwPe
         zazuE20+LdyTjAhOqHckfOiZG6yn1k/W/4F8HgrJqFTiYzHPMrwtIBjIWZrDgWcUAsH+
         0mTJCXa8lfCMmVSO3ZVR+61hTg35SBfbheuRFxB4yAChDc1Ek3pF8Fbu6E1SKYJ5+6UK
         zgsg==
X-Gm-Message-State: ACgBeo3Hnf3onHOQ9L/AwaaJI0v/YK5wecyI4KjIEvkHB5GUBk5fVJoa
        M2+hWU/lFsQU9ghbsi+trUI0aB5T0g8U6A==
X-Google-Smtp-Source: AA6agR4nLr3eMWjFhv107ZQyi1JzUPrNYnocdN6MO1BDGrV4mczZz2Km8AUwLrKOvK+L+hv2Xo7c4Q==
X-Received: by 2002:a05:620a:244e:b0:6c6:f3b8:9c3 with SMTP id h14-20020a05620a244e00b006c6f3b809c3mr6329983qkn.218.1662642984952;
        Thu, 08 Sep 2022 06:16:24 -0700 (PDT)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com. [209.85.128.178])
        by smtp.gmail.com with ESMTPSA id j19-20020ac85f93000000b0035a691cec8esm1173541qta.29.2022.09.08.06.16.24
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Sep 2022 06:16:24 -0700 (PDT)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-3378303138bso164053917b3.9
        for <linux-m68k@lists.linux-m68k.org>; Thu, 08 Sep 2022 06:16:24 -0700 (PDT)
X-Received: by 2002:a81:758a:0:b0:345:450b:6668 with SMTP id
 q132-20020a81758a000000b00345450b6668mr7265892ywc.316.1662642984197; Thu, 08
 Sep 2022 06:16:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220908125735.30134-1-wangjianli@cdjrlc.com>
In-Reply-To: <20220908125735.30134-1-wangjianli@cdjrlc.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 8 Sep 2022 15:16:12 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUwL-hWeMyrJUVCmpimputMwxpBaQKB1705HfZ_drGGAw@mail.gmail.com>
Message-ID: <CAMuHMdUwL-hWeMyrJUVCmpimputMwxpBaQKB1705HfZ_drGGAw@mail.gmail.com>
Subject: Re: [PATCH] m68k/mac: fix repeated words in comments
To:     wangjianli <wangjianli@cdjrlc.com>
Cc:     Joshua Thompson <funaho@jurai.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Wangjianli,

On Thu, Sep 8, 2022 at 2:57 PM wangjianli <wangjianli@cdjrlc.com> wrote:
> Delete the redundant word 'in'.
>
> Signed-off-by: wangjianli <wangjianli@cdjrlc.com>

Thanks for your patch!

> --- a/arch/m68k/mac/misc.c
> +++ b/arch/m68k/mac/misc.c
> @@ -126,7 +126,7 @@ static void via_rtc_send(__u8 data)
>
>         reg = via1[vBufB] & ~(VIA1B_vRTCClk | VIA1B_vRTCData);
>
> -       /* The bits of the byte go in in MSB order */
> +       /* The bits of the byte go in MSB order */
>
>         for (i = 0 ; i < 8 ; i++) {
>                 bit = data & 0x80? 1 : 0;

The original is correct, cfr.
https://lore.kernel.org/linux-m68k/CAMuHMdVf7EOrXkUpa1E1Qx1w0Tvrt1nwRHM6B8rsGPOh=WsnyA@mail.gmail.com
https://lore.kernel.org/linux-m68k/CAMuHMdWwqKyvtxkvdng0EVFfKjz9iOjK3Dhfd+iru-j731azTw@mail.gmail.com

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
