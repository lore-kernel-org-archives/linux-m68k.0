Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC982C433E0
	for <linux-m68k@archiver.kernel.org>; Thu, 21 Jan 2021 08:09:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 798602395B
	for <linux-m68k@archiver.kernel.org>; Thu, 21 Jan 2021 08:09:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726204AbhAUIFo (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 21 Jan 2021 03:05:44 -0500
Received: from mail-ot1-f49.google.com ([209.85.210.49]:38083 "EHLO
        mail-ot1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728134AbhAUIEn (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 21 Jan 2021 03:04:43 -0500
Received: by mail-ot1-f49.google.com with SMTP id 34so820118otd.5
        for <linux-m68k@lists.linux-m68k.org>; Thu, 21 Jan 2021 00:04:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=F2IYvzXGwV6xHNM+MUo0hPQb7UzsectWR0FG/X10PkI=;
        b=gYSJ7Jf7BFqi3n9bngiuNZnDlg3Wnrp4g1eqf5qCpGyNEe1vUy/jcibjJDHD6HYb+b
         jsSGmah7Ap5cf6TGvMKyKoldSk+wGLAs9ZYBrgJKKWxyzS+BzaNk+NppKWssyVIazlzR
         VQAvr/8/63oXm5jefr4guB7suD0+JWWVW4g1JyfENWU4mBm+Y3fQ724pRZwuAdcQgQ2i
         Cen1WQOrN1Zoz1MyZMtYNa5snAnRIyiZy/B81YOdVE7BTzN/DqgPZSS6izw0fNVQsFaw
         4IafM2/BKaN0Yc/hjzZUtLeDeEyUT3pudqOUEw3/X0udPnwKSz5pX3YyP0CbdWu4O0Ho
         WpgQ==
X-Gm-Message-State: AOAM532SsgWPwwH29gN+TtVYqbhgEBNhIe4F0KHT/2u8QgFF3lUTFZcN
        63Bk2AcJp6RJd6r4vdjnRBrSWAqn1BaMmerHDfo=
X-Google-Smtp-Source: ABdhPJzSbca3ijAzNOm3Ms2SefSVDK4WWVoOOJl2SDNzMRneWPfF/x1Lgdp8kPfgBqgJdeUvPiwJBD9V4y25u0g6aww=
X-Received: by 2002:a9d:c01:: with SMTP id 1mr9472201otr.107.1611216229592;
 Thu, 21 Jan 2021 00:03:49 -0800 (PST)
MIME-Version: 1.0
References: <20210121000630.371883-1-yury.norov@gmail.com> <20210121000630.371883-2-yury.norov@gmail.com>
In-Reply-To: <20210121000630.371883-2-yury.norov@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 21 Jan 2021 09:03:38 +0100
Message-ID: <CAMuHMdWe3Mx2q7WJvZa+Wt+TbG7ER086ph8UCSR6yR+Wj73HWg@mail.gmail.com>
Subject: Re: [PATCH 1/6] arch: rearrahge headers inclusion order in asm/bitops
 for m68k and sh
To:     Yury Norov <yury.norov@gmail.com>
Cc:     linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-sh list <linux-sh@vger.kernel.org>,
        Linux-Arch <linux-arch@vger.kernel.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>, Arnd Bergmann <arnd@arndb.de>,
        Dennis Zhou <dennis@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        David Sterba <dsterba@suse.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Stefano Brivio <sbrivio@redhat.com>,
        "Ma, Jianpeng" <jianpeng.ma@intel.com>,
        Wei Yang <richard.weiyang@linux.alibaba.com>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Thu, Jan 21, 2021 at 1:06 AM Yury Norov <yury.norov@gmail.com> wrote:
> m68k and sh include bitmap/find.h prior to ffs/fls headers. New
> fast-path implementation in find.h requires ffs/fls. Reordering
> the order of headers inclusion helps to prevent compile-time
> implicit-function-declaration error.
>
> Signed-off-by: Yury Norov <yury.norov@gmail.com>
> ---
>  arch/m68k/include/asm/bitops.h | 4 ++--

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
