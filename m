Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7D52C2B9F4
	for <linux-m68k@archiver.kernel.org>; Mon, 28 Jun 2021 13:29:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 861EF61607
	for <linux-m68k@archiver.kernel.org>; Mon, 28 Jun 2021 13:29:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229802AbhF1NcL (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 28 Jun 2021 09:32:11 -0400
Received: from mail-ua1-f50.google.com ([209.85.222.50]:43979 "EHLO
        mail-ua1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229778AbhF1NcL (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Mon, 28 Jun 2021 09:32:11 -0400
Received: by mail-ua1-f50.google.com with SMTP id f1so6950979uaj.10
        for <linux-m68k@vger.kernel.org>; Mon, 28 Jun 2021 06:29:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nXLj5kpcShUDKbcLNSbbsXyrrjsrJPHalyO9B0ZFW9o=;
        b=T0nX5HRMSo/MoSWmLufpapAUuHIR9StB4JIC17vls2ANOc6lDEEO58+JKMMQw7rc8K
         OS/Zng0XwzGYSdxRh9b+meEhezHp2j5vmVeNYFYcv9SrzST9Y8GqPgD8b8G4mnXtVLOW
         gZ4ijHbxT91Q054pbOcNIzuFmB5jOxYTt3925iXePMTMNKHvstei8LdIGqVcbRE0B35r
         lovCuSyO8AmxSbXDBw84f49c9Jdr7M5rJdoOn9NxcCGPMkm8rJqDIGUxUMaj4AfcM4Pt
         ezmgaNHdOw+/X22aes4W3H8ln3bywBWn0DIDbS0Cbyg/SAprHAVV4oBoTOHfcDZlFp3E
         /Qng==
X-Gm-Message-State: AOAM533W9bA8buAwY5ps/b/5f/zeCuAXp8KNPJdwb/dgc+BEGdoJKAzs
        uE2XknvLCF8vd4La7VHzvZI/+kvSX5cPyZa3ynejGqIuRyM=
X-Google-Smtp-Source: ABdhPJyt+x2KMFiNkI3LocsMh0h5jAE+VB0qAbAwo9v/ew1siSxuafl/OuqImgmN70YgaGTlcZWfdUTHHs4aHUUeQbw=
X-Received: by 2002:ab0:70b3:: with SMTP id q19mr20686131ual.2.1624886984302;
 Mon, 28 Jun 2021 06:29:44 -0700 (PDT)
MIME-Version: 1.0
References: <1342441646-5645-1-git-send-email-gerg@snapgear.com>
 <1342441646-5645-2-git-send-email-gerg@snapgear.com> <CAMuHMdWSBLUzWfDFK0mSiuO0+=cidymmd33jR3qQ1gFmCPk02A@mail.gmail.com>
 <6796b52b-a868-7955-fedd-e841a21e6c95@linux-m68k.org>
In-Reply-To: <6796b52b-a868-7955-fedd-e841a21e6c95@linux-m68k.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 28 Jun 2021 15:29:33 +0200
Message-ID: <CAMuHMdX5vn87B=-pm8puECC74bog4YM6Uf2vY4mondntzSg65Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] m68k: common PCI support definitions and code
To:     Greg Ungerer <gerg@linux-m68k.org>
Cc:     "Linux/m68k" <linux-m68k@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Greg,

On Mon, Jun 28, 2021 at 3:23 PM Greg Ungerer <gerg@linux-m68k.org> wrote:
> On 28/6/21 5:44 pm, Geert Uytterhoeven wrote:
> > On Mon, Jul 16, 2012 at 2:25 PM <gerg@snapgear.com> wrote:
> >> From: Greg Ungerer <gerg@uclinux.org>
> >>
> >> Basic set of definitions and support code required to turn on CONFIG_PCI
> >> for the m68k architecture. Nothing specific to any PCI implementation in
> >> any m68k class CPU hardware yet.
> >>
> >> Signed-off-by: Greg Ungerer <gerg@uclinux.org>
> >
> >> --- a/arch/m68k/include/asm/io_mm.h
> >> +++ b/arch/m68k/include/asm/io_mm.h
> >> @@ -340,4 +340,6 @@ static inline void memcpy_toio(volatile void __iomem *dst, const void *src, int
> >>    */
> >>   #define xlate_dev_kmem_ptr(p)  p
> >>
> >> +#define ioport_map(port, nr)   ((void __iomem *)(port))
> >
> > So should we dop:
> >
> >      config NO_IOPORT_MAP
> >              def_bool y
> >
> > Triggered by seeing CONFIG_GPIO_TQMX86 being removed from allmodconfig
> > builds due to commit c6414e1a2bd26b00 ("gpio: AMD8111 and TQMX86
> > require HAS_IOPORT_MAP").
>
> I guess we could.
> But we would have to remove the iomap/iounmap definitions in kmap.h too right?

Why? Do I need more coffee?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
