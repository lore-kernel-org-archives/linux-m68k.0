Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2736DC433EF
	for <linux-m68k@archiver.kernel.org>; Wed, 20 Jul 2022 17:37:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241352AbiGTRhw (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 20 Jul 2022 13:37:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241380AbiGTRhn (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 20 Jul 2022 13:37:43 -0400
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D755870983
        for <linux-m68k@lists.linux-m68k.org>; Wed, 20 Jul 2022 10:37:42 -0700 (PDT)
Received: by mail-qt1-f180.google.com with SMTP id w29so13140136qtv.9
        for <linux-m68k@lists.linux-m68k.org>; Wed, 20 Jul 2022 10:37:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kh7V8uHzXmxI+aoBRvnV2n6tht0bog5cLScTJnWXPGY=;
        b=SpsDE7LbpObsUQ0Rrp5hsnbpG7j2qKi4yP/aHrJ2ooX0xQrjQxdvzf4OFKqeC7FrCx
         Dm2VeL1qVHFuaAugNLAhOJaTFTC2Nigeo9Ap3q89n0fkvA6GBa3pK2L04JHJ4++YaL8n
         7Gg7HSakj07ttL5jL3pTj/6nV2Cncsip3CBS8v+I9+Dgr2/cwmAUOLCFm9x3ZSzqJ4Jj
         dLdbmnuKQJaj27ySOJS7QQQZI0t4keGDuD0UrK+0saimhNXo8ZjY8b9b3PU6kKUKOYty
         YdP9MpDoD6BCkik/3TP0x+r0B4P6nJEmMXmvYhi2nE13fWVthADWxgJuSGHhx2tSDKUs
         CCEQ==
X-Gm-Message-State: AJIora+cXSeLOsgQxC6GeuAc+n+2fagVdQOcOWoE1SFwuZyxmYnRe8CJ
        pvutwanykMgnLu9UjQpDkrzOZRm7iPapBYD1
X-Google-Smtp-Source: AGRyM1u+MbcMwc/EYR1Nt9HC+rtAzbQkSHnMlSU+4+sr32Ltujh+iVO+ZOnG3cbz5mhL1pE9/5HTEg==
X-Received: by 2002:a05:622a:1a15:b0:31e:eba1:1084 with SMTP id f21-20020a05622a1a1500b0031eeba11084mr14122349qtb.308.1658338661461;
        Wed, 20 Jul 2022 10:37:41 -0700 (PDT)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com. [209.85.128.180])
        by smtp.gmail.com with ESMTPSA id t24-20020a05622a181800b00304fe5247bfsm14028061qtc.36.2022.07.20.10.37.40
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Jul 2022 10:37:41 -0700 (PDT)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-31e67c46ba2so34627737b3.2
        for <linux-m68k@lists.linux-m68k.org>; Wed, 20 Jul 2022 10:37:40 -0700 (PDT)
X-Received: by 2002:a0d:c787:0:b0:31b:a963:e1de with SMTP id
 j129-20020a0dc787000000b0031ba963e1demr41498691ywd.283.1658338660732; Wed, 20
 Jul 2022 10:37:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220720105309.3090-1-gaoxin@cdjrlc.com>
In-Reply-To: <20220720105309.3090-1-gaoxin@cdjrlc.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 20 Jul 2022 19:37:29 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVf7EOrXkUpa1E1Qx1w0Tvrt1nwRHM6B8rsGPOh=WsnyA@mail.gmail.com>
Message-ID: <CAMuHMdVf7EOrXkUpa1E1Qx1w0Tvrt1nwRHM6B8rsGPOh=WsnyA@mail.gmail.com>
Subject: Re: [PATCH] m68k/mac: Fixed duplicate "in" in comments.
To:     Xin Gao <gaoxin@cdjrlc.com>
Cc:     Joshua Thompson <funaho@jurai.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Xin,

On Wed, Jul 20, 2022 at 12:55 PM Xin Gao <gaoxin@cdjrlc.com> wrote:
> Fixed duplicate "in" in comments.
>
> Signed-off-by: Xin Gao <gaoxin@cdjrlc.com>

Thanks for your patch!

> --- a/arch/m68k/mac/misc.c
> +++ b/arch/m68k/mac/misc.c
> @@ -126,7 +126,7 @@ static void via_rtc_send(__u8 data)
>
>         reg = via1[vBufB] & ~(VIA1B_vRTCClk | VIA1B_vRTCData);
>
> -       /* The bits of the byte go in in MSB order */
> +       /* The bits of the byte go in MSB order */

The original was correct.
Ask yourself the question: "How should the bits go in?"
"In MSB order".

>
>         for (i = 0 ; i < 8 ; i++) {
>                 bit = data & 0x80? 1 : 0;

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
