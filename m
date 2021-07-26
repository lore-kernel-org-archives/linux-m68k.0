Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50379C4338F
	for <linux-m68k@archiver.kernel.org>; Mon, 26 Jul 2021 09:23:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2FFF760243
	for <linux-m68k@archiver.kernel.org>; Mon, 26 Jul 2021 09:23:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232156AbhGZInO (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 26 Jul 2021 04:43:14 -0400
Received: from mail-vk1-f177.google.com ([209.85.221.177]:44680 "EHLO
        mail-vk1-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232087AbhGZInN (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 26 Jul 2021 04:43:13 -0400
Received: by mail-vk1-f177.google.com with SMTP id r2so1858153vkl.11
        for <linux-m68k@lists.linux-m68k.org>; Mon, 26 Jul 2021 02:23:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IjJGdTE/tlZseW0pzt6q9F9+mym1b0Btcv6i5Gjm01k=;
        b=MCsaCyhsUdJOtBdpnP+qfiJlNSBP/bMQxC4lcvD4fSY8FBENCjERLcXD16G6dK+xlT
         gQ0nEyG30+gUTE75tospUDB2WQZB2pvtXc9cs/MyfsCZOID8emmKZG3/bt1UAxJ704iQ
         LhnOowMlhQG5fZgXtkXDh3tUNdlQGx6R0VWGxDUO6WCSIlPwfDB13oXPeMWiWpztwx1b
         WB9ynxf45s6xMbmmGEtp7ddOY6xU4xb5Ge8yG7imGvE4fDS75tY11qmqqAAJMT0TtqC2
         jj1hD3Fyr4CTuL1AgL13hz4cESeGcI516i6TDiv40uIwrRtaq45om0DvCWJNsdF5nxOD
         3/4w==
X-Gm-Message-State: AOAM532rKghYwe+Z8VeZy6zB0GOIgJHmU9hVKJVh61Fs06SgUCkesIgO
        eGNwQc4pqZ6UlH1rK9hB9Hbd0aQb5sXBX373xzs=
X-Google-Smtp-Source: ABdhPJzMngFHTfWJxJKBUeUs1WgMw84W9+9SLI15f2X46Ju0B58oyj/TSYhfyq+/enRTeyL3FRCzbQw4VUn+lNK7ay4=
X-Received: by 2002:ac5:cd9b:: with SMTP id i27mr9296318vka.1.1627291422600;
 Mon, 26 Jul 2021 02:23:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210721104318.1070133-1-twd2.me@gmail.com>
In-Reply-To: <20210721104318.1070133-1-twd2.me@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 26 Jul 2021 11:23:31 +0200
Message-ID: <CAMuHMdUWvnz4jCyPctZevq8MdFtCD8MCNSfDbCVR+__rP_=gvw@mail.gmail.com>
Subject: Re: [PATCH] m68k: Remove redefinitions of `PMD_SIZE`, `PMD_MASK`, etc.
To:     Wende Tan <twd2.me@gmail.com>
Cc:     linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        kbuild test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Wende,

On Wed, Jul 21, 2021 at 12:44 PM Wende Tan <twd2.me@gmail.com> wrote:
> Remove redefinitions of `PMD_SIZE`, `PMD_MASK`, `PTRS_PER_PMD`,
> and `__PAGETABLE_PMD_FOLDED` when PGTABLE_LEVELS == 2 (i.e. SUN3 ||
> COLDFIRE).  They have already been defined in
> `asm-generic/pgtable-nopmd.h`.

Thanks for your patch!

> See also https://lore.kernel.org/lkml/202107201907.lqC6B3dF-lkp@intel.com/#t

I'm a bit confused: is this a new issue introduced by the patch from
the above thread, or is this a pre-existing issue?
If the latter, do you know when it was introduced, and how to reproduce it?

> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Wende Tan <twd2.me@gmail.com>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
