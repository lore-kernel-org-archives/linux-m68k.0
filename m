Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1846CCDB465
	for <linux-m68k@archiver.kernel.org>; Mon, 16 Oct 2023 15:43:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233750AbjJPPns (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 16 Oct 2023 11:43:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233799AbjJPPnq (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 16 Oct 2023 11:43:46 -0400
Received: from mail-vk1-xa33.google.com (mail-vk1-xa33.google.com [IPv6:2607:f8b0:4864:20::a33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 000E5102
        for <linux-m68k@lists.linux-m68k.org>; Mon, 16 Oct 2023 08:43:44 -0700 (PDT)
Received: by mail-vk1-xa33.google.com with SMTP id 71dfb90a1353d-4a06fb5331bso1849980e0c.0
        for <linux-m68k@lists.linux-m68k.org>; Mon, 16 Oct 2023 08:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697471024; x=1698075824; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W5VhkbLijcsIjEPutw+pmedC1vRGyDo1Fb4EwWhkNwo=;
        b=JizgGQPZxXCKy+PshfjREU8Abegy4Dnx41WON6VEFHYNyBB6zukzNAjYmKHq2XBpUb
         Lc+fq18YJTwRVRUhdYrfrikzAlk/lwYNNsbBWS5JyMCwhCDOzFGyVaYTK21PC8BUurld
         QF0jfQofdI0NY8X2oOiKPLfqPayakIcBZ2U0BleW+TpFNQXLbQJhAebnWAueYm+gLiLL
         O3XFyyFPF9+1m9J46pM2b0ug+FGEJAKccFXi7IwckYvwS0pKZ9kmvp54QJH2d/9ni9x3
         B6vfCkhZZG8Q4wyNNp/QBnXtJIZJn+odvsvl0jz2xUBnfME+tdKUrGhrUQusNgqgJq0y
         HaMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697471024; x=1698075824;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W5VhkbLijcsIjEPutw+pmedC1vRGyDo1Fb4EwWhkNwo=;
        b=sIkapLP0wDpmMrRRgjugurOX922hzqv0Q5YnUzSxoRbZSXG3aIWvFTLiOlATgxZMI2
         3sOv8KsB8VCVHSwMYeiBxGDi+D3Kg7hv6ZPeoJBhjr0qk4UOi6ALfPMtuo3/dgjWxWBI
         X4sjQSXfzqT97nBrfyoyDWlHbs3nYMV1B69h+z2VxvocNEARrxWJMgf+Hw3Ofqw4fSDP
         yxJU7nlTwvd2bcnlb8ZXnBUEqGcx4fvllp7dIfOc55aBFZOSNY0q7W7nnFivmYrl/dcU
         11ynHgkLvJyEfYYXOzGYFNTPwCW2nea04gzEzWkgv23SYdNfFMjE1kFHDWrw8cZarxel
         WgLQ==
X-Gm-Message-State: AOJu0YzlrJadvdY89D0iFXakM6JGw++OfWJMO4WH0N9vT/5QfkXgDDqO
        UdaAq/ADqVxzm6ojhFlyrCBeW/0qkJzeWCn1l5M=
X-Google-Smtp-Source: AGHT+IG/WMjMrGYCGsuwhthBEKZ8VCVuxCi3PoeLoYHu5J1bxDK0qcF2TAbbJo60X/pGsL22e+tEj0vGdiYsm/MFMMM=
X-Received: by 2002:a1f:e404:0:b0:49a:1a56:945c with SMTP id
 b4-20020a1fe404000000b0049a1a56945cmr28517495vkh.13.1697471023853; Mon, 16
 Oct 2023 08:43:43 -0700 (PDT)
MIME-Version: 1.0
References: <20231016054755.915155-1-hch@lst.de> <20231016054755.915155-5-hch@lst.de>
In-Reply-To: <20231016054755.915155-5-hch@lst.de>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Mon, 16 Oct 2023 16:42:27 +0100
Message-ID: <CA+V-a8skxbuRkU9PKUZRkQkp-y0PKeYx4WhVcJtktAT-VEgmCA@mail.gmail.com>
Subject: Re: [PATCH 04/12] soc: renesas: select RISCV_DMA_NONCOHERENT from ARCH_R9A07G043
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
> Selecting DMA_GLOBAL_POOL without the rest of the non-coherent DMA
> infrastructure does not make sense.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/soc/renesas/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
> index f1696d3b5018d0..ea473b4150dfa8 100644
> --- a/drivers/soc/renesas/Kconfig
> +++ b/drivers/soc/renesas/Kconfig
> @@ -338,6 +338,7 @@ config ARCH_R9A07G043
>         select ARCH_RZG2L
>         select AX45MP_L2_CACHE
>         select DMA_GLOBAL_POOL
> +       select RISCV_DMA_NONCOHERENT
Can we keep this alphabetical sorted please, with that fixed:

Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

>         select ERRATA_ANDES if RISCV_SBI
>         select ERRATA_ANDES_CMO if ERRATA_ANDES
>
> --
> 2.39.2
>
