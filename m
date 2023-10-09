Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70F41E95A91
	for <linux-m68k@archiver.kernel.org>; Mon,  9 Oct 2023 09:15:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345671AbjJIJPZ (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 9 Oct 2023 05:15:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345651AbjJIJPX (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 9 Oct 2023 05:15:23 -0400
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7B31DB
        for <linux-m68k@lists.linux-m68k.org>; Mon,  9 Oct 2023 02:15:21 -0700 (PDT)
Received: by verein.lst.de (Postfix, from userid 2407)
        id 6FF0568CFE; Mon,  9 Oct 2023 11:15:15 +0200 (CEST)
Date:   Mon, 9 Oct 2023 11:15:14 +0200
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
        Greg Ungerer <gerg@linux-m68k.org>
Subject: Re: fix the non-coherent coldfire dma_alloc_coherent
Message-ID: <20231009091514.GA22463@lst.de>
References: <20231009074121.219686-1-hch@lst.de> <CAMuHMdU281a+=9SApaCRy5os3k73HGZhQ=Fsv58OD4C430iDDg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdU281a+=9SApaCRy5os3k73HGZhQ=Fsv58OD4C430iDDg@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Mon, Oct 09, 2023 at 10:39:18AM +0200, Geert Uytterhoeven wrote:
> CC Greg

Ooops.  I was pretty sure I added him as he is one of the most
relevant persons for this.  Sorry.

