Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 016E2C433EF
	for <linux-m68k@archiver.kernel.org>; Tue,  7 Jun 2022 07:30:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237652AbiFGHaT (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 7 Jun 2022 03:30:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237671AbiFGH3z (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 7 Jun 2022 03:29:55 -0400
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65DA953E19
        for <linux-m68k@lists.linux-m68k.org>; Tue,  7 Jun 2022 00:29:52 -0700 (PDT)
Received: by mail-qt1-f182.google.com with SMTP id y15so12044703qtx.4
        for <linux-m68k@lists.linux-m68k.org>; Tue, 07 Jun 2022 00:29:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/vvSp91df5DXi30Fd3pExmyOkjiZTMAg5zYSvB9bVbM=;
        b=4BSH/oYgzlib9x5wuQKAW0mL7CjpFXxhkHAb5qeVAcDo7rqz6z4eJvOi20A3/C6k/F
         b+Q57c4maC880iVR5v1402o3PKZwS4GtAvZZwb+YukZgb+iWzN6Km/LsDrJKutuq33je
         Aua4iQZQSU/rJ81b2JBNn5kXnwgWybJFQgnCIeo1NoZvoTITNCw8BKYgsHbzclWpqz0W
         GhtKEvt03FMCR66aLJr0bPD9cXesTcgr1+o7l1Zzk7UX0LVZ6f4AibVZXoq4JVEgfAJ4
         FfQlX12R1b2f0OpsuKN1rx4skj6Sf6NFKS42MPnzpqAjaaNmu+JeOMg5JZna6118OHv7
         ew5w==
X-Gm-Message-State: AOAM532W9vZ8J7NyLSrOHgIPU2mb0XmsrpcjpWM2LaPrA4FeVZgHkzgp
        JnQZ/a9ARDXzeTFNaJtJB5a0opDfVFMqag==
X-Google-Smtp-Source: ABdhPJxRX4jwGMAYNFIXHwSMRZQfnveHLT4fc9sWCqBDVb5EvJyXS7TzT29hoN9c9I7bsK7qkaTbug==
X-Received: by 2002:ac8:7d8e:0:b0:304:eed1:d6ec with SMTP id c14-20020ac87d8e000000b00304eed1d6ecmr5532237qtd.590.1654586991213;
        Tue, 07 Jun 2022 00:29:51 -0700 (PDT)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com. [209.85.219.173])
        by smtp.gmail.com with ESMTPSA id d19-20020a05620a241300b006a6c230f5e0sm4034204qkn.31.2022.06.07.00.29.49
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jun 2022 00:29:50 -0700 (PDT)
Received: by mail-yb1-f173.google.com with SMTP id r82so29639574ybc.13
        for <linux-m68k@lists.linux-m68k.org>; Tue, 07 Jun 2022 00:29:49 -0700 (PDT)
X-Received: by 2002:a25:7307:0:b0:65c:b98a:f592 with SMTP id
 o7-20020a257307000000b0065cb98af592mr28407064ybc.380.1654586989616; Tue, 07
 Jun 2022 00:29:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220606084109.4108188-1-arnd@kernel.org> <20220606084109.4108188-7-arnd@kernel.org>
In-Reply-To: <20220606084109.4108188-7-arnd@kernel.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 7 Jun 2022 09:29:38 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXi2LkrWSs9=D9tSfhz+YDHB+638F6JdmgQ7V8Gj1ehqQ@mail.gmail.com>
Message-ID: <CAMuHMdXi2LkrWSs9=D9tSfhz+YDHB+638F6JdmgQ7V8Gj1ehqQ@mail.gmail.com>
Subject: Re: [PATCH 6/6] arch/*/: remove CONFIG_VIRT_TO_BUS
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Arnd Bergmann <arnd@arndb.de>, Jakub Kicinski <kuba@kernel.org>,
        Christoph Hellwig <hch@infradead.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Linux IOMMU <iommu@lists.linux-foundation.org>,
        Khalid Aziz <khalid@gonehiking.org>,
        scsi <linux-scsi@vger.kernel.org>,
        Manohar Vanga <manohar.vanga@gmail.com>,
        Martyn Welch <martyn@welchs.me.uk>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        Linux-Arch <linux-arch@vger.kernel.org>,
        alpha <linux-alpha@vger.kernel.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Parisc List <linux-parisc@vger.kernel.org>,
        Denis Efremov <efremov@linux.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Mon, Jun 6, 2022 at 11:10 AM Arnd Bergmann <arnd@kernel.org> wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>
> All architecture-independent users of virt_to_bus() and bus_to_virt()
> have been fixed to use the dma mapping interfaces or have been
> removed now.  This means the definitions on most architectures, and the
> CONFIG_VIRT_TO_BUS symbol are now obsolete and can be removed.
>
> The only exceptions to this are a few network and scsi drivers for m68k
> Amiga and VME machines and ppc32 Macintosh. These drivers work correctly
> with the old interfaces and are probably not worth changing.
>
> On alpha and parisc, virt_to_bus() were still used in asm/floppy.h.
> alpha can use isa_virt_to_bus() like x86 does, and parisc can just
> open-code the virt_to_phys() here, as this is architecture specific
> code.
>
> I tried updating the bus-virt-phys-mapping.rst documentation, which
> started as an email from Linus to explain some details of the Linux-2.0
> driver interfaces. The bits about virt_to_bus() were declared obsolete
> backin 2000, and the rest is not all that relevant any more, so in the
> end I just decided to remove the file completely.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

>  arch/m68k/Kconfig                             |   1 -
>  arch/m68k/include/asm/virtconvert.h           |   4 +-

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
