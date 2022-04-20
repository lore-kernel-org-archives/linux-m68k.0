Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06D3FC433EF
	for <linux-m68k@archiver.kernel.org>; Wed, 20 Apr 2022 09:23:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377142AbiDTJZu (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 20 Apr 2022 05:25:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244208AbiDTJZt (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 20 Apr 2022 05:25:49 -0400
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48D712AC7F
        for <linux-m68k@lists.linux-m68k.org>; Wed, 20 Apr 2022 02:23:03 -0700 (PDT)
Received: from mail-wr1-f43.google.com ([209.85.221.43]) by
 mrelayeu.kundenserver.de (mreue107 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MC3H1-1nmLgz0UmL-00CQ50 for <linux-m68k@lists.linux-m68k.org>; Wed, 20
 Apr 2022 11:10:24 +0200
Received: by mail-wr1-f43.google.com with SMTP id m14so1333414wrb.6
        for <linux-m68k@lists.linux-m68k.org>; Wed, 20 Apr 2022 02:10:24 -0700 (PDT)
X-Gm-Message-State: AOAM531eIgAgGgP7/pBtqfEjOoig5/IhoGtjPC/8PwhU8r/ZBQBUGhqP
        w9pcSQ+3In+y12FMnMrW6DV7Qe48gaUrbL8r9uY=
X-Google-Smtp-Source: ABdhPJwtLOp969nuzl2HcHrjTrE/8+7taAszNCD7/wMyEv6mWoZB/KbZc5q+V3PBrcZaYVxcH5WclGOcWViagO5a7ww=
X-Received: by 2002:a5d:6389:0:b0:207:a7d8:2b64 with SMTP id
 p9-20020a5d6389000000b00207a7d82b64mr14665624wru.12.1650445823721; Wed, 20
 Apr 2022 02:10:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220420084249.2186634-1-arnd@kernel.org>
In-Reply-To: <20220420084249.2186634-1-arnd@kernel.org>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Wed, 20 Apr 2022 11:10:07 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1mBdcGxV1nP15nY7sVfjya_VEeS78M5KQHjw66Kg+=Kg@mail.gmail.com>
Message-ID: <CAK8P3a1mBdcGxV1nP15nY7sVfjya_VEeS78M5KQHjw66Kg+=Kg@mail.gmail.com>
Subject: Re: [PATCH] [v3] m68k: coldfire: drop ISA_DMA_API support
To:     Greg Ungerer <gerg@linux-m68k.org>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-mmc <linux-mmc@vger.kernel.org>,
        ALSA Development Mailing List <alsa-devel@alsa-project.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:1bQXYrijcUIn4One0M2ATGjkocrTeVFlDYgPM0adb+Tqd25WWI0
 oXWzJuYOm1eIpWdXNnV2fot49cUmVqX8aek9/B5VsNFMebh/ET4Wq7APblTIWvkwhJUgPeK
 PCOrXyUPfqvBsrHVsYGY7/42nlBgp+F71HXHHYGsinMalLzGvR4JtKsW5eJjuHCQhNb/f8X
 k9ZKxRyNJc12Nyu/oZ4AA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:OQk48HhPLDU=:hz8x9KUSDz0ce0i9GIojyF
 2gpAVmliEr6X5XSA3SCO83lC68TccBT8whc29ijhAcxdlVabR2LON6wmZ2KJgymYD4di6RkKW
 i7hfQFBmrhcLda45PEM7ZrPyD/e3pnoVipRbdhgZhlyqS2QFiYa0k/iMuxaD1T1aJnUeMlzRh
 2238AWTr7U4u05xPVIEn7y+LaGlt+x4ly2njcV9mbgO8ICo8dimPQdgl00I0rSEVTA/EK3gSP
 qtvwyCDMDENp8+NkODHv7dZvlrgJU36iy+WST3Kp1KyB4nd8jShkEh8NZrD9VTMDmg5qMibe4
 uO7c7Ajsq1udDKgFg4vtzLT5AsbqgJwkyA20de8OwQru+MPsm2G3wu+HuBnVl0qfSLj8oYn83
 44LduzN1ssiUD+MAo4HhfjPxHJ2XuWhp6fvwDnKWU6sQs6ddvc5hpFRjXMVQp1dqKc+5nrlAa
 bpVw0lT+rB3DdKP+k+nvbRS2v4FZx3U/nxU+uKd9611rSX3pGeHs/w7EaAvaoEfaxm4ZvT8k+
 9MxSA2IQ3XEk1MlKumhG1sra6wQdK0W1TrkfDlvOnA/JCNKVbKcHmZIk/PL7XEtfhQUC0YAnS
 aYT9is4E2QmDgx+XuBJvyaOJvdGibtqPxjgDDyHKSvwrNPuinPgws2tVt8Xtmcmh3KI+Fh3AM
 e49qSoIX15JvhLEZqusYsOMfAv2fFi2nqUxsHRaq+mEYOTbXo3zxbPhkKn+vHC5zTAC8=
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Wed, Apr 20, 2022 at 10:42 AM Arnd Bergmann <arnd@kernel.org> wrote:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> After a build regression report, I took a look at possible users of
> CONFIG_ISA_DMA_API on m68k and found none, which Greg confirmed. The
> CONFIG_GENERIC_ISA_DMA option in turn is only needed to implement
> ISA_DMA_API, and is clearly not used on the platforms with ISA support.
>
> The CONFIG_ISA support for AMIGA_PCMCIA is probably also unneeded,
> but this is less clear. Unlike other PCMCIA implementations, this one
> does not use the drivers/pcmcia subsystem at all and just supports
> the "apne" network driver. When it was first added, one could use
> ISA drivers on it as well, but this probably broke at some point.
>
> With no reason to keep this, let's just drop the corresponding files
> and prevent the remaining ISA drivers that use this from getting built.
>
> The remaining definitions in asm/dma.h are used for PCI support.
>
> Link: https://lore.kernel.org/lkml/9e5ee1c3-ca80-f343-a1f5-66f3dd1c0727@linux-m68k.org/
> Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Acked-by: Ulf Hansson <ulf.hansson@linaro.org> # For MMC
> Acked-by: Greg Ungerer <gerg@linux-m68k.org>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Nevermind, this is the same as before, I forgot the 'git add' for the trivial
Makefile change.

       Arnd
