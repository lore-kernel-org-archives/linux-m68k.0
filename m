Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5203CDB465
	for <linux-m68k@archiver.kernel.org>; Mon, 16 Oct 2023 15:46:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232310AbjJPPqA (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 16 Oct 2023 11:46:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232365AbjJPPp7 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 16 Oct 2023 11:45:59 -0400
Received: from mail-ua1-x92e.google.com (mail-ua1-x92e.google.com [IPv6:2607:f8b0:4864:20::92e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CC82F3
        for <linux-m68k@lists.linux-m68k.org>; Mon, 16 Oct 2023 08:45:57 -0700 (PDT)
Received: by mail-ua1-x92e.google.com with SMTP id a1e0cc1a2514c-7ae1a075fc5so1913169241.3
        for <linux-m68k@lists.linux-m68k.org>; Mon, 16 Oct 2023 08:45:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697471156; x=1698075956; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Be+JqDvKcVfoZO+fdW/6Y7p5xoTP2t1qbUjOd8UWjBU=;
        b=QKrGqV9t4kuRlzSxKNq/acrLt79f9DO+7JP8Il4w4UbQsdamIzD8czbRY0e7H5+f+8
         jlcEwbecRhf2le/vWnNf2T7FP87YxNZVvXxzaGDHTM34dQ7cqBzB5wNwjYQuf5QEFlGw
         ByT55j8dbPVZWIuKiBkZEd01SmeoJSGB4dFkrXCkgyClaw28HI0a32UWIPz0EoqlDTKI
         yjwrAatdKLi20qVdyZkK8UnXObZRhq6pmhaPFqBogS03cZhl9kO5x4MrOL5W7L9kX3oo
         Ir67LJxOO2sl9l7VCa8BH9QSUH4SDwF6+uOp0ydxYTikr3YY8K4TYCPegPdISZH0o3IG
         Xlpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697471156; x=1698075956;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Be+JqDvKcVfoZO+fdW/6Y7p5xoTP2t1qbUjOd8UWjBU=;
        b=LiK5KOXR1JZj/s/szkYz0y656LzvzJTnySEq+sIaxaMVnBuLmrYfRj09Gtzr7FUTlC
         POZdcF2wnsmW3W/omMKEipNsMOr9WPhi2PjsnkUNTB1mOsjKc/0hsyoWlZ0j5CYyGTWF
         IBoKdyF/OAr5oy4MX44bSrKPzK65et+3IIsGR8TQeamCuZcfoJ+Ck02T4QsK8cegZpo1
         WRSc/NXuchbudLfZqngZuTNYP0i15o2a/0oEGdLbYMLovYCUiM2uB1P8iy2vx5fc7gqI
         zOXCODUt/gGEmwejlXLTpgBDoP3vrOmz0+5cp3Wg4fKuSawEtP/ktiuApOntTuw8eKGZ
         s0eg==
X-Gm-Message-State: AOJu0YxcIHCUjYLv+VFJwl5PdFxkZd4YQIbz/7K05YmDANoO/UT09iq0
        UE5WSRpSqvCVNdYxQnktL7GjzU774qFa8eFj+rg=
X-Google-Smtp-Source: AGHT+IGv1onTQjqVJotgyiMblBPHjo7A5lICsP21th4oYCrXg7fMKsA2HIivTnjBub3qHrxO15iu+5gAK0C1u+4Pm/Y=
X-Received: by 2002:a1f:e641:0:b0:48f:8891:29d9 with SMTP id
 d62-20020a1fe641000000b0048f889129d9mr27437782vkh.13.1697471156012; Mon, 16
 Oct 2023 08:45:56 -0700 (PDT)
MIME-Version: 1.0
References: <20231016054755.915155-1-hch@lst.de> <20231016054755.915155-6-hch@lst.de>
In-Reply-To: <20231016054755.915155-6-hch@lst.de>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Mon, 16 Oct 2023 16:44:39 +0100
Message-ID: <CA+V-a8vfYb-OBZMMXx7vwtZ4b9V7iep3CzPw5FVmvespF8OPqw@mail.gmail.com>
Subject: Re: [PATCH 05/12] dma-direct: add depdenencies to CONFIG_DMA_GLOBAL_POOL
To:     Christoph Hellwig <hch@lst.de>
Cc:     Greg Ungerer <gerg@linux-m68k.org>, iommu@lists.linux.dev,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Conor Dooley <conor@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Wei Fang <wei.fang@nxp.com>,
        Shenwei Wang <shenwei.wang@nxp.com>,
        Clark Wang <xiaoning.wang@nxp.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-m68k@lists.linux-m68k.org, netdev@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
        Jim Quinlan <james.quinlan@broadcom.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Mon, Oct 16, 2023 at 6:48=E2=80=AFAM Christoph Hellwig <hch@lst.de> wrot=
e:
>
> CONFIG_DMA_GLOBAL_POOL can't be combined with other DMA coherent
> allocators.  Add dependencies to Kconfig to document this, and make
> kconfig complain about unment dependencies if someone tries.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  kernel/dma/Kconfig | 2 ++
>  1 file changed, 2 insertions(+)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/kernel/dma/Kconfig b/kernel/dma/Kconfig
> index f488997b071712..4524db877eba36 100644
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
> --
> 2.39.2
>
