Return-Path: <SRS0=PT/U=ED=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31B17C56201
	for <linux-m68k@archiver.kernel.org>; Wed, 28 Oct 2020 23:23:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E22A520796
	for <linux-m68k@archiver.kernel.org>; Wed, 28 Oct 2020 23:23:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387602AbgJ1XXp (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 28 Oct 2020 19:23:45 -0400
Received: from mail-oo1-f66.google.com ([209.85.161.66]:41052 "EHLO
        mail-oo1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733098AbgJ1XV6 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 28 Oct 2020 19:21:58 -0400
Received: by mail-oo1-f66.google.com with SMTP id n2so289918ooo.8
        for <linux-m68k@lists.linux-m68k.org>; Wed, 28 Oct 2020 16:21:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+XN02PSejXD+FeqWTrgwKvG1TTSDYTM2yrZb6ygptq8=;
        b=S3wu8u5zgKYnGhevWQqxL9X8cNtQOUCI1WJYIbg3RyICi6Fn1JhBAGXB1JWD7ZbE7S
         GsOOk0XJFocLZdkxGG2Lf4GL+9UI2Qsfh1ZXTEGT9ikDGEZXU/XmZn4VJzxSqmjwHBIF
         VqSaDphpGUDzeLvQyA1Q171QDvjDd1vI6hlYVUqJQ3NZkuiacbyTAeBVajYw1dvajE6v
         hP5h6qk9rqZs7/2TV/UXn2eM8mA1svpatZpfv4ONRkVOmKeVjK3LKI133KHJB8yqCAJd
         Z3O3jVgzeAyMoNWLPEMRUtLC5hRXC+VUMnDWXjM8u+hQbg64GkKeXAoTrZ0V94mIAc4B
         a3WQ==
X-Gm-Message-State: AOAM533cBHBG/e1B9yAPGydJY1kbwm7ONKqyrGYAaWDNjAqx/xNlQtDg
        na0Bb/r94dgLTXdrtn3p6crT/hwrsMTo0x6G1ZC8pJTVrH0Ncw==
X-Google-Smtp-Source: ABdhPJwVZzki+tgZs/Q8WXcxtVj9dxZr8/KAouxapBQlbbCT10SMVoqLjSjBsdSeiewzamwEvqLH3hEqv+123K4FYD8=
X-Received: by 2002:a4a:5d84:: with SMTP id w126mr4993384ooa.1.1603877160928;
 Wed, 28 Oct 2020 02:26:00 -0700 (PDT)
MIME-Version: 1.0
References: <20201027112955.14157-1-rppt@kernel.org> <20201027112955.14157-12-rppt@kernel.org>
In-Reply-To: <20201027112955.14157-12-rppt@kernel.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 28 Oct 2020 10:25:49 +0100
Message-ID: <CAMuHMdU4r4CJ1kBu7gx1jkputjDn2S8Lqkj7RPfa3XUnM1QOFg@mail.gmail.com>
Subject: Re: [PATCH 11/13] m68k/mm: make node data and node setup depend on CONFIG_DISCONTIGMEM
To:     Mike Rapoport <rppt@kernel.org>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Alexey Dobriyan <adobriyan@gmail.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Greg Ungerer <gerg@linux-m68k.org>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        Jonathan Corbet <corbet@lwn.net>,
        Matt Turner <mattst88@gmail.com>, Meelis Roos <mroos@linux.ee>,
        Michael Schmitz <schmitzmic@gmail.com>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Russell King <linux@armlinux.org.uk>,
        Tony Luck <tony.luck@intel.com>,
        Vineet Gupta <vgupta@synopsys.com>,
        Will Deacon <will@kernel.org>,
        alpha <linux-alpha@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux FS Devel <linux-fsdevel@vger.kernel.org>,
        "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Linux MM <linux-mm@kvack.org>,
        arcml <linux-snps-arc@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Mike,

On Tue, Oct 27, 2020 at 12:31 PM Mike Rapoport <rppt@kernel.org> wrote:
> From: Mike Rapoport <rppt@linux.ibm.com>
>
> The pg_data_t node structures and their initialization currently depends on
> !CONFIG_SINGLE_MEMORY_CHUNK. Since they are required only for DISCONTIGMEM
> make this dependency explicit and replace usage of
> CONFIG_SINGLE_MEMORY_CHUNK with CONFIG_DISCONTIGMEM where appropriate.
>
> The CONFIG_SINGLE_MEMORY_CHUNK was implicitly disabled on the ColdFire MMU
> variant, although it always presumed a single memory bank. As there is no
> actual need for DISCONTIGMEM in this case, make sure that ColdFire MMU
> systems set CONFIG_SINGLE_MEMORY_CHUNK to 'y'.
>
> Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>

Thanks for your patch!

> ---
>  arch/m68k/Kconfig.cpu           | 6 +++---
>  arch/m68k/include/asm/page_mm.h | 2 +-
>  arch/m68k/mm/init.c             | 4 ++--
>  3 files changed, 6 insertions(+), 6 deletions(-)

Is there any specific reason you didn't convert the checks for
CONFIG_SINGLE_MEMORY_CHUNK in arch/m68k/kernel/setup_mm.c
and arch/m68k/include/asm/virtconvert.h?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
