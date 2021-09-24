Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F738C433F5
	for <linux-m68k@archiver.kernel.org>; Fri, 24 Sep 2021 11:29:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1588D610CF
	for <linux-m68k@archiver.kernel.org>; Fri, 24 Sep 2021 11:29:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245069AbhIXLay (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 24 Sep 2021 07:30:54 -0400
Received: from mail-ua1-f43.google.com ([209.85.222.43]:44890 "EHLO
        mail-ua1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244860AbhIXLay (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 24 Sep 2021 07:30:54 -0400
Received: by mail-ua1-f43.google.com with SMTP id n4so1128152uaj.11
        for <linux-m68k@lists.linux-m68k.org>; Fri, 24 Sep 2021 04:29:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Xb4E71PLRVwAgc7nxTvHtPqOviEnsfHRocCh1h1TNpU=;
        b=1hF7eqCZwwDnjWR4hTRWvBPHyGESuNNz0dqrGA7Qy1Z/DYWe8GC4wzGdvFBq+dGp3n
         eGR3k55xLUv/uamCIRukZ6lUAfCFIWGoUmFx0+N9vSTxSpMRE+Fmu0gUDxjzESRIl2iX
         oc0h8Cn2YokbRJSHOmX4ufKEUFRiSgu7EXW9fkC7Hc6C6VVwD91tR3psqIHyh5409Vj3
         chQzN23FZvJaahlRhzd+vx2Z26XGboO/5mzIcurtNXT8KYumnAGOHm39itbB34t+8hS3
         sAQSTzRkUtYRzm89hH951VB4jeP5ptVNNrrvwHxTGMsm00vBMF7INdyijzdA2NM+SmZ/
         Cj0Q==
X-Gm-Message-State: AOAM533NMSsOCkn4yKpJRm6MqSTezUYv6sdBshdRlXupkSHuCgEx5DRt
        KiaHczWdx4N5rYGT27+sQpF3YswMgRWY2Wh04RQ=
X-Google-Smtp-Source: ABdhPJz3tf5Uuih13QoXr/+WiaUJFLErVwra6v83B0+Z+LkdV1BQqgZUmWZw8z25y996cRukWMEezFzll0NRKknW/74=
X-Received: by 2002:ab0:7d5:: with SMTP id d21mr8830579uaf.78.1632482960571;
 Fri, 24 Sep 2021 04:29:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210906142413.130774-1-wangborong@cdjrlc.com>
In-Reply-To: <20210906142413.130774-1-wangborong@cdjrlc.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 24 Sep 2021 13:29:09 +0200
Message-ID: <CAMuHMdUYMabCK7aknqTMSOqZrLkwJ1uRTPPyqn7AXLQ7VXeg2w@mail.gmail.com>
Subject: Re: [PATCH] m68k: Add a missing SPDX license header
To:     Jason Wang <wangborong@cdjrlc.com>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Jason,

On Mon, Sep 6, 2021 at 4:24 PM Jason Wang <wangborong@cdjrlc.com> wrote:
> Add the missing SPDX license header to arch/m68k/q40/q40ints.c.
>
> Signed-off-by: Jason Wang <wangborong@cdjrlc.com>

Thanks for your patch!

> ---
>  arch/m68k/q40/q40ints.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)

Is there any specific reason you only updated this file?
There are 209 other files under arch/m68k/ lacking an SPDX license
header.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
