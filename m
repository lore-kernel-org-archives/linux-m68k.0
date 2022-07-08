Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAC05C433EF
	for <linux-m68k@archiver.kernel.org>; Fri,  8 Jul 2022 07:25:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237430AbiGHHZP (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 8 Jul 2022 03:25:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237412AbiGHHZN (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 8 Jul 2022 03:25:13 -0400
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA126A1B6
        for <linux-m68k@lists.linux-m68k.org>; Fri,  8 Jul 2022 00:25:12 -0700 (PDT)
Received: by mail-qk1-f178.google.com with SMTP id o26so8025621qkl.6
        for <linux-m68k@lists.linux-m68k.org>; Fri, 08 Jul 2022 00:25:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VqT3m8gA4t9MFZN2vHoFQVMTXYsGoD6rUVaQJigFX7s=;
        b=y4LNF02lIt8SZs12cQzde55GwPslsIsV6INpVzB1rLD3Vy37kuYxGSYl9PPV4nO73w
         QRCch9N5Y8aA9HtwuwXI9YRA5ZnVy+nOG5VBFff0XvSPR79A/7Ni/BEHUXwDqP9n3AJV
         xCaDJp5unag0HaLvfpjKELW5IAJvhH5pks1u1WwHb7pxFP0iuiLncyqua+nO8s44N1C0
         eYKYONwKCApWq/5x5mYvno+m21FObouNGR+gmSWN6Sh090SqSycUzzaSM7z+7WD0Dycq
         vLVu+SsabO5voUKvYVB2+R2hs+Q2iwG1Zuz/A6Zymd0DPJ9tZFZIhtQz7TzOebrEYB5a
         wx3g==
X-Gm-Message-State: AJIora+kFXRRepUzyICWHQIA6LMEv2q6D0tgxrj6+gcJU7RhYbOxfiy5
        Y9uSInLZqejP8L/cinNuNeJFQgayacDwGg==
X-Google-Smtp-Source: AGRyM1vtekTCgyCW71QZsnsrVPTfbF+8Pm5fIyJV2FLT4LwTr462itx9QDryrbfml8gNCuicz0ozLg==
X-Received: by 2002:a05:620a:d8c:b0:6a7:91a2:c827 with SMTP id q12-20020a05620a0d8c00b006a791a2c827mr1240122qkl.407.1657265111734;
        Fri, 08 Jul 2022 00:25:11 -0700 (PDT)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com. [209.85.128.178])
        by smtp.gmail.com with ESMTPSA id h4-20020a05620a284400b006a787380a5csm35279494qkp.67.2022.07.08.00.25.10
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Jul 2022 00:25:10 -0700 (PDT)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-31caffa4a45so118897267b3.3
        for <linux-m68k@lists.linux-m68k.org>; Fri, 08 Jul 2022 00:25:10 -0700 (PDT)
X-Received: by 2002:a81:5404:0:b0:31c:c24d:94b0 with SMTP id
 i4-20020a815404000000b0031cc24d94b0mr2436888ywb.502.1657265110382; Fri, 08
 Jul 2022 00:25:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220531174514.1586248-1-laurent@vivier.eu> <CAMuHMdUbUZU3YA6nDC_LDAfUYQVmHTuCzrCfxDqwF=ZZyR5fqw@mail.gmail.com>
 <YseHZq/u9OkVltxW@zx2c4.com>
In-Reply-To: <YseHZq/u9OkVltxW@zx2c4.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 8 Jul 2022 09:24:59 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX7JPKJbth9xw4MbPbi29fgQNSva0r394JX-etEZiUJ_A@mail.gmail.com>
Message-ID: <CAMuHMdX7JPKJbth9xw4MbPbi29fgQNSva0r394JX-etEZiUJ_A@mail.gmail.com>
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

On Fri, Jul 8, 2022 at 3:25 AM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> On Thu, Jun 02, 2022 at 09:13:14AM +0200, Geert Uytterhoeven wrote:
> > On Tue, May 31, 2022 at 7:45 PM Laurent Vivier <laurent@vivier.eu> wrote:
> > > Select VIRTIO_MENU as it is needed by VIRTIO_MMIO.
> > >
> > > Add an ending period at the end the virt machine help message.
> > >
> > > Reported-by: Randy Dunlap <rdunlap@infradead.org>
> > > Signed-off-by: Laurent Vivier <laurent@vivier.eu>
> >
> > Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
> > i.e. will queue in the m68k for-v5.20 branch.
>
> Shouldn't this fix make it for 5.19? It causes Kconfig warnings during
> builds. So this seems like a ordinary mid-cycle bug that can be fixed.
>
> For example, if you ctrl+f for "unmet direct" in this log, you'll see
> this splat in the wireguard CI:
> https://build.wireguard.com/random/108f4fea7b6053dfd09039af74c0ac0c32c956be/m68k.log

These are merely configuration warnings, there is no build or runtime
failure.
I reverted this patch, disabled CONFIG_VIRTIO_MENU (which BTW defaults
to y), built and booted a kernel fine, and could login on the console.

So IMHO it can wait.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
