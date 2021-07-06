Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8FA5C07E96
	for <linux-m68k@archiver.kernel.org>; Tue,  6 Jul 2021 07:02:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B753D61973
	for <linux-m68k@archiver.kernel.org>; Tue,  6 Jul 2021 07:02:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230195AbhGFHE6 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 6 Jul 2021 03:04:58 -0400
Received: from mail-vs1-f52.google.com ([209.85.217.52]:40571 "EHLO
        mail-vs1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230146AbhGFHE5 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 6 Jul 2021 03:04:57 -0400
Received: by mail-vs1-f52.google.com with SMTP id u11so6613734vsl.7
        for <linux-m68k@lists.linux-m68k.org>; Tue, 06 Jul 2021 00:02:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9xIwHt5PeAkDjNM0GumPVX7YcEcAvNDDYFz3rxhdD9Y=;
        b=YK/171lEyOIr5B0y5lXdEIREZkVsJSBLiawcCFtP/ERepAKfjaOnNdoJtCWCDJyZxi
         Bcxx3SO0Fb1ro/7LYFGj0BvGO6TKulMMhDlm51glJ4oFefvt5ADQb+kQORszBVlNWch8
         53ElKt0yBT4Oj57byFU1UhcdyBdlIwdFueeSxTkXvzr45LiuLCqNuhY+8z+VVElhKQMc
         F2gBcQMq3VDdZ8XWKcYk9TF31FjMZMNs48bdnuIWtwXwZc0aBfJ9znzC7Hm1I+XuEyWR
         vypkcLdWcJkrmoBFNXTAeC4TbD9rJhd6+M+nUAvsDabkI9FTxQT6pFfUAqQuG+Qfmn1o
         U35A==
X-Gm-Message-State: AOAM531WIqaRKsa3Uh03P8ZVjQNXqNfJbcz1kA+jO5Y0jaxXy9iBRir4
        kLv8qjEhGRUJ3Wfs09Q3KP/8xuwShYnKIMqsCfU=
X-Google-Smtp-Source: ABdhPJwnML5SWGn0qF4isgulOhytCA8swwd1O/FeaZOMpZYf4vXlJfE7PIkxUiW+3hjI+6B7ZBztsOp7S4Y5DihWY3A=
X-Received: by 2002:a67:db05:: with SMTP id z5mr13391517vsj.18.1625554939386;
 Tue, 06 Jul 2021 00:02:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210705204727.10743-1-paskripkin@gmail.com>
In-Reply-To: <20210705204727.10743-1-paskripkin@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 6 Jul 2021 09:02:08 +0200
Message-ID: <CAMuHMdVKgW42GCwntSawRXNvRejm90zhuY9_X_u1OxfDj40aTA@mail.gmail.com>
Subject: Re: [PATCH] m68k: emu: fix invalid free in nfeth_cleanup()
To:     Pavel Skripkin <paskripkin@gmail.com>
Cc:     Petr Stehlik <pstehlik@sophics.cz>, milan.jurik@xylab.cz,
        Michael Schmitz <schmitz@debian.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Mon, Jul 5, 2021 at 10:47 PM Pavel Skripkin <paskripkin@gmail.com> wrote:
> In for loop all nfeth_dev array members should be freed, not only
> the first one. Freeing only first array member can cause double-free bug.
>
> Fixes: 9cd7b148312f ("m68k/atari: ARAnyM - Add support for network
> access")
> Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
i.e. will queue in the m68k for-v5.15 branch.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
