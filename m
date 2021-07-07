Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66660C07E95
	for <linux-m68k@archiver.kernel.org>; Wed,  7 Jul 2021 17:26:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3377061C91
	for <linux-m68k@archiver.kernel.org>; Wed,  7 Jul 2021 17:26:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230162AbhGGR2n (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 7 Jul 2021 13:28:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229949AbhGGR2n (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 7 Jul 2021 13:28:43 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1156C061574
        for <linux-m68k@lists.linux-m68k.org>; Wed,  7 Jul 2021 10:26:02 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id b2so4497161ejg.8
        for <linux-m68k@lists.linux-m68k.org>; Wed, 07 Jul 2021 10:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CEEWx+Agfci6msVOCtYXN5NDbieVyI/f3RzczKPLAFU=;
        b=inZbLvGxVf98FTFjF604VAc9h6LIwYGerIC20fPdGfRlHRphgzkCwPYgZOSrcHr0i5
         O93C6SkdIyxWevCOcuFqJmCq2LJBjjaOdc7bqEtmTKKjW8PrngSZozTJvcI44sEskyGy
         9r34zyULZ8nSh8rvxMBc/v888UUHVPT6KcYNzF2qsuptvFXn6sIT9Ohi0Rwpxhz4wO8s
         LnbuyXM3BCYzXnSOONQAYsP/5LBm16dTl51q0tM/mpfIXgBwPOrTMGaFpkMBDLYcWVjV
         L4Eby3RS7EXSE6HAdTc3j/DBFTrQ16XkMDFDc6MqgwZgU1AjFUQpl9QioPCiafb+QdX0
         qYGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CEEWx+Agfci6msVOCtYXN5NDbieVyI/f3RzczKPLAFU=;
        b=n/Wg/cUVfVcxpaT2ssnui7fVPhnuUd3v31WbjQ5ruvQPT20G1TgqLlRQXhTkOloKi6
         gI+KdbDJpyMK7NWvjrtu/e5S/MvwqD09RULJnLFJ5OGr+aBqHz35P7QYhf3r4ZlhH3Bq
         9XrgG80PHNYdC5oH9YBkoOS56aujtMKKc0/ejDqI4KVSmvsYDRceWz65zWvenEVn/Cfp
         n6UiqoL7J0i0ZHrnR9jkhAyGRt76Mz3AmS1EDNjrWUpFFTjmz3YhCn6bkHEzwc5luRm9
         Ie+3hKPzupPZrEvbp7fz3oCLKNY5jbVOqUta4XWv3qNMEodvp4FCXcTRY6qG0seMlDud
         sChg==
X-Gm-Message-State: AOAM532CzxDeuaIEZcpP46wc/TW2pfKEFRfMO7bLreH8r1BlyUq2s8CY
        K5M6knX9MAz6+x8POU2VtH0I7wFfFle1nc3RRDI=
X-Google-Smtp-Source: ABdhPJxw1Jhg9j+lPF+XGBUe2mopy0bQo5zSumCrBkebSru5fpRDg9IVmCv6iRtxuosl+CJo4B1qZz58jvl4aDESZXM=
X-Received: by 2002:a17:906:c148:: with SMTP id dp8mr24709133ejc.507.1625678761411;
 Wed, 07 Jul 2021 10:26:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210707161614.13001-1-rdunlap@infradead.org>
In-Reply-To: <20210707161614.13001-1-rdunlap@infradead.org>
From:   Yang Shi <shy828301@gmail.com>
Date:   Wed, 7 Jul 2021 10:25:49 -0700
Message-ID: <CAHbLzkrux+MUof_d-6OmuEYJ-V1k4V_3BY45HafjLoN_9TRQ8g@mail.gmail.com>
Subject: Re: [PATCH] mm: try_to_unmap() is now void
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Hugh Dickins <hughd@google.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linux MM <linux-mm@kvack.org>,
        Greg Ungerer <gerg@linux-m68k.org>,
        linux-m68k@lists.linux-m68k.org, uclinux-dev@uclinux.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Wed, Jul 7, 2021 at 9:16 AM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> Fix the "CONFIG_MMU is not set" case of converting
> try_to_unmap() from bool to void.
> (as seen on m68k/coldfire)
>
> In file included from ../mm/vmscan.c:33:
> ../mm/vmscan.c: In function 'shrink_page_list':
> ../include/linux/rmap.h:294:34: warning: statement with no effect [-Wunused-value]
>   294 | #define try_to_unmap(page, refs) false
>       |                                  ^~~~~
> ../mm/vmscan.c:1508:4: note: in expansion of macro 'try_to_unmap'
>  1508 |    try_to_unmap(page, flags);
>       |    ^~~~~~~~~~~~
>

Thanks for the patch. hch sent a similar patch
(https://lore.kernel.org/linux-mm/20210705053944.885828-1-hch@lst.de/)
and it has been in -mm tree.

> Fixes: 1fb08ac63bee ("mm: rmap: make try_to_unmap() void function")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Yang Shi <shy828301@gmail.com>
> Cc: Hugh Dickins <hughd@google.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: linux-mm@kvack.org
> Cc: Greg Ungerer <gerg@linux-m68k.org>
> Cc: linux-m68k@lists.linux-m68k.org
> Cc: uclinux-dev@uclinux.org
> ---
> v2: add linux-mm m.l.
>     add M68K/Coldfire Cc's
>     change to static inline function.
>
>  include/linux/rmap.h |    3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> --- linux-next-20210701.orig/include/linux/rmap.h
> +++ linux-next-20210701/include/linux/rmap.h
> @@ -291,7 +291,8 @@ static inline int page_referenced(struct
>         return 0;
>  }
>
> -#define try_to_unmap(page, refs) false
> +static inline void try_to_unmap(struct page *page, enum ttu_flags flags)
> +{}
>
>  static inline int page_mkclean(struct page *page)
>  {
