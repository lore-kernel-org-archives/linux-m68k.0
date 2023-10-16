Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B975FCDB465
	for <linux-m68k@archiver.kernel.org>; Mon, 16 Oct 2023 13:17:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233328AbjJPNRv (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 16 Oct 2023 09:17:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231896AbjJPNRu (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 16 Oct 2023 09:17:50 -0400
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40008E8
        for <linux-m68k@lists.linux-m68k.org>; Mon, 16 Oct 2023 06:17:48 -0700 (PDT)
Received: by verein.lst.de (Postfix, from userid 2407)
        id 9503B6732D; Mon, 16 Oct 2023 15:17:45 +0200 (CEST)
Date:   Mon, 16 Oct 2023 15:17:45 +0200
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
Subject: Re: [PATCH 04/12] soc: renesas: select RISCV_DMA_NONCOHERENT from
 ARCH_R9A07G043
Message-ID: <20231016131745.GB26484@lst.de>
References: <20231016054755.915155-1-hch@lst.de> <20231016054755.915155-5-hch@lst.de> <20231016-pantyhose-tall-7565b6b20fb9@wendy>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231016-pantyhose-tall-7565b6b20fb9@wendy>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Mon, Oct 16, 2023 at 01:52:57PM +0100, Conor Dooley wrote:
> > +	select RISCV_DMA_NONCOHERENT
> >  	select ERRATA_ANDES if RISCV_SBI
> >  	select ERRATA_ANDES_CMO if ERRATA_ANDES
> 
> Since this Kconfig menu has changed a bit in linux-next, the selects
> are unconditional here, and ERRATA_ANDES_CMO will in turn select
> RISCV_DMA_NONCOHERENT.

Oh, looks like another patch landed there in linux-next.  I had
waited for the previous one go go upstream in -rc6.  Not sure
how to best handle this conflict.
