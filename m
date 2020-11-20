Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAD96C6379F
	for <linux-m68k@archiver.kernel.org>; Fri, 20 Nov 2020 07:34:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5F64922256
	for <linux-m68k@archiver.kernel.org>; Fri, 20 Nov 2020 07:34:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727030AbgKTHeW (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 20 Nov 2020 02:34:22 -0500
Received: from mail-oi1-f194.google.com ([209.85.167.194]:44522 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727021AbgKTHeW (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 20 Nov 2020 02:34:22 -0500
Received: by mail-oi1-f194.google.com with SMTP id t16so9405248oie.11
        for <linux-m68k@lists.linux-m68k.org>; Thu, 19 Nov 2020 23:34:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6G2QXy2DyQdps+7JOhcILOmABxjD2Cyllu51GS8eEUA=;
        b=GalcSQQALxkMdhIwXUrWvLnFf07k7mhfreeYv8Ma81rTsxFYS0afVHdbb0AefBX3Io
         05UrIQiEryOuxgEQHK14WDEtlycMLpoC0jAancpn3nv095ZwiYJKL39njdEXtKKpgyxb
         sEnLx35ypCUBFn+QP5rjoZZ67bUtjrOpyDdANlHNPLA38PnAHGwrB9nGLNwA2NFAiYuU
         JEgmbDWIB9+GuPRVth2oI3FKB2iFNMCPwHqeQI+vnFN90yIyujIMbpznKYggBT6SeeOt
         rzdXqrB+TlLbWad2OLMr3IL9fOcdYZgt4mg5Vo1L0YQUuqqnhy4ANSxwdxdfqlHgLrZI
         CUzA==
X-Gm-Message-State: AOAM530jQVEHtKdhpAtiM2O+6ezMsc7qNMO61tyHQC5/4n+1K0XEAA3K
        e34JQ5pnKuioows3sQewr/xLsdBxeNdReFZRX78=
X-Google-Smtp-Source: ABdhPJxTEV6JWrhe7RuqSWIYrFMwZ2x36SFeDhxHuau6uqBqN0qfbPzx+GihHxwrJaUYRpdUGeebVvqkDI/uavZJOoM=
X-Received: by 2002:aca:52c9:: with SMTP id g192mr5790892oib.54.1605857661074;
 Thu, 19 Nov 2020 23:34:21 -0800 (PST)
MIME-Version: 1.0
References: <bb327f05f8fb61eeb332cc2ba4e8335570976474.1605847196.git.fthain@telegraphics.com.au>
In-Reply-To: <bb327f05f8fb61eeb332cc2ba4e8335570976474.1605847196.git.fthain@telegraphics.com.au>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 20 Nov 2020 08:34:10 +0100
Message-ID: <CAMuHMdUQ5mJzJH7nsKTaxMTjS4yXoBM2_2R4=meg4KyxCfimgg@mail.gmail.com>
Subject: Re: [PATCH] m68k/mac: Update Kconfig help
To:     Finn Thain <fthain@telegraphics.com.au>
Cc:     Joshua Thompson <funaho@jurai.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Fri, Nov 20, 2020 at 5:51 AM Finn Thain <fthain@telegraphics.com.au> wrote:
> There is still some missing hardware support that affects all models,
> such as sound chip and localtalk support. However, many models are well
> supported, including the Quadra 800 emulated by QEMU. Missing hardware
> support is mostly documented at the web site, so add the URL.
>
> Cc: Joshua Thompson <funaho@jurai.org>
> Signed-off-by: Finn Thain <fthain@telegraphics.com.au>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
i.e. will queue in the m68k for-v5.11 branch.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
