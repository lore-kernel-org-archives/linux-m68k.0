Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B552C41535
	for <linux-m68k@archiver.kernel.org>; Thu, 22 Dec 2022 14:15:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235711AbiLVOO7 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 22 Dec 2022 09:14:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235664AbiLVOOU (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 22 Dec 2022 09:14:20 -0500
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0DA330579
        for <linux-m68k@lists.linux-m68k.org>; Thu, 22 Dec 2022 06:12:33 -0800 (PST)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-466c5fb1c39so15878007b3.10
        for <linux-m68k@lists.linux-m68k.org>; Thu, 22 Dec 2022 06:12:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DaSeJ7b4XoTWS2Tt6rTxmu6n/STTyq8+F8PwIAXlFPg=;
        b=ZTvjWo/W33z3gzSb8j9IITNlToLhmJ3XN7jd+DR522S/eqEnz00isxuNxKeiOSEIEp
         kDEik67n44Lps4OGOEGYB6WrtBBgKLRHFqeI3HuoFfYSJs9ShqSP+4INOrRtLQvFejz+
         NDHsmRsq89IIv4W9fkvjdIZimumMnZhL6lYU6urjszKhX7Z3+Qw1hGUZfXAON/Gz8SI7
         hwuO9xrWUdauDzFZxNfa1nU8WZhYns+4lgVR1GpXtUK1Gpe+8CywVM6XJ+gObes9m5Ia
         ivAXRkgHIBHKjHSIaainywjNHyege3sp0WQgJieT+hg9WSJ3k5Q970atQ0bfkBkPPqR8
         +r4w==
X-Gm-Message-State: AFqh2krsWMkqvJgOE4PeJf30elgrsaYCPxKWuxHyOZnZhcFq/2F7GB/y
        d3xK0Vk4NdT2XroYS6dXPdTvK3K3r+4YIg==
X-Google-Smtp-Source: AMrXdXsv6uc2JZRRm8ioDfLbIP3rGL95sx7engw5twbaruslWfRrnsGUQBVSkQJsEXSPERMjUs9rUQ==
X-Received: by 2002:a05:7500:2303:b0:ea:9ef4:3601 with SMTP id t3-20020a057500230300b000ea9ef43601mr467065gac.38.1671718352487;
        Thu, 22 Dec 2022 06:12:32 -0800 (PST)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com. [209.85.219.171])
        by smtp.gmail.com with ESMTPSA id w26-20020a05620a095a00b006fc6529abaesm324746qkw.101.2022.12.22.06.12.31
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Dec 2022 06:12:31 -0800 (PST)
Received: by mail-yb1-f171.google.com with SMTP id j206so2097171ybj.1
        for <linux-m68k@lists.linux-m68k.org>; Thu, 22 Dec 2022 06:12:31 -0800 (PST)
X-Received: by 2002:a25:d243:0:b0:702:90b4:2e24 with SMTP id
 j64-20020a25d243000000b0070290b42e24mr417369ybg.365.1671718351056; Thu, 22
 Dec 2022 06:12:31 -0800 (PST)
MIME-Version: 1.0
References: <20221222114635.1251934-1-andrzej.hajda@intel.com>
In-Reply-To: <20221222114635.1251934-1-andrzej.hajda@intel.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 22 Dec 2022 15:12:19 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUE-a6SffG1PH=WfrMx-CNLB9EfUr4qmL_USBP31YGoNg@mail.gmail.com>
Message-ID: <CAMuHMdUE-a6SffG1PH=WfrMx-CNLB9EfUr4qmL_USBP31YGoNg@mail.gmail.com>
Subject: Re: [PATCH 00/19] Introduce __xchg, non-atomic xchg
To:     Andrzej Hajda <andrzej.hajda@intel.com>
Cc:     linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-snps-arc@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        linux-hexagon@vger.kernel.org, linux-ia64@vger.kernel.org,
        loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
        linux-mips@vger.kernel.org, openrisc@lists.librecores.org,
        linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
        linux-xtensa@linux-xtensa.org, intel-gfx@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, Arnd Bergmann <arnd@arndb.de>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Boqun Feng <boqun.feng@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Andrzej,

Thanks for your series!

On Thu, Dec 22, 2022 at 12:49 PM Andrzej Hajda <andrzej.hajda@intel.com> wrote:
> I hope there will be place for such tiny helper in kernel.
> Quick cocci analyze shows there is probably few thousands places
> where it could be useful.
> I am not sure who is good person to review/ack such patches,
> so I've used my intuition to construct to/cc lists, sorry for mistakes.
> This is the 2nd approach of the same idea, with comments addressed[0].
>
> The helper is tiny and there are advices we can leave without it, so
> I want to present few arguments why it would be good to have it:
>
> 1. Code readability/simplification/number of lines:
>
> Real example from drivers/net/ethernet/mellanox/mlx5/core/esw/qos.c:
> -       previous_min_rate = evport->qos.min_rate;
> -       evport->qos.min_rate = min_rate;
> +       previous_min_rate = __xchg(evport->qos.min_rate, min_rate);

Upon closer look, shouldn't that be

    previous_min_rate = __xchg(&evport->qos.min_rate, min_rate);

?

> For sure the code is more compact, and IMHO more readable.
>
> 2. Presence of similar helpers in other somehow related languages/libs:
>
> a) Rust[1]: 'replace' from std::mem module, there is also 'take'
>     helper (__xchg(&x, 0)), which is the same as private helper in
>     i915 - fetch_and_zero, see latest patch.
> b) C++ [2]: 'exchange' from utility header.
>
> If the idea is OK there are still 2 qestions to answer:
>
> 1. Name of the helper, __xchg follows kernel conventions,
>     but for me Rust names are also OK.

Before I realized the missing "&", I wondered how this is different
from swap(), so naming is important.
https://elixir.bootlin.com/linux/latest/source/include/linux/minmax.h#L139

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
