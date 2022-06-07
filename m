Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8E0DC433EF
	for <linux-m68k@archiver.kernel.org>; Tue,  7 Jun 2022 09:12:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238759AbiFGJMW (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 7 Jun 2022 05:12:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233281AbiFGJMU (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 7 Jun 2022 05:12:20 -0400
X-Greylist: delayed 135 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 07 Jun 2022 02:12:17 PDT
Received: from mx2.mythic-beasts.com (mx2.mythic-beasts.com [IPv6:2a00:1098:0:82:1000:0:2:1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80CAA116E
        for <linux-m68k@lists.linux-m68k.org>; Tue,  7 Jun 2022 02:12:16 -0700 (PDT)
Received: from [209.85.167.54] (port=41795 helo=mail-lf1-f54.google.com)
        by balrog.mythic-beasts.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92.3)
        (envelope-from <martyn@welchs.me.uk>)
        id 1nyVDu-0000eC-To
        for linux-m68k@lists.linux-m68k.org; Tue, 07 Jun 2022 10:10:07 +0100
Received: by mail-lf1-f54.google.com with SMTP id u26so26559275lfd.8
        for <linux-m68k@lists.linux-m68k.org>; Tue, 07 Jun 2022 02:10:00 -0700 (PDT)
X-Gm-Message-State: AOAM530JpkmY5AzRBAyhZLhY2Az/okvcy2MKnzjqII75PSMMrUa5np3i
        AJyZ9HGWXni3S/drqNv91dENbkMKu/yjRgfU1lw=
X-Google-Smtp-Source: ABdhPJyULPIdIsKuXm4CBLs/lpx9OuZtHR1zOwsK0gfemBq6DPfmp1b12GD3NCSmZN55f3UVzaaZOjEGtnFIMz9tvoo=
X-Received: by 2002:a05:6512:13a1:b0:448:887e:da38 with SMTP id
 p33-20020a05651213a100b00448887eda38mr18154426lfa.298.1654593000256; Tue, 07
 Jun 2022 02:10:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220606084109.4108188-1-arnd@kernel.org> <Yp3ID86TBFxl7qyL@kroah.com>
In-Reply-To: <Yp3ID86TBFxl7qyL@kroah.com>
From:   Martyn Welch <martyn@welchs.me.uk>
Date:   Tue, 7 Jun 2022 10:09:49 +0100
X-Gmail-Original-Message-ID: <CAEccXecB=rkZ1Kejmzcfay6qMMVo7Kb7SovSq+Xs1zWMnJOxnQ@mail.gmail.com>
Message-ID: <CAEccXecB=rkZ1Kejmzcfay6qMMVo7Kb7SovSq+Xs1zWMnJOxnQ@mail.gmail.com>
Subject: Re: [PATCH 0/6] phase out CONFIG_VIRT_TO_BUS
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Arnd Bergmann <arnd@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Jakub Kicinski <kuba@kernel.org>,
        Christoph Hellwig <hch@infradead.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Robin Murphy <robin.murphy@arm.com>,
        iommu@lists.linux-foundation.org,
        Khalid Aziz <khalid@gonehiking.org>,
        linux-scsi@vger.kernel.org,
        Manohar Vanga <manohar.vanga@gmail.com>,
        linuxppc-dev@lists.ozlabs.org, linux-arch@vger.kernel.org,
        linux-alpha@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
        linux-parisc@vger.kernel.org, Denis Efremov <efremov@linux.com>
Content-Type: text/plain; charset="UTF-8"
X-BlackCat-Spam-Score: 14
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Mon, 6 Jun 2022 at 10:25, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Mon, Jun 06, 2022 at 10:41:03AM +0200, Arnd Bergmann wrote:
> > From: Arnd Bergmann <arnd@arndb.de>
> >
> > The virt_to_bus/bus_to_virt interface has been deprecated for
> > decades. After Jakub Kicinski put a lot of work into cleaning out the
> > network drivers using them, there are only a couple of other drivers
> > left, which can all be removed or otherwise cleaned up, to remove the
> > old interface for good.
> >
> > Any out of tree drivers using virt_to_bus() should be converted to
> > using the dma-mapping interfaces, typically dma_alloc_coherent()
> > or dma_map_single()).
> >
> > There are a few m68k and ppc32 specific drivers that keep using the
> > interfaces, but these are all guarded with architecture-specific
> > Kconfig dependencies, and are not actually broken.
> >
> > There are still a number of drivers that are using virt_to_phys()
> > and phys_to_virt() in place of dma-mapping operations, and these
> > are often broken, but they are out of scope for this series.
>
> I'll take patches 1 and 2 right now through my staging tree if that's
> ok.
>

Hi,

I'd love to say that I could fix this stuff up, however I've lacked access to
suitable hardware for a long time now and don't foresee that changing any
time soon...

Martyn

> thanks,
>
> greg k-h
>
