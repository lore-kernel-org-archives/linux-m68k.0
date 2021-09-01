Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E2C2C432BE
	for <linux-m68k@archiver.kernel.org>; Wed,  1 Sep 2021 21:18:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3105261027
	for <linux-m68k@archiver.kernel.org>; Wed,  1 Sep 2021 21:18:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344473AbhIAVTU (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 1 Sep 2021 17:19:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243816AbhIAVTM (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Wed, 1 Sep 2021 17:19:12 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBEAAC061757
        for <linux-m68k@vger.kernel.org>; Wed,  1 Sep 2021 14:18:14 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id q3so929928edt.5
        for <linux-m68k@vger.kernel.org>; Wed, 01 Sep 2021 14:18:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=timesys-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nsj7VKNm1/45GUu+7ej+X+gh2q1WwYaSbQDEwk9lCrQ=;
        b=X7NoMvSyhPNax/+H6N/fuzKn9S68KQKw9FT2w9mog1ZOSsWtL1MBOIwjeGvboX6DEN
         zWKLMzNoK6s4Y18m0YRUAlFvib+rc1RJg4IpfcZqL9+xN6Iv4RoWuWJsRR/2folNjREL
         f48SeAMI3afeu6ZmR/6sXf+x7g01iiYZqJjXNKHzOvyaBDe5pS2a595auEb3P7JqmWYb
         3v+tlJ9pklEMv4HloGoeoNRPeZ4lIkgkGxDGrHJXYkoXWKYcq1QYeG79Baj9kOFlr4Jt
         DJ4e0ABMP57KxQzTrGwx9gK3G8GsVNTe/LR9g9rkeGRBi+9G7BTsFDzoEYZSX/fdwYjH
         ORJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nsj7VKNm1/45GUu+7ej+X+gh2q1WwYaSbQDEwk9lCrQ=;
        b=MyMssV3HBR4VJ8Ad+f8u/oTxD5YwNLjGkgYrwbII0x1TDH19wTl2i0krOv0QzXihPt
         sbGXdrqXH6ZIVxPWETm2GeecgW98yFyQg33KKHmL0rrJ3lNGiGzrd39rYEVqLGYpjiw1
         l1/xqlkiIcgdnXelItfPdv40TiObx5IjuwAShIjzXhcGyYfFUI2plv4ahB1xI9zMHqMy
         621l9RuWljulaWKfaFyfKKXmii8q/27AX+HJ4+HK8WytzV6Yu/bLgDhOd9NeaRWIaUJQ
         XEPQKM5lWkua5pWVZkB7lyyVButjeMREgsoIRrh31S91vXxaQCmTNIGCVh5ANXmBsq9Z
         7ulA==
X-Gm-Message-State: AOAM530HETf5dnlLGOrrV0LypEFIANEGhy+IBu7JOWo6eGsh7h5NOL9q
        UDr4bagLDlUln0waSHYy37hcUA==
X-Google-Smtp-Source: ABdhPJyrNU0a5bN91zXXF+UzBB8yapuMNUdvNSLwLCCaO2tpGRw71zpDSUwVAF0L/ssLICsj+yPOGQ==
X-Received: by 2002:a50:ab42:: with SMTP id t2mr1630804edc.113.1630531093249;
        Wed, 01 Sep 2021 14:18:13 -0700 (PDT)
Received: from dfj.1.1.1.1 (host-87-5-14-18.retail.telecomitalia.it. [87.5.14.18])
        by smtp.gmail.com with ESMTPSA id n13sm389406edq.91.2021.09.01.14.18.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Sep 2021 14:18:12 -0700 (PDT)
From:   Angelo Dureghello <angelo.dureghello@timesys.com>
To:     vinod.koul@linaro.org
Cc:     dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-m68k@vger.kernel.org,
        Angelo Dureghello <angelo.dureghello@timesys.com>
Subject: [PATCH] dmaengine: fsl-edma: fix for missing dmamux module
Date:   Wed,  1 Sep 2021 23:16:10 +0200
Message-Id: <20210901211610.662077-1-angelo.dureghello@timesys.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Fix following panic on system halt:

Requesting system halt
[   10.600000] spi spi0.1: spi_device 0.1 cleanup
[   10.630000] fsl_edma_chan_mux() fsl_chan->edma->n_chans 64 dmamux_nr 0
[   10.630000] *** ZERO DIVIDE ***   FORMAT=4
[   10.630000] Current process id is 38
[   10.630000] BAD KERNEL TRAP: 00000000
[   10.630000] PC: [<402f09ba>] fsl_edma_chan_mux+0x7c/0x12e
...

Some architecture as mcf5441x (ColdFire) may not have
a dmamux, so dmamux_nr is set to 0. This patch considers this case.

Signed-off-by: Angelo Dureghello <angelo.dureghello@timesys.com>
---
 drivers/dma/fsl-edma-common.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/fsl-edma-common.c b/drivers/dma/fsl-edma-common.c
index 930ae268c497..009c75ff1320 100644
--- a/drivers/dma/fsl-edma-common.c
+++ b/drivers/dma/fsl-edma-common.c
@@ -638,12 +638,14 @@ EXPORT_SYMBOL_GPL(fsl_edma_alloc_chan_resources);
 void fsl_edma_free_chan_resources(struct dma_chan *chan)
 {
 	struct fsl_edma_chan *fsl_chan = to_fsl_edma_chan(chan);
+	struct fsl_edma_engine *edma = fsl_chan->edma;
 	unsigned long flags;
 	LIST_HEAD(head);
 
 	spin_lock_irqsave(&fsl_chan->vchan.lock, flags);
 	fsl_edma_disable_request(fsl_chan);
-	fsl_edma_chan_mux(fsl_chan, 0, false);
+	if (edma->drvdata->dmamuxs)
+		fsl_edma_chan_mux(fsl_chan, 0, false);
 	fsl_chan->edesc = NULL;
 	vchan_get_all_descriptors(&fsl_chan->vchan, &head);
 	fsl_edma_unprep_slave_dma(fsl_chan);
-- 
2.32.0

