Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B06BC433ED
	for <linux-m68k@archiver.kernel.org>; Wed, 31 Mar 2021 15:02:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 26C696100C
	for <linux-m68k@archiver.kernel.org>; Wed, 31 Mar 2021 15:02:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235842AbhCaPCI (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 31 Mar 2021 11:02:08 -0400
Received: from mail-ua1-f49.google.com ([209.85.222.49]:42953 "EHLO
        mail-ua1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235273AbhCaPB5 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 31 Mar 2021 11:01:57 -0400
Received: by mail-ua1-f49.google.com with SMTP id r8so6217022ual.9
        for <linux-m68k@lists.linux-m68k.org>; Wed, 31 Mar 2021 08:01:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1mc9nk86dCN75VHp4R/+UxN4s8fz6T5fsikzkkqFEsQ=;
        b=VuWWSMDf7JEgnduah18bJzYDOxqhbBzPPXalFm1bAwbTy4X+cdy7o4jNSuIEBi4eKd
         Guq4GHbjbgc+taS73x/BbT/1uUlAnHvApFVc3aIIArAlG8eV/R6vpmcVrujglgj1F/tw
         BUlsn+i100M2gAGfNTxy52Ar3ZJ8Cgdp8vGnjxa8J5Ghed22LQ7C6FZH4O0GlbPaVUHz
         z5q6PXLs4s7d7hseSW4RRF88k5d4Fj7yeXMANSTX3Np1VaYgDe3UThOttEPrp6Mg+tNi
         /mOe88efwUIUDB+KZqdc4yHfA/1RN58256k8teAhK2CNVhmHN6FK/6g+xqV27GrdNPhI
         AsEA==
X-Gm-Message-State: AOAM530OdanOdxGrFzphPMnorprzFO5C9pyN3yMRaJdJOqDX1NY5FZnj
        23GsNod02dbhPcC4A41bM6uuV47CztoIybry6ss=
X-Google-Smtp-Source: ABdhPJwv4UB5s4DrbZZrnToPi7FlyCQu9FFusTEse7S+9tKnQx8PerYCa0X16G17xqd6zcem/NHi8kzk7ZZIQsBRMrw=
X-Received: by 2002:ab0:64cf:: with SMTP id j15mr1794879uaq.4.1617202917239;
 Wed, 31 Mar 2021 08:01:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210331144336.25628-1-masahiroy@kernel.org> <20210331144336.25628-2-masahiroy@kernel.org>
In-Reply-To: <20210331144336.25628-2-masahiroy@kernel.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 31 Mar 2021 17:01:46 +0200
Message-ID: <CAMuHMdW5+ZgLeJ_jFBiWLL0MGEQZhXx56AuJNQb4p8UvQsGB1g@mail.gmail.com>
Subject: Re: [PATCH 2/2] m68k: remove meaningless EXTRA_LDFLAGS
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Wed, Mar 31, 2021 at 4:44 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
> These two Makefiles contain only built-in objects (i.e. obj-y), which
> are collected by $(AR) into a thin-archive.
>
> EXTRA_LDFLAGS is meaningless because $(LD) is not used here.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
i.e. will queue in the m68k for-v5.13 branch.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
