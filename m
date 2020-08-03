Return-Path: <SRS0=9X71=BN=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C37CCC433DF
	for <linux-m68k@archiver.kernel.org>; Mon,  3 Aug 2020 18:19:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4D70720792
	for <linux-m68k@archiver.kernel.org>; Mon,  3 Aug 2020 18:19:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=timesys-com.20150623.gappssmtp.com header.i=@timesys-com.20150623.gappssmtp.com header.b="TcE545nB"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728606AbgHCSTq (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 3 Aug 2020 14:19:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728605AbgHCSTq (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Mon, 3 Aug 2020 14:19:46 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 362EBC06174A
        for <linux-m68k@vger.kernel.org>; Mon,  3 Aug 2020 11:19:46 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id x5so440580wmi.2
        for <linux-m68k@vger.kernel.org>; Mon, 03 Aug 2020 11:19:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=timesys-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ffxdrbkr+RiaMgHj33hRldmIx/P3RYuPKtgFFd38ke8=;
        b=TcE545nBvpH/dW8huTD7WaZC7UIn8PadU0dyeykxZoTrvNQ4Qq4O794cQULk1oqw6R
         BPE8/RTssO76TdPNsdaSOdg9+1QYLSWyLGBCu3yN/nO8+tvfXKoy7/EkokqtFza2GdVd
         Z45lIGnwdNTjJncQdtwg2vqj5i3K6u/u1oJigO6/61i6iCwqMBanEBhSjlFwAYBN8xGT
         mFChH30gvvs1SLQ91k7yn3nYkpoojETc8dbBB/FnO5ruJOwHY9aCEqdTAivhYQmbAkOA
         u8fnkpIDmS+QXlJXHCuPCnecoxsisz+pcFmqsuX2TlwMFzhbMGN8TI7wiHOm87XChyKi
         KS+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ffxdrbkr+RiaMgHj33hRldmIx/P3RYuPKtgFFd38ke8=;
        b=eVClaKzrX6J8eDByQiTapAIiau4IQgUL3RrnxKmWS9BfIolnsT4DBwRMcbCeEZKemf
         7j/fVprSy2yKJEyA6ua3Zl8M/YpxOWl1n/KJigQunpUOaudw1kRAD3y5/OaI1MUscvzW
         RSe9rN/RvrSegfwHzF2muTEFpTPKW72zzZTelE3OAzL0ZNlzOOliS2N99yw9V+F420R0
         PCPtdIlpVNaAW8vtAgs8Lf8tIgogCBA+x2XbpcBA9kLh7c+RLIZbEmaDxksccybqBuCZ
         SjfmlYG8msiTjTz2cRaxBmMTXmycNz+ygwny4kGjGtbkNKz8+ZQY8TSuCn+qHpWqmu9U
         Hkrg==
X-Gm-Message-State: AOAM530FHLQC169Ddk/3JefXyHoppq9cNfxXatbKMfr5LzNYG/wY/qNz
        3t/bm2p+yjZadiJbhXGF+ti1Qw==
X-Google-Smtp-Source: ABdhPJyzHDA+J7+pdXvKqm/XeNYOdf0ys8WAi9NBzfDU06YGXZihBbXlrtTiV4f+yAfu6C0uGgVYxQ==
X-Received: by 2002:a1c:7313:: with SMTP id d19mr374703wmb.147.1596478784962;
        Mon, 03 Aug 2020 11:19:44 -0700 (PDT)
Received: from localhost.localdomain (host-79-41-237-247.retail.telecomitalia.it. [79.41.237.247])
        by smtp.gmail.com with ESMTPSA id z8sm648822wmf.10.2020.08.03.11.19.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2020 11:19:44 -0700 (PDT)
From:   Angelo Dureghello <angelo.dureghello@timesys.com>
To:     gerg@linux-m68k.org
Cc:     linux-m68k@vger.kernel.org,
        Angelo Dureghello <angelo.dureghello@timesys.com>
Subject: [PATCH] m68k: stmark2: enable edma support for dspi
Date:   Mon,  3 Aug 2020 20:28:03 +0200
Message-Id: <20200803182803.193998-1-angelo.dureghello@timesys.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Enable dspi edma support for stmark2.

Signed-off-by: Angelo Dureghello <angelo.dureghello@timesys.com>
---
 arch/m68k/coldfire/stmark2.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/m68k/coldfire/stmark2.c b/arch/m68k/coldfire/stmark2.c
index a8d2b3d172f9..8b5af9c83244 100644
--- a/arch/m68k/coldfire/stmark2.c
+++ b/arch/m68k/coldfire/stmark2.c
@@ -13,6 +13,7 @@
 #include <linux/spi/spi.h>
 #include <linux/spi/spi-fsl-dspi.h>
 #include <linux/spi/flash.h>
+#include <linux/dma-mapping.h>
 #include <asm/mcfsim.h>
 
 /*
@@ -78,6 +79,8 @@ static struct resource dspi_spi0_resource[] = {
 	},
 };
 
+static u64 stmark2_dspi_mask = DMA_BIT_MASK(32);
+
 /* SPI controller, id = bus number */
 static struct platform_device dspi_spi0_device = {
 	.name = "fsl-dspi",
@@ -86,6 +89,8 @@ static struct platform_device dspi_spi0_device = {
 	.resource = dspi_spi0_resource,
 	.dev = {
 		.platform_data = &dspi_spi0_info,
+		.dma_mask = &stmark2_dspi_mask,
+		.coherent_dma_mask = DMA_BIT_MASK(32),
 	},
 };
 
-- 
2.28.0

