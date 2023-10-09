Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEB32E95A8E
	for <linux-m68k@archiver.kernel.org>; Mon,  9 Oct 2023 08:44:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345480AbjJIIoN convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 9 Oct 2023 04:44:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345488AbjJIIoM (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 9 Oct 2023 04:44:12 -0400
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55625D6
        for <linux-m68k@lists.linux-m68k.org>; Mon,  9 Oct 2023 01:44:11 -0700 (PDT)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-5a24b03e22eso51936157b3.0
        for <linux-m68k@lists.linux-m68k.org>; Mon, 09 Oct 2023 01:44:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696841050; x=1697445850;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dqNLFjHn3fj/AL0iMyf/yawddLiaq23Wu30A3Gzqckk=;
        b=saMXfSK8XNYvYumZysA+yCBYm+nM+CrJsZolmessMRwe/ylooa9bloumwh6Ci0BY6x
         GVXi9nUIpsqggli6upy0usw6jjyxt813aahXVqFMMMJ2D5MeJxmS9L1p0h2pPLsGRPxm
         8wvSv+GvTodMxfezV5rdVzAaY13J4VIz0A+wzgYXjxQQqStNfOoLm6xbb6ymOIt2F5iM
         YSescIMEb4Vyr4RnasxVKv9LgcN3aKfZdeWugoIjQj6gXOJ04M+eQnQ+A1gr4RDxz00O
         cM83df2GZl3grteMaEkzfuLwxFi3sIWduPOKT2dJllfjc25zRyzupmGwQPqfSCvl/15g
         f5ag==
X-Gm-Message-State: AOJu0YxI6kdkRSbONMiJrv7/HT10V7HafEV3MzXXr+4/wHRsPocTExA/
        XO9thCPjfx+dF7n7zLLkRXLS2Rg8CVjKgQ==
X-Google-Smtp-Source: AGHT+IFlkvWvLRlmSRuxiZxFjLiXJe0PHZoERg/MPQx6e5Mxkc2UUXJYg4KmTc79dHhIAuPCBsxRtA==
X-Received: by 2002:a05:690c:3006:b0:5a5:65f:b2d with SMTP id ey6-20020a05690c300600b005a5065f0b2dmr12239941ywb.38.1696841050222;
        Mon, 09 Oct 2023 01:44:10 -0700 (PDT)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com. [209.85.128.178])
        by smtp.gmail.com with ESMTPSA id e123-20020a0dc281000000b00589a1dc0809sm3553001ywd.120.2023.10.09.01.44.09
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Oct 2023 01:44:09 -0700 (PDT)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-5a24b03e22eso51935967b3.0
        for <linux-m68k@lists.linux-m68k.org>; Mon, 09 Oct 2023 01:44:09 -0700 (PDT)
X-Received: by 2002:a0d:d808:0:b0:59b:d796:2a55 with SMTP id
 a8-20020a0dd808000000b0059bd7962a55mr17521321ywe.1.1696841049412; Mon, 09 Oct
 2023 01:44:09 -0700 (PDT)
MIME-Version: 1.0
References: <20231009074121.219686-1-hch@lst.de> <20231009074121.219686-2-hch@lst.de>
In-Reply-To: <20231009074121.219686-2-hch@lst.de>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 9 Oct 2023 10:43:57 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWiYDQ5J7R7hPaVAYgXqJvpjdksoF6X-zHrJ_80Ly4XfQ@mail.gmail.com>
Message-ID: <CAMuHMdWiYDQ5J7R7hPaVAYgXqJvpjdksoF6X-zHrJ_80Ly4XfQ@mail.gmail.com>
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

On Mon, Oct 9, 2023 at 9:41 AM Christoph Hellwig <hch@lst.de> wrote:
> CONFIG_DMA_GLOBAL_POOL can't be combined with other dma-coherent
> allocators.  Add dependencies to Kconfig to document this, and make
> kconfig complain about unment dependencies if someone tries.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Thanks for your patch!

> --- a/kernel/dma/Kconfig
> +++ b/kernel/dma/Kconfig
> @@ -135,6 +135,8 @@ config DMA_COHERENT_POOL
>
>  config DMA_GLOBAL_POOL
>         select DMA_DECLARE_COHERENT
> +       depends on !ARCH_HAS_DMA_SET_UNCACHED
> +       depends on !DMA_DIRECT_REMAP
>         bool
>
>  config DMA_DIRECT_REMAP

riscv defconfig + CONFIG_NONPORTABLE=y + CONFIG_ARCH_R9A07G043=y:

WARNING: unmet direct dependencies detected for DMA_GLOBAL_POOL
  Depends on [n]: !ARCH_HAS_DMA_SET_UNCACHED [=n] && !DMA_DIRECT_REMAP [=y]
  Selected by [y]:
  - ARCH_R9A07G043 [=y] && SOC_RENESAS [=y] && RISCV [=y] && NONPORTABLE [=y]

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
