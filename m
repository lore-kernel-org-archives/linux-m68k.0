Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4142C433DB
	for <linux-m68k@archiver.kernel.org>; Fri, 29 Jan 2021 06:43:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A8B5F64DD9
	for <linux-m68k@archiver.kernel.org>; Fri, 29 Jan 2021 06:43:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232050AbhA2GnI (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 29 Jan 2021 01:43:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231942AbhA2Gm5 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 29 Jan 2021 01:42:57 -0500
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com [IPv6:2607:f8b0:4864:20::d2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70BDDC061573
        for <linux-m68k@lists.linux-m68k.org>; Thu, 28 Jan 2021 22:41:57 -0800 (PST)
Received: by mail-io1-xd2d.google.com with SMTP id d13so8249323ioy.4
        for <linux-m68k@lists.linux-m68k.org>; Thu, 28 Jan 2021 22:41:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iVAMGV92J/f/CkteAMcDz3wL9cSpiXqRvqsJUAbs4+w=;
        b=pdaI6T09b4/35M8LZtfd5am6EJAi2hkvXoRBPVsi32LE8VBjR2dU2H7w8K9Ql8iAgf
         VrbhUdwoVGL2ljic5eUiSCFsmaiCNtoueptBpiOAX8TLmIpI5z6pB8qdLSczv34d+Nv8
         ZJSHqxyJgDo/rpNrzFxWaOCty38aakVFP7Gg6NzCpVwtv2hvrjgjoprP8QmvdZ1CRALU
         xoi4Vdjt7+GltZVxJ8M5qAFeboZsNzHSZtxopPNx0cHM2nEGvt9LKCdEkZSm1R12TMPt
         /OgMU7DX0mEN8j+431T3Mddp5jaf+1bIjJ8a/hYU8wjo8+OOE9ho17+xgpFYiKAeldfy
         lk5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iVAMGV92J/f/CkteAMcDz3wL9cSpiXqRvqsJUAbs4+w=;
        b=mIR/WK1bCWx4M6F8SFrxHgOffL2y1kd9bcfpkdGXCUHURqqufMX/S5CuHnSixoUSyz
         EMmBp65g4PcxG9Bxuc/rxH61PeELfIClxIcMGFV6HIfvcxuyxdk3OiXBbMMadMX2PL36
         HaUIQAvMot2DxKrxaHlmQ57GY36fMB0ggFDvnAUetlVjySu0ASSnC8l+6tE9VHll4Bk0
         0Qa8vjSYsEjNJ5xAvak+5VovXxQ4IWaIeaGrh6UVnCEZ2/BzmnUxPFiaM7MmrCBOldfa
         8WNQbOupBXG8UlfLFHZ5hRKduZnmUv7jyL5slzSNOi9O7OQF69tLsPDuNiC8waS8670o
         HF/A==
X-Gm-Message-State: AOAM530tJ8ib/X1dCZg4X499nE22Lc6YvaFxrCmBl+NLaHvs6v0Xzwml
        TJCOOxXfOmfgHFGjkt+xH869Wntse/NYS1/dOfo=
X-Google-Smtp-Source: ABdhPJxBYeN3I1wdA2fWrBSBowJmYe8hGPdJD45A7zJciUI858z9CrZbB7j0UfSZvdn/5JVuocI+7v+FXFR9WB/DEtw=
X-Received: by 2002:a6b:8f58:: with SMTP id r85mr2296622iod.132.1611902516781;
 Thu, 28 Jan 2021 22:41:56 -0800 (PST)
MIME-Version: 1.0
References: <20210121000630.371883-1-yury.norov@gmail.com> <20210121000630.371883-5-yury.norov@gmail.com>
 <YAlXMj7sIoPjZP3W@smile.fi.intel.com>
In-Reply-To: <YAlXMj7sIoPjZP3W@smile.fi.intel.com>
From:   Yury Norov <yury.norov@gmail.com>
Date:   Thu, 28 Jan 2021 22:41:45 -0800
Message-ID: <CAAH8bW8LSk4Jr_T0TZqfmzgXPQ4MMGJoN6OF664F+SGLYJG+Eg@mail.gmail.com>
Subject: Re: [PATCH 4/6] lib: inline _find_next_bit() wrappers
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-m68k@lists.linux-m68k.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-sh@vger.kernel.org, linux-arch@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>, Arnd Bergmann <arnd@arndb.de>,
        Dennis Zhou <dennis@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        David Sterba <dsterba@suse.com>,
        Stefano Brivio <sbrivio@redhat.com>,
        "Ma, Jianpeng" <jianpeng.ma@intel.com>,
        Wei Yang <richard.weiyang@linux.alibaba.com>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Thu, Jan 21, 2021 at 2:27 AM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Wed, Jan 20, 2021 at 04:06:28PM -0800, Yury Norov wrote:
> > lib/find_bit.c declares five single-line wrappers for _find_next_bit().
> > We may turn those wrappers to inline functions. It eliminates
> > unneeded function calls and opens room for compile-time optimizations.
>
> ...
>
> > --- a/include/asm-generic/bitops/le.h
> > +++ b/include/asm-generic/bitops/le.h
> > @@ -4,6 +4,7 @@
> >
> >  #include <asm/types.h>
> >  #include <asm/byteorder.h>
> > +#include <asm-generic/bitops/find.h>
>
> I'm wondering if generic header inclusion should go before arch-dependent ones.
>
> ...
>
> > -#ifndef find_next_bit
>
> > -#ifndef find_next_zero_bit
>
> > -#if !defined(find_next_and_bit)
>
> > -#ifndef find_next_zero_bit_le
>
> > -#ifndef find_next_bit_le
>
> Shouldn't you leave these in new wrappers as well?
>
> --
> With Best Regards,
> Andy Shevchenko

Could you please elaborate? Wrappers in find.h are protected, functions
in lib/find_bit.c too. Maybe I misunderstood you?..
