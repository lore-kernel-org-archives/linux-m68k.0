Return-Path: <SRS0=rKVK=AN=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 935F1C433DF
	for <linux-m68k@archiver.kernel.org>; Thu,  2 Jul 2020 23:46:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 679DC20760
	for <linux-m68k@archiver.kernel.org>; Thu,  2 Jul 2020 23:46:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=timesys-com.20150623.gappssmtp.com header.i=@timesys-com.20150623.gappssmtp.com header.b="UYHFRsO6"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726015AbgGBXqn (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 2 Jul 2020 19:46:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725937AbgGBXqn (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Thu, 2 Jul 2020 19:46:43 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B831C08C5C1
        for <linux-m68k@vger.kernel.org>; Thu,  2 Jul 2020 16:46:41 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id lx13so13213762ejb.4
        for <linux-m68k@vger.kernel.org>; Thu, 02 Jul 2020 16:46:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=timesys-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/OAWiYKGjBZ85C1fp+UQuN3Js+cOObRiIx/SUwvASJA=;
        b=UYHFRsO619BPJ359ZwE+8ldQY80DX41TN2ldJdYKdt0+fLFSMgreuEuUeYHyqDxynj
         j8WxpHXo/3uqeRVCH+XS7wh+BQDocIB7DDYbc/nlDzg+W8j2Kn4tlxsgNAz1CzKNS6bE
         E1Y7h9xOxLyxWPHEV2fq6Q/VUvncH1xV9PFiVdwP7F10Ht60bdoZ3B5NCiuJTSSiS5Lk
         mhDVBmEnaKFeve6NW1fS8spUyb/adT3gwNYEEGdoNBDQujkR+3y2VxbsrqBu/NW1XrDu
         vx6QLfBGweYgM1JziJjP6kH8Nv2kzNOQkUda5AyfDbz+NDQHmf6fRrf5+sds7CWXIZ18
         LPCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/OAWiYKGjBZ85C1fp+UQuN3Js+cOObRiIx/SUwvASJA=;
        b=nchoXDe+vm3AZWqNdur2Nmx9QZDr7YJkxDv36Nj3ydAwweHqVfDZjcsXBxfe3A7ig5
         K0lAXt/zqKkaLRfnGrC1xsllFfbRDduOwxttM7jcyqWGaeJhBC4rQ468TrRsWOoP7ea3
         kRmwBz4Y07UWc66VVqkADtj1/N4RT7une20iVubBXo5775rvMjwZa4JYT5dh501a3xya
         lcT0Y76m/tKNLTrMZpeXifGhkbtYf7OcOhbtG7383w1OJ/tQQy89P2BJsJNokesQtC+R
         uGpNRTQRjDC1ujVS952LqZcsRWryGyduznGw95Aa8gMTsfP2QTrz2Hj1rHOM4yvo6oT3
         9RLw==
X-Gm-Message-State: AOAM532BHid7cGOVQU4sKFMs8oa1mzWRhc8WHKwazpFgwkMQT+5k8SEv
        QGTnqkI2kDmGdz7L1HyPeznpWIIo7RmcGQ==
X-Google-Smtp-Source: ABdhPJwggjPc9hGXbkWZpS2CMCyFPPAUYPsTpD5rDuGuwuAZwSifBXo8SNhExNVxfPtdK5to3eGgrQ==
X-Received: by 2002:a17:906:2b12:: with SMTP id a18mr29293217ejg.186.1593733600190;
        Thu, 02 Jul 2020 16:46:40 -0700 (PDT)
Received: from localhost.localdomain (host-79-30-36-203.retail.telecomitalia.it. [79.30.36.203])
        by smtp.gmail.com with ESMTPSA id h10sm7001962edz.31.2020.07.02.16.46.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2020 16:46:39 -0700 (PDT)
From:   Angelo Dureghello <angelo.dureghello@timesys.com>
To:     gerg@linux-m68k.org
Cc:     linux-m68k@vger.kernel.org,
        Angelo Dureghello <angelo.dureghello@timesys.com>
Subject: [PATCH] m68k: stmark2: enable edma support for dspi
Date:   Fri,  3 Jul 2020 01:53:38 +0200
Message-Id: <20200702235338.3653602-1-angelo.dureghello@timesys.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Enable edma support for stmark2.

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
2.26.2

