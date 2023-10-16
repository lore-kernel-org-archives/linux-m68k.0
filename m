Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 587A5CDB465
	for <linux-m68k@archiver.kernel.org>; Mon, 16 Oct 2023 15:41:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233659AbjJPPlB (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 16 Oct 2023 11:41:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232244AbjJPPlA (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 16 Oct 2023 11:41:00 -0400
Received: from mail-vk1-xa35.google.com (mail-vk1-xa35.google.com [IPv6:2607:f8b0:4864:20::a35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15462AC
        for <linux-m68k@lists.linux-m68k.org>; Mon, 16 Oct 2023 08:40:59 -0700 (PDT)
Received: by mail-vk1-xa35.google.com with SMTP id 71dfb90a1353d-49369d29be3so1962986e0c.3
        for <linux-m68k@lists.linux-m68k.org>; Mon, 16 Oct 2023 08:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697470858; x=1698075658; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6JyrPV6/isChg/aWoV8Vdox7jNb/LeSH8h9ZE9RQZ4k=;
        b=FIJZeqK2rpEEd85RKlQxj51B9NXKcuhNUUgDShJyOYFAdyuXfXnJlv3kb8qBcyBFxH
         oCkz6TZJ02bWdUh7CGPVzRXLI5HKX+j8dT8J5NGi2KxxphYN53aFGMv35KNFgWW4obII
         HzwMzZdTlJwRUFsNz02RE6UTM3C4tNRnv6ZECc+Cd1GL5cFSIALpqEb3crGKC6mDOPYm
         /xMX2BTQS+IuN6iGMRZO3fDCdQP9Sm+ppYfN1t848ZIonJJgi9lTx/a4BRdgArRE9Fvo
         KG6cKYDuWi8KYgRFw2jpIn1wd8qR1UvFzrFjPLni6VE2MCcI+ggZMxR6nMAj/ztlLDOx
         4LcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697470858; x=1698075658;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6JyrPV6/isChg/aWoV8Vdox7jNb/LeSH8h9ZE9RQZ4k=;
        b=FrBhIW1ne9pkRBDlYTAgo/j/tNwDAkaH0SfAZupNsZUW2ik4LWIRbpN3oeBG3Q8amE
         9GNQH12ftxwjhGUGGMZJthn+MZyF9mhxcI0KGlYrYpGBkgX3WpJjFhQs8LRU8grp9YEX
         7x/OhMK2XwH+rm0+r1cSoUaa6UIYs83PNows5M13F6ev/N29+tSnKQvrNWLQslhf6SzI
         YYdO+2D6QBGYbTq2PmGLwtmgmgUd3jsrJwXEgyrxTih+wS9DvwXUocDQO4OICy9JJ+3J
         In5dklK3njbc40z8cNIegu3aRqRW9H98N+8RTptkdES2OsdLcvVNPwZQMVt0iRaskc1K
         dv6w==
X-Gm-Message-State: AOJu0YySaue3F/f/SDFhzyDs3KfaXvtc8WTFIU7sEDgJwnBf+pwr2t6x
        WH52NTJmJlSEYsgRSJ6qyfomVcqrOLcMMLIJVC0=
X-Google-Smtp-Source: AGHT+IEUS6diCI0qP0NzRCHHthfHGe1z+pXjLCt2SKZVkH+NQW/kPzzEZY2133jtIGuI9wooUY358mw8Vy0zXSvuQs4=
X-Received: by 2002:a1f:4ec4:0:b0:4a4:887:514c with SMTP id
 c187-20020a1f4ec4000000b004a40887514cmr8133579vkb.6.1697470858089; Mon, 16
 Oct 2023 08:40:58 -0700 (PDT)
MIME-Version: 1.0
References: <20231016054755.915155-1-hch@lst.de> <20231016054755.915155-3-hch@lst.de>
In-Reply-To: <20231016054755.915155-3-hch@lst.de>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Mon, 16 Oct 2023 16:39:40 +0100
Message-ID: <CA+V-a8va9W7Gpgr22RcPHL=fJvbViMjrpUfqKekcQ+rSZeYebw@mail.gmail.com>
Subject: Re: [PATCH 02/12] riscv: only select DMA_DIRECT_REMAP from RISCV_ISA_ZICBOM
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
> RISCV_DMA_NONCOHERENT is also used for whacky non-standard
> non-coherent ops that use different hooks in dma-direct.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  arch/riscv/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 0ac0b538379718..9c48fecc671918 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -273,7 +273,6 @@ config RISCV_DMA_NONCOHERENT
>         select ARCH_HAS_SYNC_DMA_FOR_CPU
>         select ARCH_HAS_SYNC_DMA_FOR_DEVICE
>         select DMA_BOUNCE_UNALIGNED_KMALLOC if SWIOTLB
> -       select DMA_DIRECT_REMAP if MMU
>
>  config RISCV_NONSTANDARD_CACHE_OPS
>         bool
> @@ -549,6 +548,7 @@ config RISCV_ISA_ZICBOM
>         depends on RISCV_ALTERNATIVE
>         default y
>         select RISCV_DMA_NONCOHERENT
> +       select DMA_DIRECT_REMAP
>         help
>            Adds support to dynamically detect the presence of the ZICBOM
>            extension (Cache Block Management Operations) and enable its
> --
> 2.39.2
>
