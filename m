Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67BAAE95A8E
	for <linux-m68k@archiver.kernel.org>; Mon,  9 Oct 2023 07:41:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345409AbjJIHli (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 9 Oct 2023 03:41:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345374AbjJIHli (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 9 Oct 2023 03:41:38 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5A538F;
        Mon,  9 Oct 2023 00:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
        Content-ID:Content-Description:In-Reply-To:References;
        bh=dVs40bsganJI+j23T0NRSSkeLhHC7BdXczFaw4B1Wwg=; b=wZgBTFtcaczhjFymv4NkjwlXw9
        PlKvtGMv8uAjjXRZ+1sFJmLZrEcEPZuSYSgf1ahPNCzexvqb24sOV9ZDImwXHBKjz1zScIzcz6fR5
        IAgEiPP2hUIF81q1/U/hI8kcZWaNb0Ypl5cGAZnnZzn34tNmW2aBIgnShhOTfbYaUKrsoP1jopTUE
        TFg1ah66X4bwBWCira8rh41w+izWR8pD8a6nuQ8H6cAle82sQajlYZWST/si3O7nCPX73jiKxHzwJ
        h5mEwS8JAWmHvaeVzlFqZFp8qcEHHCbMbSIqIiyFXe8ArWZwN9116oXhdE1fNf6v+y0X7TFWZumCx
        MsFkft+g==;
Received: from [2001:4bb8:182:6657:e5a9:584c:4324:b228] (helo=localhost)
        by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
        id 1qpktK-009uhV-1f;
        Mon, 09 Oct 2023 07:41:27 +0000
From:   Christoph Hellwig <hch@lst.de>
To:     iommu@lists.linux.dev
Cc:     Robin Murphy <robin.murphy@arm.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Wei Fang <wei.fang@nxp.com>,
        Shenwei Wang <shenwei.wang@nxp.com>,
        Clark Wang <xiaoning.wang@nxp.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-m68k@lists.linux-m68k.org, netdev@vger.kernel.org,
        Jim Quinlan <james.quinlan@broadcom.com>
Subject: fix the non-coherent coldfire dma_alloc_coherent
Date:   Mon,  9 Oct 2023 09:41:15 +0200
Message-Id: <20231009074121.219686-1-hch@lst.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi all,

this is the next attempt to not return memory that is not DMA coherent
on coldfire/m68knommu.  The last one needed more fixups in the fec
driver, which this versions includes.  On top of that I've also added
a few more cleanups to the core dma allocation code.

Jim: any work to support the set_uncached and remap method for arm32
should probably be based on this, and patch 3 should make that
selection a little easier.

