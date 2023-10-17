Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C12E0CDB483
	for <linux-m68k@archiver.kernel.org>; Tue, 17 Oct 2023 08:40:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234679AbjJQIku convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 17 Oct 2023 04:40:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234667AbjJQIkt (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 17 Oct 2023 04:40:49 -0400
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20612E8
        for <linux-m68k@lists.linux-m68k.org>; Tue, 17 Oct 2023 01:40:47 -0700 (PDT)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-5a7a80a96dbso54722467b3.0
        for <linux-m68k@lists.linux-m68k.org>; Tue, 17 Oct 2023 01:40:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697532046; x=1698136846;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KZlS/7U1efr6AK8aT2dfiOZNDdagRiOd/6FdP6Lb3EM=;
        b=uDLJTPskRO+l5Ti1uWutppMaN++rP87TFzNeFePo3cfMu8F6hKYNjCu9xpeWkkUvHW
         D2oUa06Mrjom6Op5nzLQVsyKyfHCwAj7kmFgxWlUgPyABA//ggis0hNe+qh7Wqgixxhx
         Uy3Rn3GbzzmKZpoZird5lyV7FGaJG82Wyq4NOnns1NPwWF+8bEeVwOkevyQq8LcMkqIV
         RU5D0YIco0kWERLNcygZCwHX3bvMPpZj0UF2Kpraq93WVeGiUV/6ccdZoaWUmFWwBKLI
         ovPsCn7Y07HxGJdwjBoQg5tpxVIi2GwCoE8jJxSTvp/hiSb6jw9BepnL8KD1CqEY9HMb
         gDUA==
X-Gm-Message-State: AOJu0Yx+Ry/FHSzfD6Dlhi5yt3WPsmZGGppTwphTLjrZ09/cNdiyz/o4
        zAbBJFpDd8msfrYuquQMxSMpDCrS3J7rGw==
X-Google-Smtp-Source: AGHT+IHpNfLCZQePBH5gnqD0IvZ2ycyUO+VVuzkc8XzZtnsdHubKSAff35XfCeIaf7gHr0VgqIKMlA==
X-Received: by 2002:a0d:eb96:0:b0:5a8:22f9:2510 with SMTP id u144-20020a0deb96000000b005a822f92510mr925413ywe.14.1697532046136;
        Tue, 17 Oct 2023 01:40:46 -0700 (PDT)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com. [209.85.128.182])
        by smtp.gmail.com with ESMTPSA id y74-20020a0dd64d000000b005a23ab90366sm443849ywd.11.2023.10.17.01.40.44
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Oct 2023 01:40:44 -0700 (PDT)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-59e88a28b98so46644717b3.1
        for <linux-m68k@lists.linux-m68k.org>; Tue, 17 Oct 2023 01:40:44 -0700 (PDT)
X-Received: by 2002:a0d:ca50:0:b0:5a7:ba02:9c9a with SMTP id
 m77-20020a0dca50000000b005a7ba029c9amr1017206ywd.2.1697532044608; Tue, 17 Oct
 2023 01:40:44 -0700 (PDT)
MIME-Version: 1.0
References: <20231016054755.915155-1-hch@lst.de> <20231016054755.915155-10-hch@lst.de>
In-Reply-To: <20231016054755.915155-10-hch@lst.de>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 17 Oct 2023 10:40:32 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVq0ihLthVQF-2v4_E=m7jdOZty8b69eizJyWoU+0CFCw@mail.gmail.com>
Message-ID: <CAMuHMdVq0ihLthVQF-2v4_E=m7jdOZty8b69eizJyWoU+0CFCw@mail.gmail.com>
Subject: Re: [PATCH 09/12] m68k: use the coherent DMA code for coldfire
 without data cache
To:     Christoph Hellwig <hch@lst.de>
Cc:     Greg Ungerer <gerg@linux-m68k.org>, iommu@lists.linux.dev,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Conor Dooley <conor@kernel.org>,
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
> Coldfire cores configured without a data cache are DMA coherent and
> should thus simply use the simple coherent version of dma-direct.
>
> Introduce a new COLDFIRE_COHERENT_DMA Kconfig symbol as a convenient
> short hand for such configurations, and a M68K_NONCOHERENT_DMA symbol
> for all cases where we need to build non-coherent DMA infrastructure
> to simplify the Kconfig and code conditionals.
>
> Not building the non-coherent DMA code slightly reduces the code
> size for such configurations.
>
> Numers for m5249evb_defconfig below:
>
>   text     data     bss     dec     hex filename
> 2896158  401052   65392 3362602  334f2a vmlinux.before
> 2895166  400988   65392 3361546  334b0a vmlinux.after
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>

The m68kclassic-with-MMU parts look fine to me, so
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

I'll defer to Greg for the nommu and Coldfire parts...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
