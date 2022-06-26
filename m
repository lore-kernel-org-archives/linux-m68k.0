Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61943C43334
	for <linux-m68k@archiver.kernel.org>; Sun, 26 Jun 2022 09:14:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234304AbiFZJOu (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sun, 26 Jun 2022 05:14:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234307AbiFZJOu (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sun, 26 Jun 2022 05:14:50 -0400
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0237025E2
        for <linux-m68k@lists.linux-m68k.org>; Sun, 26 Jun 2022 02:14:49 -0700 (PDT)
Received: by mail-qk1-f177.google.com with SMTP id b125so5005982qkg.11
        for <linux-m68k@lists.linux-m68k.org>; Sun, 26 Jun 2022 02:14:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jbPraZXafoS9hoTYKTZ34AOWnSsSx8JmOQi+FZJXy5o=;
        b=oSv+//XHMWudUXB/E3tdGQ35t4bhMtXqeqQS56enHaFMMLd40IXyMrZuTfImRH1f2W
         kQGh4302eVs0rgfI4vtp6u9jFOeTKPXVMwW2Hp2sDsZ0a4Lrtc3wL5WExqGZS7TKfjTB
         Qg0dliVTGbyPNc7NMgeHr3EsF5S9E6DU3+OjBuxJETZIVtbORV96cVCGUdzPiB16FITE
         d1KRvkpKcK7U/gx3hoxXv45aFBTmTPh9M942UhtKul5MW4av+cAijzxwTKv07wvH3A+e
         IFWuqFNhqY9rvbYgKz99rty7/P/v2UnZAcfZFW0YndzHyxp07QJBzfVoBqmBg2ebAPEy
         HPfg==
X-Gm-Message-State: AJIora/bn+XCBCmVu9iZ0cUc0ygqN/LLvrYM/NXyo1XPzW07wocz3mYu
        AaxVg+23gQSWjCBRLCZ+AreMdXq8FFcRAg==
X-Google-Smtp-Source: AGRyM1svRnaMCJ/8KcJY4M+y2sYyDDhm2DD19qLEJGqwKPjMSzOmG2Ed3n+CzgqSatEVHAUw5umnng==
X-Received: by 2002:a05:620a:2556:b0:6a7:9f07:602 with SMTP id s22-20020a05620a255600b006a79f070602mr4778204qko.207.1656234887674;
        Sun, 26 Jun 2022 02:14:47 -0700 (PDT)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com. [209.85.219.169])
        by smtp.gmail.com with ESMTPSA id g19-20020a37e213000000b006a6bd7028d5sm5867629qki.18.2022.06.26.02.14.47
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Jun 2022 02:14:47 -0700 (PDT)
Received: by mail-yb1-f169.google.com with SMTP id p136so5664841ybg.4
        for <linux-m68k@lists.linux-m68k.org>; Sun, 26 Jun 2022 02:14:47 -0700 (PDT)
X-Received: by 2002:a05:6902:120e:b0:634:6f29:6b84 with SMTP id
 s14-20020a056902120e00b006346f296b84mr7820984ybu.604.1656234886883; Sun, 26
 Jun 2022 02:14:46 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1656234456.git.mchehab@kernel.org> <d6e3482ed622b6953db69cddb70f20c55c96e4da.1656234456.git.mchehab@kernel.org>
In-Reply-To: <d6e3482ed622b6953db69cddb70f20c55c96e4da.1656234456.git.mchehab@kernel.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Sun, 26 Jun 2022 11:14:35 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXu_v28veaFva_VSKMKWjCYSosSr6pGpj5W3kj-MXfzsg@mail.gmail.com>
Message-ID: <CAMuHMdXu_v28veaFva_VSKMKWjCYSosSr6pGpj5W3kj-MXfzsg@mail.gmail.com>
Subject: Re: [PATCH v2 16/20] arch: m68k: q40: README: drop references to IDE driver
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Finn Thain <fthain@linux-m68k.org>,
        Jens Axboe <axboe@kernel.dk>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Sun, Jun 26, 2022 at 11:11 AM Mauro Carvalho Chehab
<mchehab@kernel.org> wrote:
> Since IDE support was deleted by Christoph Hellwig <hch@lst.de>,
> Jun 16 2021, drop the left-over from README file, updating the
> documentation to point to ata/pata_falcon.c.
>
> Fixes: 44b1fbc0f5f3 ("m68k/q40: Replace q40ide driver with pata_falcon and falconide")
> Fixes: b7fb14d3ac63 ("ide: remove the legacy ide driver")
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
