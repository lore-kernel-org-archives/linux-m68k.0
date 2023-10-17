Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1815ACDB474
	for <linux-m68k@archiver.kernel.org>; Tue, 17 Oct 2023 08:43:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234620AbjJQInh convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 17 Oct 2023 04:43:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234679AbjJQIne (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 17 Oct 2023 04:43:34 -0400
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9406B110
        for <linux-m68k@lists.linux-m68k.org>; Tue, 17 Oct 2023 01:43:32 -0700 (PDT)
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-d9beb863816so2021527276.1
        for <linux-m68k@lists.linux-m68k.org>; Tue, 17 Oct 2023 01:43:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697532211; x=1698137011;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iF8pGgwx9ER+JexQPULvEbdhCYC/MDFSezGeWG3jTqw=;
        b=AICoBIBrz4p+8wBJC4aHtZfbMjIgT5mxTbX3YLsg3ePtfEGrTN5YdLfOGf+k9TfjV1
         Q7XLZHHqrRvFp5hyaG/TX31am9IhUw/OYnxZ35S44JIF/K7qsrob/C1mterN0wWQCHAS
         y1+W0UplGxpEDenfpXY5RKYSUMcqUMrH8Vz5zAW7fYkc36meT6v0HzxushvahKg4UWKH
         2CUgfxID60WXO+Ag8A4dSKBEKk7hJXBrvk/ureuMV5Z9ZuZPeRthEVSODbXzmcGduCL3
         HY3UFtTGvZpPqPuJCp02Ounvn0DuwV+cobkOFh9KIgmw03+A7+lnolgUcd0SMBpwvCZI
         Rohg==
X-Gm-Message-State: AOJu0YzwHtGMoXmwNW/Ea7yKZTjMzwrtQWevgbXC/A2GDu1uA3FZvpn+
        464iordmnWxbTLJV2MFeuhPse9zGE1b4FQ==
X-Google-Smtp-Source: AGHT+IFUwpv7hfjMwi+NIGjbazo5pcjH6mng73MBvz/zXdlid1qOwiwSz0OeOPVs9x414dwJL/+Q3Q==
X-Received: by 2002:a25:4201:0:b0:d91:6d2e:6f17 with SMTP id p1-20020a254201000000b00d916d2e6f17mr1497663yba.54.1697532211535;
        Tue, 17 Oct 2023 01:43:31 -0700 (PDT)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com. [209.85.128.176])
        by smtp.gmail.com with ESMTPSA id 5-20020a250905000000b00d9b33e0b952sm356653ybj.8.2023.10.17.01.43.31
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Oct 2023 01:43:31 -0700 (PDT)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-579de633419so66667347b3.3
        for <linux-m68k@lists.linux-m68k.org>; Tue, 17 Oct 2023 01:43:31 -0700 (PDT)
X-Received: by 2002:a0d:f786:0:b0:583:a3ab:b950 with SMTP id
 h128-20020a0df786000000b00583a3abb950mr1213954ywf.50.1697532211155; Tue, 17
 Oct 2023 01:43:31 -0700 (PDT)
MIME-Version: 1.0
References: <20231016054755.915155-1-hch@lst.de> <20231016054755.915155-11-hch@lst.de>
In-Reply-To: <20231016054755.915155-11-hch@lst.de>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 17 Oct 2023 10:43:19 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXonOxTT7OuTtmyYR346F569aQE0ErhAx8qfsGxWUp+Sg@mail.gmail.com>
Message-ID: <CAMuHMdXonOxTT7OuTtmyYR346F569aQE0ErhAx8qfsGxWUp+Sg@mail.gmail.com>
Subject: Re: [PATCH 10/12] net: fec: use dma_alloc_noncoherent for data cache
 enabled coldfire
To:     Christoph Hellwig <hch@lst.de>
Cc:     Greg Ungerer <gerg@linux-m68k.org>, iommu@lists.linux.dev,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Conor Dooley <conor@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Wei Fang <wei.fang@nxp.com>,
        Shenwei Wang <shenwei.wang@nxp.com>,
        Clark Wang <xiaoning.wang@nxp.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-m68k@lists.linux-m68k.org, netdev@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
        Jim Quinlan <james.quinlan@broadcom.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Christoph,

On Mon, Oct 16, 2023 at 7:48 AM Christoph Hellwig <hch@lst.de> wrote:
> Coldfire platforms with data caches can't properly implement
> dma_alloc_coherent and currently just return noncoherent memory from
> dma_alloc_coherent.
>
> The fec driver than works around this with a flush of all caches in the
> receive path. Make this hack a little less bad by using the explicit
> dma_alloc_noncoherent API and documenting the hacky cache flushes so
> that the DMA API level hack can be removed.
>
> Also replace the check for CONFIG_M532x for said hack with a check
> for COLDFIRE && !COLDFIRE_COHERENT_DMA.  While m532x is the only such
> platform with a fec module, this makes the code more consistent and
> easier to follow.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Thanks for your patch!

> --- a/drivers/net/ethernet/freescale/fec_main.c
> +++ b/drivers/net/ethernet/freescale/fec_main.c
> @@ -406,6 +406,70 @@ static void fec_dump(struct net_device *ndev)
>         } while (bdp != txq->bd.base);
>  }
>
> +/*
> + * Coldfire does not support DMA coherent allocations, and has historically used
> + * a band-aid with a manual flush in fec_enet_rx_queue.
> + */
> +#if defined(CONFIG_COLDFIRE) && !defined(CONFIG_COLDFIRE_COHERENT_DMA)
> +static void *fec_dma_alloc(struct device *dev, size_t size, dma_addr_t *handle,
> +               gfp_t gfp)
> +{
> +       return dma_alloc_noncoherent(dev, size, handle, DMA_BIDIRECTIONAL, gfp);
> +}
> +
> +static void fec_dma_free(struct device *dev, size_t size, void *cpu_addr,
> +               dma_addr_t handle)
> +{
> +       dma_free_noncoherent(dev, size, cpu_addr, handle, DMA_BIDIRECTIONAL);
> +}
> +#else /* CONFIG_COLDFIRE && !CONFIG_COLDFIRE_COHERENT_DMA */

!CONFIG_COLDFIRE || CONFIG_COLDFIRE_COHERENT_DMA

> +static void *fec_dma_alloc(struct device *dev, size_t size, dma_addr_t *handle,
> +               gfp_t gfp)
> +{
> +       return dma_alloc_coherent(dev, size, handle, gfp);
> +}
> +
> +static void fec_dma_free(struct device *dev, size_t size, void *cpu_addr,
> +               dma_addr_t handle)
> +{
> +       dma_free_coherent(dev, size, cpu_addr, handle);
> +}
> +#endif /* !CONFIG_COLDFIRE && !CONFIG_COLDFIRE_COHERENT_DMA */

!CONFIG_COLDFIRE || CONFIG_COLDFIRE_COHERENT_DMA

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
