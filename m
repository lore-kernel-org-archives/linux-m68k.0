Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B5D0E95A8E
	for <linux-m68k@archiver.kernel.org>; Mon,  9 Oct 2023 09:51:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345608AbjJIJvm convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 9 Oct 2023 05:51:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345880AbjJIJvl (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 9 Oct 2023 05:51:41 -0400
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83811BA
        for <linux-m68k@lists.linux-m68k.org>; Mon,  9 Oct 2023 02:51:40 -0700 (PDT)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-579de633419so53145987b3.3
        for <linux-m68k@lists.linux-m68k.org>; Mon, 09 Oct 2023 02:51:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696845099; x=1697449899;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EcpLpgd1f1+Ipojmn8r+iB3J9d+aLm5CFxyQ8kyrL4E=;
        b=o0fVJcGAzu60FVoNssDzOJ47zodGC1F6Ssg1wA4r+G68JlycBZTb4uRnlPImsQ/Dt4
         G3VG/NHFagYWyA0n/SQk27BP3PqLT/inF5fKdmIcjikB8sB9fzj2NvrI9OxuXqR/oSvy
         833erWrG2JdRSvNAs8VrtXtNv7Z6NLJPPu6lgYj6dEu3WeIPVtzapN0iPk2grtnXinLB
         ohaDX7njifkpjbws+Dqc2K4R0+uLOosu1yv/lWlZJi3O7LQ54tO5aFz+tXdQU31IgCvU
         IHbj/2V0muJWiGGsSsGz1xAlZVhQ7VqpdwgBoXaC8p5udBHQ8Y3nJqZOicCagtY0QBxH
         p3gg==
X-Gm-Message-State: AOJu0Yxs8yK2gYGTXLkIDxt8nE2G/2Ecfyw97aWc73cjC1ry14RBztHI
        rlZusxpcke8qHodE/30d/vK+Do3RRN7DxA==
X-Google-Smtp-Source: AGHT+IEmF1QgSpJpOMgw+wc0dwfpz6Y21P8+hizfMlTPg0smaBz6wxDfEpo8Iubj519NQVx7CBk2xA==
X-Received: by 2002:a81:4811:0:b0:5a1:eec1:b42e with SMTP id v17-20020a814811000000b005a1eec1b42emr15259428ywa.0.1696845099553;
        Mon, 09 Oct 2023 02:51:39 -0700 (PDT)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com. [209.85.219.176])
        by smtp.gmail.com with ESMTPSA id b126-20020a0dc084000000b0059935151fa1sm3573968ywd.126.2023.10.09.02.51.38
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Oct 2023 02:51:38 -0700 (PDT)
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-d84c24a810dso4783274276.2
        for <linux-m68k@lists.linux-m68k.org>; Mon, 09 Oct 2023 02:51:38 -0700 (PDT)
X-Received: by 2002:a25:18c1:0:b0:d81:61fd:ef5d with SMTP id
 184-20020a2518c1000000b00d8161fdef5dmr11643273yby.27.1696845098183; Mon, 09
 Oct 2023 02:51:38 -0700 (PDT)
MIME-Version: 1.0
References: <20231009074121.219686-1-hch@lst.de> <20231009074121.219686-2-hch@lst.de>
 <CAMuHMdWiYDQ5J7R7hPaVAYgXqJvpjdksoF6X-zHrJ_80Ly4XfQ@mail.gmail.com>
 <20231009091625.GB22463@lst.de> <CAMuHMdUZNewD-QC8J7MWSBP197Vc169meOjjK6=b7M11kVjUzg@mail.gmail.com>
 <20231009094330.GA24836@lst.de>
In-Reply-To: <20231009094330.GA24836@lst.de>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 9 Oct 2023 11:51:25 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV2FXdUHtjYW8JyXGBgHhR8De0vp3Ee77e6G8Vbs3gG8Q@mail.gmail.com>
Message-ID: <CAMuHMdV2FXdUHtjYW8JyXGBgHhR8De0vp3Ee77e6G8Vbs3gG8Q@mail.gmail.com>
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
        "Lad, Prabhakar" <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        arm-soc <soc@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Christoph,

CC soc

On Mon, Oct 9, 2023 at 11:43 AM Christoph Hellwig <hch@lst.de> wrote:
> On Mon, Oct 09, 2023 at 11:34:55AM +0200, Geert Uytterhoeven wrote:
> > The fix you are referring too is probably commit c1ec4b450ab729e3
> > ("soc: renesas: Make ARCH_R9A07G043 (riscv version) depend
> > on NONPORTABLE") in next-20231006 and later.  It is not yet upstream.
> >
> > Still, it merely makes ARCH_R9A07G043 (which selects DMA_GLOBAL_POOL)
> > depend on ARCH_R9A07G043.
> > RISCV_DMA_NONCOHERENT still selects DMA_DIRECT_REMAP, so both can end
> > up being enabled.
>
> Ok, so we need to actually fix this properly.  Lad, can you respin
> the fix to not select DMA_DIRECT_REMAP, for ARCH_R9A07G043?

ARCH_R9A07G043 does not select DMA_DIRECT_REMAP directly,
RISCV_DMA_NONCOHERENT does.  And there are other users of
RISCV_DMA_NONCOHERENT (RISCV_ISA_ZICBOM and ERRATA_THEAD_CMO).
Should the selection of DMA_DIRECT_REMAP moved to their users?

Note that the fix is already in soc/for-next, so we need coordination
with the soc people.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
