Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEDFAC43334
	for <linux-m68k@archiver.kernel.org>; Tue, 28 Jun 2022 07:04:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343713AbiF1HEl (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 28 Jun 2022 03:04:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343708AbiF1HEj (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 28 Jun 2022 03:04:39 -0400
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4EE5227169
        for <linux-m68k@lists.linux-m68k.org>; Tue, 28 Jun 2022 00:04:10 -0700 (PDT)
Received: by mail-qv1-f53.google.com with SMTP id i17so18669643qvo.13
        for <linux-m68k@lists.linux-m68k.org>; Tue, 28 Jun 2022 00:04:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oUnjhZMiGNi6v7nsbqYIrss5xtOvLOvLOLR2zcKJEss=;
        b=uLr8nGpFakMcIvrCt97nZ9r1d9HzMrq65izY+vP133VMO85wgF86hBBUUPjlrAt5ui
         2yY65NJq+J7s3v05lMY6a+UOsPz4OonkMCyXXApJKwUV5PeGtJPU3o14uXutQJF/A/4s
         HLr0eB4EKrGLn9DnJsiJgO7/OwKLLK4ve3Dt04zQuUanDTub7xQIy4i5XLKLwCGZ5T+4
         AHjgBrJa6aM3eeGbrWEzUF48HkbuyrNAtIiu6ZzGU9g9yWhh3/WsQkGs5zrl80eh1+wC
         KHFNzObDazXTGUaBmAkcGvEFBhSGGbpzjcF6o+udheZjZeuid3k6FJ9jl7AwdSOFxhrw
         TacA==
X-Gm-Message-State: AJIora93yJszPjfJG5yy4HMayqOLXedjLpZkYGmT5YsnZxEbDQjjlrlc
        NAh3vbf7jxtUmIu5feXH1oud4+3fWjZOyg==
X-Google-Smtp-Source: AGRyM1vhKUlISYUKSRbzd3tQmMGb/Vc/riLDjQTY6U8i0pbyh0fvA/VAUBS3m5RGkAYjJP3fKXha5Q==
X-Received: by 2002:a0c:dc83:0:b0:470:aa91:9ea5 with SMTP id n3-20020a0cdc83000000b00470aa919ea5mr2372649qvk.28.1656399849090;
        Tue, 28 Jun 2022 00:04:09 -0700 (PDT)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com. [209.85.219.181])
        by smtp.gmail.com with ESMTPSA id a20-20020a05620a16d400b0069fe1dfbeffsm10338991qkn.92.2022.06.28.00.04.06
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jun 2022 00:04:07 -0700 (PDT)
Received: by mail-yb1-f181.google.com with SMTP id o19so14134233ybg.2
        for <linux-m68k@lists.linux-m68k.org>; Tue, 28 Jun 2022 00:04:06 -0700 (PDT)
X-Received: by 2002:a05:6902:905:b0:64a:2089:f487 with SMTP id
 bu5-20020a056902090500b0064a2089f487mr18678075ybb.202.1656399845934; Tue, 28
 Jun 2022 00:04:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220617125750.728590-1-arnd@kernel.org> <20220617125750.728590-4-arnd@kernel.org>
 <6ba86afe-bf9f-1aca-7af1-d0d348d75ffc@gmail.com> <CAMuHMdVewn0OYA9oJfStk0-+vCKAUou+4Mvd5H2kmrSks1p5jg@mail.gmail.com>
 <b4e5a1c9-e375-63fb-ec7c-abb7384a6d59@gmail.com> <9289fd82-285c-035f-5355-4d70ce4f87b0@gmail.com>
In-Reply-To: <9289fd82-285c-035f-5355-4d70ce4f87b0@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 28 Jun 2022 09:03:53 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXUihTPD9A9hs__Xr2ErfOqkZ5KgCHqm+9HvRf39uS5kA@mail.gmail.com>
Message-ID: <CAMuHMdXUihTPD9A9hs__Xr2ErfOqkZ5KgCHqm+9HvRf39uS5kA@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] arch/*/: remove CONFIG_VIRT_TO_BUS
To:     Michael Schmitz <schmitzmic@gmail.com>
Cc:     Arnd Bergmann <arnd@kernel.org>, scsi <linux-scsi@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Jakub Kicinski <kuba@kernel.org>,
        Christoph Hellwig <hch@infradead.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Linux IOMMU <iommu@lists.linux-foundation.org>,
        Khalid Aziz <khalid@gonehiking.org>,
        "Maciej W . Rozycki" <macro@orcam.me.uk>,
        Matt Wang <wwentao@vmware.com>,
        Miquel van Smoorenburg <mikevs@xs4all.net>,
        Mark Salyzyn <salyzyn@android.com>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        Linux-Arch <linux-arch@vger.kernel.org>,
        alpha <linux-alpha@vger.kernel.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Parisc List <linux-parisc@vger.kernel.org>,
        Denis Efremov <efremov@linux.com>,
        Michael Ellerman <mpe@ellerman.id.au>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Michael,

On Tue, Jun 28, 2022 at 5:26 AM Michael Schmitz <schmitzmic@gmail.com> wrote:
> Am 28.06.2022 um 09:12 schrieb Michael Schmitz:
> > On 27/06/22 20:26, Geert Uytterhoeven wrote:
> >> On Sat, Jun 18, 2022 at 3:06 AM Michael Schmitz <schmitzmic@gmail.com>
> >> wrote:
> >>> Am 18.06.2022 um 00:57 schrieb Arnd Bergmann:
> >>>> From: Arnd Bergmann <arnd@arndb.de>
> >>>>
> >>>> All architecture-independent users of virt_to_bus() and bus_to_virt()
> >>>> have been fixed to use the dma mapping interfaces or have been
> >>>> removed now.  This means the definitions on most architectures, and the
> >>>> CONFIG_VIRT_TO_BUS symbol are now obsolete and can be removed.
> >>>>
> >>>> The only exceptions to this are a few network and scsi drivers for m68k
> >>>> Amiga and VME machines and ppc32 Macintosh. These drivers work
> >>>> correctly
> >>>> with the old interfaces and are probably not worth changing.
> >>> The Amiga SCSI drivers are all old WD33C93 ones, and replacing
> >>> virt_to_bus by virt_to_phys in the dma_setup() function there would
> >>> cause no functional change at all.
> >> FTR, the sgiwd93 driver use dma_map_single().
> >
> > Thanks! From what I see, it doesn't have to deal with bounce buffers
> > though?
>
> Leaving the bounce buffer handling in place, and taking a few other
> liberties - this is what converting the easiest case (a3000 SCSI) might
> look like. Any obvious mistakes? The mvme147 driver would be very
> similar to handle (after conversion to a platform device).

Thanks, looks reasonable.

> The driver allocates bounce buffers using kmalloc if it hits an
> unaligned data buffer - can such buffers still even happen these days?

No idea.

> If I understand dma_map_single() correctly, the resulting dma handle
> would be equally misaligned?
>
> To allocate a bounce buffer, would it be OK to use dma_alloc_coherent()
> even though AFAIU memory used for DMA buffers generally isn't consistent
> on m68k?
>
> Thinking ahead to the other two Amiga drivers - I wonder whether
> allocating a static bounce buffer or a DMA pool at driver init is likely
> to succeed if the kernel runs from the low 16 MB RAM chunk? It certainly
> won't succeed if the kernel runs from a higher memory address, so the
> present bounce buffer logic around amiga_chip_alloc() might still need
> to be used here.
>
> Leaves the question whether converting the gvp11 and a2091 drivers is
> actually worth it, if bounce buffers still have to be handled explicitly.

A2091 should be straight-forward, as A3000 is basically A2091 on the
motherboard (comparing the two drivers, looks like someone's been
sprinkling mb()s over the A3000 driver).

I don't have any of these SCSI host adapters (not counting the A590
(~A2091) expansion of the old A500, which is not Linux-capable, and
 hasn't been powered on for 20 years).

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
