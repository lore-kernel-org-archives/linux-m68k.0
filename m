Return-Path: <SRS0=uzpD=6N=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 283B5C83004
	for <linux-m68k@archiver.kernel.org>; Wed, 29 Apr 2020 07:46:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 05C262076B
	for <linux-m68k@archiver.kernel.org>; Wed, 29 Apr 2020 07:46:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726423AbgD2HqX (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 29 Apr 2020 03:46:23 -0400
Received: from mail-oo1-f66.google.com ([209.85.161.66]:39213 "EHLO
        mail-oo1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726345AbgD2HqX (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 29 Apr 2020 03:46:23 -0400
Received: by mail-oo1-f66.google.com with SMTP id c83so223215oob.6
        for <linux-m68k@lists.linux-m68k.org>; Wed, 29 Apr 2020 00:46:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CU1r87DEf9EDqidLSkEplO1lYUftmrsA2E1BOSxydts=;
        b=UsnM1AxKylkv7qvGGPq4Yl6lmzRfwllklubUb1Ua8v5tAMa3NMODAVU4us/UlUCWm2
         wIlzOaEFpcYMaeir3UPGzDU+bbZLvRz5Rls23D+z1TaGs/gZ5noAw4cSH4iPlt7vBiuI
         Duwowfoo+uqNlfSpJEcuDtw+SxS8kNmFM5ti4DZ1pG/XDtK2Dvn2Y/xkkLyOiLjKzEIO
         n4bi7vKdMHTOs90is8By0ioZosaL5+20jPpxuFIzcb+BPkg7usez6mEGEFKdZfFxkRJ0
         C07/vpyAFRrHMIhblu/8lgFk1On3w6WKtTFaeDrypisp9e4D598gfj9BAcWbksE50T/Y
         ySKA==
X-Gm-Message-State: AGi0PubWrOVpWPYucAXoNltK+1hqclkWqpG8BF/antMja4LMXtgI9zFM
        HXfY8g/7iVrDAjgI4SKOqJfq+DuZVsAoDwYMQcA=
X-Google-Smtp-Source: APiQypJ1jF9TjWe+vcX7uWBgHl1A6eOvqackk+9xrvO3ayUppWZISci79o2WVinUCoWwPQ4zAS5OLGLEWmUjOOFs7qM=
X-Received: by 2002:a4a:e8db:: with SMTP id h27mr26395547ooe.40.1588146382572;
 Wed, 29 Apr 2020 00:46:22 -0700 (PDT)
MIME-Version: 1.0
References: <20200428194449.22615-1-willy@infradead.org> <20200428194449.22615-7-willy@infradead.org>
In-Reply-To: <20200428194449.22615-7-willy@infradead.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 29 Apr 2020 09:46:11 +0200
Message-ID: <CAMuHMdXDJ0dBL-JetLd2iN1gzXirf9Z29nSwEHxsVZdFzvm1DA@mail.gmail.com>
Subject: Re: [PATCH 6/7] mm: Set pt_mm in PTE constructor
To:     Matthew Wilcox <willy@infradead.org>
Cc:     Linux MM <linux-mm@kvack.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Will Deacon <will@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Russell King <linux@armlinux.org.uk>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Tue, Apr 28, 2020 at 9:45 PM Matthew Wilcox <willy@infradead.org> wrote:
> From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
>
> By setting pt_mm for pages in use as page tables, we can help with
> debugging and lay the foundation for handling hardware errors in page
> tables more gracefully.  It also opens up the possibility for adding
> more sanity checks in the future.
>
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>

>  arch/m68k/include/asm/mcf_pgalloc.h | 2 +-
>  arch/m68k/mm/motorola.c             | 2 +-

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
