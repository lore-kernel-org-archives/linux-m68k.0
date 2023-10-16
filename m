Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CA2ECDB465
	for <linux-m68k@archiver.kernel.org>; Mon, 16 Oct 2023 15:41:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232660AbjJPPlt (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 16 Oct 2023 11:41:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232244AbjJPPls (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 16 Oct 2023 11:41:48 -0400
Received: from mail-vk1-xa32.google.com (mail-vk1-xa32.google.com [IPv6:2607:f8b0:4864:20::a32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2B39D9
        for <linux-m68k@lists.linux-m68k.org>; Mon, 16 Oct 2023 08:41:46 -0700 (PDT)
Received: by mail-vk1-xa32.google.com with SMTP id 71dfb90a1353d-4a8158e8613so499107e0c.3
        for <linux-m68k@lists.linux-m68k.org>; Mon, 16 Oct 2023 08:41:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697470906; x=1698075706; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jy2a+mH7vHRMC2bqIVFdXE4pfKJ8ZD9dY9NH9f8mIfg=;
        b=U8tKp/uiKCQ4/6OSp3xfWYRRFLd/rP+C8yPaEStZuIj0ZsAreNtH+vWkKx2uQyHXs6
         COc69gnFnkBdbuS9as4VSowWgTMobdeYio8y6OocKDjZymyl9TAS8YjyXsfvEDlpeBRC
         rMPT2iwoniYdadfQFMxVraLB2piM4qjNGcjwMkfDa1OXX6kMKyDje1mw2rdy+wIG1IQa
         fhqZKfBCyBIAVuQM5KDdddZvuPE5+MepCOF3HM2rTIUD1nsDGi78H/iLqzv+2VlEMM5Y
         ggP47NC9ahqkG+vt+WXaV+9Qp1tsTlDKDrJ09qgfwNd/IV+2mZw572oX1h/4A09mj/EL
         LuaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697470906; x=1698075706;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jy2a+mH7vHRMC2bqIVFdXE4pfKJ8ZD9dY9NH9f8mIfg=;
        b=d63ydjuaauDBzhU5d1Y7s9zeCkAE+qxA1kNhPlE4y+iA+0RomWD8zxsEFBSWUNe/PV
         xBmafwmF2MhPFHbUYPrqtZWi6gHwjS7rRQyPD3bqShYARLf3HAs2g7Ie6tR+NzFPVTAD
         cqbMGxet1UmszjuDOq3luxAnFMvjkuYYmv+zUlTilOIlu98cYDJKOyZhL2SSxuJ2HfIo
         6SqFv1tyJHTBeIlFwYmM658JryK0FioOKXUFXldLCsP1HM2uciefqsntnVBHbZiChfOp
         TsfHDeT4CJ0EraupuuLNN2rS/3S35BJgfliUHdOQx3A+QEs+0WrbgBYtTyLuFVfJc7S1
         DRww==
X-Gm-Message-State: AOJu0YySFV5ZOIQzscOpIGhcG3yVZwXajbNBAOYWjW7PEhjr8jsu16rc
        L7juPQ6dV24cYwK5TPi6qHkPCv3zMpOrjS7Qs88=
X-Google-Smtp-Source: AGHT+IGux325FOhiB0DGfuNAaDcad8gGCTORm2m4I3eBqk5dFYW6m/Pa7EpUDnkf3lePkwaOdU4GJYHkEbhbyUtux/E=
X-Received: by 2002:a1f:ed41:0:b0:495:dcd0:471 with SMTP id
 l62-20020a1fed41000000b00495dcd00471mr28745613vkh.5.1697470905828; Mon, 16
 Oct 2023 08:41:45 -0700 (PDT)
MIME-Version: 1.0
References: <20231016054755.915155-1-hch@lst.de> <20231016054755.915155-4-hch@lst.de>
In-Reply-To: <20231016054755.915155-4-hch@lst.de>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Mon, 16 Oct 2023 16:40:29 +0100
Message-ID: <CA+V-a8sdZa8TiTsjY+u3rywFsXY2yKmZ0vWg900NMxVc_NRX7Q@mail.gmail.com>
Subject: Re: [PATCH 03/12] soc: renesas: ARCH_R9A07G043 depends on !RISCV_ISA_ZICBOM
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
> ARCH_R9A07G043 has it's own non-standard global pool based DMA coherent
> allocator, which conflicts with the remap based RISCV_ISA_ZICBOM version.
> Add a proper dependency.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/soc/renesas/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
> index 880c544bb2dfda..f1696d3b5018d0 100644
> --- a/drivers/soc/renesas/Kconfig
> +++ b/drivers/soc/renesas/Kconfig
> @@ -334,6 +334,7 @@ if RISCV
>  config ARCH_R9A07G043
>         bool "RISC-V Platform support for RZ/Five"
>         depends on NONPORTABLE
> +       depends on !RISCV_ISA_ZICBOM
>         select ARCH_RZG2L
>         select AX45MP_L2_CACHE
>         select DMA_GLOBAL_POOL
> --
> 2.39.2
>
