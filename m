Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9D24C64EC7
	for <linux-m68k@archiver.kernel.org>; Tue, 28 Feb 2023 07:49:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230048AbjB1HtN (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 28 Feb 2023 02:49:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229537AbjB1HtM (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 28 Feb 2023 02:49:12 -0500
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 383D427D6B
        for <linux-m68k@lists.linux-m68k.org>; Mon, 27 Feb 2023 23:49:11 -0800 (PST)
Received: by mail-qt1-f170.google.com with SMTP id c18so9531926qte.5
        for <linux-m68k@lists.linux-m68k.org>; Mon, 27 Feb 2023 23:49:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/9nszujs/cR5S+IMyIjmZJZVbyFeU+vaQIe48z9YdiU=;
        b=DXRuhp0Jbwy1Ew7Dli+rvFu6J/F93x//3osCpLn0lIgdOtGo/jYyHF4TcSc53nUenn
         +S2PM+0+tnIFj+gsSHy+12N0JZDl/91onlAeFU8AupOLga7Sq8lkUeO7ixnZ1TM0BwIb
         m30ktTyGxlXz7ODAFswjt0eskXSJJPoxHj2P62BbFgkTYl7/AJzameSESKasztqHt8Cd
         YmCFAYlXNqVY7GcdNxcI/kOLR344DUsXELbpfva3NpogqvCEZ7CKx0IYgosQKb+qhDp6
         cp5GSEj9l3Z37p6FKp3DDT2R/PPybTo6GxdRHrqEKQM9iaosh2g+pvSKvvedDgaPCGXV
         v9GA==
X-Gm-Message-State: AO0yUKXDP31m2COFZ854ziCvhsF2xem3NLMRNPYlxFzjy7dYbdFnMZ2Z
        2dY9rxQGFPSeKJd9Gz/+1aMNdOPqpxdQsQ==
X-Google-Smtp-Source: AK7set8SGbflY9rU51MoDakZw2iyPkkaecmEBKmnYb63BtniVVuAPVMdElapfTRwoAgP/a4oj/N/nQ==
X-Received: by 2002:a05:622a:15c2:b0:3b8:1be5:3bff with SMTP id d2-20020a05622a15c200b003b81be53bffmr3382329qty.26.1677570549894;
        Mon, 27 Feb 2023 23:49:09 -0800 (PST)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com. [209.85.128.178])
        by smtp.gmail.com with ESMTPSA id d25-20020a05620a205900b0073d873df3fesm6417310qka.30.2023.02.27.23.49.09
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Feb 2023 23:49:09 -0800 (PST)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-5384ff97993so248166527b3.2
        for <linux-m68k@lists.linux-m68k.org>; Mon, 27 Feb 2023 23:49:09 -0800 (PST)
X-Received: by 2002:a81:441c:0:b0:52e:f66d:b70f with SMTP id
 r28-20020a81441c000000b0052ef66db70fmr1003301ywa.5.1677570548820; Mon, 27 Feb
 2023 23:49:08 -0800 (PST)
MIME-Version: 1.0
References: <dff216da09ab7a60217c3fc2147e671ae07d636f.1677528627.git.geert@linux-m68k.org>
 <f0877485-16df-1bda-c935-5ef56afacc8d@linux-m68k.org>
In-Reply-To: <f0877485-16df-1bda-c935-5ef56afacc8d@linux-m68k.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 28 Feb 2023 08:48:53 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXMWaCm7OGq7O9F5SWBxhreTppUr4K6K9FmZf1GpaAtVA@mail.gmail.com>
Message-ID: <CAMuHMdXMWaCm7OGq7O9F5SWBxhreTppUr4K6K9FmZf1GpaAtVA@mail.gmail.com>
Subject: Re: [PATCH] m68k: mm: Move initrd phys_to_virt handling after paging_init()
To:     Finn Thain <fthain@linux-m68k.org>
Cc:     Mike Rapoport <rppt@kernel.org>, Stephen Walsh <vk3heg@vk3heg.net>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Finn,

On Mon, Feb 27, 2023 at 11:46 PM Finn Thain <fthain@linux-m68k.org> wrote:
> On Mon, 27 Feb 2023, Geert Uytterhoeven wrote:
> > When booting with an initial ramdisk on platforms where physical memory
> > does not start at address zero (e.g. on Amiga):
> >
> >     initrd: 0ef0602c - 0f800000
> >     Zone ranges:
> >       DMA      [mem 0x0000000008000000-0x000000f7ffffffff]
> >       Normal   empty
> >     Movable zone start for each node
> >     Early memory node ranges
> >       node   0: [mem 0x0000000008000000-0x000000000f7fffff]
> >     Initmem setup node 0 [mem 0x0000000008000000-0x000000000f7fffff]
> >     Unable to handle kernel access at virtual address (ptrval)
> >     Oops: 00000000
> >     Modules linked in:
> >     PC: [<00201d3c>] memcmp+0x28/0x56
> >
> > As phys_to_virt() relies on m68k_memoffset and module_fixup(), it must
> > not be called before paging_init().  Hence postpone the phys_to_virt
> > handling for the initial ramdisk until after calling paging_init().
>
> Thanks for debugging this issue.

Np, you're welcome.

> > While at it, reduce #ifdef clutter by using IS_ENABLED() instead.
> >
> > Fixes: 376e3fdecb0dcae2 ("m68k: Enable memtest functionality")
>
> I apologise for the trouble caused by that patch.

Does that count as an Acked-by? ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
