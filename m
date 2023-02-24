Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E95A8C61DA3
	for <linux-m68k@archiver.kernel.org>; Fri, 24 Feb 2023 11:04:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230247AbjBXLES (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 24 Feb 2023 06:04:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229946AbjBXLD4 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 24 Feb 2023 06:03:56 -0500
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FFB5234D3
        for <linux-m68k@lists.linux-m68k.org>; Fri, 24 Feb 2023 03:02:21 -0800 (PST)
Received: by mail-qt1-f178.google.com with SMTP id s12so14081623qtq.11
        for <linux-m68k@lists.linux-m68k.org>; Fri, 24 Feb 2023 03:02:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4ruwKS9KjgFMLKY/0dQBvsQGxjWPmvY9lPpFMPSaSfA=;
        b=7e5SJsEDDHDO502+LsKKUbMg/Wx6lumo8vXA7IteJCnOHaspGmHvv01+BjXa6g/uzG
         Lr8aXixl2lE+AcSIGpuDdnTqWtZjCjKytvnZrtaxPhV4uppd4B8FhgcpoFb3Cxric8uC
         K6/WeMxnNlSiYqu29835aCm1Xaz4QIl48aBWLRryJT3DRWn6YelEls2fp99RZCL21Ksh
         4TqHbkMOg/Td7+mIsnzNDKD7ka7DVS7K0L4iqF4hnN2+RgHqxccM2NP7rtVXe3UqSD+5
         HJRbYLgbu/Ed3cXc0U8HKpMVxXZbdc8UVNAcZ971/oy4K0oYXNZnSfH/aE1QXDOLOf3v
         Z2Tg==
X-Gm-Message-State: AO0yUKVwdQkfMu+5H8vb8ALQMMC6frs4A/k0xu541ZQXcvCsrs9G5y1x
        dHTFhiKV8Q9NnjTU8baRFJNoezSbbMUsiA==
X-Google-Smtp-Source: AK7set8QKIlTciNYCLOInfz4Il/rgvLE57NcS031icCI0EhmINO+R4H0CfTjojB+/MzzHRS+D/oqow==
X-Received: by 2002:a05:622a:1316:b0:3b8:1f0b:5a4 with SMTP id v22-20020a05622a131600b003b81f0b05a4mr26914014qtk.19.1677236480692;
        Fri, 24 Feb 2023 03:01:20 -0800 (PST)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com. [209.85.128.172])
        by smtp.gmail.com with ESMTPSA id d71-20020a37684a000000b0073b4a55a2d1sm5321283qkc.124.2023.02.24.03.01.20
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Feb 2023 03:01:20 -0800 (PST)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-53916ab0c6bso20777587b3.7
        for <linux-m68k@lists.linux-m68k.org>; Fri, 24 Feb 2023 03:01:20 -0800 (PST)
X-Received: by 2002:a25:e812:0:b0:a43:52fe:c36f with SMTP id
 k18-20020a25e812000000b00a4352fec36fmr1288874ybd.7.1677236480304; Fri, 24 Feb
 2023 03:01:20 -0800 (PST)
MIME-Version: 1.0
References: <20230223112349.26675-1-jongk@linux-m68k.org> <CAMuHMdWVwyRuwUZY4t7NKEbAePTuj44zYi7gmYiL1_ZCJWySZQ@mail.gmail.com>
 <CACz-3rhNFb81+auU10+ctG2XrcvKgQ7o0MGy+6DV5MsNw9XmNg@mail.gmail.com> <CACz-3rh+m7FEXVyNUUwCzbUFg6Ytk-iMNcc12o_WNie69aHT+Q@mail.gmail.com>
In-Reply-To: <CACz-3rh+m7FEXVyNUUwCzbUFg6Ytk-iMNcc12o_WNie69aHT+Q@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 24 Feb 2023 12:01:05 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU-cic=oSo7q=SCpC-g_3rjzFT-H=861aWaMEoP1PKnYg@mail.gmail.com>
Message-ID: <CAMuHMdU-cic=oSo7q=SCpC-g_3rjzFT-H=861aWaMEoP1PKnYg@mail.gmail.com>
Subject: Re: [PATCH] m68k: fix for systems with memory at end of 32-bit
 address space
To:     Kars de Jong <jongk@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org, Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Kars,

On Fri, Feb 24, 2023 at 11:41 AM Kars de Jong <jongk@linux-m68k.org> wrote:
> Op do 23 feb. 2023 om 15:05 schreef Kars de Jong <jongk@linux-m68k.org>:
> > Op do 23 feb. 2023 om 13:39 schreef Geert Uytterhoeven <geert@linux-m68k.org>:
> > >
> > > So this has been broken for the last 15 years?
> >
> > Yes, looks like this commit broke it:
> > https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git/commit/arch/m68k/mm/motorola.c?id=12d810c1b8c2b913d48e629e2b5c01d105029839,
> > so slightly longer than 15 years :-).
>
> I found the original thread where I reported this here:
> https://marc.info/?t=117175647600006&r=1&w=2, including a version of
> this same patch, created by Roman Zippel:
> https://marc.info/?l=linux-m68k&m=117184910524555&w=2. This was still
> in CVS times.
>
> Apparently I used to work around this issue by subtracting 1 from the
> memory size in my boot loader.

;-)

> Now I just need to figure out why the last page of memory is excluded.
> Do you also see this on other machines?
>
> Zone ranges:
>   DMA      [mem 0x00000000fc000000-0x00000fffffffefff]
>   Normal   empty
> Movable zone start for each node
> Early memory node ranges
>   node   0: [mem 0x00000000fc000000-0x00000000ffffefff]
> Initmem setup node 0 [mem 0x00000000fc000000-0x00000000ffffefff]

I don't see that on ARAnyM or on qemu-system-m68k, but those
don't have memory at the end of the address space.

ISTR something about not mapping the last page of RAM, if it's at the
end of the address space, to avoid wrap-around while prefetching?

[searching]

I think it's a side-effect of:

    static inline phys_addr_t memblock_cap_size(phys_addr_t base,
phys_addr_t *size)
    {
            return *size = min(*size, PHYS_ADDR_MAX - base);
    }

with

    #define PHYS_ADDR_MAX  (~(phys_addr_t)0)

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
