Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50F74E95A99
	for <linux-m68k@archiver.kernel.org>; Mon,  9 Oct 2023 09:35:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345775AbjJIJf0 convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 9 Oct 2023 05:35:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345753AbjJIJfY (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 9 Oct 2023 05:35:24 -0400
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F337BEB
        for <linux-m68k@lists.linux-m68k.org>; Mon,  9 Oct 2023 02:35:09 -0700 (PDT)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-59f4f80d084so51184637b3.1
        for <linux-m68k@lists.linux-m68k.org>; Mon, 09 Oct 2023 02:35:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696844109; x=1697448909;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xr8BhwyyAKTpcM9iiIvbHN9gtfLY84lyd2lf3mY1OqM=;
        b=KXOxOgZZ0luNPOZDrweM2+VCia/sCZTS9VDK/05F7G6uaLIr6sNCCHT84FbiO+l0mn
         0te2oTXKwRbvUCorIjEEKzO82fPG1/pWTgrr3X4GcQteVbidTS9kW3K/4qrxxfiI820W
         ft1AnV7Cs1iirTo6MegjFAcohOrqTc9dP7GxaNRswcXc0X0Bo7CEwnaeIXWTfvuaImHx
         YemzVtb2FruDhT2vQMiqDcd4w//pnXCO0c9GtIEi7FoTr8+YuB8iySL/L51h6ZRvByTX
         1QjUnTpjBj03K93Js7ePrfiaFLLKhapnv/J/yBjUHiQWwr98Hg5eQFT9TwgW1qnrfUIS
         BQlg==
X-Gm-Message-State: AOJu0YyIuW2cyiGJdCUgoIn42Mdz0fd3UT48gWFfceFHbydeSI+4pixH
        +FsVcuXh+OpzDhSBQhw1OphHD0qnH05+nw==
X-Google-Smtp-Source: AGHT+IGW9LJR3ynP+dUqZsk4DNOF4Or1ysentgaQ/A7m7jVkpfkJ0WZQEvgv88+VhxwXKdyC0KiBbA==
X-Received: by 2002:a0d:d945:0:b0:59f:4c52:2f5d with SMTP id b66-20020a0dd945000000b0059f4c522f5dmr15817936ywe.2.1696844108981;
        Mon, 09 Oct 2023 02:35:08 -0700 (PDT)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com. [209.85.128.169])
        by smtp.gmail.com with ESMTPSA id l17-20020a0de211000000b005a50575b1c8sm3536631ywe.26.2023.10.09.02.35.08
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Oct 2023 02:35:08 -0700 (PDT)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-59f4f80d084so51184507b3.1
        for <linux-m68k@lists.linux-m68k.org>; Mon, 09 Oct 2023 02:35:08 -0700 (PDT)
X-Received: by 2002:a81:8246:0:b0:58d:f1fe:5954 with SMTP id
 s67-20020a818246000000b0058df1fe5954mr15164085ywf.32.1696844108593; Mon, 09
 Oct 2023 02:35:08 -0700 (PDT)
MIME-Version: 1.0
References: <20231009074121.219686-1-hch@lst.de> <20231009074121.219686-2-hch@lst.de>
 <CAMuHMdWiYDQ5J7R7hPaVAYgXqJvpjdksoF6X-zHrJ_80Ly4XfQ@mail.gmail.com> <20231009091625.GB22463@lst.de>
In-Reply-To: <20231009091625.GB22463@lst.de>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 9 Oct 2023 11:34:55 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUZNewD-QC8J7MWSBP197Vc169meOjjK6=b7M11kVjUzg@mail.gmail.com>
Message-ID: <CAMuHMdUZNewD-QC8J7MWSBP197Vc169meOjjK6=b7M11kVjUzg@mail.gmail.com>
Subject: Re: [PATCH 1/6] dma-direct: add depdenencies to CONFIG_DMA_GLOBAL_POOL
To:     Christoph Hellwig <hch@lst.de>
Cc:     iommu@lists.linux.dev, Robin Murphy <robin.murphy@arm.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Wei Fang <wei.fang@nxp.com>,
        Shenwei Wang <shenwei.wang@nxp.com>,
        Clark Wang <xiaoning.wang@nxp.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-m68k@lists.linux-m68k.org, netdev@vger.kernel.org,
        Jim Quinlan <james.quinlan@broadcom.com>,
        linux-riscv <linux-riscv@lists.infradead.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "Lad, Prabhakar" <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Christoph,

On Mon, Oct 9, 2023 at 11:16 AM Christoph Hellwig <hch@lst.de> wrote:
> On Mon, Oct 09, 2023 at 10:43:57AM +0200, Geert Uytterhoeven wrote:
> > >  config DMA_DIRECT_REMAP
> >
> > riscv defconfig + CONFIG_NONPORTABLE=y + CONFIG_ARCH_R9A07G043=y:
> >
> > WARNING: unmet direct dependencies detected for DMA_GLOBAL_POOL
> >   Depends on [n]: !ARCH_HAS_DMA_SET_UNCACHED [=n] && !DMA_DIRECT_REMAP [=y]
> >   Selected by [y]:
> >   - ARCH_R9A07G043 [=y] && SOC_RENESAS [=y] && RISCV [=y] && NONPORTABLE [=y]
>
> And that's exactly what this patch is supposed to show.  RISCV must not
> select DMA_DIRECT_REMAP at the same time as DMA_GLOBAL_POOL.  I though
> the fix for that just went upstream?

The fix you are referring too is probably commit c1ec4b450ab729e3
("soc: renesas: Make ARCH_R9A07G043 (riscv version) depend
on NONPORTABLE") in next-20231006 and later.  It is not yet upstream.

Still, it merely makes ARCH_R9A07G043 (which selects DMA_GLOBAL_POOL)
depend on ARCH_R9A07G043.
RISCV_DMA_NONCOHERENT still selects DMA_DIRECT_REMAP, so both can end
up being enabled.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
