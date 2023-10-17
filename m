Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98935CDB474
	for <linux-m68k@archiver.kernel.org>; Tue, 17 Oct 2023 08:20:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234571AbjJQIUw convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 17 Oct 2023 04:20:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232134AbjJQIUw (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 17 Oct 2023 04:20:52 -0400
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B0C993
        for <linux-m68k@lists.linux-m68k.org>; Tue, 17 Oct 2023 01:20:50 -0700 (PDT)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-5a8ada42c2aso630387b3.3
        for <linux-m68k@lists.linux-m68k.org>; Tue, 17 Oct 2023 01:20:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697530849; x=1698135649;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CdUY7Js3MyY72r3pkukYQuEPFyg4hUCkNQ1ukw9r4To=;
        b=Fypih95dlU4pKscxFiL/Sws7jblsPxmg4DLMGlxgAO2JZ2Lj8efolnuprfj5z0fI3g
         7RMi6E2/q4Qz65E4bAqDGkThJ0SOSgzAJU87/vu0zEenO41xAKjm031zSPVKLuUs+0W3
         kKS7DfsjZMVUVE7C9Zcqdw7j9rFAskhJ2ofCQtQHu2qlPOH5sRlOOsnvGNEUozgPkQBJ
         crBM4c/y/qDe7TK5F0wcOL9QFPJcIkLZxkXSJasdZz56bOH/1MRtGX2KUjxA0YMgtJgT
         6VbjENn77Rj/BHRHqIj7qDfcmHOzRjpLlNbkPwZ3xZR6TIMPM8bDYT8d4Ml3LlLT0MXi
         j46Q==
X-Gm-Message-State: AOJu0Yy6giBaHZQUoQSCv5C7p5GIfRO7YqHcTdsueOoboHdcU3a4EiKp
        FlMkWkY0PbW3lf1Ahr3ulkCPUXviLx0Jvw==
X-Google-Smtp-Source: AGHT+IHA+8qZxutgOXlN4GwaeSztapw2rMpWKLadH7XgVgX6np1GIrhp1dNK62WgmAK7UIrRVy2wWg==
X-Received: by 2002:a81:490f:0:b0:5a8:1aa0:6253 with SMTP id w15-20020a81490f000000b005a81aa06253mr1592691ywa.7.1697530849672;
        Tue, 17 Oct 2023 01:20:49 -0700 (PDT)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com. [209.85.128.173])
        by smtp.gmail.com with ESMTPSA id w201-20020a8149d2000000b005845e6f9b50sm427032ywa.113.2023.10.17.01.20.47
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Oct 2023 01:20:47 -0700 (PDT)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-5a7d9d357faso68247137b3.0
        for <linux-m68k@lists.linux-m68k.org>; Tue, 17 Oct 2023 01:20:47 -0700 (PDT)
X-Received: by 2002:a81:ab41:0:b0:59f:4dcd:227e with SMTP id
 d1-20020a81ab41000000b0059f4dcd227emr1543078ywk.37.1697530847545; Tue, 17 Oct
 2023 01:20:47 -0700 (PDT)
MIME-Version: 1.0
References: <20231016054755.915155-1-hch@lst.de> <20231016054755.915155-5-hch@lst.de>
In-Reply-To: <20231016054755.915155-5-hch@lst.de>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 17 Oct 2023 10:20:35 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW=Rp8+fcGrZ5fbVDyEZgVMGH_YHMxSTBdHB+zNxw4bxA@mail.gmail.com>
Message-ID: <CAMuHMdW=Rp8+fcGrZ5fbVDyEZgVMGH_YHMxSTBdHB+zNxw4bxA@mail.gmail.com>
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

On Mon, Oct 16, 2023 at 7:48 AM Christoph Hellwig <hch@lst.de> wrote:
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
>         select ERRATA_ANDES if RISCV_SBI
>         select ERRATA_ANDES_CMO if ERRATA_ANDES

With proper sort order, and rebased to soc/for-next:
Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
