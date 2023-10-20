Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75416CDB474
	for <linux-m68k@archiver.kernel.org>; Fri, 20 Oct 2023 05:40:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235618AbjJTFkr (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 20 Oct 2023 01:40:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235612AbjJTFkp (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 20 Oct 2023 01:40:45 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F19B71A6;
        Thu, 19 Oct 2023 22:40:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
        :Reply-To:Content-Type:Content-ID:Content-Description;
        bh=uGUMq3zt58sOzb/0N5LZ5NzgBEhuSxdX/cPxwW9JXRI=; b=vsnBxj0GRpw/y986tDSLUuzc1+
        2BNOM6larksbAuiXxzIJMpncQ5M8cFH7fcQu+QWyMTXGxM4D9Jxag7MAw7dwS9zLGI4FFLe/XbNUV
        LgDA5lwZMM2snHxJh1x4gk6Plne0fQnEvY21ev6YC4hwAKov+sMTZsyHbXnyj31voSoHu5/7n+2EB
        FMxapm8DEq59rgw8PeqGYftt8XRgHKd8wVK/wcXtjuJfOTEpKsWgT7ibYpGpzaLeoTSAyCdLkGUZJ
        WViHlnMISEjRme7X0FTa0YyBmzeqCaiFSNzSlsYc4/CWRjZ84mqMxEB/pXm5hWi1orsaps+ERk9Ay
        c1+7vO1A==;
Received: from 2a02-8389-2341-5b80-39d3-4735-9a3c-88d8.cable.dynamic.v6.surfer.at ([2a02:8389:2341:5b80:39d3:4735:9a3c:88d8] helo=localhost)
        by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
        id 1qtiFR-001Gil-1j;
        Fri, 20 Oct 2023 05:40:37 +0000
From:   Christoph Hellwig <hch@lst.de>
To:     Greg Ungerer <gerg@linux-m68k.org>, iommu@lists.linux.dev
Cc:     Robin Murphy <robin.murphy@arm.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Wei Fang <wei.fang@nxp.com>,
        Shenwei Wang <shenwei.wang@nxp.com>,
        Clark Wang <xiaoning.wang@nxp.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-m68k@lists.linux-m68k.org, netdev@vger.kernel.org
Subject: [PATCH 4/8] dma-direct: warn when coherent allocations aren't supported
Date:   Fri, 20 Oct 2023 07:40:20 +0200
Message-Id: <20231020054024.78295-5-hch@lst.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231020054024.78295-1-hch@lst.de>
References: <20231020054024.78295-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Log a warning once when dma_alloc_coherent fails because the platform
does not support coherent allocations at all.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Robin Murphy <robin.murphy@arm.com>
Reviewed-by: Greg Ungerer <gerg@linux-m68k.org>
Tested-by: Greg Ungerer <gerg@linux-m68k.org>
---
 kernel/dma/direct.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
index 9657ef7c055eaa..ed3056eb20b8bd 100644
--- a/kernel/dma/direct.c
+++ b/kernel/dma/direct.c
@@ -240,8 +240,10 @@ void *dma_direct_alloc(struct device *dev, size_t size,
 		 */
 		set_uncached = IS_ENABLED(CONFIG_ARCH_HAS_DMA_SET_UNCACHED);
 		remap = IS_ENABLED(CONFIG_DMA_DIRECT_REMAP);
-		if (!set_uncached && !remap)
+		if (!set_uncached && !remap) {
+			pr_warn_once("coherent DMA allocations not supported on this platform.\n");
 			return NULL;
+		}
 	}
 
 	/*
-- 
2.39.2

