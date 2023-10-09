Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10F40E95A96
	for <linux-m68k@archiver.kernel.org>; Mon,  9 Oct 2023 09:43:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345799AbjJIJnj (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 9 Oct 2023 05:43:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345758AbjJIJni (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 9 Oct 2023 05:43:38 -0400
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3752294
        for <linux-m68k@lists.linux-m68k.org>; Mon,  9 Oct 2023 02:43:36 -0700 (PDT)
Received: by verein.lst.de (Postfix, from userid 2407)
        id 46F1668D0D; Mon,  9 Oct 2023 11:43:31 +0200 (CEST)
Date:   Mon, 9 Oct 2023 11:43:30 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Christoph Hellwig <hch@lst.de>, iommu@lists.linux.dev,
        Robin Murphy <robin.murphy@arm.com>,
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
Subject: Re: [PATCH 1/6] dma-direct: add depdenencies to
 CONFIG_DMA_GLOBAL_POOL
Message-ID: <20231009094330.GA24836@lst.de>
References: <20231009074121.219686-1-hch@lst.de> <20231009074121.219686-2-hch@lst.de> <CAMuHMdWiYDQ5J7R7hPaVAYgXqJvpjdksoF6X-zHrJ_80Ly4XfQ@mail.gmail.com> <20231009091625.GB22463@lst.de> <CAMuHMdUZNewD-QC8J7MWSBP197Vc169meOjjK6=b7M11kVjUzg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdUZNewD-QC8J7MWSBP197Vc169meOjjK6=b7M11kVjUzg@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Mon, Oct 09, 2023 at 11:34:55AM +0200, Geert Uytterhoeven wrote:
> The fix you are referring too is probably commit c1ec4b450ab729e3
> ("soc: renesas: Make ARCH_R9A07G043 (riscv version) depend
> on NONPORTABLE") in next-20231006 and later.  It is not yet upstream.
> 
> Still, it merely makes ARCH_R9A07G043 (which selects DMA_GLOBAL_POOL)
> depend on ARCH_R9A07G043.
> RISCV_DMA_NONCOHERENT still selects DMA_DIRECT_REMAP, so both can end
> up being enabled.

Ok, so we need to actually fix this properly.  Lad, can you respin
the fix to not select DMA_DIRECT_REMAP, for ARCH_R9A07G043?

