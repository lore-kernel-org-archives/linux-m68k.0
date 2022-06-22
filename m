Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C950C433EF
	for <linux-m68k@archiver.kernel.org>; Wed, 22 Jun 2022 07:24:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352653AbiFVHYb (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 22 Jun 2022 03:24:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229788AbiFVHYb (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 22 Jun 2022 03:24:31 -0400
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8870336E27
        for <linux-m68k@lists.linux-m68k.org>; Wed, 22 Jun 2022 00:24:30 -0700 (PDT)
Received: by mail-qv1-f44.google.com with SMTP id cs6so19463201qvb.6
        for <linux-m68k@lists.linux-m68k.org>; Wed, 22 Jun 2022 00:24:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4rOmmoLVe6WnIaNYIWpF3+s87z6ESD2tlV0e1iwEQK4=;
        b=fRgDDs7nNh87Ff2fdbXTeS1w0iXUY0IUbLvnG78uj4Z2qQo2X3wd1Nc5qivC0t2fUe
         1zDKWrtMklZSA1AzyEI/qJX6ybCuRvoYC0/Jd3uoozg7kgHdAf3YtUjLDP39cFXtHACY
         bsxSH/XFzrKHhdiI1Zbq45rHh8ELEACsRik5vfcIHd2OXbA4YiNaFB0tvOg4JwnVRVYh
         i5HgLW2gi/4MlwtdDFpkVN8PWVS+cX1vkfAd8QCIgEvf8NwFKCYD1bLCJPJ0CLO+XO9o
         tr8KR07CXW62/m1BD4TpnRPS2ssLlseeRRBae2rgxE2Nsbj4ML5U/rPo7RQIF6m/Ihqe
         RHjg==
X-Gm-Message-State: AJIora/At6olpyWhCTPbm3j5Iaiyxy4p1KpaCAeWUcDmTKxql1qE/0Cr
        nW38Emyxmtpnig4m2p6oUqOs/pl8xm1zfg==
X-Google-Smtp-Source: AGRyM1u92SSAWl4rLpaugpcse1h2YrDWF+JqM9NPGdTwocww9LtS1rx5FL83jnEqX/yHsb48C6FkIQ==
X-Received: by 2002:ac8:7fc2:0:b0:304:f234:4597 with SMTP id b2-20020ac87fc2000000b00304f2344597mr1663420qtk.673.1655882669005;
        Wed, 22 Jun 2022 00:24:29 -0700 (PDT)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com. [209.85.219.178])
        by smtp.gmail.com with ESMTPSA id cj11-20020a05622a258b00b002f93ece0df3sm14261670qtb.71.2022.06.22.00.24.28
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jun 2022 00:24:28 -0700 (PDT)
Received: by mail-yb1-f178.google.com with SMTP id l66so27225581ybl.10
        for <linux-m68k@lists.linux-m68k.org>; Wed, 22 Jun 2022 00:24:28 -0700 (PDT)
X-Received: by 2002:a05:6902:120e:b0:634:6f29:6b84 with SMTP id
 s14-20020a056902120e00b006346f296b84mr2248914ybu.604.1655882668340; Wed, 22
 Jun 2022 00:24:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220622062835.53980-1-yuanjilin@cdjrlc.com>
In-Reply-To: <20220622062835.53980-1-yuanjilin@cdjrlc.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 22 Jun 2022 09:24:17 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWDBEQYQZfor=wNzE_BHgCKXEnyW8WJS-dbmU++6zPDCw@mail.gmail.com>
Message-ID: <CAMuHMdWDBEQYQZfor=wNzE_BHgCKXEnyW8WJS-dbmU++6zPDCw@mail.gmail.com>
Subject: Re: [PATCH] m68k:coldfire:Fix typos in comments
To:     yuanjilin@cdjrlc.com
Cc:     Greg Ungerer <gerg@linux-m68k.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Jilin,

On Wed, Jun 22, 2022 at 8:29 AM Jilin Yuan <yuanjilin@cdjrlc.com> wrote:
> Delete the redundant word 'the'.
>
> Signed-off-by: Jilin Yuan <yuanjilin@cdjrlc.com>

Thanks for your patch!

> --- a/arch/m68k/coldfire/intc-2.c
> +++ b/arch/m68k/coldfire/intc-2.c
> @@ -7,7 +7,7 @@
>   * family, the 5270, 5271, 5274, 5275, and the 528x family which have two such
>   * controllers, and the 547x and 548x families which have only one of them.
>   *
> - * The external 7 fixed interrupts are part the the Edge Port unit of these
> + * The external 7 fixed interrupts are part the Edge Port unit of these

The first "the" should be replaced by "of" instead.

>   * ColdFire parts. They can be configured as level or edge triggered.
>   *
>   * (C) Copyright 2009-2011, Greg Ungerer <gerg@snapgear.com>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
