Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFD8ACDB465
	for <linux-m68k@archiver.kernel.org>; Mon, 16 Oct 2023 09:12:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232459AbjJPJM0 convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 16 Oct 2023 05:12:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232418AbjJPJMZ (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 16 Oct 2023 05:12:25 -0400
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A340AB
        for <linux-m68k@lists.linux-m68k.org>; Mon, 16 Oct 2023 02:12:24 -0700 (PDT)
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-d9b9adaf291so1316987276.1
        for <linux-m68k@lists.linux-m68k.org>; Mon, 16 Oct 2023 02:12:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697447543; x=1698052343;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lc70JsqUxydN6ziam4wYfEF4cooz3zSobnEoW7SHk6M=;
        b=uSOpMo265SnaUh1JOeHRFfpZ26MmiUBKn3gCahC6D8BjuUR4ntFuZkAT0A6oAuYHvQ
         xFaeLtnu/6g+ntcpjZ9/cSVZ4RmbJLaCgp/yRHNp3u1HdHOGLCWUb+/OeXbXRRk6e1qH
         Od5PE0KnSpEkIbW2CGutc2Cj7vgnvamC1Xvy/zFcfMZPQVu2lp6lJ/Z+Mu7UiA/Hv+3l
         YZavknNoaVWkqe6fV2izui92Md7dqeOLlUx/5/WycMqVXnt/2ZxhCTUMl5Kpo+4i80ef
         XVJTLHDzYG4lx0A51m/0+q8ibhs0gFAreAOMP5LqVxC4zvQYIxkHpz2uZ86GzvpoRBhZ
         TogQ==
X-Gm-Message-State: AOJu0YzdAjiotACpvjPYcOnqNl7mgU5VCwFgHV9Nmun1Qy+F3rVtrAX4
        WAdw7jDH/Mkwcem6aMxpt68JmcxHmYanGA==
X-Google-Smtp-Source: AGHT+IEsnieLb7JPnQzVHk7TukTLa67rvHrcfjTO1kYFIMW7Tkol8PET4CBlve1ZkNFIHAo5P9nO9w==
X-Received: by 2002:a25:27c7:0:b0:d81:ce57:571a with SMTP id n190-20020a2527c7000000b00d81ce57571amr31447190ybn.54.1697447543079;
        Mon, 16 Oct 2023 02:12:23 -0700 (PDT)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com. [209.85.128.172])
        by smtp.gmail.com with ESMTPSA id t11-20020a252d0b000000b00d7b9fab78bfsm2543068ybt.7.2023.10.16.02.12.22
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Oct 2023 02:12:22 -0700 (PDT)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-5a82c2eb50cso31582797b3.2
        for <linux-m68k@lists.linux-m68k.org>; Mon, 16 Oct 2023 02:12:22 -0700 (PDT)
X-Received: by 2002:a0d:d5c1:0:b0:5a8:1ffe:eb4e with SMTP id
 x184-20020a0dd5c1000000b005a81ffeeb4emr9258455ywd.34.1697447542485; Mon, 16
 Oct 2023 02:12:22 -0700 (PDT)
MIME-Version: 1.0
References: <20231009074121.219686-1-hch@lst.de> <20231009074121.219686-6-hch@lst.de>
 <ea608718-8a50-4f87-aecf-fc100d283fe8@arm.com> <20231009125843.GA7272@lst.de> <eedf951d-901c-40d8-91f2-0f13d33b7d4e@linux-m68k.org>
In-Reply-To: <eedf951d-901c-40d8-91f2-0f13d33b7d4e@linux-m68k.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 16 Oct 2023 11:12:09 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVis0F02J1D7C2=MgShswt+2-4vCV076Mb3q4weagUY1A@mail.gmail.com>
Message-ID: <CAMuHMdVis0F02J1D7C2=MgShswt+2-4vCV076Mb3q4weagUY1A@mail.gmail.com>
Subject: Re: [PATCH 5/6] net: fec: use dma_alloc_noncoherent for m532x
To:     Greg Ungerer <gerg@linux-m68k.org>
Cc:     Christoph Hellwig <hch@lst.de>,
        Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux.dev,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Wei Fang <wei.fang@nxp.com>,
        Shenwei Wang <shenwei.wang@nxp.com>,
        Clark Wang <xiaoning.wang@nxp.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-m68k@lists.linux-m68k.org, netdev@vger.kernel.org,
        Jim Quinlan <james.quinlan@broadcom.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Greg,

On Tue, Oct 10, 2023 at 4:45 PM Greg Ungerer <gerg@linux-m68k.org> wrote:
> On 9/10/23 22:58, Christoph Hellwig wrote:
> > On Mon, Oct 09, 2023 at 11:29:12AM +0100, Robin Murphy wrote:
> >> It looks a bit odd that this ends up applying to all of Coldfire, while the
> >> associated cache flush only applies to the M532x platform, which implies
> >> that we'd now be relying on the non-coherent allocation actually being
> >> coherent on other Coldfire platforms.
> >>
> >> Would it work to do something like this to make sure dma-direct does the
> >> right thing on such platforms (which presumably don't have caches?), and
> >> then reduce the scope of this FEC hack accordingly, to clean things up even
> >> better?
> >
> > Probably.  Actually Greg comment something along the lines last
> > time, and mentioned something about just instruction vs instruction
> > and data cache.
>
> I just elaborated on that point a little in response to Robin's email.
>
> >>
> >> diff --git a/arch/m68k/Kconfig.cpu b/arch/m68k/Kconfig.cpu
> >> index b826e9c677b2..1851fa3fe077 100644
> >> --- a/arch/m68k/Kconfig.cpu
> >> +++ b/arch/m68k/Kconfig.cpu
> >> @@ -27,6 +27,7 @@ config COLDFIRE
> >>      select CPU_HAS_NO_BITFIELDS
> >>      select CPU_HAS_NO_CAS
> >>      select CPU_HAS_NO_MULDIV64
> >> +    select DMA_DEFAULT_COHERENT if !MMU && !M523x
> >
> > Although it would probably make more sense to simply not select
> > CONFIG_ARCH_HAS_SYNC_DMA_FOR_DEVICE and
> > CONFIG_ARCH_HAS_SYNC_DMA_FOR_CPU for these platforms and not
> > build the non-coherent code at all.  This should also include
> > all coldfire platforms with mmu (M54xx/M548x/M5441x).  Then
> > again for many of the coldfire platforms the Kconfig allows
> > to select CACHE_WRITETHRU/CACHE_COPYBACK which looks related.
> >
> > Greg, any chance you could help out with the caching modes on
> > coldfire and legacy m68knommu?
>
> Sure, yep. I am not aware that the legacy 68000 or 68328 had any caches
> at all.

68000 (and derivatives like 68*328) does not have any cache.
68360 (which is no longer supported by Linux) is based on CPU32, and
does not seem to have any caches, although the documentation does
mention the use of "external cache memories".

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
