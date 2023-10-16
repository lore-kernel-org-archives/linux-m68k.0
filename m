Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBF74CDB465
	for <linux-m68k@archiver.kernel.org>; Mon, 16 Oct 2023 13:17:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233219AbjJPNRX (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 16 Oct 2023 09:17:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233438AbjJPNRW (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 16 Oct 2023 09:17:22 -0400
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBBBBE6
        for <linux-m68k@lists.linux-m68k.org>; Mon, 16 Oct 2023 06:17:20 -0700 (PDT)
Received: by verein.lst.de (Postfix, from userid 2407)
        id CD1D16732D; Mon, 16 Oct 2023 15:17:16 +0200 (CEST)
Date:   Mon, 16 Oct 2023 15:17:16 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Conor Dooley <conor.dooley@microchip.com>
Cc:     Christoph Hellwig <hch@lst.de>, Greg Ungerer <gerg@linux-m68k.org>,
        iommu@lists.linux.dev, Paul Walmsley <paul.walmsley@sifive.com>,
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
Subject: Re: [PATCH 01/12] riscv: RISCV_NONSTANDARD_CACHE_OPS shouldn't
 depend on RISCV_DMA_NONCOHERENT
Message-ID: <20231016131716.GA26484@lst.de>
References: <20231016054755.915155-1-hch@lst.de> <20231016054755.915155-2-hch@lst.de> <20231016-walmart-egomaniac-dc4c63ea70a6@wendy>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231016-walmart-egomaniac-dc4c63ea70a6@wendy>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Mon, Oct 16, 2023 at 01:49:41PM +0100, Conor Dooley wrote:
> Hey,
> 
> On Mon, Oct 16, 2023 at 07:47:43AM +0200, Christoph Hellwig wrote:
> > RISCV_NONSTANDARD_CACHE_OPS is also used for the pmem cache maintenance
> > helpers, which are built into the kernel unconditionally.
> 
> You surely have better insight than I do here, but is this actually
> required?
> This patch seems to allow creation of a kernel where the cache
> maintenance operations could be used for pmem, but would be otherwise
> unavailable, which seems counter intuitive to me.
>
> Why would someone want to provide the pmem helpers with cache
> maintenance operations, but not provide them generally?
> 

Even if all your periphals are cache coherent (very common on server
class hardware) you still need cache maintenance for pmem.  No need
to force the extra text size and runtime overhead for non-coherent DMA.

> I also don't really understand what the unconditional nature of the pmem
> helpers has to do with anything, as this patch does not unconditionally
> provide any cache management operations, only relax the conditions under
> which the non-standard cache management operations can be provided.

They simply were broken if a platform had non-standard cache mem but
only coherent DMA before.  That's probably more a theoretical than
practial case, but still worth fixing.
