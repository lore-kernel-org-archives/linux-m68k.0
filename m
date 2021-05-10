Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1923C433ED
	for <linux-m68k@archiver.kernel.org>; Mon, 10 May 2021 07:06:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8258161076
	for <linux-m68k@archiver.kernel.org>; Mon, 10 May 2021 07:06:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230029AbhEJHHh (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 10 May 2021 03:07:37 -0400
Received: from mail-vs1-f41.google.com ([209.85.217.41]:36826 "EHLO
        mail-vs1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229863AbhEJHHg (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 10 May 2021 03:07:36 -0400
Received: by mail-vs1-f41.google.com with SMTP id d13so1085503vso.3
        for <linux-m68k@lists.linux-m68k.org>; Mon, 10 May 2021 00:06:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=w4b5xZBUbFwH3cFjEhdPC36TlJkVTjnlDMkhS61w7hA=;
        b=dxfr44HJBsqtxdRfIl6XOS3JHz2CSGM6zGQBADclAMuIS2qo/PNmt8imNpDEPCx9dv
         BLkSO9rUQ61ZTxsHRrwW5uuaW5bMCk+c0h2QcRyQQY0eAmKcEMmks/Rmu/DhF0rt2264
         1OoqX0RocJHmg8mAwyYQiNLmo4mmH3DN5svOZdbmZKzJzsXBFMd2Mzk3t8gEqtRg1Szr
         jUP4/4i0xqZW0Pnl8D4n0+Z5Tmg/JHbczHXLVrW9eRKxtv46yyN2HkAPxgZKLehR1wWl
         mfYyEIvXdutFLPiHkMeYM+NykNCSDAf1wIZX+wEjKV+qPap1biCs1uT8GyQ9BqnEUXiA
         r3Nw==
X-Gm-Message-State: AOAM531YZFhn9XQPGnlU8x3oHM2XoYJrpMyov1595gPME/p0AaxPJgYj
        nddlH0jMLoMccNEo3OWEmLtP7z/s2dCXuO5LZt0=
X-Google-Smtp-Source: ABdhPJxtyIX8XLzN+P+pUoZEK0JN7upG+8+1PT+Mkb/GwnjUoZoy4T+TBC+i1jtUiImMOYiRBJVbX4wBT4fvTMVEins=
X-Received: by 2002:a67:bc6:: with SMTP id 189mr10633385vsl.3.1620630391862;
 Mon, 10 May 2021 00:06:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210510030836.11834-1-wanjiabing@vivo.com>
In-Reply-To: <20210510030836.11834-1-wanjiabing@vivo.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 10 May 2021 09:06:20 +0200
Message-ID: <CAMuHMdUB-fqw=h+VGvbT1NKzWWAw6e_A_j7sv2Jnciikh7FNGw@mail.gmail.com>
Subject: Re: [PATCH] m68k: dma: remove unnecessary include of asm/cacheflush.h
To:     wanjiabing@vivo.com
Cc:     Pekka Enberg <penberg@kernel.org>, Mike Rapoport <rppt@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        kael_w@yeah.net
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Mon, May 10, 2021 at 5:08 AM Wan Jiabing <wanjiabing@vivo.com> wrote:
> In commit ca15ca406f660 ("mm: remove unneeded includes of
> <asm/pgalloc.h>"), asm/cacheflush.h independent on the MACRO
> was included at line 18. The include here is unnecessary. Remove it.
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
