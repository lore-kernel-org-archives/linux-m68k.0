Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCA45C6FD19
	for <linux-m68k@archiver.kernel.org>; Mon,  6 Mar 2023 07:22:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229558AbjCFHWC convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 6 Mar 2023 02:22:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229450AbjCFHWC (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 6 Mar 2023 02:22:02 -0500
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C5E81C7CC
        for <linux-m68k@lists.linux-m68k.org>; Sun,  5 Mar 2023 23:21:58 -0800 (PST)
Received: by mail-qt1-f170.google.com with SMTP id h19so9565496qtk.7
        for <linux-m68k@lists.linux-m68k.org>; Sun, 05 Mar 2023 23:21:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678087317;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KF4/rhYJLCb1V3udoZ6HDdLYb1astmKZTSpEt1KMS3k=;
        b=hYoRJtw4OIP7P7hboO59xW6fxvqsPnxByVznph51IrcDkAE8Q1pQFoNfxd4btfLkqd
         8LI3tD3LIA0NzfPTpiB6PnzNpffweY8dzwSqTEoK2sUYeAis0MxwSBntmkueswklkuh/
         UFy6LEpG2WYw0hkwJiu46cA6/9xnL0UAREnHFqkddsLLXtVRVI6bkQpSz/g1/p/Rh42L
         EG7g5em7YwNi+6o+O/ti7HiP6GPx52KNXfpSfYtFNMGQDScDZrj7P9ABb4x1ujmMbr9y
         3DZ7a2lQ9of/I7Ol93dp65Oc1k9j6CBpYgQOxhlQDyA4g8iOlJcJdmF6lxAaI6m7Q9oY
         0Ejw==
X-Gm-Message-State: AO0yUKUJctZVK67UQafiDOUzwLr6S6BAomuQWX5UCVtPLoX5fRtE7XTW
        TTKST01e5qV8bL4s6ky0bznQvIo0mXlg7A==
X-Google-Smtp-Source: AK7set/0E/t/HDGAYEgisyaIvK5hxzh/Y6ItqdcLRhE8u028NsTZiNySlaMOSYMycUHuhPs5f9Ke3g==
X-Received: by 2002:a05:622a:284:b0:3bf:cf9d:ccbd with SMTP id z4-20020a05622a028400b003bfcf9dccbdmr14378308qtw.2.1678087317073;
        Sun, 05 Mar 2023 23:21:57 -0800 (PST)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com. [209.85.219.173])
        by smtp.gmail.com with ESMTPSA id g12-20020ac8124c000000b003b635a5d56csm7081691qtj.30.2023.03.05.23.21.56
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Mar 2023 23:21:56 -0800 (PST)
Received: by mail-yb1-f173.google.com with SMTP id v101so7152267ybi.2
        for <linux-m68k@lists.linux-m68k.org>; Sun, 05 Mar 2023 23:21:56 -0800 (PST)
X-Received: by 2002:a5b:308:0:b0:90d:af77:9ca6 with SMTP id
 j8-20020a5b0308000000b0090daf779ca6mr5841580ybp.7.1678087316135; Sun, 05 Mar
 2023 23:21:56 -0800 (PST)
MIME-Version: 1.0
References: <20230228213738.272178-1-willy@infradead.org> <20230228213738.272178-14-willy@infradead.org>
 <CAMuHMdW5TtUeZDmtHvxw+DxqUADC-OCW=tHE2Gptcoie62T+4w@mail.gmail.com>
 <ZAS1Lq6//oO/0PXe@casper.infradead.org> <0b00a30e-cb7f-d42b-7d16-0ae8d50ed916@gmail.com>
In-Reply-To: <0b00a30e-cb7f-d42b-7d16-0ae8d50ed916@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 6 Mar 2023 08:21:44 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUDrOD3DezbvxaJH6CXxDFRNC7G-8uU7mqVHxZcG6GNBA@mail.gmail.com>
Message-ID: <CAMuHMdUDrOD3DezbvxaJH6CXxDFRNC7G-8uU7mqVHxZcG6GNBA@mail.gmail.com>
Subject: Re: [PATCH v3 13/34] m68k: Implement the new page table range API
To:     Michael Schmitz <schmitzmic@gmail.com>
Cc:     Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org,
        linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-m68k@lists.linux-m68k.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Michael,

On Sun, Mar 5, 2023 at 9:44 PM Michael Schmitz <schmitzmic@gmail.com> wrote:
> On 6/03/23 04:28, Matthew Wilcox wrote:
> > On Sun, Mar 05, 2023 at 11:16:13AM +0100, Geert Uytterhoeven wrote:
> >>> +               while (nr--) {
> >>> +                       __asm__ __volatile__("nop\n\t"
> >>> +                                            ".chip 68040\n\t"
> >>> +                                            "cpushp %%bc,(%0)\n\t"
> >>> +                                            ".chip 68k"
> >>> +                                            : : "a" (paddr + nr * PAGE_SIZE));
> >> As gcc (9.5.0) keeps on calculating "paddr + nr * PAGE_SIZE"
> >> inside the loop (albeit using a shift instead of a multiplication),
> >> please use "paddr" here, followed by "paddr += PAGE_SIZE;".
>
> Are we certain that contiguous vaddr always maps to contiguous paddr?

For a general __flush_pages_to_ram() function, that would not be
guaranteed. But as this is meant for folios, it must be true:
https://elixir.bootlin.com/linux/latest/source/include/linux/mm_types.h#L320

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
