Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D31F1E95A8E
	for <linux-m68k@archiver.kernel.org>; Mon,  9 Oct 2023 11:10:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346139AbjJILKn convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 9 Oct 2023 07:10:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346171AbjJILKm (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 9 Oct 2023 07:10:42 -0400
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06D2DA6
        for <linux-m68k@lists.linux-m68k.org>; Mon,  9 Oct 2023 04:10:41 -0700 (PDT)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-5a7a77e736dso1994227b3.1
        for <linux-m68k@lists.linux-m68k.org>; Mon, 09 Oct 2023 04:10:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696849840; x=1697454640;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TWthkWDqr7tBRS16dMRTYjQcxpjwoRQd7noLnGne1cw=;
        b=gY7ZgAQMnmuFinkn6mNw23sbBpSqdIMdSkCvFpirLkg/0fv64Mz2FkzA8AQ7RW71eW
         zcmch+oO8spTXiQXXNtUZ3eDq0ZCzeWHebc74FhIWmYD4xalQzyCgB2+wvFAOy1RLRPP
         1ELPbEG/97uHx6wHGrSlUCfceKjWrJR2dEMZGVOMMcUzIoBn5pb5CO811JJUCgZNo99G
         M3Yc4Rqy56fTkfj4igqYvtOEwwts3jCLHu/WkYe5g63abKQt68HLf947QQn1TNllQMIW
         X0cIMZ6SydkBhmnwJvlGiDo8RPlN9NZM2h1MAxDUUi1Vugi6IoYLvUGaZHgaPaqi9UG+
         Lg4g==
X-Gm-Message-State: AOJu0YzhewmoHxrQNjTLxLc90khde4VR1A/ZxGjhRHyour4l0AoLsXjd
        j72zJLbaYllb0daUNcFubRAtwCw77QkG5A==
X-Google-Smtp-Source: AGHT+IECy6T/0lJuD42B7OjLixj2wxoS8xbz5iB8ttCTXkgxXoccxo7hZgXCl0AK5k4l+P4u9UwtSA==
X-Received: by 2002:a0d:d4c1:0:b0:59b:c4a5:f2ba with SMTP id w184-20020a0dd4c1000000b0059bc4a5f2bamr16268211ywd.9.1696849839923;
        Mon, 09 Oct 2023 04:10:39 -0700 (PDT)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com. [209.85.128.170])
        by smtp.gmail.com with ESMTPSA id r126-20020a0de884000000b005869f734036sm3610909ywe.19.2023.10.09.04.10.38
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Oct 2023 04:10:39 -0700 (PDT)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-5a7ac4c3666so624027b3.3
        for <linux-m68k@lists.linux-m68k.org>; Mon, 09 Oct 2023 04:10:38 -0700 (PDT)
X-Received: by 2002:a81:7b54:0:b0:595:e1b:b978 with SMTP id
 w81-20020a817b54000000b005950e1bb978mr16558396ywc.21.1696849838737; Mon, 09
 Oct 2023 04:10:38 -0700 (PDT)
MIME-Version: 1.0
References: <20231009074121.219686-1-hch@lst.de> <20231009074121.219686-2-hch@lst.de>
 <CAMuHMdWiYDQ5J7R7hPaVAYgXqJvpjdksoF6X-zHrJ_80Ly4XfQ@mail.gmail.com>
 <20231009091625.GB22463@lst.de> <CAMuHMdUZNewD-QC8J7MWSBP197Vc169meOjjK6=b7M11kVjUzg@mail.gmail.com>
 <20231009094330.GA24836@lst.de> <CAMuHMdV2FXdUHtjYW8JyXGBgHhR8De0vp3Ee77e6G8Vbs3gG8Q@mail.gmail.com>
 <1cd44af1-10ac-465a-8d20-e0aa268e036f@arm.com>
In-Reply-To: <1cd44af1-10ac-465a-8d20-e0aa268e036f@arm.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 9 Oct 2023 13:10:26 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXNX7+VLnSYhj=M9dTSTWLJqjS_WaT0ceMRUYoa5_MSeA@mail.gmail.com>
Message-ID: <CAMuHMdXNX7+VLnSYhj=M9dTSTWLJqjS_WaT0ceMRUYoa5_MSeA@mail.gmail.com>
Subject: Re: [PATCH 1/6] dma-direct: add depdenencies to CONFIG_DMA_GLOBAL_POOL
To:     Robin Murphy <robin.murphy@arm.com>
Cc:     Christoph Hellwig <hch@lst.de>, iommu@lists.linux.dev,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Wei Fang <wei.fang@nxp.com>,
        Shenwei Wang <shenwei.wang@nxp.com>,
        Clark Wang <xiaoning.wang@nxp.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-m68k@lists.linux-m68k.org, netdev@vger.kernel.org,
        Jim Quinlan <james.quinlan@broadcom.com>,
        linux-riscv <linux-riscv@lists.infradead.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "Lad, Prabhakar" <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        arm-soc <soc@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Robin,

On Mon, Oct 9, 2023 at 12:04 PM Robin Murphy <robin.murphy@arm.com> wrote:
> On 2023-10-09 10:51, Geert Uytterhoeven wrote:
> > On Mon, Oct 9, 2023 at 11:43 AM Christoph Hellwig <hch@lst.de> wrote:
> >> On Mon, Oct 09, 2023 at 11:34:55AM +0200, Geert Uytterhoeven wrote:
> >>> The fix you are referring too is probably commit c1ec4b450ab729e3
> >>> ("soc: renesas: Make ARCH_R9A07G043 (riscv version) depend
> >>> on NONPORTABLE") in next-20231006 and later.  It is not yet upstream.
> >>>
> >>> Still, it merely makes ARCH_R9A07G043 (which selects DMA_GLOBAL_POOL)
> >>> depend on ARCH_R9A07G043.
> >>> RISCV_DMA_NONCOHERENT still selects DMA_DIRECT_REMAP, so both can end
> >>> up being enabled.
> >>
> >> Ok, so we need to actually fix this properly.  Lad, can you respin
> >> the fix to not select DMA_DIRECT_REMAP, for ARCH_R9A07G043?
> >
> > ARCH_R9A07G043 does not select DMA_DIRECT_REMAP directly,
> > RISCV_DMA_NONCOHERENT does.  And there are other users of
> > RISCV_DMA_NONCOHERENT (RISCV_ISA_ZICBOM and ERRATA_THEAD_CMO).
> > Should the selection of DMA_DIRECT_REMAP moved to their users?
>
> No, the selection of DMA_GLOBAL_POOL should be removed from
> RISV_DMA_NONCOHERENT and selected directly by ARCH_R9A07G043 (along with
> any of the other implied symbols it needs). Or if as suggested this
> physical-attribute-remap wackiness is due to show up on more platforms
> as well, maybe have a common config for that which selects
> DMA_GLOBAL_POOL plus the relevant cache maintenance extensions as an
> equivalent to RISCV_DMA_NONCOHERENT, and can itself explicitly depend on
> NONPORTABLE for clarity.

RISCV_DMA_NONCOHERENT does not select DMA_GLOBAL_POOL,
ARCH_R9A07G043 selects DMA_GLOBAL_POOL.
RISCV_DMA_NONCOHERENT does select DMA_DIRECT_REMAP if MMU.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
