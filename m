Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EE7EC6FA8E
	for <linux-m68k@archiver.kernel.org>; Sun, 26 Feb 2023 12:52:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229606AbjBZMwg (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sun, 26 Feb 2023 07:52:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229549AbjBZMwf (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sun, 26 Feb 2023 07:52:35 -0500
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE7DA11E9E
        for <linux-m68k@lists.linux-m68k.org>; Sun, 26 Feb 2023 04:52:33 -0800 (PST)
Received: by mail-qt1-f179.google.com with SMTP id s12so3987561qtq.11
        for <linux-m68k@lists.linux-m68k.org>; Sun, 26 Feb 2023 04:52:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ildQ64zoAdxifOnQKQ2muJrZKmKW+nCdPopK2iT8WZ0=;
        b=wIyu8Gm4RXvpT/959ul4lpG9YfXQChezAZ9T+BFgi9C2TdN0Hb/rCs0F6RvzgDmviN
         ILDH8yoe2BFUT1vPGKETYnbP70VRLO7mcSYmBB2kkO0UrX/RFyV79rASZ43QkQl5colj
         S1QzSsWjti2VtTP9Gfbsagwz/YsnzOLUmL679gnxFlcTo1BRKypRmC3BYa6q9WxcAXvQ
         frySpRtFleOrBLe62yyP8vDdkH2fQR2mFdDPhDLUAXNt+P1Tc43QCeLjYNFbxxmlE1e+
         RCapeidSA9o41B3YY/FxTp1R0Fi9JekSICPof8yw6EZRYN2m/U/eClfmOgudmXJhZWFc
         CJWQ==
X-Gm-Message-State: AO0yUKXHBXoBuifOVkZXafv5XZ9E89BwkXm9qBflvhV7gE+B71kzLfxA
        c9RJ/Np0odl52HXlAvO6vjyZVedVpebJIw==
X-Google-Smtp-Source: AK7set8qSgW22/tUBzMEG7MZ1eubyY2G8awjd13NViWhLXxQ3uRCXPmBPxLVGMYKC9QCavAqEycBcw==
X-Received: by 2002:a05:622a:138b:b0:3bf:c4e4:e862 with SMTP id o11-20020a05622a138b00b003bfc4e4e862mr9671009qtk.20.1677415952534;
        Sun, 26 Feb 2023 04:52:32 -0800 (PST)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com. [209.85.128.170])
        by smtp.gmail.com with ESMTPSA id c17-20020a379a11000000b00739f84a6c23sm2970099qke.113.2023.02.26.04.52.32
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Feb 2023 04:52:32 -0800 (PST)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-536c2a1cc07so105863877b3.5
        for <linux-m68k@lists.linux-m68k.org>; Sun, 26 Feb 2023 04:52:32 -0800 (PST)
X-Received: by 2002:a05:6902:842:b0:a27:3ecd:6 with SMTP id
 d2-20020a056902084200b00a273ecd0006mr4912409ybu.1.1677415951820; Sun, 26 Feb
 2023 04:52:31 -0800 (PST)
MIME-Version: 1.0
References: <85b92c15482752ca5bbdff6b5f6a720ebbdd3be6.camel@physik.fu-berlin.de>
 <CAMuHMdVgRdJR+a4tooyacg9Wqc-x_U5Oyxkt_axnrncE+AtrUQ@mail.gmail.com>
 <4f45f05f377bf3f5baf88dbd5c3c8aeac59d94f0.camel@physik.fu-berlin.de> <CAMuHMdUwh2PPrE37A+TNviU7HB+hPpFmFocJzGxG_sox1=ZGOQ@mail.gmail.com>
In-Reply-To: <CAMuHMdUwh2PPrE37A+TNviU7HB+hPpFmFocJzGxG_sox1=ZGOQ@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Sun, 26 Feb 2023 13:52:18 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUgPXGCHi3E_08iwnfnjkcUpsCwhG985PoX18RvHTjhMA@mail.gmail.com>
Message-ID: <CAMuHMdUgPXGCHi3E_08iwnfnjkcUpsCwhG985PoX18RvHTjhMA@mail.gmail.com>
Subject: Re: Kernel versions 6.x don't boot on Amiga 4000
To:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc:     linux-m68k@lists.linux-m68k.org, debian-68k@lists.debian.org,
        Finn Thain <fthain@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Sun, Feb 26, 2023 at 12:02 PM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> On Tue, Feb 21, 2023 at 4:53 PM John Paul Adrian Glaubitz
> <glaubitz@physik.fu-berlin.de> wrote:
> > On Tue, 2023-02-21 at 15:55 +0100, Geert Uytterhoeven wrote:
> > > Looks surprisingly similar to the issue reported by Stan.
> > > Do the mitigations given in
> > > https://lore.kernel.org/all/CAMuHMdUtkr2zvZiJfLXvs9d_inJbktSNqQQfO1oxnJHZeoYcHg@mail.gmail.com
> > > help?
> >
> > The kernel actually crashes with a backtrace:
> >
> > ABCDGHIJK
> > [    0.000000] Linux version 6.0.0-6-m68k (debian-kernel@lists.debian.org) (gcc-12 (Debian 12.2.0-9) 12.2.0, GNU ld (GNU Binutils for
> > Debian) 2.39) #1 Debian 6.0.12-1 (2022-12-09)
> > [    0.000000] Enabling workaround for errata I14
> > [    0.000000] printk: bootconsole [debug0] enabled
> > [    0.000000] Amiga hardware found: [A4000] VIDEO BLITTER AUDIO FLOPPY A4000_IDE KEYBOARD MOUSE SERIAL PARALLEL A3000_CLK CHIP_RAM PAULA
> > LISA ALICE_PAL ZORRO3
> > [    0.000000] initrd: 0ef0602c - 0f800000
> > [    0.000000] Zone ranges:
> > [    0.000000]   DMA      [mem 0x0000000008000000-0x000000f7ffffffff]
> > [    0.000000]   Normal   empty
> > [    0.000000] Movable zone start for each node
> > [    0.000000] Early memory node ranges
> > [    0.000000]   node   0: [mem 0x0000000008000000-0x000000000f7fffff]
> > [    0.000000] Initmem setup node 0 [mem 0x0000000008000000-0x000000000f7fffff]
> > [    0.000000] Unable to handle kernel access at virtual address (ptrval)
>
> I see the same issue on my A4000, bisecting...

Bisected to commit 376e3fdecb0dcae2 ("m68k: Enable memtest
functionality") in v5.17-rc1.  Reverting that on top of latest fixes the
issue.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
