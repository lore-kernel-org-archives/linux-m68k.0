Return-Path: <SRS0=2kwO=74=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90E67C433E0
	for <linux-m68k@archiver.kernel.org>; Mon, 15 Jun 2020 11:26:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 783E920663
	for <linux-m68k@archiver.kernel.org>; Mon, 15 Jun 2020 11:26:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729624AbgFOL0f (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 15 Jun 2020 07:26:35 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:42760 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728953AbgFOL0f (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Mon, 15 Jun 2020 07:26:35 -0400
Received: by mail-ot1-f65.google.com with SMTP id t6so12787298otk.9
        for <linux-m68k@vger.kernel.org>; Mon, 15 Jun 2020 04:26:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vCM632mpXZDubOsaw0vvCHNqLzS97lJqTjkLIX3LqIE=;
        b=na+YMYoDcZXRG4p2RZ3xq2Z91LLdbkAu7LHphYH+3BU4LcENo+0I723Q+5/WlhQA4z
         AkFVChrep7McpeTsLfgDjZZ5S05mrHqLK5fO1lrQ+uAskd6oWJl1H2FittWI0dVQ4M4V
         283b+0vJGlODhiHf3G/cw0rPFwpqqWd3Sv/szLqOiozqyk6ZAwuW8aJFpORjudcmjblR
         8NBO7bV2OtFji9lp+fpj0BJPn4GF/255Zts2TQA5e6JIaz4wzV+TQOCG6mypzbeOPGMZ
         njOGTnjeI3MhnhUnWDcQWj4YB2QW5kd1oNq3VHSp0G0zS+Mi4Epge+qhlnfV3O7X/cQu
         gR6Q==
X-Gm-Message-State: AOAM530Cijjgm7p9EiC0ham/1POzVzAFbSjUDsHvpWBRX8IMssNAjE1K
        BFrouvMWS7PELF2/NZ9UWtTKkrVIKT17525D1a8=
X-Google-Smtp-Source: ABdhPJwW/mo+yxxcWXXQBn5X0Uz8FT68ClAnXDspD9sD05rMLkN4F8+mrdu9AoCbfkRmMFTzzzHF047Esf6AUkq02hg=
X-Received: by 2002:a05:6830:141a:: with SMTP id v26mr21148154otp.250.1592220394026;
 Mon, 15 Jun 2020 04:26:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200615063508.2435061-1-gerg@linux-m68k.org>
In-Reply-To: <20200615063508.2435061-1-gerg@linux-m68k.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 15 Jun 2020 13:26:23 +0200
Message-ID: <CAMuHMdV=LORyqrFPLTuysHVBEqcKXuDydr15b883yStjaVrWZQ@mail.gmail.com>
Subject: Re: [PATCH 1/5] m68knommu: fix overwriting of bits in ColdFire V3
 cache control
To:     Greg Ungerer <gerg@linux-m68k.org>
Cc:     "Linux/m68k" <linux-m68k@vger.kernel.org>,
        Joachim Dietrich <jo.dietrich@gmx.de>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Greg,

On Mon, Jun 15, 2020 at 8:38 AM Greg Ungerer <gerg@linux-m68k.org> wrote:
> The Cache Control Register (CACR) of the ColdFire V3 has bits that
> control high level caching functions, and also enable/disable the use
> of the alternate stack pointer register (the EUSP bit) to provide
> separate supervisor and user stack pointer registers. The code as
> it is today will blindly clear the EUSP bit on cache actions like
> invalidation. So it is broken for this case - and that will result
> in failed booting (interrupt entry and exit processing will be
> completely hosed).
>
> This only affects ColdFire V3 parts that support the alternate stack
> register (like the 5329 for example) - generally speaking new parts do,
> older parts don't. It has no impact on ColdFire V3 parts with the single
> stack pointer, like the 5307 for example.
>
> Fix the cache bit defines used, so they maintain the EUSP bit when
> carrying out cache actions through the CACR register.
>
> Signed-off-by: Greg Ungerer <gerg@linux-m68k.org>

Thanks for your patch!

> --- a/arch/m68k/include/asm/m53xxacr.h
> +++ b/arch/m68k/include/asm/m53xxacr.h
> @@ -89,9 +89,9 @@
>   * coherency though in all cases. And for copyback caches we will need
>   * to push cached data as well.
>   */
> -#define CACHE_INIT       CACR_CINVA
> -#define CACHE_INVALIDATE  CACR_CINVA
> -#define CACHE_INVALIDATED CACR_CINVA
> +#define CACHE_INIT        (CACHE_MODE + CACR_CINVA)

This line is different from the RFC v2 in
https://www.spinics.net/lists/linux-m68k/msg13973.html ?

> +#define CACHE_INVALIDATE  (CACHE_MODE + CACR_CINVA)
> +#define CACHE_INVALIDATED (CACHE_MODE + CACR_CINVA)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
