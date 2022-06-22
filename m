Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB893C43334
	for <linux-m68k@archiver.kernel.org>; Wed, 22 Jun 2022 07:19:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352133AbiFVHTo (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 22 Jun 2022 03:19:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349773AbiFVHTn (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 22 Jun 2022 03:19:43 -0400
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54BE21B7B1
        for <linux-m68k@lists.linux-m68k.org>; Wed, 22 Jun 2022 00:19:43 -0700 (PDT)
Received: by mail-qk1-f174.google.com with SMTP id 63so924547qkk.0
        for <linux-m68k@lists.linux-m68k.org>; Wed, 22 Jun 2022 00:19:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7zp9khTmqchqs4KxBcL6aqCiADcBm5j8vu+OxsZyaeM=;
        b=EAgeS4pAFyR9UGbW99LfLMU7VcOjtugk0HDVBT7I/XpbYUFw+MjKeiRfsj9G/IJwSQ
         PVfpYpGhJxT8LdlUVLI2jrr2AKNl2klpv8WDuL+PzYzL7xVors6drq0tlhOITK7R0P15
         1nvz4A+PTCjiTZcYAiJXLbmYNc71Rfk2d8DOMZnBEZLKPG+58NXqhoGFrY/yKC1OAmIJ
         454U7mrWFfhV/gTri5UzroEhjTfYJ4sh5SIdwjPKpgdwch7TS2baQ3bXA/iQNJthembK
         /pdTyD8/3hrqWb2flUj3+Gx/o/LBnAUUlp6P0izl01Jg09yeofsoN917kbRixgCqG+f+
         4WZA==
X-Gm-Message-State: AJIora+PXJEZ44oEB/QGUgs9tYu8jxPq+1/qwkCudg7JHep4cM7SY3YK
        P71ZQwP7CAIeYaCWxkS0ahOX+EebYsFEvg==
X-Google-Smtp-Source: AGRyM1txJsR4HxQOkFX8/InTv3dus+HRXQALHu1lPrSBPQ/zTELWM2Na4kVrlul3H8JiEWKyiqTOyw==
X-Received: by 2002:a05:620a:8009:b0:6a6:c552:7351 with SMTP id ee9-20020a05620a800900b006a6c5527351mr1145671qkb.517.1655882381877;
        Wed, 22 Jun 2022 00:19:41 -0700 (PDT)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com. [209.85.219.179])
        by smtp.gmail.com with ESMTPSA id d8-20020ac85d88000000b00304edcfa109sm14895004qtx.33.2022.06.22.00.19.41
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jun 2022 00:19:41 -0700 (PDT)
Received: by mail-yb1-f179.google.com with SMTP id 23so28642707ybe.8
        for <linux-m68k@lists.linux-m68k.org>; Wed, 22 Jun 2022 00:19:41 -0700 (PDT)
X-Received: by 2002:a05:6902:1141:b0:669:3f2a:c6bb with SMTP id
 p1-20020a056902114100b006693f2ac6bbmr2180101ybu.365.1655882381103; Wed, 22
 Jun 2022 00:19:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220622061018.37575-1-yuanjilin@cdjrlc.com>
In-Reply-To: <20220622061018.37575-1-yuanjilin@cdjrlc.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 22 Jun 2022 09:19:29 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWwqKyvtxkvdng0EVFfKjz9iOjK3Dhfd+iru-j731azTw@mail.gmail.com>
Message-ID: <CAMuHMdWwqKyvtxkvdng0EVFfKjz9iOjK3Dhfd+iru-j731azTw@mail.gmail.com>
Subject: Re: [PATCH] m68k:mac:Fix syntax errors in comments
To:     yuanjilin@cdjrlc.com
Cc:     Joshua Thompson <funaho@jurai.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Jilin,

On Wed, Jun 22, 2022 at 8:10 AM Jilin Yuan <yuanjilin@cdjrlc.com> wrote:
> Delete the redundant word 'in'.
>
> Signed-off-by: Jilin Yuan <yuanjilin@cdjrlc.com>

Thanks for your patch!

> --- a/arch/m68k/mac/misc.c
> +++ b/arch/m68k/mac/misc.c
> @@ -126,7 +126,7 @@ static void via_rtc_send(__u8 data)
>
>         reg = via1[vBufB] & ~(VIA1B_vRTCClk | VIA1B_vRTCData);
>
> -       /* The bits of the byte go in in MSB order */
> +       /* The bits of the byte go in MSB order */

The original is actually correct: "to go in", "in MSB order".

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
