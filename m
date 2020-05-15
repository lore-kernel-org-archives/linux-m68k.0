Return-Path: <SRS0=qRXx=65=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 661DDC433E1
	for <linux-m68k@archiver.kernel.org>; Fri, 15 May 2020 22:22:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 47D9620643
	for <linux-m68k@archiver.kernel.org>; Fri, 15 May 2020 22:22:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=timesys-com.20150623.gappssmtp.com header.i=@timesys-com.20150623.gappssmtp.com header.b="OFoUyDgj"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726212AbgEOWWS (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 15 May 2020 18:22:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726238AbgEOWWR (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Fri, 15 May 2020 18:22:17 -0400
Received: from mail-qv1-xf42.google.com (mail-qv1-xf42.google.com [IPv6:2607:f8b0:4864:20::f42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B48F5C05BD09
        for <linux-m68k@vger.kernel.org>; Fri, 15 May 2020 15:22:17 -0700 (PDT)
Received: by mail-qv1-xf42.google.com with SMTP id r3so1924334qve.1
        for <linux-m68k@vger.kernel.org>; Fri, 15 May 2020 15:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=timesys-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ysbj+TSxz+i5FEIJFg2kdr6w2DDzyaoIoJhOuw5oXjg=;
        b=OFoUyDgj2DGut7GqGYQ33jK48yzUeesvDEjSP/5o5fcYZ2IwpsfEDSP4Xkn0b2k1ZQ
         l63Q6IGuD0HEe36H7X9z6js5E8D30TSBq0ilPdaf3Uq4+mCgiyBL0r8q0gYTP3Idxtl9
         JZme9FsiaKQw2sNi/MKrFX/4VgDcfBS4Q+AuhbaM/Z6cZIKVodZ9FOBOLHPV5CemknMV
         9l/kQjqe8hxXvrV0RFMUHvCHwppdaBK/xs1Hj0t4ziaZ0aKg+FTR+fFeeesIf4AF8Zjn
         jw2vyEJEwv7VtXLDf9Z8RG0PNPj4XyyRUN9e8DWxkziwErpBehKT4Lqc95CpxMYjNGuR
         lPVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ysbj+TSxz+i5FEIJFg2kdr6w2DDzyaoIoJhOuw5oXjg=;
        b=ncXrOQOqtXPYIqNI7y1G7n+HWmrysCo2h0z6OTaYDL+LksCNFpE+yyGY/D/jzgLV4z
         IZBgFpzZOH94jYSmWsaSUlMvj1pcFfSnmBBRhH9c8jOdjidI7nhdVUF3yUjdftQlQnav
         dWiW1maRQjVlGp0BH3XsmX9uSBziXr4Jk6mIJs2s7Ovqtl0aMIAlDhGzhNAOqqU0KihW
         +eragxlecaoOYwh9qubUEgjidpKnEEPx/d5kubl0B5rkGnm5OkkRUvbRQF+4DCseMF2c
         zQys16e5yui6cwlPXQA3xoF94k9PV4KO6PX29LOd4w8MsK0oHivqU15SAcRYNYvjz/90
         3xpw==
X-Gm-Message-State: AOAM533Hnz70SzDoe5LKNSycfcISaLx7/2BfiZd9oEwtnNCUNoT65i7H
        w+96a7rxJTVcPacIJJEzuzWHSA==
X-Google-Smtp-Source: ABdhPJwmBUCxAC4uWwYcmZlYIPSK5P29SLQz7Cq6cQK96WiNfwM7RtB5+f8ccRFoAx/nS/CrB7zNcw==
X-Received: by 2002:a05:6214:311:: with SMTP id i17mr5547968qvu.59.1589581336788;
        Fri, 15 May 2020 15:22:16 -0700 (PDT)
Received: from dfj.bfc.timesys.com (host203-36-dynamic.30-79-r.retail.telecomitalia.it. [79.30.36.203])
        by smtp.gmail.com with ESMTPSA id h134sm2607072qke.6.2020.05.15.15.22.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2020 15:22:16 -0700 (PDT)
From:   Angelo Dureghello <angelo.dureghello@timesys.com>
To:     adrian.hunter@intel.com, ulf.hansson@linaro.org,
        gerg@linux-m68k.org
Cc:     linux-mmc@vger.kernel.org, linux-m68k@vger.kernel.org,
        Angelo Dureghello <angelo.dureghello@timesys.com>
Subject: [PATCH v5 2/3] mmc: sdhci: add quirks for be to le byte swapping
Date:   Sat, 16 May 2020 00:27:29 +0200
Message-Id: <20200515222730.967105-2-angelo.dureghello@timesys.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200515222730.967105-1-angelo.dureghello@timesys.com>
References: <20200515222730.967105-1-angelo.dureghello@timesys.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Some controller as the ColdFire eshdc may require an endianness
byte swap, becouse DMA read endianness is not configurable.

Signed-off-by: Angelo Dureghello <angelo.dureghello@timesys.com>
---
Changes for v3:
- add post request callback
Changes for v4:
none
Changes for v5:
- remove useless comment before swapping bounce buffer
- rename pre_dma_transfer to copy_to_bounce_buffer
---
 drivers/mmc/host/sdhci.c | 9 ++++++---
 drivers/mmc/host/sdhci.h | 2 ++
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/mmc/host/sdhci.c b/drivers/mmc/host/sdhci.c
index 3f716466fcfd..b7ba43e3b7c5 100644
--- a/drivers/mmc/host/sdhci.c
+++ b/drivers/mmc/host/sdhci.c
@@ -634,9 +634,12 @@ static int sdhci_pre_dma_transfer(struct sdhci_host *host,
 		}
 		if (mmc_get_dma_dir(data) == DMA_TO_DEVICE) {
 			/* Copy the data to the bounce buffer */
-			sg_copy_to_buffer(data->sg, data->sg_len,
-					  host->bounce_buffer,
-					  length);
+			if (host->ops->copy_to_bounce_buffer) {
+				host->ops->copy_to_bounce_buffer(host, data);
+			} else {
+				sg_copy_to_buffer(data->sg, data->sg_len,
+						  host->bounce_buffer, length);
+			}
 		}
 		/* Switch ownership to the DMA */
 		dma_sync_single_for_device(host->mmc->parent,
diff --git a/drivers/mmc/host/sdhci.h b/drivers/mmc/host/sdhci.h
index 79dffbb731d3..632ea297bb60 100644
--- a/drivers/mmc/host/sdhci.h
+++ b/drivers/mmc/host/sdhci.h
@@ -653,6 +653,8 @@ struct sdhci_ops {
 	void	(*voltage_switch)(struct sdhci_host *host);
 	void	(*adma_write_desc)(struct sdhci_host *host, void **desc,
 				   dma_addr_t addr, int len, unsigned int cmd);
+	void	(*copy_to_bounce_buffer)(struct sdhci_host *host,
+					 struct mmc_data *data);
 	void	(*request_done)(struct sdhci_host *host,
 				struct mmc_request *mrq);
 };
-- 
2.26.2

