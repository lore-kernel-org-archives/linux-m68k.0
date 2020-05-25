Return-Path: <SRS0=WAuH=7H=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E112DC433E0
	for <linux-m68k@archiver.kernel.org>; Mon, 25 May 2020 08:49:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BE5C8207FB
	for <linux-m68k@archiver.kernel.org>; Mon, 25 May 2020 08:49:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389205AbgEYItO (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 25 May 2020 04:49:14 -0400
Received: from mail-oo1-f65.google.com ([209.85.161.65]:40029 "EHLO
        mail-oo1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388342AbgEYItO (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 25 May 2020 04:49:14 -0400
Received: by mail-oo1-f65.google.com with SMTP id f39so128263ooi.7
        for <linux-m68k@lists.linux-m68k.org>; Mon, 25 May 2020 01:49:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=M+PuH/pTGAFDoL2hcME8N+/oYCZf4CIdiqezjAv2DZ0=;
        b=ZG6/2X2hL3AtYMOvisAwcShVhhvcLWLmFnLaEpCDNoeo5yhgrLpNOQ0sSPyWokB5Vf
         wSalF7ET0R2OXV4HPXSeEmrhAzfWgmr6g+5S2WQZixSALjeZpF5XU1zRXrJ6asTt1YT0
         PqI/ajvVyYcxKFDTGpNR3TckUKH2onZDGJFAqREtx4UFpSEd0LZ8AqIkj7sZNqh6bKZg
         N2r/Q3dG+eNM9vQH8RpQkeuSz8PVE5duOyXS8NxBXdHGCyDy1vpA4iYireioyfvPu2g1
         6Gi3o5Zt4I5AmN5od625TwkSPO6hEiqwzhIqUtuFAdgHbxTDXTT7eZzY16DqU8hGfVcj
         1ilA==
X-Gm-Message-State: AOAM532EPGwY5AU86m/5KlEkExdHKlY86OeeZ8XsZ+IcljA02kS3VTiO
        6q5koUrrLWzFhGoaefP6XjqzZkqhZO7WLIVHHeIpWV/E
X-Google-Smtp-Source: ABdhPJwx++7vr09NOyjF/OrUTnNC3we2My4ZE1fNWT4N/UM+Ioatv7uIPOceNSYDHBQKEw3b7wBE7TZ7HQRP/gO1ySY=
X-Received: by 2002:a4a:95d0:: with SMTP id p16mr12463896ooi.40.1590396553331;
 Mon, 25 May 2020 01:49:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200521185707.GA3661@embeddedor>
In-Reply-To: <20200521185707.GA3661@embeddedor>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 25 May 2020 10:49:02 +0200
Message-ID: <CAMuHMdUGPMrPTqypGpnhe2wdpnbtUOsdUacnrHAapBM_996F5A@mail.gmail.com>
Subject: Re: [PATCH] m68k: tools: Replace zero-length array with
 flexible-array member
To:     "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc:     linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Thu, May 21, 2020 at 8:52 PM Gustavo A. R. Silva
<gustavoars@kernel.org> wrote:
> The current codebase makes use of the zero-length array language
> extension to the C90 standard, but the preferred mechanism to declare
> variable-length types such as these ones is a flexible array member[1][2],
> introduced in C99:
>
> struct foo {
>         int stuff;
>         struct boo array[];
> };
>
> By making use of the mechanism above, we will get a compiler warning
> in case the flexible array does not occur last in the structure, which
> will help us prevent some kind of undefined behavior bugs from being
> inadvertently introduced[3] to the codebase from now on.
>
> Also, notice that, dynamic memory allocations won't be affected by
> this change:
>
> "Flexible array members have incomplete type, and so the sizeof operator
> may not be applied. As a quirk of the original implementation of
> zero-length arrays, sizeof evaluates to zero."[1]
>
> This issue was found with the help of Coccinelle.
>
> [1] https://gcc.gnu.org/onlinedocs/gcc/Zero-Length.html
> [2] https://github.com/KSPP/linux/issues/21
> [3] commit 76497732932f ("cxgb3/l2t: Fix undefined behaviour")
>
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
i.e. will queue in the m68k for-v5.8 branch.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
