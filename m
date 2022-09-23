Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD2FAC6FA82
	for <linux-m68k@archiver.kernel.org>; Fri, 23 Sep 2022 12:50:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230113AbiIWMul (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 23 Sep 2022 08:50:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231426AbiIWMuk (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 23 Sep 2022 08:50:40 -0400
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE07012CC9D
        for <linux-m68k@lists.linux-m68k.org>; Fri, 23 Sep 2022 05:50:34 -0700 (PDT)
Received: by mail-qv1-f49.google.com with SMTP id mi14so8853812qvb.12
        for <linux-m68k@lists.linux-m68k.org>; Fri, 23 Sep 2022 05:50:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=TIxUcLFewKUrI9Gr/MmE+wKa02a1LZQqMu2jG1Cimoc=;
        b=aWmzIVBHhTFIOv+GFsi6c6mpmebCX4LTQnnbbm4JzIBbgJ1jAy9WKsTnGuDtOrHNdj
         /Gs20IL0y+2NzOGSzbSM7srbCtbj1y8a7Z9YFiqJ0vWDd1p4xJm+k12VDat99EE2yDKL
         D/YEurFE9rDi++ZTWzif+juuxzKf3g9go9oAaq3vVmQOI4/KoKJ0uQA2rPP86tXV02XA
         p0MFb3FoW/II93MaUz0ww6Fi5bhh/XySWuSd7J6D7c2GN6KdmbZEGE8bMORWAzAh3MjI
         /91p10tqxx0RgneRZLuJesfhKTnaXXz9Wi/Bx443AfrO5ZdfsGEWLuD6NzCkw3VIWfY4
         33nQ==
X-Gm-Message-State: ACrzQf1V6AEAoIt9gUYClxb7ZyET+6YoqPQm+WNA/M9s6HWPjZouNXvN
        6hXU4nppjC60bpGMn0EsQhN/brq80QLtOg==
X-Google-Smtp-Source: AMsMyM70ggG+SltXjDA13vN5CsvbohvgpXwPDCX103qzAh9LBRn9Ki2Cia+w0r66EjaaLHS4DjKCJA==
X-Received: by 2002:a0c:abc8:0:b0:4ac:d471:7b83 with SMTP id k8-20020a0cabc8000000b004acd4717b83mr6674404qvb.102.1663937432986;
        Fri, 23 Sep 2022 05:50:32 -0700 (PDT)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com. [209.85.219.169])
        by smtp.gmail.com with ESMTPSA id u2-20020ae9d802000000b006ce407b996asm5643766qkf.69.2022.09.23.05.50.32
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Sep 2022 05:50:32 -0700 (PDT)
Received: by mail-yb1-f169.google.com with SMTP id y82so16985105yby.6
        for <linux-m68k@lists.linux-m68k.org>; Fri, 23 Sep 2022 05:50:32 -0700 (PDT)
X-Received: by 2002:a25:8e84:0:b0:696:466c:baa with SMTP id
 q4-20020a258e84000000b00696466c0baamr8477549ybl.604.1663937432351; Fri, 23
 Sep 2022 05:50:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220921185208.3549140-1-Jason@zx2c4.com> <20220921185208.3549140-2-Jason@zx2c4.com>
 <CAMuHMdUuM85s1APoxRmXnw13hHHEGgo8Z9EKvpV6maaZPaVUfA@mail.gmail.com>
 <CAHmME9pAsY4M=V0o4QLrrQiXwCvtiEO9FApBibXRiG41h-AgVA@mail.gmail.com>
 <CAMuHMdUSF=ARvKTP33psHNWEqvSeUUDuWLRsUUA7LHa+12agng@mail.gmail.com> <CAHmME9ocjS11ugpKKwmosqb2HUBf4_N74a056=OOoj06yD6wmQ@mail.gmail.com>
In-Reply-To: <CAHmME9ocjS11ugpKKwmosqb2HUBf4_N74a056=OOoj06yD6wmQ@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 23 Sep 2022 14:50:21 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWruwCNqM3eLaaM9L+D+ZTw+t6z3O+rjNWTMiCQyj4_zQ@mail.gmail.com>
Message-ID: <CAMuHMdWruwCNqM3eLaaM9L+D+ZTw+t6z3O+rjNWTMiCQyj4_zQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] m68k: virt: generate new RNG seed on reboot
To:     "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc:     linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org,
        Laurent Vivier <Laurent@vivier.eu>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Jason,

On Fri, Sep 23, 2022 at 2:26 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> On Fri, Sep 23, 2022 at 2:23 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > > > +       if (rng_seed_record && rng_seed_record->size > sizeof(*rng_seed_record) + 2) {
> > > > > +               u16 len = rng_seed_record->size - sizeof(*rng_seed_record) - 2;
> > > > > +               get_random_bytes((u8 *)rng_seed_record->data + 2, len);
> > > > > +               *(u16 *)rng_seed_record->data = len;
> >
> > Storing the length should use the proper cpu_to_be16 accessor.
>
> Okay, I'll do that for v2.
>
> (Simply out of curiosity, why? Isn't m68k always big endian and this
> is arch/ code?)

Yes it is.  But virt_parse_bootinfo() below already uses the right
accessor.

BTW, I guess people thought the same about PowerPC?
Although I agree the probability of someone creating a little-endian
m68k clone in an FPGA or SkyWater project and trying to run Linux on
it quite low ;-)

> > > The way I tested this is by having my initramfs just call
> > > `reboot(RB_AUTOBOOT);`, and having add_bootloader_randomness() print
> > > its contents to the console. I checked that it was both present and
> > > different every time.
> >
> > Are you sure the new kernel did receive the same randomness as prepared
> > by get_random_bytes()? I would expect it to just reboot into qemu,
> > reload the kernel from disk, and recreate a new bootinfo from scratch,
> > including generating a new random seed.
>
> Yes I'm sure. Without this patch, the new kernel sees the zeroed state.

That's interesting.  So QEMU preserves the old bootinfo, which is
AFAIK not guaranteed to be still available (that's why I added
save_bootinfo()).  Perhaps that works because only memory starting
from a rounded-up value of _end will be used, and you're just lucky?
I'm wondering what else it preserves. It sure has to reload the
kernel image, as at least the data section will no longer contain the
initialization values after a reboot...

Laurent?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
