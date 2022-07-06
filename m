Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F4D6C43334
	for <linux-m68k@archiver.kernel.org>; Wed,  6 Jul 2022 10:17:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230269AbiGFKRu (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 6 Jul 2022 06:17:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233062AbiGFKRU (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 6 Jul 2022 06:17:20 -0400
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B93724BFF
        for <linux-m68k@lists.linux-m68k.org>; Wed,  6 Jul 2022 03:17:19 -0700 (PDT)
Received: by mail-oo1-f52.google.com with SMTP id m26-20020a4abc9a000000b00425cd321033so2852593oop.10
        for <linux-m68k@lists.linux-m68k.org>; Wed, 06 Jul 2022 03:17:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kx69JRXRHaP9bPHWeCJjLQ/KjVRjWJF5OqT3P9q0cBs=;
        b=qsde5KAOK4K/MrI3PltGzuRx5jI6XGGR5bGdoGSNWh66KJ5hx9azkkQCGjKE6hTud8
         tMYzhtEIvDvh4S+5qROZ54cpVszfWMx0eurGwHerKEot3nAME3rYGd7vbS9ur/y4IIND
         Yj3r0uCQ6/xwR5kbo/Q1M1wuF0JGl5jFXHX/BbpShvrLEn3z9W4s0zDTrzNv3OQpyin8
         ObeHLsQVODSfvipVQco8m56BTtEteuFe0ba4ME3s+pGEe52cZm1hcxaORtjWENi51sXl
         1rYmnQcjTHMBLjGx+tgPAgxcc4E6lZljpuW2x18xVYeE+uJvARqxz5W9Fk9zTfVqiRun
         UWOQ==
X-Gm-Message-State: AJIora9Hydv7GjLpDsQEn+8WYdPY8TxPDoI/IPNC3H6KnO6nzsl49MHl
        dk4mwyFWtQ0El3NoM90Xq9EWwwasIcsqMJSS
X-Google-Smtp-Source: AGRyM1s5afZyLrGglJ3mxvUZyZ1AKTPmU7PRMoJ3vYcij+7rauP1Lry3w14neAphDNb4CkqqaggOog==
X-Received: by 2002:a4a:944c:0:b0:41c:18de:d334 with SMTP id j12-20020a4a944c000000b0041c18ded334mr15916191ooi.4.1657102637581;
        Wed, 06 Jul 2022 03:17:17 -0700 (PDT)
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com. [209.85.210.41])
        by smtp.gmail.com with ESMTPSA id k8-20020a05687015c800b000fb2aa6eef2sm4360734oad.32.2022.07.06.03.17.17
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Jul 2022 03:17:17 -0700 (PDT)
Received: by mail-ot1-f41.google.com with SMTP id d7-20020a056830004700b0061b8749957fso534270otp.8
        for <linux-m68k@lists.linux-m68k.org>; Wed, 06 Jul 2022 03:17:17 -0700 (PDT)
X-Received: by 2002:a81:5404:0:b0:31c:c24d:94b0 with SMTP id
 i4-20020a815404000000b0031cc24d94b0mr10209449ywb.502.1657102184115; Wed, 06
 Jul 2022 03:09:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220624121313.2382500-1-alexandr.lobakin@intel.com> <20220624121313.2382500-4-alexandr.lobakin@intel.com>
In-Reply-To: <20220624121313.2382500-4-alexandr.lobakin@intel.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 6 Jul 2022 12:09:33 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWB8CjbOarttKSaY2=kASbqU2UBCe9bpU17=MdZP_rGUA@mail.gmail.com>
Message-ID: <CAMuHMdWB8CjbOarttKSaY2=kASbqU2UBCe9bpU17=MdZP_rGUA@mail.gmail.com>
Subject: Re: [PATCH v5 3/9] bitops: unify non-atomic bitops prototypes across architectures
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
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Tom Rix <trix@redhat.com>, kernel test robot <lkp@intel.com>,
        alpha <linux-alpha@vger.kernel.org>,
        "open list:QUALCOMM HEXAGON..." <linux-hexagon@vger.kernel.org>,
        "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Linux-sh list <linux-sh@vger.kernel.org>,
        sparclinux <sparclinux@vger.kernel.org>,
        Linux-Arch <linux-arch@vger.kernel.org>, llvm@lists.linux.dev,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Fri, Jun 24, 2022 at 2:13 PM Alexander Lobakin
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
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

>  arch/m68k/include/asm/bitops.h                | 49 ++++++++++-----

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
