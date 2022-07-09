Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F33EC43334
	for <linux-m68k@archiver.kernel.org>; Sat,  9 Jul 2022 10:35:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229493AbiGIKfD (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sat, 9 Jul 2022 06:35:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229460AbiGIKfC (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sat, 9 Jul 2022 06:35:02 -0400
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 503A964E3C
        for <linux-m68k@lists.linux-m68k.org>; Sat,  9 Jul 2022 03:35:01 -0700 (PDT)
Received: by mail-qt1-f174.google.com with SMTP id z13so1185595qts.12
        for <linux-m68k@lists.linux-m68k.org>; Sat, 09 Jul 2022 03:35:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gYYq2mWCFBLoiPh2Ay9Qcz2ku4io1G7S8HaCDNUt9gI=;
        b=7utRvlLKmcHjHChzgaFmfZe78rqIynw5OJ0vCnGinZAgGFMFh5zPBVBzGTITa0CT9v
         DNBcJ7Bf9c/7j2N0PrR0WxxjSUJ4bkUXkHxiGeqD3FDCs9syE89pvRm9VfcEBVkbovvH
         dlWIkjOIR5k1Zsg+CL6XHpolkdriarZlXmZcj2FEwxfeWv+Muj6Bx0y2yAUZJ52dNlw8
         g5IqZQpz7WEt6f1zTqrslnEcj2hMONR4UkVkzangA656rENjc8FPbKa+lODRI2DGOe+w
         UbH3WOw0oTnxiOibpjvSSiJEUWr3aki+7eiWM2B39Y7Sckvlnk4xRTW+vO6DMBF0Ddy6
         WGmA==
X-Gm-Message-State: AJIora9/CGmkBGnDv+/jXYCJffg6pgb/PDlbqVcV5BvaXLM3XhCthSAe
        qcCCFIt/mNg2Ipx5U4y0Oxx22fCRlPT2BA==
X-Google-Smtp-Source: AGRyM1sD2XJwSYdpMVKiHNDqfQhevZopzfqzBAbN1r3ldSYd1MwkQFdrCuH06NND8TrNFMXH4X29gw==
X-Received: by 2002:a05:622a:1d3:b0:31e:ab8e:ae0c with SMTP id t19-20020a05622a01d300b0031eab8eae0cmr1804946qtw.325.1657362899993;
        Sat, 09 Jul 2022 03:34:59 -0700 (PDT)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com. [209.85.219.177])
        by smtp.gmail.com with ESMTPSA id u4-20020a37ab04000000b006b56a4400f6sm1077777qke.16.2022.07.09.03.34.56
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 09 Jul 2022 03:34:57 -0700 (PDT)
Received: by mail-yb1-f177.google.com with SMTP id 64so1502156ybt.12
        for <linux-m68k@lists.linux-m68k.org>; Sat, 09 Jul 2022 03:34:56 -0700 (PDT)
X-Received: by 2002:a05:6902:1246:b0:66e:ea31:8d05 with SMTP id
 t6-20020a056902124600b0066eea318d05mr2374600ybu.89.1657362896428; Sat, 09 Jul
 2022 03:34:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220531174514.1586248-1-laurent@vivier.eu> <CAMuHMdUbUZU3YA6nDC_LDAfUYQVmHTuCzrCfxDqwF=ZZyR5fqw@mail.gmail.com>
 <YseHZq/u9OkVltxW@zx2c4.com> <CAMuHMdX7JPKJbth9xw4MbPbi29fgQNSva0r394JX-etEZiUJ_A@mail.gmail.com>
 <YsjHiZeUxo7RXxAu@zx2c4.com>
In-Reply-To: <YsjHiZeUxo7RXxAu@zx2c4.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Sat, 9 Jul 2022 12:34:45 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXLzAzb+GBXgU_+aGwcVd0U5ZDjoakopW62brpYmTEm3g@mail.gmail.com>
Message-ID: <CAMuHMdXLzAzb+GBXgU_+aGwcVd0U5ZDjoakopW62brpYmTEm3g@mail.gmail.com>
Subject: Re: [PATCH] m68k: virt: Kconfig minor fixes
To:     "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc:     Laurent Vivier <laurent@vivier.eu>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Jason,

On Sat, Jul 9, 2022 at 2:11 AM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> On Fri, Jul 08, 2022 at 09:24:59AM +0200, Geert Uytterhoeven wrote:
> > On Fri, Jul 8, 2022 at 3:25 AM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> > > On Thu, Jun 02, 2022 at 09:13:14AM +0200, Geert Uytterhoeven wrote:
> > > > On Tue, May 31, 2022 at 7:45 PM Laurent Vivier <laurent@vivier.eu> wrote:
> > > > > Select VIRTIO_MENU as it is needed by VIRTIO_MMIO.
> > > > >
> > > > > Add an ending period at the end the virt machine help message.
> > > > >
> > > > > Reported-by: Randy Dunlap <rdunlap@infradead.org>
> > > > > Signed-off-by: Laurent Vivier <laurent@vivier.eu>
> > > >
> > > > Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
> > > > i.e. will queue in the m68k for-v5.20 branch.
> > >
> > > Shouldn't this fix make it for 5.19? It causes Kconfig warnings during
> > > builds. So this seems like a ordinary mid-cycle bug that can be fixed.
> > >
> > > For example, if you ctrl+f for "unmet direct" in this log, you'll see
> > > this splat in the wireguard CI:
> > > https://build.wireguard.com/random/108f4fea7b6053dfd09039af74c0ac0c32c956be/m68k.log
> >
> > These are merely configuration warnings, there is no build or runtime
> > failure.
> > I reverted this patch, disabled CONFIG_VIRTIO_MENU (which BTW defaults
> > to y), built and booted a kernel fine, and could login on the console.
> >
> > So IMHO it can wait.
>
> Okay, no problem. I suppose 5.19 isn't likely to be an LTS anyway.

I expect this to be auto-backported to stable 5.18.x and 5.19.x anyway.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
