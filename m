Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFBCCC433EF
	for <linux-m68k@archiver.kernel.org>; Sat, 18 Jun 2022 01:06:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235826AbiFRBG4 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 17 Jun 2022 21:06:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1383496AbiFRBGy (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 17 Jun 2022 21:06:54 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2182E5BD32
        for <linux-m68k@lists.linux-m68k.org>; Fri, 17 Jun 2022 18:06:54 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id y13-20020a17090a154d00b001eaaa3b9b8dso5506716pja.2
        for <linux-m68k@lists.linux-m68k.org>; Fri, 17 Jun 2022 18:06:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=KRIeihzYwpT99jVYyWrBvkWlYlvrvIZJfg260Yku6Lc=;
        b=mYCiRA6jX3TZBBpH5i1bdKxf86pnFybirRcUnA7+QegXGbzOVw+vVyBSconShTfcN0
         cCwY9Lg+Wp1DUlN7ZuDKZXZp+Lq9oTrhj5Egt9NASpHMRY0WFnq2TqiOXmxGI5seYlbP
         q0BPpHgaiqex7reMZd7eeiSPLbAesZfnXOSNpNddBnH0OtREDZ0fHr/GsKwCbGO2CEAh
         0hN2+Q0eH6pq4ZYITkDSH3pFg/hKtXahXOuIosfi8Y0II3BWuxt8tZ5GTulif6PPtR6w
         mWvi9cySEswvHdKCNsD70zRyxq32NFDfKs677RtcCSsSo3yIFNheD9lUFe9of5dO2FCw
         T3OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:references:cc:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=KRIeihzYwpT99jVYyWrBvkWlYlvrvIZJfg260Yku6Lc=;
        b=DM6KM3vaadhyEX8Wt+8HbHBxmtSWzT/fVHMk0EnHaGs6yBdoL+f87geiy8YcWZtwp6
         esFnoqynE4T39MfOBYA9VbDnccHP0QRn7bVEpCRiyD/VBxcG0o3oEyIX299BFR3USbYR
         E772YxnPtd5pkUittbiw1zXgI4NOPfo/K7s2h9YPLuAahkmLsbQ8Av2o6VvKdliXB8+Y
         Uv6Cb5Ph8BWoTnfvVAGb4hCqYGM1YdDqTqCyYmgvVkp1v37o4IHXR9NpJhLrabhqO/Tr
         eBvjJy3I+/QCP4GCyKjkmuoSU1VOHbIdvtxrASvKia4EmxkcaUdfo3muOTzyeW7Rn1Ft
         xlwg==
X-Gm-Message-State: AJIora+miUG7Hd70huceguI/RxvFrsayZJ3CXGHdDFhnG2RR9C/AZEuc
        HTVIkdMTBFLGCkSQp1y2VMc=
X-Google-Smtp-Source: AGRyM1u1j6XUfwl32yRCm+A4vEBywEwNGmaCfY9KqlZE6/HghD6w2fj/KwvqmOMndnHwj1ctiT07Vw==
X-Received: by 2002:a17:90b:4ac9:b0:1e3:1dca:d995 with SMTP id mh9-20020a17090b4ac900b001e31dcad995mr13457922pjb.111.1655514413476;
        Fri, 17 Jun 2022 18:06:53 -0700 (PDT)
Received: from [10.1.1.24] (222-155-0-244-adsl.sparkbb.co.nz. [222.155.0.244])
        by smtp.gmail.com with ESMTPSA id j3-20020a170903024300b00161947ecc82sm4126766plh.199.2022.06.17.18.06.43
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 17 Jun 2022 18:06:52 -0700 (PDT)
Subject: Re: [PATCH v2 3/3] arch/*/: remove CONFIG_VIRT_TO_BUS
To:     Arnd Bergmann <arnd@kernel.org>, linux-scsi@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220617125750.728590-1-arnd@kernel.org>
 <20220617125750.728590-4-arnd@kernel.org>
Cc:     Arnd Bergmann <arnd@arndb.de>, Jakub Kicinski <kuba@kernel.org>,
        Christoph Hellwig <hch@infradead.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Robin Murphy <robin.murphy@arm.com>,
        iommu@lists.linux-foundation.org,
        Khalid Aziz <khalid@gonehiking.org>,
        "Maciej W . Rozycki" <macro@orcam.me.uk>,
        Matt Wang <wwentao@vmware.com>,
        Miquel van Smoorenburg <mikevs@xs4all.net>,
        Mark Salyzyn <salyzyn@android.com>,
        linuxppc-dev@lists.ozlabs.org, linux-arch@vger.kernel.org,
        linux-alpha@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
        linux-parisc@vger.kernel.org, Denis Efremov <efremov@linux.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Michael Ellerman <mpe@ellerman.id.au>
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <6ba86afe-bf9f-1aca-7af1-d0d348d75ffc@gmail.com>
Date:   Sat, 18 Jun 2022 13:06:40 +1200
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <20220617125750.728590-4-arnd@kernel.org>
Content-Type: text/plain; charset=iso-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Arnd,

Am 18.06.2022 um 00:57 schrieb Arnd Bergmann:
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

The Amiga SCSI drivers are all old WD33C93 ones, and replacing 
virt_to_bus by virt_to_phys in the dma_setup() function there would 
cause no functional change at all.

drivers/vme/bridges/vme_ca91cx42.c hasn't been used at all on m68k (it 
is a PCI-to-VME bridge chipset driver that would be needed on 
architectures that natively use a PCI bus). I haven't found anything 
that selects that driver, so not sure it is even still in use??

That would allow you to drop the remaining virt_to_bus define from 
arch/m68k/include/asm/virtconvert.h.

I could submit a patch to convert the Amiga SCSI drivers to use 
virt_to_phys if Geert and the SCSI maintainers think it's worth the churn.

32bit powerpc is a different matter though.

Cheers,

	Michael
