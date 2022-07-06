Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42DDEC43334
	for <linux-m68k@archiver.kernel.org>; Wed,  6 Jul 2022 10:08:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232949AbiGFKIg (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 6 Jul 2022 06:08:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229949AbiGFKHz (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 6 Jul 2022 06:07:55 -0400
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 480EC25E8E
        for <linux-m68k@lists.linux-m68k.org>; Wed,  6 Jul 2022 03:07:47 -0700 (PDT)
Received: by mail-qt1-f171.google.com with SMTP id i11so17502737qtr.4
        for <linux-m68k@lists.linux-m68k.org>; Wed, 06 Jul 2022 03:07:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NzIRuH6wU929NRt5HMIsmc4z3oC4w64egTYXgfNitrM=;
        b=b4FIHVraCc0K23hNFdJoNSPirCxsdb5xhhmVQlLEzBUHPbOiOkfyShNQ68LVYQCqZ1
         ASC+lfkC7tKuu0ahDmoO6yFWyVA5zv6NlJ14OdT70kXIPbgT4NkvZ9T/JuAp4Mi7OyIR
         Hm8ZkF6ZxrFaXzSGDY0PLlMglzvmhFnx29mLrNPhROIMNluyDUmCSDPyd53L+roqeOTk
         N85GA0Jc7dfbTy/Ky+732D+JbkDfbgalh6NcX7vkio9EZyP074QHZF/99uYVpckEKZFH
         CVYh7j2KEp8GREvIpP0nkx1zbIdfkHMDaIkCsGK8bVRn4xqcomsO44SIHWDoF4JWfs/S
         Wx2Q==
X-Gm-Message-State: AJIora/Kt+3gdC3xxL9abrF6pCv252sYYbSMuqGLPn3+ViF/aYkwwlyJ
        Bqr3vbWfDT4stgYX0c6cMu5+zZoligmmsDJ+
X-Google-Smtp-Source: AGRyM1vVUv2ImwULKisaJbZmht1ZLWkVBUKeYCgS/y7KmwVNlQWVUNpJ91F2MyA0I6pezSxMzUfnYg==
X-Received: by 2002:a05:6214:2129:b0:470:396d:19c4 with SMTP id r9-20020a056214212900b00470396d19c4mr35016222qvc.34.1657102065965;
        Wed, 06 Jul 2022 03:07:45 -0700 (PDT)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com. [209.85.219.180])
        by smtp.gmail.com with ESMTPSA id b3-20020ac812c3000000b0031bf647b115sm15324509qtj.35.2022.07.06.03.07.44
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Jul 2022 03:07:45 -0700 (PDT)
Received: by mail-yb1-f180.google.com with SMTP id o2so21226154yba.7
        for <linux-m68k@lists.linux-m68k.org>; Wed, 06 Jul 2022 03:07:44 -0700 (PDT)
X-Received: by 2002:a5b:6c1:0:b0:669:a7c3:4c33 with SMTP id
 r1-20020a5b06c1000000b00669a7c34c33mr42474483ybq.543.1657102064364; Wed, 06
 Jul 2022 03:07:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220617144031.2549432-1-alexandr.lobakin@intel.com> <20220617144031.2549432-4-alexandr.lobakin@intel.com>
In-Reply-To: <20220617144031.2549432-4-alexandr.lobakin@intel.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 6 Jul 2022 12:07:33 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWqxqg7JubLK=KOX-V8JjoMbEKRPON+WhST=GKcjn8Y+w@mail.gmail.com>
Message-ID: <CAMuHMdWqxqg7JubLK=KOX-V8JjoMbEKRPON+WhST=GKcjn8Y+w@mail.gmail.com>
Subject: Re: [PATCH v3 3/7] bitops: unify non-atomic bitops prototypes across architectures
To:     Alexander Lobakin <alexandr.lobakin@intel.com>
Cc:     Arnd Bergmann <arnd@arndb.de>, Yury Norov <yury.norov@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Matt Turner <mattst88@gmail.com>,
        Brian Cain <bcain@quicinc.com>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        "David S. Miller" <davem@davemloft.net>,
        Kees Cook <keescook@chromium.org>,
        "Peter Zijlstra (Intel)" <peterz@infradead.org>,
        Marco Elver <elver@google.com>, Borislav Petkov <bp@suse.de>,
        Tony Luck <tony.luck@intel.com>,
        Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
        Jesse Brandeburg <jesse.brandeburg@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        alpha <linux-alpha@vger.kernel.org>,
        "open list:QUALCOMM HEXAGON..." <linux-hexagon@vger.kernel.org>,
        "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Linux-sh list <linux-sh@vger.kernel.org>,
        sparclinux <sparclinux@vger.kernel.org>,
        Linux-Arch <linux-arch@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Fri, Jun 17, 2022 at 7:09 PM Alexander Lobakin
<alexandr.lobakin@intel.com> wrote:
> Currently, there is a mess with the prototypes of the non-atomic
> bitops across the different architectures:
>
> ret     bool, int, unsigned long
> nr      int, long, unsigned int, unsigned long
> addr    volatile unsigned long *, volatile void *
>
> Thankfully, it doesn't provoke any bugs, but can sometimes make
> the compiler angry when it's not handy at all.
> Adjust all the prototypes to the following standard:
>
> ret     bool                            retval can be only 0 or 1
> nr      unsigned long                   native; signed makes no sense
> addr    volatile unsigned long *        bitmaps are arrays of ulongs
>
> Next, some architectures don't define 'arch_' versions as they don't
> support instrumentation, others do. To make sure there is always the
> same set of callables present and to ease any potential future
> changes, make them all follow the rule:
>  * architecture-specific files define only 'arch_' versions;
>  * non-prefixed versions can be defined only in asm-generic files;
> and place the non-prefixed definitions into a new file in
> asm-generic to be included by non-instrumented architectures.
>
> Finally, add some static assertions in order to prevent people from
> making a mess in this room again.
> I also used the %__always_inline attribute consistently, so that
> they always get resolved to the actual operations.
>
> Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Alexander Lobakin <alexandr.lobakin@intel.com>
> Acked-by: Mark Rutland <mark.rutland@arm.com>
> Reviewed-by: Yury Norov <yury.norov@gmail.com>

>  arch/m68k/include/asm/bitops.h                | 49 +++++++++++++------

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
