Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 138AFC433F5
	for <linux-m68k@archiver.kernel.org>; Mon,  4 Apr 2022 13:23:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347229AbiDDNZB (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 4 Apr 2022 09:25:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241154AbiDDNZB (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 4 Apr 2022 09:25:01 -0400
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51C913DA67
        for <linux-m68k@lists.linux-m68k.org>; Mon,  4 Apr 2022 06:23:05 -0700 (PDT)
Received: by mail-qk1-f174.google.com with SMTP id h196so7529845qke.12
        for <linux-m68k@lists.linux-m68k.org>; Mon, 04 Apr 2022 06:23:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZellbTNVDmTMxAgtDVNk9zjzT/qb3sIv3YZKoTrbp+w=;
        b=vpdpUtT4bugf3TEY3300EKWgSJ08PbTJf8cFXEEYSirQv5mRegYdHYP0Nk8VSxWA4v
         P8VER5DP9LN5t9vaHhEn4B/IVigD00pGrEJKIs8HoxxumjuxyrG0cf2CiZRVHtyUO7hc
         imVSIkzj9tWekNfa6oan8mtDIGEpnpyCyS1fmm9bsIYQ/PehmshRU3j/3ucAO1uL615y
         mgvIwrIBeUbmooEYEezjfkdh4S/f9Kah5cRqccSFNl/CRuy3DYQXalBz1HHBJxCYttYQ
         OxVkMWrfr/vBwhOv5o5BEID/Z66wN13g9SZ8NZb6mo6sncII9XMlnikzJ0kGfvkTZsWR
         Mo5Q==
X-Gm-Message-State: AOAM533vBY06AIhnAd7QCXnkB3HKCtmTdb5gXqPqvb1BX1ChlpqwOSkb
        JA+Kx9hbHDhrQxZ3qG/ClDjJ8MI15y3GHA==
X-Google-Smtp-Source: ABdhPJyoBcTcIMvEKfmI4IJQUzOoMaqaJ+Ro9H/6D2GmG8vu23RKBywmWksKAg8AmP6fV2/CH/bKeA==
X-Received: by 2002:ae9:e64c:0:b0:67e:6d5a:d30 with SMTP id x12-20020ae9e64c000000b0067e6d5a0d30mr13673701qkl.540.1649078583997;
        Mon, 04 Apr 2022 06:23:03 -0700 (PDT)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com. [209.85.219.169])
        by smtp.gmail.com with ESMTPSA id b82-20020ae9eb55000000b0067b314c0fedsm6479287qkg.42.2022.04.04.06.23.02
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Apr 2022 06:23:03 -0700 (PDT)
Received: by mail-yb1-f169.google.com with SMTP id f23so17525474ybj.7
        for <linux-m68k@lists.linux-m68k.org>; Mon, 04 Apr 2022 06:23:02 -0700 (PDT)
X-Received: by 2002:a25:45:0:b0:633:96e2:2179 with SMTP id 66-20020a250045000000b0063396e22179mr20945994yba.393.1649078582711;
 Mon, 04 Apr 2022 06:23:02 -0700 (PDT)
MIME-Version: 1.0
References: <Yib9F5SqKda/nH9c@infradead.org> <CAK8P3a1dUVsZzhAe81usLSkvH29zHgiV9fhEkWdq7_W+nQBWbg@mail.gmail.com>
 <YkmWh2tss8nXKqc5@infradead.org> <CAK8P3a0QdFOJbM72geYTWOKumeKPSCVD8Nje5pBpZWazX0GEnQ@mail.gmail.com>
In-Reply-To: <CAK8P3a0QdFOJbM72geYTWOKumeKPSCVD8Nje5pBpZWazX0GEnQ@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 4 Apr 2022 15:22:51 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWcg+171ggdVC4gwbQ=RUf+cYrX3o9uSpDxo-XXEJ5Qgw@mail.gmail.com>
Message-ID: <CAMuHMdWcg+171ggdVC4gwbQ=RUf+cYrX3o9uSpDxo-XXEJ5Qgw@mail.gmail.com>
Subject: Re: [RFC PULL] remove arch/h8300
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Christoph Hellwig <hch@infradead.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arch <linux-arch@vger.kernel.org>,
        "moderated list:H8/300 ARCHITECTURE" 
        <uclinux-h8-devel@lists.sourceforge.jp>,
        "open list:TENSILICA XTENSA PORT (xtensa)" 
        <linux-xtensa@linux-xtensa.org>, Max Filippov <jcmvbkbc@gmail.com>,
        Linux-sh list <linux-sh@vger.kernel.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Greg Ungerer <gerg@linux-m68k.org>,
        Damien Le Moal <damien.lemoal@wdc.com>,
        linux-riscv <linux-riscv@lists.infradead.org>,
        Rich Felker <dalias@libc.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Arnd,

On Mon, Apr 4, 2022 at 3:09 PM Arnd Bergmann <arnd@arndb.de> wrote:
> On Sun, Apr 3, 2022 at 2:43 PM Christoph Hellwig <hch@infradead.org> wrote:
> > On Tue, Mar 08, 2022 at 09:19:16AM +0100, Arnd Bergmann wrote:
> > > If there are no other objections, I'll just queue this up for 5.18 in
> > > the asm-generic
> > > tree along with the nds32 removal.
> >
> > So it is the last day of te merge window and arch/h8300 is till there.
> > And checking nw the removal has also not made it to linux-next.  Looks
> > like it is so stale that even the removal gets ignored :(
>
> I was really hoping that someone else would at least comment.

Doh, I hadn't seen this patch before ;-)
Nevertheless, I do not have access to H8/300 hardware.

> 3. arch/sh j2 support was added in 2016 and doesn't see a lot of
> changes, but I think
>     Rich still cares about it and wants to add J32 support (with MMU)
> in the future

Yep, when the SH4 patents will have expired.
I believe that's planned for 2016 (Islamic calendar? ;-)

BTW, the unresponsiveness of the SH maintainers is also annoying.
Patches are sent to the list (sometimes multiple people are solving
the same recurring issue), but ignored.

Anyway, I do regular boot tests on SH4.

> 5. K210 was added in 2020. I assume you still want to keep it.

FTR, I do regular boot tests on K210.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
