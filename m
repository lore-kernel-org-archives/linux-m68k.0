Return-Path: <SRS0=WAuH=7H=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2AA4C433E1
	for <linux-m68k@archiver.kernel.org>; Mon, 25 May 2020 08:42:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9B869206C3
	for <linux-m68k@archiver.kernel.org>; Mon, 25 May 2020 08:42:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389214AbgEYImQ (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 25 May 2020 04:42:16 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:39588 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388786AbgEYImP (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 25 May 2020 04:42:15 -0400
Received: by mail-ot1-f68.google.com with SMTP id d7so13302160ote.6
        for <linux-m68k@lists.linux-m68k.org>; Mon, 25 May 2020 01:42:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7dzAV8KZ8Ym7WSOSpdUA3W4lVbjJPeT6kKqZXyWkjfc=;
        b=ShW+aKNzjIRMkHJ+hqN+dF4io3RzYtK+L0l6VOSQQfKooag0NdgsC2J+CucA2j1of7
         WOCwUBNqDpap2/zf+xhHPepNNJYybElrzNOHpwLp4LRjP2A7EA22abot7sfYnqPc00/J
         72GYQ+TLQXGX2K73JKIZ4l0ZbsVeRoRNe4QSeqal6+HLNFA7edayOQ4l4ySPKRoXumbx
         iVWR9osZalp9rtNfZQmv17erZLip15lAR7IDp0iK2XeE5Yp1CJthkdfvqFkxiFUvtwe7
         868ZTc/EcTOCImq/yMOQ0wMXgVTMBi2XUZZKO4RoxzvKlKGMtLcIKxKxJOXgD6pOPPSN
         VvcQ==
X-Gm-Message-State: AOAM531v8/QNY21ES1Uwuw2XOAhdZncx4tj+MfW/591fyC/AG/ssoEQt
        99ImAu9oRsFF7rtbbwXa0OZ8rPP9OhQ3NvRY1aA=
X-Google-Smtp-Source: ABdhPJzz7dtr8yQ9BpjnPuyeaBqk0PIAzFr+NPOVZdAmTY4Cev6ZxU9VsWhRfEYi+OP+0Y0PlHR+QmCeFreFODAmsOk=
X-Received: by 2002:a9d:564:: with SMTP id 91mr20489176otw.250.1590396135049;
 Mon, 25 May 2020 01:42:15 -0700 (PDT)
MIME-Version: 1.0
References: <10dff3e7c17d363a4b239aae7b3ebab32bef3547.1589949122.git.fthain@telegraphics.com.au>
In-Reply-To: <10dff3e7c17d363a4b239aae7b3ebab32bef3547.1589949122.git.fthain@telegraphics.com.au>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 25 May 2020 10:42:03 +0200
Message-ID: <CAMuHMdWP_gL25_K6HaR90O1SxBzqy25-E4y_jq+Ozay19zgCRQ@mail.gmail.com>
Subject: Re: [PATCH] m68k/mac: Remove misleading comment
To:     Finn Thain <fthain@telegraphics.com.au>
Cc:     Joshua Thompson <funaho@jurai.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Wed, May 20, 2020 at 6:41 AM Finn Thain <fthain@telegraphics.com.au> wrote:
> This code path was tested on a Quadra 950 a long time ago and the
> comment isn't needed.
>
> Cc: Joshua Thompson <funaho@jurai.org>
> Signed-off-by: Finn Thain <fthain@telegraphics.com.au>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
i.e. will queue in the m68k for-v5.8 branch.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
