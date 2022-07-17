Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7588CC433EF
	for <linux-m68k@archiver.kernel.org>; Sun, 17 Jul 2022 10:19:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229739AbiGQKTv (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sun, 17 Jul 2022 06:19:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229731AbiGQKTu (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sun, 17 Jul 2022 06:19:50 -0400
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F05AF14018
        for <linux-m68k@lists.linux-m68k.org>; Sun, 17 Jul 2022 03:19:49 -0700 (PDT)
Received: by mail-qk1-f169.google.com with SMTP id m16so2551948qka.12
        for <linux-m68k@lists.linux-m68k.org>; Sun, 17 Jul 2022 03:19:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=R5GgPVzsMxt+e0S7DosYyDp0pAuJJBY0N6Q+Mj0afOs=;
        b=yTu0LxoHmWMgRJMyz14j/5HtlTjYFTtUmgmOHfhMMfZGUza6opsZ6D1JFemjzv0D+r
         pXyMgStRHXIAGDq7sFekUZ+k5+M2JIKyJDspMwUWEJBeH40SdiP7YvyeUAaKJIowh9vO
         mCIY2pUTBl++Kb8JMktbv1JELJDEwleg4bU/DqqiMayuImIn9iiwqV0Uf8iC2Cb8/cKK
         Sz/zTPY+ObFKWX6HBWTmmhU8WKvWe0n1mXFrMYzVR1BmnFFUB6ooyvxiF5314QoQFbfp
         QCG+GzMAyWsSxv90qda42DySGB1tWn971+VALcp2Zi/uNzODHtKt1PoGVvzP/gk39utg
         HYOQ==
X-Gm-Message-State: AJIora+VyQ+hH4dBhZnxKblo4J0zl2800EaxCj+htG4CXv3WqHKqh3qS
        0IQCwKWZaIxOZNtz9hniRmC/jZ2Jlg79Sg==
X-Google-Smtp-Source: AGRyM1u5X1O0pcCztNmg3pETNBzwUelhW5ERNQlPFZrER7/erwzB+hgmf64d9LOcbBmIDCPPa6cQ8Q==
X-Received: by 2002:a05:620a:25c9:b0:6b2:7409:892e with SMTP id y9-20020a05620a25c900b006b27409892emr13953374qko.367.1658053188598;
        Sun, 17 Jul 2022 03:19:48 -0700 (PDT)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com. [209.85.219.170])
        by smtp.gmail.com with ESMTPSA id bp41-20020a05620a45a900b006b5bbd8cb92sm8166180qkb.55.2022.07.17.03.19.48
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 17 Jul 2022 03:19:48 -0700 (PDT)
Received: by mail-yb1-f170.google.com with SMTP id f73so15999169yba.10
        for <linux-m68k@lists.linux-m68k.org>; Sun, 17 Jul 2022 03:19:48 -0700 (PDT)
X-Received: by 2002:a05:6902:1246:b0:66e:ea31:8d05 with SMTP id
 t6-20020a056902124600b0066eea318d05mr23135445ybu.89.1658053187859; Sun, 17
 Jul 2022 03:19:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220716161022.16902-1-dengshaomin@cdjrlc.com>
 <CAMuHMdUhGHXnd=tzLNKT-_enBfs_YZgAHNv6jeNTQ=c_e63urw@mail.gmail.com> <87edykrs7l.fsf@igel.home>
In-Reply-To: <87edykrs7l.fsf@igel.home>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Sun, 17 Jul 2022 12:19:36 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWoY+nCpSDjAUQ8vvz-CMRVis1Pf2W1VKty35BJ8+dKOA@mail.gmail.com>
Message-ID: <CAMuHMdWoY+nCpSDjAUQ8vvz-CMRVis1Pf2W1VKty35BJ8+dKOA@mail.gmail.com>
Subject: Re: [PATCH] mm:%Lx is non-standard C
To:     Andreas Schwab <schwab@linux-m68k.org>
Cc:     dengshaomin@cdjrlc.com, Sam Creasey <sammy@sammy.net>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Sun, Jul 17, 2022 at 12:03 PM Andreas Schwab <schwab@linux-m68k.org> wrote:
> On Jul 17 2022, Geert Uytterhoeven wrote:
> > CC linux-m68k.
> >
> > On Sat, Jul 16, 2022 at 6:10 PM shaom Deng <dengshaomin@cdjrlc.com> wrote:
> >> replace %Lx with %lx, because %Lx is not standard
> >>
> >> Signed-off-by: shaom Deng <dengshaomin@cdjrlc.com>
> >
> > Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
> > i.e. will queue in the m68k for-v5.20 branch.
> >
> >> --- a/arch/m68k/sun3/sun3dvma.c
> >> +++ b/arch/m68k/sun3/sun3dvma.c
> >> @@ -77,7 +77,7 @@ static void print_use(void)
> >>         pr_info("%d entries in use total\n", j);
> >>
> >>         pr_info("allocation/free calls: %lu/%lu\n", dvma_allocs, dvma_frees);
> >> -       pr_info("allocation/free bytes: %Lx/%Lx\n", dvma_alloc_bytes,
> >> +       pr_info("allocation/free bytes: %lx/%lx\n", dvma_alloc_bytes,
> >>                 dvma_free_bytes);
>
> Does that actually work?  The L modifier is equivalent to `ll', not `l',
> and dvma_alloc_bytes and dvma_free_bytes are in fact of type unsigned
> long long.

You're absolutely right.  More coffee needed....

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
