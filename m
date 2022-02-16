Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA5B9C433F5
	for <linux-m68k@archiver.kernel.org>; Wed, 16 Feb 2022 08:24:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229828AbiBPIYl (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 16 Feb 2022 03:24:41 -0500
Received: from gmail-smtp-in.l.google.com ([23.128.96.19]:58532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229513AbiBPIYk (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 16 Feb 2022 03:24:40 -0500
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B71B274CAA
        for <linux-m68k@lists.linux-m68k.org>; Wed, 16 Feb 2022 00:24:28 -0800 (PST)
Received: by mail-vk1-f170.google.com with SMTP id n142so850458vkf.5
        for <linux-m68k@lists.linux-m68k.org>; Wed, 16 Feb 2022 00:24:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=s2vgFfD+Sp+ZLp6j+74a/zp2NMl5wQjLNJtB8YssI9k=;
        b=3Vhh5qjk4g+KGYZhP4KqJ/yCnDDAtZC3Vdg5/YiH1n9E3Xbd8wkA0yzgaP1hSP26lh
         YB3eBjgq79LYqeunPKfqmwrBto5GTnaNThE+l+jQS3Me85FWn8GJYW9f9cpKrzxkG0BL
         vS61kWsdzh3oXLc2Jx1vqiOX/xsbUIF+mPRw2oNd5/2GBmlGUTMF8W/b6d1VRiJU0i95
         eiqlkegsUZlKNmPUcnp8lzxkNnGauevgdjM8uAKMP79I+0oECjlxs8/ddnYQhie6YFii
         rTn4OFHwmN5FlTJDBRZTWv6PSy7whqVAeKJ8957w1d5J0FJjkRP3dn4dvJR2/4wEwMu0
         8kBA==
X-Gm-Message-State: AOAM532TrEmrA9kB0dJglQZ86S5T8Fno57PmRIXVqUMlfNdpceEnRXcp
        zBSkqr3r5hXLlzZ0EmG2uRjJ9v2FBvcSlQ==
X-Google-Smtp-Source: ABdhPJzR5ZjYeTlYHdefTq68fcmnmY91q0y9RvSF/QGVzd1TyswLGheobfsH/Dm2uS8bsCafRdaNNg==
X-Received: by 2002:a1f:a1c5:0:b0:312:da17:e397 with SMTP id k188-20020a1fa1c5000000b00312da17e397mr711538vke.18.1644999867395;
        Wed, 16 Feb 2022 00:24:27 -0800 (PST)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com. [209.85.217.47])
        by smtp.gmail.com with ESMTPSA id y187sm445106vkf.13.2022.02.16.00.24.27
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Feb 2022 00:24:27 -0800 (PST)
Received: by mail-vs1-f47.google.com with SMTP id e6so1583120vsa.8
        for <linux-m68k@lists.linux-m68k.org>; Wed, 16 Feb 2022 00:24:27 -0800 (PST)
X-Received: by 2002:a67:e10e:0:b0:31b:956b:70cf with SMTP id
 d14-20020a67e10e000000b0031b956b70cfmr580318vsl.77.1644999866804; Wed, 16 Feb
 2022 00:24:26 -0800 (PST)
MIME-Version: 1.0
References: <CAMuHMdU3ievhXxKR_xi_v3aumnYW7UNUO6qMdhgfyWTyVSsCkQ@mail.gmail.com>
 <b03160b6-7f3b-7765-49ee-c49b7dd2c4e0@gmail.com> <CAMuHMdVUX0zJtRAtjCBAa7iEk7MwCjcmSsJdCrSrPcY=6ti=cQ@mail.gmail.com>
 <4b3a0bc8-24a1-2a33-19bb-fbae954c614c@gmail.com> <CAMuHMdWkxDMbS4D8wkEPAVgrFnoJzejUkxKCnvA+MA38vS6g9Q@mail.gmail.com>
 <baf33986-d02e-35e8-7381-a30e28089a0a@gmail.com>
In-Reply-To: <baf33986-d02e-35e8-7381-a30e28089a0a@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 16 Feb 2022 09:24:15 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWZ+H5kJyOUQWW49EGUemUe7qERuLaMWFOs0N8nNbuMTQ@mail.gmail.com>
Message-ID: <CAMuHMdWZ+H5kJyOUQWW49EGUemUe7qERuLaMWFOs0N8nNbuMTQ@mail.gmail.com>
Subject: Re: Wrong colors on ARAnyM
To:     Michael Schmitz <schmitzmic@gmail.com>
Cc:     Petr Stehlik <pstehlik@sophics.cz>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Michael,

On Tue, Feb 15, 2022 at 9:49 PM Michael Schmitz <schmitzmic@gmail.com> wrote:
> On 15/02/22 21:11, Geert Uytterhoeven wrote:
> >>> Linux' falcon_setcolreg() writes to both the Falcon palette registers
> >>> and shifter_tt.color_reg[], so shouldn't the STE color palette contain
> >>> the correct colors, too?
> >> I don't think it will:
> >>
> >> The STe palette is set like this:
> >>
> >>                   shifter_tt.color_reg[regno] =
> >>                           (((red & 0xe) >> 1) | ((red & 1) << 3) << 8) |
> >>                           (((green & 0xe) >> 1) | ((green & 1) << 3) << 4) |
> >>                           ((blue & 0xe) >> 1) | ((blue & 1) << 3);
> >>
> >> with all colours downshifted by 12 bits already. Rewriting that in the
> >> same form as is used in falcon_setcolreg(), i.e. without the downshift:
> >>
> >>                   shifter_tt.color_reg[regno] =
> >>                           (((red & 0xe000) >> 13) | ((red & 1000) >> 9)
> >> << 8) |
> >>                           (((green & 0xe000) >> 13) | ((green & 1000) >>
> >> 9) << 4) |
> >>                           ((blue & 0xe000) >> 13) | ((blue & 1000) >> 9);
> >>
> >>
> >> Now look at falcon_setcolreg:
> >>
> >>                   shifter_tt.color_reg[regno] =
> >>                           (((red & 0xe000) >> 13) | ((red & 0x1000) >>
> >> 12) << 8) |
> >>                           (((green & 0xe000) >> 13) | ((green & 0x1000)
> >>   >> 12) << 4) |
> >>                           ((blue & 0xe000) >> 13) | ((blue & 0x1000) >> 12);
> >>
> >>
> >> My guess would be the two ought to be identical, assuming the STe
> >> palette registers provide backwards hardware compatibility.
>
> The atafb driver references a 'linux/tools/hardware.txt' file for a
> description of the Videl registers. Does anyone still have a copy of
> that file?

At least full-history-linux doesn't have it.

> Failing that - how would I go about setting specific text colours for
> the console (or draw a test pattern showing the result of the four
> palette entries)?

I typically use fbtest for that.

I also have a script to show the 16 colors (assumed there are 16):

#!/bin/bash
printf "\e[7m"
printf "\e[30m                    BLACK                     \n"
printf "\e[31m                    RED                       \n"
printf "\e[32m                    GREEN                     \n"
printf "\e[33m                    YELLOW                    \n"
printf "\e[34m                    BLUE                      \n"
printf "\e[35m                    MAGENTA                   \n"
printf "\e[36m                    CYAN                      \n"
printf "\e[37m                    WHITE                     \n"
printf "\e[1m"
printf "\e[30m                    BLACK                     \n"
printf "\e[31m                    RED                       \n"
printf "\e[32m                    GREEN                     \n"
printf "\e[33m                    YELLOW                    \n"
printf "\e[34m                    BLUE                      \n"
printf "\e[35m                    MAGENTA                   \n"
printf "\e[36m                    CYAN                      \n"
printf "\e[37m                    WHITE                     \n"
printf "\e[0m"

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
