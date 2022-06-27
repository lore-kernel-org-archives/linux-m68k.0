Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57D9CCCA47E
	for <linux-m68k@archiver.kernel.org>; Mon, 27 Jun 2022 08:26:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233530AbiF0I0z (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 27 Jun 2022 04:26:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233518AbiF0I0y (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 27 Jun 2022 04:26:54 -0400
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E168B6178
        for <linux-m68k@lists.linux-m68k.org>; Mon, 27 Jun 2022 01:26:53 -0700 (PDT)
Received: by mail-qv1-f48.google.com with SMTP id y14so13699742qvs.10
        for <linux-m68k@lists.linux-m68k.org>; Mon, 27 Jun 2022 01:26:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ir7A3VG3rQ4e3U1bE1FV/pPr5VS7k4YiEaqfUpRXgys=;
        b=R/MtfpyM815NDN4RwAnXjktw4AlxTNOjXVXA8KuPdtSTtW1P4cjv82jwmC1rKoLXIu
         dQzZ8W9NOdQbFY0ud/pb8KV+TnCyqZ30ZhjI01EowKXh9vAnI/K+fucl0BNTebegf1UP
         L8/OwbBg73n/3nWlPld39j3tQYEEiWjwaxzw9MLwPjI9b+jM9aWMct1zZVC2txjKuoaz
         rpGJqlnqlxZkODwBXxM7ycoX1iAtSm/Ae/V8J4bAIIiIGK8iSrvG1ANhW7mq/zasd59J
         Y1JvtKSi4XvSGJkjsoYjhLBiwmnqGC6MNpCTzTrgrxnDV7hpK0PBr1hfBQAkaXrkHlr9
         OIMQ==
X-Gm-Message-State: AJIora9ZXHvMDUdxoSlbnEI5Eph9RTzgGAyO/nC1OfxpB5MJLeRzY+iP
        XSPCABYEHqolV0mzDQIDRc7y2m5KcmOEsg==
X-Google-Smtp-Source: AGRyM1tEh0tijeiDNbOMQR6IzrTK3r3u1k/C1dhO3tHqz4jkleB7rCpLdDS/Ya8vgYzNTdf0SlHQgw==
X-Received: by 2002:ac8:5ad1:0:b0:305:864:2eb0 with SMTP id d17-20020ac85ad1000000b0030508642eb0mr8335599qtd.168.1656318411577;
        Mon, 27 Jun 2022 01:26:51 -0700 (PDT)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com. [209.85.128.178])
        by smtp.gmail.com with ESMTPSA id fb10-20020a05622a480a00b00304e2e4bf1esm6690157qtb.88.2022.06.27.01.26.50
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jun 2022 01:26:51 -0700 (PDT)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-31780ad7535so77778557b3.8
        for <linux-m68k@lists.linux-m68k.org>; Mon, 27 Jun 2022 01:26:50 -0700 (PDT)
X-Received: by 2002:a81:a092:0:b0:318:5c89:a935 with SMTP id
 x140-20020a81a092000000b003185c89a935mr14193176ywg.383.1656318410280; Mon, 27
 Jun 2022 01:26:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220617125750.728590-1-arnd@kernel.org> <20220617125750.728590-4-arnd@kernel.org>
 <6ba86afe-bf9f-1aca-7af1-d0d348d75ffc@gmail.com>
In-Reply-To: <6ba86afe-bf9f-1aca-7af1-d0d348d75ffc@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 27 Jun 2022 10:26:37 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVewn0OYA9oJfStk0-+vCKAUou+4Mvd5H2kmrSks1p5jg@mail.gmail.com>
Message-ID: <CAMuHMdVewn0OYA9oJfStk0-+vCKAUou+4Mvd5H2kmrSks1p5jg@mail.gmail.com>
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

On Sat, Jun 18, 2022 at 3:06 AM Michael Schmitz <schmitzmic@gmail.com> wrote:
> Am 18.06.2022 um 00:57 schrieb Arnd Bergmann:
> > From: Arnd Bergmann <arnd@arndb.de>
> >
> > All architecture-independent users of virt_to_bus() and bus_to_virt()
> > have been fixed to use the dma mapping interfaces or have been
> > removed now.  This means the definitions on most architectures, and the
> > CONFIG_VIRT_TO_BUS symbol are now obsolete and can be removed.
> >
> > The only exceptions to this are a few network and scsi drivers for m68k
> > Amiga and VME machines and ppc32 Macintosh. These drivers work correctly
> > with the old interfaces and are probably not worth changing.
>
> The Amiga SCSI drivers are all old WD33C93 ones, and replacing
> virt_to_bus by virt_to_phys in the dma_setup() function there would
> cause no functional change at all.

FTR, the sgiwd93 driver use dma_map_single().

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
