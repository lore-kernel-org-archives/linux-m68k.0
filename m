Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 585AAC6FA8E
	for <linux-m68k@archiver.kernel.org>; Sun, 26 Feb 2023 11:02:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229470AbjBZLC4 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sun, 26 Feb 2023 06:02:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229379AbjBZLCy (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sun, 26 Feb 2023 06:02:54 -0500
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2598C3A86
        for <linux-m68k@lists.linux-m68k.org>; Sun, 26 Feb 2023 03:02:53 -0800 (PST)
Received: by mail-qt1-f170.google.com with SMTP id r5so3929365qtp.4
        for <linux-m68k@lists.linux-m68k.org>; Sun, 26 Feb 2023 03:02:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XjDN0gbMCj8GKRDeQ2YEVU3f9CvUVGLLj2njX4pXuXc=;
        b=wqn2Mqx86COz5G/g93ykfXof+eNS/kKQzmgHxnqzF4IlTHzvgdb7d8aHLgrDv2dvK9
         ldgYvK8Y7TMd9x4behiRf47Jn9EXy7aZug5aSohFhbwVzpQKAfyptsUZD724lHhTT8K0
         iD6RlyN5Tkp45scp8vJywzIl+3GVoJb5EUliMNRKc+7rdRzS3ObqBlA9rFFY8BBFxV2Q
         wAFFAqZUfzNT2l3HBKp1P4T9gBYKPQBVIEjBpCX0fMFzPCvu42WC4NFTUA5JY+pgt+8Q
         7QFfzSBduQnJfg5HXF1SavCBCb+U/P/MeG3fXHRX2nI8sWdESWjJNaiAejGZraBhqYXP
         Hkpw==
X-Gm-Message-State: AO0yUKVfsc3rkZRBO+gX0CDc6aQvYA+H/bGjqlFobf48tSNPR7VEf/MU
        1FYZJoV9Ij3pwVk7ILzT0Cz3oFwWQVWNAA==
X-Google-Smtp-Source: AK7set/jGEH4zbipiM4Qb5SjjOaXFTM1hifvQo0gkSy8X7/Qzy08q9mTwdDQ0AF6M5ycWSrL/t08Dw==
X-Received: by 2002:a05:622a:612:b0:3bf:c3e8:c19b with SMTP id z18-20020a05622a061200b003bfc3e8c19bmr9861274qta.22.1677409371993;
        Sun, 26 Feb 2023 03:02:51 -0800 (PST)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com. [209.85.128.176])
        by smtp.gmail.com with ESMTPSA id y84-20020a376457000000b0074269db4699sm2881761qkb.46.2023.02.26.03.02.51
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Feb 2023 03:02:51 -0800 (PST)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-53852143afcso102370347b3.3
        for <linux-m68k@lists.linux-m68k.org>; Sun, 26 Feb 2023 03:02:51 -0800 (PST)
X-Received: by 2002:a81:ae0c:0:b0:52e:cacb:d7c4 with SMTP id
 m12-20020a81ae0c000000b0052ecacbd7c4mr8042801ywh.5.1677409371339; Sun, 26 Feb
 2023 03:02:51 -0800 (PST)
MIME-Version: 1.0
References: <85b92c15482752ca5bbdff6b5f6a720ebbdd3be6.camel@physik.fu-berlin.de>
 <CAMuHMdVgRdJR+a4tooyacg9Wqc-x_U5Oyxkt_axnrncE+AtrUQ@mail.gmail.com> <4f45f05f377bf3f5baf88dbd5c3c8aeac59d94f0.camel@physik.fu-berlin.de>
In-Reply-To: <4f45f05f377bf3f5baf88dbd5c3c8aeac59d94f0.camel@physik.fu-berlin.de>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Sun, 26 Feb 2023 12:02:37 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUwh2PPrE37A+TNviU7HB+hPpFmFocJzGxG_sox1=ZGOQ@mail.gmail.com>
Message-ID: <CAMuHMdUwh2PPrE37A+TNviU7HB+hPpFmFocJzGxG_sox1=ZGOQ@mail.gmail.com>
Subject: Re: Kernel versions 6.x don't boot on Amiga 4000
To:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc:     linux-m68k@lists.linux-m68k.org, debian-68k@lists.debian.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Adrian,

On Tue, Feb 21, 2023 at 4:53 PM John Paul Adrian Glaubitz
<glaubitz@physik.fu-berlin.de> wrote:
> On Tue, 2023-02-21 at 15:55 +0100, Geert Uytterhoeven wrote:
> > Looks surprisingly similar to the issue reported by Stan.
> > Do the mitigations given in
> > https://lore.kernel.org/all/CAMuHMdUtkr2zvZiJfLXvs9d_inJbktSNqQQfO1oxnJHZeoYcHg@mail.gmail.com
> > help?
>
> The kernel actually crashes with a backtrace:
>
> ABCDGHIJK
> [    0.000000] Linux version 6.0.0-6-m68k (debian-kernel@lists.debian.org) (gcc-12 (Debian 12.2.0-9) 12.2.0, GNU ld (GNU Binutils for
> Debian) 2.39) #1 Debian 6.0.12-1 (2022-12-09)
> [    0.000000] Enabling workaround for errata I14
> [    0.000000] printk: bootconsole [debug0] enabled
> [    0.000000] Amiga hardware found: [A4000] VIDEO BLITTER AUDIO FLOPPY A4000_IDE KEYBOARD MOUSE SERIAL PARALLEL A3000_CLK CHIP_RAM PAULA
> LISA ALICE_PAL ZORRO3
> [    0.000000] initrd: 0ef0602c - 0f800000
> [    0.000000] Zone ranges:
> [    0.000000]   DMA      [mem 0x0000000008000000-0x000000f7ffffffff]
> [    0.000000]   Normal   empty
> [    0.000000] Movable zone start for each node
> [    0.000000] Early memory node ranges
> [    0.000000]   node   0: [mem 0x0000000008000000-0x000000000f7fffff]
> [    0.000000] Initmem setup node 0 [mem 0x0000000008000000-0x000000000f7fffff]
> [    0.000000] Unable to handle kernel access at virtual address (ptrval)

I see the same issue on my A4000, bisecting...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
