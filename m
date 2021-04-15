Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5D06C433ED
	for <linux-m68k@archiver.kernel.org>; Thu, 15 Apr 2021 07:02:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 803C661155
	for <linux-m68k@archiver.kernel.org>; Thu, 15 Apr 2021 07:02:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230090AbhDOHCZ (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 15 Apr 2021 03:02:25 -0400
Received: from mail-vs1-f54.google.com ([209.85.217.54]:37633 "EHLO
        mail-vs1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230056AbhDOHCZ (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 15 Apr 2021 03:02:25 -0400
Received: by mail-vs1-f54.google.com with SMTP id 2so11661131vsh.4
        for <linux-m68k@lists.linux-m68k.org>; Thu, 15 Apr 2021 00:02:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Kh5JSKFgKiI6/fzZSUT75Zk01gVPXzC73l3A3An4ly4=;
        b=RGGiDd6QdCfnMxKsyN5QHl6R4kJXZZgKzVd6MteyzirkQgQEVq5N32FLMRAL5bZu9f
         8Z6APPKpifdu0Sol5ZFoDpmTgn7sjuRVw5xhSp2mMJ1tHZCR84kEgvjewtXK84uhMgzm
         6EaX5vbBouBbBJH9y+/l0fOSHgLiTiIMOAy0e9bDNKtzgeOsr//tsoA9igZHQJ2CFNuT
         0n/RLxeplbaV+iltWr1RsiH36/FVMc1Fy73Kn1XPiQTvFjlsRV4GRm7WpzmQ7rWqrKpx
         GstWqYwkRHhDmGTtwkSq4sCVZoHcRfS87iFpZPvi1yvbMVVsySdqrJ455Umn4wJ1Ezgh
         DsZA==
X-Gm-Message-State: AOAM531rj5bcjuA5z02PaEH+oQakpcZjrlnM3V0UeBiIvkm2wlgMsKbb
        eR1YHOuXK744IByOeWCreBqZBRFIUBvDqV1Jb9Q=
X-Google-Smtp-Source: ABdhPJwcHBEl1MSF99keJBjFtTOX4fbDADDi/QcDjIuZpme2iFOm27l/mD3c6RySflAVeKqvLSnGYRl064suzqej9bs=
X-Received: by 2002:a67:ad10:: with SMTP id t16mr955651vsl.3.1618470122666;
 Thu, 15 Apr 2021 00:02:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210415031450.23379-1-wanjiabing@vivo.com>
In-Reply-To: <20210415031450.23379-1-wanjiabing@vivo.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 15 Apr 2021 09:01:51 +0200
Message-ID: <CAMuHMdWaaTNnSbgBQgxnSNgpZ3HNWyFBoG3UNt5mdKmZPCVJWA@mail.gmail.com>
Subject: Re: [PATCH] m68k: Remove unneeded semicolon
To:     wanjiabing@vivo.com
Cc:     Sam Creasey <sammy@sammy.net>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        kael_w@yeah.net
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Thu, Apr 15, 2021 at 5:15 AM Wan Jiabing <wanjiabing@vivo.com> wrote:
> Fix the following coccicheck warning:
>
> ./arch/m68k/include/asm/sun3xflop.h:109:2-3: Unneeded semicolon
>
> Signed-off-by: Wan Jiabing <wanjiabing@vivo.com>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
i.e. will queue in the m68k for-v5.14 branch.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
