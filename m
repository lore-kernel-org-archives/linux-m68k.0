Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50BEFCDB47E
	for <linux-m68k@archiver.kernel.org>; Fri, 20 Oct 2023 05:40:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235599AbjJTFk6 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 20 Oct 2023 01:40:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235613AbjJTFky (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 20 Oct 2023 01:40:54 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82B06119;
        Thu, 19 Oct 2023 22:40:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
        :Reply-To:Content-Type:Content-ID:Content-Description;
        bh=f5GWYBu+PKHamukWGpCOB6Gbm7bgNIpCSyr7dKv6+1g=; b=PhVT2nkgy3+lbP4vZOcgWvTN5i
        tJfiJf+9gc29uHUK19jyfDU3Xg/YhyElCyWF915/BUMNphCm4MBDQ5ORVCa5APGSGjtb94U0Wa+L6
        2t1JF97CPcG0ScFGSbOf1pFKTUY7vFicIHB/nlc61p15LAaDhHcEYq0DrQRq23GZaOPCYSuPQVvXE
        tvc2ofhIT+mO9AyImjq2M4ZevNiQHxV1DeKbHeppki+6SkgIwxARtFjv4RI3qrQHBiMGyVRAdTM+t
        T2lHLAgWm+ADw2gWSnm5Dhyk7OJ9uO3yXrr9kFdqmH7ctFyxm8aWdCAQFfRYnogBWXKeIKEraPJBU
        mdd4MR9g==;
Received: from 2a02-8389-2341-5b80-39d3-4735-9a3c-88d8.cable.dynamic.v6.surfer.at ([2a02:8389:2341:5b80:39d3:4735:9a3c:88d8] helo=localhost)
        by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
        id 1qtiFb-001GmL-0X;
        Fri, 20 Oct 2023 05:40:47 +0000
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
Subject: [PATCH 8/8] m68k: remove unused includes from dma.c
Date:   Fri, 20 Oct 2023 07:40:24 +0200
Message-Id: <20231020054024.78295-9-hch@lst.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231020054024.78295-1-hch@lst.de>
References: <20231020054024.78295-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

dma.c doesn't need most of the headers it includes.  Also there is
no point in undefining the DEBUG symbol given that it isn't used
anywhere in this small file.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
Reviewed-by: Greg Ungerer <gerg@linux-m68k.org>
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>
Tested-by: Greg Ungerer <gerg@linux-m68k.org>
---
 arch/m68k/kernel/dma.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/arch/m68k/kernel/dma.c b/arch/m68k/kernel/dma.c
index eef63d032abb53..16063783aa80c6 100644
--- a/arch/m68k/kernel/dma.c
+++ b/arch/m68k/kernel/dma.c
@@ -4,17 +4,8 @@
  * for more details.
  */
 
-#undef DEBUG
-
 #include <linux/dma-map-ops.h>
-#include <linux/device.h>
 #include <linux/kernel.h>
-#include <linux/platform_device.h>
-#include <linux/scatterlist.h>
-#include <linux/slab.h>
-#include <linux/vmalloc.h>
-#include <linux/export.h>
-
 #include <asm/cacheflush.h>
 
 #ifndef CONFIG_COLDFIRE
-- 
2.39.2

