Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61733CDB474
	for <linux-m68k@archiver.kernel.org>; Mon, 23 Oct 2023 05:50:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229458AbjJWFuy (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 23 Oct 2023 01:50:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229450AbjJWFux (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 23 Oct 2023 01:50:53 -0400
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFE15FC
        for <linux-m68k@lists.linux-m68k.org>; Sun, 22 Oct 2023 22:50:51 -0700 (PDT)
Received: by verein.lst.de (Postfix, from userid 2407)
        id 6B12A68AA6; Mon, 23 Oct 2023 07:50:48 +0200 (CEST)
Date:   Mon, 23 Oct 2023 07:50:48 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Christoph Hellwig <hch@lst.de>, Greg Ungerer <gerg@linux-m68k.org>,
        iommu@lists.linux.dev, Robin Murphy <robin.murphy@arm.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Wei Fang <wei.fang@nxp.com>,
        Shenwei Wang <shenwei.wang@nxp.com>,
        Clark Wang <xiaoning.wang@nxp.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-m68k@lists.linux-m68k.org, netdev@vger.kernel.org,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 1/8] dma-direct: add depdenencies to
 CONFIG_DMA_GLOBAL_POOL
Message-ID: <20231023055048.GA11374@lst.de>
References: <20231020054024.78295-1-hch@lst.de> <20231020054024.78295-2-hch@lst.de> <CAMuHMdVNmbMsqBF3gozT7yqUVJZ+9Eg2wjTuQF+1W4jKXdAZVQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdVNmbMsqBF3gozT7yqUVJZ+9Eg2wjTuQF+1W4jKXdAZVQ@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Fri, Oct 20, 2023 at 09:18:32AM +0200, Geert Uytterhoeven wrote:
> s/depdenencies/dependencies/
> 
> On Fri, Oct 20, 2023 at 7:40 AM Christoph Hellwig <hch@lst.de> wrote:
> > CONFIG_DMA_GLOBAL_POOL can't be combined with other DMA coherent
> > allocators.  Add dependencies to Kconfig to document this, and make
> > kconfig complain about unment dependencies if someone tries.
> 
> unmet

Thanks, I've fixed this up, and also removed the line selecting
ARCH_USE_DMA_ALLOC which snuk back into the second to last patch
after the last rebase and applied the whole series to the dma-mapping
tree now.

The RISC-V dependency fixes still haven't made it to the SOC tree, so
you will see dependency warnings in linux-next until that gets fixed.
