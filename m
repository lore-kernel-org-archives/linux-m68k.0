Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78785C433EF
	for <linux-m68k@archiver.kernel.org>; Wed,  6 Jul 2022 09:36:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229803AbiGFJgZ (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 6 Jul 2022 05:36:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231483AbiGFJgW (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 6 Jul 2022 05:36:22 -0400
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1452123161
        for <linux-m68k@lists.linux-m68k.org>; Wed,  6 Jul 2022 02:36:22 -0700 (PDT)
Received: by mail-qt1-f176.google.com with SMTP id c13so17393397qtq.10
        for <linux-m68k@lists.linux-m68k.org>; Wed, 06 Jul 2022 02:36:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=udLOHLqBe/cBfkNdhtB9nEWgGMUdeieaVeY0CDyuc4M=;
        b=UMVR29IhpjN0ZyztqqSwMhtQBhzjmfT9SbChZQKrttOBPBYwq3ZkuN+cKwM3EqY17P
         xb7iEFkqc4ZQM8pOTmIFjYdVZ8ftfatzSukrXhWzHC4EaiR33gcCpC5kbeYXAVmOIMam
         fNr5Ol6bb3q+Dapc0S3epVxuIOC3latMUrSCJS8W3b2nSWu9EdIf0Cycvfk2s9sV529n
         RBnEF1tUlUbP8sRlGh6eGFdEP20sxNPj22I0myEulb7H7wvLrglpfIV6btJ4uCeMOeh9
         6Vqb2f+M4QZISazkcryvl30eihQ9++QEAPiVpStSfT+XuPeh9kRtBuV7xyW3i1iJ48RN
         nbxQ==
X-Gm-Message-State: AJIora/RJZ+RgYmBW7B3AJ4FLC+vZhHSBXYf1nP26tqHn9fXOHiGqfRe
        fDE+FNFVNWYXhXJXHDvVetnYlw3gGo90xg==
X-Google-Smtp-Source: AGRyM1tYa4QYxaMPiZ6C3Xu2j30iJdpS93TBA8gtnjzkvXx+mE7XzVlyMNzzETMNO9m81o4QBWF1uw==
X-Received: by 2002:a05:6214:5085:b0:472:e878:866a with SMTP id kk5-20020a056214508500b00472e878866amr16140194qvb.2.1657100181125;
        Wed, 06 Jul 2022 02:36:21 -0700 (PDT)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com. [209.85.128.170])
        by smtp.gmail.com with ESMTPSA id z3-20020a05622a124300b00316a384447fsm24252219qtx.16.2022.07.06.02.36.20
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Jul 2022 02:36:20 -0700 (PDT)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-31c86fe1dddso86491207b3.1
        for <linux-m68k@lists.linux-m68k.org>; Wed, 06 Jul 2022 02:36:20 -0700 (PDT)
X-Received: by 2002:a81:9209:0:b0:31c:b1b7:b063 with SMTP id
 j9-20020a819209000000b0031cb1b7b063mr13371898ywg.383.1657100180449; Wed, 06
 Jul 2022 02:36:20 -0700 (PDT)
MIME-Version: 1.0
References: <3461c09c.be8.1817118854e.Coremail.chenxuebing@jari.cn>
In-Reply-To: <3461c09c.be8.1817118854e.Coremail.chenxuebing@jari.cn>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 6 Jul 2022 11:36:09 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWrGXOdyNmFzf5y9+NTKSRyMOGNQfO2EuqW1RcnbEiVuw@mail.gmail.com>
Message-ID: <CAMuHMdWrGXOdyNmFzf5y9+NTKSRyMOGNQfO2EuqW1RcnbEiVuw@mail.gmail.com>
Subject: Re: [PATCH] m68k/sun3: use __func__ to get funcion's name in an
 output message
To:     XueBing Chen <chenxuebing@jari.cn>
Cc:     Sam Creasey <sammy@sammy.net>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Fri, Jun 17, 2022 at 12:06 PM XueBing Chen <chenxuebing@jari.cn> wrote:
> Prefer using '"%s...", __func__' to get current function's name in
> an output message.
>
> Signed-off-by: XueBing Chen <chenxuebing@jari.cn>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
i.e. will queue in the m68k for-v5.20 branch.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
