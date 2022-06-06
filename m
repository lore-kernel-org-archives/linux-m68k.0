Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 981F4C433EF
	for <linux-m68k@archiver.kernel.org>; Mon,  6 Jun 2022 15:00:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237841AbiFFPAm (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 6 Jun 2022 11:00:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240212AbiFFPAg (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 6 Jun 2022 11:00:36 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47DE0308AD9
        for <linux-m68k@lists.linux-m68k.org>; Mon,  6 Jun 2022 08:00:35 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 8BA2C614C0
        for <linux-m68k@lists.linux-m68k.org>; Mon,  6 Jun 2022 15:00:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 030E7C341CB
        for <linux-m68k@lists.linux-m68k.org>; Mon,  6 Jun 2022 15:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1654527634;
        bh=tFvHiguChguydwXgPPk94DDRc3Gna/VqX+wPqkO+GTs=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=OTdTyPoYJ5bNQJSkFPmXEY+eWfJAwSfsYSgk4cODU6UlwBWjeYnv0Sxuz9qV0iSQM
         shE15IXcfCEfv8Mx+p/2oCrRlPgIxb29Lqv+ZUjwFZNe4LdNbfrgVQtNqfyVVnq8bi
         XXptqX4w9uja7FnAnfusW3dxnevauNzz6jq5hzXcmY+3JqZZyKCwbuEiefqMgnxCHt
         T0oumu3+Q5kYXm0Mn9+i87nfTx/T4bJLwOfqVC2aNx8tOMfbYaNABmt4DoR4wkLm1J
         PB4SHhF3GrdL+mEGCiRj9gV6ZRpnlaKARAORIAFsT5McazycsfBDejvPwC+ypF73Lz
         0VIsuzIGYeRKg==
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-2ef5380669cso145645497b3.9
        for <linux-m68k@lists.linux-m68k.org>; Mon, 06 Jun 2022 08:00:33 -0700 (PDT)
X-Gm-Message-State: AOAM532hI0HzkmeC66kNfJr26bUAk4klx8RXlOvfJpFv5o4UCxAUqMxu
        8+AW0FNmJSgrvNosLYbk2y9pMuZzrQTvThyTVzE=
X-Google-Smtp-Source: ABdhPJyPD1+vFTL7zI7MOAWlVQpzZfCC/ogYQOnb9fs+BnJ9OUYDclIzyORrk2d04n90LZcBaiPMBu6CLlPqCKGn2dQ=
X-Received: by 2002:a81:ad7:0:b0:2e6:84de:3223 with SMTP id
 206-20020a810ad7000000b002e684de3223mr26970693ywk.209.1654527628777; Mon, 06
 Jun 2022 08:00:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220606084109.4108188-1-arnd@kernel.org> <20220606084109.4108188-6-arnd@kernel.org>
 <alpine.DEB.2.21.2206061057060.19680@angie.orcam.me.uk>
In-Reply-To: <alpine.DEB.2.21.2206061057060.19680@angie.orcam.me.uk>
From:   Arnd Bergmann <arnd@kernel.org>
Date:   Mon, 6 Jun 2022 17:00:11 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0pqQHMucGgZDcLpoWMhoyU5yppXK=8y4Wsn0QL7=uD0g@mail.gmail.com>
Message-ID: <CAK8P3a0pqQHMucGgZDcLpoWMhoyU5yppXK=8y4Wsn0QL7=uD0g@mail.gmail.com>
Subject: Re: [PATCH 5/6] scsi: remove stale BusLogic driver
To:     "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc:     Arnd Bergmann <arnd@arndb.de>, Jakub Kicinski <kuba@kernel.org>,
        Christoph Hellwig <hch@infradead.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Robin Murphy <robin.murphy@arm.com>,
        "open list:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
        Khalid Aziz <khalid@gonehiking.org>,
        linux-scsi <linux-scsi@vger.kernel.org>,
        Manohar Vanga <manohar.vanga@gmail.com>,
        Martyn Welch <martyn@welchs.me.uk>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        linux-arch <linux-arch@vger.kernel.org>,
        alpha <linux-alpha@vger.kernel.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Parisc List <linux-parisc@vger.kernel.org>,
        Denis Efremov <efremov@linux.com>,
        Matt Wang <wwentao@vmware.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Mon, Jun 6, 2022 at 12:40 PM Maciej W. Rozycki <macro@orcam.me.uk> wrote:
>
> On Mon, 6 Jun 2022, Arnd Bergmann wrote:
>
> > This was in turn fixed in commit 56f396146af2 ("scsi: BusLogic: Fix
> > 64-bit system enumeration error for Buslogic"), 8 years later.
> >
> > The fact that this was found at all is an indication that there are
> > users, and it seems that Maciej, Matt and Khalid all have access to
> > this hardware, but if it took eight years to find the problem,
> > it's likely that nobody actually relies on it.
>
>  Umm, I use it with a 32-bit system, so it would be quite an issue for me
> to discover a problem with 64-bit configurations.  And I quite rely on
> this system for various stuff too!

Ok, good to know.

> > Remove it as part of the global virt_to_bus()/bus_to_virt() removal.
> > If anyone is still interested in keeping this driver, the alternative
> > is to stop it from using bus_to_virt(), possibly along the lines of
> > how dpt_i2o gets around the same issue.
>
>  Thanks for the pointer and for cc-ing me.  Please refrain from removing
> the driver at least for this release cycle and let me fix it.

Sure, no problem. It looks like I forgot to actually Cc you on the series
as I had meant to, glad it reached you anyway.

> It should be easy to mimic what I did for the defza driver: all bus addresses in
> the DMA API come associated with virtual addresses, so it is just a matter of
> recording those somewhere for later use rather than trying to mess up with
> bus addresses to figure out a reverse mapping.

I looked at the defza driver and that one appears simpler to me, as you
can look up the virtual address from an index, but it's possible I missed
what you do here. I meant specifically the calculation added by commit
67af2b060e02 ("[SCSI] dpt_i2o: move from virt_to_bus/bus_to_virt
to dma_alloc_coherent") in the dpt_i2o driver that can be used to
compute the virtual address. If something simpler works as well, that
is of course better.

        Arnd
