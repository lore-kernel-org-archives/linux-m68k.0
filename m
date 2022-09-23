Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20522ECAAD8
	for <linux-m68k@archiver.kernel.org>; Fri, 23 Sep 2022 12:28:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230359AbiIWM21 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 23 Sep 2022 08:28:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230063AbiIWM2J (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 23 Sep 2022 08:28:09 -0400
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3C42139F5D
        for <linux-m68k@lists.linux-m68k.org>; Fri, 23 Sep 2022 05:23:56 -0700 (PDT)
Received: by mail-qt1-f169.google.com with SMTP id h21so8266356qta.3
        for <linux-m68k@lists.linux-m68k.org>; Fri, 23 Sep 2022 05:23:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=mxDZwKAzNZt2zRVC0wtLoWkTnhHiobHwZDxR8SDLM4U=;
        b=aNx1BmtaoZi2bg3Hy4OLC/zov6GQher57yM0hg+3kT2TskrNKnx9t+gUmA4FTGhnu2
         pH5vEBtyNFffWOhqsOWzb7mbHwSq8amAj8eQehLLLYLjgEeoVBH4Cp109SDsBNDrSiES
         4IJINKsxB5NVdjMuvcn/c4VuHGk2GU73hAJIibKhZXy14AcgwXgGblueQuuL55ZWMrw/
         4Tcr2CHmH9Ef6P0qlnwW09hQxowX1bKqKZFpAhTGAr4gogJ+z7wGj+41lSa9K7ttJkCv
         4yfdU2qIamQUFI8uveqpdyPJeW5r8vc13rPpn7BYEmoL7R7ZQRq8eHofEMsbSpuUmY64
         BOiw==
X-Gm-Message-State: ACrzQf0tWlYHT0gJgIVPNwFB1Oy6uKZzS2Hh5QRlo7zKfkmDqPqqHQn9
        7epn+vr6UVb2xIw3ETkqqubSU3y7/Efe4A==
X-Google-Smtp-Source: AMsMyM5dRI5Ibt8ieJplg5IOh+XgbM6qz8GAEsmNR54+JRHOVj7xqoF4ZZzcW2wlwo5Q7f0TCq3zlw==
X-Received: by 2002:a05:622a:4d4:b0:35d:19e0:a44e with SMTP id q20-20020a05622a04d400b0035d19e0a44emr5242337qtx.543.1663935834186;
        Fri, 23 Sep 2022 05:23:54 -0700 (PDT)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com. [209.85.219.180])
        by smtp.gmail.com with ESMTPSA id 203-20020a3706d4000000b006cf36d46902sm5613476qkg.66.2022.09.23.05.23.53
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Sep 2022 05:23:53 -0700 (PDT)
Received: by mail-yb1-f180.google.com with SMTP id e81so16814149ybb.13
        for <linux-m68k@lists.linux-m68k.org>; Fri, 23 Sep 2022 05:23:53 -0700 (PDT)
X-Received: by 2002:a25:8e84:0:b0:696:466c:baa with SMTP id
 q4-20020a258e84000000b00696466c0baamr8375558ybl.604.1663935833560; Fri, 23
 Sep 2022 05:23:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220921185208.3549140-1-Jason@zx2c4.com> <20220921185208.3549140-2-Jason@zx2c4.com>
 <CAMuHMdUuM85s1APoxRmXnw13hHHEGgo8Z9EKvpV6maaZPaVUfA@mail.gmail.com> <CAHmME9pAsY4M=V0o4QLrrQiXwCvtiEO9FApBibXRiG41h-AgVA@mail.gmail.com>
In-Reply-To: <CAHmME9pAsY4M=V0o4QLrrQiXwCvtiEO9FApBibXRiG41h-AgVA@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 23 Sep 2022 14:23:41 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUSF=ARvKTP33psHNWEqvSeUUDuWLRsUUA7LHa+12agng@mail.gmail.com>
Message-ID: <CAMuHMdUSF=ARvKTP33psHNWEqvSeUUDuWLRsUUA7LHa+12agng@mail.gmail.com>
Subject: Re: [PATCH 2/2] m68k: virt: generate new RNG seed on reboot
To:     "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc:     linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Jason,

On Fri, Sep 23, 2022 at 1:53 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> On Fri, Sep 23, 2022 at 1:30 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > +static struct bi_record *rng_seed_record;
> >
> > This can be const...
> > >                 memzero_explicit((void *)data, len + 2);
> > > +                /* Store a reference to be filled in on reboot. */
> > > +               rng_seed_record = (void *)record;
> >
> > ... so this cast can be dropped.
>
> Will do.
>
> >
> > > +
> > >  static void virt_reset(void)
> > >  {
> > >         void __iomem *base = (void __iomem *)virt_bi_data.ctrl.mmio;
> > >
> > > +       if (rng_seed_record && rng_seed_record->size > sizeof(*rng_seed_record) + 2) {
> > > +               u16 len = rng_seed_record->size - sizeof(*rng_seed_record) - 2;
> > > +               get_random_bytes((u8 *)rng_seed_record->data + 2, len);
> > > +               *(u16 *)rng_seed_record->data = len;

Storing the length should use the proper cpu_to_be16 accessor.

> > Wouldn't it be simpler to just use the existing length?
> >
> >     if (rnd_seed_record) {
> >            u16 len = be16_to_cpup(data);
> >            get_random_bytes((u8 *)rng_seed_record->data + 2, len);
> >     }
>
> No, that would not work. len is 0 there, since we zero out the bytes
> after use for forward secrecy, and we zero out the length, so that we
> don't wind up feeding it zeros.

You're right. I misread the location of the "+ 2" in the clearing code.

> > However, I have my doubts this will actually work. Was this tested?
> > The bootinfo is passed from userspace, usually by reading
> > /proc/bootinfo, and adapting it where needed.
> > So I think you should implement this in kexec-tools instead.
>
> Yes, this was tested. This is to handle the reboot case, just as the
> commit subject says. Specifically, calling `reboot(RB_AUTOBOOT);`.

OK.

> It does *not* handle kexec. For that, indeed, kexec-tools needs to be
> augmented, but that's a separate patch that doesn't need to interact
> with this one.
>
> The way I tested this is by having my initramfs just call
> `reboot(RB_AUTOBOOT);`, and having add_bootloader_randomness() print
> its contents to the console. I checked that it was both present and
> different every time.

Are you sure the new kernel did receive the same randomness as prepared
by get_random_bytes()? I would expect it to just reboot into qemu,
reload the kernel from disk, and recreate a new bootinfo from scratch,
including generating a new random seed.

> I'll send a v2 with that const fix.

OK, thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
