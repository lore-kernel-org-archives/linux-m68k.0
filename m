Return-Path: <SRS0=9X71=BN=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 624FBC433DF
	for <linux-m68k@archiver.kernel.org>; Mon,  3 Aug 2020 18:25:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F258622B4E
	for <linux-m68k@archiver.kernel.org>; Mon,  3 Aug 2020 18:25:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=timesys-com.20150623.gappssmtp.com header.i=@timesys-com.20150623.gappssmtp.com header.b="tRaMMEvc"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727078AbgHCSZN (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 3 Aug 2020 14:25:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726130AbgHCSZN (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Mon, 3 Aug 2020 14:25:13 -0400
Received: from mail-vk1-xa41.google.com (mail-vk1-xa41.google.com [IPv6:2607:f8b0:4864:20::a41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEB61C06174A
        for <linux-m68k@vger.kernel.org>; Mon,  3 Aug 2020 11:25:12 -0700 (PDT)
Received: by mail-vk1-xa41.google.com with SMTP id m12so313424vko.5
        for <linux-m68k@vger.kernel.org>; Mon, 03 Aug 2020 11:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=timesys-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Cqlh4aT2HCODPWQ/yvZltUCSAbxgwRi3iyO3N/2NEyQ=;
        b=tRaMMEvcE/T5a2YRQxHS4ubU18WBm9E37NDV9PJIbBxrjpm1nrucyovn5NTlp0089v
         rRl+tCgK63D+Sb2aTfk6fN4kMbZqvtJchGQcdprMDB5qQ9O8pcvKuzUKn/VEs+HnZLum
         nzo1AiVhIo5RnVxoSyok6MFf3tYc2OL1FDo7EDQbV4eAUJIBIwfOSBfnB6omT3HR9CKJ
         zA1Jb4i8e4g+ToclkVckDWF2Ke3LlJHOu/sCdK04Y/MGnPNQM452OBpfQeVEBtaS92hr
         T6nnWp2atXRhiUGy+KsiP8IeHdUaFS2N6A8POkShKZgUI6i0pj5fHrnQDwoJpt2IcYmd
         Y36A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Cqlh4aT2HCODPWQ/yvZltUCSAbxgwRi3iyO3N/2NEyQ=;
        b=squg4HemsO74P6Q21QD1i7fY6m+3UXFGbjnOUyAEmB+hFmWSPoQ7NVe8gZRAg0ikgA
         mO48+FaWbCmkjbfNO9HBXpluY4vXDFMcKt/MTu0Huwh9OYEqJ//+4uYwWwBw3qHXqRqD
         jSODE7hgH8WRx0okyPV6bnE8ILQZRtAyTDIblW60xUEhCBPcP2Ngo3WffcxIk8k/1f27
         89VLjUM3SCjf+2NvgMj2VCRSP9KH7R5uhvOs9ngjbKNzBAs+Btt7bZWFhqODQfEgwzdE
         2flQTLLOaoKTrb5vlIBBLcw5f6nh1+14R/9oisfKTVdoQyYtz4r78oddHjoiRv15L5Up
         Irtw==
X-Gm-Message-State: AOAM531O+fTwrjrLeRQtQ8WyS5M8NdyK5wfqmlFFBskQyQGzFTVmk238
        qHCmfHyAQf96+9pI40kkS0TnvlMGfatSQDd6Uvuh37rT
X-Google-Smtp-Source: ABdhPJyGzjsA6w2g/alA+Cjo/v1cHl9Vr1jCbtNXARv1G/OKCk5lh7r0dZz055+jfzy8vRPv+bpVwfhYld91GWXMLEY=
X-Received: by 2002:a1f:5986:: with SMTP id n128mr12349592vkb.93.1596479112046;
 Mon, 03 Aug 2020 11:25:12 -0700 (PDT)
MIME-Version: 1.0
References: <20200803182803.193998-1-angelo.dureghello@timesys.com>
In-Reply-To: <20200803182803.193998-1-angelo.dureghello@timesys.com>
From:   Angelo Dureghello <angelo.dureghello@timesys.com>
Date:   Mon, 3 Aug 2020 20:32:58 +0200
Message-ID: <CALJHbkB+U430LafZ2htODRd-czebu+0xURcN+wtJV3tEfQXZPQ@mail.gmail.com>
Subject: Re: [PATCH] m68k: stmark2: enable edma support for dspi
To:     Greg Ungerer <gerg@linux-m68k.org>
Cc:     "Linux/m68k" <linux-m68k@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Greg,

just realized i double-posted this patch.
You already added it to for-next, so please discard this patch.

Thanks,
angelo


On Mon, Aug 3, 2020 at 8:19 PM Angelo Dureghello
<angelo.dureghello@timesys.com> wrote:
>
> Enable dspi edma support for stmark2.
>
> Signed-off-by: Angelo Dureghello <angelo.dureghello@timesys.com>
> ---
>  arch/m68k/coldfire/stmark2.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/arch/m68k/coldfire/stmark2.c b/arch/m68k/coldfire/stmark2.c
> index a8d2b3d172f9..8b5af9c83244 100644
> --- a/arch/m68k/coldfire/stmark2.c
> +++ b/arch/m68k/coldfire/stmark2.c
> @@ -13,6 +13,7 @@
>  #include <linux/spi/spi.h>
>  #include <linux/spi/spi-fsl-dspi.h>
>  #include <linux/spi/flash.h>
> +#include <linux/dma-mapping.h>
>  #include <asm/mcfsim.h>
>
>  /*
> @@ -78,6 +79,8 @@ static struct resource dspi_spi0_resource[] = {
>         },
>  };
>
> +static u64 stmark2_dspi_mask = DMA_BIT_MASK(32);
> +
>  /* SPI controller, id = bus number */
>  static struct platform_device dspi_spi0_device = {
>         .name = "fsl-dspi",
> @@ -86,6 +89,8 @@ static struct platform_device dspi_spi0_device = {
>         .resource = dspi_spi0_resource,
>         .dev = {
>                 .platform_data = &dspi_spi0_info,
> +               .dma_mask = &stmark2_dspi_mask,
> +               .coherent_dma_mask = DMA_BIT_MASK(32),
>         },
>  };
>
> --
> 2.28.0
>


-- 
Angelo Dureghello
Timesys
e. angelo.dureghello@timesys.com
